# Datos de ingredientes y precios

## Dataset de Ingredientes y Pipeline de carga
Documento el proceso utilizado para construir y enriquecer el dataset para luego hidratar la bd. El objetivo es construir los ingredientes con su informacion nutricional verificada e identificar sus restricciones alimentarias.
### Estructura inicial
Se construyo un dataset base compuesto por 92 ingredientes comunes, donde se incluyo la informacion base.
- Formato:
```json
{
  "nombre": "...",
  "nombre_busqueda_en": "...",
  "unidad_base": "GRAMOS",
  "categoria": "proteinas_animales",
  "restricciones": [ "sin_lactosa", "sin_gluten", "sin_mariscos" ],
  "rango_precio": "",
  "notas": "..."
}
```

### Nutrir con informacion nutricional
Luego, se desarrollo un script en py ejecutado desde google colab para automatizar la busqueda de la informacion nutricional estandarizada para cada ingrediente.
- La fuente principal que se uso fue: [USDA FoodData Central](https://fdc.nal.usda.gov/food-search?query=Asparagus&type=Foundation)
- Link al google colab detallado: [ingredientesData.ipynb](https://colab.research.google.com/drive/1zhiyluu3gW-zFMg9HvmyHLdsbkNCI18f?usp=sharing)
- Formato de los valores normalizados:
```json
{
  "nombre": "...",
  "unidad_base": "GRAMOS",
  "categoria": "proteinas_animales",
  "restricciones": [
    "sin_lactosa",
    "sin_gluten",
    "sin_mariscos"
  ],
  "info_nutricional": {
    "calorias": 0.0,
    "proteinas": 0.0,
    "carbohidratos": 0.0,
    "grasas": 0.0,
    "fibra": null,
    "cantidad_referencia": 100.0,
    "unidad_referencia": "GRAMOS"
  }
}
```

### Validacion manual del dataset
Luego de obtener los datos nutricionales, se realizo una validacion automatica al archivo JSON para obtener una mejor calidad y consistencia final de datos que se van a persistir. Donde se verificaron los valores inconsistentes o incorrectos, y se constrato nuevamente la infomracion puntual usando la API de USDA.

### Generación automática de script SQL
Finalmente se genero otro script en py para transformar el JSON final en un script SQL compatible con Flyway para incorporar al proyecto directamente. Ademas, se hizo una verificacion de las categorias y restricciones ya que el JSON inicial tenia las restricciones cargadas a mano y con toda esa información actualizada se genera un JSON nuevo para usar en el script de embedding y entrenar la red neuronal.
- Link al google colab detallado: [ingredientesSQL.ipynb](https://colab.research.google.com/drive/1LQFQXjazeCYT00xlRZbfaqehwYF58oE7?usp=sharing)
- Formato final esperado del script:

```sql
INSERT INTO ingredientes (
    nombre,
    categoria
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Pechuga de pollo',
    'PROTEINAS_ANIMALES',
    'GRAMOS',
    106.0,
    22.5,
    0.0,
    1.93,
    NULL,
    100.0,
    'GRAMOS'
);
```

### Inserción Manual de Ingredientes Adicionales
Al final se identifico la necesidad de incorporar otros ingedientes adicionales, como se definieron una vez finalizado el pipeline principal de generacion y carga, se opto por incorporarlos al final de script de SQL.
- Ingredientes agregados manualmente: Remolacha, Zucchini, Coliflor, Maní, Semillas de girasol, Queso parmesano, Espárragos, Jamón cocido, Seitán, Tempeh, Soja texturizada, Edamame, Porotos blancos, Porotos aduki, Arvejas amarillas partidas y Lupini

## Obtención de precios actualizados de los ingredientes
Buscamos una fuente de referencia institucional como la página del Gobierno: https://www.preciosclaros.gob.ar/ , tomando como región más próxima a La Plata.
A través de PGAdmin se obtuvo el .csv de la tabla de ingredientes, incluyendo los agregados manualmente, y con un Jupyter Notebook (https://github.com/IlledNacu/precios-ingredientes) se fueron ejecutando los bloques de código que extraerían la información necesaria de los endpoints a disposición.
### Primera etapa: PreciosClaros
En esta fuente, hallamos por similitud un total de 79/108 alimentos, y en base a un precioMin y un precioMax calculamos y guardamos un promedio.
### Segunda etapa: Ratoneando
Como todavía quedaban muchos ingredientes huérfanos, se creó un json con los que todavía faltaban y se buscó otra fuente.
En este caso probamos con la App https://ratoneando.ar/ , que toma como fuente productos de supermercados.
En esta fuente, hallamos por similitud un total de 10 alimentos con un precio fijo.
### Tercera etapa: Jumbo
Todavía quedaban 19 húerfanos. Como instancia final, accedimos a los datos públicos de Jumbo para obtener precios fijos de 12 alimentos más.
### Insert para nuestra BD
En base a los 3 .json que nos quedaron como resultado final, primero el de PreciosClaros, luego el de Ratoneando y por último el de Jumbo, generamos los inserts en base al id del ingrediente, con el precio, el producto_referencia y el origen_referencia.
Los resultados no son perfectos, debido a la complejidad lingüística en el tratamiento de los datos que manejan las distintas fuentes. Sirven como una guía estimativa de cuánto puede salir un producto si lo vas a comprar ahora al supermercado.