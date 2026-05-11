ALTER TABLE clientes
ADD COLUMN apellidos VARCHAR(45) NOT NULL,
ADD COLUMN poblacion VARCHAR(50),
ADD COLUMN nacionalidad VARCHAR(30) DEFAULT 'España',
ADD COLUMN email VARCHAR(100),
ADD COLUMN direccion VARCHAR(100),
ADD COLUMN cod_cliente VARCHAR(10) NOT NULL,
ADD COLUMN tipo_cliente INT NOT NULL;

ALTER TABLE clientes
MODIFY nombre VARCHAR(25) NOT NULL,
MODIFY direccion VARCHAR(100);

ALTER TABLE clientes
CHANGE email correo_electronico VARCHAR(100);

ALTER TABLE clientes
ADD CONSTRAINT chk_correo_electronico
CHECK (correo_electronico LIKE '%@%'),
ADD CONSTRAINT chk_tipo_cliente
CHECK (tipo_cliente BETWEEN 0 AND 10),
ADD CONSTRAINT uq_cod_cliente
UNIQUE (cod_cliente);

ALTER TABLE clientes
ADD INDEX idx_clientes_apellidos_nombre (apellidos, nombre);

SHOW INDEX FROM clientes;

