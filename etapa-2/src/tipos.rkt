#lang typed/racket

(provide (struct-out Curso)
         (struct-out Grupo)
         (struct-out BloqueHorario)
         (struct-out Preferencias)
         (struct-out Seleccion)
         (struct-out Combinacion))

(struct Curso
  ([codigo : String]
   [nombre : String]
   [creditos : Integer]
   [semestre : Integer]
   [carreras : (Listof String)]
   [grupos : (Listof Grupo)]))

(struct Grupo
  ([numero : Integer]
   [horario : (Listof BloqueHorario)])) 

(struct BloqueHorario
  ([dia : String]
   [inicio : Integer]
   [fin : Integer]))


(struct Preferencias
    ;lista de cursos que interesan
  ([cursos-interes : (Listof String)]
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
