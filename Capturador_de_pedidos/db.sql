﻿CREATE TABLE dbo.Cliente(
	IdCliente INT PRIMARY KEY IDENTITY,
	Nombre NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE dbo.Marca(
	IdMarca INT PRIMARY KEY IDENTITY,
	Nombre NVARCHAR(255) NOT NULL DEFAULT 'NO ESPECFICADO'
)
GO

CREATE TABLE dbo.Articulo(
	IdArticulo INT PRIMARY KEY IDENTITY,
	Codigo VARCHAR(5) NOT NULL,
	Clave NVARCHAR(15),
	Descripcion NVARCHAR(255) NOT NULL,
	Precio MONEY NOT NULL
)
GO

CREATE TABLE dbo.Venta(
	IdVenta INT PRIMARY KEY IDENTITY,
	IdCliente INT FOREIGN KEY REFERENCES dbo.Cliente(IdCliente) NOT NULL,
	IdUsuario INT FOREIGN KEY REFERENCES dbo.Usuario(IdUsuario) NOT NULL,
	SubTotal MONEY NOT NULL,
	IVA MONEY NOT NULL,
	Total MONEY NOT NULL
)
GO

CREATE TABLE dbo.DetalleVenta(
	IdDetalleVenta INT PRIMARY KEY IDENTITY,
	IdVenta INT FOREIGN KEY REFERENCES dbo.Venta(IdVenta) NOT NULL,
	IdArticulo INT FOREIGN KEY REFERENCES dbo.Articulo(IdArticulo) NOT NULL,
	Cantidad INT NOT NULL,
	PrecioVenta MONEY NOT NULL
)
GO