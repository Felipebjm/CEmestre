#lang typed/racket

(provide
 RUTA-CATALOGO
 RUTA-PREFERENCIAS)

(: RUTA-CATALOGO String)
(define RUTA-CATALOGO "../../data/contracts/catalogo_salido.json")

(: RUTA-PREFERENCIAS String)
(define RUTA-PREFERENCIAS "../data/preferencias.json")