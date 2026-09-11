#include <stdio.h>

#include "../include/constantes.h"
#include "../include/structs.h"
#include "../include/catalogo.h"
#include "../include/historial.h"
#include "../include/horario.h"
#include "../include/requisitos.h"
#include "../include/exportar.h"




int main(int argc, char *argv[])
{
    Catalogo catalogo;
    CursoAprobado historial;

    const char *rutaCatalogoEntrada =
        (argc > 1) ? argv[1] : ARCHIVO_CATALOGO_ENTRADA;

    const char *rutaHistorialEntrada =
        (argc > 2) ? argv[2] : ARCHIVO_HISTORIAL_ENTRADA;


    // Inicializar estructuras 
    catalogo.cantidadCursos = 0;
    historial.cantidad = 0;


    // Cargar catalogo de cursos
    printf("Cargando catalogo de cursos \n");

    if (cargarCatalogo(rutaCatalogoEntrada, &catalogo) != 0) {

        fprintf(stderr,
                "Error: no se pudo cargar el catalogo: %s\n",
                rutaCatalogoEntrada);

    } else {

        printf("Catalogo cargado correctamente.\n");
        printf("Cursos cargados: %d\n",
               catalogo.cantidadCursos);
    }


    // Cargar el historial de cursos aprobados
    printf("\nCargando historial...\n");

    if (cargarHistorial(rutaHistorialEntrada, &historial) < 0) {

        fprintf(stderr,
                "Error: no se pudo cargar el historial: %s\n",
                rutaHistorialEntrada);

    } else {

        printf("Historial cargado correctamente.\n");
        printf("Cursos aprobados: %d\n",
               historial.cantidad);
    }


    printf("\nCarga de archivos finalizada.\n");

    return 0;
}
