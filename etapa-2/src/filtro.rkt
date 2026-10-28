#lang typed/racket

(require "tipos.rkt")

(provide cursoDeInteres
         filtrarCursosInteres
         combinacionEnRangoCreditos
         filtrarCombinacionesPorCreditos)

;; Busca la preferencia de un curso especifico por su codigo, si existe.
(: buscarPreferenciaCurso (-> String (Listof PreferenciaCurso) (U False PreferenciaCurso)))
(define (buscarPreferenciaCurso codigo lista)
  (cond
    [(null? lista) #f]
    [(string=? codigo (PreferenciaCurso-codigo-curso (car lista))) (car lista)]
    [else (buscarPreferenciaCurso codigo (cdr lista))]))

;; Un curso es de interes si aparece en la lista de preferencias del estudiante.
(: cursoDeInteres (-> Curso Preferencias Boolean))
(define (cursoDeInteres curso preferencias)
  (if (buscarPreferenciaCurso (Curso-codigo curso) (Preferencias-cursos-interes preferencias)) #t #f))

;; Un numero de grupo es de interes si esta en la lista de grupos de interes,
;; o si esa lista viene vacia, en ese caso se toman todos los grupos del curso.
(: grupoDeInteres? (-> Integer (Listof Integer) Boolean))
(define (grupoDeInteres? numero gruposInteres)
  (or (null? gruposInteres)
      (ormap (lambda ([n : Integer]) (= n numero)) gruposInteres)))

;; Deja en un curso solo los grupos que el estudiante marco como de interes para ese curso.
(: limitarGruposDeInteres (-> Curso Preferencias Curso))
(define (limitarGruposDeInteres curso preferencias)
  (define preferencia (buscarPreferenciaCurso (Curso-codigo curso) (Preferencias-cursos-interes preferencias)))
  (cond
    [(not preferencia) curso]
    [else
     (define gruposInteres (PreferenciaCurso-grupos-interes preferencia))
     (struct-copy Curso curso
                   [grupos (filter (lambda ([g : Grupo]) (grupoDeInteres? (Grupo-numero g) gruposInteres))
                                    (Curso-grupos curso))])]))

;; Se queda solo con los cursos de interes del catalogo, y dentro de cada uno, solo con
;; los grupos que el estudiante tambien marco como de interes.
(: filtrarCursosInteres (-> (Listof Curso) Preferencias (Listof Curso)))
(define (filtrarCursosInteres cursos preferencias)
  (map (lambda ([c : Curso]) (limitarGruposDeInteres c preferencias))
       (filter (lambda ([c : Curso]) (cursoDeInteres c preferencias)) cursos)))

;; Revisa si los creditos de una combinacion estan dentro del rango indicado.
(: combinacionEnRangoCreditos (-> Combinacion Preferencias Boolean))
(define (combinacionEnRangoCreditos combinacion preferencias)
  (define creditos (Combinacion-creditos-totales combinacion))
  (and (>= creditos (Preferencias-creditos-min preferencias))
       (<= creditos (Preferencias-creditos-max preferencias))))

;; Deja solo las combinaciones que cumplen con el rango de creditos.
(: filtrarCombinacionesPorCreditos (-> (Listof Combinacion) Preferencias (Listof Combinacion)))
(define (filtrarCombinacionesPorCreditos combinaciones preferencias)
  (filter (lambda ([c : Combinacion])
            (combinacionEnRangoCreditos c preferencias))
          combinaciones))