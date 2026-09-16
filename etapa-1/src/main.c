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

    const char *rutaCatalogoSalida =
        (argc > 3) ? argv[3] : ARCHIVO_CATALOGO_SALIDA;

    catalogo.cantidadCursos = 0;
    historial.cantidad = 0;

    printf("Cargando catalogo de cursos \n");

    if (cargarCatalogo(rutaCatalogoEntrada, &catalogo) != 0) {

        fprintf(stderr,
                "Error: no se pudo cargar el catalogo: %s\n",
                rutaCatalogoEntrada);

        return 1;
    }

    printf("Catalogo cargado correctamente.\n");
    printf("Cursos cargados: %d\n", catalogo.cantidadCursos);


    printf("\nCargando historial...\n");

    if (cargarHistorial(rutaHistorialEntrada, &historial) < 0) {

        fprintf(stderr,
                "Error: no se pudo cargar el historial: %s\n",
                rutaHistorialEntrada);

        return 1;
    }

    printf("Historial cargado correctamente.\n");
    printf("Cursos aprobados: %d\n", historial.cantidad);


    printf("\nDetectando choques de horario...\n");
    detectarChoques(&catalogo);

    printf("Validando requisitos...\n");
    validarRequisitos(&catalogo, &historial);

    printf("Exportando catalogo a: %s\n", rutaCatalogoSalida);

    if (exportarCatalogo(rutaCatalogoSalida, &catalogo) != 0) {

        fprintf(stderr,
                "Error: no se pudo exportar el catalogo: %s\n",
                rutaCatalogoSalida);

        return 1;
    }

    printf("\nProceso finalizado. Catalogo exportado correctamente.\n");

    return 0;
}
