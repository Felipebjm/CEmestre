#include <stdio.h>
#include <stdlib.h>
#include "../include/exportar.h"
#include "../include/cJSON.h"

static void formatearHora(int horaHHMM, char *destino, size_t tamano) {
    snprintf(destino, tamano, "%02d:%02d", horaHHMM / 100, horaHHMM % 100);
}

static cJSON *serializarGrupo(const Grupo *grupo) {
    cJSON *objetoGrupo = cJSON_CreateObject();
    cJSON *horarios = cJSON_CreateArray();

    cJSON_AddNumberToObject(objetoGrupo, "numeroGrupo", grupo->numeroGrupo);

    for (int i = 0; i < grupo->cantidadHorarios; i++) {
        const Horario *h = &grupo->horarios[i];
        char inicio[6];
        char fin[6];

        formatearHora(h->horaInicio, inicio, sizeof(inicio));
        formatearHora(h->horaFin, fin, sizeof(fin));

        cJSON *bloque = cJSON_CreateObject();
        cJSON_AddStringToObject(bloque, "dia", h->dia);
        cJSON_AddStringToObject(bloque, "inicio", inicio);
        cJSON_AddStringToObject(bloque, "fin", fin);

        cJSON_AddItemToArray(horarios, bloque);
    }

    cJSON_AddItemToObject(objetoGrupo, "horario", horarios);

    return objetoGrupo;
}

static cJSON *serializarCurso(const Curso *curso) {
    cJSON *objetoCurso = cJSON_CreateObject();

    cJSON_AddStringToObject(objetoCurso, "codigo", curso->codigo);
    cJSON_AddStringToObject(objetoCurso, "nombre", curso->nombre);
    cJSON_AddNumberToObject(objetoCurso, "creditos", curso->creditos);
    cJSON_AddNumberToObject(objetoCurso, "semestre", curso->semestre);

    cJSON *carreras = cJSON_CreateArray();
    for (int i = 0; i < curso->cantidadCarreras; i++) {
        cJSON_AddItemToArray(carreras, cJSON_CreateString(curso->carreras[i]));
    }
    cJSON_AddItemToObject(objetoCurso, "carreras", carreras);

    cJSON *grupos = cJSON_CreateArray();
    for (int i = 0; i < curso->cantidadGrupos; i++) {
        cJSON_AddItemToArray(grupos, serializarGrupo(&curso->grupos[i]));
    }
    cJSON_AddItemToObject(objetoCurso, "grupos", grupos);

    cJSON *requisitos = cJSON_CreateArray();
    for (int i = 0; i < curso->cantidadRequisitos; i++) {
        cJSON_AddItemToArray(requisitos, cJSON_CreateString(curso->requisitos[i]));
    }
    cJSON_AddItemToObject(objetoCurso, "requisitos", requisitos);

    cJSON *correquisitos = cJSON_CreateArray();
    for (int i = 0; i < curso->cantidadCorrequisitos; i++) {
        cJSON_AddItemToArray(correquisitos, cJSON_CreateString(curso->correquisitos[i]));
    }
    cJSON_AddItemToObject(objetoCurso, "correquisitos", correquisitos);

    cJSON_AddBoolToObject(objetoCurso, "tieneChoque", curso->tieneChoque);
    cJSON_AddBoolToObject(objetoCurso, "puedeMatricular", curso->puedeMatricular);

    return objetoCurso;
}

int exportarCatalogo(const char *rutaArchivo, const Catalogo *catalogo) {
    cJSON *raiz = cJSON_CreateObject();
    cJSON *cursos = cJSON_CreateArray();

    for (int i = 0; i < catalogo->cantidadCursos; i++) {
        cJSON_AddItemToArray(cursos, serializarCurso(&catalogo->cursos[i]));
    }

    cJSON_AddItemToObject(raiz, "catalogo", cursos);

    char *texto = cJSON_Print(raiz);
    cJSON_Delete(raiz);

    if (texto == NULL) {
        return -1;
    }

    FILE *archivo = fopen(rutaArchivo, "w");
    if (archivo == NULL) {
        cJSON_free(texto);
        return -1;
    }

    fputs(texto, archivo);
    fclose(archivo);
    cJSON_free(texto);

    return 0;
}
