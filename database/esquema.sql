-- ============================
-- CREACIÓN DE TABLAS FASTORDER
-- ============================

CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    precio NUMERIC(10,2) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    imagen_url TEXT NOT NULL,
    disponible BOOLEAN DEFAULT TRUE
);

CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total NUMERIC(10,2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    enviado_cocina BOOLEAN DEFAULT FALSE
);

CREATE TABLE detalle_pedido (
    id_detalle SERIAL PRIMARY KEY,
    id_pedido INTEGER REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    id_producto INTEGER REFERENCES productos(id_producto),
    cantidad INTEGER NOT NULL,
    subtotal NUMERIC(10,2) NOT NULL
);

CREATE TABLE pagos (
    id_pago SERIAL PRIMARY KEY,
    id_pedido INTEGER UNIQUE REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    metodo_pago VARCHAR(50) NOT NULL,
    estado_pago VARCHAR(20) NOT NULL,
    referencia_transaccion VARCHAR(100),
    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE facturas (
    id_factura SERIAL PRIMARY KEY,
    id_pedido INTEGER UNIQUE REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    numero_factura VARCHAR(50) NOT NULL,
    fecha_emision TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
