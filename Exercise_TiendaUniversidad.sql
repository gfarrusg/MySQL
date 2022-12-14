Use tienda;
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * 1.5 FROM producto;
SELECT nombre AS 'nombre de producto', precio AS euros, precio * 1.5 AS dolares FROM producto;
SELECT UPPER(nombre) FROM producto;
SELECT LOWER(nombre) FROM producto;
SELECT nombre, UPPER(SUBSTR(nombre, 1, 2)) FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, TRUNCATE (precio,0) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3,2;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, producto.precio,fabricante.codigo, fabricante.nombre FROM producto INNER JOIN fabricante ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.nombre, producto.precio,fabricante.codigo, fabricante.nombre FROM producto INNER JOIN fabricante ORDER BY producto.precio DESC LIMIT 1;
SELECT * FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE nombre = 'Lenovo';
SELECT * FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;
SELECT * FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';
SELECT * FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT * FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE ('%e');
SELECT * FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE ('%w%');
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON codigo_fabricante = fabricante.codigo WHERE precio >= 180 ORDER BY producto.precio DESC , producto.nombre ASC;
SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.nombre IS NULL;
SELECT * FROM producto WHERE codigo_fabricante = ( SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM tienda.producto WHERE producto.codigo_fabricante = (Select codigo FROM tienda.fabricante WHERE nombre = 'Lenovo')); 
SELECT nombre, MAX(precio) AS precio FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = "Lenovo");
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto where codigo_fabricante = 2);
SELECT nombre FROM producto WHERE precio >= ( SELECT MAX(precio)FROM producto WHERE codigo_fabricante = (SELECT codigo FROM tienda.fabricante WHERE nombre="Lenovo"));
SELECT * FROM fabricante INNER JOIN producto ON fabricante.codigo = codigo_fabricante WHERE fabricante.nombre = 'Asus' AND producto.precio > (SELECT AVG(precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = codigo_fabricante WHERE fabricante.nombre = 'Asus');
/*AQUI EMPIEZA UNIVERSIDAD*/ USE universidad;
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 DESC;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento LIKE '1999%';
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND NIF LIKE '%K';
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT apellido1,apellido2,p.nombre,d.nombre FROM persona p, departamento d, profesor t  WHERE p.id = t.id_profesor AND t.id_departamento = d.id ORDER BY apellido1,apellido2,p.nombre ASC;
SELECT a.nombre, c.anyo_inicio, c.anyo_fin FROM persona p, alumno_se_matricula_asignatura m, asignatura a, curso_escolar c WHERE p.nif = '26902806M' AND p.id = m.id_alumno AND m.id_asignatura = a.id AND m.id_curso_escolar = c.id;
SELECT DISTINCT d.nombre FROM departamento d, profesor p, asignatura a, grado g WHERE d.id = p.id_departamento AND p.id_profesor = a.id_profesor AND g.id = a.id_grado AND g.id = 4;
SELECT DISTINCT p.id, p.nif, p.nombre, p.apellido1, p.apellido2 FROM persona p, alumno_se_matricula_asignatura m, curso_escolar c WHERE p.tipo = 'alumno' AND p.id = m.id_alumno AND m.id_curso_escolar = c.id AND c.id = 5;
SELECT d.nombre 'nombre departamento', a.apellido1, a.apellido2, a.nombre FROM persona a LEFT JOIN profesor p ON a.id = p.id_profesor LEFT JOIN departamento d ON p.id_departamento = d.id WHERE a.tipo = 'profesor' ORDER by d.nombre DESC;
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON departamento.id = profesor.id_departamento WHERE departamento.nombre IS NULL ORDER BY departamento.nombre, persona.apellido1, persona.nombre;   
SELECT departamento.nombre AS departamento, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id RIGHT JOIN departamento ON departamento.id = profesor.id_departamento WHERE persona.nombre IS NULL ORDER BY departamento.nombre;
SELECT DISTINCT persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN asignatura ON asignatura.id_profesor = persona.id WHERE asignatura.id_profesor IS NULL;
SELECT departamento.nombre AS departamento FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id RIGHT JOIN departamento ON departamento.id = profesor.id_departamento WHERE persona.nombre IS NULL ORDER BY departamento.nombre;
SELECT nombre FROM asignatura WHERE id_profesor IS NULL;
SELECT count(id) FROM persona WHERE persona.tipo = 'alumno';
SELECT COUNT( 1 ) AS 'numero de alumnos' FROM persona p WHERE p.tipo = 'alumno' AND fecha_nacimiento LIKE '1999%';
SELECT departamento.nombre, count(profesor.id_profesor) FROM departamento RIGHT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre;
SELECT departamento.nombre, count(profesor.id_profesor) FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre;
SELECT grado.nombre, count(asignatura.id_grado) FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre ORDER BY count(asignatura.id_grado) DESC;
SELECT grado.nombre AS nombre_grado, count(asignatura.id_grado) AS numero_asignaturas FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.nombre HAVING count(asignatura.id_grado) > 40 ORDER BY count(asignatura.id_grado) DESC;
SELECT g.nombre, a.nombre, COUNT(*) AS 'Creditos Asignaturas'FROM grado g, asignatura a WHERE g.id = a.id GROUP BY g.nombre;
/*8 Retorna un llistat que mostri quants/es alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haur?? de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats/des.*/
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, count(asignatura.id) AS asignatures FROM persona LEFT JOIN asignatura ON asignatura.id_profesor = persona.id WHERE persona.tipo="profesor" GROUP BY persona.id ORDER BY asignatures DESC;
SELECT* FROM persona p WHERE p.tipo='alumno' AND p.fecha_nacimiento IN(SELECT MAX(p.fecha_nacimiento) FROM persona p);
SELECT a.nombre, a.apellido1,  d.nombre, g.nombre FROM persona a LEFT JOIN profesor p ON a.id = p.id_profesor LEFT JOIN departamento d ON p.id_departamento = d.id LEFT JOIN asignatura g ON p.id_profesor = g.id_profesor WHERE a.tipo = 'profesor' AND g.nombre IS NULL;


