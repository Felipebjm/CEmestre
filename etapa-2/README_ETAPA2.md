# Etapa 2, CEmestre en Racket

Esta etapa genera y filtra combinaciones válidas de horario a partir del catálogo que produjo la etapa 1 en C. Se trabaja en paradigma funcional, con Typed Racket, sin mutación, usando recursión y streams para no construir listas completas de una sola vez.

## Como correr el proyecto

Las pruebas se corren desde la carpeta `etapa-2`:

```
racket tests/test_choques.rkt
racket tests/test_filtro.rkt
racket tests/test_polimorfismo.rkt
racket tests/test_generador.rkt
racket tests/test_streams.rkt
racket tests/test_exportar.rkt
racket tests/test_parseo.rkt
```

`main.rkt` carga el catalogo y las preferencias reales, las rutas en `constantes.rkt` estan escritas para correrse parado dentro de `src`, entonces hay que entrar a esa carpeta primero:

```
cd src
racket main.rkt
```

Esto deja el resultado en `data/combinaciones_salida.json`.

## Arquitectura

El proyecto se divide en varios modulos pequeños, cada uno con una responsabilidad clara:

- `tipos.rkt`, los structs que modelan el dominio, Curso, Grupo, BloqueHorario, PreferenciaCurso, Preferencias, Seleccion y Combinacion.
- `parser.rkt` y `constantes.rkt`, cargan el catalogo de la etapa 1 y las preferencias del estudiante desde JSON.
- `choques.rkt`, detecta si dos bloques de horario o dos grupos se traslapan entre si.
- `filtro.rkt`, deja solo los cursos del catalogo que el estudiante marco como de interes, y dentro de cada uno, solo los grupos que tambien marco como de interes.
- En `filtro.rkt` tambien se encuentra el filtro por rango de creditos y la funcion generica usada para el polimorfismo parametrico.
- `streams.rkt`, una lista perezosa generica construida con delay y force, con las operaciones basicas para trabajar con ella (mapear, filtrar, concatenar, convertir a lista normal).
- `generador.rkt`, genera las combinaciones validas de curso y grupo, tanto en una version con listas normales como en una version perezosa sobre streams.rkt.
- `exportar.rkt`, convierte las combinaciones validas al formato de salida acordado.
- `main.rkt`, junta todo el flujo en orden.

El flujo completo es, se cargan el catalogo y las preferencias, se filtran los cursos de interes, se generan las combinaciones posibles, se descartan las que tienen choques, y las que sobreviven se exportan.

Antes de exportar las combinaciones tambien se revisa que sus creditos esten dentro del minimo y maximo indicado en las preferencias.

## Decisiones de diseño

**Streams en vez de listas completas.** El requerimiento pide que las combinaciones se generen con streams, no como una lista ya armada al final. Racket no tiene un tipo de stream generico listo para usar directamente en Typed Racket sin complicaciones, asi que se construyo uno propio en `streams.rkt`, basado en `delay` y `force`. Cada combinacion se calcula solo cuando algo la pide, por ejemplo con `primerosN` se pueden pedir las primeras combinaciones sin que el programa llegue a calcular el resto. Esto se probo generando combinaciones con la version perezosa y comparandolas contra la version con listas normales, dando el mismo resultado pero sin construir todo de una vez.

**Reutilizar la logica de choques de la etapa 1.** En vez de inventar una forma nueva de detectar traslapes de horario, se tradujo la misma logica que ya se habia probado en C, comparando dia y rango de horas entre bloques. La unica diferencia es que la version en Racket usa `ormap` en vez de un doble ciclo anidado, porque Typed Racket no siempre logra inferir el tipo de retorno de un `for/or` dentro de otro `for/or`.

**Separar el filtro de cursos de interes de la generacion de combinaciones.** Se decidio que `filtro.rkt` solo se encargue de reducir el catalogo a los cursos que le interesan al estudiante, y que `generador.rkt` reciba esa lista ya filtrada. Asi cada archivo hace una sola cosa y se puede probar por separado.

**Filtro por rango de creditos.** Para revisar el rango de creditos se toma el total de cada combinacion y se compara con el minimo y maximo de las preferencias. Los dos limites se aceptan, entonces una combinacion que tenga exactamente el minimo o el maximo tambien es valida. Esta parte se dejo en funciones separadas para poder probarla de forma independiente.

**Polimorfismo parametrico.** Se creo la funcion `filtrarPorCriterio` para poder usar el mismo filtro con distintos tipos de datos y no tener que hacer una funcion diferente para cada caso. En el tipo de la funcion se usa `All (A)`, donde `A` representa el tipo con el que se esta trabajando. La funcion recibe un criterio que devuelve verdadero o falso y una lista de elementos de ese mismo tipo.

`filtrarPorCriterio` recorre la lista de forma recursiva. Si un elemento cumple el criterio se agrega al resultado, y si no lo cumple se continua con el resto de la lista. En el proyecto se usa con `Combinacion` para aplicar el filtro por rango de creditos. Tambien se hicieron pruebas con numeros, textos y booleanos para comprobar que la misma funcion puede trabajar con diferentes tipos.

**Formato de exportacion en JSON construido a mano.** Para la exportacion se armo el JSON como texto directamente en `exportar.rkt`, igual que se hizo con cJSON en la etapa 1 pero mas simple porque la estructura de salida es plana. Cada combinacion exporta la lista de pares curso y grupo, los creditos totales, y la carrera de origen.

## Caso limite real

Dos cursos con un grupo cada uno que empiezan y terminan exactamente a la misma hora en el mismo dia, por ejemplo un grupo de 7 a 9 y otro que empieza justo a las 9, no deben marcarse como choque, porque no hay traslape real de horario, solo coinciden en el borde. Esto se probo directamente en `test_choques.rkt` con un caso donde un bloque termina exactamente cuando el otro empieza.

## Estructuras de datos

- `Curso`, codigo, nombre, creditos, semestre, carreras, la lista de grupos que ofrece, si tiene choques y si el estudiante puede matricularlo.
- `Grupo`, numero de grupo y su lista de bloques de horario.
- `BloqueHorario`, dia, hora de inicio y hora de fin.
- `PreferenciaCurso`, el codigo de un curso de interes junto con los numeros de grupo que tambien le interesan al estudiante de ese curso.
- `Preferencias`, la lista de PreferenciaCurso del estudiante y el rango de creditos minimo y maximo.
- `Seleccion`, un curso ya emparejado con el grupo escogido.
- `Combinacion`, una lista de selecciones junto con el total de creditos que suman.

## Division del trabajo

- Felipe, carga del catalogo y modelado de los datos con tipos explicitos.
- Neto, generacion de combinaciones con streams y exportacion de las combinaciones validas.
- Luis, filtrado por rango de creditos y polimorfismo parametrico.

## Pendiente

- Ninguno por ahora.
