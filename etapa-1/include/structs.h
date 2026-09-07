#ifndef STRUCTS_H
#define STRUCTS_H

#include "constantes.h"

/*
 * Un bloque de horario: un día y un rango de horas.
 * Ej: MAR[07:30-09:20]  ->  dia="MAR", horaInicio=730, horaFin=920
 */
typedef struct {
    char dia[MAX_DIA];
    int horaInicio; /* formato HHMM, ej 730 = 07:30 */
    int horaFin;    /* formato HHMM, ej 920 = 09:20 */
} BloqueHorario;

/* Un grupo de un curso: profesor + sus bloques de horario */
typedef struct {
    int numeroGrupo;
    char profesor[LEN_PROFESOR];
    BloqueHorario bloques[MAX_BLOQUES_HORARIO];
    int cantidadBloques;
} Grupo;

/* Un curso completo del catálogo */
typedef struct {
    char codigo[LEN_CODIGO];
    char nombre[LEN_NOMBRE];
    char carrera[LEN_CARRERA];
    int creditos;

    Grupo grupos[MAX_GRUPOS_POR_CURSO];
    int cantidadGrupos;

    char requisitos[MAX_REQUISITOS][LEN_CODIGO];
    int cantidadRequisitos;

    char correquisitos[MAX_CORREQUISITOS][LEN_CODIGO];
    int cantidadCorrequisitos;

    /* Campos calculados por el programa (no vienen de la fuente de datos) */
    int tieneChoque;     /* 1 si choca con al menos otro curso/grupo del catálogo */
    int puedeMatricular; /* 1 si el estudiante cumple los requisitos */
} Curso;

/* El catálogo completo cargado en memoria */
typedef struct {
    Curso cursos[MAX_CURSOS];
    int cantidadCursos;
} Catalogo;

/* Historial de cursos aprobados por el estudiante */
typedef struct {
    char codigos[MAX_HISTORIAL][LEN_CODIGO];
    int cantidad;
} HistorialEstudiante;

#endif /* STRUCTS_H */
