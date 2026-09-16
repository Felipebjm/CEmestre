#include "../include/horario.h"

/*
 * Responsable: Neto
 * TODO: comparar dia + rango de horas de 'a' y 'b' para determinar solape.
 */
int horariosChocan(const Horario *a, const Horario *b) {
    (void)a;
    (void)b;
    /* TODO: implementar comparación real (mismo día y horas que se solapan) */
    return 0;
}

/*
 * TODO: recorrer todos los pares de cursos/grupos del catálogo y usar
 * horariosChocan() para marcar tieneChoque en cada curso.
 */
void detectarChoques(Catalogo *catalogo) {
    (void)catalogo;
    /* TODO: implementar */
}
