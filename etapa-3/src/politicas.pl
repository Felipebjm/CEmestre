%% Reglas modificables para que una combinacion sea valida

:- module(politicas, [
    porcentaje_maximo/2,
    maximo_area/1,
    incompatible/2
]).

% Porcentaje maximo de cursos por carrera
porcentaje_maximo('CE', 70).
porcentaje_maximo('ME', 70).


% Limite de cursos por area

maximo_area(2).


% Cursos incompatibles
% incompatible(CodigoCurso1, CodigoCurso2)

incompatible('CE1001', 'ME2001').
incompatible('CE2002', 'ME3002').
