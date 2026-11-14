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
    consultar_e_imprimir_hechos(Combinaciones, CursosDistintos),
    format('~n=== Resumen ===~n', []),
    format('Combinaciones parseadas y consultadas: ~d~n', [CantidadCombinaciones]),
    format('Cursos en todas las combinaciones (incluye repeticiones): ~d~n',
           [CantidadCursos]),
    format('Cursos distintos (segun todos los campos de curso/5): ~d~n',
           [CantidadDistintos]),
    format('Consulta verificada: devuelve todas las combinaciones cargadas.~n', []),
    format('Consultas a hechos verificadas: coinciden con los terminos complejos.~n', []).

% Consulta los predicados registrados por carga.pl e imprime cada solucion.
consultar_e_imprimir_hechos(Combinaciones, CursosDistintos) :-
    findall(combinacion(Id, Cursos, CreditosTotales),
            combinacion(Id, Cursos, CreditosTotales),
            HechosCombinaciones),
    findall(curso(Codigo, Grupo, Creditos, Carreras, Area),
            curso(Codigo, Grupo, Creditos, Carreras, Area),
            HechosCursos),
    format('~n=== Consulta a todos los hechos de combinaciones ===~n', []),
    format('?- combinacion(Id, Cursos, CreditosTotales).~n', []),
    imprimir_resultados(HechosCombinaciones),
    format('~n=== Consulta a todos los hechos de cursos ===~n', []),
    format('?- curso(Codigo, Grupo, Creditos, Carreras, Area).~n', []),
    imprimir_resultados(HechosCursos),
    (   HechosCombinaciones == Combinaciones,
        HechosCursos == CursosDistintos
    ->  true
    ;   throw(error(hechos_inconsistentes, consultar_e_imprimir_hechos/2))
    ).

imprimir_resultados(Resultados) :-
    forall(member(Resultado, Resultados), format('  ~q.~n', [Resultado])),
    length(Resultados, Cantidad),
    format('Total de soluciones: ~d~n', [Cantidad]).

imprimir_combinacion(combinacion(Id, Cursos, CreditosTotales)) :-
    length(Cursos, CantidadCursos),
    format('~n=== Combinacion ~d ===~n', [Id]),
    format('Creditos totales: ~d | Cursos: ~d~n',
           [CreditosTotales, CantidadCursos]),
    forall(member(Curso, Cursos),
           format('  ~q~n', [Curso])).
