-- Generado automáticamente por generate_ingredientes_sql.py
-- Restricciones calculadas por reglas, NO tomadas del JSON

-- Pechuga de pollo

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Pechuga de pollo', 'PROTEINAS_ANIMALES', 'GRAMOS',
    106.00, 22.50, 0.00, 1.93, NULL,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pechuga de pollo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pechuga de pollo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pechuga de pollo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pechuga de pollo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pechuga de pollo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pechuga de pollo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Carne molida

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Carne molida', 'PROTEINAS_ANIMALES', 'GRAMOS',
    243.00, 17.50, 0.00, 19.40, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Carne molida'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Carne molida'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Carne molida'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Carne molida'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Carne molida'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Bife de lomo

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Bife de lomo', 'PROTEINAS_ANIMALES', 'GRAMOS',
    143.00, 21.10, 0.18, 6.46, NULL,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Bife de lomo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Bife de lomo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Bife de lomo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Bife de lomo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Bife de lomo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Costilla de cerdo

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Costilla de cerdo', 'PROTEINAS_ANIMALES', 'GRAMOS',
    138.00, 19.30, 0.00, 11.80, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Costilla de cerdo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Costilla de cerdo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Costilla de cerdo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Costilla de cerdo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Costilla de cerdo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Huevo

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Huevo', 'PROTEINAS_ANIMALES', 'UNIDAD',
    146.00, 12.60, 0.72, 9.51, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Huevo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Huevo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Huevo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Huevo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Huevo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Huevo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Atún en lata

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Atún en lata', 'PROTEINAS_ANIMALES', 'GRAMOS',
    85.00, 19.00, 0.08, 0.94, NULL,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Atún en lata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Atún en lata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Atún en lata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Atún en lata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Atún en lata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


-- Lentejas

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Lentejas', 'PROTEINAS_VEGETALES', 'GRAMOS',
    360.00, 24.60, 63.40, 1.06, 10.70,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Lentejas'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Lentejas'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Lentejas'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Lentejas'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Lentejas'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Garbanzos

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Garbanzos', 'PROTEINAS_VEGETALES', 'GRAMOS',
    364.00, 19.30, 60.70, 6.04, 17.40,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Garbanzos'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Garbanzos'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Garbanzos'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Garbanzos'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Porotos negros

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Porotos negros', 'PROTEINAS_VEGETALES', 'GRAMOS',
    341.00, 21.60, 62.40, 1.42, 15.50,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Porotos negros'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Porotos negros'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Porotos negros'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Porotos negros'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Porotos negros'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Tofu firme

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Tofu firme', 'PROTEINAS_VEGETALES', 'GRAMOS',
    76.00, 8.08, 1.87, 4.78, 0.30,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tofu firme'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tofu firme'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tofu firme'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tofu firme'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tofu firme'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Tomate perita

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Tomate perita', 'VEGETALES_BASE', 'GRAMOS',
    18.00, 0.88, 3.89, 0.20, 1.20,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tomate perita'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tomate perita'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tomate perita'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tomate perita'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tomate perita'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Cebolla

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Cebolla', 'VEGETALES_BASE', 'GRAMOS',
    36.00, 0.89, 7.68, 0.10, 1.70,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cebolla'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cebolla'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cebolla'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cebolla'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cebolla'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Cebolla morada

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Cebolla morada', 'VEGETALES_BASE', 'GRAMOS',
    44.00, 0.94, 9.93, 0.10, 2.20,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cebolla morada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cebolla morada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cebolla morada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cebolla morada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cebolla morada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Ajo

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Ajo', 'VEGETALES_BASE', 'GRAMOS',
    143.00, 6.62, 28.20, 0.38, 2.70,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Ajo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Ajo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Ajo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Ajo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Ajo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Zanahoria

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Zanahoria', 'VEGETALES_BASE', 'GRAMOS',
    48.00, 0.93, 9.58, 0.24, 3.10,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zanahoria'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zanahoria'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zanahoria'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zanahoria'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zanahoria'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Papa

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Papa', 'VEGETALES_BASE', 'GRAMOS',
    73.00, 1.81, 16.00, 0.26, 2.20,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Papa'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Papa'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Papa'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Papa'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Papa'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Batata

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Batata', 'VEGETALES_BASE', 'GRAMOS',
    86.00, 1.57, 20.10, 0.05, 3.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Batata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Batata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Batata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Batata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Batata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Zapallo anco

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Zapallo anco', 'VEGETALES_BASE', 'GRAMOS',
    48.00, 1.00, 11.70, 0.10, 2.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zapallo anco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zapallo anco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zapallo anco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zapallo anco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zapallo anco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Morrón rojo

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Morrón rojo', 'VEGETALES_BASE', 'GRAMOS',
    31.30, 0.89, 6.65, 0.13, 1.16,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Morrón rojo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Morrón rojo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Morrón rojo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Morrón rojo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Morrón rojo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Morrón verde

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Morrón verde', 'VEGETALES_BASE', 'GRAMOS',
    22.90, 0.72, 4.78, 0.11, 0.94,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Morrón verde'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Morrón verde'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Morrón verde'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Morrón verde'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Morrón verde'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Apio

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Apio', 'VEGETALES_BASE', 'GRAMOS',
    16.70, 0.49, 3.32, 0.16, NULL,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Apio'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Apio'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Apio'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Apio'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Apio'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Choclo

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Choclo', 'VEGETALES_BASE', 'GRAMOS',
    84.60, 2.79, 14.70, 1.63, 2.43,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Choclo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Choclo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Choclo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Choclo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Choclo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Espinaca

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Espinaca', 'VEGETALES_HOJA', 'GRAMOS',
    27.00, 2.86, 3.63, 0.39, 2.20,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Espinaca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Espinaca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Espinaca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Espinaca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Espinaca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Lechuga

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Lechuga', 'VEGETALES_HOJA', 'GRAMOS',
    17.10, 0.74, 3.37, 0.07, NULL,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Lechuga'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Lechuga'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Lechuga'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Lechuga'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Lechuga'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Brócoli

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Brócoli', 'VEGETALES_HOJA', 'GRAMOS',
    39.00, 2.57, 6.27, 0.34, 2.40,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Brócoli'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Brócoli'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Brócoli'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Brócoli'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Brócoli'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Acelga

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Acelga', 'VEGETALES_HOJA', 'GRAMOS',
    19.00, 1.80, 3.74, 0.20, 1.60,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Acelga'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Acelga'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Acelga'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Acelga'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Acelga'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Rúcula

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Rúcula', 'VEGETALES_HOJA', 'GRAMOS',
    31.00, 1.65, 5.37, 0.32, 2.30,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Rúcula'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Rúcula'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Rúcula'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Rúcula'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Rúcula'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Arroz blanco

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Arroz blanco', 'CEREALES_HARINAS', 'GRAMOS',
    359.00, 7.04, 80.30, 1.03, 0.15,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Arroz integral

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Arroz integral', 'CEREALES_HARINAS', 'GRAMOS',
    366.00, 7.25, 76.70, 3.31, 3.02,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz integral'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz integral'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz integral'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz integral'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz integral'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz integral'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz integral'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arroz integral'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Harina 0000

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Harina 0000', 'CEREALES_HARINAS', 'GRAMOS',
    366.00, 10.90, 77.30, 1.48, NULL,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina 0000'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina 0000'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina 0000'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina 0000'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina 0000'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina 0000'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina 0000'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Harina de garbanzo

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Harina de garbanzo', 'CEREALES_HARINAS', 'GRAMOS',
    387.00, 22.40, 57.80, 6.69, 10.80,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina de garbanzo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina de garbanzo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina de garbanzo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina de garbanzo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina de garbanzo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina de garbanzo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina de garbanzo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Avena

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Avena', 'CEREALES_HARINAS', 'GRAMOS',
    389.00, 16.90, 66.30, 6.90, 10.60,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Avena'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Avena'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Avena'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Avena'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Avena'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Avena'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Avena'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Fideos spaghetti

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Fideos spaghetti', 'CEREALES_HARINAS', 'GRAMOS',
    371.00, 13.00, 74.70, 1.51, 3.20,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Fideos spaghetti'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Fideos spaghetti'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Fideos spaghetti'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Fideos spaghetti'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Fideos spaghetti'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Fideos spaghetti'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Fideos spaghetti'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Fideos integrales

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Fideos integrales', 'CEREALES_HARINAS', 'GRAMOS',
    357.00, 13.50, 73.10, 2.68, 10.10,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Fideos integrales'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Fideos integrales'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Fideos integrales'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Fideos integrales'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Fideos integrales'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Fideos integrales'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Fideos integrales'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Pan rallado

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Pan rallado', 'CEREALES_HARINAS', 'GRAMOS',
    395.00, 13.40, 72.00, 5.30, 4.50,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pan rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pan rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pan rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pan rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pan rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pan rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Quinoa

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Quinoa', 'CEREALES_HARINAS', 'GRAMOS',
    368.00, 14.10, 64.20, 6.07, 7.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Quinoa'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Quinoa'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Quinoa'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Quinoa'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Quinoa'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Quinoa'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Quinoa'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Leche entera

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Leche entera', 'LACTEOS', 'MILILITROS',
    61.00, 3.15, 4.80, 3.25, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche entera'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche entera'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche entera'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche entera'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche entera'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche entera'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Leche descremada

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Leche descremada', 'LACTEOS', 'MILILITROS',
    34.00, 3.37, 4.96, 0.08, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche descremada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche descremada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche descremada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche descremada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche descremada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche descremada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Leche de almendras

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Leche de almendras', 'LACTEOS', 'MILILITROS',
    19.30, 0.66, 0.67, 1.56, 0.75,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Leche de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Queso rallado

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Queso rallado', 'LACTEOS', 'GRAMOS',
    420.00, 28.40, 13.90, 27.80, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Queso rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Queso rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Queso rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Queso rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Queso rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Queso crema

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Queso crema', 'LACTEOS', 'GRAMOS',
    343.00, 6.15, 5.52, 34.40, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Queso crema'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Queso crema'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Queso crema'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Queso crema'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Queso crema'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Yogur natural

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Yogur natural', 'LACTEOS', 'GRAMOS',
    78.00, 3.82, 5.57, 4.48, NULL,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Yogur natural'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Yogur natural'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Yogur natural'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Yogur natural'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Yogur natural'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Yogur natural'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Crema de leche

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Crema de leche', 'LACTEOS', 'MILILITROS',
    343.00, 2.02, 3.80, 35.60, NULL,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Crema de leche'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Crema de leche'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Crema de leche'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Crema de leche'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Crema de leche'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Manteca

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Manteca', 'ACEITES_GRASAS', 'GRAMOS',
    717.00, 0.85, 0.06, 81.10, NULL,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Manteca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Manteca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Manteca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Manteca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Manteca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Aceite de girasol

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Aceite de girasol', 'ACEITES_GRASAS', 'MILILITROS',
    884.00, 0.00, 0.00, 100.00, NULL,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de girasol'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de girasol'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de girasol'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de girasol'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de girasol'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de girasol'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de girasol'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Aceite de oliva

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Aceite de oliva', 'ACEITES_GRASAS', 'MILILITROS',
    884.00, 0.00, 0.00, 100.00, NULL,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de oliva'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de oliva'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de oliva'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de oliva'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de oliva'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de oliva'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de oliva'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Sal fina

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Sal fina', 'ESPECIAS_CONDIMENTOS', 'GRAMOS',
    0.00, 0.00, 0.00, 0.00, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Sal fina'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Sal fina'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Sal fina'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Sal fina'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Pimienta negra

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Pimienta negra', 'ESPECIAS_CONDIMENTOS', 'GRAMOS',
    251.00, 10.40, 64.00, 3.26, 25.30,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pimienta negra'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pimienta negra'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pimienta negra'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pimienta negra'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pimienta negra'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Pimentón dulce

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Pimentón dulce', 'ESPECIAS_CONDIMENTOS', 'GRAMOS',
    282.00, 14.10, 54.00, 12.90, 34.90,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pimentón dulce'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pimentón dulce'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pimentón dulce'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pimentón dulce'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Comino

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Comino', 'ESPECIAS_CONDIMENTOS', 'GRAMOS',
    375.00, 17.80, 44.20, 22.30, 10.50,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Comino'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Comino'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Comino'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Comino'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Orégano seco

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Orégano seco', 'ESPECIAS_CONDIMENTOS', 'GRAMOS',
    265.00, 9.00, 68.90, 4.28, 42.50,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Orégano seco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Orégano seco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Orégano seco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Orégano seco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Orégano seco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Laurel

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Laurel', 'ESPECIAS_CONDIMENTOS', 'GRAMOS',
    313.00, 7.61, 75.00, 8.36, 26.30,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Laurel'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Laurel'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Laurel'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Laurel'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Ají molido

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Ají molido', 'ESPECIAS_CONDIMENTOS', 'GRAMOS',
    314.00, 12.00, 56.60, 16.80, 28.70,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Ají molido'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Ají molido'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Ají molido'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Ají molido'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Perejil fresco

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Perejil fresco', 'ESPECIAS_CONDIMENTOS', 'GRAMOS',
    36.00, 2.97, 6.33, 0.79, 3.30,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Perejil fresco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Perejil fresco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Perejil fresco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Perejil fresco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Perejil fresco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Cúrcuma

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Cúrcuma', 'ESPECIAS_CONDIMENTOS', 'GRAMOS',
    312.00, 9.68, 67.10, 3.25, 22.70,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cúrcuma'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cúrcuma'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cúrcuma'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cúrcuma'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cúrcuma'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Jengibre fresco

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Jengibre fresco', 'ESPECIAS_CONDIMENTOS', 'GRAMOS',
    80.00, 1.82, 17.80, 0.75, 2.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Jengibre fresco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Jengibre fresco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Jengibre fresco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Jengibre fresco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Jengibre fresco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Vinagre de manzana

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Vinagre de manzana', 'ESPECIAS_CONDIMENTOS', 'MILILITROS',
    0.00, 0.00, 0.93, 0.00, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Vinagre de manzana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Vinagre de manzana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Vinagre de manzana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Vinagre de manzana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Vinagre de manzana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Salsa de soja

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Salsa de soja', 'ESPECIAS_CONDIMENTOS', 'MILILITROS',
    60.00, 10.50, 5.57, 0.10, 0.80,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Salsa de soja'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Salsa de soja'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Salsa de soja'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Salsa de soja'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Mostaza

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Mostaza', 'ESPECIAS_CONDIMENTOS', 'GRAMOS',
    66.00, 4.37, 5.83, 3.34, 3.30,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Mostaza'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Mostaza'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Mostaza'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Mostaza'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Mostaza'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Caldo de verduras bajo en sodio

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Caldo de verduras bajo en sodio', 'OTROS_ESENCIALES', 'MILILITROS',
    5.00, 0.20, 1.20, 0.10, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Caldo de verduras bajo en sodio'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Caldo de verduras bajo en sodio'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Caldo de verduras bajo en sodio'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Caldo de verduras bajo en sodio'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Caldo de verduras bajo en sodio'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Caldo de verduras bajo en sodio'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Caldo de pollo

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Caldo de pollo', 'OTROS_ESENCIALES', 'MILILITROS',
    7.00, 0.80, 0.50, 0.30, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Caldo de pollo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Caldo de pollo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Caldo de pollo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Caldo de pollo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Caldo de pollo'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Salsa de tomate

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Salsa de tomate', 'OTROS_ESENCIALES', 'MILILITROS',
    29.00, 1.59, 6.95, 0.16, 1.50,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Salsa de tomate'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Salsa de tomate'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Salsa de tomate'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Salsa de tomate'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Salsa de tomate'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Salsa de tomate'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Tomate triturado

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Tomate triturado', 'OTROS_ESENCIALES', 'MILILITROS',
    32.00, 1.60, 7.30, 0.27, 1.90,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tomate triturado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tomate triturado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tomate triturado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tomate triturado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tomate triturado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tomate triturado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Azúcar

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Azúcar', 'OTROS_ESENCIALES', 'GRAMOS',
    387.00, 0.00, 99.80, 0.00, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Azúcar'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Azúcar'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Azúcar'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Azúcar'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Azúcar'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Azúcar'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Stevia

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Stevia', 'OTROS_ESENCIALES', 'GRAMOS',
    0.00, 0.00, 95.60, 0.00, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Stevia'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Stevia'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Stevia'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Stevia'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Stevia'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Stevia'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Stevia'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Miel

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Miel', 'OTROS_ESENCIALES', 'GRAMOS',
    304.00, 0.30, 82.40, 0.00, 0.20,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Miel'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Miel'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Miel'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Miel'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Miel'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Polvo para hornear

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Polvo para hornear', 'OTROS_ESENCIALES', 'GRAMOS',
    53.00, 0.00, 27.70, 0.00, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Polvo para hornear'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Polvo para hornear'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Polvo para hornear'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Polvo para hornear'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Polvo para hornear'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Polvo para hornear'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Limón

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Limón', 'FRUTAS', 'UNIDAD',
    29.00, 1.10, 9.32, 0.30, 2.80,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Limón'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Limón'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Limón'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Limón'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Limón'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Naranja

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Naranja', 'FRUTAS', 'UNIDAD',
    47.00, 0.94, 11.80, 0.12, 2.40,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Naranja'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Naranja'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Naranja'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Naranja'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Naranja'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Banana

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Banana', 'FRUTAS', 'UNIDAD',
    89.00, 1.09, 22.80, 0.33, 2.60,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Banana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Banana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Banana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Banana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Banana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Manzana

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Manzana', 'FRUTAS', 'UNIDAD',
    52.00, 0.26, 13.80, 0.17, 2.40,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Manzana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Manzana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Manzana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Manzana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Manzana'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Palta

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Palta', 'FRUTAS', 'UNIDAD',
    160.00, 2.00, 8.53, 14.70, 6.70,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Palta'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Palta'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Palta'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Palta'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Nueces

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Nueces', 'FRUTOS_SECOS', 'GRAMOS',
    730.00, 14.60, 10.90, 69.70, 5.21,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Nueces'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Nueces'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Nueces'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Nueces'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Almendras

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Almendras', 'FRUTOS_SECOS', 'GRAMOS',
    626.00, 21.50, 20.00, 51.10, 10.80,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Semillas de chía

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Semillas de chía', 'FRUTOS_SECOS', 'GRAMOS',
    486.00, 16.50, 42.10, 30.70, 34.40,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Semillas de chía'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Semillas de chía'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Semillas de chía'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Semillas de chía'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Coco rallado

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Coco rallado', 'FRUTOS_SECOS', 'GRAMOS',
    660.00, 6.88, 23.70, 64.50, 16.30,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Coco rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Coco rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Coco rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Coco rallado'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Harina de almendras

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Harina de almendras', 'CEREALES_HARINAS', 'GRAMOS',
    622.00, 26.20, 16.20, 50.20, 9.27,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Harina de almendras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Almidón de maíz

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Almidón de maíz', 'CEREALES_HARINAS', 'GRAMOS',
    381.00, 0.26, 91.30, 0.05, 0.90,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Almidón de maíz'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Almidón de maíz'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Almidón de maíz'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Almidón de maíz'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Almidón de maíz'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Almidón de maíz'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Almidón de maíz'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Almidón de maíz'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Cacao en polvo sin azúcar

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Cacao en polvo sin azúcar', 'OTROS_ESENCIALES', 'GRAMOS',
    229.00, 19.60, 57.90, 13.70, 33.20,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cacao en polvo sin azúcar'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cacao en polvo sin azúcar'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cacao en polvo sin azúcar'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cacao en polvo sin azúcar'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cacao en polvo sin azúcar'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Cacao en polvo sin azúcar'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Vainilla esencia

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Vainilla esencia', 'OTROS_ESENCIALES', 'MILILITROS',
    288.00, 0.06, 12.70, 0.06, 0.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Vainilla esencia'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Vainilla esencia'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Vainilla esencia'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Vainilla esencia'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Vainilla esencia'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Vainilla esencia'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Aceitunas negras

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Aceitunas negras', 'OTROS_ESENCIALES', 'GRAMOS',
    115.00, 0.84, 6.26, 10.90, 3.20,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas negras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas negras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas negras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas negras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas negras'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Aceitunas verdes

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Aceitunas verdes', 'OTROS_ESENCIALES', 'GRAMOS',
    145.00, 1.03, 3.84, 15.30, 3.30,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas verdes'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas verdes'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas verdes'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas verdes'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceitunas verdes'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Pasas de uva

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Pasas de uva', 'FRUTAS', 'GRAMOS',
    299.00, 3.07, 79.20, 0.46, 3.70,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pasas de uva'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pasas de uva'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pasas de uva'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pasas de uva'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Pasas de uva'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Tapas de empanada

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Tapas de empanada', 'CEREALES_HARINAS', 'UNIDAD',
    290.00, 7.50, 55.00, 4.00, 1.50,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tapas de empanada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tapas de empanada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tapas de empanada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tapas de empanada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tapas de empanada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tapas de empanada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tapas de empanada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Masa para tarta

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Masa para tarta', 'CEREALES_HARINAS', 'GRAMOS',
    430.00, 5.50, 42.00, 26.00, 1.20,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Masa para tarta'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Masa para tarta'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Masa para tarta'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Masa para tarta'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Masa para tarta'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Masa para tarta'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Levadura seca

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Levadura seca', 'OTROS_ESENCIALES', 'GRAMOS',
    325.00, 40.40, 41.20, 7.61, 26.90,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Levadura seca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Levadura seca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Levadura seca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Levadura seca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Levadura seca'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Aceite de coco

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Aceite de coco', 'ACEITES_GRASAS', 'MILILITROS',
    862.00, 0.00, 0.00, 100.00, NULL,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de coco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de coco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de coco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de coco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de coco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de coco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Aceite de coco'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Arvejas

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Arvejas', 'VEGETALES_BASE', 'GRAMOS',
    77.00, 5.15, 14.30, 0.27, 4.50,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arvejas'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arvejas'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arvejas'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arvejas'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arvejas'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Champiñones

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Champiñones', 'VEGETALES_BASE', 'GRAMOS',
    22.00, 3.09, 3.26, 0.34, 1.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Champiñones'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Champiñones'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Champiñones'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Champiñones'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Champiñones'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Berenjena

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Berenjena', 'VEGETALES_BASE', 'GRAMOS',
    25.00, 0.98, 5.88, 0.18, 3.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Berenjena'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Berenjena'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Berenjena'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Berenjena'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Berenjena'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Zapallito verde

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Zapallito verde', 'VEGETALES_BASE', 'GRAMOS',
    17.00, 1.21, 3.11, 0.32, 1.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zapallito verde'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zapallito verde'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zapallito verde'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zapallito verde'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zapallito verde'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Choclo en lata

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Choclo en lata', 'VEGETALES_BASE', 'GRAMOS',
    83.00, 2.46, 20.00, 0.63, 2.30,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Choclo en lata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Choclo en lata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Choclo en lata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Choclo en lata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Choclo en lata'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Remolacha

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Remolacha', 'VEGETALES_BASE', 'GRAMOS',
    43.00, 1.61, 9.56, 0.17, 2.80,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Remolacha'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Remolacha'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Remolacha'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
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


-- Zucchini

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Zucchini', 'VEGETALES_BASE', 'GRAMOS',
    17.00, 1.21, 3.11, 0.32, 1.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zucchini'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zucchini'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Zucchini'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
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


-- Coliflor

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Coliflor', 'VEGETALES_BASE', 'GRAMOS',
    25.00, 1.92, 4.97, 0.28, 2.00,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Coliflor'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Coliflor'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Coliflor'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
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


-- Maní

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Maní', 'FRUTOS_SECOS', 'GRAMOS',
    567.00, 25.80, 16.10, 49.20, 8.50,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Maní'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Maní'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
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


-- Semillas de girasol

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Semillas de girasol', 'FRUTOS_SECOS', 'GRAMOS',
    584.00, 20.78, 20.00, 51.50, 8.60,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Semillas de girasol'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Semillas de girasol'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
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


-- Queso parmesano

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Queso parmesano', 'LACTEOS', 'GRAMOS',
    431.00, 38.50, 4.06, 28.60, NULL,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Queso parmesano'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Queso parmesano'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
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


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Queso parmesano'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
);


-- Espárragos

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Espárragos', 'VEGETALES_BASE', 'GRAMOS',
    20.00, 2.20, 3.88, 0.12, 2.10,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Espárragos'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Espárragos'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Espárragos'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
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


-- Jamón cocido

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Jamón cocido', 'PROTEINAS_ANIMALES', 'GRAMOS',
    107.00, 16.20, 1.51, 4.02, NULL,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Jamón cocido'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Jamón cocido'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Jamón cocido'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Jamón cocido'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Jamón cocido'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Seitán

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Seitán', 'PROTEINAS_VEGETALES', 'GRAMOS',
    370.00, 75.00, 14.00, 1.90, 0.60,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Seitán'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Seitán'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Seitán'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Seitán'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Seitán'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_mariscos')
);


-- Tempeh

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Tempeh', 'PROTEINAS_VEGETALES', 'GRAMOS',
    193.00, 18.50, 9.39, 10.80, 3.40,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tempeh'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Tempeh'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
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


-- Soja texturizada

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Soja texturizada', 'PROTEINAS_VEGETALES', 'GRAMOS',
    329.00, 51.50, 28.00, 1.20, 13.70,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Soja texturizada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Soja texturizada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Soja texturizada'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
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


-- Edamame

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Edamame', 'PROTEINAS_VEGETALES', 'GRAMOS',
    122.00, 10.90, 8.91, 5.20, 5.20,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Edamame'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Edamame'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
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


-- Porotos blancos

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Porotos blancos', 'PROTEINAS_VEGETALES', 'GRAMOS',
    333.00, 23.40, 60.30, 0.85, 15.70,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Porotos blancos'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Porotos blancos'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Porotos blancos'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
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


-- Porotos aduki

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Porotos aduki', 'PROTEINAS_VEGETALES', 'GRAMOS',
    329.00, 19.90, 62.90, 0.53, 12.70,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Porotos aduki'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Porotos aduki'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Porotos aduki'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
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


-- Arvejas amarillas partidas

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Arvejas amarillas partidas', 'PROTEINAS_VEGETALES', 'GRAMOS',
    341.00, 23.80, 60.40, 1.16, 16.30,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arvejas amarillas partidas'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_en_grasas')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arvejas amarillas partidas'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Arvejas amarillas partidas'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
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


-- Lupini

INSERT INTO ingredientes (
    nombre, categoria, unidad_base,
    calorias, proteinas, carbohidratos, grasas, fibra,
    cantidad_referencia, unidad_referencia
) VALUES (
    'Lupini', 'PROTEINAS_VEGETALES', 'GRAMOS',
    371.00, 36.20, 40.40, 9.74, 18.90,
    100.00, 'GRAMOS'
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Lupini'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'bajo_sodio')
);


INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
VALUES (
    (SELECT id FROM ingredientes WHERE nombre = 'Lupini'),
    (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_azucar')
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

