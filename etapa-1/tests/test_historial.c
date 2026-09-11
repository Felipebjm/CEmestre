#include <stdio.h>
#include <stdlib.h>

#include "../include/constantes.h"
#include "../include/structs.h"
#include "../include/historial.h"

int main() {
    CursoAprobado historial;
    
    
    const char *rutaHistorial = ARCHIVO_HISTORIAL_ENTRADA;

    printf("  Test    \n");
    printf("=========================================\n\n");

    int cursosAprobados = cargarHistorial(rutaHistorial, &historial);

    if (cursosAprobados < 0) {
        fprintf(stderr, "\n[ERROR] No se pudo abrir o leer el archivo de historial\n");
        return 1;
    }

    /* Mostrar resultados */
    printf("\n>>> Numero de materias aprobadas: %d <<<\n\n", historial.cantidad);

    printf("Lista de codigos cargados:\n");
    printf("--------------------------\n");
    
    for (int i = 0; i < historial.cantidad; i++) {
        printf("  %2d. %s\n", i + 1, historial.codigos[i]);
    }
    
    printf("--------------------------\n");
    return 0;
}