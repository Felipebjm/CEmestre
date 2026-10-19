#lang typed/racket

(require "tipos.rkt")

(provide bloquesChocan gruposChocan)

;; Dos bloques de horario chocan si caen el mismo dia y sus rangos de hora se traslapan.
(: bloquesChocan (-> BloqueHorario BloqueHorario Boolean))
(define (bloquesChocan a b)
  (and (string=? (BloqueHorario-dia a) (BloqueHorario-dia b))
       (< (BloqueHorario-inicio a) (BloqueHorario-fin b))
       (< (BloqueHorario-inicio b) (BloqueHorario-fin a))))

;; Dos grupos chocan si existe al menos un par de bloques entre ambos que chocan entre si.
(: gruposChocan (-> Grupo Grupo Boolean))
(define (gruposChocan g1 g2)
  (for/or ([b1 (in-list (Grupo-horario g1))])
    (for/or ([b2 (in-list (Grupo-horario g2))])
      (bloquesChocan b1 b2))))
