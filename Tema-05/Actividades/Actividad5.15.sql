DROP DATABASE libreria;
CREATE DATABASE libreria;
USE libreria;


CREATE TABLE Libros (
    id INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    precio DECIMAL(8,2) NOT NULL
);

CREATE TABLE Educacion (
    id_libro INT PRIMARY KEY,
    curso VARCHAR(50),
    asignatura VARCHAR(50),
    FOREIGN KEY (id_libro) REFERENCES Libros(id)
);

CREATE TABLE Lectura (
    id_libro INT PRIMARY KEY,
    tipo VARCHAR(50),
    genero VARCHAR(50),
    FOREIGN KEY (id_libro) REFERENCES Libros(id)
);

CREATE TABLE Provincias (
    id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Almacenes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha DATE,
    id_provincia INT,
    FOREIGN KEY (id_provincia) REFERENCES Provincias(id)
);

CREATE TABLE Poblaciones (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    habitantes INT,
    id_provincia INT,
    FOREIGN KEY (id_provincia) REFERENCES Provincias(id)
);

CREATE TABLE Socios (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    codsocio VARCHAR(20),
    telefono VARCHAR(20),
    dni VARCHAR(15),
    id_poblacion INT,
    id_socio_avalista INT,
    FOREIGN KEY (id_poblacion) REFERENCES Poblaciones(id),
    FOREIGN KEY (id_socio_avalista) REFERENCES Socios(id)
);

CREATE TABLE Pedidos (
    id INT PRIMARY KEY,
    fecha DATE,
    envio VARCHAR(50),
    id_socio INT,
    FOREIGN KEY (id_socio) REFERENCES Socios(id)
);

CREATE TABLE LibrosPedidos (
    id_pedido INT,
    id_libro INT,
    unidades INT,
    precio DECIMAL(8,2),
    PRIMARY KEY (id_pedido, id_libro),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
    FOREIGN KEY (id_libro) REFERENCES Libros(id)
);

CREATE TABLE AlmacenesLibros (
    id_almacen INT,
    id_libro INT,
    stock INT,
    PRIMARY KEY (id_almacen, id_libro),
    FOREIGN KEY (id_almacen) REFERENCES Almacenes(id),
    FOREIGN KEY (id_libro) REFERENCES Libros(id)
);
