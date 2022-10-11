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
SELECT fabricante.nombre, fabricante.codigo FROM fabricante INNER JOIN producto ON fabricante.codigo = codigo_fabricante;
SELECT fabricante.nombre, fabricante.codigo FROM abricante LEFT JOIN roducto ON fabricante.codigo = codigo_fabricante;
SELECT fabricante.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo != codigo_fabricante WHERE NOT fabricante.codigo = ANY ( SELECT codigo_fabricante FROM producto) LIMIT 10, 2;
SELECT * FROM producto WHERE codigo_fabricante = ( SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM tienda.producto WHERE producto.codigo_fabricante = (Select codigo FROM tienda.fabricante WHERE nombre = 'Lenovo')); 
SELECT nombre, MAX(precio) AS precio FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = "Lenovo");
SELECT nombre, MIN(precio) AS Precio FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = "Hewlett-Packard");
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
SELECT a.apellido1, a.apellido2, a.nombre, d.nombre 'nombre departamento' FROM persona a LEFT JOIN departamento d ON a.id = d.id WHERE a.tipo ='profesor' AND d.nombre IS NULL;
SELECT a.nombre, a.apellido1, a.apellido2, d.nombre 'nombre departamento' FROM departamento d RIGHT JOIN persona a ON d.id = a.id WHERE a.tipo ='profesor' AND d.nombre IS NULL;
/*4 Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.Retorna un llistat amb els professors/es que no imparteixen cap assignatura.*/
/*5 Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.Retorna un llistat amb les assignatures que no tenen un professor/a assignat.*/
/*6 Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar*/
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p WHERE p.tipo = 'alumno ';
SELECT COUNT( 1 ) AS 'numero de alumnos' FROM persona p WHERE p.tipo = 'alumno' AND fecha_nacimiento LIKE '1999%';
/*3Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.*/
SELECT a.nombre, d.nombre FROM departamento d, profesor p, persona a WHERE p.id_profesor = d.id AND a.tipo  = 'profesor';
SELECT g.nombre, a.nombre FROM grado g, asignatura a WHERE g.id = a.id GROUP BY a.id DESC;
SELECT g.nombre, a.nombre, COUNT(*) AS 'Numero de Grados' FROM grado g, asignatura a WHERE g.id = a.id_grado GROUP BY g.id HAVING COUNT(*) >=40;
SELECT g.nombre, a.nombre, COUNT(*) AS 'Creditos Asignaturas'FROM grado g, asignatura a WHERE g.id = a.id GROUP BY g.nombre;
/*8*/
/*9*/
SELECT* FROM persona p WHERE p.tipo='alumno' AND p.fecha_nacimiento IN(SELECT MAX(p.fecha_nacimiento) FROM persona p);
SELECT a.nombre, d.nombre, g.nombre FROM persona a LEFT JOIN profesor p ON a.id = p.id_profesor LEFT JOIN departamento d ON p.id_departamento = d.id LEFT JOIN asignatura g ON p.id_profesor = g.id_profesor WHERE a.tipo = 'profesor' AND g.nombre IS NULL;