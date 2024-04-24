-- Active: 1712067878421@@127.0.0.1@3306
DROP DATABASE IF EXISTS pizzeria;

CREATE DATABASE pizzeria DEFAULT CHARACTER
SET
  = 'utf8mb4';

use pizzeria;

CREATE TABLE
  adreça (
    id_adreça INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    carrer VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    pis VARCHAR(5) NOT NULL,
    porta VARCHAR(5) NOT NULL,
    ciutat VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL,
    codi_postal VARCHAR(5) NOT NULL
  );

CREATE TABLE
  client (
    id_client INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    telefon VARCHAR(9) NOT NULL,
    adreça_client INT NOT NULL,
    FOREIGN KEY (adreça_client) REFERENCES adreça (id_adreça)
  );

CREATE TABLE
  categoria_pizza (
    id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
  );

CREATE TABLE
  producte (
    id_producte INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipus ENUM ('beguda', 'pizza', 'hamburguesa') NOT NULL,
    nom VARCHAR(50) NOT NULL,
    descripcio VARCHAR(100) NOT NULL,
    imatge VARCHAR(100) NOT NULL,
    preu FLOAT NOT NULL,
    id_categoria_pizza INT,
    FOREIGN KEY (id_categoria_pizza) REFERENCES categoria_pizza (id_categoria)
  );

CREATE TRIGGER product_type_trigger BEFORE INSERT ON producte FOR EACH ROW BEGIN IF NEW.tipus = 'pizza'
AND NEW.id_categoria_pizza IS NULL THEN SIGNAL SQLSTATE '45000'
SET
  MESSAGE_TEXT = 'La categoría de la pizza no puede ser nula.';

END IF;

END;

CREATE TABLE
  botiga (
    id_botiga INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    adreça_botiga INT NOT NULL,
    FOREIGN KEY (adreça_botiga) REFERENCES adreça (id_adreça)
  );

CREATE TABLE
  empleat (
    id_empleat INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipus ENUM ('botiga', 'repartidor', 'cuiner') NOT NULL,
    nom VARCHAR(50) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    NIF VARCHAR(9) NOT NULL,
    telefon VARCHAR(9) NOT NULL,
    id_botiga_empleat INT NOT NULL,
    FOREIGN KEY (id_botiga_empleat) REFERENCES botiga (id_botiga)
  );

CREATE TABLE
  comanda (
    id_comanda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipus ENUM ('botiga', 'domicili') NOT NULL,
    data_comanda DATETIME NOT NULL,
    id_client_comanda INT NOT NULL,
    FOREIGN KEY (id_client_comanda) REFERENCES client (id_client),
    id_empleat_comanda INT NOT NULL,
    FOREIGN KEY (id_empleat_comanda) REFERENCES empleat (id_empleat),
    id_botiga_comanda INT NOT NULL,
    FOREIGN KEY (id_botiga_comanda) REFERENCES botiga (id_botiga),
    data_entrega DATETIME
  );

CREATE TABLE
  detall_comanda (
    id_detall INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_detall_comanda INT NOT NULL,
    id_detall_producte INT NOT NULL,
    quantitat INT DEFAULT 1,
    preu_total FLOAT,
    FOREIGN KEY (id_detall_comanda) REFERENCES comanda (id_comanda),
    FOREIGN KEY (id_detall_producte) REFERENCES producte (id_producte)
  );
