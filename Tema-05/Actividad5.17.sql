-- Daniel Copete 
-- Base de datos
-- Actividad 5.17

DROP DATABASE curtipliel;
CREATE DATABASE IF NOT EXISTS curtipliel;
USE curtipliel;

CREATE TABLE Departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    funcion VARCHAR(200)
);


CREATE TABLE Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    salarioBase DECIMAL(10,2) NOT NULL
);



CREATE TABLE Empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(150) NOT NULL,
    dir VARCHAR(200),
    poblacion VARCHAR(100),
    email VARCHAR(150),
    telefono VARCHAR(20),
    dni VARCHAR(9) UNIQUE NOT NULL,
    nss VARCHAR(15) UNIQUE NOT NULL,
    idDepartamento INT,
    idCategoria INT,
    CONSTRAINT fk_empleado_departamento
        FOREIGN KEY (idDepartamento) REFERENCES Departamentos(id),
    CONSTRAINT fk_empleado_categoria
        FOREIGN KEY (idCategoria) REFERENCES Categorias(id)
);


CREATE TABLE Almacen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ubicacion VARCHAR(150),
    idEmpleado INT,
    CONSTRAINT fk_almacen_empleado
        FOREIGN KEY (idEmpleado) REFERENCES Empleados(id)
);

CREATE TABLE Estante (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idAlmacen INT NOT NULL,
    descripcion VARCHAR(150),
    CONSTRAINT fk_estante_almacen
        FOREIGN KEY (idAlmacen) REFERENCES Almacen(id)
);

CREATE TABLE Familias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(150)
);


CREATE TABLE Articulos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigoInterno VARCHAR(50) UNIQUE NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    precioCoste DECIMAL(10,2) NOT NULL,
    precioVenta DECIMAL(10,2) NOT NULL,
    unidades INT DEFAULT 0,
    idAlmacen INT,
    idEstante INT,
    idFamilia INT,
    CONSTRAINT fk_articulo_almacen
        FOREIGN KEY (idAlmacen) REFERENCES Almacen(id),
    CONSTRAINT fk_articulo_estante
        FOREIGN KEY (idEstante) REFERENCES Estante(id),
    CONSTRAINT fk_articulo_familia
        FOREIGN KEY (idFamilia) REFERENCES Familias(id)
);


CREATE TABLE Regiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);


CREATE TABLE Provincias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    idRegion INT,
    CONSTRAINT fk_provincia_region
        FOREIGN KEY (idRegion) REFERENCES Regiones(id)
);


CREATE TABLE Poblaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    idProvincia INT,
    CONSTRAINT fk_poblacion_provincia
        FOREIGN KEY (idProvincia) REFERENCES Provincias(id)
);



CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    contacto VARCHAR(150),
    cif VARCHAR(15) UNIQUE,
    email VARCHAR(150),
    web VARCHAR(150),
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    movil VARCHAR(20),
    cpostal VARCHAR(10),
    idPoblacion INT,
    idProvincia INT,
    idRegion INT,
    CONSTRAINT fk_cliente_poblacion
        FOREIGN KEY (idPoblacion) REFERENCES Poblaciones(id),
    CONSTRAINT fk_cliente_provincia
        FOREIGN KEY (idProvincia) REFERENCES Provincias(id),
    CONSTRAINT fk_cliente_region
        FOREIGN KEY (idRegion) REFERENCES Regiones(id)
);




CREATE TABLE Ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numVenta VARCHAR(50) UNIQUE NOT NULL,
    fecha DATE NOT NULL,
    importeTotal DECIMAL(12,2),
    idCliente INT,
    formaPago VARCHAR(50),
    observaciones VARCHAR(300),
    CONSTRAINT fk_venta_cliente
        FOREIGN KEY (idCliente) REFERENCES Clientes(id)
);


CREATE TABLE DetallesVentas (
    numDetalle INT AUTO_INCREMENT PRIMARY KEY,
    idVenta INT NOT NULL,
    idArticulo INT NOT NULL,
    precio DECIMAL(10,2),
    unidades INT,
    descuento DECIMAL(5,2),
    iva DECIMAL(5,2),
    importeSinIva DECIMAL(12,2),
    importeConIva DECIMAL(12,2),
    CONSTRAINT fk_detalle_venta
        FOREIGN KEY (idVenta) REFERENCES Ventas(id),
    CONSTRAINT fk_detalle_articulo
        FOREIGN KEY (idArticulo) REFERENCES Articulos(id)
);

ALTER TABLE Clientes
ADD observaciones TEXT,
ADD imagen VARCHAR(150);


ALTER TABLE Articulos
ADD stockMinimo INT CHECK (stockMinimo <= 10),
ADD stockMaximo INT CHECK (stockMaximo <= 1000);


CREATE INDEX idx_clientes_nombre
ON Clientes(nombre);


CREATE INDEX idx_articulos_descripcion
ON Articulos(descripcion);


CREATE INDEX idx_empleados_apellidos_nombre
ON Empleados(apellidos, nombre);







