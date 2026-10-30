#lang typed/racket

(require "tipos.rkt")
(require racket/string)

(provide exportarCombinaciones exportarCombinacionesAArchivo)

;; Carrera de origen de un curso, se toma la primera carrera de la lista del curso.
(: carreraDeCurso (-> Curso String))
(define (carreraDeCurso curso)
  (define carreras (Curso-carreras curso))
  (cond
    [(null? carreras) ""]
    [else (car carreras)]))

;; Convierte una seleccion (curso y grupo escogido) a su representacion en JSON,
;; incluyendo la carrera de origen de ese curso especifico.
(: seleccionAJson (-> Seleccion String))
(define (seleccionAJson s)
  (define curso (Seleccion-curso s))
  (string-append "{\"curso\":\"" (Curso-codigo curso) "\","
                  "\"grupo\":" (number->string (Grupo-numero (Seleccion-grupo s))) ","
                  "\"carrera\":\"" (carreraDeCurso curso) "\"}"))

(: combinacionAJson (-> Combinacion String))
(define (combinacionAJson c)
  (define seleccionesJson (map seleccionAJson (Combinacion-selecciones c)))
  (string-append "{\"selecciones\":[" (string-join seleccionesJson ",") "],"
                  "\"creditos_totales\":" (number->string (Combinacion-creditos-totales c)) "}"))

;; Arma el JSON con todas las combinaciones, en el formato acordado para la salida.
(: exportarCombinaciones (-> (Listof Combinacion) String))
(define (exportarCombinaciones combinaciones)
  (string-append "{\"combinaciones\":["
                  (string-join (map combinacionAJson combinaciones) ",")
                  "]}"))

;; Escribe el JSON de las combinaciones directamente a un archivo.
(: exportarCombinacionesAArchivo (-> (Listof Combinacion) String Void))
(define (exportarCombinacionesAArchivo combinaciones ruta)
  (call-with-output-file ruta
    (lambda ([salida : Output-Port])
      (write-string (exportarCombinaciones combinaciones) salida)
      (void))
    #:exists 'replace))
