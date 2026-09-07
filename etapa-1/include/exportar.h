#ifndef EXPORTAR_H
#define EXPORTAR_H

#include "structs.h"

/*
 * Responsable: Neto
 * Exporta el catálogo completo a un archivo de salida en formato JSON
 * (contrato leído por la Etapa 2 en Racket).
 */

/* Retorna 0 en éxito. */
int exportarCatalogo(const char *rutaArchivo, const Catalogo *catalogo);

#endif /* EXPORTAR_H */
