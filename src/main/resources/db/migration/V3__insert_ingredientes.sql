
INSERT INTO ingredientes (
    nombre,
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
    'GRAMOS',
    106,
    22.5,
    0.0,
    1.93,
    NULL,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pechuga de pollo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pechuga de pollo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pechuga de pollo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Carne molida',
    'GRAMOS',
    243,
    17.5,
    0.0,
    19.4,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Carne molida'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Carne molida'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Carne molida'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Bife de lomo',
    'GRAMOS',
    143,
    21.1,
    0.18,
    6.46,
    NULL,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Bife de lomo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Bife de lomo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Bife de lomo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Costilla de cerdo',
    'GRAMOS',
    138,
    19.3,
    0.0,
    11.8,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Costilla de cerdo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Costilla de cerdo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Costilla de cerdo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Huevo',
    'UNIDAD',
    146,
    12.6,
    0.72,
    9.51,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Huevo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Huevo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Huevo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Huevo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Atún en lata',
    'GRAMOS',
    85,
    19.0,
    0.08,
    0.94,
    NULL,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Atún en lata'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Atún en lata'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Lentejas',
    'GRAMOS',
    360,
    24.6,
    63.4,
    1.06,
    10.7,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Lentejas'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Lentejas'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Lentejas'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Lentejas'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Lentejas'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Garbanzos',
    'GRAMOS',
    364,
    19.3,
    60.7,
    6.04,
    17.4,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Garbanzos'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Garbanzos'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Garbanzos'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Garbanzos'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Garbanzos'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Porotos negros',
    'GRAMOS',
    341,
    21.6,
    62.4,
    1.42,
    15.5,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Porotos negros'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Porotos negros'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Porotos negros'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Porotos negros'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Porotos negros'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Tofu firme',
    'GRAMOS',
    76,
    8.08,
    1.87,
    4.78,
    0.3,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tofu firme'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tofu firme'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tofu firme'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tofu firme'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tofu firme'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Tomate perita',
    'GRAMOS',
    18,
    0.88,
    3.89,
    0.2,
    1.2,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tomate perita'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tomate perita'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tomate perita'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tomate perita'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tomate perita'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Cebolla',
    'GRAMOS',
    36,
    0.89,
    7.68,
    0.1,
    1.7,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cebolla'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cebolla'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cebolla'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cebolla'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cebolla'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Cebolla morada',
    'GRAMOS',
    44,
    0.94,
    9.93,
    0.1,
    2.2,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cebolla morada'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cebolla morada'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cebolla morada'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cebolla morada'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cebolla morada'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Ajo',
    'GRAMOS',
    143,
    6.62,
    28.2,
    0.38,
    2.7,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Ajo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Ajo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Ajo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Ajo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Ajo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Zanahoria',
    'GRAMOS',
    48,
    0.93,
    9.58,
    0.24,
    3.1,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zanahoria'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zanahoria'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zanahoria'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zanahoria'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zanahoria'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Papa',
    'GRAMOS',
    73,
    1.81,
    16,
    0.26,
    2.2,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Papa'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Papa'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Papa'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Papa'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Papa'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Batata',
    'GRAMOS',
    86,
    1.57,
    20.1,
    0.05,
    3.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Batata'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Batata'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Batata'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Batata'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Batata'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Zapallo anco',
    'GRAMOS',
    48,
    1.0,
    11.7,
    0.1,
    2.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zapallo anco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zapallo anco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zapallo anco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zapallo anco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zapallo anco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Morrón rojo',
    'GRAMOS',
    31.3,
    0.89,
    6.65,
    0.13,
    1.16,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Morrón rojo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Morrón rojo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Morrón rojo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Morrón rojo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Morrón rojo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Morrón verde',
    'GRAMOS',
    22.9,
    0.72,
    4.78,
    0.11,
    0.94,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Morrón verde'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Morrón verde'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Morrón verde'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Morrón verde'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Morrón verde'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Apio',
    'GRAMOS',
    16.7,
    0.492,
    3.32,
    0.162,
    NULL,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Apio'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Apio'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Apio'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Apio'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Apio'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Choclo',
    'GRAMOS',
    84.6,
    2.79,
    14.7,
    1.63,
    2.43,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Choclo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Choclo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Choclo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Choclo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Choclo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Espinaca',
    'GRAMOS',
    27,
    2.86,
    3.63,
    0.39,
    2.2,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Espinaca'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Espinaca'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Espinaca'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Espinaca'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Espinaca'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Lechuga',
    'GRAMOS',
    17.1,
    0.742,
    3.37,
    0.0738,
    NULL,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Lechuga'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Lechuga'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Lechuga'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Lechuga'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Lechuga'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Brócoli',
    'GRAMOS',
    39,
    2.57,
    6.27,
    0.34,
    2.4,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Brócoli'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Brócoli'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Brócoli'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Brócoli'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Brócoli'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Acelga',
    'GRAMOS',
    19,
    1.8,
    3.74,
    0.2,
    1.6,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Acelga'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Acelga'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Acelga'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Acelga'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Acelga'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Rúcula',
    'GRAMOS',
    31,
    1.65,
    5.37,
    0.32,
    2.3,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Rúcula'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Rúcula'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Rúcula'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Rúcula'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Rúcula'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Arroz blanco',
    'GRAMOS',
    359,
    7.04,
    80.3,
    1.03,
    0.149,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Arroz integral',
    'GRAMOS',
    366,
    7.25,
    76.7,
    3.31,
    3.02,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arroz integral'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arroz integral'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arroz integral'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arroz integral'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arroz integral'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Harina 0000',
    'GRAMOS',
    366,
    10.9,
    77.3,
    1.48,
    NULL,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Harina 0000'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Harina 0000'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Harina 0000'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Harina 0000'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Harina de garbanzo',
    'GRAMOS',
    387,
    22.4,
    57.8,
    6.69,
    10.8,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Harina de garbanzo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Harina de garbanzo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Harina de garbanzo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Harina de garbanzo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Harina de garbanzo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Avena',
    'GRAMOS',
    389,
    16.9,
    66.3,
    6.9,
    10.6,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Avena'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Avena'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Avena'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Avena'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Fideos spaghetti',
    'GRAMOS',
    371,
    13.0,
    74.7,
    1.51,
    3.2,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Fideos spaghetti'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Fideos spaghetti'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Fideos spaghetti'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Fideos spaghetti'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Fideos integrales',
    'GRAMOS',
    357,
    13.5,
    73.1,
    2.68,
    10.1,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Fideos integrales'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Fideos integrales'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Fideos integrales'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Fideos integrales'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Pan rallado',
    'GRAMOS',
    395,
    13.4,
    72.0,
    5.3,
    4.5,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pan rallado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pan rallado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pan rallado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pan rallado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Quinoa',
    'GRAMOS',
    368,
    14.1,
    64.2,
    6.07,
    7.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Quinoa'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Quinoa'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Quinoa'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Quinoa'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Quinoa'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Leche entera',
    'MILILITROS',
    61,
    3.15,
    4.8,
    3.25,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Leche entera'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Leche entera'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Leche entera'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Leche descremada',
    'MILILITROS',
    34,
    3.37,
    4.96,
    0.08,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Leche descremada'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Leche descremada'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Leche descremada'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Leche descremada'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Leche de almendras',
    'MILILITROS',
    19.3,
    0.656,
    0.671,
    1.56,
    0.75,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Leche de almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Leche de almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Leche de almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Leche de almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Leche de almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Queso rallado',
    'GRAMOS',
    420,
    28.4,
    13.9,
    27.8,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Queso rallado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Queso rallado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Queso rallado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Queso crema',
    'GRAMOS',
    343,
    6.15,
    5.52,
    34.4,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Queso crema'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Queso crema'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Queso crema'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Yogur natural',
    'GRAMOS',
    78.0,
    3.82,
    5.57,
    4.48,
    NULL,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Yogur natural'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Yogur natural'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Yogur natural'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Crema de leche',
    'MILILITROS',
    343,
    2.02,
    3.8,
    35.6,
    NULL,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Crema de leche'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Crema de leche'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Crema de leche'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Manteca',
    'GRAMOS',
    717,
    0.85,
    0.06,
    81.1,
    NULL,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Manteca'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Manteca'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Manteca'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Aceite de girasol',
    'MILILITROS',
    884,
    0.0,
    0.0,
    100.0,
    NULL,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de girasol'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de girasol'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de girasol'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de girasol'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de girasol'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Aceite de oliva',
    'MILILITROS',
    884,
    0.0,
    0.0,
    100.0,
    NULL,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de oliva'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de oliva'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de oliva'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de oliva'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de oliva'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Sal fina',
    'GRAMOS',
    0,
    0.0,
    0.0,
    0.0,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Sal fina'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Sal fina'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Sal fina'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Sal fina'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Sal fina'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Pimienta negra',
    'GRAMOS',
    251,
    10.4,
    64.0,
    3.26,
    25.3,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pimienta negra'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pimienta negra'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pimienta negra'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pimienta negra'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pimienta negra'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Pimentón dulce',
    'GRAMOS',
    282,
    14.1,
    54.0,
    12.9,
    34.9,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pimentón dulce'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pimentón dulce'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pimentón dulce'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pimentón dulce'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pimentón dulce'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Comino',
    'GRAMOS',
    375,
    17.8,
    44.2,
    22.3,
    10.5,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Comino'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Comino'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Comino'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Comino'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Comino'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Orégano seco',
    'GRAMOS',
    265,
    9.0,
    68.9,
    4.28,
    42.5,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Orégano seco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Orégano seco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Orégano seco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Orégano seco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Orégano seco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Laurel',
    'GRAMOS',
    313,
    7.61,
    75.0,
    8.36,
    26.3,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Laurel'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Laurel'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Laurel'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Laurel'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Laurel'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Ají molido',
    'GRAMOS',
    314,
    12.0,
    56.6,
    16.8,
    28.7,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Ají molido'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Ají molido'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Ají molido'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Ají molido'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Ají molido'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Perejil fresco',
    'GRAMOS',
    36,
    2.97,
    6.33,
    0.79,
    3.3,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Perejil fresco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Perejil fresco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Perejil fresco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Perejil fresco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Perejil fresco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Cúrcuma',
    'GRAMOS',
    312,
    9.68,
    67.1,
    3.25,
    22.7,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cúrcuma'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cúrcuma'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cúrcuma'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cúrcuma'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cúrcuma'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Jengibre fresco',
    'GRAMOS',
    80,
    1.82,
    17.8,
    0.75,
    2.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Jengibre fresco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Jengibre fresco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Jengibre fresco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Jengibre fresco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Jengibre fresco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Vinagre de manzana',
    'MILILITROS',
    0,
    0.0,
    0.93,
    0.0,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Vinagre de manzana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Vinagre de manzana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Vinagre de manzana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Vinagre de manzana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Vinagre de manzana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Salsa de soja',
    'MILILITROS',
    60,
    10.5,
    5.57,
    0.1,
    0.8,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Salsa de soja'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Salsa de soja'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Salsa de soja'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Salsa de soja'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Mostaza',
    'GRAMOS',
    66,
    4.37,
    5.83,
    3.34,
    3.3,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Mostaza'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Mostaza'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Mostaza'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Mostaza'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Mostaza'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Caldo de verduras bajo en sodio',
    'MILILITROS',
    5,
    0.2,
    1.2,
    0.1,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Caldo de verduras bajo en sodio'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Caldo de verduras bajo en sodio'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Caldo de verduras bajo en sodio'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Caldo de verduras bajo en sodio'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Caldo de verduras bajo en sodio'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Caldo de verduras bajo en sodio'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Caldo de pollo',
    'MILILITROS',
    7,
    0.8,
    0.5,
    0.3,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Caldo de pollo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Caldo de pollo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Caldo de pollo'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Salsa de tomate',
    'MILILITROS',
    29,
    1.59,
    6.95,
    0.16,
    1.5,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Salsa de tomate'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Salsa de tomate'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Salsa de tomate'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Salsa de tomate'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Salsa de tomate'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Tomate triturado',
    'MILILITROS',
    32,
    1.6,
    7.3,
    0.27,
    1.9,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tomate triturado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tomate triturado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tomate triturado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tomate triturado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tomate triturado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Azúcar',
    'GRAMOS',
    387,
    0.0,
    99.8,
    0.0,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Azúcar'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Azúcar'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Azúcar'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Azúcar'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Azúcar'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Stevia',
    'GRAMOS',
    0,
    0.0,
    95.6,
    0.0,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Stevia'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Stevia'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Stevia'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Stevia'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Stevia'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Stevia'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Miel',
    'GRAMOS',
    304,
    0.3,
    82.4,
    0.0,
    0.2,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Miel'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Miel'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Miel'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Miel'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Polvo para hornear',
    'GRAMOS',
    53,
    0.0,
    27.7,
    0.0,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Polvo para hornear'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Polvo para hornear'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Polvo para hornear'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Polvo para hornear'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Limón',
    'UNIDAD',
    29,
    1.1,
    9.32,
    0.3,
    2.8,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Limón'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Limón'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Limón'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Limón'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Limón'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Naranja',
    'UNIDAD',
    47,
    0.94,
    11.8,
    0.12,
    2.4,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Naranja'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Naranja'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Naranja'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Naranja'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Naranja'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Banana',
    'UNIDAD',
    89,
    1.09,
    22.8,
    0.33,
    2.6,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Banana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Banana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Banana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Banana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Banana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Manzana',
    'UNIDAD',
    52,
    0.26,
    13.8,
    0.17,
    2.4,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Manzana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Manzana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Manzana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Manzana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Manzana'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Palta',
    'UNIDAD',
    160,
    2.0,
    8.53,
    14.7,
    6.7,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Palta'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Palta'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Palta'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Palta'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Palta'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Nueces',
    'GRAMOS',
    730,
    14.6,
    10.9,
    69.7,
    5.21,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Nueces'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Nueces'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Nueces'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Nueces'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Nueces'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Almendras',
    'GRAMOS',
    626,
    21.5,
    20.0,
    51.1,
    10.8,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Semillas de chía',
    'GRAMOS',
    486,
    16.5,
    42.1,
    30.7,
    34.4,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Semillas de chía'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Semillas de chía'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Semillas de chía'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Semillas de chía'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Semillas de chía'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Coco rallado',
    'GRAMOS',
    660,
    6.88,
    23.7,
    64.5,
    16.3,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Coco rallado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Coco rallado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Coco rallado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Coco rallado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Coco rallado'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Harina de almendras',
    'GRAMOS',
    622,
    26.2,
    16.2,
    50.2,
    9.27,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Harina de almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Harina de almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Harina de almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Harina de almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Harina de almendras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Almidón de maíz',
    'GRAMOS',
    381,
    0.26,
    91.3,
    0.05,
    0.9,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Almidón de maíz'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Almidón de maíz'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Almidón de maíz'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Almidón de maíz'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Almidón de maíz'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Cacao en polvo sin azúcar',
    'GRAMOS',
    229,
    19.6,
    57.9,
    13.7,
    33.2,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cacao en polvo sin azúcar'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cacao en polvo sin azúcar'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cacao en polvo sin azúcar'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cacao en polvo sin azúcar'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cacao en polvo sin azúcar'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Cacao en polvo sin azúcar'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Vainilla esencia',
    'MILILITROS',
    288,
    0.06,
    12.7,
    0.06,
    0.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Vainilla esencia'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Vainilla esencia'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Vainilla esencia'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Vainilla esencia'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Vainilla esencia'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Aceitunas negras',
    'GRAMOS',
    115,
    0.84,
    6.26,
    10.9,
    3.2,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas negras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas negras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas negras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas negras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas negras'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Aceitunas verdes',
    'GRAMOS',
    145,
    1.03,
    3.84,
    15.3,
    3.3,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas verdes'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas verdes'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas verdes'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas verdes'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas verdes'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Pasas de uva',
    'GRAMOS',
    299,
    3.07,
    79.2,
    0.46,
    3.7,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pasas de uva'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pasas de uva'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pasas de uva'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pasas de uva'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Pasas de uva'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Tapas de empanada',
    'UNIDAD',
    290,
    7.5,
    55.0,
    4.0,
    1.5,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tapas de empanada'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tapas de empanada'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Tapas de empanada'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Masa para tarta',
    'GRAMOS',
    430,
    5.5,
    42.0,
    26.0,
    1.2,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Masa para tarta'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Masa para tarta'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Levadura seca',
    'GRAMOS',
    325,
    40.4,
    41.2,
    7.61,
    26.9,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Levadura seca'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Levadura seca'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Levadura seca'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Levadura seca'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Levadura seca'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Aceite de coco',
    'MILILITROS',
    862,
    0.0,
    0.0,
    100.0,
    NULL,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de coco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de coco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de coco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de coco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Aceite de coco'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Arvejas',
    'GRAMOS',
    77,
    5.15,
    14.3,
    0.27,
    4.5,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arvejas'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arvejas'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arvejas'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arvejas'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Arvejas'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Champiñones',
    'GRAMOS',
    22,
    3.09,
    3.26,
    0.34,
    1.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Champiñones'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Champiñones'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Champiñones'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Champiñones'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Champiñones'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Berenjena',
    'GRAMOS',
    25,
    0.98,
    5.88,
    0.18,
    3.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Berenjena'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Berenjena'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Berenjena'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Berenjena'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Berenjena'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Zapallito verde',
    'GRAMOS',
    17,
    1.21,
    3.11,
    0.32,
    1.0,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zapallito verde'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zapallito verde'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zapallito verde'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zapallito verde'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Zapallito verde'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );
        

INSERT INTO ingredientes (
    nombre,
    unidad_base,
    calorias,
    proteinas,
    carbohidratos,
    grasas,
    fibra,
    cantidad_referencia,
    unidad_referencia
) VALUES (
    'Choclo en lata',
    'GRAMOS',
    83,
    2.46,
    20.0,
    0.63,
    2.3,
    100.0,
    'GRAMOS'
);


          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Choclo en lata'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Choclo en lata'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Choclo en lata'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Choclo en lata'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
          );
        

          INSERT INTO ingredientes_restricciones_alimentarias
          (ingrediente_id, restriccion_alimentaria_id)
          VALUES (
              (SELECT id FROM ingredientes WHERE nombre = 'Choclo en lata'),
              (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
          );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Remolacha', 'GRAMOS',
             43, 1.61, 9.56, 0.17, 2.8,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Remolacha'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Remolacha'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Remolacha'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Remolacha'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Remolacha'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Zucchini', 'GRAMOS',
             17, 1.21, 3.11, 0.32, 1.0,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Zucchini'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Zucchini'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Zucchini'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Zucchini'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Zucchini'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Coliflor', 'GRAMOS',
             25, 1.92, 4.97, 0.28, 2.0,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Coliflor'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Coliflor'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Coliflor'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Coliflor'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Coliflor'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Maní', 'GRAMOS',
             567, 25.8, 16.1, 49.2, 8.5,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Maní'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Maní'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Maní'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Maní'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Maní'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Semillas de girasol', 'GRAMOS',
             584, 20.78, 20.0, 51.5, 8.6,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Semillas de girasol'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Semillas de girasol'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Semillas de girasol'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Semillas de girasol'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Semillas de girasol'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Queso parmesano', 'GRAMOS',
             431, 38.5, 4.06, 28.6, NULL,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Queso parmesano'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Queso parmesano'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Queso parmesano'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Espárragos', 'GRAMOS',
             20, 2.2, 3.88, 0.12, 2.1,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Espárragos'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Espárragos'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Espárragos'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Espárragos'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Espárragos'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Jamón cocido', 'GRAMOS',
             107, 16.2, 1.51, 4.02, NULL,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Jamón cocido'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Jamón cocido'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Jamón cocido'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Seitán', 'GRAMOS',
             370, 75.0, 14.0, 1.9, 0.6,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Seitán'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Seitán'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Seitán'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Seitán'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Tempeh', 'GRAMOS',
             193, 18.5, 9.39, 10.8, 3.4,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Tempeh'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Tempeh'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Tempeh'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Tempeh'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Tempeh'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Soja texturizada', 'GRAMOS',
             329, 51.5, 28.0, 1.2, 13.7,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Soja texturizada'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Soja texturizada'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Soja texturizada'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Soja texturizada'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Soja texturizada'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Edamame', 'GRAMOS',
             122, 10.9, 8.91, 5.2, 5.2,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Edamame'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Edamame'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Edamame'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Edamame'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Edamame'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Porotos blancos', 'GRAMOS',
             333, 23.4, 60.3, 0.85, 15.7,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Porotos blancos'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Porotos blancos'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Porotos blancos'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Porotos blancos'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Porotos blancos'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Porotos aduki', 'GRAMOS',
             329, 19.9, 62.9, 0.53, 12.7,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Porotos aduki'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Porotos aduki'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Porotos aduki'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Porotos aduki'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Porotos aduki'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Arvejas amarillas partidas', 'GRAMOS',
             341, 23.8, 60.4, 1.16, 16.3,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Arvejas amarillas partidas'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Arvejas amarillas partidas'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Arvejas amarillas partidas'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Arvejas amarillas partidas'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Arvejas amarillas partidas'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );

INSERT INTO ingredientes (
    nombre, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
             'Lupini', 'GRAMOS',
             371, 36.2, 40.4, 9.74, 18.9,
             100.0, 'GRAMOS'
         );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Lupini'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Lupini'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Lupini'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Lupini'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );
INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM ingredientes WHERE nombre = 'Lupini'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
       );