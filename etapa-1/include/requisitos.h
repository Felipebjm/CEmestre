#ifndef REQUISITOS_H
#define REQUISITOS_H

#include "structs.h"

/*
 * Responsable: Luis
 * Determina, para cada curso, si el estudiante cumple los requisitos
 * necesarios para matricularlo según su historial.
 */

/* Marca catalogo->cursos[i].puedeMatricular para todos los cursos. */
void validarRequisitos(Catalogo *catalogo, const CursoAprobado *historial);

#endif /* REQUISITOS_H */
