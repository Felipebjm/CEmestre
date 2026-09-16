#include <string.h>
#include "../include/horario.h"

/*
 * Responsable: Neto
 *
 * Dos horarios chocan si son el mismo día y sus rangos de hora se solapan.
 * El solape se compara con desigualdad estricta a propósito: un curso que
 * termina a las 09:20 y otro que empieza a las 09:20 NO chocan (back-to-back
 * es válido en un horario real).
 */
int horariosChocan(const Horario *a, const Horario *b) {
    if (strcmp(a->dia, b->dia) != 0) {
        return 0;
    }

    return (a->horaInicio < b->horaFin) && (b->horaInicio < a->horaFin);
}

/*
 * TODO (siguiente commit): recorrer todos los pares de cursos/grupos del
 * catálogo y usar horariosChocan() para marcar tieneChoque en cada curso.
 */
void detectarChoques(Catalogo *catalogo) {
    (void)catalogo;
    /* TODO: implementar */
}
