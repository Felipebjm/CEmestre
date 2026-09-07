#ifndef HISTORIAL_H
#define HISTORIAL_H

#include "structs.h"

/*
 * Responsable: Felipe
 * Carga el historial de cursos aprobados por el estudiante.
 */

/* Carga el historial desde 'rutaArchivo' hacia 'historial'. Retorna 0 en éxito. */
int cargarHistorial(const char *rutaArchivo, HistorialEstudiante *historial);

#endif /* HISTORIAL_H */
