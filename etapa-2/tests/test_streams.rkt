#lang typed/racket

(require "../src/tipos.rkt")
(require "../src/generador.rkt")
(require "../src/streams.rkt")
(require typed/rackunit)

(define bloqueA1 (BloqueHorario "LUN" 700 900))
(define bloqueA2 (BloqueHorario "LUN" 900 1100))
(define bloqueB1 (BloqueHorario "LUN" 800 1000))
(define bloqueB2 (BloqueHorario "MAR" 800 1000))

(define grupoA1 (Grupo 1 (list bloqueA1)))
(define grupoA2 (Grupo 2 (list bloqueA2)))
(define grupoB1 (Grupo 1 (list bloqueB1)))
(define grupoB2 (Grupo 2 (list bloqueB2)))

(define cursoA (Curso "AAA" "Curso A" 3 1 (list "Ingenieria en Computadores") (list grupoA1 grupoA2)))
(define cursoB (Curso "BBB" "Curso B" 3 1 (list "Ingenieria en Computadores") (list grupoB1 grupoB2)))

;; La version perezosa debe dar las mismas combinaciones validas que la version con listas normales.
(define combosLista (generarCombinaciones (list cursoA cursoB)))
(define combosPerezosos (todaLaLista (generarCombinacionesPerezoso (list cursoA cursoB))))

(check-equal? (length combosPerezosos) (length combosLista)
              "La version perezosa debe dar la misma cantidad de combinaciones validas")

(check-equal? (map Combinacion-creditos-totales combosPerezosos)
              (map Combinacion-creditos-totales combosLista)
              "Los creditos totales de cada combinacion deben coincidir en ambas versiones")

;; Pedir solo la primera combinacion no deberia tronar ni necesitar calcular todo lo demas.
(define primera (primerosN 1 (generarCombinacionesPerezoso (list cursoA cursoB))))
(check-equal? (length primera) 1 "Se debe poder pedir solo la primera combinacion de la lista perezosa")

(displayln "Todas las pruebas de la version perezosa pasaron correctamente.")
