#lang typed/racket

(require "tipos.rkt")
(require "filtro.rkt")
(require "generador.rkt")
(require "streams.rkt")
(require "exportar.rkt")

;; Este main todavia usa un catalogo armado a mano, porque la carga real del catalogo
;; de Felipe (lectura.rkt) no esta lista. Cuando ese archivo este listo, aqui se cambia
;; el catalogo de prueba por la lectura real del catalogo y las preferencias.

(define bloqueCE1 (BloqueHorario "LUN" 700 900))
(define bloqueCE2 (BloqueHorario "MAR" 700 900))
(define grupoCE1 (Grupo 1 (list bloqueCE1)))
(define grupoCE2 (Grupo 2 (list bloqueCE2)))
(define cursoCE1106
  (Curso "CE1106" "Paradigmas de Programacion" 4 3 (list "Ingenieria en Computadores")
         (list grupoCE1 grupoCE2)))

(define bloqueCI1 (BloqueHorario "LUN" 800 1000))
(define bloqueCI2 (BloqueHorario "MIE" 800 1000))
(define grupoCI1 (Grupo 1 (list bloqueCI1)))
(define grupoCI2 (Grupo 3 (list bloqueCI2)))
(define cursoCI1230
  (Curso "CI1230" "Estructuras de Datos" 4 3 (list "Ingenieria en Computadores")
         (list grupoCI1 grupoCI2)))

(define catalogoDePrueba (list cursoCE1106 cursoCI1230))

(define preferenciasDePrueba (Preferencias (list "CE1106" "CI1230") 12 18))

(define cursosDeInteres (filtrarCursosInteres catalogoDePrueba preferenciasDePrueba))

(define combinaciones (todaLaLista (generarCombinacionesPerezoso cursosDeInteres)))

(displayln (string-append "Combinaciones validas encontradas: "
                           (number->string (length combinaciones))))

(exportarCombinacionesAArchivo combinaciones "data/combinaciones_salida.json")

(displayln "Combinaciones exportadas a data/combinaciones_salida.json")
