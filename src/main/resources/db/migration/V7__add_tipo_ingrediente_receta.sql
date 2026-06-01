ALTER TABLE receta_ingredientes
    ADD COLUMN IF NOT EXISTS tipo_ingrediente VARCHAR(20) NOT NULL DEFAULT 'CORE';

CREATE INDEX IF NOT EXISTS idx_receta_ingredientes_tipo
    ON receta_ingredientes(tipo_ingrediente);
