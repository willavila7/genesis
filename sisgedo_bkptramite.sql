-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.23-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema tramite
--

CREATE DATABASE IF NOT EXISTS sisgedo;
USE sisgedo;

--
-- Temporary table structure for view `vta_derpro`
--
DROP TABLE IF EXISTS `vta_derpro`;
DROP VIEW IF EXISTS `vta_derpro`;
CREATE TABLE `vta_derpro` (
  `idexpediente` int(11),
  `expediente` int(11),
  `documento` varchar(300),
  `asunto` varchar(300),
  `folios` int(11),
  `observacion` varchar(300),
  `deriva` varchar(300),
  `fecha` datetime,
  `fechrecepcion` datetime,
  `proveido` varchar(45),
  `ruta` varchar(300),
  `idestadoexp` int(11),
  `idestadodoc` int(11),
  `estado` varchar(91),
  `idarea` bigint(11),
  `destino` varchar(15)
);

--
-- Temporary table structure for view `vta_directorio`
--
DROP TABLE IF EXISTS `vta_directorio`;
DROP VIEW IF EXISTS `vta_directorio`;
CREATE TABLE `vta_directorio` (
  `idarea` int(11),
  `area` varchar(150),
  `siglas` varchar(15),
  `telefono` varchar(15),
  `anexo` varchar(10),
  `correo` varchar(100),
  `local` varchar(150),
  `direccion` varchar(150),
  `responsable` tinyint(1),
  `autoridad` varchar(301),
  `estado` tinyint(1)
);

--
-- Temporary table structure for view `vta_docarea`
--
DROP TABLE IF EXISTS `vta_docarea`;
DROP VIEW IF EXISTS `vta_docarea`;
CREATE TABLE `vta_docarea` (
  `idexpediente` int(11),
  `expediente` int(11),
  `iddocumento` int(11),
  `documento` varchar(300),
  `asunto` varchar(300),
  `folios` int(11),
  `fecha` datetime,
  `fechingsist` datetime,
  `observacion` varchar(300),
  `idtipodocumento` int(11),
  `tipoingreso` int(11),
  `idpersona` int(11),
  `idtrabajador` int(11),
  `idprioridad` int(11),
  `prioridad` varchar(45),
  `dias` int(11),
  `ruta` varchar(300),
  `idestadoexp` int(11),
  `idestadodoc` int(11),
  `estado` varchar(91),
  `idarea` int(11)
);

--
-- Temporary table structure for view `vta_documento`
--
DROP TABLE IF EXISTS `vta_documento`;
DROP VIEW IF EXISTS `vta_documento`;
CREATE TABLE `vta_documento` (
  `documento` varchar(300),
  `asunto` varchar(300),
  `folios` int(11),
  `observacion` varchar(300),
  `fechrecepcion` datetime,
  `fechingsist` datetime,
  `confidencialidad` tinyint(1),
  `ruta` varchar(300),
  `tipoingreso` int(11),
  `idreferencia` int(11),
  `idexpediente` int(11),
  `expediente` int(11),
  `idprioridad` int(11),
  `prioridad` varchar(45),
  `idarea` int(11),
  `area` varchar(150),
  `siglas` varchar(15),
  `idanio` int(11),
  `anio` year(4),
  `nombre` varchar(300),
  `idestadoexp` int(11),
  `estadoexp` varchar(45),
  `idestadodoc` int(11),
  `estadodoc` varchar(45)
);

--
-- Temporary table structure for view `vta_empleado`
--
DROP TABLE IF EXISTS `vta_empleado`;
DROP VIEW IF EXISTS `vta_empleado`;
CREATE TABLE `vta_empleado` (
  `idpersona` int(11),
  `dni` char(8),
  `ruc` char(11),
  `apellidos` varchar(150),
  `nombres` varchar(150),
  `fechnac` date,
  `genero` char(1),
  `direccion` varchar(300),
  `telefono1` varchar(45),
  `telefono2` varchar(45),
  `correo1` varchar(45),
  `correo2` varchar(45),
  `intext` tinyint(1),
  `idlocal` int(11),
  `idtrabajador` int(11),
  `responsable` tinyint(1),
  `fechingreso` date,
  `resingreso` varchar(100),
  `fechcese` date,
  `rescese` varchar(100),
  `estado` tinyint(1),
  `procedencia` varchar(456),
  `cargo` varchar(150),
  `area` varchar(150),
  `idarea` int(11),
  `idcargo` int(11),
  `idmodalidad` int(11),
  `modalidad` varchar(150),
  `ilocal` int(11),
  `local` varchar(150),
  `idireccion` varchar(150)
);

--
-- Temporary table structure for view `vta_institucion`
--
DROP TABLE IF EXISTS `vta_institucion`;
DROP VIEW IF EXISTS `vta_institucion`;
CREATE TABLE `vta_institucion` (
  `idinstitucion` int(11),
  `ruc` char(11),
  `razonsocial` varchar(300),
  `correo` varchar(100),
  `direccion` varchar(300),
  `telefono` varchar(45),
  `idpersona` int(11),
  `dni` char(8),
  `apellidos` varchar(150),
  `nombres` varchar(150),
  `tipoinstitucion` varchar(45),
  `procedencia` varchar(452),
  `idtipoinstitucion` int(11),
  `idlocal` int(11)
);

--
-- Temporary table structure for view `vta_persona`
--
DROP TABLE IF EXISTS `vta_persona`;
DROP VIEW IF EXISTS `vta_persona`;
CREATE TABLE `vta_persona` (
  `idpersona` int(11),
  `dni` char(8),
  `ruc` char(11),
  `apellidos` varchar(150),
  `nombres` varchar(150),
  `fechnac` date,
  `genero` char(1),
  `direccion` varchar(300),
  `telefono1` varchar(45),
  `telefono2` varchar(45),
  `correo1` varchar(45),
  `correo2` varchar(45),
  `intext` tinyint(1),
  `idlocal` int(11),
  `procedencia` varchar(456)
);

--
-- Temporary table structure for view `vta_recepciondoc`
--
DROP TABLE IF EXISTS `vta_recepciondoc`;
DROP VIEW IF EXISTS `vta_recepciondoc`;
CREATE TABLE `vta_recepciondoc` (
  `idexpediente` int(11),
  `expediente` int(11),
  `idestadoexp` int(11),
  `documento` varchar(300),
  `asunto` varchar(300),
  `folios` int(11),
  `observacion` varchar(300),
  `idestadodoc` int(11),
  `ruta` varchar(300),
  `fechrecepcion` datetime,
  `idderiva` int(11),
  `deriva` varchar(300),
  `fecha` datetime,
  `circular` tinyint(1),
  `idarea` int(11),
  `destino` varchar(15),
  `origen` varchar(15),
  `foto` varchar(300)
);

--
-- Temporary table structure for view `vta_reporte`
--
DROP TABLE IF EXISTS `vta_reporte`;
DROP VIEW IF EXISTS `vta_reporte`;
CREATE TABLE `vta_reporte` (
  `idderiva` int(11),
  `circular` tinyint(1),
  `documento` varchar(300),
  `asunto` varchar(300),
  `folios` int(11),
  `observacion` varchar(300),
  `fechrecepcion` datetime,
  `fecha` date,
  `fechingsist` datetime,
  `iddocumento` int(11),
  `idexpediente` int(11),
  `expediente` int(11),
  `idarea` int(11),
  `dias` int(11),
  `prioridad` varchar(45),
  `idestadoexp` int(11),
  `estadoexp` varchar(45),
  `idestadodoc` int(11),
  `estadodoc` varchar(45),
  `origen` varchar(15),
  `destino` varchar(15)
);

--
-- Temporary table structure for view `vta_reportedis`
--
DROP TABLE IF EXISTS `vta_reportedis`;
DROP VIEW IF EXISTS `vta_reportedis`;
CREATE TABLE `vta_reportedis` (
  `idexpediente` int(11),
  `expediente` int(11),
  `documento` varchar(300),
  `asunto` varchar(300),
  `folios` int(11),
  `observacion` varchar(300),
  `deriva` varchar(300),
  `fecha` date,
  `fechrecepcion` datetime,
  `fecha1` date,
  `ruta` varchar(300),
  `idarea` int(11),
  `idestadoexp` int(11),
  `idestadodoc` int(11),
  `origen` varchar(15),
  `destino` varchar(15)
);

--
-- Temporary table structure for view `vta_reportedis2`
--
DROP TABLE IF EXISTS `vta_reportedis2`;
DROP VIEW IF EXISTS `vta_reportedis2`;
CREATE TABLE `vta_reportedis2` (
  `iddocumento` int(11),
  `documento` varchar(300),
  `asunto` varchar(300),
  `folios` int(11),
  `observacion` varchar(300),
  `fechrecepcion` datetime,
  `fechingsist` datetime,
  `ruta` varchar(300),
  `idestadodoc` int(11),
  `estadodoc` varchar(45),
  `idestadoexp` int(11),
  `estadoexp` varchar(45),
  `idexpediente` int(11),
  `expediente` int(11),
  `idarea` int(11),
  `area` varchar(150),
  `idderiva` int(11),
  `deriva` varchar(300),
  `fechderiva` datetime,
  `destino` varchar(15)
);

--
-- Temporary table structure for view `vta_reportemit`
--
DROP TABLE IF EXISTS `vta_reportemit`;
DROP VIEW IF EXISTS `vta_reportemit`;
CREATE TABLE `vta_reportemit` (
  `iddocumento` int(11),
  `documento` varchar(300),
  `asunto` varchar(300),
  `folios` int(11),
  `observacion` varchar(300),
  `fechrecepcion` datetime,
  `fechingsist` datetime,
  `tipoingreso` int(11),
  `idpersona` int(11),
  `idexpediente` int(11),
  `expediente` int(11),
  `idarea` int(11),
  `area` varchar(150),
  `siglas` varchar(15),
  `idlocal` int(11),
  `idderiva` int(11),
  `fechderiva` datetime
);

--
-- Temporary table structure for view `vta_reporterec`
--
DROP TABLE IF EXISTS `vta_reporterec`;
DROP VIEW IF EXISTS `vta_reporterec`;
CREATE TABLE `vta_reporterec` (
  `iddocumento` int(11),
  `documento` varchar(300),
  `asunto` varchar(300),
  `folios` int(11),
  `observacion` varchar(300),
  `fechrecepcion` datetime,
  `fechingsist` datetime,
  `confidencialidad` tinyint(1),
  `ruta` varchar(300),
  `tipoingreso` int(11),
  `idreferencia` int(11),
  `idexpediente` int(11),
  `expediente` int(11),
  `idarea` int(11),
  `area` varchar(150),
  `idestadoexp` int(11),
  `estadoexp` varchar(45),
  `idestadodoc` int(11),
  `estadodoc` varchar(45),
  `idderiva` int(11),
  `fechderiva` datetime,
  `plazo` int(11),
  `origen` varchar(15),
  `destino` varchar(15)
);

--
-- Temporary table structure for view `vta_rptdocdis`
--
DROP TABLE IF EXISTS `vta_rptdocdis`;
DROP VIEW IF EXISTS `vta_rptdocdis`;
CREATE TABLE `vta_rptdocdis` (
  `idarea` int(11),
  `siglas` varchar(15),
  `idexpediente` int(11),
  `expediente` int(11),
  `idanio` int(11),
  `idestadoexp` int(11),
  `estadoexp` varchar(45),
  `documento` varchar(300),
  `asunto` varchar(300),
  `folios` int(11),
  `observacion` varchar(300),
  `fechrecepcion` datetime,
  `fechingsist` datetime,
  `confidencialidad` tinyint(1),
  `ruta` varchar(300),
  `tipoingreso` int(11),
  `idpersona` int(11),
  `idtipodocumento` int(11),
  `idprioridad` int(11),
  `prioridad` varchar(45),
  `idreferencia` int(11),
  `idestadodoc` int(11),
  `idderiva` int(11),
  `deriva` varchar(300),
  `fechderiva` datetime,
  `circular` tinyint(1),
  `destino` varchar(15),
  `idproveido` bigint(11)
);

--
-- Temporary table structure for view `vta_seguimiento`
--
DROP TABLE IF EXISTS `vta_seguimiento`;
DROP VIEW IF EXISTS `vta_seguimiento`;
CREATE TABLE `vta_seguimiento` (
  `iddocumento` int(11),
  `documento` varchar(300),
  `asunto` varchar(300),
  `folios` int(11),
  `observacion` varchar(300),
  `fechrecepcion` datetime,
  `fechingsist` datetime,
  `confidencialidad` tinyint(1),
  `ruta` varchar(300),
  `tipoingreso` int(11),
  `idreferencia` int(11),
  `idexpediente` int(11),
  `expediente` int(11),
  `idarea` int(11),
  `area` varchar(150),
  `idestadoexp` int(11),
  `estadoexp` varchar(45),
  `idestadodoc` int(11),
  `estadodoc` varchar(45),
  `idderiva` int(11),
  `fechderiva` datetime,
  `dias` int(7),
  `horas` time,
  `plazo` int(11),
  `origen` varchar(15),
  `destino` varchar(15)
);

--
-- Temporary table structure for view `vta_sinusu`
--
DROP TABLE IF EXISTS `vta_sinusu`;
DROP VIEW IF EXISTS `vta_sinusu`;
CREATE TABLE `vta_sinusu` (
  `idtrabajador` int(11),
  `responsable` tinyint(1),
  `fechingreso` date,
  `resingreso` varchar(100),
  `fechcese` date,
  `rescese` varchar(100),
  `estado` tinyint(1),
  `idcargo` int(11),
  `cargo` varchar(150),
  `idmodalidad` int(11),
  `idcategoria` int(11),
  `idpersona` int(11),
  `idarea` int(11),
  `area` varchar(150),
  `dni` char(8),
  `ruc` char(11),
  `apellidos` varchar(150),
  `nombres` varchar(150),
  `fechnac` date,
  `genero` char(1),
  `direccion` varchar(300),
  `telefono1` varchar(45),
  `telefono2` varchar(45),
  `correo1` varchar(45),
  `correo2` varchar(45),
  `intext` tinyint(1),
  `idlocal` int(11),
  `idusuario` varchar(45),
  `ruta` varchar(300),
  `idtipousuario` int(11)
);

--
-- Temporary table structure for view `vta_usuario`
--
DROP TABLE IF EXISTS `vta_usuario`;
DROP VIEW IF EXISTS `vta_usuario`;
CREATE TABLE `vta_usuario` (
  `idpersona` int(11),
  `dni` char(8),
  `ruc` char(11),
  `apellidos` varchar(150),
  `nombres` varchar(150),
  `fechnac` date,
  `genero` char(1),
  `direccion` varchar(300),
  `telefono1` varchar(45),
  `telefono2` varchar(45),
  `correo1` varchar(45),
  `correo2` varchar(45),
  `intext` tinyint(1),
  `idlocal` int(11),
  `idtrabajador` int(11),
  `responsable` tinyint(1),
  `fechingreso` date,
  `resingreso` varchar(100),
  `fechcese` date,
  `rescese` varchar(100),
  `estado` tinyint(1),
  `procedencia` varchar(456),
  `idcargo` int(11),
  `cargo` varchar(150),
  `siglas` varchar(15),
  `area` varchar(150),
  `idarea` int(11),
  `idmodalidad` int(11),
  `modalidad` varchar(150),
  `idusuario` varchar(45),
  `local` varchar(150),
  `ilocal` int(11),
  `idireccion` varchar(150)
);

--
-- Definition of table `anio`
--

DROP TABLE IF EXISTS `anio`;
CREATE TABLE `anio` (
  `idanio` int(11) NOT NULL AUTO_INCREMENT,
  `anio` year(4) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  PRIMARY KEY (`idanio`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `anio`
--

/*!40000 ALTER TABLE `anio` DISABLE KEYS */;
INSERT INTO `anio` (`idanio`,`anio`,`nombre`) VALUES 
 (1,1963,'AÑO DE LA ALFABETIZACIÓN'),
 (2,1964,'AÑO DE LA ENSEÑANZA GRATUITA'),
 (3,1965,'AÑO DEL NIÑO'),
 (4,1966,'AÑO DE LOS VENCEDORES DEL 2 DE MAYO'),
 (5,1967,'AÑO DE SANTA ROSA DE LIMA'),
 (6,1968,'AÑO DE LOS DERECHOS HUMANOS'),
 (7,1969,'SIN NOMBRE'),
 (8,1970,'AÑO DE LOS PRECURSORES DE LA INDEPENDENCIA'),
 (9,1971,'AÑO DEL SESQUICENTENARIO DE LA INDEPENDENCIA NACIONAL'),
 (10,1972,'AÑO DE LOS CENSOS NACIONALES'),
 (11,1973,'AÑO DE LAS 200 MILLAS DEL MAR TERRITORIAL'),
 (12,1974,'AÑO SESQUICENTENARIO DE LAS BATALLAS DE JUNÍN Y AYACUCHO Y DE LA CONVOCATORIA AL CONGRESO DE PANAMÁ'),
 (13,1975,'SIN NOMBRE'),
 (14,1976,'AÑO DE LA PRODUCCIÓN'),
 (15,1977,'AÑO DE LA UNIÓN NACIONAL'),
 (16,1978,'AÑO DE LA AUSTERIDAD'),
 (17,1979,'AÑO DE NUESTROS HÉROES DE LA GUERRA DEL PACÍFICO'),
 (18,1980,'AÑO DE LOS DEBERES CIUDADANOS'),
 (19,1981,'AÑO DEL BICENTENARIO DE LA REBELIÓN EMANCIPADORA DE TÚPAC AMARU Y MICAELA BASTIDAS'),
 (20,1982,'AÑO DE LOS DERECHOS DEL MINUSVÁLIDO'),
 (21,1983,'AÑO DEL BICENTENARIO DEL NACIMIENTO DEL LIBERTADOR SIMÓN BOLÍVAR'),
 (22,1984,'AÑO DE SESQUICENTENARIO DEL NATALICIO DEL ALMIRANTE MIGUEL GRAU'),
 (23,1985,'AÑO DEL CENTENARIO DEL SACRIFICIO DE DANIEL ALCIDES CARRIÓN'),
 (24,1986,'AÑO DEL CUATRICENTENARIO DEL NACIMIENTO DE SANTA ROSA DE LIMA'),
 (25,1987,'AÑO DEL BICENTENARIO DEL NACIMIENTO DE DON JOSÉ FAUSTINO SÁNCHEZ CARRIÓN'),
 (26,1988,'AÑO DE LA REGIONALIZACIÓN'),
 (27,1989,'AÑO DEL 450° ANIVERSARIO DEL NACIMIENTO DEL INCA GARCILAZO DE LA VEGA'),
 (28,1990,'AÑO DEL CENTENARIO DEL FALLECIMIENTO DEL SABIO ANTONIO RAIMONDI'),
 (29,1991,'AÑO DE AUSTERIDAD Y DE LA PLANIFICACIÓN FAMILIAR'),
 (30,1992,'AÑO DE CÉSAR VALLEJO Y DEL ENCUENTRO DE DOS MUNDOS'),
 (31,1993,'AÑO DE LA MODERNIZACIÓN EDUCATIVA'),
 (32,1994,'AÑO DE LA MODERNIZACIÓN EDUCATIVA Y DEL DEPORTE'),
 (33,1995,'AÑO DE LAS INVERSIONES PRODUCTIVAS'),
 (34,1996,'AÑO DE LOS SEISCIENTOS MIL TURISTAS'),
 (35,1997,'AÑO DE LA REFORESTACIÓN: CIEN MILLONES DE ÁRBOLES'),
 (36,1998,'SIN NOMBRE'),
 (37,1999,'AÑO DE LA ACTIVIDAD TURÍSTICA INTERNA'),
 (38,2000,'AÑO DE LA LUCHA CONTRA LA VIOLENCIA FAMILIAR'),
 (39,2001,'AÑO DE LA CONMEMORACIÓN DE LOS 450 AÑOS DE LA UNIVERSIDAD NACIONAL MAYOR DE SAN MARCOS'),
 (40,2002,'AÑO DE LA VERDAD Y LA RECONCILIACIÓN NACIONAL'),
 (41,2003,'AÑO DE LOS DERECHOS DE LA PERSONA CON DISCAPACIDAD'),
 (42,2004,'AÑO DEL ESTADO DE DERECHO Y DE LA GOBERNABILIDAD DEMOCRÁTICA'),
 (43,2005,'AÑO DE LA INFRAESTRUCTURA PARA LA INTEGRACIÓN'),
 (44,2006,'AÑO DE LA CONSOLIDACIÓN DEMOCRÁTICA'),
 (45,2007,'AÑO DEL DEBER CIUDADANO'),
 (46,2008,'AÑO DE LAS CUMBRES MUNDIALES EN EL PERÚ'),
 (47,2009,'AÑO DE LA UNIÓN NACIONAL FRENTE A LA CRISIS EXTERNA'),
 (48,2010,'AÑO DE LA CONSOLIDACIÓN ECONÓMICA Y SOCIAL DEL PERÚ'),
 (49,2011,'AÑO DEL CENTENARIO DE MACHU PICCHU PARA EL MUNDO'),
 (50,2012,'AÑO DE LA INTEGRACIÓN NACIONAL Y EL RECONOCIMIENTO DE NUESTRA DIVERSIDAD'),
 (51,2013,'AÑO DE LA INVERSIÓN PARA EL DESARROLLO RURAL Y LA SEGURIDAD ALIMENTARIA'),
 (52,2014,'AÑO DE LA PROMOCIÓN DE LA INDUSTRIA RESPONSABLE Y DEL COMPROMISO CLIMÁTICO'),
 (53,2015,'AÑO DE LA DIVERSIFICACIÓN PRODUCTIVA Y DEL FORTALECIMIENTO DE LA EDUCACIÓN'),
 (54,2016,'AÑO DE LA CONSOLIDACIÓN DEL MAR DE GRAU'),
 (55,2017,'AÑO DEL BUEN SERVICIO AL CIUDADANO'),
 (56,2018,'');
/*!40000 ALTER TABLE `anio` ENABLE KEYS */;


--
-- Definition of table `archivo`
--

DROP TABLE IF EXISTS `archivo`;
CREATE TABLE `archivo` (
  `archivo` varchar(200) NOT NULL,
  `fecharchivo` datetime NOT NULL,
  `idexpediente` int(11) NOT NULL,
  KEY `fk_archivo_expediente1_idx` (`idexpediente`),
  CONSTRAINT `fk_archivo_expediente1` FOREIGN KEY (`idexpediente`) REFERENCES `expediente` (`idexpediente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `archivo`
--

/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivo` ENABLE KEYS */;


--
-- Definition of table `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `idarea` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(150) NOT NULL,
  `siglas` varchar(15) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `anexo` varchar(10) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `area_idarea` int(11) DEFAULT NULL,
  `idlocal` int(11) NOT NULL,
  PRIMARY KEY (`idarea`),
  KEY `fk_area_area1_idx` (`area_idarea`),
  KEY `fk_area_local1_idx` (`idlocal`),
  CONSTRAINT `fk_area_area1` FOREIGN KEY (`area_idarea`) REFERENCES `area` (`idarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_area_local1` FOREIGN KEY (`idlocal`) REFERENCES `local` (`idlocal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `area`
--

/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` (`idarea`,`area`,`siglas`,`telefono`,`anexo`,`correo`,`area_idarea`,`idlocal`) VALUES
 (1,'OFICINA DE TIC','OTIC','123443210','123','otic@empresa.com',NULL,1),
 (2,'GERENCIA GENERAL','GG','987654321','987','gg@empresa.com',NULL,2),
 (3,'GERENCIA FINANCIERA','GF','324554321','324','gf@empresa.com',NULL,3),
 (4,'GERENCIA OPERACIONES','GO','635452340','635','go@empresa.com',NULL,4),
 (5,'GERENCIA RECURSOS HUMANOS','GRRHH','094523421','094','grrhh@empresa.com',NULL,2);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;


--
-- Definition of table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `idcargo` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(150) NOT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cargo`
--

/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` (`idcargo`,`cargo`) VALUES
 (1,'ANALISTA DE LAS TICS'),
 (2,'ARTESANO'),
 (3,'ASISTENTE'),
 (4,'AUDITOR'),
 (5,'AUXILIAR ADMINISTRATIVO'),
 (6,'CHOFER'),
 (7,'COTIZADOR'),
 (8,'DIRECTOR'),
 (9,'GERENTE'),
 (10,'ELECTRICISTA'),
 (11,'ENCARGADO'),
 (12,'ESPECIALISTA'),
 (13,'ESTADISTICO'),
 (14,'FORESTAL'),
 (15,'GUARDIAN'),
 (16,'INGENIERO'),
 (17,'JEFE DE OFICINA'),
 (18,'JEFE DE UNIDAD'),
 (19,'MECANICO'),
 (20,'OBRERO'),
 (21,'OPERADOR'),
 (22,'PERIODISTA'),
 (23,'PERSONAL DE SERVICIO'),
 (24,'PROFESOR'),
 (25,'SECRETARIA'),
 (26,'SOLDADOR/ELECTRICISTA'),
 (27,'SUPERVISOR'),
 (28,'TECNICO'),
 (29,'TESORERO'),
 (30,'VIGILANTE'),
 (31,'ASESOR');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;


--
-- Definition of table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(150) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categoria`
--

/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`idcategoria`,`categoria`) VALUES 
 (1,'DIRECTIVO'),
 (2,'PROFESIONAL'),
 (3,'TECNICO'),
 (4,'AUXILIAR');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


--
-- Definition of table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `iddepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(150) NOT NULL,
  PRIMARY KEY (`iddepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departamento`
--

/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` (`iddepartamento`,`departamento`) VALUES 
 (1,'AMAZONAS'),
 (2,'ANCASH'),
 (3,'APURIMAC'),
 (4,'AREQUIPA'),
 (5,'AYACUCHO'),
 (6,'CAJAMARCA'),
 (7,'CALLAO'),
 (8,'CUSCO'),
 (9,'HUANCAVELICA'),
 (10,'HUANUCO'),
 (11,'ICA'),
 (12,'JUNIN'),
 (13,'LA LIBERTAD'),
 (14,'LAMBAYEQUE'),
 (15,'LIMA'),
 (16,'LORETO'),
 (17,'MADRE DE DIOS'),
 (18,'MOQUEGUA'),
 (19,'PASCO'),
 (20,'PIURA'),
 (21,'PUNO'),
 (22,'SAN MARTIN'),
 (23,'TACNA'),
 (24,'TUMBES'),
 (25,'UCAYALI');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;


--
-- Definition of table `deriva`
--

DROP TABLE IF EXISTS `deriva`;
CREATE TABLE `deriva` (
  `idderiva` int(11) NOT NULL AUTO_INCREMENT,
  `contador` int(11) DEFAULT NULL,
  `deriva` varchar(300) DEFAULT NULL,
  `fechderiva` datetime NOT NULL,
  `idexpediente` int(11) NOT NULL,
  `idtrabajadoring` int(11) NOT NULL,
  `idtrabajadordes` int(11) NOT NULL,
  `circular` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idderiva`,`idtrabajadoring`),
  KEY `fk_deriva_expediente1_idx` (`idexpediente`),
  KEY `fk_deriva_trabajador1_idx` (`idtrabajadordes`),
  KEY `fk_deriva_trabajador2_idx` (`idtrabajadoring`),
  CONSTRAINT `fk_deriva_expediente1` FOREIGN KEY (`idexpediente`) REFERENCES `expediente` (`idexpediente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_deriva_trabajador1` FOREIGN KEY (`idtrabajadordes`) REFERENCES `trabajador` (`idtrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_deriva_trabajador2` FOREIGN KEY (`idtrabajadoring`) REFERENCES `trabajador` (`idtrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;


--
-- Definition of table `deriva_has_proveido`
--

DROP TABLE IF EXISTS `deriva_has_proveido`;
CREATE TABLE `deriva_has_proveido` (
  `idderiva` int(11) NOT NULL,
  `idtrabajadoring` int(11) NOT NULL,
  `idproveido` int(11) NOT NULL,
  PRIMARY KEY (`idderiva`,`idtrabajadoring`,`idproveido`),
  KEY `fk_deriva_has_proveido_proveido1_idx` (`idproveido`),
  KEY `fk_deriva_has_proveido_deriva1_idx` (`idderiva`,`idtrabajadoring`),
  CONSTRAINT `fk_deriva_has_proveido_deriva1` FOREIGN KEY (`idderiva`, `idtrabajadoring`) REFERENCES `deriva` (`idderiva`, `idtrabajadoring`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_deriva_has_proveido_proveido1` FOREIGN KEY (`idproveido`) REFERENCES `proveido` (`idproveido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `devolucion`
--

DROP TABLE IF EXISTS `devolucion`;
CREATE TABLE `devolucion` (
  `iddevolucion` int(11) NOT NULL,
  `numres` varchar(45) DEFAULT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  `motivo` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`iddevolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `devolucion`
--

/*!40000 ALTER TABLE `devolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion` ENABLE KEYS */;


--
-- Definition of table `distrito`
--

DROP TABLE IF EXISTS `distrito`;
CREATE TABLE `distrito` (
  `iddistrito` int(11) NOT NULL AUTO_INCREMENT,
  `distrito` varchar(150) NOT NULL,
  `idlocal` int(11) NOT NULL,
  PRIMARY KEY (`iddistrito`),
  KEY `fk_distrito_provincia1_idx` (`idlocal`),
  CONSTRAINT `fk_distrito_provincia1` FOREIGN KEY (`idlocal`) REFERENCES `provincia` (`idprovincia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1840 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `distrito`
--

/*!40000 ALTER TABLE `distrito` DISABLE KEYS */;
INSERT INTO `distrito` (`iddistrito`,`distrito`,`idlocal`) VALUES 
 (1,'CHACHAPOYAS',1),
 (2,'ASUNCION',1),
 (3,'BALSAS',1),
 (4,'CHETO',1),
 (5,'CHILIQUIN',1),
 (6,'CHUQUIBAMBA',1),
 (7,'GRANADA',1),
 (8,'HUANCAS',1),
 (9,'LA JALCA',1),
 (10,'LEIMEBAMBA',1),
 (11,'LEVANTO',1),
 (12,'MAGDALENA',1),
 (13,'MARISCAL CASTILLA',1),
 (14,'MOLINOPAMPA',1),
 (15,'MONTEVIDEO',1),
 (16,'OLLEROS',1),
 (17,'QUINJALCA',1),
 (18,'SAN FRANCISCO DE DAGUAS',1),
 (19,'SAN ISIDRO DE MAINO',1),
 (20,'SOLOCO',1),
 (21,'SONCHE',1),
 (22,'LA PECA',2),
 (23,'ARAMANGO',2),
 (24,'COPALLIN',2),
 (25,'EL PARCO',2),
 (26,'BAGUA',2),
 (27,'IMAZA',2),
 (28,'JUMBILLA',3),
 (29,'COROSHA',3),
 (30,'CUISPES',3),
 (31,'CHISQUILLA',3),
 (32,'CHURUJA',3),
 (33,'FLORIDA',3),
 (34,'RECTA',3),
 (35,'SAN CARLOS',3),
 (36,'SHIPASBAMBA',3),
 (37,'VALERA',3),
 (38,'YAMBRASBAMBA',3),
 (39,'JAZAN',3),
 (40,'LAMUD',4),
 (41,'CAMPORREDONDO',4),
 (42,'COCABAMBA',4),
 (43,'COLCAMAR',4),
 (44,'CONILA',4),
 (45,'INGUILPATA',4),
 (46,'LONGUITA',4),
 (47,'LONYA CHICO',4),
 (48,'LUYA',4),
 (49,'LUYA VIEJO',4),
 (50,'MARIA',4),
 (51,'OCALLI',4),
 (52,'OCUMAL',4),
 (53,'PISUQUIA',4),
 (54,'SAN CRISTOBAL',4),
 (55,'SAN FRANCISCO DE YESO',4),
 (56,'SAN JERONIMO',4),
 (57,'SAN JUAN DE LOPECANCHA',4),
 (58,'SANTA CATALINA',4),
 (59,'SANTO TOMAS',4),
 (60,'TINGO',4),
 (61,'TRITA',4),
 (62,'PROVIDENCIA',4),
 (63,'SAN NICOLAS',5),
 (64,'COCHAMAL',5),
 (65,'CHIRIMOTO',5),
 (66,'HUAMBO',5),
 (67,'LIMABAMBA',5),
 (68,'LONGAR',5),
 (69,'MILPUCC',5),
 (70,'MARISCAL BENAVIDES',5),
 (71,'OMIA',5),
 (72,'SANTA ROSA',5),
 (73,'TOTORA',5),
 (74,'VISTA ALEGRE',5),
 (75,'NIEVA',6),
 (76,'RIO SANTIAGO',6),
 (77,'EL CENEPA',6),
 (78,'BAGUA GRANDE',7),
 (79,'CAJARURO',7),
 (80,'CUMBA',7),
 (81,'EL MILAGRO',7),
 (82,'JAMALCA',7),
 (83,'LONYA GRANDE',7),
 (84,'YAMON',7),
 (85,'HUARAZ',8),
 (86,'INDEPENDENCIA',8),
 (87,'COCHABAMBA',8),
 (88,'COLCABAMBA',8),
 (89,'HUANCHAY',8),
 (90,'JANGAS',8),
 (91,'LA LIBERTAD',8),
 (92,'OLLEROS',8),
 (93,'PAMPAS GRANDE',8),
 (94,'PARIACOTO',8),
 (95,'PIRA',8),
 (96,'TARICA',8),
 (97,'AIJA',9),
 (98,'CORIS',9),
 (99,'HUACLLAN',9),
 (100,'LA MERCED',9),
 (101,'SUCCHA',9),
 (102,'CHIQUIAN',10),
 (103,'ABELARDO PARDO LEZAMETA',10),
 (104,'AQUIA',10),
 (105,'CAJACAY',10),
 (106,'HUAYLLACAYAN',10),
 (107,'HUASTA',10),
 (108,'MANGAS',10),
 (109,'PACLLON',10),
 (110,'SAN MIGUEL DE CORPANQUI',10),
 (111,'TICLLOS',10),
 (112,'ANTONIO RAIMONDI',10),
 (113,'CANIS',10),
 (114,'COLQUIOC',10),
 (115,'LA PRIMAVERA',10),
 (116,'HUALLANCA',10),
 (117,'CARHUAZ',11),
 (118,'ACOPAMPA',11),
 (119,'AMASHCA',11),
 (120,'ANTA',11),
 (121,'ATAQUERO',11),
 (122,'MARCARA',11),
 (123,'PARIAHUANCA',11),
 (124,'SAN MIGUEL DE ACO',11),
 (125,'SHILLA',11),
 (126,'TINCO',11),
 (127,'YUNGAR',11),
 (128,'CASMA',12),
 (129,'BUENA VISTA ALTA',12),
 (130,'COMANDANTE NOEL',12),
 (131,'YAUTAN',12),
 (132,'CORONGO',13),
 (133,'ACO',13),
 (134,'BAMBAS',13),
 (135,'CUSCA',13),
 (136,'LA PAMPA',13),
 (137,'YANAC',13),
 (138,'YUPAN',13),
 (139,'CARAZ',14),
 (140,'HUALLANCA',14),
 (141,'HUATA',14),
 (142,'HUAYLAS',14),
 (143,'MATO',14),
 (144,'PAMPAROMAS',14),
 (145,'PUEBLO LIBRE',14),
 (146,'SANTA CRUZ',14),
 (147,'YURACMARCA',14),
 (148,'SANTO TORIBIO',14),
 (149,'HUARI',15),
 (150,'CAJAY',15),
 (151,'CHAVIN DE HUANTAR',15),
 (152,'HUACACHI',15),
 (153,'HUACHIS',15),
 (154,'HUACCHIS',15),
 (155,'HUANTAR',15),
 (156,'MASIN',15),
 (157,'PAUCAS',15),
 (158,'PONTO',15),
 (159,'RAHUAPAMPA',15),
 (160,'RAPAYAN',15),
 (161,'SAN MARCOS',15),
 (162,'SAN PEDRO DE CHANA',15),
 (163,'UCO',15),
 (164,'ANRA',15),
 (165,'PISCOBAMBA',16),
 (166,'CASCA',16),
 (167,'LUCMA',16),
 (168,'FIDEL OLIVAS ESCUDERO',16),
 (169,'LLAMA',16),
 (170,'LLUMPA',16),
 (171,'MUSGA',16),
 (172,'ELEAZAR GUZMAN BARRON',16),
 (173,'CABANA',17),
 (174,'BOLOGNESI',17),
 (175,'CONCHUCOS',17),
 (176,'HUACASCHUQUE',17),
 (177,'HUANDOVAL',17),
 (178,'LACABAMBA',17),
 (179,'LLAPO',17),
 (180,'PALLASCA',17),
 (181,'PAMPAS',17),
 (182,'SANTA ROSA',17),
 (183,'TAUCA',17),
 (184,'POMABAMBA',18),
 (185,'HUAYLLAN',18),
 (186,'PAROBAMBA',18),
 (187,'QUINUABAMBA',18),
 (188,'RECUAY',19),
 (189,'COTAPARACO',19),
 (190,'HUAYLLAPAMPA',19),
 (191,'MARCA',19),
 (192,'PAMPAS CHICO',19),
 (193,'PARARIN',19),
 (194,'TAPACOCHA',19),
 (195,'TICAPAMPA',19),
 (196,'LLACLLIN',19),
 (197,'CATAC',19),
 (198,'CHIMBOTE',20),
 (199,'CACERES DEL PERU',20),
 (200,'MACATE',20),
 (201,'MORO',20),
 (202,'NEPEÑA',20),
 (203,'SAMANCO',20),
 (204,'SANTA',20),
 (205,'COISHCO',20),
 (206,'NUEVO CHIMBOTE',20),
 (207,'SIHUAS',21),
 (208,'ALFONSO UGARTE',21),
 (209,'CHINGALPO',21),
 (210,'HUAYLLABAMBA',21),
 (211,'QUICHES',21),
 (212,'SICSIBAMBA',21),
 (213,'ACOBAMBA',21),
 (214,'CASHAPAMPA',21),
 (215,'RAGASH',21),
 (216,'SAN JUAN',21),
 (217,'YUNGAY',22),
 (218,'CASCAPARA',22),
 (219,'MANCOS',22),
 (220,'MATACOTO',22),
 (221,'QUILLO',22),
 (222,'RANRAHIRCA',22),
 (223,'SHUPLUY',22),
 (224,'YANAMA',22),
 (225,'LLAMELLIN',23),
 (226,'ACZO',23),
 (227,'CHACCHO',23),
 (228,'CHINGAS',23),
 (229,'MIRGAS',23),
 (230,'SAN JUAN DE RONTOY',23),
 (231,'SAN LUIS',24),
 (232,'YAUYA',24),
 (233,'SAN NICOLAS',24),
 (234,'CHACAS',25),
 (235,'ACOCHACA',25),
 (236,'HUARMEY',26),
 (237,'COCHAPETI',26),
 (238,'HUAYAN',26),
 (239,'MALVAS',26),
 (240,'CULEBRAS',26),
 (241,'ACAS',27),
 (242,'CAJAMARQUILLA',27),
 (243,'CARHUAPAMPA',27),
 (244,'COCHAS',27),
 (245,'CONGAS',27),
 (246,'LLIPA',27),
 (247,'OCROS',27),
 (248,'SAN CRISTOBAL DE RAJAN',27),
 (249,'SAN PEDRO',27),
 (250,'SANTIAGO DE CHILCAS',27),
 (251,'ABANCAY',28),
 (252,'CIRCA',28),
 (253,'CURAHUASI',28),
 (254,'CHACOCHE',28),
 (255,'HUANIPACA',28),
 (256,'LAMBRAMA',28),
 (257,'PICHIRHUA',28),
 (258,'SAN PEDRO DE CACHORA',28),
 (259,'TAMBURCO',28),
 (260,'CHALHUANCA',29),
 (261,'CAPAYA',29),
 (262,'CARAYBAMBA',29),
 (263,'COLCABAMBA',29),
 (264,'COTARUSE',29),
 (265,'CHAPIMARCA',29),
 (266,'HUAYLLO',29),
 (267,'LUCRE',29),
 (268,'POCOHUANCA',29),
 (269,'SAÑAYCA',29),
 (270,'SORAYA',29),
 (271,'TAPAIRIHUA',29),
 (272,'TINTAY',29),
 (273,'TORAYA',29),
 (274,'YANACA',29),
 (275,'SAN JUAN DE CHACÑA',29),
 (276,'JUSTO APU SAHUARAURA',29),
 (277,'ANDAHUAYLAS',30),
 (278,'ANDARAPA',30),
 (279,'CHIARA',30),
 (280,'HUANCARAMA',30),
 (281,'HUANCARAY',30),
 (282,'KISHUARA',30),
 (283,'PACOBAMBA',30),
 (284,'PAMPACHIRI',30),
 (285,'SAN ANTONIO DE CACHI',30),
 (286,'SAN JERONIMO',30),
 (287,'TALAVERA',30),
 (288,'TURPO',30),
 (289,'PACUCHA',30),
 (290,'POMACOCHA',30),
 (291,'SANTA MARIA DE CHICMO',30),
 (292,'TUMAY HUARACA',30),
 (293,'HUAYANA',30),
 (294,'SAN MIGUEL DE CHACCRAMPA',30),
 (295,'KAQUIABAMBA',30),
 (296,'ANTABAMBA',31),
 (297,'EL ORO',31),
 (298,'HUAQUIRCA',31),
 (299,'JUAN ESPINOZA MEDRANO',31),
 (300,'OROPESA',31),
 (301,'PACHACONAS',31),
 (302,'SABAINO',31),
 (303,'TAMBOBAMBA',32),
 (304,'COYLLURQUI',32),
 (305,'COTABAMBAS',32),
 (306,'HAQUIRA',32),
 (307,'MARA',32),
 (308,'CHALLHUAHUACHO',32),
 (309,'CHUQUIBAMBILLA',33),
 (310,'CURPAHUASI',33),
 (311,'HUAILLATI',33),
 (312,'MAMARA',33),
 (313,'MARISCAL GAMARRA',33),
 (314,'MICAELA BASTIDAS',33),
 (315,'PROGRESO',33),
 (316,'PATAYPAMPA',33),
 (317,'SAN ANTONIO',33),
 (318,'TURPAY',33),
 (319,'VILCABAMBA',33),
 (320,'VIRUNDO',33),
 (321,'SANTA ROSA',33),
 (322,'CURASCO',33),
 (323,'CHINCHEROS',34),
 (324,'ONGOY',34),
 (325,'OCOBAMBA',34),
 (326,'COCHARCAS',34),
 (327,'ANCO HUALLO',34),
 (328,'HUACCANA',34),
 (329,'URANMARCA',34),
 (330,'RANRACANCHA',34),
 (331,'AREQUIPA',35),
 (332,'CAYMA',35),
 (333,'CERRO COLORADO',35),
 (334,'CHARACATO',35),
 (335,'CHIGUATA',35),
 (336,'LA JOYA',35),
 (337,'MIRAFLORES',35),
 (338,'MOLLEBAYA',35),
 (339,'PAUCARPATA',35),
 (340,'POCSI',35),
 (341,'POLOBAYA',35),
 (342,'QUEQUEÑA',35),
 (343,'SABANDIA',35),
 (344,'SACHACA',35),
 (345,'SAN JUAN DE SIGUAS',35),
 (346,'SAN JUAN DE TARUCANI',35),
 (347,'SANTA ISABEL DE SIGUAS',35),
 (348,'SANTA RITA DE SIHUAS',35),
 (349,'SOCABAYA',35),
 (350,'TIABAYA',35),
 (351,'UCHUMAYO',35),
 (352,'VITOR',35),
 (353,'YANAHUARA',35),
 (354,'YARABAMBA',35),
 (355,'YURA',35),
 (356,'MARIANO MELGAR',35),
 (357,'JACOBO HUNTER',35),
 (358,'ALTO SELVA ALEGRE',35),
 (359,'JOSE LUIS BUSTAMANTE Y RIVERO',35),
 (360,'CHIVAY',36),
 (361,'ACHOMA',36),
 (362,'CABANACONDE',36),
 (363,'CAYLLOMA',36),
 (364,'CALLALLI',36),
 (365,'COPORAQUE',36),
 (366,'HUAMBO',36),
 (367,'HUANCA',36),
 (368,'ICHUPAMPA',36),
 (369,'LARI',36),
 (370,'LLUTA',36),
 (371,'MACA',36),
 (372,'MADRIGAL',36),
 (373,'SAN ANTONIO DE CHUCA',36),
 (374,'SIBAYO',36),
 (375,'TAPAY',36),
 (376,'TISCO',36),
 (377,'TUTI',36),
 (378,'YANQUE',36),
 (379,'MAJES',36),
 (380,'CAMANA',37),
 (381,'JOSE MARIA QUIMPER',37),
 (382,'MARIANO NICOLAS VALCARCEL',37),
 (383,'MARISCAL CACERES',37),
 (384,'NICOLAS DE PIEROLA',37),
 (385,'OCOÑA',37),
 (386,'QUILCA',37),
 (387,'SAMUEL PASTOR',37),
 (388,'CARAVELI',38),
 (389,'ACARI',38),
 (390,'ATICO',38),
 (391,'ATIQUIPA',38),
 (392,'BELLA UNION',38),
 (393,'CAHUACHO',38),
 (394,'CHALA',38),
 (395,'CHAPARRA',38),
 (396,'HUANUHUANU',38),
 (397,'JAQUI',38),
 (398,'LOMAS',38),
 (399,'QUICACHA',38),
 (400,'YAUCA',38),
 (401,'APLAO',39),
 (402,'ANDAGUA',39),
 (403,'AYO',39),
 (404,'CHACHAS',39),
 (405,'CHILCAYMARCA',39),
 (406,'CHOCO',39),
 (407,'HUANCARQUI',39),
 (408,'MACHAGUAY',39),
 (409,'ORCOPAMPA',39),
 (410,'PAMPACOLCA',39),
 (411,'TIPAN',39),
 (412,'URACA',39),
 (413,'UÑON',39),
 (414,'VIRACO',39),
 (415,'CHUQUIBAMBA',41),
 (416,'ANDARAY',40),
 (417,'CAYARANI',40),
 (418,'CHICHAS',40),
 (419,'IRAY',40),
 (420,'SALAMANCA',40),
 (421,'YANAQUIHUA',40),
 (422,'RIO GRANDE',40),
 (423,'MOLLENDO',41),
 (424,'COCACHACRA',41),
 (425,'DEAN VALDIVIA',41),
 (426,'ISLAY',41),
 (427,'MEJIA',41),
 (428,'PUNTA DE BOMBON',41),
 (429,'COTAHUASI',42),
 (430,'ALCA',42),
 (431,'CHARCANA',42),
 (432,'HUAYNACOTAS',42),
 (433,'PAMPAMARCA',42),
 (434,'PUYCA',42),
 (435,'QUECHUALLA',42),
 (436,'SAYLA',42),
 (437,'TAURIA',42),
 (438,'TOMEPAMPA',42),
 (439,'TORO',42),
 (440,'AYACUCHO',43),
 (441,'ACOS VINCHOS',43),
 (442,'CARMEN ALTO',43),
 (443,'CHIARA',43),
 (444,'QUINUA',43),
 (445,'SAN JOSE DE TICLLAS',43),
 (446,'SAN JUAN BAUTISTA',43),
 (447,'SANTIAGO DE PISCHA',43),
 (448,'VINCHOS',43),
 (449,'TAMBILLO',43),
 (450,'ACOCRO',43),
 (451,'SOCOS',43),
 (452,'OCROS',43),
 (453,'PACAYCASA',43),
 (454,'JESUS NAZARENO',43),
 (455,'CANGALLO',44),
 (456,'CHUSCHI',44),
 (457,'LOS MOROCHUCOS',44),
 (458,'PARAS',44),
 (459,'TOTOS',44),
 (460,'MARIA PARADO DE BELLIDO',44),
 (461,'HUANTA',45),
 (462,'AYAHUANCO',45),
 (463,'HUAMANGUILLA',45),
 (464,'IGUAIN',45),
 (465,'LURICOCHA',45),
 (466,'SANTILLANA',45),
 (467,'SIVIA',45),
 (468,'LLOCHEGUA',45),
 (469,'SAN MIGUEL',46),
 (470,'ANCO',46),
 (471,'AYNA',46),
 (472,'CHILCAS',46),
 (473,'CHUNGUI',46),
 (474,'TAMBO',46),
 (475,'LUIS CARRANZA',46),
 (476,'SANTA ROSA',46),
 (477,'SAMUGARI',46),
 (478,'PUQUIO',47),
 (479,'AUCARA',47),
 (480,'CABANA',47),
 (481,'CARMEN SALCEDO',47),
 (482,'CHAVIÑA',47),
 (483,'CHIPAO',47),
 (484,'HUAC-HUAS',47),
 (485,'LARAMATE',47),
 (486,'LEONCIO PRADO',47),
 (487,'LUCANAS',47),
 (488,'LLAUTA',47),
 (489,'OCAÑA',47),
 (490,'OTOCA',47),
 (491,'SANCOS',47),
 (492,'SAN JUAN',47),
 (493,'SAN PEDRO',47),
 (494,'SANTA ANA DE HUAYCAHUACHO',47),
 (495,'SANTA LUCIA',47),
 (496,'SAISA',47),
 (497,'SAN PEDRO DE PALCO',47),
 (498,'SAN CRISTOBAL',47),
 (499,'CORACORA',48),
 (500,'CORONEL CASTAÑEDA',48),
 (501,'CHUMPI',48),
 (502,'PACAPAUSA',48),
 (503,'PULLO',48),
 (504,'PUYUSCA',48),
 (505,'SAN FRANCISCO DE RAVACAYCO',48),
 (506,'UPAHUACHO',48),
 (507,'HUANCAPI',49),
 (508,'ALCAMENCA',49),
 (509,'APONGO',49),
 (510,'CANARIA',49),
 (511,'CAYARA',49),
 (512,'COLCA',49),
 (513,'HUALLA',49),
 (514,'HUAMANQUIQUIA',49),
 (515,'HUANCARAYLLA',49),
 (516,'SARHUA',49),
 (517,'VILCANCHOS',49),
 (518,'ASQUIPATA',49),
 (519,'SANCOS',50),
 (520,'SACSAMARCA',50),
 (521,'SANTIAGO DE LUCANAMARCA',50),
 (522,'CARAPO',50),
 (523,'VILCAS HUAMAN',51),
 (524,'VISCHONGO',51),
 (525,'ACCOMARCA',51),
 (526,'CARHUANCA',51),
 (527,'CONCEPCION',51),
 (528,'HUAMBALPA',51),
 (529,'SAURAMA',51),
 (530,'INDEPENDENCIA',51),
 (531,'PAUSA',52),
 (532,'COLTA',52),
 (533,'CORCULLA',52),
 (534,'LAMPA',52),
 (535,'MARCABAMBA',52),
 (536,'OYOLO',52),
 (537,'PARARCA',52),
 (538,'SAN JAVIER DE ALPABAMBA',52),
 (539,'SAN JOSE DE USHUA',52),
 (540,'SARA SARA',52),
 (541,'QUEROBAMBA',53),
 (542,'BELEN',53),
 (543,'CHALCOS',53),
 (544,'SAN SALVADOR DE QUIJE',53),
 (545,'PAICO',53),
 (546,'SANTIAGO DE PAUCARAY',53),
 (547,'SAN PEDRO DE LARCAY',53),
 (548,'SORAS',53),
 (549,'HUACAÑA',53),
 (550,'CHILCAYOC',54),
 (551,'MORCOLLA',54),
 (552,'CAJAMARCA',54),
 (553,'ASUNCION',54),
 (554,'COSPAN',54),
 (555,'CHETILLA',54),
 (556,'ENCAÑADA',54),
 (557,'JESUS',54),
 (558,'LOS BAÑOS DEL INCA',54),
 (559,'LLACANORA',54),
 (560,'MAGDALENA',54),
 (561,'MATARA',54),
 (562,'NAMORA',54),
 (563,'SAN JUAN',54),
 (564,'CAJABAMBA',55),
 (565,'CACHACHI',55),
 (566,'CONDEBAMBA',55),
 (567,'SITACOCHA',55),
 (568,'CELENDIN',56),
 (569,'CORTEGANA',56),
 (570,'CHUMUCH',56),
 (571,'HUASMIN',56),
 (572,'JORGE CHAVEZ',56),
 (573,'JOSE GALVEZ',56),
 (574,'MIGUEL IGLESIAS',56),
 (575,'OXAMARCA',56),
 (576,'SOROCHUCO',56),
 (577,'SUCRE',56),
 (578,'UTCO',56),
 (579,'LA LIBERTAD DE PALLAN',56),
 (580,'CONTUMAZA',57),
 (581,'CHILETE',57),
 (582,'GUZMANGO',57),
 (583,'SAN BENITO',57),
 (584,'CUPISNIQUE',57),
 (585,'TANTARICA',57),
 (586,'YONAN',57),
 (587,'SANTA CRUZ DE TOLED',57),
 (588,'CUTERVO',58),
 (589,'CALLAYUC',58),
 (590,'CUJILLO',58),
 (591,'CHOROS',58),
 (592,'LA RAMADA',58),
 (593,'PIMPINGOS',58),
 (594,'QUEROCOTILLO',58),
 (595,'SAN ANDRES DE CUTERVO',58),
 (596,'SAN JUAN DE CUTERVO',58),
 (597,'SAN LUIS DE LUCMA',58),
 (598,'SANTA CRUZ',58),
 (599,'SANTO DOMINGO DE LA CAPILLA',58),
 (600,'SANTO TOMAS',58),
 (601,'SOCOTA',58),
 (602,'TORIBIO CASANOVA',58),
 (603,'CHOTA',59),
 (604,'ANGUIA',59),
 (605,'COCHABAMBA',59),
 (606,'CONCHAN',59),
 (607,'CHADIN',59),
 (608,'CHIGUIRIP',59),
 (609,'CHIMBAN',59),
 (610,'HUAMBOS',59),
 (611,'LAJAS',59),
 (612,'LLAMA',59),
 (613,'MIRACOSTA',59),
 (614,'PACCHA',59),
 (615,'PION',59),
 (616,'QUEROCOTO',59),
 (617,'TACABAMBA',59),
 (618,'TOCMOCHE',59),
 (619,'SAN JUAN DE LICUPIS',59),
 (620,'CHOROPAMPA',59),
 (621,'CHALAMARCA',59),
 (622,'BAMBAMARCA',60),
 (623,'CHUGUR',60),
 (624,'HUALGAYOC',60),
 (625,'JAEN',61),
 (626,'BELLAVISTA',61),
 (627,'COLASAY',61),
 (628,'CHONTALI',61),
 (629,'POMAHUACA',61),
 (630,'PUCARA',61),
 (631,'SALLIQUE',61),
 (632,'SAN FELIPE',61),
 (633,'SAN JOSE DEL ALTO',61),
 (634,'SANTA ROSA',61),
 (635,'LAS PIRIAS',61),
 (636,'HUABAL',61),
 (637,'SANTA CRUZ',62),
 (638,'CATACHE',62),
 (639,'CHANCAYBAÑOS',62),
 (640,'LA ESPERANZA',62),
 (641,'NINABAMBA',62),
 (642,'PULAN',62),
 (643,'SEXI',62),
 (644,'UTICYACU',62),
 (645,'YAUYUCAN',62),
 (646,'ANDABAMBA',62),
 (647,'SAUCEPAMPA',62),
 (648,'SAN MIGUEL',63),
 (649,'CALQUIS',63),
 (650,'LA FLORIDA',63),
 (651,'LLAPA',63),
 (652,'NANCHOC',63),
 (653,'NIEPOS',63),
 (654,'SAN GREGORIO',63),
 (655,'SAN SILVESTRE DE COCHAN',63),
 (656,'EL PRADO',63),
 (657,'UNION AGUA BLANCA',63),
 (658,'TONGOD',63),
 (659,'CATILLUC',63),
 (660,'BOLIVAR',63),
 (661,'SAN IGNACIO',64),
 (662,'CHIRINOS',64),
 (663,'HUARANGO',64),
 (664,'NAMBALLE',64),
 (665,'LA COIPA',64),
 (666,'SAN JOSE DE LOURDES',64),
 (667,'TABACONAS',64),
 (668,'PEDRO GALVEZ',65),
 (669,'ICHOCAN',65),
 (670,'GREGORIO PITA',65),
 (671,'JOSE MANUEL QUIROZ',65),
 (672,'EDUARDO VILLANUEVA',65),
 (673,'JOSE SABOGAL',65),
 (674,'CHANCAY',65),
 (675,'SAN PABLO',66),
 (676,'SAN BERNARDINO',66),
 (677,'SAN LUIS',66),
 (678,'TUMBADEN',66),
 (679,'CUSCO',68),
 (680,'CCORCA',68),
 (681,'POROY',68),
 (682,'SAN JERONIMO',68),
 (683,'SAN SEBASTIAN',68),
 (684,'SANTIAGO',68),
 (685,'SAYLLA',68),
 (686,'WANCHAQ',68),
 (687,'ACOMAYO',69),
 (688,'ACOPIA',69),
 (689,'ACOS',69),
 (690,'POMACANCHI',69),
 (691,'RONDOCAN',69),
 (692,'SANGARARA',69),
 (693,'MOSOC LLACTA',69),
 (694,'ANTA',70),
 (695,'CHINCHAYPUJIO',70),
 (696,'HUAROCONDO',70),
 (697,'LIMATAMBO',70),
 (698,'MOLLEPATA',70),
 (699,'PUCYURA',70),
 (700,'ZURITE',70),
 (701,'CACHIMAYO',70),
 (702,'ANCAHUASI',70),
 (703,'CALCA',71),
 (704,'COYA',71),
 (705,'LAMAY',71),
 (706,'LARES',71),
 (707,'PISAC',71),
 (708,'SAN SALVADOR',71),
 (709,'TARAY',71),
 (710,'YANATILE',71),
 (711,'YANAOCA',72),
 (712,'CHECCA',72),
 (713,'KUNTURKANKI',72),
 (714,'LANGUI',72),
 (715,'LAYO',72),
 (716,'PAMPAMARCA',72),
 (717,'QUEHUE',72),
 (718,'TUPAC AMARU',72),
 (719,'SICUANI',73),
 (720,'COMBAPATA',73),
 (721,'CHECACUPE',73),
 (722,'MARANGANI',73),
 (723,'PITUMARCA',73),
 (724,'SAN PABLO',73),
 (725,'SAN PEDRO',73),
 (726,'TINTA',73),
 (727,'SANTO TOMAS',74),
 (728,'CAPACMARCA',74),
 (729,'COLQUEMARCA',74),
 (730,'CHAMACA',74),
 (731,'LIVITACA',74),
 (732,'LLUSCO',74),
 (733,'QUIÑOTA',74),
 (734,'VELILLE',74),
 (735,'ESPINAR',75),
 (736,'CONDOROMA',75),
 (737,'COPORAQUE',75),
 (738,'OCORURO',75),
 (739,'PALLPATA',75),
 (740,'PICHIGUA',75),
 (741,'SUYCKUTAMBO',75),
 (742,'ALTO PICHIGUA',75),
 (743,'SANTA ANA',76),
 (744,'ECHARATE',76),
 (745,'HUAYOPATA',76),
 (746,'MARANURA',76),
 (747,'OCOBAMBA',76),
 (748,'SANTA TERESA',76),
 (749,'VILCABAMBA',76),
 (750,'QUELLOUNO',76),
 (751,'KIMBIRI',76),
 (752,'PICHARI',76),
 (753,'PARURO',77),
 (754,'ACCHA',77),
 (755,'CCAPI',77),
 (756,'COLCHA',77),
 (757,'HUANOQUITE',77),
 (758,'OMACHA',77),
 (759,'YAURISQUE',77),
 (760,'PACCARITAMBO',77),
 (761,'PILLPINTO',77),
 (762,'PAUCARTAMBO',78),
 (763,'CAICAY',78),
 (764,'COLQUEPATA',78),
 (765,'CHALLABAMBA',78),
 (766,'KOSÑIPATA',78),
 (767,'HUANCARANI',78),
 (768,'URCOS',79),
 (769,'ANDAHUAYLILLAS',79),
 (770,'CAMANTI',79),
 (771,'CCARHUAYO',79),
 (772,'CCATCA',79),
 (773,'CUSIPATA',79),
 (774,'HUARO',79),
 (775,'LUCRE',79),
 (776,'MARCAPATA',79),
 (777,'OCONGATE',79),
 (778,'OROPESA',79),
 (779,'QUIQUIJANA',79),
 (780,'URUBAMBA',80),
 (781,'CHINCHERO',80),
 (782,'HUAYLLABAMBA',80),
 (783,'MACHUPICCHU',80),
 (784,'MARAS',80),
 (785,'OLLANTAYTAMBO',80),
 (786,'YUCAY',80),
 (787,'CALLAO',67),
 (788,'BELLAVISTA',67),
 (789,'LA PUNTA',67),
 (790,'CARMEN DE LA LEGUA-REYNOSO',67),
 (791,'LA PERLA',67),
 (792,'VENTANILLA',67),
 (793,'HUANCAVELICA',81),
 (794,'ACOBAMBILLA',81),
 (795,'ACORIA',81),
 (796,'CONAYCA',81),
 (797,'CUENCA',81),
 (798,'HUACHOCOLPA',81),
 (799,'HUAYLLAHUARA',81),
 (800,'IZCUCHACA',81),
 (801,'LARIA',81),
 (802,'MANTA',81),
 (803,'MARISCAL CACERES',81),
 (804,'MOYA',81),
 (805,'NUEVO OCCORO',81),
 (806,'PALCA',81),
 (807,'PILCHACA',81),
 (808,'VILCA',81),
 (809,'YAULI',81),
 (810,'ASCENSION',81),
 (811,'HUANDO',81),
 (812,'ACOBAMBA',82),
 (813,'ANTA',82),
 (814,'ANDABAMBA',82),
 (815,'CAJA',82),
 (816,'MARCAS',82),
 (817,'PAUCARA',82),
 (818,'POMACOCHA',82),
 (819,'ROSARIO',82),
 (820,'LIRCAY',83),
 (821,'ANCHONGA',83),
 (822,'CALLANMARCA',83),
 (823,'CONGALLA',83),
 (824,'CHINCHO',83),
 (825,'HUALLAY-GRANDE',83),
 (826,'HUANCA-HUANCA',83),
 (827,'JULCAMARCA',83),
 (828,'SAN ANTONIO DE ANTAPARCO',83),
 (829,'SANTO TOMAS DE PATA',83),
 (830,'SECCLLA',83),
 (831,'CCOCHACCASA',83),
 (832,'CASTROVIRREYNA',84),
 (833,'ARMA',84),
 (834,'AURAHUA',84),
 (835,'CAPILLAS',84),
 (836,'COCAS',84),
 (837,'CHUPAMARCA',84),
 (838,'HUACHOS',84),
 (839,'HUAMATAMBO',84),
 (840,'MOLLEPAMPA',84),
 (841,'SAN JUAN',84),
 (842,'TANTARA',84),
 (843,'TICRAPO',84),
 (844,'SANTA ANA',84),
 (845,'PAMPAS',85),
 (846,'ACOSTAMBO',85),
 (847,'ACRAQUIA',85),
 (848,'AHUAYCHA',85),
 (849,'COLCABAMBA',85),
 (850,'DANIEL HERNANDEZ',85),
 (851,'HUACHOCOLPA',85),
 (852,'HUARIBAMBA',85),
 (853,'ÑAHUIMPUQUIO',85),
 (854,'PAZOS',85),
 (855,'QUISHUAR',85),
 (856,'SALCABAMBA',85),
 (857,'SAN MARCOS DE ROCCHAC',85),
 (858,'SURCUBAMBA',85),
 (859,'TINTAY PUNCU',85),
 (860,'SALCAHUASI',85),
 (861,'AYAVI',86),
 (862,'CORDOVA',86),
 (863,'HUAYACUNDO ARMA',86),
 (864,'HUAYTARA',86),
 (865,'LARAMARCA',86),
 (866,'OCOYO',86),
 (867,'PILPICHACA',86),
 (868,'QUERCO',86),
 (869,'QUITO ARMA',86),
 (870,'SAN ANTONIO DE CUSICANCHA',86),
 (871,'SAN FRANCISCO DE SANGAYAICO',86),
 (872,'SAN ISIDRO',86),
 (873,'SANTIAGO DE CHOCORVOS',86),
 (874,'SANTIAGO DE QUIRAHUARA',86),
 (875,'SANTO DOMINGO DE CAPILLAS',86),
 (876,'TAMBO',86),
 (877,'CHURCAMPA',87),
 (878,'ANCO',87),
 (879,'CHINCHIHUASI',87),
 (880,'EL CARMEN',87),
 (881,'LA MERCED',87),
 (882,'LOCROJA',87),
 (883,'PAUCARBAMBA',87),
 (884,'SAN MIGUEL DE MAYOCC',87),
 (885,'SAN PEDRO DE CORIS',87),
 (886,'PACHAMARCA',87),
 (887,'COSME',87),
 (888,'HUANUCO',88),
 (889,'CHINCHAO',88),
 (890,'CHURUBAMBA',88),
 (891,'MARGOS',88),
 (892,'QUISQUI',88),
 (893,'SAN FRANCISCO DE CAYRAN',88),
 (894,'SAN PEDRO DE CHAULAN',88),
 (895,'SANTA MARIA DEL VALLE',88),
 (896,'YARUMAYO',88),
 (897,'AMARILIS',88),
 (898,'PILLCO MARCA',88),
 (899,'YACUS',88),
 (900,'AMBO',89),
 (901,'CAYNA',89),
 (902,'COLPAS',89),
 (903,'CONCHAMARCA',89),
 (904,'HUACAR',89),
 (905,'SAN FRANCISCO',89),
 (906,'SAN RAFAEL',89),
 (907,'TOMAY-KICHWA',89),
 (908,'LA UNION',90),
 (909,'CHUQUIS',90),
 (910,'MARIAS',90),
 (911,'PACHAS',90),
 (912,'QUIVILLA',90),
 (913,'RIPAN',90),
 (914,'SHUNQUI',90),
 (915,'SILLAPATA',90),
 (916,'YANAS',90),
 (917,'LLATA',91),
 (918,'ARANCAY',91),
 (919,'CHAVIN DE PARIARCA',91),
 (920,'JACAS GRANDE',91),
 (921,'JIRCAN',91),
 (922,'MIRAFLORES',91),
 (923,'MONZON',91),
 (924,'PUNCHAO',91),
 (925,'PUÑOS',91),
 (926,'SINGA',91),
 (927,'TANTAMAYO',91),
 (928,'HUACRACHUCO',92),
 (929,'CHOLON',92),
 (930,'SAN BUENAVENTURA',92),
 (931,'RUPA-RUPA',93),
 (932,'DANIEL ALOMIA ROBLES',93),
 (933,'HERMILIO VALDIZAN',93),
 (934,'LUYANDO',93),
 (935,'MARIANO DAMASO BERAUN',93),
 (936,'JOSE CRESPO Y CASTILLO',93),
 (937,'PANAO',94),
 (938,'CHAGLLA',94),
 (939,'MOLINO',94),
 (940,'UMARI',94),
 (941,'HONORIA',95),
 (942,'PUERTO INCA',95),
 (943,'CODO DEL POZUZO',95),
 (944,'TOURNAVISTA',95),
 (945,'YUYAPICHIS',95),
 (946,'HUACAYBAMBA',96),
 (947,'PINRA',96),
 (948,'CANCHABAMBA',96),
 (949,'COCHABAMBA',96),
 (950,'JESUS',97),
 (951,'BAÑOS',97),
 (952,'SAN FRANCISCO DE ASIS',97),
 (953,'QUEROPALCA',97),
 (954,'SAN MIGUEL DE CAURI',97),
 (955,'RONDOS',97),
 (956,'JIVIA',97),
 (957,'CHAVINILLO',98),
 (958,'APARICIO POMARES',98),
 (959,'CAHUAC',98),
 (960,'CHACABAMBA',98),
 (961,'JACAS CHICO',98),
 (962,'OBAS',98),
 (963,'PAMPAMARCA',98),
 (964,'CHORAS',98),
 (965,'ICA',99),
 (966,'LA TINGUIÑA',99),
 (967,'LOS AQUIJES',99),
 (968,'PARCONA',99),
 (969,'PUEBLO NUEVO',99),
 (970,'SALAS',99),
 (971,'SAN JOSE DE LOS MOLINOS',99),
 (972,'SAN JUAN BAUTISTA',99),
 (973,'SANTIAGO',99),
 (974,'SUBTANJALLA',99),
 (975,'YAUCA DEL ROSARIO',99),
 (976,'TATE',99),
 (977,'PACHACUTEC',99),
 (978,'OCUCAJE',99),
 (979,'CHINCHA ALTA',100),
 (980,'CHAVIN',100),
 (981,'CHINCHA BAJA',100),
 (982,'EL CARMEN',100),
 (983,'GROCIO PRADO',100),
 (984,'SAN PEDRO DE HUACARPANA',100),
 (985,'SUNAMPE',100),
 (986,'TAMBO DE MORA',100),
 (987,'ALTO LARAN',100),
 (988,'PUEBLO NUEVO',100),
 (989,'SAN JUAN DE YANAC',100),
 (990,'NAZCA',101),
 (991,'CHANGUILLO',101),
 (992,'EL INGENIO',101),
 (993,'MARCONA',101),
 (994,'VISTA ALEGRE',101),
 (995,'PISCO',102),
 (996,'HUANCANO',102),
 (997,'HUMAY',102),
 (998,'INDEPENDENCIA',102),
 (999,'PARACAS',102),
 (1000,'SAN ANDRES',102),
 (1001,'SAN CLEMENTE',102),
 (1002,'TUPAC AMARU INCA',102),
 (1003,'PALPA',103),
 (1004,'LLIPATA',103),
 (1005,'RIO GRANDE',103),
 (1006,'SANTA CRUZ',103),
 (1007,'TIBILLO',103),
 (1008,'HUANCAYO',104),
 (1009,'CARHUACALLANGA',104),
 (1010,'COLCA',104),
 (1011,'CULLHUAS',104),
 (1012,'CHACAPAMPA',104),
 (1013,'CHICCHE',104),
 (1014,'CHILCA',104),
 (1015,'CHONGOS ALTO',104),
 (1016,'CHUPURO',104),
 (1017,'EL TAMBO',104),
 (1018,'HUACRAPUQUIO',104),
 (1019,'HUALHUAS',104),
 (1020,'HUANCAN',104),
 (1021,'HUASICANCHA',104),
 (1022,'HUAYUCACHI',104),
 (1023,'INGENIO',104),
 (1024,'PARIAHUANCA',104),
 (1025,'PILCOMAYO',104),
 (1026,'PUCARA',104),
 (1027,'QUICHUAY',104),
 (1028,'QUILCAS',104),
 (1029,'SAN AGUSTIN',104),
 (1030,'SAN JERONIMO DE TUNAN',104),
 (1031,'SANTO DOMINGO DE ACOBAMBA',104),
 (1032,'SAÑO',104),
 (1033,'SAPALLANGA',104),
 (1034,'SICAYA',104),
 (1035,'VIQUES',104),
 (1036,'CONCEPCION',105),
 (1037,'ACO',105),
 (1038,'ANDAMARCA',105),
 (1039,'COMAS',105),
 (1040,'COCHAS',105),
 (1041,'CHAMBARA',105),
 (1042,'HEROINAS TOLEDO',105),
 (1043,'MANZANARES',105),
 (1044,'MARISCAL CASTILLA',105),
 (1045,'MATAHUASI',105),
 (1046,'MITO',105),
 (1047,'NUEVE DE JULIO',105),
 (1048,'ORCOTUNA',105),
 (1049,'SANTA ROSA DE OCOPA',105),
 (1050,'SAN JOSE DE QUERO',105),
 (1051,'JAUJA',106),
 (1052,'ACOLLA',106),
 (1053,'APATA',106),
 (1054,'ATAURA',106),
 (1055,'CANCHAYLLO',106),
 (1056,'EL MANTARO',106),
 (1057,'HUAMALI',106),
 (1058,'HUARIPAMPA',106),
 (1059,'HUERTAS',106),
 (1060,'JANJAILLO',106),
 (1061,'JULCAN',106),
 (1062,'LEONOR ORDOÑEZ',106),
 (1063,'LLOCLLAPAMPA',106),
 (1064,'MARCO',106),
 (1065,'MASMA',106),
 (1066,'MOLINOS',106),
 (1067,'MONOBAMBA',106),
 (1068,'MUQUI',106),
 (1069,'MUQUIYAUYO',106),
 (1070,'PACA',106),
 (1071,'PACCHA',106),
 (1072,'PANCAN',106),
 (1073,'PARCO',106),
 (1074,'POMACANCHA',106),
 (1075,'RICRAN',106),
 (1076,'SAN LORENZO',106),
 (1077,'SAN PEDRO DE CHUNAN',106),
 (1078,'SINCOS',106),
 (1079,'TUNAN MARCA',106),
 (1080,'YAULI',106),
 (1081,'CURICACA',106),
 (1082,'MASMA CHICCHE',106),
 (1083,'SAUSA',106),
 (1084,'YAUYOS',106),
 (1085,'JUNIN',107),
 (1086,'CARHUAMAYO',107),
 (1087,'ONDORES',107),
 (1088,'ULCUMAYO',107),
 (1089,'TARMA',108),
 (1090,'ACOBAMBA',108),
 (1091,'HUARICOLCA',108),
 (1092,'HUASAHUASI',108),
 (1093,'LA UNION',108),
 (1094,'PALCA',108),
 (1095,'PALCAMAYO',108),
 (1096,'SAN PEDRO DE CAJAS',108),
 (1097,'TAPO',108),
 (1098,'LA OROYA',109),
 (1099,'CHACAPALPA',109),
 (1100,'HUAY HUAY',109),
 (1101,'MARCAPOMACOCHA',109),
 (1102,'MOROCOCHA',109),
 (1103,'PACCHA',109),
 (1104,'SANTA BARBARA DE CARHUACAYAN',109),
 (1105,'SUITUCANCHA',109),
 (1106,'YAULI',109),
 (1107,'SANTA ROSA DE SACCO',109),
 (1108,'SATIPO',110),
 (1109,'COVIRIALI',110),
 (1110,'LLAYLLA',110),
 (1111,'MAZAMARI',110),
 (1112,'PAMPA HERMOSA',110),
 (1113,'PANGOA',110),
 (1114,'RIO NEGRO',110),
 (1115,'RIO TAMBO',110),
 (1116,'CHANCHAMAYO',111),
 (1117,'SAN RAMON',111),
 (1118,'VITOC',111),
 (1119,'SAN LUIS DE SHUARO',111),
 (1120,'PICHANAQUI',111),
 (1121,'PERENE',111),
 (1122,'CHUPACA',112),
 (1123,'AHUAC',112),
 (1124,'CHONGOS BAJO',112),
 (1125,'HUACHAC',112),
 (1126,'HUAMANCACA CHICO',112),
 (1127,'SAN JUAN DE YSCOS',112),
 (1128,'SAN JUAN DE JARPA',112),
 (1129,'TRES DE DICIEMBRE',112),
 (1130,'YANACANCHA',112),
 (1131,'TRUJILLO',113),
 (1132,'HUANCHACO',113),
 (1133,'LAREDO',113),
 (1134,'MOCHE',113),
 (1135,'SALAVERRY',113),
 (1136,'SIMBAL',113),
 (1137,'VICTOR LARCO HERRERA',113),
 (1138,'POROTO',113),
 (1139,'EL PORVENIR',113),
 (1140,'LA ESPERANZA',113),
 (1141,'FLORENCIA DE MORA',113),
 (1142,'BOLIVAR',114),
 (1143,'BAMBAMARCA',114),
 (1144,'CONDORMARCA',114),
 (1145,'LONGOTEA',114),
 (1146,'UCUNCHA',114),
 (1147,'UCHUMARCA',114),
 (1148,'HUAMACHUCO',115),
 (1149,'COCHORCO',115),
 (1150,'CURGOS',115),
 (1151,'CHUGAY',115),
 (1152,'MARCABAL',115),
 (1153,'SANAGORAN',115),
 (1154,'SARIN',115),
 (1155,'SARTIMBAMBA',115),
 (1156,'OTUZCO',116),
 (1157,'AGALLPAMPA',116),
 (1158,'CHARAT',116),
 (1159,'HUARANCHAL',116),
 (1160,'LA CUESTA',116),
 (1161,'PARANDAY',116),
 (1162,'SALPO',116),
 (1163,'SINSICAP',116),
 (1164,'USQUIL',116),
 (1165,'MACHE',116),
 (1166,'SAN PEDRO DE LLOC',117),
 (1167,'GUADALUPE',117),
 (1168,'JEQUETEPEQUE',117),
 (1169,'PACASMAYO',117),
 (1170,'SAN JOSE',117),
 (1171,'TAYABAMBA',118),
 (1172,'BULDIBUYO',118),
 (1173,'CHILLIA',118),
 (1174,'HUAYLILLAS',118),
 (1175,'HUANCASPATA',118),
 (1176,'HUAYO',118),
 (1177,'ONGON',118),
 (1178,'PARCOY',118),
 (1179,'PATAZ',118),
 (1180,'PIAS',118),
 (1181,'TAURIJA',118),
 (1182,'URPAY',118),
 (1183,'SANTIAGO DE CHALLAS',118),
 (1184,'SANTIAGO DE CHUCO',119),
 (1185,'CACHICADAN',119),
 (1186,'MOLLEBAMBA',119),
 (1187,'MOLLEPATA',119),
 (1188,'QUIRUVILCA',119),
 (1189,'SANTA CRUZ DE CHUCA',119),
 (1190,'SITABAMBA',119),
 (1191,'ANGASMARCA',119),
 (1192,'ASCOPE',120),
 (1193,'CHICAMA',120),
 (1194,'CHOCOPE',120),
 (1195,'SANTIAGO DE CAO',120),
 (1196,'MAGDALENA DE CAO',120),
 (1197,'PAIJAN',120),
 (1198,'RAZURI',120),
 (1199,'CASA GRANDE',120),
 (1200,'CHEPEN',121),
 (1201,'PACANGA',121),
 (1202,'PUEBLO NUEVO',121),
 (1203,'JULCAN',122),
 (1204,'CARABAMBA',122),
 (1205,'CALAMARCA',122),
 (1206,'HUASO',122),
 (1207,'CASCAS',123),
 (1208,'LUCMA',123),
 (1209,'MARMOT',123),
 (1210,'SAYAPULLO',123),
 (1211,'VIRU',124),
 (1212,'CHAO',124),
 (1213,'GUADALUPITO',124),
 (1214,'CHICLAYO',125),
 (1215,'CHONGOYAPE',125),
 (1216,'ETEN',125),
 (1217,'ETEN PUERTO',125),
 (1218,'LAGUNAS',125),
 (1219,'MONSEFU',125),
 (1220,'NUEVA ARICA',125),
 (1221,'OYOTUN',125),
 (1222,'PICSI',125),
 (1223,'PIMENTEL',125),
 (1224,'REQUE',125),
 (1225,'JOSE LEONARDO ORTIZ',125),
 (1226,'SANTA ROSA',125),
 (1227,'SAÑA',125),
 (1228,'LA VICTORIA',125),
 (1229,'CAYALTI',125),
 (1230,'PATAPO',125),
 (1231,'POMALCA',125),
 (1232,'PUCALA',125),
 (1233,'TUMAN',125),
 (1234,'FERREÑAFE',126),
 (1235,'INCAHUASI',126),
 (1236,'CAÑARIS',126),
 (1237,'PITIPO',126),
 (1238,'PUEBLO NUEVO',126),
 (1239,'MANUEL ANTONIO MESONES MURO',126),
 (1240,'LAMBAYEQUE',127),
 (1241,'CHOCHOPE',127),
 (1242,'ILLIMO',127),
 (1243,'JAYANCA',127),
 (1244,'MOCHUMI',127),
 (1245,'MORROPE',127),
 (1246,'MOTUPE',127),
 (1247,'OLMOS',127),
 (1248,'PACORA',127),
 (1249,'SALAS',127),
 (1250,'SAN JOSE',127),
 (1251,'TUCUME',127),
 (1252,'LIMA',128),
 (1253,'ANCON',128),
 (1254,'ATE',128),
 (1255,'BREÑA',128),
 (1256,'CARABAYLLO',128),
 (1257,'COMAS',128),
 (1258,'CHACLACAYO',128),
 (1259,'CHORRILLOS',128),
 (1260,'LA VICTORIA',128),
 (1261,'LA MOLINA',128),
 (1262,'LINCE',128),
 (1263,'LURIGANCHO',128),
 (1264,'LURIN',128),
 (1265,'MAGDALENA DEL MAR',128),
 (1266,'MIRAFLORES',128),
 (1267,'PACHACAMAC',128),
 (1268,'PUEBLO LIBRE',128),
 (1269,'PUCUSANA',128),
 (1270,'PUENTE PIEDRA',128),
 (1271,'PUNTA HERMOSA',128),
 (1272,'PUNTA NEGRA',128),
 (1273,'RIMAC',128),
 (1274,'SAN BARTOLO',128),
 (1275,'SAN ISIDRO',128),
 (1276,'BARRANCO',128),
 (1277,'SAN MARTIN DE PORRES',128),
 (1278,'SAN MIGUEL',128),
 (1279,'SANTA MARIA DEL MAR',128),
 (1280,'SANTA ROSA',128),
 (1281,'SANTIAGO DE SURCO',128),
 (1282,'SURQUILLO',128),
 (1283,'VILLA MARIA DEL TRIUNFO',128),
 (1284,'JESUS MARIA',128),
 (1285,'INDEPENDENCIA',128),
 (1286,'EL AGUSTINO',128),
 (1287,'SAN JUAN DE MIRAFLORES',128),
 (1288,'SAN JUAN DE LURIGANCHO',128),
 (1289,'SAN LUIS',128),
 (1290,'CIENEGUILLA',128),
 (1291,'SAN BORJA',128),
 (1292,'VILLA EL SALVADOR',128),
 (1293,'LOS OLIVOS',128),
 (1294,'SANTA ANITA',128),
 (1295,'CAJATAMBO',129),
 (1296,'COPA',129),
 (1297,'GORGOR',129),
 (1298,'HUANCAPON',129),
 (1299,'MANAS',129),
 (1300,'CANTA',130),
 (1301,'ARAHUAY',130),
 (1302,'HUAMANTANGA',130),
 (1303,'HUAROS',130),
 (1304,'LACHAQUI',130),
 (1305,'SAN BUENAVENTURA',130),
 (1306,'SANTA ROSA DE QUIVES',130),
 (1307,'SAN VICENTE DE CAÑETE',131),
 (1308,'CALANGO',131),
 (1309,'CERRO AZUL',131),
 (1310,'COAYLLO',131),
 (1311,'CHILCA',131),
 (1312,'IMPERIAL',131),
 (1313,'LUNAHUANA',131),
 (1314,'MALA',131),
 (1315,'NUEVO IMPERIAL',131),
 (1316,'PACARAN',131),
 (1317,'QUILMANA',131),
 (1318,'SAN ANTONIO',131),
 (1319,'SAN LUIS',131),
 (1320,'SANTA CRUZ DE FLORES',131),
 (1321,'ZUÑIGA',131),
 (1322,'ASIA',131),
 (1323,'HUACHO',132),
 (1324,'AMBAR',132),
 (1325,'CALETA DE CARQUIN',132),
 (1326,'CHECRAS',132),
 (1327,'HUALMAY',132),
 (1328,'HUAURA',132),
 (1329,'LEONCIO PRADO',132),
 (1330,'PACCHO',132),
 (1331,'SANTA LEONOR',132),
 (1332,'SANTA MARIA',132),
 (1333,'SAYAN',132),
 (1334,'VEGUETA',132),
 (1335,'MATUCANA',133),
 (1336,'ANTIOQUIA',133),
 (1337,'CALLAHUANCA',133),
 (1338,'CARAMPOMA',133),
 (1339,'CASTA',133),
 (1340,'SAN JOSE DE LOS CHORRILLOS',133),
 (1341,'CHICLA',133),
 (1342,'HUANZA',133),
 (1343,'HUAROCHIRI',133),
 (1344,'LAHUAYTAMBO',133),
 (1345,'LANGA',133),
 (1346,'MARIATANA',133),
 (1347,'RICARDO PALMA',133),
 (1348,'SAN ANDRES DE TUPICOCHA',133),
 (1349,'SAN ANTONIO',133),
 (1350,'SAN BARTOLOME',133),
 (1351,'SAN DAMIAN',133),
 (1352,'SANGALLAYA',133),
 (1353,'SAN JUAN DE TANTARANCHE',133),
 (1354,'SAN LORENZO DE QUINTI',133),
 (1355,'SAN MATEO',133),
 (1356,'SAN MATEO DE OTAO',133),
 (1357,'SAN PEDRO DE HUANCAYRE',133),
 (1358,'SANTA CRUZ DE COCACHACRA',133),
 (1359,'SANTA EULALIA',133),
 (1360,'SANTIAGO DE ANCHUCAYA',133),
 (1361,'SANTIAGO DE TUNA',133),
 (1362,'SANTO DOMINGO DE LOS OLLEROS',133),
 (1363,'SURCO',133),
 (1364,'HUACHUPAMPA',133),
 (1365,'LARAOS',133),
 (1366,'SAN JUAN DE IRIS',133),
 (1367,'YAUYOS',134),
 (1368,'ALIS',134),
 (1369,'ALLAUCA',134),
 (1370,'AYAVIRI',134),
 (1371,'AZANGARO',134),
 (1372,'CACRA',134),
 (1373,'CARANIA',134),
 (1374,'COCHAS',134),
 (1375,'COLONIA',134),
 (1376,'CHOCOS',134),
 (1377,'HUAMPARA',134),
 (1378,'HUANCAYA',134),
 (1379,'HUANGASCAR',134),
 (1380,'HUANTAN',134),
 (1381,'HUAÑEC',134),
 (1382,'LARAOS',134),
 (1383,'LINCHA',134),
 (1384,'MIRAFLORES',134),
 (1385,'OMAS',134),
 (1386,'QUINCHES',134),
 (1387,'QUINOCAY',134),
 (1388,'SAN JOAQUIN',134),
 (1389,'SAN PEDRO DE PILAS',134),
 (1390,'TANTA',134),
 (1391,'TAURIPAMPA',134),
 (1392,'TUPE',134),
 (1393,'TOMAS',134),
 (1394,'VIÑAC',134),
 (1395,'VITIS',134),
 (1396,'HONGOS',134),
 (1397,'MADEAN',134),
 (1398,'PUTINZA',134),
 (1399,'CATAHUASI',134),
 (1400,'HUARAL',135),
 (1401,'ATAVILLOS ALTO',135),
 (1402,'ATAVILLOS BAJO',135),
 (1403,'AUCALLAMA',135),
 (1404,'CHANCAY',135),
 (1405,'IHUARI',135),
 (1406,'LAMPIAN',135),
 (1407,'PACARAOS',135),
 (1408,'SAN MIGUEL DE ACOS',135),
 (1409,'VEINTISIETE DE NOVIEMBRE',135),
 (1410,'SANTA CRUZ DE ANDAMARCA',135),
 (1411,'SUMBILCA',135),
 (1412,'BARRANCA',136),
 (1413,'PARAMONGA',136),
 (1414,'PATIVILCA',136),
 (1415,'SUPE',136),
 (1416,'SUPE PUERTO',136),
 (1417,'OYON',137),
 (1418,'NAVAN',137),
 (1419,'CAUJUL',137),
 (1420,'ANDAJES',137),
 (1421,'PACHANGARA',137),
 (1422,'COCHAMARCA',137),
 (1423,'IQUITOS',138),
 (1424,'ALTO NANAY',138),
 (1425,'FERNANDO LORES',138),
 (1426,'LAS AMAZONAS',138),
 (1427,'MAZAN',138),
 (1428,'NAPO',138),
 (1429,'PUTUMAYO',138),
 (1430,'TORRES CAUSANA',138),
 (1431,'INDIANA',138),
 (1432,'PUNCHANA',138),
 (1433,'BELEN',138),
 (1434,'SAN JUAN BAUTISTA',138),
 (1435,'TENIENTE MANUEL CLAVERO',138),
 (1436,'YURIMAGUAS',139),
 (1437,'BALSAPUERTO',139),
 (1438,'JEBEROS',139),
 (1439,'LAGUNAS',139),
 (1440,'SANTA CRUZ',139),
 (1441,'TENIENTE CESAR LOPEZ ROJAS',139),
 (1442,'NAUTA',140),
 (1443,'PARINARI',140),
 (1444,'TIGRE',140),
 (1445,'URARINAS',140),
 (1446,'TROMPETEROS',140),
 (1447,'REQUENA',141),
 (1448,'ALTO TAPICHE',141),
 (1449,'CAPELO',141),
 (1450,'EMILIO SAN MARTIN',141),
 (1451,'MAQUIA',141),
 (1452,'PUINAHUA',141),
 (1453,'SAQUENA',141),
 (1454,'SOPLIN',141),
 (1455,'TAPICHE',141),
 (1456,'JENARO HERRERA',141),
 (1457,'YAQUERANA',141),
 (1458,'CONTAMANA',142),
 (1459,'VARGAS GUERRA',142),
 (1460,'PADRE MARQUEZ',142),
 (1461,'PAMPA HERMOSA',142),
 (1462,'SARAYACU',142),
 (1463,'INAHUAYA',142),
 (1464,'RAMON CASTILLA',143),
 (1465,'PEBAS',143),
 (1466,'YAVARI',143),
 (1467,'SAN PABLO',143),
 (1468,'BARRANCA',144),
 (1469,'ANDOAS',144),
 (1470,'CAHUAPANAS',144),
 (1471,'MANSERICHE',144),
 (1472,'MORONA',144),
 (1473,'PASTAZA',144),
 (1474,'TAMBOPATA',145),
 (1475,'INAMBARI',145),
 (1476,'LAS PIEDRAS',145),
 (1477,'LABERINTO',145),
 (1478,'MANU',146),
 (1479,'FITZCARRALD',146),
 (1480,'MADRE DE DIOS',146),
 (1481,'HUEPETUHE',146),
 (1482,'IÑAPARI',147),
 (1483,'IBERIA',147),
 (1484,'TAHUAMANU',147),
 (1485,'MOQUEGUA',148),
 (1486,'CARUMAS',148),
 (1487,'CUCHUMBAYA',148),
 (1488,'SAN CRISTOBAL',148),
 (1489,'TORATA',148),
 (1490,'SAMEGUA',148),
 (1491,'OMATE',149),
 (1492,'COALAQUE',149),
 (1493,'CHOJATA',149),
 (1494,'ICHUÑA',149),
 (1495,'LA CAPILLA',149),
 (1496,'LLOQUE',149),
 (1497,'MATALAQUE',149),
 (1498,'PUQUINA',149),
 (1499,'QUINISTAQUILLAS',149),
 (1500,'UBINAS',149),
 (1501,'YUNGA',149),
 (1502,'ILO',150),
 (1503,'EL ALGARROBAL',150),
 (1504,'PACOCHA',150),
 (1505,'CHAUPIMARCA',151),
 (1506,'HUACHON',151),
 (1507,'HUARIACA',151),
 (1508,'HUAYLLAY',151),
 (1509,'NINACACA',151),
 (1510,'PALLANCHACRA',151),
 (1511,'PAUCARTAMBO',151),
 (1512,'SAN FCO DE ASIS DE YARUSYACAN',151),
 (1513,'SIMON BOLIVAR',151),
 (1514,'TICLACAYAN',151),
 (1515,'TINYAHUARCO',151),
 (1516,'VICCO',151),
 (1517,'YANACANCHA',151),
 (1518,'YANAHUANCA',152),
 (1519,'CHACAYAN',152),
 (1520,'GOYLLARISQUIZGA',152),
 (1521,'PAUCAR',152),
 (1522,'SAN PEDRO DE PILLAO',152),
 (1523,'SANTA ANA DE TUSI',152),
 (1524,'TAPUC',152),
 (1525,'VILCABAMBA',152),
 (1526,'OXAPAMPA',153),
 (1527,'CHONTABAMBA',153),
 (1528,'HUANCABAMBA',153),
 (1529,'PUERTO BERMUDEZ',153),
 (1530,'VILLA RICA',153),
 (1531,'POZUZO',153),
 (1532,'PALCAZU',153),
 (1533,'CONSTITUCION',153),
 (1534,'PIURA',154),
 (1535,'CASTILLA',154),
 (1536,'CATACAOS',154),
 (1537,'LA ARENA',154),
 (1538,'LA UNION',154),
 (1539,'LAS LOMAS',154),
 (1540,'TAMBO GRANDE',154),
 (1541,'CURA MORI',154),
 (1542,'EL TALLAN',154),
 (1543,'VEINTISEIS DE OCTUBRE',154),
 (1544,'AYABACA',155),
 (1545,'FRIAS',155),
 (1546,'LAGUNAS',155),
 (1547,'MONTERO',155),
 (1548,'PACAIPAMPA',155),
 (1549,'SAPILLICA',155),
 (1550,'SICCHEZ',155),
 (1551,'SUYO',155),
 (1552,'JILILI',155),
 (1553,'PAIMAS',155),
 (1554,'HUANCABAMBA',156),
 (1555,'CANCHAQUE',156),
 (1556,'HUARMACA',156),
 (1557,'SONDOR',156),
 (1558,'SONDORILLO',156),
 (1559,'EL CARMEN DE LA FRONTERA',156),
 (1560,'SAN MIGUEL DE EL FAIQUE',156),
 (1561,'LALAQUIZ',156),
 (1562,'CHULUCANAS',157),
 (1563,'BUENOS AIRES',157),
 (1564,'CHALACO',157),
 (1565,'MORROPON',157),
 (1566,'SALITRAL',157),
 (1567,'SANTA CATALINA DE MOSSA',157),
 (1568,'SANTO DOMINGO',157),
 (1569,'LA MATANZA',157),
 (1570,'YAMANGO',157),
 (1571,'SAN JUAN DE BIGOTE',157),
 (1572,'PAITA',158),
 (1573,'AMOTAPE',158),
 (1574,'ARENAL',158),
 (1575,'LA HUACA',158),
 (1576,'COLAN',158),
 (1577,'TAMARINDO',158),
 (1578,'VICHAYAL',158),
 (1579,'SULLANA',159),
 (1580,'BELLAVISTA',159),
 (1581,'LANCONES',159),
 (1582,'MARCAVELICA',159),
 (1583,'MIGUEL CHECA',159),
 (1584,'QUERECOTILLO',159),
 (1585,'SALITRAL',159),
 (1586,'IGNACIO ESCUDERO',159),
 (1587,'PARIÑAS',160),
 (1588,'EL ALTO',160),
 (1589,'LA BREA',160),
 (1590,'LOBITOS',160),
 (1591,'MANCORA',160),
 (1592,'LOS ORGANOS',160),
 (1593,'SECHURA',161),
 (1594,'VICE',161),
 (1595,'BERNAL',161),
 (1596,'BELLAVISTA DE LA UNION',161),
 (1597,'CRISTO NOS VALGA',161),
 (1598,'RINCONADA-LLICUAR',161),
 (1599,'PUNO',162),
 (1600,'ACORA',162),
 (1601,'ATUNCOLLA',162),
 (1602,'CAPACHICA',162),
 (1603,'COATA',162),
 (1604,'CHUCUITO',162),
 (1605,'HUATA',162),
 (1606,'MAÑAZO',162),
 (1607,'PAUCARCOLLA',162),
 (1608,'PICHACANI',162),
 (1609,'SAN ANTONIO',162),
 (1610,'TIQUILLACA',162),
 (1611,'VILQUE',162),
 (1612,'PLATERIA',162),
 (1613,'AMANTANI',162),
 (1614,'AZANGARO',163),
 (1615,'ACHAYA',163),
 (1616,'ARAPA',163),
 (1617,'ASILLO',163),
 (1618,'CAMINACA',163),
 (1619,'CHUPA',163),
 (1620,'JOSE DOMINGO CHOQUEHUANCA',163),
 (1621,'MUÑANI',163),
 (1622,'POTONI',163),
 (1623,'SAMAN',163),
 (1624,'SAN ANTON',163),
 (1625,'SAN JOSE',163),
 (1626,'SAN JUAN DE SALINAS',163),
 (1627,'SANTIAGO DE PUPUJA',163),
 (1628,'TIRAPATA',163),
 (1629,'MACUSANI',164),
 (1630,'AJOYANI',164),
 (1631,'AYAPATA',164),
 (1632,'COASA',164),
 (1633,'CORANI',164),
 (1634,'CRUCERO',164),
 (1635,'ITUATA',164),
 (1636,'OLLACHEA',164),
 (1637,'SAN GABAN',164),
 (1638,'USICAYOS',164),
 (1639,'JULI',165),
 (1640,'DESAGUADERO',165),
 (1641,'HUACULLANI',165),
 (1642,'PISACOMA',165),
 (1643,'POMATA',165),
 (1644,'ZEPITA',165),
 (1645,'KELLUYO',165),
 (1646,'HUANCANE',166),
 (1647,'COJATA',166),
 (1648,'INCHUPALLA',166),
 (1649,'PUSI',166),
 (1650,'ROSASPATA',166),
 (1651,'TARACO',166),
 (1652,'VILQUE CHICO',166),
 (1653,'HUATASANI',166),
 (1654,'LAMPA',167),
 (1655,'CABANILLA',167),
 (1656,'CALAPUJA',167),
 (1657,'NICASIO',167),
 (1658,'OCUVIRI',167),
 (1659,'PALCA',167),
 (1660,'PARATIA',167),
 (1661,'PUCARA',167),
 (1662,'SANTA LUCIA',167),
 (1663,'VILAVILA',167),
 (1664,'AYAVIRI',168),
 (1665,'ANTAUTA',168),
 (1666,'CUPI',168),
 (1667,'LLALLI',168),
 (1668,'MACARI',168),
 (1669,'NUÑOA',168),
 (1670,'ORURILLO',168),
 (1671,'SANTA ROSA',168),
 (1672,'UMACHIRI',168),
 (1673,'SANDIA',169),
 (1674,'CUYOCUYO',169),
 (1675,'LIMBANI',169),
 (1676,'PHARA',169),
 (1677,'PATAMBUCO',169),
 (1678,'QUIACA',169),
 (1679,'SAN JUAN DEL ORO',169),
 (1680,'YANAHUAYA',169),
 (1681,'ALTO INAMBARI',169),
 (1682,'SAN PEDRO DE PUTINA PUNCO',169),
 (1683,'JULIACA',170),
 (1684,'CABANA',170),
 (1685,'CABANILLAS',170),
 (1686,'CARACOTO',170),
 (1687,'YUNGUYO',171),
 (1688,'UNICACHI',171),
 (1689,'ANAPIA',171),
 (1690,'COPANI',171),
 (1691,'CUTURAPI',171),
 (1692,'OLLARAYA',171),
 (1693,'TINICACHI',171),
 (1694,'PUTINA',172),
 (1695,'PEDRO VILCA APAZA',172),
 (1696,'QUILCAPUNCU',172),
 (1697,'ANANEA',172),
 (1698,'SINA',172),
 (1699,'ILAVE',173),
 (1700,'PILCUYO',173),
 (1701,'SANTA ROSA',173),
 (1702,'CAPASO',173),
 (1703,'CONDURIRI',173),
 (1704,'MOHO',174),
 (1705,'CONIMA',174),
 (1706,'TILALI',174),
 (1707,'HUAYRAPATA',174),
 (1708,'MOYOBAMBA',175),
 (1709,'CALZADA',175),
 (1710,'HABANA',175),
 (1711,'JEPELACIO',175),
 (1712,'SORITOR',175),
 (1713,'YANTALO',175),
 (1714,'SAPOSOA',176),
 (1715,'PISCOYACU',176),
 (1716,'SACANCHE',176),
 (1717,'TINGO DE SAPOSOA',176),
 (1718,'ALTO SAPOSOA',176),
 (1719,'EL ESLABON',176),
 (1720,'LAMAS',177),
 (1721,'BARRANQUITA',177),
 (1722,'CAYNARACHI',177),
 (1723,'CUÑUMBUQUI',177),
 (1724,'PINTO RECODO',177),
 (1725,'RUMISAPA',177),
 (1726,'SHANAO',177),
 (1727,'TABALOSOS',177),
 (1728,'ZAPATERO',177),
 (1729,'ALONSO DE ALVARADO',177),
 (1730,'SAN ROQUE DE CUMBAZA',177),
 (1731,'JUANJUI',178),
 (1732,'CAMPANILLA',178),
 (1733,'HUICUNGO',178),
 (1734,'PACHIZA',178),
 (1735,'PAJARILLO',178),
 (1736,'RIOJA',179),
 (1737,'POSIC',179),
 (1738,'YORONGOS',179),
 (1739,'YURACYACU',179),
 (1740,'NUEVA CAJAMARCA',179),
 (1741,'ELIAS SOPLIN VARGAS',179),
 (1742,'SAN FERNANDO',179),
 (1743,'PARDO MIGUEL',179),
 (1744,'AWAJUN',179),
 (1745,'TARAPOTO',180),
 (1746,'ALBERTO LEVEAU',180),
 (1747,'CACATACHI',180),
 (1748,'CHAZUTA',180),
 (1749,'CHIPURANA',180),
 (1750,'EL PORVENIR',180),
 (1751,'HUIMBAYOC',180),
 (1752,'JUAN GUERRA',180),
 (1753,'MORALES',180),
 (1754,'PAPAPLAYA',180),
 (1755,'SAN ANTONIO',180),
 (1756,'SAUCE',180),
 (1757,'SHAPAJA',180),
 (1758,'LA BANDA DE SHILCAYO',180),
 (1759,'BELLAVISTA',181),
 (1760,'SAN RAFAEL',181),
 (1761,'SAN PABLO',181),
 (1762,'ALTO BIAVO',181),
 (1763,'HUALLAGA',181),
 (1764,'BAJO BIAVO',181),
 (1765,'TOCACHE',182),
 (1766,'NUEVO PROGRESO',182),
 (1767,'POLVORA',182),
 (1768,'SHUNTE',182),
 (1769,'UCHIZA',182),
 (1770,'PICOTA',183),
 (1771,'BUENOS AIRES',183),
 (1772,'CASPIZAPA',183),
 (1773,'PILLUANA',183),
 (1774,'PUCACACA',183),
 (1775,'SAN CRISTOBAL',183),
 (1776,'SAN HILARION',183),
 (1777,'TINGO DE PONASA',183),
 (1778,'TRES UNIDOS',183),
 (1779,'SHAMBOYACU',183),
 (1780,'SAN JOSE DE SISA',184),
 (1781,'AGUA BLANCA',184),
 (1782,'SHATOJA',184),
 (1783,'SAN MARTIN',184),
 (1784,'SANTA ROSA',184),
 (1785,'TACNA',185),
 (1786,'CALANA',185),
 (1787,'INCLAN',185),
 (1788,'PACHIA',185),
 (1789,'PALCA',185),
 (1790,'POCOLLAY',185),
 (1791,'SAMA',185),
 (1792,'ALTO DE LA ALIANZA',185),
 (1793,'CIUDAD NUEVA',185),
 (1794,'CORONEL GREGORIO ALBARRACIN L.',185),
 (1795,'TARATA',186),
 (1796,'HEROES ALBARRACIN',186),
 (1797,'ESTIQUE',186),
 (1798,'ESTIQUE PAMPA',186),
 (1799,'SITAJARA',186),
 (1800,'SUSAPAYA',186),
 (1801,'TARUCACHI',186),
 (1802,'TICACO',186),
 (1803,'LOCUMBA',187),
 (1804,'ITE',187),
 (1805,'ILABAYA',187),
 (1806,'CANDARAVE',188),
 (1807,'CAIRANI',188),
 (1808,'CURIBAYA',188),
 (1809,'HUANUARA',188),
 (1810,'QUILAHUANI',188),
 (1811,'CAMILACA',188),
 (1812,'TUMBES',189),
 (1813,'CORRALES',189),
 (1814,'LA CRUZ',189),
 (1815,'PAMPAS DE HOSPITAL',189),
 (1816,'SAN JACINTO',189),
 (1817,'SAN JUAN DE LA VIRGEN',189),
 (1818,'ZORRITOS',190),
 (1819,'CASITAS',190),
 (1820,'CANOAS DE PUNTA SAL',190),
 (1821,'ZARUMILLA',191),
 (1822,'MATAPALO',191),
 (1823,'PAPAYAL',191),
 (1824,'AGUAS VERDES',191),
 (1825,'CALLERIA',192),
 (1826,'YARINACOCHA',192),
 (1827,'MASISEA',192),
 (1828,'CAMPOVERDE',192),
 (1829,'IPARIA',192),
 (1830,'NUEVA REQUENA',192),
 (1831,'MANANTAY',192),
 (1832,'PADRE ABAD',193),
 (1833,'IRAZOLA',193),
 (1834,'CURIMANA',193),
 (1835,'RAIMONDI',194),
 (1836,'TAHUANIA',194),
 (1837,'YURUA',194),
 (1838,'SEPAHUA',194),
 (1839,'PURUS',195);
/*!40000 ALTER TABLE `distrito` ENABLE KEYS */;


--
-- Definition of table `documento`
--

DROP TABLE IF EXISTS `documento`;
CREATE TABLE `documento` (
  `iddocumento` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(300) NOT NULL,
  `asunto` varchar(300) NOT NULL,
  `folios` int(11) DEFAULT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `fechrecepcion` datetime DEFAULT NULL,
  `fechingsist` datetime DEFAULT NULL,
  `confidencialidad` tinyint(1) NOT NULL,
  `ruta` varchar(300) DEFAULT NULL,
  `tipoingreso` int(11) DEFAULT NULL,
  `idexpediente` int(11) DEFAULT NULL,
  `idpersona` int(11) DEFAULT NULL,
  `idinstitucion` int(11) DEFAULT NULL,
  `idtipodocumento` int(11) NOT NULL,
  `idprioridad` int(11) NOT NULL,
  `idreferencia` int(11) DEFAULT NULL,
  `idtrabajador` int(11) DEFAULT NULL,
  `idestadodoc` int(11) NOT NULL,
  PRIMARY KEY (`iddocumento`),
  KEY `fk_documento_expediente1_idx` (`idexpediente`),
  KEY `fk_documento_persona1_idx` (`idpersona`),
  KEY `fk_documento_institucion1_idx` (`idinstitucion`),
  KEY `fk_documento_tipodocumento1_idx` (`idtipodocumento`),
  KEY `fk_documento_prioridad1_idx` (`idprioridad`),
  KEY `fk_documento_documento1_idx` (`idreferencia`),
  KEY `fk_documento_trabajador1_idx` (`idtrabajador`),
  KEY `fk_documento_estadodoc1_idx` (`idestadodoc`),
  CONSTRAINT `fk_documento_documento1` FOREIGN KEY (`idreferencia`) REFERENCES `documento` (`iddocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_documento_estadodoc1` FOREIGN KEY (`idestadodoc`) REFERENCES `estadodoc` (`idestadodoc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_documento_expediente1` FOREIGN KEY (`idexpediente`) REFERENCES `expediente` (`idexpediente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_documento_institucion1` FOREIGN KEY (`idinstitucion`) REFERENCES `institucion` (`idinstitucion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_documento_persona1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_documento_prioridad1` FOREIGN KEY (`idprioridad`) REFERENCES `prioridad` (`idprioridad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_documento_tipodocumento1` FOREIGN KEY (`idtipodocumento`) REFERENCES `tipodocumento` (`idtipodocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_documento_trabajador1` FOREIGN KEY (`idtrabajador`) REFERENCES `trabajador` (`idtrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;


--
-- Definition of table `estadodoc`
--

DROP TABLE IF EXISTS `estadodoc`;
CREATE TABLE `estadodoc` (
  `idestadodoc` int(11) NOT NULL AUTO_INCREMENT,
  `estadodoc` varchar(45) NOT NULL,
  PRIMARY KEY (`idestadodoc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estadodoc`
--

/*!40000 ALTER TABLE `estadodoc` DISABLE KEYS */;
INSERT INTO `estadodoc` (`idestadodoc`,`estadodoc`) VALUES 
 (1,'EN OFICINA'),
 (2,'POR RECIBIR');
/*!40000 ALTER TABLE `estadodoc` ENABLE KEYS */;


--
-- Definition of table `estadoexp`
--

DROP TABLE IF EXISTS `estadoexp`;
CREATE TABLE `estadoexp` (
  `idestadoexp` int(11) NOT NULL AUTO_INCREMENT,
  `estadoexp` varchar(45) NOT NULL,
  PRIMARY KEY (`idestadoexp`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estadoexp`
--

/*!40000 ALTER TABLE `estadoexp` DISABLE KEYS */;
INSERT INTO `estadoexp` (`idestadoexp`,`estadoexp`) VALUES 
 (1,'RECEPCIONADO EN'),
 (2,'DERIVADO A'),
 (3,'ARCHIVADO EN'),
 (4,'ANULADO EN'),
 (5,'VENCIDO EN'),
 (6,'DEVUELTO AL INTERESADO'),
 (7,'ENVIADO A'),
 (8,'DEVUELTO');
/*!40000 ALTER TABLE `estadoexp` ENABLE KEYS */;


--
-- Definition of table `expediente`
--

DROP TABLE IF EXISTS `expediente`;
CREATE TABLE `expediente` (
  `idexpediente` int(11) NOT NULL AUTO_INCREMENT,
  `expediente` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `idarea` int(11) NOT NULL,
  `idestadoexp` int(11) NOT NULL,
  `idanio` int(11) NOT NULL,
  PRIMARY KEY (`idexpediente`),
  KEY `fk_expediente_area1_idx` (`idarea`),
  KEY `fk_expediente_estadoexp1_idx` (`idestadoexp`),
  KEY `fk_expediente_anio1_idx` (`idanio`),
  CONSTRAINT `fk_expediente_anio1` FOREIGN KEY (`idanio`) REFERENCES `anio` (`idanio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_expediente_area1` FOREIGN KEY (`idarea`) REFERENCES `area` (`idarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_expediente_estadoexp1` FOREIGN KEY (`idestadoexp`) REFERENCES `estadoexp` (`idestadoexp`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;


--
-- Definition of table `institucion`
--

DROP TABLE IF EXISTS `institucion`;
CREATE TABLE `institucion` (
  `idinstitucion` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` char(11) NOT NULL,
  `razonsocial` varchar(300) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `idpersona` int(11) NOT NULL,
  `idtipoinstitucion` int(11) NOT NULL,
  `idlocal` int(11) NOT NULL,
  PRIMARY KEY (`idinstitucion`),
  KEY `fk_institucion_persona1_idx` (`idpersona`),
  KEY `fk_institucion_tipoinstitucion1_idx` (`idtipoinstitucion`),
  KEY `fk_institucion_distrito1_idx` (`idlocal`),
  CONSTRAINT `fk_institucion_distrito1` FOREIGN KEY (`idlocal`) REFERENCES `distrito` (`iddistrito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_institucion_persona1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_institucion_tipoinstitucion1` FOREIGN KEY (`idtipoinstitucion`) REFERENCES `tipoinstitucion` (`idtipoinstitucion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


--
-- Definition of table `local`
--

DROP TABLE IF EXISTS `local`;
CREATE TABLE `local` (
  `idlocal` int(11) NOT NULL AUTO_INCREMENT,
  `local` varchar(150) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  PRIMARY KEY (`idlocal`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `local`
--

/*!40000 ALTER TABLE `local` DISABLE KEYS */;
INSERT INTO `local` (`idlocal`,`local`,`direccion`) VALUES 
 (1,'EDIFICIO 1','CALLE'),
 (2,'EDIFICIO 2','AVENIDA'),
 (3,'EDIFICIO 3','CALLE'),
 (4,'EDIFICIO 4','CALLE'),
 (5,'EDIFICIO 5','PASAJE'),
 (6,'EDIFICIO 6','AVENIDA');
/*!40000 ALTER TABLE `local` ENABLE KEYS */;


--
-- Definition of table `modalidad`
--

DROP TABLE IF EXISTS `modalidad`;
CREATE TABLE `modalidad` (
  `idmodalidad` int(11) NOT NULL AUTO_INCREMENT,
  `modalidad` varchar(150) NOT NULL,
  PRIMARY KEY (`idmodalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modalidad`
--

/*!40000 ALTER TABLE `modalidad` DISABLE KEYS */;
INSERT INTO `modalidad` (`idmodalidad`,`modalidad`) VALUES 
 (1,'FIJO'),
 (2,'INDEFINIDO'),
 (3,'TEMPORAL'),
 (4,'AUTONOMO');
/*!40000 ALTER TABLE `modalidad` ENABLE KEYS */;


--
-- Definition of table `nota`
--

DROP TABLE IF EXISTS `nota`;
CREATE TABLE `nota` (
  `idnota` int(11) NOT NULL AUTO_INCREMENT,
  `nota` varchar(300) NOT NULL,
  `asunto` varchar(150) NOT NULL,
  `fechemision` date NOT NULL,
  `idderiva` int(11) NOT NULL,
  `idtrabajadoring` int(11) NOT NULL,
  PRIMARY KEY (`idnota`),
  KEY `fk_nota_deriva1_idx` (`idderiva`,`idtrabajadoring`),
  CONSTRAINT `fk_nota_deriva1` FOREIGN KEY (`idderiva`, `idtrabajadoring`) REFERENCES `deriva` (`idderiva`, `idtrabajadoring`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nota`
--

/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;


--
-- Definition of table `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `dni` char(8) NOT NULL,
  `ruc` char(11) DEFAULT NULL,
  `apellidos` varchar(150) NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `fechnac` date DEFAULT NULL,
  `genero` char(1) NOT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  `telefono1` varchar(45) DEFAULT NULL,
  `telefono2` varchar(45) DEFAULT NULL,
  `correo1` varchar(45) DEFAULT NULL,
  `correo2` varchar(45) DEFAULT NULL,
  `intext` tinyint(1) NOT NULL,
  `idlocal` int(11) NOT NULL,
  PRIMARY KEY (`idpersona`),
  KEY `fk_persona_distrito1_idx` (`idlocal`),
  CONSTRAINT `fk_persona_distrito1` FOREIGN KEY (`idlocal`) REFERENCES `distrito` (`iddistrito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `persona`
--

/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`idpersona`,`dni`,`ruc`,`apellidos`,`nombres`,`fechnac`,`genero`,`direccion`,`telefono1`,`telefono2`,`correo1`,`correo2`,`intext`,`idlocal`) VALUES
 (1,'12345678','00123456780','PATERNO MATERNO','NOMBRE','2000-01-01','M','AVENIDA','987654321','','EMAIL@TRABAJO.COM','EMAIL@PERSONAL.COM',1,1),
 (2,'87654321','00876543210','PATERNOS MATERNOS','NOMBRES','2000-12-12','F','PASAJE','123456789','','CORREO@TRABAJO.COM','CORREO@PERSONAL.COM',1,1);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;


--
-- Definition of table `prioridad`
--

DROP TABLE IF EXISTS `prioridad`;
CREATE TABLE `prioridad` (
  `idprioridad` int(11) NOT NULL AUTO_INCREMENT,
  `prioridad` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `dias` int(11) NOT NULL,
  PRIMARY KEY (`idprioridad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prioridad`
--

/*!40000 ALTER TABLE `prioridad` DISABLE KEYS */;
INSERT INTO `prioridad` (`idprioridad`,`prioridad`,`descripcion`,`dias`) VALUES 
 (1,'MUY URGENTE',NULL,1),
 (2,'URGENTE',NULL,2),
 (3,'NORMAL',NULL,30);
/*!40000 ALTER TABLE `prioridad` ENABLE KEYS */;


--
-- Definition of table `proveido`
--

DROP TABLE IF EXISTS `proveido`;
CREATE TABLE `proveido` (
  `idproveido` int(11) NOT NULL AUTO_INCREMENT,
  `proveido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproveido`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proveido`
--

/*!40000 ALTER TABLE `proveido` DISABLE KEYS */;
INSERT INTO `proveido` (`idproveido`,`proveido`) VALUES
 (1,'ACCIONES QUE CORRESPONDAN'),
 (2,'ACOMPAÑAR ANTECEDENTES'),
 (3,'ACTUAR EN EL ASUNTO'),
 (4,'AGREGAR ANTECEDENTES'),
 (5,'ARCHIVO'),
 (6,'ASISTIR A REUNION'),
 (7,'ATENDER SOLICITUD'),
 (8,'CITAR A SESION'),
 (9,'CONOCIMIENTO'),
 (10,'CONTESTAR DIRECTAMENTE'),
 (11,'COORDINAR'),
 (12,'COORDINAR CON ESTE DESPACHO'),
 (13,'DAR OPINION'),
 (14,'DEVOLVER AL INTERESADO'),
 (15,'DIFUNDIR'),
 (16,'DIGITAR'),
 (17,'ENVIAR UNA COPIA DE SU RESPUESTA'),
 (18,'HABLAR CONMIGO SOBRE EL ASUNTO'),
 (19,'INFORMAR'),
 (20,'LEER Y DEVOLVER'),
 (21,'PARA SU INFORMACION'),
 (22,'PASAR A CONSEJO UNIVERSITARIO'),
 (23,'PREPARAR CHEQUE'),
 (24,'PREPARAR RESOLUCION'),
 (25,'PROYECTAR RESPUESTA'),
 (26,'PROYECTAR RESOLUCION'),
 (27,'REPRESNTAR AL RECTOR'),
 (28,'REVISAR'),
 (29,'TENER A LA MANO'),
 (30,'TENERLO PENDIENTE'),
 (31,'TRANSCRIBIR'),
 (32,'OTROS');
/*!40000 ALTER TABLE `proveido` ENABLE KEYS */;


--
-- Definition of table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
CREATE TABLE `provincia` (
  `idprovincia` int(11) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(150) NOT NULL,
  `idlocal` int(11) NOT NULL,
  PRIMARY KEY (`idprovincia`),
  KEY `fk_provincia_departamento1_idx` (`idlocal`),
  CONSTRAINT `fk_provincia_departamento1` FOREIGN KEY (`idlocal`) REFERENCES `departamento` (`iddepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provincia`
--

/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` (`idprovincia`,`provincia`,`idlocal`) VALUES 
 (1,'CHACHAPOYAS',1),
 (2,'BAGUA',1),
 (3,'BONGARA',1),
 (4,'LUYA',1),
 (5,'RODRIGUEZ DE MENDOZA',1),
 (6,'CONDORCANQUI',1),
 (7,'UTCUBAMBA',1),
 (8,'HUARAZ',2),
 (9,'AIJA',2),
 (10,'BOLOGNESI',2),
 (11,'CARHUAZ',2),
 (12,'CASMA',2),
 (13,'CORONGO',2),
 (14,'HUAYLAS',2),
 (15,'HUARI',2),
 (16,'MARISCAL LUZURIAGA',2),
 (17,'PALLASCA',2),
 (18,'POMABAMBA',2),
 (19,'RECUAY',2),
 (20,'SANTA',2),
 (21,'SIHUAS',2),
 (22,'YUNGAY',2),
 (23,'ANTONIO RAIMONDI',2),
 (24,'CARLOS FERMIN FITZCARRALD',2),
 (25,'ASUNCION',2),
 (26,'HUARMEY',2),
 (27,'OCROS',2),
 (28,'ABANCAY',3),
 (29,'AYMARAES',3),
 (30,'ANDAHUAYLAS',3),
 (31,'ANTABAMBA',3),
 (32,'COTABAMBAS',3),
 (33,'GRAU',3),
 (34,'CHINCHEROS',3),
 (35,'AREQUIPA',4),
 (36,'CAYLLOMA',4),
 (37,'CAMANA',4),
 (38,'CARAVELI',4),
 (39,'CASTILLA',4),
 (40,'CONDESUYOS',4),
 (41,'ISLAY',4),
 (42,'LA UNION',4),
 (43,'HUAMANGA',5),
 (44,'CANGALLO',5),
 (45,'HUANTA',5),
 (46,'LA MAR',5),
 (47,'LUCANAS',5),
 (48,'PARINACOCHAS',5),
 (49,'VICTOR FAJARDO',5),
 (50,'HUANCA SANCOS',5),
 (51,'VILCAS HUAMAN',5),
 (52,'PAUCAR DEL SARA SARA',5),
 (53,'SUCRE',5),
 (54,'CAJAMARCA',6),
 (55,'CAJABAMBA',6),
 (56,'CELENDIN',6),
 (57,'CONTUMAZA',6),
 (58,'CUTERVO',6),
 (59,'CHOTA',6),
 (60,'HUALGAYOC',6),
 (61,'JAEN',6),
 (62,'SANTA CRUZ',6),
 (63,'SAN MIGUEL',6),
 (64,'SAN IGNACIO',6),
 (65,'SAN MARCOS',6),
 (66,'SAN PABLO',6),
 (67,'CALLAO',7),
 (68,'CUSCO',8),
 (69,'ACOMAYO',8),
 (70,'ANTA',8),
 (71,'CALCA',8),
 (72,'CANAS',8),
 (73,'CANCHIS',8),
 (74,'CHUMBIVILCAS',8),
 (75,'ESPINAR',8),
 (76,'LA CONVENCION',8),
 (77,'PARURO',8),
 (78,'PAUCARTAMBO',8),
 (79,'QUISPICANCHI',8),
 (80,'URUBAMBA',8),
 (81,'HUANCAVELICA',9),
 (82,'ACOBAMBA',9),
 (83,'ANGARAES',9),
 (84,'CASTROVIRREYNA',9),
 (85,'TAYACAJA',9),
 (86,'HUAYTARA',9),
 (87,'CHURCAMPA',9),
 (88,'HUANUCO',10),
 (89,'AMBO',10),
 (90,'DOS DE MAYO',10),
 (91,'HUAMALIES',10),
 (92,'MARAÑON',10),
 (93,'LEONCIO PRADO',10),
 (94,'PACHITEA',10),
 (95,'PUERTO INCA',10),
 (96,'HUACAYBAMBA',10),
 (97,'LAURICOCHA',10),
 (98,'YAROWILCA',10),
 (99,'ICA',11),
 (100,'CHINCHA',11),
 (101,'NAZCA',11),
 (102,'PISCO',11),
 (103,'PALPA',11),
 (104,'HUANCAYO',12),
 (105,'CONCEPCION',12),
 (106,'JAUJA',12),
 (107,'JUNIN',12),
 (108,'TARMA',12),
 (109,'YAULI',12),
 (110,'SATIPO',12),
 (111,'CHANCHAMAYO',12),
 (112,'CHUPACA',12),
 (113,'TRUJILLO',13),
 (114,'BOLIVAR',13),
 (115,'SANCHEZ CARRION',13),
 (116,'OTUZCO',13),
 (117,'PACASMAYO',13),
 (118,'PATAZ',13),
 (119,'SANTIAGO DE CHUCO',13),
 (120,'ASCOPE',13),
 (121,'CHEPEN',13),
 (122,'JULCAN',13),
 (123,'GRAN CHIMU',13),
 (124,'VIRU',13),
 (125,'CHICLAYO',14),
 (126,'FERREÑAFE',14),
 (127,'LAMBAYEQUE',14),
 (128,'LIMA',15),
 (129,'CAJATAMBO',15),
 (130,'CANTA',15),
 (131,'CAÑETE',15),
 (132,'HUAURA',15),
 (133,'HUAROCHIRI',15),
 (134,'YAUYOS',15),
 (135,'HUARAL',15),
 (136,'BARRANCA',15),
 (137,'OYON',15),
 (138,'MAYNAS',16),
 (139,'ALTO AMAZONAS',16),
 (140,'LORETO',16),
 (141,'REQUENA',16),
 (142,'UCAYALI',16),
 (143,'MARISCAL RAMON CASTILLA',16),
 (144,'DATEM DEL MARAÑON',16),
 (145,'TAMBOPATA',17),
 (146,'MANU',17),
 (147,'TAHUAMANU',17),
 (148,'MARISCAL NIETO',18),
 (149,'GENERAL SANCHEZ CERRO',18),
 (150,'ILO',18),
 (151,'PASCO',19),
 (152,'DANIEL ALCIDES CARRION',19),
 (153,'OXAPAMPA',19),
 (154,'PIURA',20),
 (155,'AYABACA',20),
 (156,'HUANCABAMBA',20),
 (157,'MORROPON',20),
 (158,'PAITA',20),
 (159,'SULLANA',20),
 (160,'TALARA',20),
 (161,'SECHURA',20),
 (162,'PUNO',21),
 (163,'AZANGARO',21),
 (164,'CARABAYA',21),
 (165,'CHUCUITO',21),
 (166,'HUANCANE',21),
 (167,'LAMPA',21),
 (168,'MELGAR',21),
 (169,'SANDIA',21),
 (170,'SAN ROMAN',21),
 (171,'YUNGUYO',21),
 (172,'SAN ANTONIO DE PUTINA',21),
 (173,'EL COLLAO',21),
 (174,'MOHO',21),
 (175,'MOYOBAMBA',22),
 (176,'HUALLAGA',22),
 (177,'LAMAS',22),
 (178,'MARISCAL CACERES',22),
 (179,'RIOJA',22),
 (180,'SAN MARTIN',22),
 (181,'BELLAVISTA',22),
 (182,'TOCACHE',22),
 (183,'PICOTA',22),
 (184,'EL DORADO',22),
 (185,'TACNA',23),
 (186,'TARATA',23),
 (187,'JORGE BASADRE',23),
 (188,'CANDARAVE',23),
 (189,'TUMBES',24),
 (190,'CONTRALMIRANTE VILLAR',24),
 (191,'ZARUMILLA',24),
 (192,'CORONEL PORTILLO',25),
 (193,'PADRE ABAD',25),
 (194,'ATALAYA',25),
 (195,'PURUS',25);
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;


--
-- Definition of table `recepcion`
--

DROP TABLE IF EXISTS `recepcion`;
CREATE TABLE `recepcion` (
  `estado` varchar(45) NOT NULL,
  `fechrecepcion` datetime DEFAULT NULL,
  `idtrabajador` int(11) NOT NULL,
  PRIMARY KEY (`idtrabajador`),
  CONSTRAINT `fk_recepcion_trabajador1` FOREIGN KEY (`idtrabajador`) REFERENCES `trabajador` (`idtrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Definition of table `rotacion`
--

DROP TABLE IF EXISTS `rotacion`;
CREATE TABLE `rotacion` (
  `idrotacion` int(11) NOT NULL AUTO_INCREMENT,
  `idtrabajador` int(11) NOT NULL,
  `idarea` int(11) NOT NULL,
  PRIMARY KEY (`idrotacion`),
  KEY `fk_rotacion_trabajador1_idx` (`idtrabajador`),
  KEY `fk_rotacion_area1_idx` (`idarea`),
  CONSTRAINT `fk_rotacion_area1` FOREIGN KEY (`idarea`) REFERENCES `area` (`idarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rotacion_trabajador1` FOREIGN KEY (`idtrabajador`) REFERENCES `trabajador` (`idtrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rotacion`
--

/*!40000 ALTER TABLE `rotacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `rotacion` ENABLE KEYS */;


--
-- Definition of table `seguimiento`
--

DROP TABLE IF EXISTS `seguimiento`;
CREATE TABLE `seguimiento` (
  `idseguimiento` int(11) NOT NULL AUTO_INCREMENT,
  `idderiva` int(11) NOT NULL,
  `idtrabajadorderiva` int(11) NOT NULL,
  `idtrabajadorrecepcion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idseguimiento`),
  KEY `fk_seguimiento_recepcion1_idx` (`idtrabajadorrecepcion`),
  KEY `fk_seguimiento_deriva1_idx` (`idderiva`,`idtrabajadorderiva`),
  CONSTRAINT `fk_seguimiento_deriva1` FOREIGN KEY (`idderiva`, `idtrabajadorderiva`) REFERENCES `deriva` (`idderiva`, `idtrabajadoring`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_seguimiento_recepcion1` FOREIGN KEY (`idtrabajadorrecepcion`) REFERENCES `recepcion` (`idtrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

--
-- Definition of table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
CREATE TABLE `tipodocumento` (
  `idtipodocumento` int(11) NOT NULL AUTO_INCREMENT,
  `tipodocumento` varchar(150) NOT NULL,
  PRIMARY KEY (`idtipodocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipodocumento`
--

/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
INSERT INTO `tipodocumento` (`idtipodocumento`,`tipodocumento`) VALUES 
 (1,'ACTA'),
 (2,'ACUERDO DE CONCEJO'),
 (3,'BOLETA DE PAGO'),
 (4,'CARTA'),
 (5,'CARTA CIRCULAR'),
 (6,'CARTA DE PRESENTACION'),
 (7,'CARTA MULTIPLE'),
 (8,'CARTA NOTARIAL'),
 (9,'CEDULA DE NOTICICACION'),
 (10,'CERTIFICADO DE SOLTERIA'),
 (11,'CITACION'),
 (12,'COMPROBANTE DE PAGO'),
 (13,'CONSTANCIA'),
 (14,'CONTRATO'),
 (15,'COTIZACIONES'),
 (16,'DECLARACION JURADA'),
 (17,'DECRETO'),
 (18,'DECRETO DE ALCALDIA'),
 (19,'DECRETO SUPREMO'),
 (20,'DIRECTIVA'),
 (21,'DOCUMENTO EN BLACO - OTROS'),
 (22,'ESCRITO'),
 (23,'EXPEDIENTE'),
 (24,'FACTURA'),
 (25,'FUT'),
 (26,'GUIA DE REMISION'),
 (27,'INFORME'),
 (28,'INFORME ADMINISTRATIVO'),
 (29,'INFORME LEGAL'),
 (30,'INFORME MULTIPLE'),
 (31,'INFORME TECNICO'),
 (32,'INFORME TECNICO LEGAL'),
 (33,'LIQUIDACION Y ARQUEO DE CAJA'),
 (34,'MEMORANDUM'),
 (35,'MEMORANDUM CIRCULAR'),
 (36,'MEMORANDUM DE CONTROL INTERNO'),
 (37,'MEMORANDUM MULTIPLE'),
 (38,'MEMORIAL'),
 (39,'NOTAS DE ENVIO'),
 (40,'NOTICICACION'),
 (41,'OFICIO'),
 (42,'OFICIO CIRCULAR'),
 (43,'OFICIO MULTIPLE'),
 (44,'ORDEN DE PAGO'),
 (45,'ORDENANZA MUNICIPAL'),
 (46,'PEDIDO'),
 (47,'PROFORMA'),
 (48,'RECIBO POR HONORARIOS'),
 (49,'RECURSO DE APELACION'),
 (50,'RECURSO DE RECONSIDERACION'),
 (51,'RECURSO DE REVISION'),
 (52,'REQUERIMIENTO'),
 (53,'RESOLUCION'),
 (54,'RESOLUCION ADMINISTRATIVA DE INFRACCION'),
 (55,'RESOLUCION DE ALCALDIA'),
 (56,'RESOLUCION DE RECTIFICACIONES'),
 (57,'RESOLUCION DE REPOSICION'),
 (58,'RESOLUCION DE MULTA ADMINISTRATIVA'),
 (59,'RESOLUCION GERENCIAL'),
 (60,'RESOLUCION SUBGERENCIAL'),
 (61,'SOLICITUD'),
 (62,'TARJETA DE INVITACION'),
 (63,'OTROS');
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;


--
-- Definition of table `tipoinstitucion`
--

DROP TABLE IF EXISTS `tipoinstitucion`;
CREATE TABLE `tipoinstitucion` (
  `idtipoinstitucion` int(11) NOT NULL AUTO_INCREMENT,
  `tipoinstitucion` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoinstitucion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipoinstitucion`
--

/*!40000 ALTER TABLE `tipoinstitucion` DISABLE KEYS */;
INSERT INTO `tipoinstitucion` (`idtipoinstitucion`,`tipoinstitucion`) VALUES 
 (1,'PUBLICA'),
 (2,'PRIVADA');
/*!40000 ALTER TABLE `tipoinstitucion` ENABLE KEYS */;


--
-- Definition of table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
CREATE TABLE `tipousuario` (
  `idtipousuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipousuario` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipousuario`
--

/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` (`idtipousuario`,`tipousuario`) VALUES 
 (1,'ADMINISTRADOR'),
 (2,'MESA DE PARTES'),
 (3,'ADMINISTRATIVO'),
 (4,'DESCENTRALIZADO');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;


--
-- Definition of table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
CREATE TABLE `trabajador` (
  `idtrabajador` int(11) NOT NULL AUTO_INCREMENT,
  `responsable` tinyint(1) NOT NULL,
  `fechingreso` date DEFAULT NULL,
  `resingreso` varchar(100) DEFAULT NULL,
  `fechcese` date DEFAULT NULL,
  `rescese` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `idpersona` int(11) NOT NULL,
  `idarea` int(11) NOT NULL,
  `idcargo` int(11) NOT NULL,
  `idmodalidad` int(11) NOT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtrabajador`),
  KEY `fk_trabajador_persona1_idx` (`idpersona`),
  KEY `fk_trabajador_area1_idx` (`idarea`),
  KEY `fk_trabajador_cargo1_idx` (`idcargo`),
  KEY `fk_trabajador_modalidad1_idx` (`idmodalidad`),
  KEY `fk_trabajador_categoria1_idx` (`idcategoria`),
  CONSTRAINT `fk_trabajador_area1` FOREIGN KEY (`idarea`) REFERENCES `area` (`idarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabajador_cargo1` FOREIGN KEY (`idcargo`) REFERENCES `cargo` (`idcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabajador_categoria1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabajador_modalidad1` FOREIGN KEY (`idmodalidad`) REFERENCES `modalidad` (`idmodalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabajador_persona1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trabajador`
--

/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` (`idtrabajador`,`responsable`,`fechingreso`,`resingreso`,`fechcese`,`rescese`,`estado`,`idpersona`,`idarea`,`idcargo`,`idmodalidad`,`idcategoria`) VALUES
 (1,1,'2000-01-01','100',NULL,'',1,1,1,1,4,NULL),
 (2,1,'2000-01-01','101',NULL,'',1,2,2,9,1,NULL);
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `idusuario` varchar(45) NOT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `ruta` varchar(300) DEFAULT NULL,
  `idtrabajador` int(11) NOT NULL,
  `idtipousuario` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_trabajador_idx` (`idtrabajador`),
  KEY `fk_usuario_tipousuario1_idx` (`idtipousuario`),
  CONSTRAINT `fk_usuario_tipousuario1` FOREIGN KEY (`idtipousuario`) REFERENCES `tipousuario` (`idtipousuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_trabajador` FOREIGN KEY (`idtrabajador`) REFERENCES `trabajador` (`idtrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idusuario`,`clave`,`ruta`,`idtrabajador`,`idtipousuario`) VALUES 
 ('admin','a69681bcf334ae130217fea4505fd3c994f5683f','userm.png',1,1),
 ('user','a69681bcf334ae130217fea4505fd3c994f5683f','userm.png',2,3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


--
-- Definition of function `funaniversario`
--

DROP FUNCTION IF EXISTS `funaniversario`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `funaniversario`(usuario varchar(50)) RETURNS varchar(50) CHARSET utf8
BEGIN

  declare nmes varchar(20);
  declare fmes varchar(20);
  declare anio int;
  declare anion int;
  declare aniv int;
  declare falta int;
  declare fecha date;

  select pr.fechnac into @fecha
  from trabajador tb, usuario us, persona pr
  where us.idtrabajador=tb.idtrabajador and tb.idpersona=pr.idpersona and us.idusuario=usuario;

  select day(@fecha) into @fdia;
  select dayname(@fecha) into @ndia;
  select month(@fecha) into @fmes;
  select monthname(@fecha) into @nmes;
  select year(@fecha) into @fanio;

  select day(curdate()) into @fechdia;
  select dayname(curdate()) into @nomdia;
  select month(curdate()) into @fechmes;
  select monthname(curdate()) into @nommes;
  select year(curdate()) into @canio;

  set fecha=@fecha;
  set fmes=@nmes;

  set anion = @canio;
  set anio = @fanio;

  if(@fechdia=@fdia and @fechmes=@fmes) then

  set aniv = anion-anio;

  return concat('Feliz ',aniv,' aniversario');

  else

  if(fmes='January') then
    set nmes='Enero';
  end if;

  if(fmes='February') then
    set nmes='Febrero';
  end if;

  if(fmes='March') then
    set nmes='Marzo';
  end if;

  if(fmes='April') then
    set nmes='Abril';
  end if;

  if(fmes='May') then
    set nmes='Mayo';
  end if;

  if(fmes='June') then
    set nmes='Junio';
  end if;
  if(fmes='July') then
    set nmes='Julio';
  end if;
  if(fmes='August') then
    set nmes='Agosto';
  end if;
  if(fmes='September') then
    set nmes='Setiembre';
  end if;
  if(fmes='October') then
    set nmes='Octubre';
  end if;
  if(fmes='November') then
    set nmes='Noviembre';
  end if;
  if(fmes='December') then
    set nmes='Diciembre';
  end if;

  SELECT DATEDIFF(concat(@canio,'-',@fmes,'-',@fdia),curdate()) into @dif;

  set falta = @dif;

    if(falta>0) then

      return concat('Sera el ',@fdia,' de ',nmes,' y faltan ',falta,' dias');

    else

      SELECT DATEDIFF(concat(@canio+1,'-',@fmes,'-',@fdia),curdate()) into @diff;
      return concat('Sera el ',@fdia,' de ',nmes,' y faltan ',@diff,' dias');

    end if;
  end if;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `fundiaqueda`
--

DROP FUNCTION IF EXISTS `fundiaqueda`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `fundiaqueda`(idexp varchar(10)) RETURNS varchar(50) CHARSET utf8
BEGIN

  select dc.fechrecepcion, pd.dias into @fecha, @dia
  from expediente ex, documento dc, prioridad pd
  where dc.idexpediente=ex.idexpediente and dc.idprioridad=pd.idprioridad and ex.idexpediente=idexp;

  if(@dia>=2) then

    select date(@fecha) into @fec;
    select adddate(@fec, interval @dia day) into @fc;
    SELECT DATEDIFF(@fc,curdate()) into @dif;

    return concat(@dif,' dias');


  end if;

  if(@dia=1) then

    select adddate(@fecha, interval @dia day) into @fec;
    select timeDIFF(@fec,now()) into @hora;
    select hour(@hora) into @hor;

    return concat(@hor,' horas');

  end if;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `funfechesp`
--

DROP FUNCTION IF EXISTS `funfechesp`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `funfechesp`(fecha varchar(20)) RETURNS varchar(50) CHARSET utf8
BEGIN

  declare ndia varchar(20);
  declare fdia varchar(20);
  declare nmes varchar(20);
  declare fmes varchar(20);
  declare anio varchar(20);

  select day(fecha) into @fn;
  select dayname(fecha) into @nd;
  select monthname(fecha) into @nm;
  select year(fecha) into @an;

  set fdia = @nd;
  set fmes = @nm;

  if(fdia='Monday') then
    set ndia='Lunes';
  end if;

  if(fdia='Tuesday') then
    set ndia='Martes';
  end if;

  if(fdia='Wednesday') then
    set ndia='Miercoles';
  end if;

  if(fdia='Thursday') then
    set ndia='Jueves';
  end if;

  if(fdia='Friday') then
    set ndia='Viernes';
  end if;

  if(fdia='Saturday') then
    set ndia='Sabado';
  end if;

  if(fdia='Sunday') then
    set ndia='Domingo';
  end if;

  if(fmes='January') then
    set nmes='Enero';
  end if;

  if(fmes='February') then
    set nmes='Febrero';
  end if;

  if(fmes='March') then
    set nmes='Marzo';
  end if;

  if(fmes='April') then
    set nmes='Abril';
  end if;

  if(fmes='May') then
    set nmes='Mayo';
  end if;

  if(fmes='June') then
    set nmes='Junio';
  end if;
  if(fmes='July') then
    set nmes='Julio';
  end if;
  if(fmes='August') then
    set nmes='Agosto';
  end if;
  if(fmes='September') then
    set nmes='Setiembre';
  end if;
  if(fmes='October') then
    set nmes='Octubre';
  end if;
  if(fmes='November') then
    set nmes='Noviembre';
  end if;
  if(fmes='December') then
    set nmes='Diciembre';
  end if;
  return concat(ndia,', ',@fn,' de ',nmes,' del ',@an);

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `funfechingreso`
--

DROP FUNCTION IF EXISTS `funfechingreso`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `funfechingreso`(usuario varchar(50)) RETURNS varchar(50) CHARSET utf8
BEGIN


  declare nmes varchar(20);
  declare fmes varchar(20);
  declare anio varchar(20);

  select tb.fechingreso into @fecha
  from trabajador tb, usuario us
  where us.idtrabajador=tb.idtrabajador and us.idusuario=usuario;

  select monthname(@fecha) into @nm;
  select year(@fecha) into @an;

  set fmes = @nm;

  if(fmes='January') then
    set nmes='Ene';
  end if;

  if(fmes='February') then
    set nmes='Feb';
  end if;

  if(fmes='March') then
    set nmes='Mar';
  end if;

  if(fmes='April') then
    set nmes='Abr';
  end if;

  if(fmes='May') then
    set nmes='May';
  end if;

  if(fmes='June') then
    set nmes='Jun';
  end if;
  if(fmes='July') then
    set nmes='Jul';
  end if;
  if(fmes='August') then
    set nmes='Ago';
  end if;
  if(fmes='September') then
    set nmes='Set';
  end if;
  if(fmes='October') then
    set nmes='Oct';
  end if;
  if(fmes='November') then
    set nmes='Nov';
  end if;
  if(fmes='December') then
    set nmes='Dic';
  end if;

  return concat('Miembro desde ',nmes,'. ',@an);

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `funnom`
--

DROP FUNCTION IF EXISTS `funnom`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `funnom`(usu varchar(30)) RETURNS varchar(100) CHARSET utf8
BEGIN

select pr.nombres,pr.apellidos into @nmb, @pat
from persona pr, trabajador tb, usuario us
where us.idtrabajador=tb.idtrabajador
and tb.idpersona=pr.idpersona and us.idusuario=usu;

SELECT concat(SUBSTRING_INDEX(@nmb,' ', 1),' ',SUBSTRING_INDEX(@pat,' ', 1)) into @nmbpat;

return @nmbpat;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `funtipodoctit`
--

DROP FUNCTION IF EXISTS `funtipodoctit`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `funtipodoctit`(titulo varchar(200)) RETURNS int(11)
BEGIN

  declare posicion int;

  SELECT LOCATE('Nº', titulo) into @pos1;

  if(@pos1!=0) then

    set posicion=@pos1-1;

    select left(titulo,posicion) into @tipo;

    select idtipodocumento into @idtd
    from tipodocumento where tipodocumento=@tipo;

    return @idtd;
  else

    return 71;

  end if;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `funtitdoc`
--

DROP FUNCTION IF EXISTS `funtitdoc`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `funtitdoc`(idtpdc varchar(15), num varchar(15), idtb varchar(15)) RETURNS varchar(100) CHARSET utf8
BEGIN

  declare anio varchar(10);
  declare nms varchar(10);
  declare s1 varchar(10);
  declare s2 varchar(10);
  declare n char(1);
  declare a char(1);


  if(num<10) then
    set nms=concat('0',num);
    else
    set nms=num;
  end if;

  select  year(curdate()) into @anio;

  set anio=@anio;

  select td.tipodocumento into @tipodoc
  from tipodocumento td
  where td.idtipodocumento=idtpdc;

  select ar.siglas, ar.area_idarea into @sigla, @idsup
  from area ar, trabajador tb, usuario us
  where tb.idarea=ar.idarea and us.idtrabajador=tb.idtrabajador and tb.idtrabajador=idtb;

  set s2=concat('-',@sigla);

  if(@idsup!='1') then
      select ar.siglas into @ss from area ar where ar.idarea=@idsup;
      set s1=concat('-',@ss);
    else
      set s1='';
  end if;

  select pr.nombres, pr.apellidos into @nombre, @apellido
  from persona pr, trabajador tb
  where tb.idpersona=pr.idpersona
  and tb.idtrabajador=idtb;


  SELECT LEFT(@nombre, 1) into @nm;
  set n= @nm;

  SELECT LEFT(@apellido, 1) into @ap;
  set a= @ap;

  return concat(@tipodoc,' NRO. ',nms,'-',@anio,'-EMPRESA',s1,s2,'/',n,a);

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function `funusutra`
--

DROP FUNCTION IF EXISTS `funusutra`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `funusutra`(ti varchar(2), dr varchar(11)) RETURNS varchar(10) CHARSET utf8
BEGIN

  declare id varchar(10);

  if(ti=1) then 

    select count(*), pr.idpersona into @conp, @idper from persona pr where dni=dr;
    select count(*) into @cont from trabajador where idpersona=@idper;

    if(@cont<>0) then
      set id='1';
    else
      set id='2';
    end if;
  end if;

  if(ti=2) then 

    select count(*) into @coni from institucion where ruc=dr;

    if(@coni<>0) then
      set id='3';
    else
      set id='4';
    end if;
  end if;

  if(ti=3) then 

    select count(*) into @conp from persona pr where dni=dr and intext='0';

    if(@conp<>0) then
      set id='5';
    else
      set id='6';
    end if;
  end if;

  return id;

END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view `vta_derpro`
--

DROP TABLE IF EXISTS `vta_derpro`;
DROP VIEW IF EXISTS `vta_derpro`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_derpro` AS select `dr`.`idexpediente` AS `idexpediente`,`ex`.`expediente` AS `expediente`,`dc`.`documento` AS `documento`,`dc`.`asunto` AS `asunto`,`dc`.`folios` AS `folios`,`dc`.`observacion` AS `observacion`,`dr`.`deriva` AS `deriva`,`dr`.`fechderiva` AS `fecha`,`dc`.`fechrecepcion` AS `fechrecepcion`,`pd`.`proveido` AS `proveido`,`dc`.`ruta` AS `ruta`,`ex`.`idestadoexp` AS `idestadoexp`,`dc`.`idestadodoc` AS `idestadodoc`,concat(`sx`.`estadoexp`,' ',`sd`.`estadodoc`) AS `estado`,(select `a`.`idarea` from (`area` `a` join `trabajador` `tb` on((`tb`.`idarea` = `a`.`idarea`))) where (`tb`.`idtrabajador` = `dr`.`idtrabajadoring`)) AS `idarea`,`ar`.`siglas` AS `destino` from ((((((((`deriva` `dr` join `proveido` `pd`) join `deriva_has_proveido` `ph`) join `trabajador` `tb`) join `area` `ar`) join `expediente` `ex`) join `documento` `dc`) join `estadodoc` `sd`) join `estadoexp` `sx`) where ((`dr`.`idtrabajadordes` = `tb`.`idtrabajador`) and (`tb`.`idarea` = `ar`.`idarea`) and (`ph`.`idderiva` = `dr`.`idderiva`) and (`ph`.`idproveido` = `pd`.`idproveido`) and (`dc`.`idexpediente` = `ex`.`idexpediente`) and (`dr`.`idexpediente` = `ex`.`idexpediente`) and (`sx`.`idestadoexp` = `ex`.`idestadoexp`) and (`sd`.`idestadodoc` = `dc`.`idestadodoc`));

--
-- Definition of view `vta_directorio`
--

DROP TABLE IF EXISTS `vta_directorio`;
DROP VIEW IF EXISTS `vta_directorio`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_directorio` AS select `ar`.`idarea` AS `idarea`,`ar`.`area` AS `area`,`ar`.`siglas` AS `siglas`,`ar`.`telefono` AS `telefono`,`ar`.`anexo` AS `anexo`,`ar`.`correo` AS `correo`,`lc`.`local` AS `local`,`lc`.`direccion` AS `direccion`,`tb`.`responsable` AS `responsable`,concat(`pr`.`apellidos`,' ',`pr`.`nombres`) AS `autoridad`,`tb`.`estado` AS `estado` from (((`area` `ar` join `local` `lc`) join `trabajador` `tb`) join `persona` `pr`) where ((`ar`.`idlocal` = `lc`.`idlocal`) and (`tb`.`idpersona` = `pr`.`idpersona`) and (`tb`.`idarea` = `ar`.`idarea`));

--
-- Definition of view `vta_docarea`
--

DROP TABLE IF EXISTS `vta_docarea`;
DROP VIEW IF EXISTS `vta_docarea`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_docarea` AS select `ex`.`idexpediente` AS `idexpediente`,`ex`.`expediente` AS `expediente`,`dc`.`iddocumento` AS `iddocumento`,`dc`.`documento` AS `documento`,`dc`.`asunto` AS `asunto`,`dc`.`folios` AS `folios`,`dc`.`fechrecepcion` AS `fecha`,`dc`.`fechingsist` AS `fechingsist`,`dc`.`observacion` AS `observacion`,`dc`.`idtipodocumento` AS `idtipodocumento`,`dc`.`tipoingreso` AS `tipoingreso`,`dc`.`idpersona` AS `idpersona`,`dc`.`idtrabajador` AS `idtrabajador`,`pd`.`idprioridad` AS `idprioridad`,`pd`.`prioridad` AS `prioridad`,`pd`.`dias` AS `dias`,`dc`.`ruta` AS `ruta`,`sx`.`idestadoexp` AS `idestadoexp`,`sd`.`idestadodoc` AS `idestadodoc`,concat(`sx`.`estadoexp`,' ',`sd`.`estadodoc`) AS `estado`,`ar`.`idarea` AS `idarea` from (((((`expediente` `ex` join `documento` `dc`) join `area` `ar`) join `prioridad` `pd`) join `estadodoc` `sd`) join `estadoexp` `sx`) where ((`dc`.`idexpediente` = `ex`.`idexpediente`) and (`dc`.`idprioridad` = `pd`.`idprioridad`) and (`ex`.`idarea` = `ar`.`idarea`) and (`dc`.`idestadodoc` = `sd`.`idestadodoc`) and (`ex`.`idestadoexp` = `sx`.`idestadoexp`));

--
-- Definition of view `vta_documento`
--

DROP TABLE IF EXISTS `vta_documento`;
DROP VIEW IF EXISTS `vta_documento`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_documento` AS select `dc`.`documento` AS `documento`,`dc`.`asunto` AS `asunto`,`dc`.`folios` AS `folios`,`dc`.`observacion` AS `observacion`,`dc`.`fechrecepcion` AS `fechrecepcion`,`dc`.`fechingsist` AS `fechingsist`,`dc`.`confidencialidad` AS `confidencialidad`,`dc`.`ruta` AS `ruta`,`dc`.`tipoingreso` AS `tipoingreso`,`dc`.`idreferencia` AS `idreferencia`,`ex`.`idexpediente` AS `idexpediente`,`ex`.`expediente` AS `expediente`,`pd`.`idprioridad` AS `idprioridad`,`pd`.`prioridad` AS `prioridad`,`ar`.`idarea` AS `idarea`,`ar`.`area` AS `area`,`ar`.`siglas` AS `siglas`,`an`.`idanio` AS `idanio`,`an`.`anio` AS `anio`,`an`.`nombre` AS `nombre`,`sx`.`idestadoexp` AS `idestadoexp`,`sx`.`estadoexp` AS `estadoexp`,`sd`.`idestadodoc` AS `idestadodoc`,`sd`.`estadodoc` AS `estadodoc` from (((((((`expediente` `ex` join `documento` `dc`) join `prioridad` `pd`) join `area` `ar`) join `anio` `an`) join `tipodocumento` `tp`) join `estadoexp` `sx`) join `estadodoc` `sd`) where ((`dc`.`idexpediente` = `ex`.`idexpediente`) and (`dc`.`idtipodocumento` = `tp`.`idtipodocumento`) and (`dc`.`idprioridad` = `pd`.`idprioridad`) and (`ex`.`idarea` = `ar`.`idarea`) and (`ex`.`idanio` = `an`.`idanio`) and (`dc`.`idestadodoc` = `sd`.`idestadodoc`) and (`ex`.`idestadoexp` = `sx`.`idestadoexp`));

--
-- Definition of view `vta_empleado`
--

DROP TABLE IF EXISTS `vta_empleado`;
DROP VIEW IF EXISTS `vta_empleado`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_empleado` AS select `pr`.`idpersona` AS `idpersona`,`pr`.`dni` AS `dni`,`pr`.`ruc` AS `ruc`,`pr`.`apellidos` AS `apellidos`,`pr`.`nombres` AS `nombres`,`pr`.`fechnac` AS `fechnac`,`pr`.`genero` AS `genero`,`pr`.`direccion` AS `direccion`,`pr`.`telefono1` AS `telefono1`,`pr`.`telefono2` AS `telefono2`,`pr`.`correo1` AS `correo1`,`pr`.`correo2` AS `correo2`,`pr`.`intext` AS `intext`,`pr`.`idlocal` AS `idlocal`,`tr`.`idtrabajador` AS `idtrabajador`,`tr`.`responsable` AS `responsable`,`tr`.`fechingreso` AS `fechingreso`,`tr`.`resingreso` AS `resingreso`,`tr`.`fechcese` AS `fechcese`,`tr`.`rescese` AS `rescese`,`tr`.`estado` AS `estado`,concat(`ds`.`distrito`,' - ',`pv`.`provincia`,' - ',`dp`.`departamento`) AS `procedencia`,`cr`.`cargo` AS `cargo`,`ar`.`area` AS `area`,`ar`.`idarea` AS `idarea`,`cr`.`idcargo` AS `idcargo`,`md`.`idmodalidad` AS `idmodalidad`,`md`.`modalidad` AS `modalidad`,`lc`.`idlocal` AS `ilocal`,`lc`.`local` AS `local`,`lc`.`direccion` AS `idireccion` from ((((((((`persona` `pr` join `distrito` `ds`) join `provincia` `pv`) join `departamento` `dp`) join `cargo` `cr`) join `area` `ar`) join `trabajador` `tr`) join `modalidad` `md`) join `local` `lc`) where ((`pr`.`idlocal` = `ds`.`iddistrito`) and (`ds`.`idlocal` = `pv`.`idprovincia`) and (`pv`.`idlocal` = `dp`.`iddepartamento`) and (`ar`.`idlocal` = `lc`.`idlocal`) and (`tr`.`idpersona` = `pr`.`idpersona`) and (`tr`.`idarea` = `ar`.`idarea`) and (`tr`.`idcargo` = `cr`.`idcargo`) and (`tr`.`idmodalidad` = `md`.`idmodalidad`));

--
-- Definition of view `vta_institucion`
--

DROP TABLE IF EXISTS `vta_institucion`;
DROP VIEW IF EXISTS `vta_institucion`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_institucion` AS select `it`.`idinstitucion` AS `idinstitucion`,`it`.`ruc` AS `ruc`,`it`.`razonsocial` AS `razonsocial`,`it`.`correo` AS `correo`,`it`.`direccion` AS `direccion`,`it`.`telefono` AS `telefono`,`pr`.`idpersona` AS `idpersona`,`pr`.`dni` AS `dni`,`pr`.`apellidos` AS `apellidos`,`pr`.`nombres` AS `nombres`,`ti`.`tipoinstitucion` AS `tipoinstitucion`,concat(`ds`.`distrito`,'-',`pv`.`provincia`,'-',`dp`.`departamento`) AS `procedencia`,`it`.`idtipoinstitucion` AS `idtipoinstitucion`,`it`.`idlocal` AS `idlocal` from (((((`persona` `pr` join `institucion` `it`) join `tipoinstitucion` `ti`) join `distrito` `ds`) join `provincia` `pv`) join `departamento` `dp`) where ((`it`.`idpersona` = `pr`.`idpersona`) and (`it`.`idtipoinstitucion` = `ti`.`idtipoinstitucion`) and (`it`.`idlocal` = `ds`.`iddistrito`) and (`ds`.`idlocal` = `pv`.`idprovincia`) and (`pv`.`idlocal` = `dp`.`iddepartamento`));

--
-- Definition of view `vta_persona`
--

DROP TABLE IF EXISTS `vta_persona`;
DROP VIEW IF EXISTS `vta_persona`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_persona` AS select `pr`.`idpersona` AS `idpersona`,`pr`.`dni` AS `dni`,`pr`.`ruc` AS `ruc`,`pr`.`apellidos` AS `apellidos`,`pr`.`nombres` AS `nombres`,`pr`.`fechnac` AS `fechnac`,`pr`.`genero` AS `genero`,`pr`.`direccion` AS `direccion`,`pr`.`telefono1` AS `telefono1`,`pr`.`telefono2` AS `telefono2`,`pr`.`correo1` AS `correo1`,`pr`.`correo2` AS `correo2`,`pr`.`intext` AS `intext`,`pr`.`idlocal` AS `idlocal`,concat(`ds`.`distrito`,' - ',`pv`.`provincia`,' - ',`dp`.`departamento`) AS `procedencia` from (((`persona` `pr` join `distrito` `ds`) join `provincia` `pv`) join `departamento` `dp`) where ((`pr`.`idlocal` = `ds`.`iddistrito`) and (`ds`.`idlocal` = `pv`.`idprovincia`) and (`pv`.`idlocal` = `dp`.`iddepartamento`));

--
-- Definition of view `vta_recepciondoc`
--

DROP TABLE IF EXISTS `vta_recepciondoc`;
DROP VIEW IF EXISTS `vta_recepciondoc`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_recepciondoc` AS select `ex`.`idexpediente` AS `idexpediente`,`ex`.`expediente` AS `expediente`,`ex`.`idestadoexp` AS `idestadoexp`,`dc`.`documento` AS `documento`,`dc`.`asunto` AS `asunto`,`dc`.`folios` AS `folios`,`dc`.`observacion` AS `observacion`,`dc`.`idestadodoc` AS `idestadodoc`,`dc`.`ruta` AS `ruta`,`dc`.`fechrecepcion` AS `fechrecepcion`,`dr`.`idderiva` AS `idderiva`,`dr`.`deriva` AS `deriva`,`dr`.`fechderiva` AS `fecha`,`dr`.`circular` AS `circular`,`ar`.`idarea` AS `idarea`,`ar`.`siglas` AS `destino`,(select `ar`.`siglas` from (`area` `ar` join `trabajador` `tb` on((`tb`.`idarea` = `ar`.`idarea`))) where (`tb`.`idtrabajador` = `dr`.`idtrabajadoring`)) AS `origen`,(select `us`.`ruta` from (`trabajador` `t` join `usuario` `us` on((`us`.`idtrabajador` = `t`.`idtrabajador`))) where (`t`.`idtrabajador` = `dr`.`idtrabajadoring`)) AS `foto` from ((((`deriva` `dr` join `trabajador` `tb`) join `area` `ar`) join `expediente` `ex`) join `documento` `dc`) where ((`dr`.`idtrabajadordes` = `tb`.`idtrabajador`) and (`tb`.`idarea` = `ar`.`idarea`) and (`dc`.`idexpediente` = `ex`.`idexpediente`) and (`dr`.`idexpediente` = `ex`.`idexpediente`));

--
-- Definition of view `vta_reporte`
--

DROP TABLE IF EXISTS `vta_reporte`;
DROP VIEW IF EXISTS `vta_reporte`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_reporte` AS select `dr`.`idderiva` AS `idderiva`,`dr`.`circular` AS `circular`,`dc`.`documento` AS `documento`,`dc`.`asunto` AS `asunto`,`dc`.`folios` AS `folios`,`dc`.`observacion` AS `observacion`,`dc`.`fechrecepcion` AS `fechrecepcion`,cast(`dr`.`fechderiva` as date) AS `fecha`,`dc`.`fechingsist` AS `fechingsist`,`dc`.`iddocumento` AS `iddocumento`,`ex`.`idexpediente` AS `idexpediente`,`ex`.`expediente` AS `expediente`,`ar`.`idarea` AS `idarea`,`pd`.`dias` AS `dias`,`pd`.`prioridad` AS `prioridad`,`sx`.`idestadoexp` AS `idestadoexp`,`sx`.`estadoexp` AS `estadoexp`,`sc`.`idestadodoc` AS `idestadodoc`,`sc`.`estadodoc` AS `estadodoc`,(select `ar`.`siglas` from (`area` `ar` join `trabajador` `tb` on((`tb`.`idarea` = `ar`.`idarea`))) where (`tb`.`idtrabajador` = `dr`.`idtrabajadoring`)) AS `origen`,(select `ar`.`siglas` from (`area` `ar` join `trabajador` `tb` on((`tb`.`idarea` = `ar`.`idarea`))) where (`tb`.`idtrabajador` = `dr`.`idtrabajadordes`)) AS `destino` from (((((((`deriva` `dr` join `trabajador` `tb`) join `area` `ar`) join `expediente` `ex`) join `documento` `dc`) join `prioridad` `pd`) join `estadodoc` `sc`) join `estadoexp` `sx`) where ((`dr`.`idtrabajadoring` = `tb`.`idtrabajador`) and (`tb`.`idarea` = `ar`.`idarea`) and (`ex`.`idestadoexp` = `sx`.`idestadoexp`) and (`dc`.`idestadodoc` = `sc`.`idestadodoc`) and (`dr`.`idexpediente` = `ex`.`idexpediente`) and (`dc`.`idexpediente` = `ex`.`idexpediente`) and (`dc`.`idprioridad` = `pd`.`idprioridad`));

--
-- Definition of view `vta_reportedis`
--

DROP TABLE IF EXISTS `vta_reportedis`;
DROP VIEW IF EXISTS `vta_reportedis`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_reportedis` AS select `dv`.`idexpediente` AS `idexpediente`,`ex`.`expediente` AS `expediente`,`dc`.`documento` AS `documento`,`dc`.`asunto` AS `asunto`,`dc`.`folios` AS `folios`,`dc`.`observacion` AS `observacion`,`dv`.`deriva` AS `deriva`,cast(`dv`.`fechderiva` as date) AS `fecha`,`dc`.`fechrecepcion` AS `fechrecepcion`,cast(`dc`.`fechrecepcion` as date) AS `fecha1`,`dc`.`ruta` AS `ruta`,`ar`.`idarea` AS `idarea`,`ex`.`idestadoexp` AS `idestadoexp`,`dc`.`idestadodoc` AS `idestadodoc`,(select `ar`.`siglas` from (`area` `ar` join `trabajador` `tb` on((`tb`.`idarea` = `ar`.`idarea`))) where (`tb`.`idtrabajador` = `dv`.`idtrabajadoring`)) AS `origen`,(select `ar`.`siglas` from (`area` `ar` join `trabajador` `tb` on((`tb`.`idarea` = `ar`.`idarea`))) where (`tb`.`idtrabajador` = `dv`.`idtrabajadordes`)) AS `destino` from ((`documento` `dc` left join (`expediente` `ex` left join `deriva` `dv` on((`ex`.`idexpediente` = `dv`.`idexpediente`))) on((`ex`.`idexpediente` = `dc`.`idexpediente`))) join `area` `ar` on((`ar`.`idarea` = `ex`.`idarea`)));

--
-- Definition of view `vta_reportedis2`
--

DROP TABLE IF EXISTS `vta_reportedis2`;
DROP VIEW IF EXISTS `vta_reportedis2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_reportedis2` AS select `dc`.`iddocumento` AS `iddocumento`,`dc`.`documento` AS `documento`,`dc`.`asunto` AS `asunto`,`dc`.`folios` AS `folios`,`dc`.`observacion` AS `observacion`,`dc`.`fechrecepcion` AS `fechrecepcion`,`dc`.`fechingsist` AS `fechingsist`,`dc`.`ruta` AS `ruta`,`sd`.`idestadodoc` AS `idestadodoc`,`sd`.`estadodoc` AS `estadodoc`,`sx`.`idestadoexp` AS `idestadoexp`,`sx`.`estadoexp` AS `estadoexp`,`ex`.`idexpediente` AS `idexpediente`,`ex`.`expediente` AS `expediente`,`ar`.`idarea` AS `idarea`,`ar`.`area` AS `area`,`dr`.`idderiva` AS `idderiva`,`dr`.`deriva` AS `deriva`,`dr`.`fechderiva` AS `fechderiva`,(select `ar`.`siglas` from (`area` `ar` join `trabajador` `tb` on((`tb`.`idarea` = `ar`.`idarea`))) where (`tb`.`idtrabajador` = `dr`.`idtrabajadordes`)) AS `destino` from (((((`expediente` `ex` join `documento` `dc`) join `area` `ar`) join `deriva` `dr`) join `estadoexp` `sx`) join `estadodoc` `sd`) where ((`dc`.`idexpediente` = `ex`.`idexpediente`) and (`dc`.`idestadodoc` = `sd`.`idestadodoc`) and (`ex`.`idarea` = `ar`.`idarea`) and (`dr`.`idexpediente` = `ex`.`idexpediente`) and (`ex`.`idestadoexp` = `sx`.`idestadoexp`));

--
-- Definition of view `vta_reportemit`
--

DROP TABLE IF EXISTS `vta_reportemit`;
DROP VIEW IF EXISTS `vta_reportemit`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_reportemit` AS select `dc`.`iddocumento` AS `iddocumento`,`dc`.`documento` AS `documento`,`dc`.`asunto` AS `asunto`,`dc`.`folios` AS `folios`,`dc`.`observacion` AS `observacion`,`dc`.`fechrecepcion` AS `fechrecepcion`,`dc`.`fechingsist` AS `fechingsist`,`dc`.`tipoingreso` AS `tipoingreso`,`dc`.`idpersona` AS `idpersona`,`ex`.`idexpediente` AS `idexpediente`,`ex`.`expediente` AS `expediente`,`ar`.`idarea` AS `idarea`,`ar`.`area` AS `area`,`ar`.`siglas` AS `siglas`,`ar`.`idlocal` AS `idlocal`,`dv`.`idderiva` AS `idderiva`,`dv`.`fechderiva` AS `fechderiva` from ((`documento` `dc` left join (`expediente` `ex` join `area` `ar` on((`ex`.`idarea` = `ar`.`idarea`))) on((`dc`.`idexpediente` = `ex`.`idexpediente`))) left join `deriva` `dv` on((`dv`.`idexpediente` = `ex`.`idexpediente`)));

--
-- Definition of view `vta_reporterec`
--

DROP TABLE IF EXISTS `vta_reporterec`;
DROP VIEW IF EXISTS `vta_reporterec`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_reporterec` AS select `dc`.`iddocumento` AS `iddocumento`,`dc`.`documento` AS `documento`,`dc`.`asunto` AS `asunto`,`dc`.`folios` AS `folios`,`dc`.`observacion` AS `observacion`,`dc`.`fechrecepcion` AS `fechrecepcion`,`dc`.`fechingsist` AS `fechingsist`,`dc`.`confidencialidad` AS `confidencialidad`,`dc`.`ruta` AS `ruta`,`dc`.`tipoingreso` AS `tipoingreso`,`dc`.`idreferencia` AS `idreferencia`,`ex`.`idexpediente` AS `idexpediente`,`ex`.`expediente` AS `expediente`,`ar`.`idarea` AS `idarea`,`ar`.`area` AS `area`,`sx`.`idestadoexp` AS `idestadoexp`,`sx`.`estadoexp` AS `estadoexp`,`sd`.`idestadodoc` AS `idestadodoc`,`sd`.`estadodoc` AS `estadodoc`,`dr`.`idderiva` AS `idderiva`,`dr`.`fechderiva` AS `fechderiva`,`pd`.`dias` AS `plazo`,(select `ar`.`siglas` from (`area` `ar` join `trabajador` `tb` on((`tb`.`idarea` = `ar`.`idarea`))) where (`tb`.`idtrabajador` = `dr`.`idtrabajadoring`)) AS `origen`,(select `ar`.`siglas` from (`area` `ar` join `trabajador` `tb` on((`tb`.`idarea` = `ar`.`idarea`))) where (`tb`.`idtrabajador` = `dr`.`idtrabajadordes`)) AS `destino` from (((((((`expediente` `ex` join `documento` `dc`) join `deriva` `dr`) join `trabajador` `tb`) join `area` `ar`) join `prioridad` `pd`) join `estadodoc` `sd`) join `estadoexp` `sx`) where ((`dc`.`idexpediente` = `ex`.`idexpediente`) and (`dr`.`idexpediente` = `ex`.`idexpediente`) and (`dr`.`idtrabajadordes` = `tb`.`idtrabajador`) and (`tb`.`idarea` = `ar`.`idarea`) and (`dc`.`idprioridad` = `pd`.`idprioridad`) and (`ex`.`idestadoexp` = `sx`.`idestadoexp`) and (`dc`.`idestadodoc` = `sd`.`idestadodoc`)) order by `dr`.`fechderiva`;

--
-- Definition of view `vta_rptdocdis`
--

DROP TABLE IF EXISTS `vta_rptdocdis`;
DROP VIEW IF EXISTS `vta_rptdocdis`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_rptdocdis` AS select `ar`.`idarea` AS `idarea`,`ar`.`siglas` AS `siglas`,`ex`.`idexpediente` AS `idexpediente`,`ex`.`expediente` AS `expediente`,`ex`.`idanio` AS `idanio`,`sx`.`idestadoexp` AS `idestadoexp`,`sx`.`estadoexp` AS `estadoexp`,`dc`.`documento` AS `documento`,`dc`.`asunto` AS `asunto`,`dc`.`folios` AS `folios`,`dc`.`observacion` AS `observacion`,`dc`.`fechrecepcion` AS `fechrecepcion`,`dc`.`fechingsist` AS `fechingsist`,`dc`.`confidencialidad` AS `confidencialidad`,`dc`.`ruta` AS `ruta`,`dc`.`tipoingreso` AS `tipoingreso`,`dc`.`idpersona` AS `idpersona`,`dc`.`idtipodocumento` AS `idtipodocumento`,`dc`.`idprioridad` AS `idprioridad`,(select `sd`.`estadodoc` from (`estadodoc` `sd` join `documento` `dt` on((`dt`.`idestadodoc` = `sd`.`idestadodoc`))) where (`dt`.`iddocumento` = `dc`.`iddocumento`)) AS `prioridad`,`dc`.`idreferencia` AS `idreferencia`,`dc`.`idestadodoc` AS `idestadodoc`,`dv`.`idderiva` AS `idderiva`,`dv`.`deriva` AS `deriva`,`dv`.`fechderiva` AS `fechderiva`,`dv`.`circular` AS `circular`,(select `aa`.`siglas` from (`area` `aa` join `trabajador` `tb` on((`tb`.`idarea` = `aa`.`idarea`))) where (`tb`.`idtrabajador` = `dv`.`idtrabajadordes`)) AS `destino`,(select `dh`.`idproveido` from (`deriva_has_proveido` `dh` left join `deriva` `dr` on((`dh`.`idderiva` = `dr`.`idderiva`))) where (`dh`.`idderiva` = `dv`.`idderiva`)) AS `idproveido` from ((((`expediente` `ex` join `area` `ar` on((`ex`.`idarea` = `ar`.`idarea`))) join `documento` `dc` on((`dc`.`idexpediente` = `ex`.`idexpediente`))) join `estadoexp` `sx` on((`ex`.`idestadoexp` = `sx`.`idestadoexp`))) left join `deriva` `dv` on((`dv`.`idexpediente` = `ex`.`idexpediente`)));

--
-- Definition of view `vta_seguimiento`
--

DROP TABLE IF EXISTS `vta_seguimiento`;
DROP VIEW IF EXISTS `vta_seguimiento`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_seguimiento` AS select `dc`.`iddocumento` AS `iddocumento`,`dc`.`documento` AS `documento`,`dc`.`asunto` AS `asunto`,`dc`.`folios` AS `folios`,`dc`.`observacion` AS `observacion`,`dc`.`fechrecepcion` AS `fechrecepcion`,`dc`.`fechingsist` AS `fechingsist`,`dc`.`confidencialidad` AS `confidencialidad`,`dc`.`ruta` AS `ruta`,`dc`.`tipoingreso` AS `tipoingreso`,`dc`.`idreferencia` AS `idreferencia`,`ex`.`idexpediente` AS `idexpediente`,`ex`.`expediente` AS `expediente`,`ar`.`idarea` AS `idarea`,`ar`.`area` AS `area`,`sx`.`idestadoexp` AS `idestadoexp`,`sx`.`estadoexp` AS `estadoexp`,`sd`.`idestadodoc` AS `idestadodoc`,`sd`.`estadodoc` AS `estadodoc`,`dr`.`idderiva` AS `idderiva`,`dr`.`fechderiva` AS `fechderiva`,(to_days(cast(`dr`.`fechderiva` as date)) - to_days(cast(`dc`.`fechrecepcion` as date))) AS `dias`,timediff(cast(`dr`.`fechderiva` as time),cast(`dc`.`fechrecepcion` as time)) AS `horas`,`pd`.`dias` AS `plazo`,(select `ar`.`siglas` from (`area` `ar` join `trabajador` `tb` on((`tb`.`idarea` = `ar`.`idarea`))) where (`tb`.`idtrabajador` = `dr`.`idtrabajadoring`)) AS `origen`,(select `ar`.`siglas` from (`area` `ar` join `trabajador` `tb` on((`tb`.`idarea` = `ar`.`idarea`))) where (`tb`.`idtrabajador` = `dr`.`idtrabajadordes`)) AS `destino` from (((((((`expediente` `ex` join `documento` `dc`) join `deriva` `dr`) join `trabajador` `tb`) join `area` `ar`) join `prioridad` `pd`) join `estadodoc` `sd`) join `estadoexp` `sx`) where ((`dc`.`idexpediente` = `ex`.`idexpediente`) and (`dr`.`idexpediente` = `ex`.`idexpediente`) and (`dr`.`idtrabajadoring` = `tb`.`idtrabajador`) and (`tb`.`idarea` = `ar`.`idarea`) and (`dc`.`idprioridad` = `pd`.`idprioridad`) and (`ex`.`idestadoexp` = `sx`.`idestadoexp`) and (`dc`.`idestadodoc` = `sd`.`idestadodoc`)) order by `dr`.`fechderiva`;

--
-- Definition of view `vta_sinusu`
--

DROP TABLE IF EXISTS `vta_sinusu`;
DROP VIEW IF EXISTS `vta_sinusu`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_sinusu` AS select `tb`.`idtrabajador` AS `idtrabajador`,`tb`.`responsable` AS `responsable`,`tb`.`fechingreso` AS `fechingreso`,`tb`.`resingreso` AS `resingreso`,`tb`.`fechcese` AS `fechcese`,`tb`.`rescese` AS `rescese`,`tb`.`estado` AS `estado`,`tb`.`idcargo` AS `idcargo`,`cr`.`cargo` AS `cargo`,`tb`.`idmodalidad` AS `idmodalidad`,`tb`.`idcategoria` AS `idcategoria`,`tb`.`idpersona` AS `idpersona`,`tb`.`idarea` AS `idarea`,`ar`.`area` AS `area`,`pr`.`dni` AS `dni`,`pr`.`ruc` AS `ruc`,`pr`.`apellidos` AS `apellidos`,`pr`.`nombres` AS `nombres`,`pr`.`fechnac` AS `fechnac`,`pr`.`genero` AS `genero`,`pr`.`direccion` AS `direccion`,`pr`.`telefono1` AS `telefono1`,`pr`.`telefono2` AS `telefono2`,`pr`.`correo1` AS `correo1`,`pr`.`correo2` AS `correo2`,`pr`.`intext` AS `intext`,`pr`.`idlocal` AS `idlocal`,`us`.`idusuario` AS `idusuario`,`us`.`ruta` AS `ruta`,`us`.`idtipousuario` AS `idtipousuario` from ((((`persona` `pr` left join `trabajador` `tb` on((`tb`.`idpersona` = `pr`.`idpersona`))) left join `usuario` `us` on((`tb`.`idtrabajador` = `us`.`idtrabajador`))) join `area` `ar` on((`tb`.`idarea` = `ar`.`idarea`))) join `cargo` `cr` on((`tb`.`idcargo` = `cr`.`idcargo`))) where (isnull(`tb`.`idpersona`) or isnull(`us`.`idtrabajador`));

--
-- Definition of view `vta_usuario`
--

DROP TABLE IF EXISTS `vta_usuario`;
DROP VIEW IF EXISTS `vta_usuario`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vta_usuario` AS select `pr`.`idpersona` AS `idpersona`,`pr`.`dni` AS `dni`,`pr`.`ruc` AS `ruc`,`pr`.`apellidos` AS `apellidos`,`pr`.`nombres` AS `nombres`,`pr`.`fechnac` AS `fechnac`,`pr`.`genero` AS `genero`,`pr`.`direccion` AS `direccion`,`pr`.`telefono1` AS `telefono1`,`pr`.`telefono2` AS `telefono2`,`pr`.`correo1` AS `correo1`,`pr`.`correo2` AS `correo2`,`pr`.`intext` AS `intext`,`pr`.`idlocal` AS `idlocal`,`tr`.`idtrabajador` AS `idtrabajador`,`tr`.`responsable` AS `responsable`,`tr`.`fechingreso` AS `fechingreso`,`tr`.`resingreso` AS `resingreso`,`tr`.`fechcese` AS `fechcese`,`tr`.`rescese` AS `rescese`,`tr`.`estado` AS `estado`,concat(`ds`.`distrito`,' - ',`pv`.`provincia`,' - ',`dp`.`departamento`) AS `procedencia`,`cr`.`idcargo` AS `idcargo`,`cr`.`cargo` AS `cargo`,`ar`.`siglas` AS `siglas`,`ar`.`area` AS `area`,`ar`.`idarea` AS `idarea`,`md`.`idmodalidad` AS `idmodalidad`,`md`.`modalidad` AS `modalidad`,`us`.`idusuario` AS `idusuario`,`lc`.`local` AS `local`,`lc`.`idlocal` AS `ilocal`,`lc`.`direccion` AS `idireccion` from (((((((((`persona` `pr` join `distrito` `ds`) join `provincia` `pv`) join `departamento` `dp`) join `cargo` `cr`) join `area` `ar`) join `trabajador` `tr`) join `modalidad` `md`) join `usuario` `us`) join `local` `lc`) where ((`pr`.`idlocal` = `ds`.`iddistrito`) and (`ds`.`idlocal` = `pv`.`idprovincia`) and (`pv`.`idlocal` = `dp`.`iddepartamento`) and (`tr`.`idpersona` = `pr`.`idpersona`) and (`tr`.`idarea` = `ar`.`idarea`) and (`tr`.`idcargo` = `cr`.`idcargo`) and (`tr`.`idmodalidad` = `md`.`idmodalidad`) and (`us`.`idtrabajador` = `tr`.`idtrabajador`) and (`ar`.`idlocal` = `lc`.`idlocal`));



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;