#include <stdio.h>
#include "../include/structs.h"
#include "../include/catalogo.h"
#include "../include/historial.h"
#include "../include/horario.h"
#include "../include/requisitos.h"
#include "../include/exportar.h"

int main(int argc, char *argv[]) {
    Catalogo catalogo;
    HistorialEstudiante historial;

    const char *rutaCatalogoEntrada  = (argc > 1) ? argv[1] : ARCHIVO_CATALOGO_ENTRADA;
    const char *rutaHistorialEntrada = (argc > 2) ? argv[2] : ARCHIVO_HISTORIAL_ENTRADA;
    const char *rutaCatalogoSalida   = (argc > 3) ? argv[3] : ARCHIVO_CATALOGO_SALIDA;

    if (cargarCatalogo(rutaCatalogoEntrada, &catalogo) != 0) {
        fprintf(stderr, "Error cargando el catalogo: %s\n", rutaCatalogoEntrada);
        return 1;
    }

    if (cargarHistorial(rutaHistorialEntrada, &historial) != 0) {
        fprintf(stderr, "Error cargando el historial: %s\n", rutaHistorialEntrada);
        return 1;
    }

    detectarChoques(&catalogo);
    validarRequisitos(&catalogo, &historial);

    if (exportarCatalogo(rutaCatalogoSalida, &catalogo) != 0) {
        fprintf(stderr, "Error exportando el catalogo: %s\n", rutaCatalogoSalida);
        return 1;
    }

    printf("Catalogo procesado y exportado a: %s\n", rutaCatalogoSalida);
    return 0;
}
