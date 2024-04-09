-- Active: 1712131945603@@127.0.0.1@3306
DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica
    DEFAULT CHARACTER SET = 'utf8mb4';

CREATE TABLE adreça(
  id_adreça INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  carrer VARCHAR(50) NOT NULL,
  numero INT NOT NULL,
  pis VARCHAR(5) NOT NULL,
  porta VARCHAR(5) NOT NULL,
  ciutat VARCHAR(50) NOT NULL,
  codi_postal VARCHAR(5) NOT NULL
);

CREATE TABLE proveidor(
id_proveidor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50) NOT NULL,
telefon VARCHAR(9) NOT NULL,
fax VARCHAR(9) NOT NULL,
NIF VARCHAR(9) NOT NULL,
id_adreça_proveidor INT NOT NULL,
FOREIGN KEY (id_adreça_proveidor) REFERENCES adreça(id_adreça)
);

CREATE TABLE empleat(
  id_empleat INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL
);

CREATE TABLE client(
id_client INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50) NOT NULL,
telefon VARCHAR(9) NOT NULL,
email VARCHAR(50) NOT NULL,
data_registre TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
id_client_recomanador INT,
FOREIGN KEY (id_client_recomanador) REFERENCES client(id_client),
id_adreça_client INT NOT NULL,
FOREIGN KEY (id_adreça_client) REFERENCES adreça(id_adreça)
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
id_ulleres_proveidor INT NOT NULL,
FOREIGN KEY (id_ulleres_proveidor) REFERENCES proveidor(id_proveidor),
);

CREATE TABLE venta(
id_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
id_venta_client INT NOT NULL,
FOREIGN KEY (id_venta_client) REFERENCES client(id_client),
id_venta_ulleres INT NOT NULL,
FOREIGN KEY (id_venta_ulleres) REFERENCES ulleres(id_ulleres),
id_venta_empleat INT NOT NULL,
FOREIGN KEY (id_venta_empleat) REFERENCES empleat(id_empleat)
);
