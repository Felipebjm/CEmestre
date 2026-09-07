# Etapa 1 — Módulo en C (paradigma imperativo)

## Arquitectura del proyecto

```
etapa-1/
├── include/          # Headers: constantes.h + structs.h + un .h por módulo
├── src/               # Un .c por responsabilidad (ver división del equipo)
├── build/             # Archivos objeto (.o), generados por el Makefile
├── tests/             # Casos de prueba manuales / catálogos de ejemplo
└── Makefile
```

División de responsabilidades:

| Módulo | Archivo | Responsable |
|---|---|---|
| Carga de catálogo | `src/catalogo.c` | Felipe |
| Carga de historial del estudiante | `src/historial.c` | Felipe |
| Detección de choques de horario | `src/horario.c` | Neto |
| Exportación a JSON | `src/exportar.c` | Neto |
| Validación de requisitos/correquisitos | `src/requisitos.c` | Luis |

## Decisiones de diseño

_(completar conforme el equipo tome decisiones concretas — ejemplos con los planes de estudio reales, casos límite encontrados, etc. Ver puntos 2.2.1 y 2.2.2 del enunciado)._

## Formato de salida

Se eligió **JSON** como formato de serialización, principalmente porque la Etapa 2 (Racket) puede leerlo directamente con la librería `racket/json` sin necesidad de un parser propio, y porque maneja de forma natural los campos que son listas (varios grupos/horarios por curso, varios requisitos). Ver el contrato de ejemplo en [`../data/contracts/output_ejemplo_c.json`](../data/contracts/output_ejemplo_c.json).

Del lado de C se usa la librería [cJSON](https://github.com/DaveGamble/cJSON) para serializar.

## Estructuras de datos

Ver [`include/structs.h`](./include/structs.h): `Curso`, `Grupo`, `BloqueHorario`, `Catalogo`, `HistorialEstudiante`. Todas las constantes de tamaño están centralizadas en [`include/constantes.h`](./include/constantes.h).

## Compilar y ejecutar

```
cd etapa-1
make
./cemestre_etapa1 <catalogo_entrada.json> <historial.json> <catalogo_salida.json>
```
