SELECT nombre FROM tienda.producto;
SELECT nombre, precio FROM tienda.producto;
SELECT * FROM tienda.producto;
SELECT nombre, precio, precio * 1.5 FROM tienda.producto;
SELECT nombre AS 'nombre de producto', precio AS euros, precio * 1.5 AS dolares FROM tienda.producto;
SELECT UPPER(nombre) FROM tienda.producto;
SELECT LOWER(nombre) FROM tienda.producto;
SELECT nombre, UPPER(SUBSTR(nombre, 1, 2)) FROM tienda.fabricante;
SELECT nombre, ROUND(precio) FROM tienda.producto;
SELECT nombre, TRUNCATE (precio,0) FROM tienda.producto;
SELECT codigo_fabricante FROM tienda.producto;
SELECT DISTINCT codigo_fabricante FROM tienda.producto;
SELECT nombre FROM tienda.fabricante ORDER BY nombre ASC;
SELECT nombre FROM tienda.fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM tienda.producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM tienda.fabricante LIMIT 5;
SELECT * FROM tienda.fabricante LIMIT 3,2;
SELECT nombre, precio FROM tienda.producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM tienda.producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM tienda.producto WHERE codigo_fabricante = 2;
SELECT producto.nombre, precio, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, precio, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, producto.precio,fabricante.codigo, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.nombre, producto.precio,fabricante.codigo, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ORDER BY producto.precio DESC LIMIT 1;
SELECT * FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';
SELECT * FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;
SELECT * FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';
SELECT * FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT * FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE ('%e');
SELECT * FROM tienda.producto INNER JOIN tienda.fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE ('%w%');
SELECT producto.nombre, precio, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC , producto.nombre ASC;
SELECT fabricante.nombre, fabricante.codigo FROM tienda.fabricante INNER JOIN tienda.producto ON fabricante.codigo = codigo_fabricante;
SELECT fabricante.nombre, fabricante.codigo FROM tienda.fabricante LEFT JOIN tienda.producto ON fabricante.codigo = codigo_fabricante;
SELECT fabricante.nombre FROM tienda.fabricante LEFT JOIN tienda.producto ON fabricante.codigo != producto.codigo_fabricante WHERE NOT fabricante.codigo = ANY ( SELECT producto.codigo_fabricante FROM tienda.producto) LIMIT 10, 2;
SELECT * FROM tienda.producto WHERE codigo_fabricante =  ( SELECT codigo FROM tienda.fabricante WHERE nombre = 'Lenovo');

SELECT nombre, MAX(precio) AS precio FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM tienda.fabricante WHERE nombre = "Lenovo");
SELECT nombre, MIN(precio) AS Precio FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM tienda.fabricante WHERE nombre = "Hewlett-Packard");
SELECT nombre FROM tienda.producto WHERE precio >= ( SELECT MAX(precio)FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM tienda.fabricante WHERE nombre="Lenovo"));
