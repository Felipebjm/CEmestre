:- use_module('carga.pl').
:- initialization(main, main).

main :-
    cargar_combinaciones(_Combinaciones),
    writeln('cursos cargados').