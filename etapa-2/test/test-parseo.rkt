#lang typed/racket

(require "../src/parser.rkt")
(require "../src/constantes.rkt")


(displayln "CATALOGO")
(displayln "------------------")

(define catalogo
  (parse-catalogo RUTA-CATALOGO))

(for ([curso (in-list catalogo)])
  (displayln curso))

(newline)

(displayln "PREFERENCIAS")
(displayln "------------------")

(define preferencias
  (parse-preferencias RUTA-PREFERENCIAS))

(displayln preferencias)