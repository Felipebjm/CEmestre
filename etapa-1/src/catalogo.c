#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../include/constantes.h"

#include "../include/catalogo.h"

#include "../include/cJSON.h"

static int cargarHorarios(const char *texto,Grupo *grupo)
{
    const char *posicion = texto;

    grupo->cantidadHorarios = 0;

    while (*posicion != '\0' &&
           grupo->cantidadHorarios < MAX_BLOQUES_HORARIO)
    {
        Horario *horario =
            &grupo->horarios[grupo->cantidadHorarios];

        int horaInicio;
        int minutoInicio;
        int horaFin;
        int minutoFin;

        int leidos = sscanf(
            posicion,
            "%3[A-Z][%d:%d-%d:%d]",
            horario->dia,
            &horaInicio,
            &minutoInicio,
            &horaFin,
            &minutoFin
        );

        if (leidos != 5) {
            return -1;
        }

        horario->horaInicio =
            horaInicio * 100 + minutoInicio;

        horario->horaFin =
            horaFin * 100 + minutoFin;

        grupo->cantidadHorarios++;

        posicion = strchr(posicion, ']');

        if (posicion == NULL) {
            return -1;
        }

        posicion++;

        while (*posicion == ' ') {
            posicion++;
        }
    }

    return 0;
}

static int cargarGrupo(cJSON *objetoGrupo,Grupo *grupo)
{
    cJSON *numeroGrupo;
    cJSON *horario;

    numeroGrupo = cJSON_GetObjectItem(
        objetoGrupo,
        "numero_grupo"
    );

    horario = cJSON_GetObjectItem(
        objetoGrupo,
        "horario"
    );

    if (!cJSON_IsString(numeroGrupo) ||
        !cJSON_IsString(horario))
    {
        return -1;
    }

    
    //Caso de grupo y horario vacio
    
    if (strlen(numeroGrupo->valuestring) == 0 ||
        strlen(horario->valuestring) == 0)
    {
        grupo->numeroGrupo = 0;
        grupo->cantidadHorarios = 0;

        return 0;
    }

    grupo->numeroGrupo =
        atoi(numeroGrupo->valuestring);

    if (cargarHorarios(horario->valuestring, grupo) != 0) {
        return -1;
    }

    return 0;
}

static int cargarCurso(cJSON *objetoCurso,
                       Curso *curso,
                       int semestre)
{
    cJSON *codigo;
    cJSON *nombre;
    cJSON *carreras;
    cJSON *creditos;
    cJSON *requisitos;
    cJSON *correquisitos;
    cJSON *grupos;

    codigo = cJSON_GetObjectItem(objetoCurso, "codigo");
    nombre = cJSON_GetObjectItem(objetoCurso, "nombre");
    carreras = cJSON_GetObjectItem(objetoCurso, "carreras");
    creditos = cJSON_GetObjectItem(objetoCurso, "creditos");
    requisitos = cJSON_GetObjectItem(objetoCurso, "requisitos");
    correquisitos = cJSON_GetObjectItem(objetoCurso, "correquisitos");
    grupos = cJSON_GetObjectItem(objetoCurso, "grupos");

    
    //Verificar campos obligatorios.
     
    if (!cJSON_IsString(codigo) ||
        !cJSON_IsString(nombre) ||
        !cJSON_IsArray(carreras) ||
        !cJSON_IsNumber(creditos) ||
        !cJSON_IsArray(requisitos) ||
        !cJSON_IsArray(correquisitos) ||
        !cJSON_IsArray(grupos))
    {
        return -1;
    }


    
    //Datos básicos
    
    strncpy(
        curso->codigo,
        codigo->valuestring,
        LEN_CODIGO - 1
    );

    curso->codigo[LEN_CODIGO - 1] = '\0';


    strncpy(
        curso->nombre,
        nombre->valuestring,
        LEN_NOMBRE - 1
    );

    curso->nombre[LEN_NOMBRE - 1] = '\0';


    curso->creditos = creditos->valueint;
    curso->semestre = semestre;


    
    //Inicializar contadores
    
    curso->cantidadCarreras = 0;
    curso->cantidadRequisitos = 0;
    curso->cantidadCorrequisitos = 0;
    curso->cantidadGrupos = 0;

    curso->tieneChoque = 0;
    curso->puedeMatricular = 0;


    
    //Carreras
    
    cJSON *item;

    cJSON_ArrayForEach(item, carreras)
    {
        if (curso->cantidadCarreras >= MAX_CARRERAS) {
            break;
        }

        if (!cJSON_IsString(item)) {
            return -1;
        }

        strncpy(
            curso->carreras[curso->cantidadCarreras],
            item->valuestring,
            LEN_CARRERA - 1
        );

        curso->carreras[curso->cantidadCarreras]
                       [LEN_CARRERA - 1] = '\0';

        curso->cantidadCarreras++;
    }


    
    //Requisitos
    
    cJSON_ArrayForEach(item, requisitos)
    {
        if (curso->cantidadRequisitos >= MAX_REQUISITOS) {
            break;
        }

        if (!cJSON_IsString(item)) {
            return -1;
        }

        strncpy(
            curso->requisitos[curso->cantidadRequisitos],
            item->valuestring,
            LEN_CODIGO - 1
        );

        curso->requisitos[curso->cantidadRequisitos]
                       [LEN_CODIGO - 1] = '\0';

        curso->cantidadRequisitos++;
    }


    /*
     * Correquisitos
     */
    cJSON_ArrayForEach(item, correquisitos)
    {
        if (curso->cantidadCorrequisitos >= MAX_CORREQUISITOS) {
            break;
        }

        if (!cJSON_IsString(item)) {
            return -1;
        }

        strncpy(
            curso->correquisitos[curso->cantidadCorrequisitos],
            item->valuestring,
            LEN_CODIGO - 1
        );

        curso->correquisitos[curso->cantidadCorrequisitos]
                       [LEN_CODIGO - 1] = '\0';

        curso->cantidadCorrequisitos++;
    }


    /*
     * Grupos
     */
    cJSON_ArrayForEach(item, grupos)
    {
        if (curso->cantidadGrupos >= MAX_GRUPOS_POR_CURSO) {
            break;
        }

        if (cargarGrupo(
                item,
                &curso->grupos[curso->cantidadGrupos]
            ) != 0)
        {
            return -1;
        }

        curso->cantidadGrupos++;
    }


    return 0;
}

int cargarCatalogo(const char *nombreArchivo,Catalogo *catalogo)
{
    FILE *archivo;
    long tamanio;
    char *contenido;
    cJSON *raiz;
    cJSON *planEstudios;
    cJSON *semestreJSON;
    cJSON *cursosJSON;
    cJSON *cursoJSON;

    catalogo->cantidadCursos = 0;


    /*
     * Abrir archivo
     */
    archivo = fopen(nombreArchivo, "rb");

    if (archivo == NULL) {
        fprintf(stderr,
                "Error: no se pudo abrir %s\n",
                nombreArchivo);

        return -1;
    }


    /*
     * Obtener tamaño del archivo
     */
    fseek(archivo, 0, SEEK_END);

    tamanio = ftell(archivo);

    if (tamanio < 0) {
        fclose(archivo);
        return -1;
    }

    rewind(archivo);


    /*
     * Reservar memoria para el contenido
     */
    contenido = malloc((size_t)tamanio + 1);

    if (contenido == NULL) {
        fclose(archivo);

        fprintf(stderr,
                "Error: no se pudo reservar memoria.\n");

        return -1;
    }


    /*
     * Leer archivo completo
     */
    size_t bytesLeidos = fread(
        contenido,
        1,
        (size_t)tamanio,
        archivo
    );

    contenido[bytesLeidos] = '\0';

    fclose(archivo);


    /*
     * Convertir texto a objeto JSON
     */
    raiz = cJSON_Parse(contenido);

    free(contenido);

    if (raiz == NULL) {

        fprintf(stderr,
                "Error: el catalogo no contiene JSON valido.\n");

        return -1;
    }


    /*
     * Buscar "plan_estudios"
     */
    planEstudios = cJSON_GetObjectItem(
        raiz,
        "plan_estudios"
    );

    if (!cJSON_IsArray(planEstudios)) {

        fprintf(stderr,
                "Error: no existe un arreglo " "\"plan_estudios\" valido.\n");

        cJSON_Delete(raiz);

        return -1;
    }


    /*
     * Recorrer semestres
     */
    cJSON_ArrayForEach(semestreJSON, planEstudios)
    {
        cJSON *numeroSemestre;
        int semestre;

        numeroSemestre = cJSON_GetObjectItem(
            semestreJSON,
            "semestre"
        );

        cursosJSON = cJSON_GetObjectItem(
            semestreJSON,
            "cursos"
        );

        if (!cJSON_IsNumber(numeroSemestre) ||
            !cJSON_IsArray(cursosJSON))
        {
            fprintf(stderr,
                    "Advertencia: semestre invalido. ");

            continue;
        }

        semestre = numeroSemestre->valueint;


        
        //Recorrer cursos del semestre
         
        cJSON_ArrayForEach(cursoJSON, cursosJSON)
        {
            if (catalogo->cantidadCursos >= MAX_CURSOS) {

                fprintf(stderr,
                        "Advertencia: se alcanzo MAX_CURSOS. ");

                break;
            }


            if (cargarCurso(
                    cursoJSON,
                    &catalogo->cursos[
                        catalogo->cantidadCursos
                    ],
                    semestre
                ) != 0)
            {
                fprintf(stderr,
                        "Advertencia: no se pudo cargar "
                        "un curso del semestre %d.\n",
                        semestre);

                continue;
            }

            catalogo->cantidadCursos++;
        }
    }

    cJSON_Delete(raiz);

    return 0;
}