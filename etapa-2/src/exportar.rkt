#lang typed/racket

(require "tipos.rkt")
(require racket/string)

(provide exportarCombinaciones
         exportarCombinacionesAArchivo)

;; Convierte una lista de carreras a formato JSON.
(: carrerasAJson (-> (Listof String) String))
(define (carrerasAJson carreras)
  (string-append
   "["
   (string-join
    (map (lambda ([c : String])
           (string-append "\"" c "\""))
         carreras)
    ",")
   "]"))

;; Convierte una seleccion (curso y grupo escogido) a su representacion en JSON,
(: seleccionAJson (-> Seleccion String))
(define (seleccionAJson s)
  (define curso (Seleccion-curso s))

  (string-append
   "{\"curso\":\""
   (Curso-codigo curso)
   "\","

   "\"grupo\":"
   (number->string
    (Grupo-numero
     (Seleccion-grupo s)))

   ","

   "\"carreras\":"
   (carrerasAJson
    (Curso-carreras curso))

   "}"))

(: combinacionAJson (-> Combinacion String))
(define (combinacionAJson c)
  (define seleccionesJson
    (map seleccionAJson
         (Combinacion-selecciones c)))

  (string-append
   "{\"selecciones\":["
   (string-join seleccionesJson ",")
   "],"

   "\"creditos_totales\":"
   (number->string
    (Combinacion-creditos-totales c))

   "}"))

;; Arma el JSON con todas las combinaciones.
(: exportarCombinaciones (-> (Listof Combinacion) String))
(define (exportarCombinaciones combinaciones)
  (string-append
   "{\"combinaciones\":["
   (string-join
    (map combinacionAJson combinaciones)
    ",")
   "]}"))

;; Escribe el JSON a un archivo.
(: exportarCombinacionesAArchivo
   (-> (Listof Combinacion) String Void))
(define (exportarCombinacionesAArchivo combinaciones ruta)
  (call-with-output-file ruta
    (lambda ([salida : Output-Port])
      (write-string
       (exportarCombinaciones combinaciones)
       salida)
      (void))
    #:exists 'replace))
