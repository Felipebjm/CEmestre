#lang typed/racket

(require "tipos.rkt")

(provide cursoDeInteres filtrarCursosInteres)

;; Un curso es de interes si su codigo aparece en la lista de cursos de interes de las preferencias.
(: cursoDeInteres (-> Curso Preferencias Boolean))
(define (cursoDeInteres curso preferencias)
  (ormap (lambda ([codigo : String])
           (string=? codigo (Curso-codigo curso)))
         (Preferencias-cursos-interes preferencias)))

;; Se queda solo con los cursos del catalogo que el estudiante marco como de interes.
(: filtrarCursosInteres (-> (Listof Curso) Preferencias (Listof Curso)))
(define (filtrarCursosInteres cursos preferencias)
  (filter (lambda ([c : Curso]) (cursoDeInteres c preferencias)) cursos))
