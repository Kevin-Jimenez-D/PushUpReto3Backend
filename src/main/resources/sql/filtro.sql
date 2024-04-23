CREATE TABLE cargos (
    Id INT(11) NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    sueldo_base DOUBLE NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE color (
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE forma_pago (
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE genero (
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE insumo(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    valor_unit DOUBLE NOT NULL,
    stock_min DOUBLE NOT NULL,
    stock_max DOUBLE NOT NULL,
);

CREATE TABLE pais(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
);

CREATE TABLE talla(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE tipo_estado(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE tipo_persona(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
);

CREATE TABLE tipo_proteccion(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE departamento(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    IdPaisFk INT(11) NOT NULL
);

CREATE TABLE municipio(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    IdDepartamentoFk INT(11) NOT NULL
);

CREATE TABLE estado(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL,
    IdTipoEstadoFk INT(11) NOT NULL
);

CREATE TABLE cliente(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    IdCliente VARCHAR(255) NOT NULL,
    IdTipoPersonaFk INT(11) NOT NULL,
    fechaRegistro DATE NOT NULL,
    IdMunicipioFk INT(11) NOT NULL
);

CREATE TABLE empleado(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    IdCargoFk INT(11) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    IdMunicipioFk INT(11) NOT NULL
);

CREATE TABLE venta(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    IdEmpleadoFk INT(11) NOT NULL,
    IdClienteFk INT(11) NOT NULL,
    IdFormaPagoFk INT(11) NOT NULL
);

CREATE TABLE prenda(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    ValorUnitCop DOUBLE NOT NULL,
    ValorUnitUsd DOUBLE NOT NULL,
    IdEstadoFk INT(11) NOT NULL,
    IdTipoProteccion INT(11) NOT NULL,
    IdGeneroFk INT(11) NOT NULL,
    Codigo VARCHAR(50) NOT NULL,
);

CREATE TABLE inventario (
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CodInv VARCHAR(255) NOT NULL,
    IdPrendaFk INT(11) NOT NULL,
    ValorVtaCop DOUBLE NOT NULL,
    ValorVtaUsd DOUBLE NOT NULL
);

CREATE TABLE detalle_venta (
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    IdVentaFk INT(11) NOT NULL,
    IdProductoFk INT(11) NOT NULL,
    IdTallaFk INT(11) NOT NULL,
    cantidad INT(11) NOT NULL,
    valor_unit DOUBLE NOT NULL
);

CREATE TABLE orden (
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    IdEmpleadoFk INT(11) NOT NULL,
    IdClienteFk INT(11) NOT NULL,
    IdEstadoFk INT(11) NOT NULL
);

CREATE TABLE detalle_orden(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    IdOrdenFk INT(11) NOT NULL,
    IdPrendaFk INT(11) NOT NULL,
    PrendaId INT(11) NOT NULL,
    cantidad_producir INT(11) NOT NULL,
    IdColorFk INT(11) NOT NULL,
    cantidad_producida INT(11) NOT NULL,
    IdEstadoFk INT(11) NOT NULL
);

CREATE TABLE empresa(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nit VARCHAR(50) NOT NULL,
    razon_social TEXT NOT NULL,
    representante_legal VARCHAR(50) NOT NULL,
    FechaCreacion DATE NOT NULL,
    IdMunicipioFk INT(11) NOT NULL
);

CREATE TABLE insumo_prendas (
    IdInsumoFk INT(11) NOT NULL,
    IdPrendaFk INT(11) NOT NULL,
    Cantidad INT(11) NOT NULL,
    PRIMARY KEY (IdInsumoFk, IdPrendaFk)
);

CREATE TABLE inventario_talla(
    IdInvFk INT(11) NOT NULL,
    IdTallaFk INT(11) NOT NULL,
    PRIMARY KEY (IdInvFk, IdTallaFk)
);

---No se si esta bien---
CREATE TABLE proveedor(
    Id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NitProveedor VARCHAR(50) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    IdTipoPersona INT(11) NOT NULL,
    IdMunicipioFk INT(11) NOT NULL,
    PRIMARY KEY(NitProveedor)
);

CREATE TABLE insumo_proveedor(
    IdInsumoFk INT(11) NOT NULL,
    IdProveedorFk INT(11) NOT NULL,
    PRIMARY KEY (IdInsumoFk, IdProveedorFk)
);

---Desde aca seran las llaves foraneas
ALTER TABLE departamento
ADD FOREIGN KEY (IdPaisFk) REFERENCES pais(Id);

ALTER TABLE municipio
ADD FOREIGN KEY (IdDepartamentoFk) REFERENCES departamento(Id);

ALTER TABLE estado
ADD FOREIGN KEY (IdTipoEstadoFk) REFERENCES tipo_estado(Id);

ALTER TABLE cliente
ADD FOREIGN KEY (IdTipoPersonaFk) REFERENCES tipo_persona(Id),
ADD FOREIGN KEY (IdMunicipioFk) REFERENCES municipio(Id);

ALTER TABLE empleado
ADD FOREIGN KEY (IdCargoFk) REFERENCES cargos(Id),
ADD FOREIGN KEY (IdMunicipioFk) REFERENCES municipio(Id);

ALTER TABLE venta
ADD FOREIGN KEY (IdEmpleadoFk) REFERENCES empleado(Id),
ADD FOREIGN KEY (IdClienteFk) REFERENCES cliente(Id),
ADD FOREIGN KEY (IdFormaPagoFk) REFERENCES forma_pago(Id);

ALTER TABLE prenda
ADD FOREIGN KEY (IdEstadoFk) REFERENCES estado(Id),
ADD FOREIGN KEY (IdTipoProteccion) REFERENCES tipo_proteccion(Id),
ADD FOREIGN KEY (IdGeneroFk) REFERENCES genero(Id);

ALTER TABLE inventario
ADD FOREIGN KEY (IdPrendaFk) REFERENCES prenda(Id);

ALTER TABLE detalle_venta
ADD FOREIGN KEY (IdVentaFk) REFERENCES venta(Id),
ADD FOREIGN KEY (IdProductoFk) REFERENCES inventario(Id),
ADD FOREIGN KEY (IdTallaFk) REFERENCES talla(Id);

ALTER TABLE orden
ADD FOREIGN KEY (IdEmpleadoFk) REFERENCES empleado(Id),
ADD FOREIGN KEY (IdClienteFk) REFERENCES cliente(Id),
ADD FOREIGN KEY (IdEstadoFk) REFERENCES estado(Id);

---Un error en la base de datos, replicados PrendaId
ALTER TABLE detalle_orden
ADD FOREIGN KEY (IdOrdenFk) REFERENCES orden(Id),
ADD FOREIGN KEY (IdPrendaFk) REFERENCES prenda(Id),
ADD FOREIGN KEY (IdColorFk) REFERENCES color(Id),
ADD FOREIGN KEY (IdEstadoFk) REFERENCES estado(Id);

ALTER TABLE empresa
ADD FOREIGN KEY (IdMunicipioFk) REFERENCES municipio(Id);

ALTER TABLE insumo_prendas
ADD FOREIGN KEY (IdInsumoFk) REFERENCES insumo(Id),
ADD FOREIGN KEY (IdPrendaFk) REFERENCES prenda(Id);

ALTER TABLE inventario_talla
ADD FOREIGN KEY (IdInvFk) REFERENCES inventario(Id),
ADD FOREIGN KEY (IdTallaFk) REFERENCES talla(Id);

ALTER TABLE proveedor
ADD FOREIGN KEY (IdMunicipioFk) REFERENCES municipio(Id),
ADD FOREIGN KEY (IdTipoPersona) REFERENCES tipo_persona(Id);

ALTER TABLE insumo_proveedor
ADD FOREIGN KEY (IdInsumoFk) REFERENCES insumo(Id),
ADD FOREIGN KEY (IdProveedorFk) REFERENCES proveedor(Id);
