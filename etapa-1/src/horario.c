#include "../include/horario.h"

/*
 * Responsable: Neto
 * TODO: comparar dia + rango de horas de cada bloque para determinar solape.
 */
int bloquesChocan(const BloqueHorario *a, const BloqueHorario *b) {
    (void)a;
    (void)b;
    /* TODO: implementar comparación real (mismo día y horas que se solapan) */
    return 0;
}

/*
 * TODO: recorrer todos los pares de cursos/grupos del catálogo y usar
 * bloquesChocan() para marcar tieneChoque en cada curso.
 */
void detectarChoques(Catalogo *catalogo) {
    (void)catalogo;
    /* TODO: implementar */
}
