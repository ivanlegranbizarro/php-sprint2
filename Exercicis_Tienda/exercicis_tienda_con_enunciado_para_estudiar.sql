DROP DATABASE IF EXISTS tienda;

CREATE DATABASE tienda CHARACTER SET utf8mb4;

USE tienda;

CREATE TABLE fabricante (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(100) NOT NULL, precio DOUBLE NOT NULL, codigo_fabricante INT UNSIGNED NOT NULL, FOREIGN KEY (codigo_fabricante) REFERENCES fabricante (codigo)
);

-- Llista el nom de tots els productes que hi ha en la taula "producto".
SELECT nombre from tienda.producto;

-- Llista els noms i els preus de tots els productes de la taula "producto".
SELECT nombre, precio from tienda.producto;

-- Llista totes les columnes de la taula "producto".
SELECT * FROM tienda.producto;

-- Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans (USD).
SELECT nombre, precio, ROUND(precio * 1.08, 2) from tienda.producto;

-- Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de "producto", euros, dòlars nord-americans.
SELECT
    nombre AS nombre_del_producto,
    precio AS precio_en_euros,
    ROUND(precio * 1.08, 2) AS precio_en_dolares
from tienda.producto;

-- Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a majúscula.
SELECT UPPER(nombre), precio from tienda.producto;

-- Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a minúscula.
SELECT LOWER(nombre), UPPER(precio) from tienda.producto;

-- Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, UPPER(LEFT(nombre, 2)) from tienda.fabricante;

-- Llista els noms i els preus de tots els productes de la taula "producto", arrodonint el valor del preu.
SELECT nombre, ROUND(precio) from tienda.producto;

-- Llista els noms i els preus de tots els productes de la taula "producto", truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, TRUNCATE (precio, 0) from tienda.producto;

-- Llista el codi dels fabricants que tenen productes en la taula "producto".
SELECT fabricante.codigo
FROM fabricante
    INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- Llista el codi dels fabricants que tenen productes en la taula "producto", eliminant els codis que apareixen repetits.
SELECT DISTINCT
    fabricante.codigo
FROM fabricante
    INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre from fabricante ORDER BY 'ASC';

-- Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre from fabricante ORDER BY 'DESC';

-- Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
SELECT nombre, precio
from tienda.producto
ORDER BY nombre ASC, precio DESC;

-- Retorna una llista amb les 5 primeres files de la taula "fabricante".
SELECT * from tienda.fabricante limit 5;

-- Retorna una llista amb 2 files a partir de la quarta fila de la taula "fabricante". La quarta fila també s'ha d'incloure en la resposta.
SELECT * from tienda.fabricante limit 3, 2;

-- Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MIN(preu), necessitaries GROUP BY
SELECT nombre, precio
from tienda.producto
ORDER BY precio DESC
limit 1;

-- Llista el nom i el preu del producte més car. (Fes servir solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MAX(preu), necessitaries GROUP BY.
SELECT nombre, precio
from tienda.producto
ORDER BY precio ASC
limit 1;

-- Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre from tienda.producto WHERE codigo_fabricante = 2;

-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
from tienda.producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;

-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
from tienda.producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
ORDER BY fabricante.nombre ASC;

-- Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades.
SELECT
    producto.codigo,
    producto.nombre,
    fabricante.codigo AS codigo_fabricante,
    fabricante.nombre AS nombre_fabricante
FROM tienda.producto
    inner join fabricante ON fabricante.codigo = producto.codigo_fabricante;

-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
FROM tienda.producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
ORDER BY producto.precio ASC
LIMIT 1;

-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
FROM tienda.producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
ORDER BY producto.precio DESC
LIMIT 1;

-- Retorna una llista de tots els productes del fabricant Lenovo.
SELECT producto.nombre
from tienda.producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre = 'Lenovo';

-- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT producto.nombre, producto.precio
from tienda.producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre = 'Crucial'
    AND producto.precio > 200;

-- Retorna una llista amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
SELECT producto.nombre
from tienda.producto
    INNER JOIN fabricante on fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre = 'Asus'
    OR fabricante.nombre = 'Hewlett-Packard'
    OR fabricante.nombre = 'Seagate';

-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Usant l'operador IN.
SELECT producto.nombre
from tienda.producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre IN (
        'Asus', 'Hewlett-Packard', 'Seagate'
    );

-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT producto.nombre, producto.precio
from tienda.producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    producto.nombre LIKE '%e';

-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants dels quals contingui el caràcter w en el seu nom.
SELECT producto.nombre, producto.precio
from tienda.producto
    INNER join fabricante on fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre LIKE '%w%';

-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT producto.nombre, producto.precio, fabricante.nombre
from tienda.producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    producto.precio >= 180
ORDER BY producto.precio DESC, fabricante.nombre ASC;

-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT DISTINCT
    fabricante.codigo,
    fabricante.nombre
from tienda.fabricante
    INNER JOIN tienda.producto ON fabricante.codigo = producto.codigo_fabricante;

-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT fabricante.nombre, producto.nombre
from tienda.fabricante
    LEFT JOIN tienda.producto ON fabricante.codigo = producto.codigo_fabricante;

-- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT fabricante.nombre
from tienda.fabricante
    LEFT JOIN tienda.producto ON fabricante.codigo = producto.codigo_fabricante
WHERE
    producto.nombre IS NULL;

-- Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).
SELECT producto.nombre
from tienda.producto
WHERE
    codigo_fabricante = (
        SELECT fabricante.codigo
        FROM tienda.fabricante
        WHERE
            fabricante.nombre = 'Lenovo'
    );
-- Retorna tots els productes del fabricant Lenovo. (Utilizant INNER JOIN).
SELECT *
from tienda.producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre = 'Lenovo';

-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense fer servir INNER JOIN).
SELECT *
from tienda.producto
where
    producto.precio = (
        SELECT max(producto.precio)
        from tienda.producto
            join fabricante on fabricante.codigo = producto.codigo_fabricante
        where
            fabricante.nombre = 'Lenovo'
    );

-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Fent servir INNER JOIN).
SELECT p.*
FROM tienda.producto p
    INNER JOIN (
        SELECT MAX(precio) AS max_precio
        FROM tienda.producto pr
            JOIN fabricante f ON f.codigo = pr.codigo_fabricante
        WHERE
            f.nombre = 'Lenovo'
    ) AS max_precio_lenovo ON p.precio = max_precio_lenovo.max_precio;

-- Llista el nom del producte més car del fabricant Lenovo.
SELECT producto.nombre
from tienda.producto
    inner join fabricante on fabricante.codigo = producto.codigo_fabricante
where
    fabricante.nombre = 'Lenovo'
ORDER BY producto.precio DESC
LIMIT 1;

-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT producto.nombre
from tienda.producto
    inner join fabricante on fabricante.codigo = producto.codigo_fabricante
where
    fabricante.nombre = 'Hewlett-Packard'
ORDER BY producto.precio ASC
LIMIT 1;

-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT *
from tienda.producto
where
    producto.precio >= (
        SELECT max(producto.precio)
        from tienda.producto
            join fabricante on fabricante.codigo = producto.codigo_fabricante
        where
            fabricante.nombre = 'Lenovo'
    );

-- Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT producto.nombre, producto.precio
FROM tienda.producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre = 'Asus'
    AND producto.precio > (
        SELECT AVG(producto.precio)
        FROM tienda.producto
            INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
        WHERE
            fabricante.nombre = 'Asus'
    );
