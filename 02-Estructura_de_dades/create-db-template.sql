-- Active: 1712131945603@@127.0.0.1@3306
DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica
    DEFAULT CHARACTER SET = 'utf8mb4';

CREATE TABLE proveidor(
id_proveidor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50) NOT NULL,
carrer VARCHAR(50) NOT NULL,
numero INT NOT NULL,
pis CHAR(5) NOT NULL,
porta CHAR(5) NOT NULL,
ciutat VARCHAR(50) NOT NULL,
codi_postal VARCHAR(5) NOT NULL,
telefon VARCHAR(9) NOT NULL,
fax VARCHAR(9) NOT NULL,
NIF VARCHAR(9) NOT NULL
);

CREATE TABLE empleat(
  id_empleat INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL
);

CREATE TABLE client(
id_client INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50) NOT NULL,
carrer VARCHAR(50) NOT NULL,
numero INT NOT NULL,
pis VARCHAR(5) NOT NULL,
porta VARCHAR(5) NOT NULL,
ciutat VARCHAR(50) NOT NULL,
codi_postal VARCHAR(5) NOT NULL,
telefon VARCHAR(9) NOT NULL,
email VARCHAR(50) NOT NULL,
data_registre TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
id_client_recomanador INT,
FOREIGN KEY (id_client_recomanador) REFERENCES client(id_client)
);


CREATE TABLE ulleres(
id_ulleres INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
graduacio_esquerra FLOAT NOT NULL,
graduacio_dreta FLOAT NOT NULL,
tipus_muntura ENUM('flotant', 'pasta', 'metal·lica') NOT NULL,
color_muntura VARCHAR(50) NOT NULL,
color_vidre_esquerre VARCHAR(50) NOT NULL,
color_vidre_dret VARCHAR(50) NOT NULL,
preu FLOAT NOT NULL,
id_proveidor_compra INT NOT NULL,
FOREIGN KEY (id_proveidor_compra) REFERENCES proveidor(id_proveidor)
id_venedor INT NOT NULL,
FOREIGN KEY (id_venedor) REFERENCES empleat(id_empleat)
id_comprador INT NOT NULL,
FOREIGN KEY (id_comprador) REFERENCES client(id_client)
);
