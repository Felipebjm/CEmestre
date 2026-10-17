#lang typed/racket

(require "tipos.rkt")
(require "choques.rkt")
(require "streams.rkt")

(provide generarSelecciones combinacionTieneChoques creditosDe generarCombinaciones
         generarSeleccionesPerezoso generarCombinacionesPerezoso)

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
(: generarCombinaciones (-> (Listof Curso) (Listof Combinacion)))
(define (generarCombinaciones cursos)
  (define todas (generarSelecciones cursos))
  (define validas (filter (lambda ([s : (Listof Seleccion)]) (not (combinacionTieneChoques s))) todas))
  (map (lambda ([s : (Listof Seleccion)]) (Combinacion s (creditosDe s))) validas))

;; Version perezosa, no construye la lista completa de selecciones de una vez.
;; Cada combinacion se calcula solo cuando algo pide la siguiente, usando las listas
;; perezosas de streams.rkt.
(: generarSeleccionesPerezoso (-> (Listof Curso) (Lista-Perezosa (Listof Seleccion))))
(define (generarSeleccionesPerezoso cursos)
  (cond
    [(null? cursos) (Cons-Perezoso '() (delay 'vacia))]
    [else
     (define curso (car cursos))
     (define resto (cdr cursos))
     (concatMapPerezoso
      (lambda ([g : Grupo])
        (define seleccion (Seleccion curso g))
        (mapPerezoso (lambda ([r : (Listof Seleccion)]) (cons seleccion r))
                     (generarSeleccionesPerezoso resto)))
      (listaPerezosaDesdeLista (Curso-grupos curso)))]))

;; Igual que generarCombinaciones pero perezoso, se puede pedir solo las primeras combinaciones
;; sin que el resto se llegue a calcular.
(: generarCombinacionesPerezoso (-> (Listof Curso) (Lista-Perezosa Combinacion)))
(define (generarCombinacionesPerezoso cursos)
  (define selecciones-validas
    (filtrarPerezoso (lambda ([s : (Listof Seleccion)]) (not (combinacionTieneChoques s)))
                      (generarSeleccionesPerezoso cursos)))
  (mapPerezoso (lambda ([s : (Listof Seleccion)]) (Combinacion s (creditosDe s))) selecciones-validas))
