-- Active: 1712067878421@@127.0.0.1@3306
use tienda;

SELECT nombre from tienda.producto;

SELECT nombre, precio from tienda.producto;

SELECT * FROM tienda.producto;

SELECT nombre, precio, ROUND(precio * 1.08, 2) from tienda.producto;

SELECT
    nombre AS nombre_del_producto,
    precio AS precio_en_euros,
    ROUND(precio * 1.08, 2) AS precio_en_dolares
from tienda.producto;

SELECT UPPER(nombre), precio from tienda.producto;

SELECT LOWER(nombre), UPPER(precio) from tienda.producto;

SELECT nombre, UPPER(LEFT(nombre, 2)) from tienda.fabricante;

SELECT nombre, ROUND(precio) from tienda.producto;

SELECT nombre, precio from tienda.producto;

SELECT nombre, TRUNCATE (precio, 0) from tienda.producto;

SELECT DISTINCT
    fabricante.codigo
FROM fabricante
    INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

SELECT nombre from fabricante ORDER BY 'ASC';

SELECT nombre from fabricante ORDER BY 'DESC';
