#ifndef HORARIO_H
#define HORARIO_H

#include "structs.h"

/*
 * Responsable: Neto
 * Determina, para cada par de cursos/grupos, si sus horarios chocan entre sí.
 */

/* Retorna 1 si los bloques de horario a y b se solapan, 0 si no. */
int bloquesChocan(const BloqueHorario *a, const BloqueHorario *b);

/* Marca catalogo->cursos[i].tieneChoque para todos los cursos del catálogo. */
void detectarChoques(Catalogo *catalogo);

#endif /* HORARIO_H */
