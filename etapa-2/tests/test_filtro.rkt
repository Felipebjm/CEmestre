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


;; Pruebas del rango de creditos.

(define combinacion10 (Combinacion '() 10))
(define combinacion12 (Combinacion '() 12))
(define combinacion15 (Combinacion '() 15))
(define combinacion18 (Combinacion '() 18))
(define combinacion20 (Combinacion '() 20))

(check-false (combinacionEnRangoCreditos combinacion10 preferencias)
             "10 creditos esta por debajo del minimo")

(check-true (combinacionEnRangoCreditos combinacion12 preferencias)
            "12 creditos debe aceptarse")

(check-true (combinacionEnRangoCreditos combinacion15 preferencias)
            "15 creditos debe aceptarse")

(check-true (combinacionEnRangoCreditos combinacion18 preferencias)
            "18 creditos debe aceptarse")

(check-false (combinacionEnRangoCreditos combinacion20 preferencias)
             "20 creditos esta por encima del maximo")

(define combinacionesFiltradas
  (filtrarCombinacionesPorCreditos
   (list combinacion10 combinacion12 combinacion15 combinacion18 combinacion20)
   preferencias))

(check-equal? (map Combinacion-creditos-totales combinacionesFiltradas)
              (list 12 15 18)
              "Solo deben quedar las combinaciones entre 12 y 18 creditos")

(displayln "Las pruebas de creditos pasaron correctamente.")