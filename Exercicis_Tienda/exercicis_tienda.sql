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
