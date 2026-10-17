#lang typed/racket

(require "../src/tipos.rkt")
(require "../src/choques.rkt")
(require typed/rackunit)

;; Bloques de prueba
(define bloqueA (BloqueHorario "LUN" 730 1020))
(define bloqueB (BloqueHorario "LUN" 930 1220))
(define bloqueC (BloqueHorario "MAR" 730 1020))
(define bloqueD (BloqueHorario "LUN" 1020 1320))

(check-true (bloquesChocan bloqueA bloqueB) "Bloques que se traslapan en el mismo dia")
(check-false (bloquesChocan bloqueA bloqueC) "Bloques en dias distintos no chocan")
(check-false (bloquesChocan bloqueA bloqueD) "Un bloque que empieza justo cuando el otro termina no choca")

;; Grupos de prueba
(define grupo1 (Grupo 1 (list bloqueA)))
(define grupo2 (Grupo 2 (list bloqueB)))
(define grupo3 (Grupo 3 (list bloqueC)))
(define grupo4 (Grupo 4 (list bloqueD)))
(define grupo5 (Grupo 5 (list bloqueC bloqueB)))

(check-true (gruposChocan grupo1 grupo2) "Grupos con un bloque que choca")
(check-false (gruposChocan grupo1 grupo3) "Grupos en dias distintos")
(check-false (gruposChocan grupo1 grupo4) "Grupos consecutivos sin traslape")
(check-true (gruposChocan grupo1 grupo5) "Grupo con varios bloques, uno de ellos choca")

(displayln "Todas las pruebas de choques pasaron correctamente.")
