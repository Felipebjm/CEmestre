#lang typed/racket

(require json)
(require "tipos.rkt")

;Conversor 
(: hora->entero (String -> Integer))
(define (hora->entero hora)
  (assert
   (string->number (string-replace hora ":" ""))
   exact-integer?))







