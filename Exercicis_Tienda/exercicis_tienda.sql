-- Active: 1712067878421@@127.0.0.1@3306
use tienda;

SELECT nombre from tienda.producto;

SELECT nombre, precio from tienda.producto;

SELECT * FROM tienda.producto;

SELECT nombre, precio, ROUND(precio * 1.08, 2) from tienda.producto;

SELECT nombre AS nombre_del_producto, precio AS precio_en_euros, ROUND(precio * 1.08, 2) AS precio_en_dolares from tienda.producto;

SELECT UPPER(nombre), precio from tienda.producto;

SELECT LOWER(nombre), UPPER(precio) from tienda.producto;

SELECT nombre, UPPER(LEFT(nombre, 2)) from tienda.fabricante;

SELECT nombre, ROUND(precio) from tienda.producto;

SELECT nombre, precio from tienda.producto;

SELECT nombre, TRUNCATE (precio, 0) from tienda.producto;

SELECT DISTINCT fabricante.codigo FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

SELECT nombre from fabricante ORDER BY 'ASC';

SELECT nombre from fabricante ORDER BY 'DESC';

SELECT nombre, precio from tienda.producto ORDER BY nombre ASC, precio DESC;

SELECT * from tienda.fabricante limit 5;

SELECT * from tienda.fabricante limit 3, 2;

SELECT nombre, precio from tienda.producto ORDER BY precio DESC limit 1;

SELECT nombre, precio from tienda.producto ORDER BY precio ASC limit 1;

SELECT nombre from tienda.producto WHERE codigo_fabricante = 2;

SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante from tienda.producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;

SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante
from tienda.producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY fabricante.nombre ASC;

SELECT producto.codigo, producto.nombre, fabricante.codigo AS codigo_fabricante,
fabricante.nombre AS nombre_fabricante FROM tienda.producto inner join fabricante ON fabricante.codigo = producto.codigo_fabricante;

SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante FROM tienda.producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio ASC LIMIT 1;

SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante FROM tienda.producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio DESC LIMIT 1;
SELECT producto.nombre from tienda.producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo';

SELECT producto.nombre, producto.precio from tienda.producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;

SELECT producto.nombre from tienda.producto INNER JOIN fabricante on fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';

SELECT producto.nombre from tienda.producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

SELECT producto.nombre, producto.precio from tienda.producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.nombre LIKE '%e';

SELECT producto.nombre, producto.precio from tienda.producto INNER join fabricante on fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%w%';

SELECT producto.nombre, producto.precio, fabricante.nombre from tienda.producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= 180 ORDER BY producto.precio DESC, fabricante.nombre ASC;

SELECT DISTINCT fabricante.codigo, fabricante.nombre from tienda.fabricante INNER JOIN tienda.producto ON fabricante.codigo = producto.codigo_fabricante;

SELECT fabricante.nombre, producto.nombre from tienda.fabricante LEFT JOIN tienda.producto ON fabricante.codigo = producto.codigo_fabricante;

SELECT fabricante.nombre from tienda.fabricante LEFT JOIN tienda.producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.nombre IS NULL;

SELECT producto.nombre from tienda.producto WHERE codigo_fabricante = (SELECT fabricante.codigo FROM tienda.fabricante WHERE fabricante.nombre = 'Lenovo');

SELECT * from tienda.producto where producto.precio = (SELECT max(producto.precio)  from tienda.producto join fabricante on fabricante.codigo = producto.codigo_fabricante where fabricante.nombre = 'Lenovo');

SELECT producto.nombre from tienda.producto inner join fabricante on fabricante.codigo = producto.codigo_fabricante where fabricante.nombre = 'Lenovo' ORDER BY producto.precio DESC LIMIT 1;

SELECT producto.nombre from tienda.producto inner join fabricante on fabricante.codigo = producto.codigo_fabricante where fabricante.nombre = 'Hewlett-Packard' ORDER BY producto.precio ASC LIMIT 1;

SELECT *
from tienda.producto where producto.precio >= (SELECT max(producto.precio) from tienda.producto join fabricante on fabricante.codigo = producto.codigo_fabricante where fabricante.nombre = 'Lenovo');

SELECT producto.nombre, producto.precio FROM tienda.producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus' AND producto.precio > (SELECT AVG(producto.precio) FROM tienda.producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus');

use universidad;

SELECT apellido1, apellido2, nombre from universidad.persona where tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 from universidad.persona where tipo = 'alumno' and telefono is null;
SELECT nombre, apellido1, apellido2 from universidad.persona where tipo = 'alumno' and fecha_nacimiento between '1999-01-01' and '1999-12-31';
SELECT nombre, apellido1, apellido2 from universidad.persona where tipo = 'profesor' and telefono is null and nif like '%K';
SELECT nombre from universidad.asignatura where cuatrimestre = 1 and curso = 3 and id_grado = 7;
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS nombre_departamento FROM persona p INNER JOIN profesor pr ON p.id = pr.id_profesor INNER JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY p.apellido1, p.apellido2, p.nombre;

SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin from universidad.alumno_se_matricula_asignatura inner join asignatura on asignatura.id = id_asignatura inner join persona on persona.id = id_alumno inner join curso_escolar on curso_escolar.id = id_curso_escolar where persona.nif = '26902806M';
SELECT DISTINCT d.nombre FROM departamento d INNER JOIN profesor p ON d.id = p.id_departamento INNER JOIN asignatura a ON p.id_profesor = a.id_profesor INNER JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT nombre, apellido1, apellido2 from universidad.alumno_se_matricula_asignatura inner join persona on persona.id = id_alumno inner join curso_escolar on curso_escolar.id = id_curso_escolar where anyo_inicio = 2018 and anyo_fin = 2019;
