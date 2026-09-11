#include <stdio.h>
#include <stdlib.h>

#include "../include/constantes.h"
#include "../include/structs.h"
#include "../include/catalogo.h"

int main() {
    Catalogo catalogo;
    
    // Usamos la constante que apunta al JSON de entrada
    const char *rutaCatalogo = ARCHIVO_CATALOGO_ENTRADA;

    printf("=========================================\n");
    printf("   PRUEBA DE CARGA DE CATALOGO JSON      \n");
    printf("=========================================\n\n");

    printf("Intentando abrir archivo desde: %s\n", rutaCatalogo);

    int resultado = cargarCatalogo(rutaCatalogo, &catalogo);

    if (resultado < 0) {
        fprintf(stderr, "\n[ERROR] No se pudo abrir o leer el archivo del catalogo.\n");
        return 1;
    }


    printf("\n>>> Carga exitosa. Cursos leidos: %d <<<\n\n", catalogo.cantidadCursos);

    printf("Lista de cursos cargados:\n");
    printf("--------------------------------------------------------------\n");
    printf("%-5s | %-10s | %-30s | %s\n", "Sem.", "Codigo", "Nombre", "Creditos");
    printf("--------------------------------------------------------------\n");

    for (int i = 0; i < catalogo.cantidadCursos; i++) {
        Curso *c = &catalogo.cursos[i];
        
        // Imprime un resumen en forma de tabla. 
        printf(" %-4d | %-10s | %-30.30s | %-8d\n",
               c->semestre,
               c->codigo,
               c->nombre,
               c->creditos);
    }
    printf("--------------------------------------------------------------\n");

    if (catalogo.cantidadCursos > 0) {
        Curso *primerCurso = &catalogo.cursos[0];
        printf("\n primer curso (%s):\n", primerCurso->codigo);
        
        printf(" - Requisitos (%d):\n", primerCurso->cantidadRequisitos);
        for(int j = 0; j < primerCurso->cantidadRequisitos; j++) {
            printf("   * %s\n", primerCurso->requisitos[j]);
        }
        
        printf(" - Grupos (%d):\n", primerCurso->cantidadGrupos);
        for(int j = 0; j < primerCurso->cantidadGrupos; j++) {
            printf("   * Grupo %d (con %d bloques de horario)\n", 
                   primerCurso->grupos[j].numeroGrupo, 
                   primerCurso->grupos[j].cantidadHorarios);
        }
    }

    printf("\nPrueba finalizada con exito.\n");

    return 0;
}