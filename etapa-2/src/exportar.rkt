#lang typed/racket

(require "tipos.rkt")
(require racket/string)

(provide exportarCombinaciones exportarCombinacionesAArchivo)

;; Convierte una seleccion (curso y grupo escogido) a su representacion en JSON.
(: seleccionAJson (-> Seleccion String))
(define (seleccionAJson s)
  (string-append "{\"curso\":\"" (Curso-codigo (Seleccion-curso s)) "\","
                  "\"grupo\":" (number->string (Grupo-numero (Seleccion-grupo s))) "}"))

;; Carrera de origen de una combinacion, por ahora se toma del primer curso seleccionado.
(: carreraDeCombinacion (-> Combinacion String))
(define (carreraDeCombinacion c)
  (define selecciones (Combinacion-selecciones c))
  (cond
    [(null? selecciones) ""]
    [else
     (define carreras (Curso-carreras (Seleccion-curso (car selecciones))))
     (cond
       [(null? carreras) ""]
       [else (car carreras)])]))

(: combinacionAJson (-> Combinacion String))
(define (combinacionAJson c)
  (define seleccionesJson (map seleccionAJson (Combinacion-selecciones c)))
  (string-append "{\"selecciones\":[" (string-join seleccionesJson ",") "],"
                  "\"creditos_totales\":" (number->string (Combinacion-creditos-totales c)) ","
                  "\"carrera\":\"" (carreraDeCombinacion c) "\"}"))

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
