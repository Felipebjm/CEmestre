#lang typed/racket

(require "tipos.rkt")
(require "choques.rkt")

(provide generarSelecciones combinacionTieneChoques creditosDe generarCombinaciones)

;; Genera todas las formas posibles de escoger un grupo para cada curso de la lista,
;; sin descartar todavia las que tienen choques entre si.
(: generarSelecciones (-> (Listof Curso) (Listof (Listof Seleccion))))
(define (generarSelecciones cursos)
  (cond
    [(null? cursos) (list '())]
    [else
     (define curso (car cursos))
     (define resto-combinado (generarSelecciones (cdr cursos)))
     (apply append
            (map (lambda ([g : Grupo])
                   (define seleccion (Seleccion curso g))
                   (map (lambda ([resto : (Listof Seleccion)])
                          (cons seleccion resto))
                        resto-combinado))
                 (Curso-grupos curso)))]))

;; Revisa si entre las selecciones de una combinacion hay algun par de grupos que chocan.
(: combinacionTieneChoques (-> (Listof Seleccion) Boolean))
(define (combinacionTieneChoques selecciones)
  (cond
    [(null? selecciones) #f]
    [else
     (define primera (car selecciones))
     (define resto (cdr selecciones))
     (or (ormap (lambda ([otra : Seleccion])
                  (gruposChocan (Seleccion-grupo primera) (Seleccion-grupo otra)))
                resto)
         (combinacionTieneChoques resto))]))

;; Suma los creditos de los cursos de una lista de selecciones.
(: creditosDe (-> (Listof Seleccion) Integer))
(define (creditosDe selecciones)
  (apply + (map (lambda ([s : Seleccion]) (Curso-creditos (Seleccion-curso s))) selecciones)))

;; Primera version, genera todas las combinaciones y luego descarta las que tienen choques.
;; Mas adelante esto se convierte a streams para no construir la lista completa de una vez.
(: generarCombinaciones (-> (Listof Curso) (Listof Combinacion)))
(define (generarCombinaciones cursos)
  (define todas (generarSelecciones cursos))
  (define validas (filter (lambda ([s : (Listof Seleccion)]) (not (combinacionTieneChoques s))) todas))
  (map (lambda ([s : (Listof Seleccion)]) (Combinacion s (creditosDe s))) validas))
