#lang typed/racket

(provide
 RUTA-CATALOGO
 RUTA-PREFERENCIAS)

(: RUTA-CATALOGO String)
(define RUTA-CATALOGO "data/contracts/catalogo_salida.json")

(: RUTA-PREFERENCIAS String)
(define RUTA-PREFERENCIAS "etapa-2/data/preferencias.json")