#lang typed/racket

(require "../src/tipos.rkt")
(require "../src/exportar.rkt")
(require racket/string)
(require typed/rackunit)

(define bloque (BloqueHorario "LUN" 700 900))
(define grupo (Grupo 1 (list bloque)))
(define curso (Curso "CE1106" "Paradigmas de Programacion" 4 3 (list "Ingenieria en Computadores") (list grupo)))
(define seleccion (Seleccion curso grupo))
(define combinacion (Combinacion (list seleccion) 4))

(define json (exportarCombinaciones (list combinacion)))

(check-true (string-contains? json "\"curso\":\"CE1106\"") "Debe incluir el codigo del curso")
(check-true (string-contains? json "\"grupo\":1") "Debe incluir el numero de grupo")
(check-true (string-contains? json "\"creditos_totales\":4") "Debe incluir los creditos totales")
(check-true (string-contains? json "\"carrera\":\"Ingenieria en Computadores\"") "Debe incluir la carrera de origen")

(check-equal? (exportarCombinaciones '()) "{\"combinaciones\":[]}" "Una lista vacia debe exportar un arreglo vacio")

(displayln "Todas las pruebas de exportacion pasaron correctamente.")
