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
   [puede-matricular : Boolean])
   #:transparent)

(struct Grupo
  ([numero : Integer]
   [horario : (Listof BloqueHorario)])
   #:transparent)

(struct BloqueHorario
  ([dia : String]
   [inicio : Integer]
   [fin : Integer])
   #:transparent)

(struct PreferenciaCurso
  ([codigo-curso : String]
   [grupos-interes : (Listof Integer)])
   #:transparent)

(struct Preferencias
    ;lista de cursos que interesan
  ([cursos-interes : (Listof PreferenciaCurso)]
   [creditos-min : Integer]
   [creditos-max : Integer])
   #:transparent)

;curso seleccionado con su # de grupo 
(struct Seleccion
  ([curso : Curso]
   [grupo : Grupo])
   #:transparent)

(struct Combinacion
    ;lista de struct seleccion con los cursos y grupos
  ([selecciones : (Listof Seleccion)]
   [creditos-totales : Integer])
   #:transparent)
