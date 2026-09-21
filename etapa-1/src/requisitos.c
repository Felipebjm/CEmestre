#include <string.h>

#include "../include/requisitos.h"


// Se busca un curso dentro del historial del estudiante
static int cursoEstaAprobado(const CursoAprobado *historial, const char *codigo)
{
    // Se recorren todos los cursos que el estudiante ya aprobó
    for (int i = 0; i < historial->cantidad; i++) {

        // Se compara el código buscado con cada código del historial
        if (strcmp(historial->codigos[i], codigo) == 0) {
            return 1;
        }
    }

    return 0;
}


// Se busca un curso por su código dentro del catálogo
static const Curso *buscarCurso(const Catalogo *catalogo, const char *codigo)
{
    // Se recorren los cursos hasta encontrar el código indicado
    for (int i = 0; i < catalogo->cantidadCursos; i++) {

        if (strcmp(catalogo->cursos[i].codigo, codigo) == 0) {
            return &catalogo->cursos[i];
        }
    }

    return NULL;
}


// Se revisa si todos los requisitos de un curso ya fueron aprobados
static int cumpleRequisitos(const Curso *curso, const CursoAprobado *historial)
{
    // Se revisa cada requisito guardado en el curso
    for (int i = 0; i < curso->cantidadRequisitos; i++) {

        // Si falta un requisito, el curso todavía no puede matricularse
        if (!cursoEstaAprobado(historial, curso->requisitos[i])) {
            return 0;
        }
    }

    return 1;
}


// Se valida si el estudiante puede matricular cada curso del catálogo
void validarRequisitos(Catalogo *catalogo, const CursoAprobado *historial)
{
    // Se recorre cada curso del catálogo
    for (int i = 0; i < catalogo->cantidadCursos; i++) {

        Curso *curso = &catalogo->cursos[i];

        // Si el curso ya fue aprobado, no se necesita matricular otra vez
        if (cursoEstaAprobado(historial, curso->codigo)) {
            curso->puedeMatricular = 0;
            continue;
        }

        // Primero se revisan los requisitos que deben estar aprobados
        if (!cumpleRequisitos(curso, historial)) {
            curso->puedeMatricular = 0;
            continue;
        }

        // Si cumple los requisitos, inicialmente puede matricular el curso
        curso->puedeMatricular = 1;

        // Se revisan los correquisitos que tenga el curso
        for (int j = 0; j < curso->cantidadCorrequisitos; j++) {

            const char *codigoCorrequisito = curso->correquisitos[j];

            // Si el correquisito ya fue aprobado, no debe llevarse otra vez
            if (cursoEstaAprobado(historial, codigoCorrequisito)) {
                continue;
            }

            // Si no está aprobado, se busca para poder llevarlo simultáneamente
            const Curso *correquisito =
                buscarCurso(catalogo, codigoCorrequisito);

            // Si el correquisito no existe en el catálogo, se marca como inválido
            if (correquisito == NULL) {
                curso->puedeMatricular = 0;
                break;
            }

            // El correquisito también debe tener sus requisitos previos cumplidos
            if (!cumpleRequisitos(correquisito, historial)) {
                curso->puedeMatricular = 0;
                break;
            }
        }
    }
}