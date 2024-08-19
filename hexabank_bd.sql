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

CREATE TABLE tiposcuentas (
    id_tipoCuenta INT NOT NULL AUTO_INCREMENT, 
    tipo_cuenta VARCHAR(22) NOT NULL,
    PRIMARY KEY (id_tipoCuenta)
);

CREATE TABLE cuentas (
    numero_cuenta INT NOT NULL AUTO_INCREMENT, 
    cbu VARCHAR(22) NOT NULL UNIQUE,
    dni VARCHAR(8) NOT NULL,
    fecha_creacion DATE NOT NULL,
    id_tipoCuenta INT NOT NULL,
    saldo DECIMAL(10, 2) DEFAULT 10000.00,
    estado BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (numero_cuenta, cbu, dni),
    FOREIGN KEY (dni) REFERENCES clientes(dni),
    FOREIGN KEY (id_tipoCuenta) REFERENCES tiposcuentas(id_tipoCuenta),
    CHECK (saldo >= 0)
);

CREATE TABLE cuotas (
    cuota_id INT NOT NULL AUTO_INCREMENT,
    prestamo_id INT NOT NULL,
    numero_cuota INT NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    importe DECIMAL(10, 2) NOT NULL,
    fecha_pago DATE,
    PRIMARY KEY(cuota_id, prestamo_id),
    FOREIGN KEY (prestamo_id) REFERENCES prestamos(prestamo_id)
);

CREATE TABLE movimientos (
    movimiento_id INT NOT NULL AUTO_INCREMENT,
    numero_cuenta INT NOT NULL,
    fecha DATE NOT NULL,
    detalle VARCHAR(255),
    importe DECIMAL(10, 2) NOT NULL,
    tipo_movimiento ENUM('alta de cuenta', 'alta de préstamo', 'pago de préstamo', 'transferencia') NOT NULL,
    PRIMARY KEY(movimiento_id, numero_cuenta),
    FOREIGN KEY (numero_cuenta) REFERENCES cuentas(numero_cuenta)
);

CREATE TABLE transferencias (
    transferencia_id INT NOT NULL AUTO_INCREMENT,
	dni VARCHAR(8) NOT NULL,
    cbu_origen VARCHAR(22) NOT NULL,
    cbu_destino VARCHAR(22) NOT NULL,
    fecha DATE NOT NULL,
    detalle VARCHAR(255),
    importe DECIMAL(10, 2) NOT NULL,
    movimiento_id INT NOT NULL,
    PRIMARY KEY (transferencia_id),
	FOREIGN KEY (dni) REFERENCES clientes(dni),
    FOREIGN KEY (cbu_origen) REFERENCES cuentas(cbu),
    FOREIGN KEY (movimiento_id) REFERENCES movimientos(movimiento_id)
);
