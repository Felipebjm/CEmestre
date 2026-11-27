
:- module(evaluador, [
    cumple_balance/1,
    cumple_area/1,
    cumple_incompatibilidad/1
]).

:- use_module('politicas.pl').
:- use_module(library(lists)).


% Compara los datos del JSON con los de las politicas.
mismo_valor(Dato, Valor) :-
    (string(Dato)
    -> atom_string(Valor, Dato)
    ; Dato = Valor).


% Calcula los creditos de una carrera.
% Si un curso es compartido, reparte sus creditos.
creditos_carrera(Cursos, Carrera, Total) :-
    findall(Parte,
            (member(curso(_, _, Creditos, Carreras, _), Cursos),
             member(CarreraCurso, Carreras),
             mismo_valor(CarreraCurso, Carrera),
             length(Carreras, Cantidad),
             Cantidad > 0,
             Parte is Creditos / Cantidad),
            Partes),
    sum_list(Partes, Total).


% Revisa que las carreras no superen el porcentaje permitido.
cumple_balance(combinacion(_, Cursos, CreditosTotales)) :-
    forall(
        porcentaje_maximo(Carrera, Maximo),
        (creditos_carrera(Cursos, Carrera, CreditosCarrera),
         CreditosCarrera * 100 =< CreditosTotales * Maximo)
    ).


% Revisa que no haya mas cursos por area de los permitidos.
cumple_area(combinacion(_, Cursos, _)) :-
    maximo_area(Maximo),
    \+ (
        member(curso(_, _, _, _, Area), Cursos),
        findall(1,
                member(curso(_, _, _, _, Area), Cursos),
                Coincidencias),
        length(Coincidencias, Cantidad),
        Cantidad > Maximo
    ).


% Revisa que no se matriculen dos cursos incompatibles juntos.
cumple_incompatibilidad(combinacion(_, Cursos, _)) :-
    \+ (
        incompatible(Codigo1, Codigo2),
        member(curso(Curso1, _, _, _, _), Cursos),
        mismo_valor(Curso1, Codigo1),
        member(curso(Curso2, _, _, _, _), Cursos),
        mismo_valor(Curso2, Codigo2)
    ).
