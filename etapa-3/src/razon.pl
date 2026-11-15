:- module(razon, [evaluar/3]).

:- use_module('evaluador.pl').

% evaluar(+Combinacion, -Cumple, -Razon)
% Revisa las reglas en este orden, balance entre carreras, limite por area
% e incompatibilidad. La primera que falla es la razon reportada.
% El corte evita que al hacer backtracking se prueben las clausulas
% siguientes, asi cada combinacion tiene un solo resultado.

evaluar(Combinacion, false, balance_carreras) :-
    \+ cumple_balance(Combinacion), !.

evaluar(Combinacion, false, limite_area) :-
    \+ cumple_area(Combinacion), !.

evaluar(Combinacion, false, incompatibilidad) :-
    \+ cumple_incompatibilidad(Combinacion), !.

evaluar(_, true, ninguna).
