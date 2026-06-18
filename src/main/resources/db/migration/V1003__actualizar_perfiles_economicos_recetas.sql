UPDATE recetas
SET perfil_economico = CASE
    WHEN costo_total_compra <= 15000 THEN 'BAJO_PRESUPUESTO'
    WHEN costo_total_compra <= 25000 THEN 'INTERMEDIO'
    ELSE 'FLEXIBLE'
END;
