# Etapa 1 — Módulo en C (paradigma imperativo)

## Arquitectura del proyecto

```
etapa-1/
├── include/  # Headers: constantes.h + structs.h + un .h por módulo
├── src/      # Un .c por responsabilidad (ver división del equipo)
├── build/    # Archivos objeto (.o), generados por el Makefile
├── tests/    # Casos de prueba manuales / catálogos de ejemplo
└── Makefile.mk
```

División de responsabilidades:

| Módulo                                 | Archivo              | Responsable |
|----------------------------------------|----------------------|-------------|
| Carga de catálogo                      | `src/catalogo.c`     | Felipe      |
| Carga de historial del estudiante      | `src/historial.c`    | Felipe      |
| Detección de choques de horario        | `src/horario.c`      | Neto        |
| Exportación a JSON                     | `src/exportar.c`     | Neto        |
| Validación de requisitos/correquisitos | `src/requisitos.c`   | Luis        |

## Decisiones de diseño
### Justificación de decisiones
- Se decidió que el archivo con el historial del estudiante tuviera el formato .txt y que contuviera unicamente los códigos de los cursos. Esto se hizo así para poder procesar los datos con mayor facilidad.
- El archivo de catálogo es un JSON debido a que se consideró que permite almacenar los datos de los cursos de una forma más natural. Otro factor que influyó en la decisión, fue que se tenía más experiencia trabajando con este formato.
- Pase a la mayor facilidad de parseo, se descartó que el archivo catálogo fuese un .cvs ya que datos como los horarios o grupos de un curso, no se iban a representar de forma natural.
### Caso límite real
- Se detectaron varios cursos del plan de estudios sin un grupo ofertado (ej. CI0205, SE1100, FH1000), se representaron con cantidadGrupos = 0.

## Formato de salida

Se eligió **JSON** como formato de serialización, principalmente porque la Etapa 2 (Racket) puede leerlo directamente con la librería `racket/json` sin necesidad de un parser propio, y porque maneja de forma natural los campos que son listas (varios grupos/horarios por curso, varios requisitos). Ver el contrato de ejemplo en [`../data/contracts/output_ejemplo_c.json`](../data/contracts/output_ejemplo_c.json).

Del lado de C se usa la librería [cJSON](https://github.com/DaveGamble/cJSON) para serializar.

## Estructuras de datos

Ver [`include/structs.h`](./include/structs.h): `Curso`, `Grupo`, `Horario`, `Catalogo`, `CursoAprobado`. Todas las constantes de tamaño están centralizadas en [`include/constantes.h`](./include/constantes.h).

<img width="699" height="667" alt="structs" src="https://github.com/user-attachments/assets/02bc6195-bb02-4567-87dd-901d46497098" />

## Compilar y ejecutar

```
cd etapa-1
make -f Makefile.mk
./cemestre_etapa1
```

Los argumentos son opcionales. Si no se pasan, el programa usa las rutas por defecto definidas en `include/constantes.h`. También se puede indicar explícitamente

```
./cemestre_etapa1 <catalogo_entrada.json> <historial.json> <catalogo_salida.json>
```
