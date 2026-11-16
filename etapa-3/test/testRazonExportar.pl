% Ejecutar desde la raiz del proyecto
% swipl etapa-3/test/testRazonExportar.pl
%
% Las combinaciones se arman a mano con los valores actuales de politicas.pl,
% maximo 70% por carrera, maximo 2 cursos por area, MA2105 y MA2104 incompatibles.
% Los textos van como strings porque asi los entrega carga.pl al leer el JSON.

:- use_module('../src/razon.pl').
:- use_module('../src/exportar.pl').
:- use_module(library(plunit)).
:- use_module(library(http/json)).
:- initialization(main, main).

main :-
    (   run_tests
    ->  writeln('Todas las pruebas de razon y exportacion pasaron correctamente.')
    ;   halt(1)
    ).

% Mitad CE y mitad ME, areas distintas, sin incompatibles.
cumple(combinacion(1, [
    curso("CE1106", 1, 3, ["CE"], "software"),
    curso("MI2101", 1, 3, ["ME"], "materiales_mecanica"),
    curso("FI1101", 5, 4, ["CE", "ME"], "ciencias_naturales")
], 10)).

% Solo cursos de CE, CE queda en 100%.
solo_ce(combinacion(2, [
    curso("CE1106", 1, 3, ["CE"], "software"),
    curso("EL2113", 4, 4, ["CE"], "electronica")
], 7)).

% Cursos compartidos, balance 50% y 50%, pero 3 cursos de la misma area.
tres_de_un_area(combinacion(3, [
    curso("FI1101", 5, 3, ["CE", "ME"], "ciencias_naturales"),
    curso("MA1103", 9, 4, ["CE", "ME"], "ciencias_naturales"),
    curso("QU1106", 2, 3, ["CE", "ME"], "ciencias_naturales")
], 10)).

% Balanceada y con areas permitidas, pero trae MA2105 y MA2104 juntos.
con_incompatibles(combinacion(4, [
    curso("MA2105", 1, 4, ["ME", "CE"], "ciencias_naturales"),
    curso("MA2104", 2, 4, ["CE"], "ciencias_naturales"),
    curso("MI3124", 1, 4, ["ME"], "materiales_mecanica")
], 12)).

% Rompe balance y area a la vez, se reporta balance porque se revisa primero.
rompe_dos(combinacion(5, [
    curso("CE1101", 1, 3, ["CE"], "software"),
    curso("CE1103", 3, 4, ["CE"], "software"),
    curso("CE1106", 2, 3, ["CE"], "software")
], 10)).

:- begin_tests(razon).

test(cumple_todas) :-
    cumple(C), evaluar(C, Cumple, Razon),
    assertion(Cumple == true), assertion(Razon == ninguna).

test(rompe_balance) :-
    solo_ce(C), evaluar(C, Cumple, Razon),
    assertion(Cumple == false), assertion(Razon == balance_carreras).

test(rompe_area) :-
    tres_de_un_area(C), evaluar(C, Cumple, Razon),
    assertion(Cumple == false), assertion(Razon == limite_area).

test(rompe_incompatibilidad) :-
    con_incompatibles(C), evaluar(C, Cumple, Razon),
    assertion(Cumple == false), assertion(Razon == incompatibilidad).

test(primera_regla_violada) :-
    rompe_dos(C), evaluar(C, _, Razon),
    assertion(Razon == balance_carreras).

% Gracias al corte, cada combinacion da un solo resultado aunque se pida mas.
test(un_solo_resultado) :-
    rompe_dos(C),
    findall(Razon, evaluar(C, _, Razon), Razones),
    assertion(Razones == [balance_carreras]).

:- end_tests(razon).

:- begin_tests(exportar).

test(json_de_salida) :-
    cumple(C1), solo_ce(C2),
    tmp_file_stream(text, Ruta, S), close(S),
    exportar_resultados([resultado(C1, true, ninguna),
                         resultado(C2, false, balance_carreras)], Ruta),
    setup_call_cleanup(open(Ruta, read, In, [encoding(utf8)]),
                       json_read_dict(In, Datos),
                       close(In)),
    delete_file(Ruta),
    Datos.resultados = [R1, R2],
    assertion(R1.id == 1),
    assertion(R1.cumple == true),
    assertion(R1.razon == null),
    assertion(R1.pares == [_{curso:"CE1106", grupo:1},
                           _{curso:"MI2101", grupo:1},
                           _{curso:"FI1101", grupo:5}]),
    assertion(R2.cumple == false),
    assertion(R2.razon == "balance_carreras").

:- end_tests(exportar).
