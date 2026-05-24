-- Hash fijo generado previamente que traducido es "admin"
-- $2a$10$FJ8PeifnHjsBhGI5CAPn/uQwzCrSyybEtsa6Owz9HOWH.zfMRfRTi

-- Diego Maradona
INSERT INTO usuarios (nombre, email, password, objetivo, nivel_cocina, perfil_economico)
VALUES (
           'Diego Maradona',
           'diego@maradona.com',
           '$2a$10$FJ8PeifnHjsBhGI5CAPn/uQwzCrSyybEtsa6Owz9HOWH.zfMRfRTi',
           'INDIFERENTE',
           'BASICO',
           'INTERMEDIO'
       );

INSERT INTO usuarios_restricciones_alimentarias (usuario_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'diego@maradona.com'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );

INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'diego@maradona.com'),
           (SELECT id FROM ingredientes WHERE nombre = 'Cebolla'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'diego@maradona.com'),
           (SELECT id FROM ingredientes WHERE nombre = 'Queso rallado'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'diego@maradona.com'),
           (SELECT id FROM ingredientes WHERE nombre = 'Morrón rojo'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'diego@maradona.com'),
           (SELECT id FROM ingredientes WHERE nombre = 'Ajo'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'diego@maradona.com'),
           (SELECT id FROM ingredientes WHERE nombre = 'Pimienta negra'),
           'EVITAR'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'diego@maradona.com'),
           (SELECT id FROM ingredientes WHERE nombre = 'Azúcar'),
           'EVITAR'
       );

-- ------------------------------------------------------------

-- Ana Vegana
INSERT INTO usuarios (nombre, email, password, objetivo, nivel_cocina, perfil_economico)
VALUES (
           'Ana Vegana',
           'ana@remy.app',
           '$2a$10$FJ8PeifnHjsBhGI5CAPn/uQwzCrSyybEtsa6Owz9HOWH.zfMRfRTi',
           'COMER_SALUDABLE',
           'INTERMEDIO',
           'BAJO_PRESUPUESTO'
       );

INSERT INTO usuarios_restricciones_alimentarias (usuario_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'ana@remy.app'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegetariano')
       );
INSERT INTO usuarios_restricciones_alimentarias (usuario_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'ana@remy.app'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'vegano')
       );
INSERT INTO usuarios_restricciones_alimentarias (usuario_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'ana@remy.app'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_lactosa')
       );

INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'ana@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'ana@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Brócoli'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'ana@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Lentejas'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'ana@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Tomate perita'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'ana@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Queso rallado'),
           'EVITAR'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'ana@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Leche entera'),
           'EVITAR'
       );

-- ------------------------------------------------------------

-- Martina Fitness
INSERT INTO usuarios (nombre, email, password, objetivo, nivel_cocina, perfil_economico)
VALUES (
           'Martina Fitness',
           'martina@remy.app',
           '$2a$10$FJ8PeifnHjsBhGI5CAPn/uQwzCrSyybEtsa6Owz9HOWH.zfMRfRTi',
           'GANAR_MASA_MUSCULAR',
           'AVANZADO',
           'FLEXIBLE'
       );

INSERT INTO usuarios_restricciones_alimentarias (usuario_id, restriccion_alimentaria_id)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'martina@remy.app'),
           (SELECT id FROM restricciones_alimentarias WHERE nombre = 'sin_gluten')
       );

INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'martina@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Pechuga de pollo'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'martina@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Arroz blanco'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'martina@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Huevo'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'martina@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Yogur natural'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'martina@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Papa'),
           'EVITAR'
       );

-- ------------------------------------------------------------

-- Lucas Simple
INSERT INTO usuarios (nombre, email, password, objetivo, nivel_cocina, perfil_economico)
VALUES (
           'Lucas Simple',
           'lucas@remy.app',
           '$2a$10$FJ8PeifnHjsBhGI5CAPn/uQwzCrSyybEtsa6Owz9HOWH.zfMRfRTi',
           'BAJAR_PESO',
           'BASICO',
           'INTERMEDIO'
       );

INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'lucas@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Avena'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'lucas@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Leche entera'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'lucas@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Huevo'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'lucas@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Carne molida'),
           'COMUN'
       );
INSERT INTO preferencias_ingredientes_usuario (usuario_id, ingrediente_id, tipo_preferencia)
VALUES (
           (SELECT id FROM usuarios WHERE email = 'lucas@remy.app'),
           (SELECT id FROM ingredientes WHERE nombre = 'Ajo'),
           'EVITAR'
       );