:- use_module('carga.pl').
:- use_module('razon.pl').
:- use_module('exportar.pl').
:- initialization(main, main).

main :-
    cargar_combinaciones(Combinaciones),
    evaluar_todas(Combinaciones, Resultados),
    exportar_resultados(Resultados),
    contar_cumplen(Resultados, Cumplen),
    length(Resultados, Total),
    Rechazadas is Total - Cumplen,
    format('Combinaciones evaluadas: ~d~n', [Total]),
    format('Cumplen las reglas: ~d~n', [Cumplen]),
    format('Rechazadas: ~d~n', [Rechazadas]),
    format('Resultados exportados a etapa-3/data/resultados.json~n', []).

% evaluar_todas(+Combinaciones, -Resultados)
% findall usa backtracking, consultar_combinacion va dando una combinacion
% a la vez y evaluar calcula su resultado, hasta recorrerlas todas.
evaluar_todas(Combinaciones, Resultados) :-
    findall(resultado(Combinacion, Cumple, Razon),
            ( consultar_combinacion(Combinaciones, Combinacion),
              evaluar(Combinacion, Cumple, Razon) ),
            Resultados).

contar_cumplen(Resultados, Cantidad) :-
    include([resultado(_, true, _)]>>true, Resultados, Cumplen),
    length(Cumplen, Cantidad).
