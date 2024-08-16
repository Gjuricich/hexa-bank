drop schema BANCO_GRUPO1;

create schema BANCO_GRUPO1;
use BANCO_GRUPO1;

CREATE TABLE paises (
    pais_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE provincias (
    provincia_id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    pais_id INT NOT NULL,
    PRIMARY KEY (provincia_id, pais_id),
    FOREIGN KEY (pais_id) REFERENCES paises(pais_id) 
);

CREATE TABLE localidades (
    localidad_id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    provincia_id INT NOT NULL,
    PRIMARY KEY (localidad_id, provincia_id),
    FOREIGN KEY (provincia_id) REFERENCES provincias(provincia_id)
);

CREATE TABLE tipos_usuarios (
	tipos_usuario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipo_usuario VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_usuario VARCHAR(50) NOT NULL UNIQUE, 
    password VARCHAR(255) NOT NULL,
    tipo_usuario_id INT NOT NULL,
	estado BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (tipo_usuario_id) REFERENCES tipos_usuarios(tipos_usuario_id)
);

CREATE TABLE clientes (
    dni VARCHAR(8) NOT NULL UNIQUE,
    cuil VARCHAR(13) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    sexo ENUM('M', 'F', 'X') NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    localidad_id INT NOT NULL,
    provincia_id INT NOT NULL,                                                   
    correo_electronico VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    usuario_id INT NOT NULL,
	estado BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (dni, usuario_id),
    FOREIGN KEY (localidad_id, provincia_id) REFERENCES localidades(localidad_id, provincia_id),
	FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);
