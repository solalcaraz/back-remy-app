# back-remy-app

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
