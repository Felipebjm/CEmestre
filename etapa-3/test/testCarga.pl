% Ejecutar desde la raiz del proyecto y correr
% swipl -q -s etapa-3/test/testCarga.pl

:- use_module('../src/carga.pl').
:- initialization(main, main).

main :-
    cargar_combinaciones(Combinaciones),
    findall(Combinacion,
            consultar_combinacion(Combinaciones, Combinacion),
            Consultadas),
    (   Consultadas == Combinaciones
    ->  true
    ;   throw(error(consulta_incompleta, main/0))
    ),
    forall(member(Combinacion, Consultadas),
           imprimir_combinacion(Combinacion)),
    length(Consultadas, CantidadCombinaciones),
    findall(Curso,
            (consultar_combinacion(Combinaciones, combinacion(_, Cursos, _)),
             member(Curso, Cursos)),
            TodosLosCursos),
    length(TodosLosCursos, CantidadCursos),
    sort(TodosLosCursos, CursosDistintos),
    length(CursosDistintos, CantidadDistintos),
    format('~n=== Resumen ===~n', []),
    format('Combinaciones parseadas y consultadas: ~d~n', [CantidadCombinaciones]),
    format('Cursos en todas las combinaciones (incluye repeticiones): ~d~n',
           [CantidadCursos]),
    format('Cursos distintos (segun todos los campos de curso/5): ~d~n',
           [CantidadDistintos]),
    format('Consulta verificada: devuelve todas las combinaciones cargadas.~n', []).

imprimir_combinacion(combinacion(Id, Cursos, CreditosTotales)) :-
    length(Cursos, CantidadCursos),
    format('~n=== Combinacion ~d ===~n', [Id]),
    format('Creditos totales: ~d | Cursos: ~d~n',
           [CreditosTotales, CantidadCursos]),
    forall(member(Curso, Cursos),
           format('  ~q~n', [Curso])).
