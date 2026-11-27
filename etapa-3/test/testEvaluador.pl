
:- use_module('../src/evaluador.pl').
:- use_module(library(plunit)).
:- initialization(main, main).

main :-
    (run_tests
    -> writeln('Todas las pruebas del evaluador pasaron correctamente.')
    ; halt(1)).


:- begin_tests(evaluador).


% Se prueba el porcentaje maximo exacto de una carrera.
test(balance_limite) :-
    cumple_balance(combinacion(1, [
        curso("CE1106", 1, 7, ["CE"], "software"),
        curso("MI2101", 1, 3, ["ME"], "materiales_mecanica")
    ], 10)).


% Se prueba tener exactamente dos cursos de una misma area.
test(area_limite) :-
    cumple_area(combinacion(2, [
        curso("CE1106", 1, 3, ["CE"], "software"),
        curso("CE1103", 1, 4, ["CE"], "software"),
        curso("MI2101", 1, 3, ["ME"], "materiales_mecanica")
    ], 10)).


% Se prueba un par incompatible en orden contrario.
test(incompatibilidad_orden, [fail]) :-
    cumple_incompatibilidad(combinacion(3, [
        curso("MA2104", 1, 4, ["CE"], "ciencias_naturales"),
        curso("MA2105", 1, 4, ["CE", "ME"], "ciencias_naturales")
    ], 8)).


% Se prueba el segundo par incompatible de las politicas.
test(segundo_par_incompatible, [fail]) :-
    cumple_incompatibilidad(combinacion(4, [
        curso("FI1102", 1, 3, ["CE"], "ciencias_naturales"),
        curso("MA2105", 1, 4, ["CE", "ME"], "ciencias_naturales")
    ], 7)).


:- end_tests(evaluador).
