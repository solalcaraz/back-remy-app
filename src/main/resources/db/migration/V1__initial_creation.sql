-- pgcrypto es una instrucción de PostgreSQL que activa una “librería interna” del motor de base de datos para generar la uuid random para el user
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- TABLA USUARIOS ----------------------------
CREATE TABLE usuarios (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    foto_url VARCHAR(500),
    objetivo VARCHAR(50) NOT NULL,
    nivel_cocina VARCHAR(50) NOT NULL,
    perfil_economico VARCHAR(50) NOT NULL
);

CREATE INDEX idx_usuarios_email ON usuarios(email);

-- TABLA RESTRICCIONES ALIMENTARIAS ----------------------------
CREATE TABLE restricciones_alimentarias (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE INDEX idx_restricciones_nombre ON restricciones_alimentarias(nombre);

-- TABLA INGREDIENTES ----------------------------
CREATE TABLE ingredientes (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    categoria VARCHAR(50) NOT NULL,
    unidad_base VARCHAR(50) NOT NULL,

    calorias DOUBLE PRECISION,
    proteinas DOUBLE PRECISION,
    carbohidratos DOUBLE PRECISION,
    grasas DOUBLE PRECISION,
    fibra DOUBLE PRECISION,

    cantidad_referencia DOUBLE PRECISION,
    unidad_referencia VARCHAR(50)
);

CREATE INDEX idx_ingredientes_nombre ON ingredientes(nombre);

-- TABLA INGREDIENTES RESTRICCIONES ALIMENTARIAS ----------------------------
CREATE TABLE ingredientes_restricciones_alimentarias (
    ingrediente_id BIGINT NOT NULL,
    restriccion_alimentaria_id BIGINT NOT NULL,
    PRIMARY KEY (ingrediente_id, restriccion_alimentaria_id),
    CONSTRAINT fk_ing_rest_ingrediente
        FOREIGN KEY (ingrediente_id) REFERENCES ingredientes(id) ON DELETE CASCADE,
    CONSTRAINT fk_ing_rest_restriccion
        FOREIGN KEY (restriccion_alimentaria_id) REFERENCES restricciones_alimentarias(id) ON DELETE CASCADE
);

CREATE INDEX idx_ingredientes_restricciones_ingrediente ON ingredientes_restricciones_alimentarias(ingrediente_id);
CREATE INDEX idx_ingredientes_restricciones_restriccion ON ingredientes_restricciones_alimentarias(restriccion_alimentaria_id);

-- TABLA PRECIOS INGREDIENTES ----------------------------
CREATE TABLE precios_ingredientes (
    id BIGSERIAL PRIMARY KEY,
    ingrediente_id BIGINT NOT NULL,
    precio NUMERIC(10,2) NOT NULL,
    cantidad_referencia NUMERIC(10,2),
    unidad_referencia VARCHAR(50),
    fecha_actualizacion DATE,
    CONSTRAINT fk_precio_ingrediente
        FOREIGN KEY (ingrediente_id) REFERENCES ingredientes(id) ON DELETE CASCADE
);

CREATE INDEX idx_precios_ingredientes_ingrediente ON precios_ingredientes(ingrediente_id);

-- TABLA RECETAS ----------------------------
CREATE TABLE recetas (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tiempo_en_minutos INT NOT NULL,
    porciones INT NOT NULL,
    dificultad VARCHAR(50) NOT NULL DEFAULT 'INTERMEDIO',
    descripcion TEXT,
    img_url VARCHAR(500)
);

CREATE INDEX idx_recetas_nombre ON recetas(nombre);
CREATE INDEX idx_recetas_dificultad ON recetas(dificultad);

-- TABLA PASOS DE CADA RECETA ----------------------------
CREATE TABLE pasos (
    id BIGSERIAL PRIMARY KEY,
    receta_id BIGINT NOT NULL,
    orden INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    detalle TEXT,
    tiempo_estimado_minutos INT NOT NULL,
    tip TEXT,
    imagen_url VARCHAR(500),
    CONSTRAINT fk_paso_receta
        FOREIGN KEY (receta_id) REFERENCES recetas(id) ON DELETE CASCADE
);

CREATE INDEX idx_pasos_receta ON pasos(receta_id);
CREATE INDEX idx_pasos_orden ON pasos(receta_id, orden);

-- TABLA RELACION RECETA E INGREDIENTE ----------------------------
CREATE TABLE receta_ingredientes (
    id BIGSERIAL PRIMARY KEY,
    receta_id BIGINT NOT NULL,
    ingrediente_id BIGINT NOT NULL,
    cantidad DOUBLE PRECISION NOT NULL,
    unidad_medida VARCHAR(50) NOT NULL,
    CONSTRAINT fk_receta_ingrediente_receta
        FOREIGN KEY (receta_id) REFERENCES recetas(id) ON DELETE CASCADE,
    CONSTRAINT fk_receta_ingrediente_ingrediente
        FOREIGN KEY (ingrediente_id) REFERENCES ingredientes(id) ON DELETE CASCADE
);

CREATE INDEX idx_receta_ingredientes_receta ON receta_ingredientes(receta_id);
CREATE INDEX idx_receta_ingredientes_ingrediente ON receta_ingredientes(ingrediente_id);

-- TABLA FAVORITOS DE LA RECETA ----------------------------
CREATE TABLE favoritos_recetas (
    id BIGSERIAL PRIMARY KEY,
    usuario_id UUID NOT NULL,
    receta_id BIGINT NOT NULL,
    fecha_agregado TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT favorito_usuario_receta UNIQUE (usuario_id, receta_id),
    CONSTRAINT fk_favorito_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_favorito_receta
        FOREIGN KEY (receta_id) REFERENCES recetas(id) ON DELETE CASCADE
);

CREATE INDEX idx_favoritos_usuario ON favoritos_recetas(usuario_id);
CREATE INDEX idx_favoritos_receta ON favoritos_recetas(receta_id);

-- TABLA HISTORIAL DE LA RECETA ----------------------------
CREATE TABLE historial_recetas (
    id BIGSERIAL PRIMARY KEY,
    usuario_id UUID NOT NULL,
    receta_id BIGINT NOT NULL,
    fecha_inicio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT historial_usuario_receta UNIQUE (usuario_id, receta_id),
    CONSTRAINT fk_historial_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_historial_receta
        FOREIGN KEY (receta_id) REFERENCES recetas(id) ON DELETE CASCADE
);

CREATE INDEX idx_historial_usuario ON historial_recetas(usuario_id);
CREATE INDEX idx_historial_receta ON historial_recetas(receta_id);

-- TABLA PREFERENCIAS DE INGREDIENTES PARA LOS USUARIOS ----------------------------
CREATE TABLE preferencias_ingredientes_usuario (
    id BIGSERIAL PRIMARY KEY,
    usuario_id UUID NOT NULL,
    ingrediente_id BIGINT NOT NULL,
    tipo_preferencia VARCHAR(50) NOT NULL,
    CONSTRAINT preferencia_usuario_ingrediente UNIQUE (usuario_id, ingrediente_id),
    CONSTRAINT fk_preferencia_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_preferencia_ingrediente
        FOREIGN KEY (ingrediente_id) REFERENCES ingredientes(id) ON DELETE CASCADE
);

CREATE INDEX idx_preferencias_usuario ON preferencias_ingredientes_usuario(usuario_id);
CREATE INDEX idx_preferencias_ingrediente ON preferencias_ingredientes_usuario(ingrediente_id);

-- TABLA RECETA TAGS ----------------------------
CREATE TABLE receta_tags (
    receta_id BIGINT NOT NULL,
    tags VARCHAR(100),
    PRIMARY KEY (receta_id, tags),
    CONSTRAINT fk_receta_tags_receta
        FOREIGN KEY (receta_id) REFERENCES recetas(id) ON DELETE CASCADE
);

CREATE INDEX idx_receta_tags_receta ON receta_tags(receta_id);

-- TABLA RESTRICCIONES ALIMENTARIAS DE LOS USUARIOS ----------------------------
CREATE TABLE usuarios_restricciones_alimentarias (
    usuario_id UUID NOT NULL,
    restriccion_alimentaria_id BIGINT NOT NULL,
    PRIMARY KEY (usuario_id, restriccion_alimentaria_id),
    CONSTRAINT fk_usr_rest_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_usr_rest_restriccion
        FOREIGN KEY (restriccion_alimentaria_id) REFERENCES restricciones_alimentarias(id) ON DELETE CASCADE
);

CREATE INDEX idx_usuarios_restricciones_usuario ON usuarios_restricciones_alimentarias(usuario_id);
CREATE INDEX idx_usuarios_restricciones_restriccion ON usuarios_restricciones_alimentarias(restriccion_alimentaria_id);