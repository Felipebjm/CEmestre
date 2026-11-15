%% Reglas modificables para que una combinacion sea valida

:- module(politicas, [
    porcentaje_maximo/2,
    maximo_area/1,
    incompatible/2
]).

% Porcentaje maximo de los creditos totales de una combinacion que puede
% tener cada carrera. Un curso compartido reparte sus creditos en partes
% iguales entre sus carreras.
porcentaje_maximo('CE', 70).
porcentaje_maximo('ME', 70).


% Limite de cursos por area

maximo_area(2).


% Cursos incompatibles
% incompatible(CodigoCurso1, CodigoCurso2)

incompatible('MA2105', 'MA2104').
incompatible('FI1102', 'MA2105').
