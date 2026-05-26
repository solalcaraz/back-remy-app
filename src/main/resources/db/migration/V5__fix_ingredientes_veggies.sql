INSERT INTO ingredientes_restricciones_alimentarias (ingrediente_id, restriccion_alimentaria_id)
SELECT i.id, r.id
FROM ingredientes i
    JOIN restricciones_alimentarias r
      ON r.nombre = 'vegetariano'
WHERE i.categoria IN (
      'VEGETALES_BASE',
      'VEGETALES_HOJA',
      'FRUTAS',
      'FRUTOS_SECOS',
      'PROTEINAS_VEGETALES',
      'ESPECIAS_CONDIMENTOS'
)
ON CONFLICT DO NOTHING;