-- V1002__update_imagenesUrl_pasos.sql
-- Migración generada para actualizar las URLs de las imágenes de los pasos (Corregida)

-- Receta: Milanesa de carne con pure de papa
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de carne con pure de papa')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de carne con pure de papa')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de carne con pure de papa')
  AND orden = 3;

-- Receta: Empanadas de carne
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Empanadas de carne')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Empanadas de carne')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Empanadas de carne')
  AND orden = 3;

-- Receta: Pastel de papa
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pastel de papa')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pastel de papa')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1574484284002-952d92456975?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pastel de papa')
  AND orden = 3;

-- Receta: Pizza casera de tomate y queso
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pizza casera de tomate y queso')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pizza casera de tomate y queso')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pizza casera de tomate y queso')
  AND orden = 3;

-- Receta: Tarta de jamon y queso
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tarta de jamon y queso')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tarta de jamon y queso')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tarta de jamon y queso')
  AND orden = 3;

-- Receta: Tarta de acelga
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tarta de acelga')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tarta de acelga')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tarta de acelga')
  AND orden = 3;

-- Receta: Tortilla de papa
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tortilla de papa')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tortilla de papa')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tortilla de papa')
  AND orden = 3;

-- Receta: Ñoquis de papa con salsa de tomate
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ñoquis de papa con salsa de tomate')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ñoquis de papa con salsa de tomate')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ñoquis de papa con salsa de tomate')
  AND orden = 3;

-- Receta: Fideos con salsa bolognesa
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1481931098730-318b6f776db0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Fideos con salsa bolognesa')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Fideos con salsa bolognesa')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Fideos con salsa bolognesa')
  AND orden = 3;

-- Receta: Fideos con crema y champiñones
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Fideos con crema y champiñones')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Fideos con crema y champiñones')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Fideos con crema y champiñones')
  AND orden = 3;

-- Receta: Arroz con pollo
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1598103442097-8b74394b95c2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Arroz con pollo')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Arroz con pollo')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1536304929831-ee1ca9d44906?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Arroz con pollo')
  AND orden = 3;

-- Receta: Guiso de lentejas
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Guiso de lentejas')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Guiso de lentejas')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Guiso de lentejas')
  AND orden = 3;

-- Receta: Wok de pollo y vegetales
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1517093157656-b9eccef91cb1?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Wok de pollo y vegetales')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Wok de pollo y vegetales')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Wok de pollo y vegetales')
  AND orden = 3;

-- Receta: Wok de vegetales con tofu
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Wok de vegetales con tofu')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Wok de vegetales con tofu')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Wok de vegetales con tofu')
  AND orden = 3;

-- Receta: Sushi casero de atun y palta
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1536304929831-ee1ca9d44906?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Sushi casero de atun y palta')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Sushi casero de atun y palta')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1562802378-063ec186a863?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Sushi casero de atun y palta')
  AND orden = 3;

-- Receta: Hamburguesas caseras con ensalada
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Hamburguesas caseras con ensalada')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Hamburguesas caseras con ensalada')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Hamburguesas caseras con ensalada')
  AND orden = 3;

-- Receta: Pollo al horno con papas
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pollo al horno con papas')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pollo al horno con papas')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1558030006-450675393462?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pollo al horno con papas')
  AND orden = 3;

-- Receta: Bife con ensalada de rucula
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Bife con ensalada de rucula')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1558030006-450675393462?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Bife con ensalada de rucula')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Bife con ensalada de rucula')
  AND orden = 3;

-- Receta: Costillas de cerdo con batatas
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1558030006-450675393462?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Costillas de cerdo con batatas')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Costillas de cerdo con batatas')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Costillas de cerdo con batatas')
  AND orden = 3;

-- Receta: Ensalada Cesar con pollo
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1598103442097-8b74394b95c2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ensalada Cesar con pollo')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ensalada Cesar con pollo')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ensalada Cesar con pollo')
  AND orden = 3;

-- Receta: Ensalada de arroz y atun
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ensalada de arroz y atun')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ensalada de arroz y atun')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ensalada de arroz y atun')
  AND orden = 3;

-- Receta: Ensalada rusa
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ensalada rusa')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ensalada rusa')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ensalada rusa')
  AND orden = 3;

-- Receta: Humita en olla
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Humita en olla')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Humita en olla')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Humita en olla')
  AND orden = 3;

-- Receta: Locro simple de porotos y zapallo
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Locro simple de porotos y zapallo')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Locro simple de porotos y zapallo')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Locro simple de porotos y zapallo')
  AND orden = 3;

-- Receta: Risotto de champiñones
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Risotto de champiñones')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1536304929831-ee1ca9d44906?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Risotto de champiñones')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Risotto de champiñones')
  AND orden = 3;

-- Receta: Quinoa con vegetales asados
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Quinoa con vegetales asados')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1615485290382-441e4d049cb5?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Quinoa con vegetales asados')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Quinoa con vegetales asados')
  AND orden = 3;

-- Receta: Berenjenas rellenas
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Berenjenas rellenas')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Berenjenas rellenas')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1574484284002-952d92456975?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Berenjenas rellenas')
  AND orden = 3;

-- Receta: Zapallitos rellenos
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1577041677443-8bbf07892f5e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Zapallitos rellenos')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Zapallitos rellenos')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Zapallitos rellenos')
  AND orden = 3;

-- Receta: Brócoli gratinado
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Brócoli gratinado')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1574484284002-952d92456975?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Brócoli gratinado')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1574484284002-952d92456975?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Brócoli gratinado')
  AND orden = 3;

-- Receta: Coliflor al horno con curcuma
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Coliflor al horno con curcuma')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Coliflor al horno con curcuma')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Coliflor al horno con curcuma')
  AND orden = 3;

-- Receta: Croquetas de arroz
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Croquetas de arroz')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Croquetas de arroz')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Croquetas de arroz')
  AND orden = 3;

-- Receta: Falafel de garbanzos al horno
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Falafel de garbanzos al horno')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Falafel de garbanzos al horno')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Falafel de garbanzos al horno')
  AND orden = 3;

-- Receta: Hummus clasico
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1583608354155-ef2f1e475f9e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Hummus clasico')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Hummus clasico')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Hummus clasico')
  AND orden = 3;

-- Receta: Tacos de carne con palta
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tacos de carne con palta')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tacos de carne con palta')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tacos de carne con palta')
  AND orden = 3;

-- Receta: Chili de porotos negros
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1481931098730-318b6f776db0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Chili de porotos negros')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Chili de porotos negros')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1485963631004-f2f00b1d6606?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Chili de porotos negros')
  AND orden = 3;

-- Receta: Curry de garbanzos y espinaca
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Curry de garbanzos y espinaca')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Curry de garbanzos y espinaca')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Curry de garbanzos y espinaca')
  AND orden = 3;

-- Receta: Dahl de lentejas
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Dahl de lentejas')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Dahl de lentejas')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1536304929831-ee1ca9d44906?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Dahl de lentejas')
  AND orden = 3;

-- Receta: Ratatouille simple
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ratatouille simple')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ratatouille simple')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ratatouille simple')
  AND orden = 3;

-- Receta: Shakshuka
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Shakshuka')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1582169296194-e4d644c48063?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Shakshuka')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Shakshuka')
  AND orden = 3;

-- Receta: Omelette de queso y espinaca
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Omelette de queso y espinaca')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Omelette de queso y espinaca')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Omelette de queso y espinaca')
  AND orden = 3;

-- Receta: Flan casero
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1499636136210-6f4ee915583e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Flan casero')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Flan casero')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Flan casero')
  AND orden = 3;

-- Receta: Arroz con leche
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1536304929831-ee1ca9d44906?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Arroz con leche')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1499636136210-6f4ee915583e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Arroz con leche')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Arroz con leche')
  AND orden = 3;

-- Receta: Budin de banana
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Budin de banana')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Budin de banana')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Budin de banana')
  AND orden = 3;

-- Receta: Brownies de cacao y nuez
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Brownies de cacao y nuez')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Brownies de cacao y nuez')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Brownies de cacao y nuez')
  AND orden = 3;

-- Receta: Porridge de avena y banana
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1495214783159-3503fd1b572d?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Porridge de avena y banana')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1499636136210-6f4ee915583e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Porridge de avena y banana')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Porridge de avena y banana')
  AND orden = 3;

-- Receta: Muffins de avena y manzana
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Muffins de avena y manzana')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Muffins de avena y manzana')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Muffins de avena y manzana')
  AND orden = 3;

-- Receta: Galletitas de avena
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Galletitas de avena')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Galletitas de avena')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Galletitas de avena')
  AND orden = 3;

-- Receta: Yogur con granola casera
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Yogur con granola casera')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Yogur con granola casera')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Yogur con granola casera')
  AND orden = 3;

-- Receta: Licuado de banana y naranja
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Licuado de banana y naranja')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Licuado de banana y naranja')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Licuado de banana y naranja')
  AND orden = 3;

-- Receta: Torta de manzana
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Torta de manzana')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Torta de manzana')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Torta de manzana')
  AND orden = 3;

-- Receta: Panqueques con banana y miel
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Panqueques con banana y miel')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1484723091739-30990ff50fca?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Panqueques con banana y miel')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Panqueques con banana y miel')
  AND orden = 3;

-- Receta: Pastafrola de manzana y pasas
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pastafrola de manzana y pasas')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pastafrola de manzana y pasas')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pastafrola de manzana y pasas')
  AND orden = 3;

-- Receta: Sopa crema de zapallo
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Sopa crema de zapallo')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1507048331197-7d4ac70811cf?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Sopa crema de zapallo')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Sopa crema de zapallo')
  AND orden = 3;

-- Receta: Sopa de verduras
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Sopa de verduras')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Sopa de verduras')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Sopa de verduras')
  AND orden = 3;

-- Receta: Crema de brocoli
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1507048331197-7d4ac70811cf?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Crema de brocoli')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1507048331197-7d4ac70811cf?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Crema de brocoli')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Crema de brocoli')
  AND orden = 3;

-- Receta: Atun con pure de calabaza
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1577041677443-8bbf07892f5e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Atun con pure de calabaza')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Atun con pure de calabaza')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Atun con pure de calabaza')
  AND orden = 3;

-- Receta: Pechuga grillada con arroz integral
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1536304929831-ee1ca9d44906?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pechuga grillada con arroz integral')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1598103442097-8b74394b95c2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pechuga grillada con arroz integral')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pechuga grillada con arroz integral')
  AND orden = 3;

-- Receta: Milanesa de pollo con ensalada
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1598103442097-8b74394b95c2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de pollo con ensalada')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de pollo con ensalada')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de pollo con ensalada')
  AND orden = 3;

-- Receta: Empanadas de pollo
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1598103442097-8b74394b95c2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Empanadas de pollo')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Empanadas de pollo')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Empanadas de pollo')
  AND orden = 3;

-- Receta: Empanadas de humita
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Empanadas de humita')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Empanadas de humita')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Empanadas de humita')
  AND orden = 3;

-- Receta: Milanesas de seitan
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesas de seitan')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesas de seitan')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesas de seitan')
  AND orden = 3;

-- Receta: Salteado de tempeh y vegetales
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Salteado de tempeh y vegetales')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Salteado de tempeh y vegetales')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Salteado de tempeh y vegetales')
  AND orden = 3;

-- Receta: Bowl de edamame y arroz
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Bowl de edamame y arroz')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1498837167922-ddd27525d352?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Bowl de edamame y arroz')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Bowl de edamame y arroz')
  AND orden = 3;

-- Receta: Guiso de porotos blancos
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Guiso de porotos blancos')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Guiso de porotos blancos')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1485963631004-f2f00b1d6606?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Guiso de porotos blancos')
  AND orden = 3;

-- Receta: Sopa de arvejas partidas
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Sopa de arvejas partidas')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1583608354155-ef2f1e475f9e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Sopa de arvejas partidas')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Sopa de arvejas partidas')
  AND orden = 3;

-- Receta: Ensalada de remolacha y huevo
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ensalada de remolacha y huevo')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1517093157656-b9eccef91cb1?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ensalada de remolacha y huevo')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Ensalada de remolacha y huevo')
  AND orden = 3;

-- Receta: Tarta de calabaza y queso
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1577041677443-8bbf07892f5e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tarta de calabaza y queso')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tarta de calabaza y queso')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tarta de calabaza y queso')
  AND orden = 3;

-- Receta: Revuelto de gramajo simple
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Revuelto de gramajo simple')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Revuelto de gramajo simple')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Revuelto de gramajo simple')
  AND orden = 3;

-- Receta: Tortilla de acelga
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tortilla de acelga')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tortilla de acelga')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tortilla de acelga')
  AND orden = 3;

-- Receta: Milanesa de tofu con pure de papa
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de tofu con pure de papa')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de tofu con pure de papa')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de tofu con pure de papa')
  AND orden = 3;

-- Receta: Milanesa de soja con pure de papa
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de soja con pure de papa')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de soja con pure de papa')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de soja con pure de papa')
  AND orden = 3;

-- Receta: Milanesa de carne sin gluten con pure
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de carne sin gluten con pure')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de carne sin gluten con pure')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de carne sin gluten con pure')
  AND orden = 3;

-- Receta: Pastel de papa vegano de lentejas
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pastel de papa vegano de lentejas')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pastel de papa vegano de lentejas')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1574484284002-952d92456975?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pastel de papa vegano de lentejas')
  AND orden = 3;

-- Receta: Pastel de papa sin TACC
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pastel de papa sin TACC')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pastel de papa sin TACC')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Pastel de papa sin TACC')
  AND orden = 3;

-- Receta: Hamburguesas de lentejas con ensalada
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1588778272105-3f93efef5ae0?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Hamburguesas de lentejas con ensalada')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Hamburguesas de lentejas con ensalada')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Hamburguesas de lentejas con ensalada')
  AND orden = 3;

-- Receta: Hamburguesas de carne sin gluten
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1556909114-44e3e70034e2?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Hamburguesas de carne sin gluten')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Hamburguesas de carne sin gluten')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Hamburguesas de carne sin gluten')
  AND orden = 3;

-- Receta: Tacos de tofu con palta
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tacos de tofu con palta')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tacos de tofu con palta')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tacos de tofu con palta')
  AND orden = 3;

-- Receta: Tacos de carne sin TACC en hojas de lechuga
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tacos de carne sin TACC en hojas de lechuga')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tacos de carne sin TACC en hojas de lechuga')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Tacos de carne sin TACC en hojas de lechuga')
  AND orden = 3;

-- Receta: Arroz con bolognesa sin gluten
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1536304929831-ee1ca9d44906?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Arroz con bolognesa sin gluten')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Arroz con bolognesa sin gluten')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Arroz con bolognesa sin gluten')
  AND orden = 3;

-- Receta: Arroz con bolognesa vegana de soja
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Arroz con bolognesa vegana de soja')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Arroz con bolognesa vegana de soja')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1536304929831-ee1ca9d44906?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Arroz con bolognesa vegana de soja')
  AND orden = 3;

-- Receta: Milanesa de pollo sin gluten
UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1517093157656-b9eccef91cb1?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de pollo sin gluten')
  AND orden = 1;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1585478259715-4f1d4c6b24ea?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de pollo sin gluten')
  AND orden = 2;

UPDATE pasos
SET imagen_url = 'https://images.unsplash.com/photo-1466637574441-749b8f19452f?w=800&h=600&fit=crop'
WHERE receta_id = (SELECT id FROM recetas WHERE nombre = 'Milanesa de pollo sin gluten')
  AND orden = 3;

