#1
CREATE DATABASE EmpresaDevJav;
USE EmpresaDevJav;
#2
CREATE TABLE ciudades(
idCiudad INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(70) NOT NULL
);

CREATE TABLE generos(
idGenero INT PRIMARY KEY AUTO_INCREMENT,
genero CHAR NOT NULL
);

CREATE TABLE departamentos(
idDpto INT PRIMARY KEY AUTO_INCREMENT,
nombreDpto VARCHAR(30),
idCiudad INT NOT NULL,
director INT NOT NULL,
CONSTRAINT FK_idCiudad_ciudades FOREIGN KEY(idCiudad) REFERENCES ciudades(idCiudad)
);

CREATE TABLE empleados(
idEmp INT PRIMARY KEY AUTO_INCREMENT,
nombreEmp VARCHAR(50) NOT NULL,
apellido VARCHAR(60) NOT NULL,
idGenero INT NOT NULL,
fecNac DATE NOT NULL,
fecIncorporacion DATE NOT NULL,
salEmp DOUBLE NOT NULL,
comision DOUBLE,
cargo VARCHAR(70) NOT NULL,
idDpto INT NOT NULL,
CONSTRAINT FK_idGenero_generos FOREIGN KEY(idGenero) REFERENCES generos(idGenero),
CONSTRAINT FK_idDpto_departamentos FOREIGN KEY(idDpto) REFERENCES departamentos(idDpto)
);

INSERT INTO ciudades (nombre) 
VALUES 
	('Buenos Aires'),
	('Río Negro'),
	('La Pampa'),
	('Santa Cruz'),
	('Misiones');
    
INSERT INTO generos (genero)
VALUES 
	('F'),
    ('M'),
    ('X');
    
DESCRIBE departamentos;
SELECT*FROM departamentos;
ALTER TABLE departamentos
MODIFY COLUMN nombreDpto VARCHAR(50) NOT NULL;

INSERT INTO departamentos (nombreDpto,idCiudad,director)
VALUES 
	('Gerencia',1,16325987),
    ('Ventas',2,22654123),
    ('Atención al cliente',3,36547159),
    ('Tecnología',4,25487124),
    ('Marketing',5,14256417),
    ('Contabilidad',1,29874561),
    ('Finanzas',3,10236547),
    ('Recursos humanos',1,25896541);
    
INSERT INTO empleados (nombreEmp,apellido,idGenero,fecNac,fecIncorporacion,salEmp,comision,cargo,idDpto)
VALUES
	('Kyubi','Torres',2,'1960-01-01','2020-06-10',1000000,50000,'Gerente General',1),
    ('Pedro','Sanchez',2,'1970-05-06','1990-03-02',700000,70000,'Jefe de Atención al Cliente',3),
    ('Camila','Torres',1,'1997-12-06','2023-05-15','500000',NULL,'Administrativa',6),
    ('Yazmín','Lopez',3,'1996-05-29','2023-12-01',250000,10000,'Ejecutiva de Compras',7),
    ('Facundo','Albornoz',2,'2000-09-25','2024-01-01',200000,NULL,'Analista',6),
    ('Lionel','Messi',2,'1987-06-24','2004-02-01',800000,160000,'Administrativo',5),
    ('Adriana','Gutiérrez',1,'1962-08-04','1990-01-01',450000,45000,'Administrativo',2),
    ('Petra','González',1,'1970-09-01','1999-12-25',800000,NULL,'Desarrolladora',4),
    ('Kali','Giménez',2,'1985-03-22','2012-12-31',600000,80000,'Jefe de Recursos Humanos',8),
    ('Luis','Salas',2,'1960-01-02','1995-06-05',840000,NULL,'Jefe de Contabilidad',6),
    ('Silvana','Allegri',1,'1975-04-24','2015-07-12',150000,NULL,'Agente de Atención al Cliente',3);
    
#3.a
SELECT nombreEmp FROM empleados;
#3.b
SELECT*FROM departamentos;
#3.c
SELECT cargo FROM Empleados WHERE cargo='Gerente General';
#3.d
SELECT COUNT(*) AS TotalEmpleados FROM Empleados;
#3.e 
SELECT FORMAT(SUM(salEmp)/COUNT(*),2) AS PromedioSalarios FROM empleados;
#3.f
SELECT nombreDpto, idCiudad FROM departamentos
ORDER BY idCiudad;
#3.g
SELECT salEmp,comision,idDpto FROM empleados
WHERE idDpto=3;
#3.h
SELECT salEmp AS salarioActual, (salEmp*0.25)+20000 AS incremento, salEmp+(salEmp*0.25)+20000 AS total  FROM empleados;
#3.i
UPDATE empleados set salEmp=salEmp+(salEmp*0.25)+20000;
#3.j
UPDATE ciudades SET nombre='Chaco' WHERE idCiudad=3;
#3.k
SELECT salEmp FROM empleados WHERE idEmp=1;
#3.l
SELECT nombreEmp FROM empleados WHERE nombreEmp LIKE 'A%';
#3.m
SELECT*FROM empleados WHERE comision IS NULL;
#3.n
SELECT*FROM empleados WHERE salEmp>200000 AND idDpto=6;
#3.o
SELECT nombreEmp, salEmp FROM empleados ORDER BY salEmp DESC
LIMIT 1;
#3.p
DELETE FROM empleados WHERE idEmp=4;




    
	   



















