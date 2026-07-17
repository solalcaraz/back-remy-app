-- Usuarios preparados para la demo de tesis.
-- Passwords definidos desde el flujo normal de la aplicacion.

INSERT INTO usuarios (id, nombre, email, password, foto_url, objetivo, nivel_cocina, perfil_economico)
VALUES
    (
        '316602af-6cfa-48bc-8874-19d31b9b0396',
        'Marcela Vegana',
        'vegano@remy.com',
        '$2a$10$hExlpA4ZcJyjgH19RvwCw.46vcpLZytYt43Wuy7S4BWfO6VZPe5Sm',
        '/uploads/usuarios/316602af-6cfa-48bc-8874-19d31b9b0396.jpg',
        'GANAR_MASA_MUSCULAR',
        'AVANZADO',
        'FLEXIBLE'
    ),
    (
        '9413cef3-2b8e-4ff3-8623-84144edc270d',
        'Ricardo Bajopeso',
        'bajopeso@remy.com',
        '$2a$10$Yq1CMoLANS6fxdykYCnXBO4r84f3iIRKjgRN0NT01PX28uKLr1S.u',
        '/uploads/usuarios/9413cef3-2b8e-4ff3-8623-84144edc270d.webp',
        'BAJAR_PESO',
        'AVANZADO',
        'BAJO_PRESUPUESTO'
    ),
    (
        '2194d7f6-4a41-44e3-ac90-822ba80633d6',
        'Messingluten',
        'singluten@remy.com',
        '$2a$10$YDVafNz9Rg5I/3NWKJxXmOqYirywhyTs.FX/cNyKXHSFpXpdjIN/a',
        '/uploads/usuarios/2194d7f6-4a41-44e3-ac90-822ba80633d6.jpg',
        'COMER_SALUDABLE',
        'AVANZADO',
        'INTERMEDIO'
    )
ON CONFLICT (email) DO UPDATE SET
    id = EXCLUDED.id,
    nombre = EXCLUDED.nombre,
    password = EXCLUDED.password,
    foto_url = EXCLUDED.foto_url,
    objetivo = EXCLUDED.objetivo,
    nivel_cocina = EXCLUDED.nivel_cocina,
    perfil_economico = EXCLUDED.perfil_economico;

DELETE FROM usuarios_restricciones_alimentarias
WHERE usuario_id IN (
    '316602af-6cfa-48bc-8874-19d31b9b0396',
    '9413cef3-2b8e-4ff3-8623-84144edc270d',
    '2194d7f6-4a41-44e3-ac90-822ba80633d6'
);

INSERT INTO usuarios_restricciones_alimentarias (usuario_id, restriccion_alimentaria_id)
SELECT usuario_id::uuid, r.id
FROM (
    VALUES
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'vegetariano'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'vegano'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'sin_lactosa'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'sin_gluten'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'sin_lactosa')
) AS data(usuario_id, restriccion_nombre)
JOIN restricciones_alimentarias r ON r.nombre = data.restriccion_nombre
ON CONFLICT DO NOTHING;

DELETE FROM preferencias_ingredientes_usuario
WHERE usuario_id IN (
    '316602af-6cfa-48bc-8874-19d31b9b0396',
    '9413cef3-2b8e-4ff3-8623-84144edc270d',
    '2194d7f6-4a41-44e3-ac90-822ba80633d6'
);

INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
SELECT data.usuario_id::uuid, i.id, data.tipo_preferencia
FROM (
    VALUES
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Ajo', 'COMUN'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Arroz blanco', 'COMUN'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Cebolla', 'COMUN'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Espinaca', 'COMUN'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Garbanzos', 'COMUN'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Lentejas', 'COMUN'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Palta', 'COMUN'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Quinoa', 'COMUN'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Soja texturizada', 'COMUN'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Tofu firme', 'COMUN'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Carne molida', 'EVITAR'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Huevo', 'EVITAR'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Leche entera', 'EVITAR'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Pechuga de pollo', 'EVITAR'),
        ('316602af-6cfa-48bc-8874-19d31b9b0396', 'Queso rallado', 'EVITAR'),

        ('9413cef3-2b8e-4ff3-8623-84144edc270d', 'Ajo', 'COMUN'),
        ('9413cef3-2b8e-4ff3-8623-84144edc270d', 'Arroz blanco', 'COMUN'),
        ('9413cef3-2b8e-4ff3-8623-84144edc270d', 'Atún en lata', 'COMUN'),
        ('9413cef3-2b8e-4ff3-8623-84144edc270d', 'Avena', 'COMUN'),
        ('9413cef3-2b8e-4ff3-8623-84144edc270d', 'Cebolla', 'COMUN'),
        ('9413cef3-2b8e-4ff3-8623-84144edc270d', 'Huevo', 'COMUN'),
        ('9413cef3-2b8e-4ff3-8623-84144edc270d', 'Lechuga', 'COMUN'),
        ('9413cef3-2b8e-4ff3-8623-84144edc270d', 'Tomate perita', 'COMUN'),
        ('9413cef3-2b8e-4ff3-8623-84144edc270d', 'Zapallito verde', 'COMUN'),
        ('9413cef3-2b8e-4ff3-8623-84144edc270d', 'Azúcar', 'EVITAR'),
        ('9413cef3-2b8e-4ff3-8623-84144edc270d', 'Crema de leche', 'EVITAR'),
        ('9413cef3-2b8e-4ff3-8623-84144edc270d', 'Lentejas', 'EVITAR'),
        ('9413cef3-2b8e-4ff3-8623-84144edc270d', 'Manteca', 'EVITAR'),
        ('9413cef3-2b8e-4ff3-8623-84144edc270d', 'Queso rallado', 'EVITAR'),

        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Almidón de maíz', 'COMUN'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Arroz blanco', 'COMUN'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Arroz integral', 'COMUN'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Cebolla morada', 'COMUN'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Edamame', 'COMUN'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Harina de garbanzo', 'COMUN'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Huevo', 'COMUN'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Lechuga', 'COMUN'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Pechuga de pollo', 'COMUN'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Tomate perita', 'COMUN'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Harina 0000', 'EVITAR'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Leche entera', 'EVITAR'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Manteca', 'EVITAR'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Pan rallado', 'EVITAR'),
        ('2194d7f6-4a41-44e3-ac90-822ba80633d6', 'Queso rallado', 'EVITAR')
) AS data(usuario_id, ingrediente_nombre, tipo_preferencia)
JOIN ingredientes i ON i.nombre = data.ingrediente_nombre
ON CONFLICT (usuario_id, ingrediente_id) DO UPDATE SET
    tipo_preferencia = EXCLUDED.tipo_preferencia;
