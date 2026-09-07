#ifndef CATALOGO_H
#define CATALOGO_H

#include "structs.h"

/*
 * Responsable: Felipe
 * Carga el catálogo de cursos de la carrera a partir del archivo de entrada.
 */

/* Carga el catálogo desde 'rutaArchivo' hacia 'catalogo'. Retorna 0 en éxito. */
int cargarCatalogo(const char *rutaArchivo, Catalogo *catalogo);

#endif /* CATALOGO_H */
