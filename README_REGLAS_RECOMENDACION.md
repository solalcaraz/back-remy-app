# Reglas de recomendacion y ponderacion

Este documento resume las reglas de negocio vigentes para recomendaciones, objetivos nutricionales, dificultad, costos y ranking. La idea es que cualquier integrante del equipo pueda entender por que una receta aparece arriba, por que baja en el ranking y que impacto tiene cada configuracion del usuario.

## Flujo general

El punto de entrada principal es `RecomendacionService.recomendarRecetas`.

1. Se busca el perfil completo del usuario.
2. Se resuelven ingredientes disponibles:
   - ingredientes comunes cargados en el perfil;
   - ingredientes extra ingresados en la busqueda, si los hay.
3. Se filtran candidatas desde la base:
   - deben cumplir restricciones alimentarias del usuario;
   - no deben contener ingredientes a evitar como ingrediente `CORE`;
   - si `puedeComprar = true`, alcanza con tener al menos un ingrediente disponible;
   - si `puedeComprar = false`, deben tener ingredientes suficientes segun la query de repositorio;
   - si hay tiempo maximo, se aplica como filtro.
4. Se trae un pool ampliado de candidatas para poder ordenar por puntaje real en memoria.
5. Cada receta se evalua y obtiene:
   - `puntaje` normalizado de 0 a 100;
   - motivos positivos;
   - motivos negativos;
   - costo aproximado;
   - ingredientes coincidentes y faltantes.
6. El ranking final se ordena por:
   - mayor puntaje;
   - menor tiempo, como desempate.

Importante: las variantes dietarias no pedidas ya no se mandan automaticamente al fondo. Reciben penalizacion en el puntaje y motivo negativo, pero si aun asi matchean bien, quedan bien rankeadas.

## Pool y paginacion

Para evitar ordenar solo una pagina chica ya filtrada por base, el servicio pide un pool ampliado:

```text
cantidadCandidatas = ((page + 1) * size * 5).coerceAtMost(100)
```

Constantes:

```text
TAMANIO_PAGINA_RECOMENDACIONES = 10
MULTIPLICADOR_POOL_RECOMENDACIONES = 5
LIMITE_POOL_RECOMENDACIONES = 100
```

Luego se ordena por puntaje y se aplica:

```text
drop(page * 10).take(10)
```

## Ingredientes disponibles

La coincidencia de ingredientes usa nombres en lowercase.

Si no hay busqueda activa:

```text
ingredientes disponibles = ingredientes comunes del usuario
peso ingredientes = 0.8
```

Si hay busqueda activa:

```text
ingredientes disponibles = ingredientes comunes + ingredientes encontrados por texto
peso ingredientes = 1.2
```

La busqueda textual intenta resolver nombres aunque el usuario no haya seleccionado una sugerencia exacta.

## Puntaje por ingredientes

Base:

```text
puntosBase = (coincidencias / totalIngredientes) * 30 * peso
```

Donde:

```text
PUNTOS_INGREDIENTES = 30
PESO_INGREDIENTES_PERFIL = 0.8
PESO_INGREDIENTES_BUSQUEDA = 1.2
```

Penalizacion por faltantes:

```text
si puedeComprar = true:
  BAJO_PRESUPUESTO -> faltantes * 2
  INTERMEDIO       -> faltantes * 1
  FLEXIBLE         -> 0

si puedeComprar = false:
  BAJO_PRESUPUESTO -> faltantes * 4
  INTERMEDIO       -> faltantes * 3
  FLEXIBLE         -> faltantes * 2
```

El resultado se limita entre 0 y 30.

Si la receta no tiene faltantes, suma ademas:

```text
PUNTOS_EXTRA_DESPENSA_COMPLETA = 5
```

## Restricciones alimentarias

Si el usuario no tiene restricciones, no se premia nada por este criterio.

Si el usuario tiene restricciones y la receta las cumple:

```text
+20 puntos
motivo positivo: "Cumple tus restricciones alimentarias"
```

Si no las cumple, no suma puntos y agrega motivo negativo con las restricciones incumplidas.

```text
PUNTOS_RESTRICCIONES = 20
```

Para la demo, el front expone:

```text
Vegetariano
Vegano
Sin gluten
Sin lactosa
Bajo sodio
```

Restricciones que existen en base pero no conviene exponer sin mas cobertura:

```text
sin_mariscos
sin_azucar
bajo_en_grasas
```

`bajo_en_grasas` es especialmente restrictiva: deja muy pocas recetas y rompe varias combinaciones.

## Variantes dietarias

Una receta se considera variante dietaria si tiene tag:

```text
variante
```

Se penaliza cuando la variante no coincide con las restricciones actuales del usuario.

Casos:

```text
variante vegana/vegetariana y el usuario no pidio vegano ni vegetariano -> penaliza
variante sin gluten y el usuario no pidio sin_gluten -> penaliza
```

Penalizacion:

```text
-10 puntos por cada variante no pedida
PENALIZACION_VARIANTE_DIETETICA = 10
```

Motivo negativo:

```text
"Es una variante dietaria que no coincide con tus restricciones actuales"
```

Si no es variante, suma base:

```text
PUNTOS_RECETA_BASE = 4
```

## Objetivos del usuario

La compatibilidad con objetivos se evalua en `Receta.esCompatibleConObjetivo`.

Todas las reglas nutricionales se calculan por porcion, no por receta completa.

### Indiferente

Siempre compatible.

En puntaje suma:

```text
+5 puntos
```

### Bajar de peso

Regla por porcion:

```text
calorias <= 500
grasas <= 18
fibra >= 4 || proteinas >= 12
```

Si cumple:

```text
+15 puntos
motivo positivo: "Acompana tu objetivo actual"
```

### Comer mas saludable

Regla por porcion:

```text
calorias <= 700
grasas <= 20
fibra >= 5
proteinas >= 8
```

Diferencia con bajar de peso:

- bajar de peso prioriza control calorico y grasa moderada;
- comer saludable permite mas calorias, pero exige fibra y proteina a la vez.

Si cumple:

```text
+15 puntos
motivo positivo: "Acompana tu objetivo actual"
```

### Ganar masa muscular

Regla por porcion:

```text
proteinas >= 25
```

Si cumple:

```text
+15 puntos
motivo positivo: "Acompana tu objetivo actual"
```

Si una receta no acompana el objetivo, no suma estos puntos y agrega motivo negativo.

```text
PUNTOS_OBJETIVO = 15
```

## Dificultad y nivel de cocina

La dificultad se calcula en `Receta.calcularDificultad`.

Formula actual:

```text
puntaje =
  pasos * 1.5
  + ingredientes
  + tiempoEnMinutos / 20
  + puntajePorTecnicas()
```

Clasificacion:

```text
puntaje < 15 -> BASICO
puntaje < 30 -> INTERMEDIO
si no        -> AVANZADO
```

El texto tecnico se arma con:

```text
nombre
descripcion
tags
titulo/descripcion/detalle/tip de pasos
```

Se normalizan acentos para evitar diferencias entre `freir` y `freir` con tilde.

### Bonus tecnicos

```text
+16 -> wok, fuego fuerte
+14 -> berenjenas rellenas, dahl, falafel, guiso de lentejas, locro, ratatouille
+12 -> sushi, enrollar firme
+7  -> risotto, agregar caldo, absorba antes de agregar
+4  -> masa fermentada, levar
+4  -> tarta, empanada, repulgue, rellenar tapas, forrar molde
+4  -> milanesa, empanar, rebozar, freir
+3  -> rellenar, relleno, gratinar, reducir los jugos
+2  -> wok, saltear por tandas, fuego fuerte
+1  -> amasar, hornear, sofreir, saltear
```

Ejemplos calibrados:

```text
Pizza casera de tomate y queso       -> INTERMEDIO
Noquis de papa con salsa de tomate   -> INTERMEDIO
Berenjenas rellenas                  -> AVANZADO
Wok de pollo y vegetales             -> AVANZADO
Wok de vegetales con tofu            -> AVANZADO
Dahl de lentejas                     -> AVANZADO
Falafel de garbanzos al horno        -> AVANZADO
Guiso de lentejas                    -> AVANZADO
Locro simple de porotos y zapallo    -> AVANZADO
Ratatouille simple                   -> AVANZADO
```

### Impacto en recomendaciones

Se compara:

```text
diferencia = receta.dificultad.ordinal - usuario.nivelCocina.ordinal
```

Si la receta es igual o mas facil que el nivel del usuario:

```text
+15 puntos
motivo positivo: "La dificultad es adecuada para tu nivel"
```

Si es mas dificil:

```text
+max(15 - diferencia * 5, 0)
motivo negativo: "Puede ser mas dificil que tu nivel de cocina actual"
```

Constantes:

```text
PUNTOS_DIFICULTAD = 15
PENALIZACION_DIFICULTAD = 5
```

## Ingredientes a evitar

Si la receta no contiene ingredientes a evitar del usuario como ingrediente `CORE`:

```text
+10 puntos
```

Si contiene alguno:

```text
no suma esos 10 puntos
motivo negativo: "Contiene ingrediente(s) que preferis evitar: ..."
```

Constante:

```text
PUNTOS_SIN_INGREDIENTES_A_EVITAR = 10
```

Para demo, evitar cargar como "a evitar" ingredientes estructurales:

```text
Cebolla
Ajo
Papa
Arroz blanco
Huevo
Tomate triturado
Aceite de oliva
Sal fina
Zanahoria
Morron rojo
Lentejas
```

Ingredientes seguros para mostrar el filtro sin vaciar el catalogo:

```text
Aceitunas verdes
Brocoli
Champinones
Palta
Atun
Coco rallado
Pasas de uva
Semillas de chia
Jengibre
Comino
```

## Costo y perfil economico

El costo usado es `receta.costoTotalCompra`.

Limites:

```text
LIMITE_COSTO_BAJO_PRESUPUESTO = 15000
LIMITE_COSTO_INTERMEDIO = 25000
PUNTOS_COSTO = 10
```

### Bajo presupuesto

```text
costo <= 15000 -> +10
costo <= 25000 -> +4
costo > 25000  -> +0
```

Motivos:

```text
costo <= 15000 -> positivo: "Costo accesible para tu presupuesto"
costo <= 25000 -> negativo: "Costo intermedio para tu presupuesto"
costo > 25000  -> negativo: "Costo elevado para tu presupuesto"
```

### Intermedio

```text
costo <= 25000 -> +10
costo > 25000  -> +0
```

Motivos:

```text
costo <= 15000 -> positivo: "Costo bajo para tu perfil"
costo <= 25000 -> positivo: "Costo moderado para tu perfil"
costo > 25000  -> negativo: "Costo elevado para tu perfil"
```

### Flexible

```text
costo > 25000  -> +10
costo <= 25000 -> +8
```

Motivos:

```text
costo <= 15000 -> positivo: "Costo bajo para tu perfil flexible"
costo <= 25000 -> positivo: "Costo intermedio para tu perfil flexible"
costo > 25000  -> positivo: "Costo dentro de tu perfil flexible"
```

## Favoritos e historial

Favorito:

```text
si ya esta marcada como favorita -> +5
```

Historial:

```text
si ya fue cocinada recientemente -> -5
```

Constantes:

```text
MODIFICADOR_FAVORITO = 5
MODIFICADOR_HISTORIAL = 5
```

## Tiempo

Puntos por tiempo:

```text
tiempo <= 20 -> +5
tiempo <= 45 -> +3
tiempo > 45  -> +0
```

Si suma el valor rapido usado para motivo (`3`), agrega:

```text
"Receta rapida (... min)"
```

Nota: hoy `PUNTOS_TIEMPO_MAXIMO = 5`, pero `PUNTOS_TIEMPO_RAPIDO = 3`; el motivo aparece para recetas de hasta 45 minutos porque compara contra 3.

## Normalizacion del puntaje

El puntaje crudo se normaliza contra un maximo teorico dinamico segun el perfil.

```text
puntajeNormalizado = (puntaje / maxScorePerfil) * 100
```

Luego se redondea y limita:

```text
0..100
```

El maximo teorico considera:

```text
maxIngredientes
+ PUNTOS_EXTRA_DESPENSA_COMPLETA
+ maxRestricciones
+ puntosPorObjetivo(usuario.objetivo)
+ PUNTOS_DIFICULTAD
+ PUNTOS_SIN_INGREDIENTES_A_EVITAR
+ PUNTOS_COSTO
+ PUNTOS_RECETA_BASE
+ PUNTOS_TIEMPO_MAXIMO
```

Detalles:

```text
maxIngredientes = min(30 * pesoIngredientes, 30)
maxRestricciones = 0 si el usuario no tiene restricciones; si tiene, 20
```

Esto evita premiar artificialmente a usuarios sin restricciones.

## Sugerencia diaria

La sugerencia diaria usa el mismo sistema de evaluacion.

Flujo:

1. Busca candidatas compatibles con perfil.
2. Si no hay candidatas, usa fallback excluyendo ingredientes a evitar y priorizando compatibles con restricciones.
3. Evalua y ordena por puntaje.
4. Toma las mejores 5.
5. Elige una al azar entre esas 5 para variar la sugerencia sin perder relevancia.

Constantes:

```text
LIMITE_SUGERENCIA_DIARIA = 30
TOP_SUGERENCIAS_RANDOM = 5
```

## Cobertura para demo

Dataset actual:

```text
81 recetas
```

Distribucion aproximada con la formula recalibrada:

```text
BASICO      25
INTERMEDIO  45
AVANZADO    11
```

Con las restricciones visibles en front:

```text
Vegetariano
Vegano
Sin gluten
Sin lactosa
Bajo sodio
```

hay cobertura para combinaciones de:

```text
restricciones visibles x objetivo x nivel de cocina
```

Riesgos de demo:

- `bajo_en_grasas` no tiene buena cobertura si se expone.
- muchos ingredientes a evitar estructurales pueden vaciar el catalogo.
- `Bajo sodio` tiene menos recetas que las otras restricciones visibles; conviene no combinarlo con muchos ingredientes a evitar.

