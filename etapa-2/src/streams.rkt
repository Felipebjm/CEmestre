#lang typed/racket

(provide (struct-out Cons-Perezoso)
         Lista-Perezosa
         vacia?
         listaPerezosaDesdeLista
         apendPerezoso
         mapPerezoso
         concatMapPerezoso
         filtrarPerezoso
         primerosN
         todaLaLista)

;; Lista perezosa generica, cada cola se calcula solo cuando se necesita, usando delay y force.
(struct (A) Cons-Perezoso ([cabeza : A] [cola : (Promise (Lista-Perezosa A))]))
(define-type (Lista-Perezosa A) (U 'vacia (Cons-Perezoso A)))

(: vacia? (All (A) (-> (Lista-Perezosa A) Boolean)))
(define (vacia? lp) (eq? lp 'vacia))

;; Convierte una lista normal y pequena, como los grupos de un curso, en una lista perezosa.
(: listaPerezosaDesdeLista (All (A) (-> (Listof A) (Lista-Perezosa A))))
(define (listaPerezosaDesdeLista xs)
  (cond
    [(null? xs) 'vacia]
    [else (Cons-Perezoso (car xs) (delay (listaPerezosaDesdeLista (cdr xs))))]))

;; Pega dos listas perezosas, la segunda se calcula hasta que la primera se agota.
(: apendPerezoso (All (A) (-> (Lista-Perezosa A) (-> (Lista-Perezosa A)) (Lista-Perezosa A))))
(define (apendPerezoso izquierda generarDerecha)
  (cond
    [(eq? izquierda 'vacia) (generarDerecha)]
    [else
     (Cons-Perezoso (Cons-Perezoso-cabeza izquierda)
                     (delay (apendPerezoso (force (Cons-Perezoso-cola izquierda)) generarDerecha)))]))

(: mapPerezoso (All (A B) (-> (-> A B) (Lista-Perezosa A) (Lista-Perezosa B))))
(define (mapPerezoso f lp)
  (cond
    [(eq? lp 'vacia) 'vacia]
    [else
     (Cons-Perezoso (f (Cons-Perezoso-cabeza lp))
                     (delay (mapPerezoso f (force (Cons-Perezoso-cola lp)))))]))

;; Aplica f a cada elemento (f devuelve otra lista perezosa) y las va pegando una tras otra.
(: concatMapPerezoso (All (A B) (-> (-> A (Lista-Perezosa B)) (Lista-Perezosa A) (Lista-Perezosa B))))
(define (concatMapPerezoso f lp)
  (cond
    [(eq? lp 'vacia) 'vacia]
    [else
     (apendPerezoso (f (Cons-Perezoso-cabeza lp))
                     (lambda () (concatMapPerezoso f (force (Cons-Perezoso-cola lp)))))]))

(: filtrarPerezoso (All (A) (-> (-> A Boolean) (Lista-Perezosa A) (Lista-Perezosa A))))
(define (filtrarPerezoso pred lp)
  (cond
    [(eq? lp 'vacia) 'vacia]
    [(pred (Cons-Perezoso-cabeza lp))
     (Cons-Perezoso (Cons-Perezoso-cabeza lp)
                     (delay (filtrarPerezoso pred (force (Cons-Perezoso-cola lp)))))]
    [else (filtrarPerezoso pred (force (Cons-Perezoso-cola lp)))]))

;; Saca los primeros n elementos de una lista perezosa, sin forzar el resto.
(: primerosN (All (A) (-> Integer (Lista-Perezosa A) (Listof A))))
(define (primerosN n lp)
  (cond
    [(or (<= n 0) (eq? lp 'vacia)) '()]
    [else (cons (Cons-Perezoso-cabeza lp)
                (primerosN (- n 1) (force (Cons-Perezoso-cola lp))))]))

;; Convierte toda la lista perezosa a una lista normal, para pruebas o para exportar al final.
(: todaLaLista (All (A) (-> (Lista-Perezosa A) (Listof A))))
(define (todaLaLista lp)
  (cond
    [(eq? lp 'vacia) '()]
    [else (cons (Cons-Perezoso-cabeza lp) (todaLaLista (force (Cons-Perezoso-cola lp))))]))
