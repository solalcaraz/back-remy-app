-- =====================================================================
-- V999__calcular_costos_y_perfiles.sql
-- Actualiza el costo de la compra y el perfil económico de cada receta
-- Dividiendo por 100 el impacto de especias, aceites y esenciales
-- ya que suelen ser costosos pero se usan una ínfima cantidad
-- =====================================================================
-- De momento no funciona porque no tenemos un insert de recetas,
-- entonces las encuentra vacías al momento en que se ejecuta
-- (si corren manualmente el script en la BD después de iniciarla, sí funciona)

WITH CostosReceta AS (
    -- Sumamos el precio de los ingredientes
    SELECT
        ri.receta_id,
        COALESCE(SUM(
                         CASE
                             -- Si la categoría es alguna de estas, dividimos su precio por 100
                             WHEN i.categoria IN ('LACTEOS', 'ACEITES_GRASAS', 'ESPECIAS_CONDIMENTOS', 'OTROS_ESENCIALES')
                                 THEN pi.precio / 100.0
                             -- Para el resto de los ingredientes, el precio completo
                             ELSE pi.precio
                             END
                 ), 0) AS costo_total
    FROM receta_ingredientes ri
             -- Unimos con ingredientes para poder leer la columna "categoria"
             JOIN ingredientes i ON ri.ingrediente_id = i.id
             LEFT JOIN precios_ingredientes pi ON ri.ingrediente_id = pi.ingrediente_id
    GROUP BY ri.receta_id
)
-- Actualizamos la tabla de recetas con esos totales recalculados
UPDATE recetas r
SET
    costo_total_compra = c.costo_total,
    perfil_economico = CASE
                           WHEN c.costo_total < 6000 THEN 'BAJO_PRESUPUESTO'
                           WHEN c.costo_total < 15000 THEN 'INTERMEDIO'
                           ELSE 'FLEXIBLE'
        END
    FROM CostosReceta c
WHERE r.id = c.receta_id;