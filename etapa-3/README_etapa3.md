# Etapa 3, CEmestre en Prolog

Esta etapa evalua las políticas dadas para aceptar o rechazar las combinaciones recibidas.


## Como correr el proyecto

Desde la raíz del proyecto, ejecutar:

swipl -q -s etapa-3/src/main.pl

## Arquitectura

## Decisiones de diseño

- **Modelado de las combinaciones y cursos:**

  Las combinaciones de horarios se modelaron en Prolog utilizando hechos dinámicos, términos compuestos y listas. Los datos se obtienen de un archivo JSON generado en la etapa 2 del proyecto, el cual es procesado por el       módulo carga.pl. Cada combinación se representa mediante el término compuesto combinacion(Id, Cursos, CreditosTotales) en donde Id es un identificador único asignado durante la carga.
  
  Cada curso se representa mediante curso(Codigo, Grupo, Creditos, Carreras, Area), con Carreras como una lista de las carreras a las que pertenece.
  
  Durante la carga, los datos del JSON se convierten en estos términos compuestos y posteriormente se registran como hechos dinámicos mediante assertz/1.
  
  **El uso de assertz/1 y retractall/1 se limita unicamete a la carga de datos de entrada**
  

- **Asignación de áreas académicas**

  Para la clasificación de los cursos se agregó el atributo area al catálogo

  Se definieron las siguientes áreas: software, electronica, ciencias_naturales, materiales_mecanica, humanidades, gestion y arte_deporte.

  Para asociar un área con una carrera  se tomó en cuenta el tipo de materia y sus contenidos. Los cursos se clasificaron según el campo de  al que pertenecen. Por ejemplo, los cursos relacionados con programación se asignaron al área de software, mientras que los cursos de matemática y física se clasificaron en ciencias_naturales. Tambien, el área de materiales_mecanica incluye materias como Introducción a la Ciencia e Ingeniería de los Materiales, Dibujo Técnico,Metalurgia Física, Laboratorio de Metalurgia Física, entre otros.
 Para facilitar la implementación, se agregaron únicamente las áreas que se consideraron necesarias.

  
  | Área académica | Número de materias |
  |---|---:|
  | materiales_mecanica | 28 |
  | ciencias_naturales | 23 |
  | humanidades | 15 |
  | software | 15 |
  | electronica | 14 |
  | gestion | 9 |
  | arte_deporte | 3 |
  | **Total** | **107** |

- **Pares de cursos incompatibles**   

- **Caso donde el orden de las reglas cambia la razón reportada**

- **Caso limite real**

## Representación de datos y predicados principales
 
