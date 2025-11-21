CREATE DATABASE soporte_tecnico;
USE soporte_tecnico;

CREATE TABLE roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    rol VARCHAR(50) NOT NULL
);

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

CREATE TABLE administradores (
    id_administrador INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    correo VARCHAR(100),
    telefono VARCHAR(20),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    correo VARCHAR(100),
    telefono VARCHAR(20),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE areas (
    id_area INT PRIMARY KEY AUTO_INCREMENT,
    area_trabajo VARCHAR(100) NOT NULL
);

CREATE TABLE tecnicos (
    id_tecnico INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    correo VARCHAR(100),
    telefono VARCHAR(20),
    certificacion VARCHAR(100),
    id_area INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_area) REFERENCES areas(id_area)
);

CREATE TABLE direcciones (
    id_direccion INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(50),
    municipio VARCHAR(50),
    colonia VARCHAR(50),
    calle VARCHAR(50),
    numero_casa VARCHAR(10)
);

CREATE TABLE estado_solicitudes (
    id_estado_solicitud INT PRIMARY KEY AUTO_INCREMENT,
    estado_solicitud VARCHAR(50)
);

CREATE TABLE solicitudes (
    id_solicitud INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_direccion INT,
    fecha DATE,
    descripcion_pequena VARCHAR(255),
    id_area INT,
    id_estado_solicitud INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion),
    FOREIGN KEY (id_area) REFERENCES areas(id_area),
    FOREIGN KEY (id_estado_solicitud) REFERENCES estado_solicitudes(id_estado_solicitud)
);

CREATE TABLE descripciones (
    id_descripcion INT PRIMARY KEY AUTO_INCREMENT,
    descripcion_detallada TEXT,
    evidencia_foto VARCHAR(255)
);

CREATE TABLE prioridades (
    id_prioridad INT PRIMARY KEY AUTO_INCREMENT,
    nivel_prioridad VARCHAR(50)
);

CREATE TABLE estatus (
    id_estatus INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(50)
);

CREATE TABLE reportes (
    id_reporte INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_direccion INT,
    id_tecnico INT,
    id_solicitud INT,
    fecha DATE,
    id_descripcion INT,
    id_area INT,
    id_prioridad INT,
    id_estatus INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion),
    FOREIGN KEY (id_tecnico) REFERENCES tecnicos(id_tecnico),
    FOREIGN KEY (id_solicitud) REFERENCES solicitudes(id_solicitud),
    FOREIGN KEY (id_descripcion) REFERENCES descripciones(id_descripcion),
    FOREIGN KEY (id_area) REFERENCES areas(id_area),
    FOREIGN KEY (id_prioridad) REFERENCES prioridades(id_prioridad),
    FOREIGN KEY (id_estatus) REFERENCES estatus(id_estatus)
);
