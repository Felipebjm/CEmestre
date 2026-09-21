#include <stdio.h>
#include <string.h>

#include "../include/structs.h"
#include "../include/requisitos.h"


// Se limpian el catálogo y el historial antes de cada prueba
static void reiniciarDatos(Catalogo *catalogo, CursoAprobado *historial)
{
    memset(catalogo, 0, sizeof(Catalogo));
    memset(historial, 0, sizeof(CursoAprobado));
}


// Se agrega un curso básico al catálogo para usarlo en las pruebas
static Curso *agregarCurso(Catalogo *catalogo, const char *codigo)
{
    Curso *curso = &catalogo->cursos[catalogo->cantidadCursos];

    memset(curso, 0, sizeof(Curso));
    strcpy(curso->codigo, codigo);

    catalogo->cantidadCursos++;

    return curso;
}


// Se agrega un curso al historial como curso ya aprobado
static void agregarAprobado(CursoAprobado *historial, const char *codigo)
{
    strcpy(historial->codigos[historial->cantidad], codigo);
    historial->cantidad++;
}


// Se agrega un requisito a un curso
static void agregarRequisito(Curso *curso, const char *codigo)
{
    strcpy(curso->requisitos[curso->cantidadRequisitos], codigo);
    curso->cantidadRequisitos++;
}


// Se agrega un correquisito a un curso
static void agregarCorrequisito(Curso *curso, const char *codigo)
{
    strcpy(curso->correquisitos[curso->cantidadCorrequisitos], codigo);
    curso->cantidadCorrequisitos++;
}


// Se compara el resultado obtenido con el resultado esperado
static int revisarResultado(const char *nombrePrueba, int obtenido, int esperado)
{
    if (obtenido == esperado) {
        printf("[OK] %s\n", nombrePrueba);
        return 1;
    }

    printf("[ERROR] %s -> esperado: %d, obtenido: %d\n",
           nombrePrueba, esperado, obtenido);

    return 0;
}


int main(void)
{
    Catalogo catalogo;
    CursoAprobado historial;
    Curso *curso;
    Curso *correquisito;

    int pruebasCorrectas = 0;
    int totalPruebas = 0;

    printf("=========================================\n");
    printf("      PRUEBAS DE REQUISITOS              \n");
    printf("=========================================\n\n");


    // Prueba 1: un curso sin requisitos puede matricularse
    reiniciarDatos(&catalogo, &historial);

    curso = agregarCurso(&catalogo, "CURSO1");

    validarRequisitos(&catalogo, &historial);

    totalPruebas++;
    pruebasCorrectas += revisarResultado(
        "Curso sin requisitos",
        curso->puedeMatricular,
        1
    );


    // Prueba 2: un curso ya aprobado no se matricula otra vez
    reiniciarDatos(&catalogo, &historial);

    curso = agregarCurso(&catalogo, "CURSO2");
    agregarAprobado(&historial, "CURSO2");

    validarRequisitos(&catalogo, &historial);

    totalPruebas++;
    pruebasCorrectas += revisarResultado(
        "Curso ya aprobado",
        curso->puedeMatricular,
        0
    );


    // Prueba 3: un requisito aprobado permite matricular el curso
    reiniciarDatos(&catalogo, &historial);

    curso = agregarCurso(&catalogo, "CURSO3");
    agregarRequisito(curso, "REQ1");
    agregarAprobado(&historial, "REQ1");

    validarRequisitos(&catalogo, &historial);

    totalPruebas++;
    pruebasCorrectas += revisarResultado(
        "Requisito aprobado",
        curso->puedeMatricular,
        1
    );


    // Prueba 4: si falta un requisito, no puede matricularse
    reiniciarDatos(&catalogo, &historial);

    curso = agregarCurso(&catalogo, "CURSO4");
    agregarRequisito(curso, "REQ2");

    validarRequisitos(&catalogo, &historial);

    totalPruebas++;
    pruebasCorrectas += revisarResultado(
        "Requisito faltante",
        curso->puedeMatricular,
        0
    );


    // Prueba 5: si tiene varios requisitos y falta uno, no puede matricularse
    reiniciarDatos(&catalogo, &historial);

    curso = agregarCurso(&catalogo, "CURSO5");
    agregarRequisito(curso, "REQ3");
    agregarRequisito(curso, "REQ4");
    agregarAprobado(&historial, "REQ3");

    validarRequisitos(&catalogo, &historial);

    totalPruebas++;
    pruebasCorrectas += revisarResultado(
        "Varios requisitos con uno faltante",
        curso->puedeMatricular,
        0
    );


    // Prueba 6: un correquisito ya aprobado permite matricular el curso
    reiniciarDatos(&catalogo, &historial);

    curso = agregarCurso(&catalogo, "CURSO6");
    agregarCorrequisito(curso, "COREQ1");
    agregarAprobado(&historial, "COREQ1");

    validarRequisitos(&catalogo, &historial);

    totalPruebas++;
    pruebasCorrectas += revisarResultado(
        "Correquisito ya aprobado",
        curso->puedeMatricular,
        1
    );


    // Prueba 7: un correquisito puede llevarse al mismo tiempo si cumple sus requisitos
    reiniciarDatos(&catalogo, &historial);

    curso = agregarCurso(&catalogo, "CURSO7");
    agregarCorrequisito(curso, "COREQ2");

    correquisito = agregarCurso(&catalogo, "COREQ2");
    agregarRequisito(correquisito, "REQ5");
    agregarAprobado(&historial, "REQ5");

    validarRequisitos(&catalogo, &historial);

    totalPruebas++;
    pruebasCorrectas += revisarResultado(
        "Correquisito simultaneo con requisitos cumplidos",
        curso->puedeMatricular,
        1
    );


    // Prueba 8: el correquisito no puede llevarse si le falta un requisito
    reiniciarDatos(&catalogo, &historial);

    curso = agregarCurso(&catalogo, "CURSO8");
    agregarCorrequisito(curso, "COREQ3");

    correquisito = agregarCurso(&catalogo, "COREQ3");
    agregarRequisito(correquisito, "REQ6");

    validarRequisitos(&catalogo, &historial);

    totalPruebas++;
    pruebasCorrectas += revisarResultado(
        "Correquisito con requisito faltante",
        curso->puedeMatricular,
        0
    );


    // Prueba 9: si el correquisito no existe en el catálogo, no puede matricularse
    reiniciarDatos(&catalogo, &historial);

    curso = agregarCurso(&catalogo, "CURSO9");
    agregarCorrequisito(curso, "NOEXISTE");

    validarRequisitos(&catalogo, &historial);

    totalPruebas++;
    pruebasCorrectas += revisarResultado(
        "Correquisito inexistente",
        curso->puedeMatricular,
        0
    );


    // Prueba 10: dos cursos pueden ser correquisitos entre sí
    reiniciarDatos(&catalogo, &historial);

    Curso *cursoA = agregarCurso(&catalogo, "CURSOA");
    Curso *cursoB = agregarCurso(&catalogo, "CURSOB");

    agregarRequisito(cursoA, "REQ7");
    agregarRequisito(cursoB, "REQ7");

    agregarCorrequisito(cursoA, "CURSOB");
    agregarCorrequisito(cursoB, "CURSOA");

    agregarAprobado(&historial, "REQ7");

    validarRequisitos(&catalogo, &historial);

    totalPruebas++;
    pruebasCorrectas += revisarResultado(
        "Correquisitos mutuos - curso A",
        cursoA->puedeMatricular,
        1
    );

    totalPruebas++;
    pruebasCorrectas += revisarResultado(
        "Correquisitos mutuos - curso B",
        cursoB->puedeMatricular,
        1
    );


    printf("\n=========================================\n");
    printf("Pruebas correctas: %d de %d\n",
           pruebasCorrectas, totalPruebas);
    printf("=========================================\n");

    if (pruebasCorrectas == totalPruebas) {
        printf("Todas las pruebas pasaron correctamente.\n");
        return 0;
    }

    printf("Algunas pruebas fallaron.\n");
    return 1;
}