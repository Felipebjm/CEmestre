#lang typed/racket

(require typed/json)
(require racket/string)
(require "tipos.rkt")

(provide hora->entero
         parse-bloque
         parse-grupo
         parse-curso
         parse-catalogo
         parse-preferencia-curso
         parse-preferencias)

;; Convierte una hora por ejemplo 09:30 a 930
(: hora->entero (-> String Integer))
(define (hora->entero hora)
  (define hora-sin-dos-puntos
    (string-replace hora ":" ""))

  (define resultado (string->number hora-sin-dos-puntos))

  (if (and (exact-integer? resultado)
           (= (string-length hora) 5)
           (char=? (string-ref hora 2) #\:))
      resultado
      (error 'hora->entero "Formato de hora invalido: ~a" hora)))


(: parse-bloque (-> Any BloqueHorario))
(define (parse-bloque b)
  (define h (cast b HashTableTop))

  (BloqueHorario
   (cast (hash-ref h 'dia) String)
   (hora->entero
    (cast (hash-ref h 'inicio) String))
   (hora->entero
    (cast (hash-ref h 'fin) String))))


(: parse-grupo (-> Any Grupo))
(define (parse-grupo g)
  (define h (cast g HashTableTop))
  (Grupo
   (cast (hash-ref h 'numeroGrupo) Integer)
   (map parse-bloque
        (cast (hash-ref h 'horario) (Listof Any)))))


(: parse-curso (-> Any Curso))
(define (parse-curso c)
  (define h (cast c HashTableTop))

  (Curso
 (cast (hash-ref h 'codigo) String)
 (cast (hash-ref h 'nombre) String)
 (cast (hash-ref h 'creditos) Integer)
 0
 (cast (hash-ref h 'carreras) (Listof String))
 (map parse-grupo (cast (hash-ref h 'grupos) (Listof Any)))
 (cast (hash-ref h 'tieneChoque) Boolean)
 (cast (hash-ref h 'puedeMatricular) Boolean)))


;; Parsea todo el catalogo
(: parse-catalogo (-> String (Listof Curso)))
(define (parse-catalogo ruta)
  (define root (call-with-input-file ruta read-json))

  (define h (cast root HashTableTop))

  (map parse-curso (cast (hash-ref h 'catalogo) (Listof Any))))


;; Parsea una preferencia de curso
(: parse-preferencia-curso (-> Any PreferenciaCurso))
(define (parse-preferencia-curso pc)
  (define h (cast pc HashTableTop))

  (PreferenciaCurso
   (cast (hash-ref h 'codigo_curso) String)
   (map (lambda ([x : Any])(cast x Integer))
      (cast (hash-ref h 'grupos_interes) (Listof Any)))))


;; Parsea las preferencias completas
(: parse-preferencias (-> String Preferencias))
(define (parse-preferencias ruta)
  (define root (call-with-input-file ruta read-json))

  (define h (cast root HashTableTop))

  (Preferencias
   (map parse-preferencia-curso (cast (hash-ref h 'cursos_interes) (Listof Any)))
   (cast (hash-ref h 'creditos_minimos) Integer)
   (cast (hash-ref h 'creditos_maximos) Integer)))
