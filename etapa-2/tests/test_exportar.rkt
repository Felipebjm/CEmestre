#lang typed/racket

(require "../src/tipos.rkt")
(require "../src/exportar.rkt")
(require racket/string)
(require typed/rackunit)

(define bloque (BloqueHorario "LUN" 700 900))

;; Curso que pertenece a una sola carrera.
(define grupoA (Grupo 1 (list bloque)))
(define cursoA (Curso "CE1106" "Paradigmas de Programacion" 4 3 (list "Ingenieria en Computadores") (list grupoA) #f #t))
(define seleccionA (Seleccion cursoA grupoA))

;; Curso compartido entre dos carreras, no se duplica, se exporta con las dos carreras en una lista.
(define grupoB (Grupo 2 (list bloque)))
(define cursoB (Curso "FI1101" "Fisica General I" 3 2 (list "Ingenieria en Computadores" "Ingenieria en Materiales") (list grupoB) #f #t))
(define seleccionB (Seleccion cursoB grupoB))

(define combinacion (Combinacion (list seleccionA seleccionB) 7))

(define json (exportarCombinaciones (list combinacion)))

(check-true (string-contains? json "\"curso\":\"CE1106\"") "Debe incluir el codigo del curso")
(check-true (string-contains? json "\"grupo\":1") "Debe incluir el numero de grupo")
(check-true (string-contains? json "\"creditos_totales\":7") "Debe incluir los creditos totales")
(check-true (string-contains? json "\"carreras\":[\"Ingenieria en Computadores\"]")
            "Un curso de una sola carrera debe exportar una lista de un elemento")
(check-true (string-contains? json "\"carreras\":[\"Ingenieria en Computadores\",\"Ingenieria en Materiales\"]")
            "Un curso compartido debe exportar las dos carreras en la misma entrada, sin duplicar el curso")

(check-equal? (exportarCombinaciones '()) "{\"combinaciones\":[]}" "Una lista vacia debe exportar un arreglo vacio")

(displayln "Todas las pruebas de exportacion pasaron correctamente.")
