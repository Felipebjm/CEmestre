#lang typed/racket

(require "../src/tipos.rkt")
(require "../src/filtro.rkt")
(require typed/rackunit)

(define bloque (BloqueHorario "LUN" 700 900))

;; Curso con dos grupos, el estudiante solo esta interesado en el grupo 1.
(define grupoA1 (Grupo 1 (list bloque)))
(define grupoA2 (Grupo 2 (list bloque)))
(define cursoA (Curso "AAA" "Curso A" 3 1 (list "Ingenieria en Computadores") (list grupoA1 grupoA2) #f #t))

;; Curso con dos grupos, sin grupos de interes especificados, deben quedar todos.
(define grupoB1 (Grupo 1 (list bloque)))
(define grupoB2 (Grupo 2 (list bloque)))
(define cursoB (Curso "BBB" "Curso B" 3 1 (list "Ingenieria en Computadores") (list grupoB1 grupoB2) #f #t))

;; Curso que no esta en la lista de interes.
(define cursoC (Curso "CCC" "Curso C" 3 1 (list "Ingenieria en Computadores") (list grupoA1) #f #t))

(define preferencias
  (Preferencias (list (PreferenciaCurso "AAA" (list 1))
                       (PreferenciaCurso "BBB" '()))
                12 18))

(define filtrados (filtrarCursosInteres (list cursoA cursoB cursoC) preferencias))

(check-equal? (map Curso-codigo filtrados) (list "AAA" "BBB")
              "Solo deben quedar los cursos de interes, CCC debe quedar afuera")

(check-equal? (map Grupo-numero (Curso-grupos (car filtrados))) (list 1)
              "De AAA solo debe quedar el grupo de interes")

(check-equal? (map Grupo-numero (Curso-grupos (cadr filtrados))) (list 1 2)
              "De BBB deben quedar todos los grupos porque no se especificaron grupos de interes")

(check-false (cursoDeInteres cursoC preferencias) "CCC no debe marcarse como de interes")
(check-true (cursoDeInteres cursoA preferencias) "AAA si debe marcarse como de interes")

(displayln "Todas las pruebas de filtro pasaron correctamente.")
