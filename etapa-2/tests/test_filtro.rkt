#lang typed/racket

(require "../src/tipos.rkt")
(require "../src/filtro.rkt")
(require typed/rackunit)

;; Cursos de prueba
(define curso1 (Curso "CE1106" "Paradigmas de Programacion" 4 3 (list "Ingenieria en Computadores") '()))
(define curso2 (Curso "CI1230" "Estructuras de Datos" 4 3 (list "Ingenieria en Computadores") '()))
(define curso3 (Curso "FS0210" "Fisica General" 3 1 (list "Ingenieria en Computadores") '()))

(define preferencias (Preferencias (list "CE1106" "CI1230") 12 18))

(define filtrados (filtrarCursosInteres (list curso1 curso2 curso3) preferencias))

(check-equal? (map Curso-codigo filtrados) (list "CE1106" "CI1230")
              "Deben quedar solo los cursos de interes, en el mismo orden del catalogo")

(check-false (cursoDeInteres curso3 preferencias) "Un curso que no esta en la lista de interes no debe marcarse como de interes")
(check-true (cursoDeInteres curso1 preferencias) "Un curso que si esta en la lista de interes debe marcarse como de interes")

(displayln "Todas las pruebas de filtro pasaron correctamente.")
