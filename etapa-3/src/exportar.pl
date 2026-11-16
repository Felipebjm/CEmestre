:- module(exportar, [
    exportar_resultados/1,
    exportar_resultados/2
]).

:- use_module(library(http/json)).
:- use_module(library(lists)).

% exportar_resultados(+Resultados)
% Escribe los resultados en etapa-3/data/resultados.json.
exportar_resultados(Resultados) :-
    source_file(exportar_resultados(_), Archivo),
    file_directory_name(Archivo, Directorio),
    absolute_file_name('../data/resultados.json', Ruta,
                       [relative_to(Directorio)]),
    exportar_resultados(Resultados, Ruta).

% exportar_resultados(+Resultados, +Ruta)
% Cada resultado es resultado(combinacion(Id, Cursos, Creditos), Cumple, Razon).
exportar_resultados(Resultados, Ruta) :-
    file_directory_name(Ruta, Carpeta),
    make_directory_path(Carpeta),
    maplist(resultado_a_dict, Resultados, Dicts),
    setup_call_cleanup(
        open(Ruta, write, Stream, [encoding(utf8)]),
        json_write_dict(Stream, _{resultados: Dicts}, [width(0)]),
        close(Stream)
    ).

% Convierte un resultado al objeto que se escribe en el JSON.
% Si la combinacion cumple, la razon se exporta como null.
resultado_a_dict(
    resultado(combinacion(Id, Cursos, Creditos), Cumple, Razon),
    _{id: Id,
      pares: Pares,
      creditos_totales: Creditos,
      cumple: Cumple,
      razon: RazonJSON}
) :-
    maplist(curso_a_par, Cursos, Pares),
    razon_json(Cumple, Razon, RazonJSON).

curso_a_par(curso(Codigo, Grupo, _, _, _), _{curso: Codigo, grupo: Grupo}).

razon_json(true, _, null) :- !.
razon_json(false, Razon, Razon).
