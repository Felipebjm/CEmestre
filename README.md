# CEmestre — Constructor de horarios

Proyecto del curso **Paradigmas de Programación (CE1106)**, Instituto Tecnológico de Costa Rica.

Sistema construido en 4 etapas a lo largo del semestre, una por cada paradigma de programación visto en el curso. Cada etapa es un programa **independiente** que lee y escribe archivos — el sistema completo NO es un único ejecutable.

| Etapa | Carpeta | Lenguaje | Funcionalidad |
|---|---|---|---|
| 1 | [`etapa-1/`](./etapa-1) | C | Construye el catálogo de cursos y calcula choques de horario y elegibilidad según requisitos. |
| 2 | `etapa-2/` | Racket | Genera y filtra combinaciones posibles de horario a partir del catálogo validado. |
| 3 | `etapa-3/` | Prolog | Aplica reglas de restricción (créditos máximos, compatibilidades). |
| 4 | `etapa-4/` | Java | Integra el resultado final y lo presenta al usuario. |

## Carreras trabajadas

- Ingeniería en Computadores (obligatoria)
- Ingeniería en Materiales

Alcance: únicamente los cursos de los primeros 4 semestres de cada plan de estudios.

## Estructura del repositorio

```
CEmestre/
├── etapa-1/          # Módulo actual: C
├── etapa-2/          # Futuro: Racket
├── etapa-3/          # Futuro: Prolog
├── etapa-4/          # Futuro: Java
├── data/             # Datos globales y contratos entre etapas
│   ├── raw/          # Guías de horarios y planes de estudio sin procesar
│   ├── clean/        # Datos limpios listos para consumir
│   ├── student_history/  # Archivos de entrada con cursos aprobados por el estudiante
│   └── contracts/    # Ejemplos del formato exacto que cada etapa exporta/consume
└── docs/             # Documentación y diagramas de arquitectura general
```

## Equipo

- Felipe — carga de catálogo y de historial del estudiante (Etapa 1)
- Neto — detección de choques de horario y exportación del catálogo (Etapa 1)
- Luis — validación de requisitos y correquisitos (Etapa 1)

Ver [`etapa-1/README_ETAPA1.md`](./etapa-1/README_ETAPA1.md) para la documentación detallada de la entrega actual.
