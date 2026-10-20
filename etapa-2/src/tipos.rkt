#lang typed/racket

(provide (all-defined-out))

(struct Curso
  ([codigo : String]
   [nombre : String]
   [creditos : Integer]
   [semestre : Integer]
   [carreras : (Listof String)]
   [grupos : (Listof Grupo)]
   [tiene-choques : Boolean]
   [puede-matricular : Boolean]))

(struct Grupo
  ([numero : Integer]
   [horario : (Listof BloqueHorario)])) 

(struct BloqueHorario
  ([dia : String]
   [inicio : Integer]
   [fin : Integer]))

(struct PreferenciaCurso
  ([codigo-curso : String]
   [grupos-interes : (Listof Integer)]))

(struct Preferencias
    ;lista de cursos que interesan
  ([cursos-interes : (Listof PreferenciaCurso)]
   [creditos-min : Integer]
   [creditos-max : Integer]))

;curso seleccionado con su # de grupo 
(struct Seleccion
  ([curso : Curso]
   [grupo : Grupo]))

(struct Combinacion
    ;lista de struct seleccion con los cursos y grupos
  ([selecciones : (Listof Seleccion)]
   [creditos-totales : Integer]))
