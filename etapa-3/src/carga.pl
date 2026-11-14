:- module(carga, [
    cargar_combinaciones/1,
    cargar_combinaciones/2,
    consultar_combinacion/2,
    combinacion/3,
    curso/5
]).

:- use_module(library(http/json)).
:- use_module(library(lists)).

:- dynamic combinacion/3.
:- dynamic curso/5.


cargar_combinaciones(Combinaciones) :-
    source_file(cargar_combinaciones(_), Archivo),
    file_directory_name(Archivo, Directorio),
    absolute_file_name('../../etapa-2/data/combinaciones_salida.json', Ruta,
                       [relative_to(Directorio), access(read)]),
    cargar_combinaciones(Ruta, Combinaciones).


% Lee el JSON, devuelve terminos compuestos y registra los mismos datos como hechos.

cargar_combinaciones(Ruta, Combinaciones) :-
    setup_call_cleanup(
        open(Ruta, read, Stream, [encoding(utf8)]),
        json_read_dict(Stream, Datos),
        close(Stream)
    ),
    get_dict(combinaciones, Datos, ListaJSON),
    convertir_combinaciones(ListaJSON, 1, Combinaciones),
    transaction(registrar_hechos(Combinaciones)).

% Los hechos representan la ultima carga exitosa. Cada curso distinto se
% registra una vez, aunque aparezca en varias combinaciones.
registrar_hechos(Combinaciones) :-
    findall(Curso,
            (member(combinacion(_, Cursos, _), Combinaciones),
             member(Curso, Cursos)),
            TodosLosCursos),
    sort(TodosLosCursos, CursosDistintos),
    retractall(combinacion(_, _, _)),
    retractall(curso(_, _, _, _, _)),
    forall(member(Combinacion, Combinaciones), assertz(Combinacion)),
    forall(member(Curso, CursosDistintos), assertz(Curso)).


% CONVERSION DE COMBINACIONES
% Caso base de cuando no quedan combinaciones
convertir_combinaciones([], _, []).

% Caso recursivo 
convertir_combinaciones(
    [JSON | Resto],
    Id,
    [Combinacion | Otras]
) :-
    convertir_combinacion(JSON, Id, Combinacion),
    SiguienteId is Id + 1,
    convertir_combinaciones(Resto, SiguienteId, Otras).

% convertir_combinacion(+JSON, +Id, -Combinacion)

convertir_combinacion(
    JSON,
    Id,
    combinacion(Id, Cursos, CreditosTotales)
) :-
    get_dict(selecciones, JSON, Selecciones),
    get_dict(creditos_totales, JSON, CreditosTotales),
    maplist(convertir_curso, Selecciones, Cursos).

% CONVERSION DE CURSOS
% curso(Codigo, Grupo, Creditos, Carreras, Area)

convertir_curso(
    JSON,
    curso(Codigo, Grupo, Creditos, Carreras, Area)
) :-
    get_dict(curso, JSON, Codigo),
    get_dict(grupo, JSON, Grupo),
    get_dict(carreras, JSON, Carreras),
    get_dict(area, JSON, Area),

    (   get_dict(creditos, JSON, Creditos)
    ->  true
    ;   throw(error(
            existencia_campo(creditos, Codigo),
            convertir_curso/2
        ))
    ).

% CONSULTA DE COMBINACIONES
consultar_combinacion(Lista, Combinacion) :-
    member(Combinacion, Lista).
