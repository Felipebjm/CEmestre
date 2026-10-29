#lang typed/racket

(require "../src/tipos.rkt")
(require "../src/filtro.rkt")
(require typed/rackunit)


;; Preferencias para probar un rango de 12 a 18 creditos.
(define preferencias
  (Preferencias '() 12 18))


;; Combinaciones usadas en las pruebas.
(define combinacion0  (Combinacion '() 0))
(define combinacion11 (Combinacion '() 11))
(define combinacion12 (Combinacion '() 12))
(define combinacion13 (Combinacion '() 13))
(define combinacion15 (Combinacion '() 15))
(define combinacion17 (Combinacion '() 17))
(define combinacion18 (Combinacion '() 18))
(define combinacion19 (Combinacion '() 19))
(define combinacion30 (Combinacion '() 30))


;; ----------------------------------------
;; Pruebas del rango de creditos
;; ----------------------------------------

;; Debajo del minimo.
(check-false
 (combinacionEnRangoCreditos combinacion11 preferencias)
 "11 creditos no debe pasar")

;; Limite minimo.
(check-true
 (combinacionEnRangoCreditos combinacion12 preferencias)
 "12 creditos debe pasar")

;; Dentro del rango.
(check-true
 (combinacionEnRangoCreditos combinacion15 preferencias)
 "15 creditos debe pasar")

;; Limite maximo.
(check-true
 (combinacionEnRangoCreditos combinacion18 preferencias)
 "18 creditos debe pasar")

;; Encima del maximo.
(check-false
 (combinacionEnRangoCreditos combinacion19 preferencias)
 "19 creditos no debe pasar")

;; Valor muy por debajo.
(check-false
 (combinacionEnRangoCreditos combinacion0 preferencias)
 "0 creditos no debe pasar")

;; Valor muy por encima.
(check-false
 (combinacionEnRangoCreditos combinacion30 preferencias)
 "30 creditos no debe pasar")


;; ----------------------------------------
;; Pruebas con varias combinaciones
;; ----------------------------------------

(define combinaciones
  (list combinacion11
        combinacion12
        combinacion13
        combinacion15
        combinacion17
        combinacion18
        combinacion19))

(define resultado
  (filtrarCombinacionesPorCreditos combinaciones preferencias))

(check-equal?
 (map Combinacion-creditos-totales resultado)
 (list 12 13 15 17 18)
 "Deben quedar solo las combinaciones entre 12 y 18")


;; Lista vacia.
(check-equal?
 (filtrarCombinacionesPorCreditos '() preferencias)
 '()
 "Una lista vacia debe seguir vacia")


;; Ninguna combinacion cumple.
(check-equal?
 (filtrarCombinacionesPorCreditos
  (list combinacion0 combinacion11 combinacion19 combinacion30)
  preferencias)
 '()
 "No debe quedar ninguna combinacion")


;; Todas cumplen.
(check-equal?
 (map Combinacion-creditos-totales
      (filtrarCombinacionesPorCreditos
       (list combinacion12 combinacion15 combinacion18)
       preferencias))
 (list 12 15 18)
 "Deben quedar todas las combinaciones")


;; Se conserva el orden.
(check-equal?
 (map Combinacion-creditos-totales
      (filtrarCombinacionesPorCreditos
       (list combinacion18 combinacion13 combinacion12 combinacion15)
       preferencias))
 (list 18 13 12 15)
 "El filtro debe mantener el orden")


(displayln "Pruebas de creditos completadas.")


;; ----------------------------------------
;; Pruebas del polimorfismo
;; ----------------------------------------

;; Se prueba con numeros.
(check-equal?
 (filtrarPorCriterio
  (lambda ([n : Integer]) (> n 3))
  (list 1 2 3 4 5 6))
 (list 4 5 6)
 "Debe funcionar con Integer")


;; Se prueba con textos.
(check-equal?
 (filtrarPorCriterio
  (lambda ([texto : String])
    (> (string-length texto) 3))
  (list "C" "TEC" "Racket" "Java"))
 (list "Racket" "Java")
 "Debe funcionar con String")


;; Se prueba con booleanos.
(check-equal?
 (filtrarPorCriterio
  (lambda ([valor : Boolean]) valor)
  (list #t #f #t #f))
 (list #t #t)
 "Debe funcionar con Boolean")


;; Se prueba con combinaciones.
(check-equal?
 (map Combinacion-creditos-totales
      (filtrarPorCriterio
       (lambda ([c : Combinacion])
         (>= (Combinacion-creditos-totales c) 15))
       (list combinacion12 combinacion15 combinacion18)))
 (list 15 18)
 "Debe funcionar con Combinacion")


;; Lista vacia usando la funcion generica.
(check-equal?
 (filtrarPorCriterio
  (lambda ([n : Integer]) (> n 0))
  '())
 '()
 "Debe aceptar una lista vacia")


;; Criterio que acepta todos.
(check-equal?
 (filtrarPorCriterio
  (lambda ([n : Integer]) #t)
  (list 1 2 3))
 (list 1 2 3)
 "Debe poder aceptar todos los elementos")


;; Criterio que rechaza todos.
(check-equal?
 (filtrarPorCriterio
  (lambda ([n : Integer]) #f)
  (list 1 2 3))
 '()
 "Debe poder rechazar todos los elementos")


(displayln "Pruebas de polimorfismo completadas.")

(displayln "Todas las pruebas pasaron correctamente.")