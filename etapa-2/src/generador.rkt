#lang typed/racket

(require "tipos.rkt")
(require "choques.rkt")
(require "streams.rkt")

(provide  combinacionTieneChoques creditosDe 
         generarSeleccionesPerezoso generarCombinacionesPerezoso)


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


(: generarCombinacionesPerezoso (-> (Listof Curso) (Lista-Perezosa Combinacion)))
(define (generarCombinacionesPerezoso cursos)
  (define selecciones-validas
    (filtrarPerezoso (lambda ([s : (Listof Seleccion)]) (not (combinacionTieneChoques s)))
                      (generarSeleccionesPerezoso cursos)))
  (mapPerezoso (lambda ([s : (Listof Seleccion)]) (Combinacion s (creditosDe s))) selecciones-validas))
