#include <string.h>
#include "../include/horario.h"

int horariosChocan(const Horario *a, const Horario *b) {
    if (strcmp(a->dia, b->dia) != 0) {
        return 0;
    }

    return (a->horaInicio < b->horaFin) && (b->horaInicio < a->horaFin);
}

static int gruposChocan(const Grupo *g1, const Grupo *g2) {
    for (int i = 0; i < g1->cantidadHorarios; i++) {
        for (int j = 0; j < g2->cantidadHorarios; j++) {
            if (horariosChocan(&g1->horarios[i], &g2->horarios[j])) {
                return 1;
            }
        }
    }
    return 0;
}

void detectarChoques(Catalogo *catalogo) {
    for (int i = 0; i < catalogo->cantidadCursos; i++) {
        catalogo->cursos[i].tieneChoque = 0;
    }

    for (int i = 0; i < catalogo->cantidadCursos; i++) {
        for (int j = i + 1; j < catalogo->cantidadCursos; j++) {
            Curso *c1 = &catalogo->cursos[i];
            Curso *c2 = &catalogo->cursos[j];

            for (int g1 = 0; g1 < c1->cantidadGrupos; g1++) {
                for (int g2 = 0; g2 < c2->cantidadGrupos; g2++) {
                    if (gruposChocan(&c1->grupos[g1], &c2->grupos[g2])) {
                        c1->tieneChoque = 1;
                        c2->tieneChoque = 1;
                    }
                }
            }
        }
    }
}
