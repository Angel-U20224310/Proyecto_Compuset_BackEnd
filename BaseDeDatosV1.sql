DROP DATABASE IF EXISTS OPPJ;
Create database OPPJ;

Use OPPJ;

DROP table IF EXISTS producto;
Create Table producto (

   idProducto int (11) not null,
   Nombres varchar (255) not null,
   Foto blob,
   Descripcion varchar (255) not null,
   Precio  double  not null,
   Stock int (11) not null,
   Primary Key (idProducto)
);

DROP table IF EXISTS detalle_compras;
Create Table detalle_compras (
idDetalle int (10)  not null,
idProducto int (11) not null,
idCompras int (11)  not null,
Cantidad int (11)  not null,
PrecioCompra double not null,
Primary key (idDetalle),
 CONSTRAINT fk_detalle_compras FOREIGN KEY (idProducto) REFERENCES producto (idProducto) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP table IF EXISTS cliente;
Create Table cliente (
idCliente int (10) not null,
Dni varchar (8) not null,
Nombres varchar (255) not null,
Direccion varchar (255) not null,
Email varchar (255) not null,
Clave varchar (20) not null,
Primary key (idCliente)
);

DROP table IF EXISTS compras;
Create Table compras (
idCompras int (11)  not null,
idCliente int (10)  not null,
idPago int (11) not null,
FechaCompra varchar (11) not null,
Monto double not null,
Estado varchar (50),
FOREIGN KEY (idCompras) REFERENCES Producto (idProducto),
FOREIGN KEY (idCliente) REFERENCES cliente (idCliente),
FOREIGN KEY (idPago) REFERENCES pago (idPago)

);


DROP table IF EXISTS pago;
Create Table pago (
idPago int (11) not null,
Monto double not null,
Primary key (idPago)
);


