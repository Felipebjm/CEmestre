#ifndef HORARIO_H
#define HORARIO_H

#include "structs.h"

/*
 * Responsable: Neto
 * Determina, para cada par de cursos/grupos, si sus horarios chocan entre sí.
 */

/* Retorna 1 si los horarios 'a' y 'b' se solapan (mismo día y rango de horas
 * que se cruza), 0 si no. */
int horariosChocan(const Horario *a, const Horario *b);

/* Marca catalogo->cursos[i].tieneChoque para todos los cursos del catálogo. */
void detectarChoques(Catalogo *catalogo);

#endif /* HORARIO_H */
