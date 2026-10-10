# Remy App

Remy es una app web que recomienda recetas a partir de los ingredientes que tenés en casa, tus restricciones alimentarias, tu objetivo, tu nivel de cocina y tu presupuesto, y explica por qué recomienda cada una. Es el trabajo práctico integrador de la materia Proyecto de Software de la Tecnicatura en Programación Informática (UNSAM, 2026), que hicimos en un equipo de cinco personas. Este repositorio es el backend y tiene la documentación principal; el front está en [front-remy-app](https://github.com/solalcaraz/front-remy-app).

## Problema que resuelve

Tener ingredientes no siempre significa saber qué cocinar. Las recetas que se encuentran en internet suelen pedir cosas que no hay en la heladera, no tienen en cuenta si la persona es celíaca o vegana, y buscar alternativas lleva tiempo.

La materia pedía un sistema funcional que integrara alguna forma de IA. Podríamos haberle pedido las recetas a un LLM, pero la respuesta depende de lo que la persona se acuerde de escribir, no conoce su historial y puede cambiar de una consulta a otra. Remy trabaja sobre un catálogo propio de recetas e ingredientes, guarda el perfil de cada usuario y puntúa las recetas con reglas que siempre dan el mismo resultado y que se pueden explicar.

Eso nos dejó tres desafíos técnicos:

- **Los datos.** Necesitábamos ingredientes en español con información nutricional, restricciones alimentarias y precios de Argentina, y los armamos nosotros.
- **El puntaje.** Combinar ocho criterios (ingredientes, restricciones, objetivo, dificultad, costo, tiempo, favoritos e historial) en un número de 0 a 100 que sirva para ordenar y que venga con sus motivos.
- **Los reemplazos.** Sugerir con qué reemplazar un ingrediente que falta sin escribir a mano una tabla de equivalencias. Ahí entra la IA: cada ingrediente tiene un embedding, y los reemplazos se buscan por similitud.

## Demo

![Recorrido por Remy: login, sugerencia del día, búsqueda con arroz y pollo, motivos de una receta, detalle con reemplazos, modo paso a paso, historial, favoritos y perfil](docs/demo.gif)

El recorrido entra con un usuario de prueba, busca recetas con arroz y pollo, abre los motivos de la primera, entra al detalle, la marca como favorita, abre los reemplazos para el brócoli y la cocina paso a paso hasta que queda en el historial. No está deployada; para probarla, seguí los pasos de [Cómo correrlo](#cómo-correrlo).

## Tecnologías

- **Backend:** Kotlin, Spring Boot 3.3, Spring Security con JWT, Spring Data JPA y Flyway.
- **Base de datos:** PostgreSQL 16 con las extensiones pgvector y unaccent, en Docker.
- **Embeddings:** [paraphrase-multilingual-mpnet-base-v2](https://huggingface.co/sentence-transformers/paraphrase-multilingual-mpnet-base-v2) (768 dimensiones), generados con Python en Google Colab.
- **Tests:** JUnit 5 y Mockito.
- **Front:** React 19, TypeScript, Vite y Tailwind ([repositorio aparte](https://github.com/solalcaraz/front-remy-app)).

## Cómo funciona

**Los datos.** La base arranca cargada: 108 ingredientes con información nutricional de [USDA FoodData Central](https://fdc.nal.usda.gov/) y sus restricciones (sin gluten, vegano, sin lactosa, etc.), 81 recetas con 243 pasos y precios para 101 ingredientes, tomados de Precios Claros, Ratoneando y Jumbo. Todo entra por migraciones de Flyway (`src/main/resources/db/migration`), así que la base queda igual en cualquier máquina. Cómo se armó cada dataset está en [docs/datos.md](docs/datos.md), y los JSON de origen, en `data/`.

Cada ingrediente de una receta es de un tipo:

- **Core:** sin él no hay receta.
- **Reemplazable:** se puede cambiar por otro.
- **Opcional:** se puede omitir.

**La recomendación** (`RecomendacionService`) trabaja en dos pasos:

1. **Filtro en la base.** Se quedan las recetas que cumplen las restricciones del usuario, no tienen como core un ingrediente que evita y entran en el tiempo máximo. Si el usuario está dispuesto a comprar, alcanza con que tenga un ingrediente; si no, tiene que tener todos los core y le pueden faltar hasta cinco reemplazables.
2. **Puntaje en memoria.** Cada candidata suma o resta puntos y deja un motivo por cada regla:

| Factor | Efecto |
|---|---|
| Ingredientes disponibles | Hasta 30 puntos según la proporción de ingredientes core que tiene, con una penalización por cada faltante que depende del presupuesto |
| Restricciones alimentarias | +20 si la receta las cumple (solo si el usuario tiene alguna) |
| Objetivo | +15 si las calorías, grasas, fibra y proteínas por porción acompañan el objetivo |
| Nivel de cocina | +15 si la dificultad está a su alcance, menos si la supera |
| Ingredientes a evitar | +10 si no tiene ninguno |
| Costo | Hasta +10 según el costo aproximado y el perfil económico |
| Tiempo | +5 si tarda 20 minutos o menos, +3 si tarda hasta 45 |
| Favoritos e historial | +5 si es favorita, −5 si la cocinó hace poco |

El total se normaliza contra el máximo posible para ese usuario, para que el 0 a 100 sea comparable entre perfiles. Las reglas completas, con todos los valores, están en [docs/reglas-recomendacion.md](docs/reglas-recomendacion.md).

**Los reemplazos.** Los embeddings de los 108 ingredientes están en una columna `vector(768)` de pgvector. Para un ingrediente que falta, la base devuelve los más cercanos por distancia coseno (`<=>`) y el servicio descarta los que no cumplen las restricciones del usuario, los de otra categoría (salvo proteína animal por vegetal o al revés) y los que ya están en la receta. Así, para el brócoli de un wok la app sugiere rúcula, acelga, lechuga o espinaca.

**La sesión.** El login devuelve un access token y un refresh token (JWT). El filtro de seguridad valida el token en cada pedido y el id del usuario sale de ahí, no de los parámetros.

Las decisiones que tomé y por qué:

- **Pesar distinto la búsqueda y la despensa.** Si el usuario escribe ingredientes en el buscador, la coincidencia con esos ingredientes pesa 1,2; si solo se usa la despensa de su perfil, pesa 0,8 y ganan peso el objetivo, las restricciones y la dificultad. Si alguien se tomó el trabajo de escribir qué tiene, eso tiene que mandar en el resultado.
- **Elegir la sugerencia del día al azar entre las cinco mejores.** Si fuera siempre la mejor puntuada, el usuario vería la misma receta en cada visita. Así cambia, sin dejar de ser relevante.
- **Tomar el usuario del token en todos los endpoints.** Favoritos, historial y detalle recibían el id por parámetro y eran públicos, así que cualquiera podía leer o modificar los datos de otro usuario. Lo corregí en este fork.
- **Exigir la clave del JWT por variable de entorno.** Antes había una clave por defecto en el repo; si alguien deployaba sin configurarla, cualquiera podía firmar tokens válidos. Ahora la app no arranca sin `JWT_SECRET`.

## Cómo correrlo

Se necesitan Java 21 y Docker.

```bash
git clone https://github.com/solalcaraz/back-remy-app.git
cd back-remy-app
docker compose up -d
export JWT_SECRET="una-clave-de-al-menos-32-caracteres"
./gradlew bootRun
```

La API queda en http://localhost:8080. Usuario de prueba: `diego@maradona.com`, contraseña `admin`. Para la interfaz, ver [front-remy-app](https://github.com/solalcaraz/front-remy-app#cómo-correrlo).

## Qué aprendí y qué mejoraría

**Qué aprendí**

- A armar un dataset desde cero cuando no hay uno listo: cruzar fuentes, validar los valores contra la API de USDA y convertir el resultado en migraciones para que cualquiera pueda reconstruir la base.
- A usar embeddings para un problema concreto: comparar ingredientes por lo que son y no por cómo se escriben, guardando los vectores en la misma base que el resto de los datos.
- A trabajar con Scrum en un equipo de cinco, con sprints y reuniones semanales para mostrar avances. Terminamos con una velocidad promedio de 57 puntos por sprint.
- A pensar el sistema como un producto que se podría vender: qué lo hace valioso para quien lo usa, en qué se diferencia de preguntarle a un LLM y qué lugar le corresponde a la IA dentro de él.

**Qué mejoraría**

- **Darle un orden fijo a los ingredientes de cada receta.** Están en un `Set`, así que la API los devuelve en un orden distinto en cada ejecución y el detalle, que muestra los cinco primeros, cambia cuáles se ven.
- **Actualizar los precios automáticamente.** Están cargados a mano en una migración de mayo de 2026, y el costo de cada receta sale de ellos.
- **Agregar tests de integración de los endpoints.** Los tests actuales cubren dominio, servicios y mappers con mocks; los cambios de este fork los verifiqué comparando respuestas a mano.

## Autoría y mejoras

Este repositorio es un fork de **[reemeerie/back-remy-app](https://github.com/reemeerie/back-remy-app)**, el trabajo práctico integrador que hicimos en equipo entre marzo y julio de 2026. El tag [`tp-original-2026`](https://github.com/solalcaraz/back-remy-app/tree/tp-original-2026) marca el TP tal como lo entregamos. El front tiene su propio fork: [solalcaraz/front-remy-app](https://github.com/solalcaraz/front-remy-app).

**Equipo:** María Sol Alcaraz, Thomas Reemeerie, Illed Huilen Nacucchio, Denise Higa y Luis Mazo.

**Mi parte en la versión original**:

- Armé el dataset de ingredientes: partí de una lista base, la completé con la información nutricional de USDA FoodData Central con scripts de Python en Google Colab ([enriquecimiento](https://colab.research.google.com/drive/1zhiyluu3gW-zFMg9HvmyHLdsbkNCI18f?usp=sharing) y [generación del SQL](https://colab.research.google.com/drive/1LQFQXjazeCYT00xlRZbfaqehwYF58oE7?usp=sharing)), validé los valores y documenté el proceso.
- Generé los embeddings de los ingredientes y dejé un prototipo de búsqueda de ingredientes similares. Sobre eso, Denise armó la sugerencia de reemplazos.
- Migré la base a Flyway y la cargué con los ingredientes.
- En el back hice los endpoints del home (recomendaciones, sugerencias de ingredientes para autocompletar y sugerencia del día), el peso entre búsqueda y despensa, los motivos que acompañan cada receta y el filtro por ingredientes core.
- En el front hice el home: la caja de búsqueda con autocompletado, el listado de recomendaciones con sus motivos y la sugerencia del día.

**Lo que hice después en este fork**:

- Corregí los errores que encontré:
  - El motivo "Receta rápida" aparecía en las recetas de 21 a 45 minutos y nunca en las de 20 o menos.
  - Las respuestas de error llegaban sin mensaje, así que el login no avisaba cuando la contraseña era incorrecta.
- Cerré dos problemas de seguridad: los endpoints de favoritos, historial y detalle eran públicos y aceptaban cualquier `usuarioId`, y la clave del JWT tenía un valor por defecto publicado en el repo.
- Eliminé código muerto: tres loaders que no se ejecutaban (dos estaban comentados enteros), dos repositorios vacíos, un cálculo de precios sin uso, bloques comentados y un `println` que imprimía el refresh token.
- Dejé solo los comentarios que explican decisiones, y reescribí el del puntaje máximo, que tenía números que ya no coincidían con el código.
- Junté en un solo lugar las funciones de normalización de texto, que estaban copiadas en seis clases, y la lectura del usuario autenticado, repetida en cada endpoint.
- Pasé la documentación a `docs/` y los JSON de datos a `data/`, que se empaquetaban dentro del jar sin que la app los usara.
- Grabé la demo y reescribí este README.

Para comprobar que el comportamiento no cambió, levanté la versión original y la nueva contra una base recién migrada y comparé las respuestas de 62 pedidos a la API: búsquedas con cuatro perfiles distintos, detalle, reemplazos, favoritos, historial, perfil y autenticación. Sin contar el orden de los ingredientes, que cambia entre ejecuciones en las dos versiones, las respuestas son iguales salvo en los errores corregidos. Además recorrí la app completa con Playwright en las dos versiones y comparé el texto de cada pantalla, y los 39 tests pasan.
