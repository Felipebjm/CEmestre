#ifndef STRUCTS_H
#define STRUCTS_H

#include "constantes.h"


typedef struct {
    char dia[MAX_DIA];
    int horaInicio; // ej 730 = 07:30 
    int horaFin;    
} Horario;


typedef struct {
    int numeroGrupo;
    Horario horarios[MAX_BLOQUES_HORARIO];
    int cantidadHorarios;
} Grupo;


typedef struct {
    char codigo[LEN_CODIGO];
    char nombre[LEN_NOMBRE];
    char carreras[MAX_CARRERAS][LEN_CARRERA];
    int cantidadCarreras;
    int creditos;

    int semestre;

    Grupo grupos[MAX_GRUPOS_POR_CURSO];
    int cantidadGrupos;

    char requisitos[MAX_REQUISITOS][LEN_CODIGO];
    int cantidadRequisitos;

    char correquisitos[MAX_CORREQUISITOS][LEN_CODIGO];
    int cantidadCorrequisitos;

 
    int tieneChoque;     
    int puedeMatricular; 
} Curso;

typedef struct {
    Curso cursos[MAX_CURSOS];
    int cantidadCursos;
} Catalogo;

typedef struct {
    char codigos[MAX_HISTORIAL][LEN_CODIGO];
    int cantidad;
} CursoAprobado;

#endif 
