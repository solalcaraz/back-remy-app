-- Completa restricciones derivables por categoria.
-- V5 solo reforzaba vegetariano; esto habilita recetas veganas y sin lactosa
-- cuando sus ingredientes base efectivamente son compatibles.

INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
SELECT i.id, r.id
FROM ingredientes i
JOIN restricciones_alimentarias r ON r.nombre = 'vegano'
WHERE i.categoria IN (
    'ACEITES_GRASAS',
    'CEREALES_HARINAS',
    'ESPECIAS_CONDIMENTOS',
    'FRUTAS',
    'FRUTOS_SECOS',
    'OTROS_ESENCIALES',
    'PROTEINAS_VEGETALES',
    'VEGETALES_BASE',
    'VEGETALES_HOJA'
)
AND i.nombre NOT IN ('Miel')
ON CONFLICT DO NOTHING;

INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
SELECT i.id, r.id
FROM ingredientes i
JOIN restricciones_alimentarias r ON r.nombre = 'vegetariano'
WHERE i.categoria IN (
    'ACEITES_GRASAS',
    'CEREALES_HARINAS',
    'ESPECIAS_CONDIMENTOS',
    'FRUTAS',
    'FRUTOS_SECOS',
    'LACTEOS',
    'OTROS_ESENCIALES',
    'PROTEINAS_VEGETALES',
    'VEGETALES_BASE',
    'VEGETALES_HOJA'
)
ON CONFLICT DO NOTHING;

INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
SELECT i.id, r.id
FROM ingredientes i
JOIN restricciones_alimentarias r ON r.nombre = 'sin_lactosa'
WHERE i.categoria <> 'LACTEOS'
ON CONFLICT DO NOTHING;
