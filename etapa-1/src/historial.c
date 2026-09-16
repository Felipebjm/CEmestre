#include <stdio.h>
#include "../include/historial.h"

int cargarHistorial(const char *rutaArchivo,CursoAprobado *historial)
{
    FILE *archivo;

    archivo = fopen(rutaArchivo, "r");

    if (archivo == NULL) 
    {
        return -1;
    }

    historial->cantidad = 0;

    while (historial->cantidad < MAX_HISTORIAL && fscanf(archivo,"%9s", historial->codigos[historial->cantidad]) == 1)
    {
        historial->cantidad++;
    }

    fclose(archivo);

    return historial->cantidad;
}
