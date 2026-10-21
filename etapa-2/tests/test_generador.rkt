#lang typed/racket

(require "../src/tipos.rkt")
(require "../src/generador.rkt")
(require typed/rackunit)

;; Dos cursos con dos grupos cada uno, armados para que algunas combinaciones choquen y otras no.
(define bloqueA1 (BloqueHorario "LUN" 700 900))
(define bloqueA2 (BloqueHorario "LUN" 900 1100))
(define bloqueB1 (BloqueHorario "LUN" 800 1000))
(define bloqueB2 (BloqueHorario "MAR" 800 1000))

(define grupoA1 (Grupo 1 (list bloqueA1)))
(define grupoA2 (Grupo 2 (list bloqueA2)))
(define grupoB1 (Grupo 1 (list bloqueB1)))
(define grupoB2 (Grupo 2 (list bloqueB2)))

(define cursoA (Curso "AAA" "Curso A" 3 1 (list "Ingenieria en Computadores") (list grupoA1 grupoA2) #f #t))
(define cursoB (Curso "BBB" "Curso B" 3 1 (list "Ingenieria en Computadores") (list grupoB1 grupoB2) #f #t))

;; Con dos cursos de dos grupos cada uno deben salir 4 combinaciones en total antes de filtrar.
(check-equal? (length (generarSelecciones (list cursoA cursoB))) 4
              "Deben existir 4 formas de combinar los grupos de los dos cursos")

;; Grupo A1 choca con B1 (mismo dia, se traslapan), A2 tambien choca con B1.
(define combos (generarCombinaciones (list cursoA cursoB)))

(check-equal? (length combos) 2 "Solo deben quedar las combinaciones sin choques")

(for ([c combos])
  (check-equal? (Combinacion-creditos-totales c) 6 "Cada combinacion valida debe sumar 6 creditos"))

(displayln "Todas las pruebas del generador pasaron correctamente.")
