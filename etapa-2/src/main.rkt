#lang typed/racket

(require "parser.rkt")
(require "constantes.rkt")
(require "filtro.rkt")
(require "generador.rkt")
(require "streams.rkt")
(require "exportar.rkt")

;; Carga el catalogo real de la etapa 1 y las preferencias reales del estudiante.
(define catalogo (parse-catalogo RUTA-CATALOGO))
(define preferencias (parse-preferencias RUTA-PREFERENCIAS))

;; Deja solo los cursos y grupos de interes, genera las combinaciones validas de forma
;; perezosa, y exporta el resultado.
(define cursosDeInteres (filtrarCursosInteres catalogo preferencias))

(define combinaciones (todaLaLista (generarCombinacionesPerezoso cursosDeInteres)))

(displayln (string-append "Combinaciones validas encontradas: "
                           (number->string (length combinaciones))))

(exportarCombinacionesAArchivo combinaciones "../data/combinaciones_salida.json")

(displayln "Combinaciones exportadas a data/combinaciones_salida.json")
