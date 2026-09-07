#ifndef CONSTANTES_H
#define CONSTANTES_H

/*
 * Todas las constantes del proyecto viven aquí (requisito de la rúbrica:
 * "Se evaluará que todas las constantes estén en un archivo aparte").
 * Ajustar estos valores según el tamaño real del catálogo recolectado.
 */

/* Límites de tamaño */
#define MAX_CURSOS          60   /* primeros 4 semestres x 2 carreras */
#define MAX_GRUPOS_POR_CURSO 5
#define MAX_BLOQUES_HORARIO  4   /* bloques día/hora por grupo */
#define MAX_REQUISITOS       5
#define MAX_CORREQUISITOS    3
#define MAX_HISTORIAL        40  /* cursos aprobados por el estudiante */

/* Longitudes de cadenas (incluye espacio para '\0') */
#define LEN_CODIGO    10
#define LEN_NOMBRE    80
#define LEN_PROFESOR  60
#define LEN_CARRERA   60

/* Días de la semana usados en los horarios */
#define MAX_DIA       4   /* "LUN", "MAR", ... */

/* Archivos por defecto (pueden sobreescribirse por argumentos de línea de comandos) */
#define ARCHIVO_CATALOGO_ENTRADA   "../data/clean/catalogo_entrada.json"
#define ARCHIVO_HISTORIAL_ENTRADA  "../data/student_history/historial.json"
#define ARCHIVO_CATALOGO_SALIDA    "../data/contracts/catalogo_salido.json"

#endif /* CONSTANTES_H */
