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
-- Create schema stdunasam
--

CREATE DATABASE IF NOT EXISTS stdunasam;
USE stdunasam;

--
-- Temporary table structure for view `ver_documento`
--
DROP TABLE IF EXISTS `ver_documento`;
DROP VIEW IF EXISTS `ver_documento`;
CREATE TABLE `ver_documento` (
  `idDocumento` int(11),
  `Expediente` char(15),
  `Documento` varchar(200),
  `Referencia` varchar(200),
  `Asunto` varchar(80),
  `Folios` int(11),
  `Tomos` varchar(15),
  `Fecha de Recepcion` varchar(10),
  `Fecha de ingreso` varchar(22),
  `Ingreso` varchar(45),
  `Prioridad` varchar(45),
  `Categoria` varchar(45),
  `Institucion ingreso` varchar(100),
  `Apellidos y Nombres` varchar(201),
  `Area ingreso` varchar(45),
  `Recepcionado` varchar(201)
);

--
-- Temporary table structure for view `ver_institucion`
--
DROP TABLE IF EXISTS `ver_institucion`;
DROP VIEW IF EXISTS `ver_institucion`;
CREATE TABLE `ver_institucion` (
  `idInstitucion` int(11),
  `Institucion` varchar(100),
  `Direccion` varchar(45),
  `Telefono` varchar(45),
  `DNI representante` char(8),
  `Apellidos y Nombres` varchar(201),
  `Tipo de Entidad` varchar(45),
  `Departamento` varchar(45),
  `Provincia` varchar(45),
  `Distrito` varchar(45)
);

--
-- Temporary table structure for view `ver_trabajador`
--
DROP TABLE IF EXISTS `ver_trabajador`;
DROP VIEW IF EXISTS `ver_trabajador`;
CREATE TABLE `ver_trabajador` (
  `idTrabajador` int(11),
  `DNI` char(8),
  `apellidos` varchar(100),
  `nombres` varchar(100),
  `sexo` varchar(1),
  `Direccion` varchar(100),
  `telefono` varchar(45),
  `E-Mail` varchar(45),
  `Departamento` varchar(45),
  `Provincia` varchar(45),
  `Distrito` varchar(45),
  `Area` varchar(45),
  `Cargo` varchar(45)
);

--
-- Definition of table `ano`
--

DROP TABLE IF EXISTS `ano`;
CREATE TABLE `ano` (
  `idANO` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` year(4) NOT NULL,
  PRIMARY KEY (`idANO`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ano`
--

/*!40000 ALTER TABLE `ano` DISABLE KEYS */;
INSERT INTO `ano` (`idANO`,`nombre`) VALUES 
 (1,2016);
/*!40000 ALTER TABLE `ano` ENABLE KEYS */;


--
-- Definition of table `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `idArea` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idArea`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `area`
--

/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` (`idArea`,`nombre`,`descripcion`) VALUES 
 (1,'MESA DE PARTES',NULL),
 (2,'DIRECCION',NULL),
 (3,'FACULTAD DE CIENCIAS',NULL),
 (4,'AREA DE PERSONAL',NULL),
 (5,'LOGISTICA',NULL);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;


--
-- Definition of table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `idCARGO` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idCARGO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cargo`
--

/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` (`idCARGO`,`Nombre`) VALUES 
 (1,'ADMINISTRADOR'),
 (2,'SECRETARIO'),
 (3,'JEFE');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;


--
-- Definition of table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `idCATEGORIA` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categoria`
--

/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`idCATEGORIA`,`Nombre`) VALUES 
 (1,'OFICIO'),
 (2,'MEMORANDUM'),
 (3,'SOLICITUD');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


--
-- Definition of table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `idDEPARTAMENTO` char(2) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idDEPARTAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departamento`
--

/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` (`idDEPARTAMENTO`,`nombre`) VALUES 
 ('01','AMAZONAS'),
 ('02','ANCASH'),
 ('03','APURIMAC'),
 ('04','AREQUIPA'),
 ('05','AYACUCHO'),
 ('06','CAJAMARCA'),
 ('07','CUSCO'),
 ('08','HUANCAVELICA'),
 ('09','HUANUCO'),
 ('10','ICA'),
 ('11','JUNIN'),
 ('12','LA LIBERTAD'),
 ('13','LAMBAYEQUE'),
 ('14','LIMA'),
 ('15','LORETO'),
 ('16','MADRE DE DIOS'),
 ('17','MOQUEGUA'),
 ('18','PASCO'),
 ('19','PIURA'),
 ('20','PUNO'),
 ('21','SAN MARTIN'),
 ('22','TACNA'),
 ('23','TUMBES'),
 ('24','CALLAO'),
 ('25','UCAYALI');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;


--
-- Definition of table `derivacion`
--

DROP TABLE IF EXISTS `derivacion`;
CREATE TABLE `derivacion` (
  `idDeriv` int(11) NOT NULL AUTO_INCREMENT,
  `idTrabajador` int(11) NOT NULL,
  `Fecha_der` datetime NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `f_control` datetime DEFAULT NULL,
  `idExpediente` int(11) NOT NULL,
  PRIMARY KEY (`idDeriv`,`idTrabajador`),
  KEY `fk_DERIVACION_TRABAJADOR1_idx` (`idTrabajador`),
  KEY `fk_DERIVACION_Expediente1_idx` (`idExpediente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `derivacion`
--

/*!40000 ALTER TABLE `derivacion` DISABLE KEYS */;
INSERT INTO `derivacion` (`idDeriv`,`idTrabajador`,`Fecha_der`,`descripcion`,`f_control`,`idExpediente`) VALUES 
 (1,1,'2016-06-09 11:09:41',NULL,NULL,1),
 (2,1,'2016-06-09 11:10:04',NULL,NULL,2),
 (3,3,'2016-06-09 11:12:05',NULL,NULL,2),
 (4,2,'2016-06-09 11:12:29',NULL,NULL,1),
 (5,2,'2016-06-09 12:01:42',NULL,NULL,3),
 (6,2,'2016-06-09 12:10:57',NULL,NULL,4);
/*!40000 ALTER TABLE `derivacion` ENABLE KEYS */;


--
-- Definition of table `derivacion_has_proveido`
--

DROP TABLE IF EXISTS `derivacion_has_proveido`;
CREATE TABLE `derivacion_has_proveido` (
  `idDeriv` int(11) NOT NULL,
  `idTrabajador` int(11) NOT NULL,
  `idProveido` int(11) NOT NULL,
  PRIMARY KEY (`idDeriv`,`idTrabajador`,`idProveido`),
  KEY `fk_DERIVACION_has_Proveido_Proveido1_idx` (`idProveido`),
  KEY `fk_DERIVACION_has_Proveido_DERIVACION1_idx` (`idDeriv`,`idTrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `derivacion_has_proveido`
--

/*!40000 ALTER TABLE `derivacion_has_proveido` DISABLE KEYS */;
/*!40000 ALTER TABLE `derivacion_has_proveido` ENABLE KEYS */;


--
-- Definition of table `devolucion`
--

DROP TABLE IF EXISTS `devolucion`;
CREATE TABLE `devolucion` (
  `idDevolucion` int(11) NOT NULL AUTO_INCREMENT,
  `NroResol` varchar(45) DEFAULT NULL,
  `Observacion` varchar(200) DEFAULT NULL,
  `Motivo` varchar(300) DEFAULT NULL,
  `DOCUMENTO_idDocumento` int(11) NOT NULL,
  PRIMARY KEY (`idDevolucion`),
  KEY `fk_Devolucion_DOCUMENTO1_idx` (`DOCUMENTO_idDocumento`)
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
  `idDEPARTAMENTO` char(2) NOT NULL,
  `idPROVINCIA` char(2) NOT NULL,
  `idDISTRITO` char(2) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idDEPARTAMENTO`,`idPROVINCIA`,`idDISTRITO`),
  KEY `fk_DISTRITO_PROVINCIA1_idx` (`idPROVINCIA`,`idDEPARTAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `distrito`
--

/*!40000 ALTER TABLE `distrito` DISABLE KEYS */;
INSERT INTO `distrito` (`idDEPARTAMENTO`,`idPROVINCIA`,`idDISTRITO`,`nombre`) VALUES 
 ('01','01','01','CHACHAPOYAS'),
 ('01','01','02','ASUNCION'),
 ('01','01','03','BALSAS'),
 ('01','01','04','CHETO'),
 ('01','01','05','CHILIQUIN'),
 ('01','01','06','CHUQUIBAMBA'),
 ('01','01','07','GRANADA'),
 ('01','01','08','HUANCAS'),
 ('01','01','09','LA JALCA'),
 ('01','01','10','LEIMEBAMBA'),
 ('01','01','11','LEVANTO'),
 ('01','01','12','MAGDALENA'),
 ('01','01','13','MARISCAL CASTILLA'),
 ('01','01','14','MOLINOPAMPA'),
 ('01','01','15','MONTEVIDEO'),
 ('01','01','16','OLLEROS'),
 ('01','01','17','QUINJALCA'),
 ('01','01','18','SAN FRANCISCO DE DAGUAS'),
 ('01','01','19','SAN ISIDRO DE MAINO'),
 ('01','01','20','SOLOCO'),
 ('01','01','21','SONCHE'),
 ('01','02','01','LA PECA'),
 ('01','02','02','ARAMANGO'),
 ('01','02','03','COPALLIN'),
 ('01','02','04','EL PARCO'),
 ('01','02','05','BAGUA'),
 ('01','02','06','IMAZA'),
 ('01','03','01','JUMBILLA'),
 ('01','03','02','COROSHA'),
 ('01','03','03','CUISPES'),
 ('01','03','04','CHISQUILLA'),
 ('01','03','05','CHURUJA'),
 ('01','03','06','FLORIDA'),
 ('01','03','07','RECTA'),
 ('01','03','08','SAN CARLOS'),
 ('01','03','09','SHIPASBAMBA'),
 ('01','03','10','VALERA'),
 ('01','03','11','YAMBRASBAMBA'),
 ('01','03','12','JAZAN'),
 ('01','04','01','LAMUD'),
 ('01','04','02','CAMPORREDONDO'),
 ('01','04','03','COCABAMBA'),
 ('01','04','04','COLCAMAR'),
 ('01','04','05','CONILA'),
 ('01','04','06','INGUILPATA'),
 ('01','04','07','LONGUITA'),
 ('01','04','08','LONYA CHICO'),
 ('01','04','09','LUYA'),
 ('01','04','10','LUYA VIEJO'),
 ('01','04','11','MARIA'),
 ('01','04','12','OCALLI'),
 ('01','04','13','OCUMAL'),
 ('01','04','14','PISUQUIA'),
 ('01','04','15','SAN CRISTOBAL'),
 ('01','04','16','SAN FRANCISCO DE YESO'),
 ('01','04','17','SAN JERONIMO'),
 ('01','04','18','SAN JUAN DE LOPECANCHA'),
 ('01','04','19','SANTA CATALINA'),
 ('01','04','20','SANTO TOMAS'),
 ('01','04','21','TINGO'),
 ('01','04','22','TRITA'),
 ('01','04','23','PROVIDENCIA'),
 ('01','05','01','SAN NICOLAS'),
 ('01','05','02','COCHAMAL'),
 ('01','05','03','CHIRIMOTO'),
 ('01','05','04','HUAMBO'),
 ('01','05','05','LIMABAMBA'),
 ('01','05','06','LONGAR'),
 ('01','05','07','MILPUCC'),
 ('01','05','08','MARISCAL BENAVIDES'),
 ('01','05','09','OMIA'),
 ('01','05','10','SANTA ROSA'),
 ('01','05','11','TOTORA'),
 ('01','05','12','VISTA ALEGRE'),
 ('01','06','01','NIEVA'),
 ('01','06','02','RIO SANTIAGO'),
 ('01','06','03','EL CENEPA'),
 ('01','07','01','BAGUA GRANDE'),
 ('01','07','02','CAJARURO'),
 ('01','07','03','CUMBA'),
 ('01','07','04','EL MILAGRO'),
 ('01','07','05','JAMALCA'),
 ('01','07','06','LONYA GRANDE'),
 ('01','07','07','YAMON'),
 ('02','01','01','HUARAZ'),
 ('02','01','02','INDEPENDENCIA'),
 ('02','01','03','COCHABAMBA'),
 ('02','01','04','COLCABAMBA'),
 ('02','01','05','HUANCHAY'),
 ('02','01','06','JANGAS'),
 ('02','01','07','LA LIBERTAD'),
 ('02','01','08','OLLEROS'),
 ('02','01','09','PAMPAS GRANDE'),
 ('02','01','10','PARIACOTO'),
 ('02','01','11','PIRA'),
 ('02','01','12','TARICA'),
 ('02','02','01','AIJA'),
 ('02','02','03','CORIS'),
 ('02','02','05','HUACLLAN'),
 ('02','02','06','LA MERCED'),
 ('02','02','08','SUCCHA'),
 ('02','03','01','CHIQUIAN'),
 ('02','03','02','ABELARDO PARDO LEZAMETA'),
 ('02','03','04','AQUIA'),
 ('02','03','05','CAJACAY'),
 ('02','03','10','HUAYLLACAYAN'),
 ('02','03','11','HUASTA'),
 ('02','03','13','MANGAS'),
 ('02','03','15','PACLLON'),
 ('02','03','17','SAN MIGUEL DE CORPANQUI'),
 ('02','03','20','TICLLOS'),
 ('02','03','21','ANTONIO RAIMONDI'),
 ('02','03','22','CANIS'),
 ('02','03','23','COLQUIOC'),
 ('02','03','24','LA PRIMAVERA'),
 ('02','03','25','HUALLANCA'),
 ('02','04','01','CARHUAZ'),
 ('02','04','02','ACOPAMPA'),
 ('02','04','03','AMASHCA'),
 ('02','04','04','ANTA'),
 ('02','04','05','ATAQUERO'),
 ('02','04','06','MARCARA'),
 ('02','04','07','PARIAHUANCA'),
 ('02','04','08','SAN MIGUEL DE ACO'),
 ('02','04','09','SHILLA'),
 ('02','04','10','TINCO'),
 ('02','04','11','YUNGAR'),
 ('02','05','01','CASMA'),
 ('02','05','02','BUENA VISTA ALTA'),
 ('02','05','03','COMANDANTE NOEL'),
 ('02','05','05','YAUTAN'),
 ('02','06','01','CORONGO'),
 ('02','06','02','ACO'),
 ('02','06','03','BAMBAS'),
 ('02','06','04','CUSCA'),
 ('02','06','05','LA PAMPA'),
 ('02','06','06','YANAC'),
 ('02','06','07','YUPAN'),
 ('02','07','01','CARAZ'),
 ('02','07','02','HUALLANCA'),
 ('02','07','03','HUATA'),
 ('02','07','04','HUAYLAS'),
 ('02','07','05','MATO'),
 ('02','07','06','PAMPAROMAS'),
 ('02','07','07','PUEBLO LIBRE'),
 ('02','07','08','SANTA CRUZ'),
 ('02','07','09','YURACMARCA'),
 ('02','07','10','SANTO TORIBIO'),
 ('02','08','01','HUARI'),
 ('02','08','02','CAJAY'),
 ('02','08','03','CHAVIN DE HUANTAR'),
 ('02','08','04','HUACACHI'),
 ('02','08','05','HUACHIS'),
 ('02','08','06','HUACCHIS'),
 ('02','08','07','HUANTAR'),
 ('02','08','08','MASIN'),
 ('02','08','09','PAUCAS'),
 ('02','08','10','PONTO'),
 ('02','08','11','RAHUAPAMPA'),
 ('02','08','12','RAPAYAN'),
 ('02','08','13','SAN MARCOS'),
 ('02','08','14','SAN PEDRO DE CHANA'),
 ('02','08','15','UCO'),
 ('02','08','16','ANRA'),
 ('02','09','01','PISCOBAMBA'),
 ('02','09','02','CASCA'),
 ('02','09','03','LUCMA'),
 ('02','09','04','FIDEL OLIVAS ESCUDERO'),
 ('02','09','05','LLAMA'),
 ('02','09','06','LLUMPA'),
 ('02','09','07','MUSGA'),
 ('02','09','08','ELEAZAR GUZMAN BARRON'),
 ('02','10','01','CABANA'),
 ('02','10','02','BOLOGNESI'),
 ('02','10','03','CONCHUCOS'),
 ('02','10','04','HUACASCHUQUE'),
 ('02','10','05','HUANDOVAL'),
 ('02','10','06','LACABAMBA'),
 ('02','10','07','LLAPO'),
 ('02','10','08','PALLASCA'),
 ('02','10','09','PAMPAS'),
 ('02','10','10','SANTA ROSA'),
 ('02','10','11','TAUCA'),
 ('02','11','01','POMABAMBA'),
 ('02','11','02','HUAYLLAN'),
 ('02','11','03','PAROBAMBA'),
 ('02','11','04','QUINUABAMBA'),
 ('02','12','01','RECUAY'),
 ('02','12','02','COTAPARACO'),
 ('02','12','03','HUAYLLAPAMPA'),
 ('02','12','04','MARCA'),
 ('02','12','05','PAMPAS CHICO'),
 ('02','12','06','PARARIN'),
 ('02','12','07','TAPACOCHA'),
 ('02','12','08','TICAPAMPA'),
 ('02','12','09','LLACLLIN'),
 ('02','12','10','CATAC'),
 ('02','13','01','CHIMBOTE'),
 ('02','13','02','CACERES DEL PERU'),
 ('02','13','03','MACATE'),
 ('02','13','04','MORO'),
 ('02','13','05','NEPEÑA'),
 ('02','13','06','SAMANCO'),
 ('02','13','07','SANTA'),
 ('02','13','08','COISHCO'),
 ('02','13','09','NUEVO CHIMBOTE'),
 ('02','14','01','SIHUAS'),
 ('02','14','02','ALFONSO UGARTE'),
 ('02','14','03','CHINGALPO'),
 ('02','14','04','HUAYLLABAMBA'),
 ('02','14','05','QUICHES'),
 ('02','14','06','SICSIBAMBA'),
 ('02','14','07','ACOBAMBA'),
 ('02','14','08','CASHAPAMPA'),
 ('02','14','09','RAGASH'),
 ('02','14','10','SAN JUAN'),
 ('02','15','01','YUNGAY'),
 ('02','15','02','CASCAPARA'),
 ('02','15','03','MANCOS'),
 ('02','15','04','MATACOTO'),
 ('02','15','05','QUILLO'),
 ('02','15','06','RANRAHIRCA'),
 ('02','15','07','SHUPLUY'),
 ('02','15','08','YANAMA'),
 ('02','16','01','LLAMELLIN'),
 ('02','16','02','ACZO'),
 ('02','16','03','CHACCHO'),
 ('02','16','04','CHINGAS'),
 ('02','16','05','MIRGAS'),
 ('02','16','06','SAN JUAN DE RONTOY'),
 ('02','17','01','SAN LUIS'),
 ('02','17','02','YAUYA'),
 ('02','17','03','SAN NICOLAS'),
 ('02','18','01','CHACAS'),
 ('02','18','02','ACOCHACA'),
 ('02','19','01','HUARMEY'),
 ('02','19','02','COCHAPETI'),
 ('02','19','03','HUAYAN'),
 ('02','19','04','MALVAS'),
 ('02','19','05','CULEBRAS'),
 ('02','20','01','ACAS'),
 ('02','20','02','CAJAMARQUILLA'),
 ('02','20','03','CARHUAPAMPA'),
 ('02','20','04','COCHAS'),
 ('02','20','05','CONGAS'),
 ('02','20','06','LLIPA'),
 ('02','20','07','OCROS'),
 ('02','20','08','SAN CRISTOBAL DE RAJAN'),
 ('02','20','09','SAN PEDRO'),
 ('02','20','10','SANTIAGO DE CHILCAS'),
 ('03','01','01','ABANCAY'),
 ('03','01','02','CIRCA'),
 ('03','01','03','CURAHUASI'),
 ('03','01','04','CHACOCHE'),
 ('03','01','05','HUANIPACA'),
 ('03','01','06','LAMBRAMA'),
 ('03','01','07','PICHIRHUA'),
 ('03','01','08','SAN PEDRO DE CACHORA'),
 ('03','01','09','TAMBURCO'),
 ('03','02','01','CHALHUANCA'),
 ('03','02','02','CAPAYA'),
 ('03','02','03','CARAYBAMBA'),
 ('03','02','04','COLCABAMBA'),
 ('03','02','05','COTARUSE'),
 ('03','02','06','CHAPIMARCA'),
 ('03','02','07','HUAYLLO'),
 ('03','02','08','LUCRE'),
 ('03','02','09','POCOHUANCA'),
 ('03','02','10','SAÑAYCA'),
 ('03','02','11','SORAYA'),
 ('03','02','12','TAPAIRIHUA'),
 ('03','02','13','TINTAY'),
 ('03','02','14','TORAYA'),
 ('03','02','15','YANACA'),
 ('03','02','16','SAN JUAN DE CHACÑA'),
 ('03','02','17','JUSTO APU SAHUARAURA'),
 ('03','03','01','ANDAHUAYLAS'),
 ('03','03','02','ANDARAPA'),
 ('03','03','03','CHIARA'),
 ('03','03','04','HUANCARAMA'),
 ('03','03','05','HUANCARAY'),
 ('03','03','06','KISHUARA'),
 ('03','03','07','PACOBAMBA'),
 ('03','03','08','PAMPACHIRI'),
 ('03','03','09','SAN ANTONIO DE CACHI'),
 ('03','03','10','SAN JERONIMO'),
 ('03','03','11','TALAVERA'),
 ('03','03','12','TURPO'),
 ('03','03','13','PACUCHA'),
 ('03','03','14','POMACOCHA'),
 ('03','03','15','SANTA MARIA DE CHICMO'),
 ('03','03','16','TUMAY HUARACA'),
 ('03','03','17','HUAYANA'),
 ('03','03','18','SAN MIGUEL DE CHACCRAMPA'),
 ('03','03','19','KAQUIABAMBA'),
 ('03','04','01','ANTABAMBA'),
 ('03','04','02','EL ORO'),
 ('03','04','03','HUAQUIRCA'),
 ('03','04','04','JUAN ESPINOZA MEDRANO'),
 ('03','04','05','OROPESA'),
 ('03','04','06','PACHACONAS'),
 ('03','04','07','SABAINO'),
 ('03','05','01','TAMBOBAMBA'),
 ('03','05','02','COYLLURQUI'),
 ('03','05','03','COTABAMBAS'),
 ('03','05','04','HAQUIRA'),
 ('03','05','05','MARA'),
 ('03','05','06','CHALLHUAHUACHO'),
 ('03','06','01','CHUQUIBAMBILLA'),
 ('03','06','02','CURPAHUASI'),
 ('03','06','03','HUAILLATI'),
 ('03','06','04','MAMARA'),
 ('03','06','05','MARISCAL GAMARRA'),
 ('03','06','06','MICAELA BASTIDAS'),
 ('03','06','07','PROGRESO'),
 ('03','06','08','PATAYPAMPA'),
 ('03','06','09','SAN ANTONIO'),
 ('03','06','10','TURPAY'),
 ('03','06','11','VILCABAMBA'),
 ('03','06','12','VIRUNDO'),
 ('03','06','13','SANTA ROSA'),
 ('03','06','14','CURASCO'),
 ('03','07','01','CHINCHEROS'),
 ('03','07','02','ONGOY'),
 ('03','07','03','OCOBAMBA'),
 ('03','07','04','COCHARCAS'),
 ('03','07','05','ANCO HUALLO'),
 ('03','07','06','HUACCANA'),
 ('03','07','07','URANMARCA'),
 ('03','07','08','RANRACANCHA'),
 ('04','01','01','AREQUIPA'),
 ('04','01','02','CAYMA'),
 ('04','01','03','CERRO COLORADO'),
 ('04','01','04','CHARACATO'),
 ('04','01','05','CHIGUATA'),
 ('04','01','06','LA JOYA'),
 ('04','01','07','MIRAFLORES'),
 ('04','01','08','MOLLEBAYA'),
 ('04','01','09','PAUCARPATA'),
 ('04','01','10','POCSI'),
 ('04','01','11','POLOBAYA'),
 ('04','01','12','QUEQUEÑA'),
 ('04','01','13','SABANDIA'),
 ('04','01','14','SACHACA'),
 ('04','01','15','SAN JUAN DE SIGUAS'),
 ('04','01','16','SAN JUAN DE TARUCANI'),
 ('04','01','17','SANTA ISABEL DE SIGUAS'),
 ('04','01','18','SANTA RITA DE SIHUAS'),
 ('04','01','19','SOCABAYA'),
 ('04','01','20','TIABAYA'),
 ('04','01','21','UCHUMAYO'),
 ('04','01','22','VITOR'),
 ('04','01','23','YANAHUARA'),
 ('04','01','24','YARABAMBA'),
 ('04','01','25','YURA'),
 ('04','01','26','MARIANO MELGAR'),
 ('04','01','27','JACOBO HUNTER'),
 ('04','01','28','ALTO SELVA ALEGRE'),
 ('04','01','29','JOSE LUIS BUSTAMANTE Y RIVERO'),
 ('04','02','01','CHIVAY'),
 ('04','02','02','ACHOMA'),
 ('04','02','03','CABANACONDE'),
 ('04','02','04','CAYLLOMA'),
 ('04','02','05','CALLALLI'),
 ('04','02','06','COPORAQUE'),
 ('04','02','07','HUAMBO'),
 ('04','02','08','HUANCA'),
 ('04','02','09','ICHUPAMPA'),
 ('04','02','10','LARI'),
 ('04','02','11','LLUTA'),
 ('04','02','12','MACA'),
 ('04','02','13','MADRIGAL'),
 ('04','02','14','SAN ANTONIO DE CHUCA'),
 ('04','02','15','SIBAYO'),
 ('04','02','16','TAPAY'),
 ('04','02','17','TISCO'),
 ('04','02','18','TUTI'),
 ('04','02','19','YANQUE'),
 ('04','02','20','MAJES'),
 ('04','03','01','CAMANA'),
 ('04','03','02','JOSE MARIA QUIMPER'),
 ('04','03','03','MARIANO NICOLAS VALCARCEL'),
 ('04','03','04','MARISCAL CACERES'),
 ('04','03','05','NICOLAS DE PIEROLA'),
 ('04','03','06','OCOÑA'),
 ('04','03','07','QUILCA'),
 ('04','03','08','SAMUEL PASTOR'),
 ('04','04','01','CARAVELI'),
 ('04','04','02','ACARI'),
 ('04','04','03','ATICO'),
 ('04','04','04','ATIQUIPA'),
 ('04','04','05','BELLA UNION'),
 ('04','04','06','CAHUACHO'),
 ('04','04','07','CHALA'),
 ('04','04','08','CHAPARRA'),
 ('04','04','09','HUANUHUANU'),
 ('04','04','10','JAQUI'),
 ('04','04','11','LOMAS'),
 ('04','04','12','QUICACHA'),
 ('04','04','13','YAUCA'),
 ('04','05','01','APLAO'),
 ('04','05','02','ANDAGUA'),
 ('04','05','03','AYO'),
 ('04','05','04','CHACHAS'),
 ('04','05','05','CHILCAYMARCA'),
 ('04','05','06','CHOCO'),
 ('04','05','07','HUANCARQUI'),
 ('04','05','08','MACHAGUAY'),
 ('04','05','09','ORCOPAMPA'),
 ('04','05','10','PAMPACOLCA'),
 ('04','05','11','TIPAN'),
 ('04','05','12','URACA'),
 ('04','05','13','UÑON'),
 ('04','05','14','VIRACO'),
 ('04','06','01','CHUQUIBAMBA'),
 ('04','06','02','ANDARAY'),
 ('04','06','03','CAYARANI'),
 ('04','06','04','CHICHAS'),
 ('04','06','05','IRAY'),
 ('04','06','06','SALAMANCA'),
 ('04','06','07','YANAQUIHUA'),
 ('04','06','08','RIO GRANDE'),
 ('04','07','01','MOLLENDO'),
 ('04','07','02','COCACHACRA'),
 ('04','07','03','DEAN VALDIVIA'),
 ('04','07','04','ISLAY'),
 ('04','07','05','MEJIA'),
 ('04','07','06','PUNTA DE BOMBON'),
 ('04','08','01','COTAHUASI'),
 ('04','08','02','ALCA'),
 ('04','08','03','CHARCANA'),
 ('04','08','04','HUAYNACOTAS'),
 ('04','08','05','PAMPAMARCA'),
 ('04','08','06','PUYCA'),
 ('04','08','07','QUECHUALLA'),
 ('04','08','08','SAYLA'),
 ('04','08','09','TAURIA'),
 ('04','08','10','TOMEPAMPA'),
 ('04','08','11','TORO'),
 ('05','01','01','AYACUCHO'),
 ('05','01','02','ACOS VINCHOS'),
 ('05','01','03','CARMEN ALTO'),
 ('05','01','04','CHIARA'),
 ('05','01','05','QUINUA'),
 ('05','01','06','SAN JOSE DE TICLLAS'),
 ('05','01','07','SAN JUAN BAUTISTA'),
 ('05','01','08','SANTIAGO DE PISCHA'),
 ('05','01','09','VINCHOS'),
 ('05','01','10','TAMBILLO'),
 ('05','01','11','ACOCRO'),
 ('05','01','12','SOCOS'),
 ('05','01','13','OCROS'),
 ('05','01','14','PACAYCASA'),
 ('05','01','15','JESUS NAZARENO'),
 ('05','02','01','CANGALLO'),
 ('05','02','04','CHUSCHI'),
 ('05','02','06','LOS MOROCHUCOS'),
 ('05','02','07','PARAS'),
 ('05','02','08','TOTOS'),
 ('05','02','11','MARIA PARADO DE BELLIDO'),
 ('05','03','01','HUANTA'),
 ('05','03','02','AYAHUANCO'),
 ('05','03','03','HUAMANGUILLA'),
 ('05','03','04','IGUAIN'),
 ('05','03','05','LURICOCHA'),
 ('05','03','07','SANTILLANA'),
 ('05','03','08','SIVIA'),
 ('05','03','09','LLOCHEGUA'),
 ('05','04','01','SAN MIGUEL'),
 ('05','04','02','ANCO'),
 ('05','04','03','AYNA'),
 ('05','04','04','CHILCAS'),
 ('05','04','05','CHUNGUI'),
 ('05','04','06','TAMBO'),
 ('05','04','07','LUIS CARRANZA'),
 ('05','04','08','SANTA ROSA'),
 ('05','04','09','SAMUGARI'),
 ('05','05','01','PUQUIO'),
 ('05','05','02','AUCARA'),
 ('05','05','03','CABANA'),
 ('05','05','04','CARMEN SALCEDO'),
 ('05','05','06','CHAVIÑA'),
 ('05','05','08','CHIPAO'),
 ('05','05','10','HUAC-HUAS'),
 ('05','05','11','LARAMATE'),
 ('05','05','12','LEONCIO PRADO'),
 ('05','05','13','LUCANAS'),
 ('05','05','14','LLAUTA'),
 ('05','05','16','OCAÑA'),
 ('05','05','17','OTOCA'),
 ('05','05','20','SANCOS'),
 ('05','05','21','SAN JUAN'),
 ('05','05','22','SAN PEDRO'),
 ('05','05','24','SANTA ANA DE HUAYCAHUACHO'),
 ('05','05','25','SANTA LUCIA'),
 ('05','05','29','SAISA'),
 ('05','05','31','SAN PEDRO DE PALCO'),
 ('05','05','32','SAN CRISTOBAL'),
 ('05','06','01','CORACORA'),
 ('05','06','04','CORONEL CASTAÑEDA'),
 ('05','06','05','CHUMPI'),
 ('05','06','08','PACAPAUSA'),
 ('05','06','11','PULLO'),
 ('05','06','12','PUYUSCA'),
 ('05','06','15','SAN FRANCISCO DE RAVACAYCO'),
 ('05','06','16','UPAHUACHO'),
 ('05','07','01','HUANCAPI'),
 ('05','07','02','ALCAMENCA'),
 ('05','07','03','APONGO'),
 ('05','07','04','CANARIA'),
 ('05','07','06','CAYARA'),
 ('05','07','07','COLCA'),
 ('05','07','08','HUALLA'),
 ('05','07','09','HUAMANQUIQUIA'),
 ('05','07','10','HUANCARAYLLA'),
 ('05','07','13','SARHUA'),
 ('05','07','14','VILCANCHOS'),
 ('05','07','15','ASQUIPATA'),
 ('05','08','01','SANCOS'),
 ('05','08','02','SACSAMARCA'),
 ('05','08','03','SANTIAGO DE LUCANAMARCA'),
 ('05','08','04','CARAPO'),
 ('05','09','01','VILCAS HUAMAN'),
 ('05','09','02','VISCHONGO'),
 ('05','09','03','ACCOMARCA'),
 ('05','09','04','CARHUANCA'),
 ('05','09','05','CONCEPCION'),
 ('05','09','06','HUAMBALPA'),
 ('05','09','07','SAURAMA'),
 ('05','09','08','INDEPENDENCIA'),
 ('05','10','01','PAUSA'),
 ('05','10','02','COLTA'),
 ('05','10','03','CORCULLA'),
 ('05','10','04','LAMPA'),
 ('05','10','05','MARCABAMBA'),
 ('05','10','06','OYOLO'),
 ('05','10','07','PARARCA'),
 ('05','10','08','SAN JAVIER DE ALPABAMBA'),
 ('05','10','09','SAN JOSE DE USHUA'),
 ('05','10','10','SARA SARA'),
 ('05','11','01','QUEROBAMBA'),
 ('05','11','02','BELEN'),
 ('05','11','03','CHALCOS'),
 ('05','11','04','SAN SALVADOR DE QUIJE'),
 ('05','11','05','PAICO'),
 ('05','11','06','SANTIAGO DE PAUCARAY'),
 ('05','11','07','SAN PEDRO DE LARCAY'),
 ('05','11','08','SORAS'),
 ('05','11','09','HUACAÑA'),
 ('05','11','10','CHILCAYOC'),
 ('05','11','11','MORCOLLA'),
 ('06','01','01','CAJAMARCA'),
 ('06','01','02','ASUNCION'),
 ('06','01','03','COSPAN'),
 ('06','01','04','CHETILLA'),
 ('06','01','05','ENCAÑADA'),
 ('06','01','06','JESUS'),
 ('06','01','07','LOS BAÑOS DEL INCA'),
 ('06','01','08','LLACANORA'),
 ('06','01','09','MAGDALENA'),
 ('06','01','10','MATARA'),
 ('06','01','11','NAMORA'),
 ('06','01','12','SAN JUAN'),
 ('06','02','01','CAJABAMBA'),
 ('06','02','02','CACHACHI'),
 ('06','02','03','CONDEBAMBA'),
 ('06','02','05','SITACOCHA'),
 ('06','03','01','CELENDIN'),
 ('06','03','02','CORTEGANA'),
 ('06','03','03','CHUMUCH'),
 ('06','03','04','HUASMIN'),
 ('06','03','05','JORGE CHAVEZ'),
 ('06','03','06','JOSE GALVEZ'),
 ('06','03','07','MIGUEL IGLESIAS'),
 ('06','03','08','OXAMARCA'),
 ('06','03','09','SOROCHUCO'),
 ('06','03','10','SUCRE'),
 ('06','03','11','UTCO'),
 ('06','03','12','LA LIBERTAD DE PALLAN'),
 ('06','04','01','CONTUMAZA'),
 ('06','04','03','CHILETE'),
 ('06','04','04','GUZMANGO'),
 ('06','04','05','SAN BENITO'),
 ('06','04','06','CUPISNIQUE'),
 ('06','04','07','TANTARICA'),
 ('06','04','08','YONAN'),
 ('06','04','09','SANTA CRUZ DE TOLED'),
 ('06','05','01','CUTERVO'),
 ('06','05','02','CALLAYUC'),
 ('06','05','03','CUJILLO'),
 ('06','05','04','CHOROS'),
 ('06','05','05','LA RAMADA'),
 ('06','05','06','PIMPINGOS'),
 ('06','05','07','QUEROCOTILLO'),
 ('06','05','08','SAN ANDRES DE CUTERVO'),
 ('06','05','09','SAN JUAN DE CUTERVO'),
 ('06','05','10','SAN LUIS DE LUCMA'),
 ('06','05','11','SANTA CRUZ'),
 ('06','05','12','SANTO DOMINGO DE LA CAPILLA'),
 ('06','05','13','SANTO TOMAS'),
 ('06','05','14','SOCOTA'),
 ('06','05','15','TORIBIO CASANOVA'),
 ('06','06','01','CHOTA'),
 ('06','06','02','ANGUIA'),
 ('06','06','03','COCHABAMBA'),
 ('06','06','04','CONCHAN'),
 ('06','06','05','CHADIN'),
 ('06','06','06','CHIGUIRIP'),
 ('06','06','07','CHIMBAN'),
 ('06','06','08','HUAMBOS'),
 ('06','06','09','LAJAS'),
 ('06','06','10','LLAMA'),
 ('06','06','11','MIRACOSTA'),
 ('06','06','12','PACCHA'),
 ('06','06','13','PION'),
 ('06','06','14','QUEROCOTO'),
 ('06','06','15','TACABAMBA'),
 ('06','06','16','TOCMOCHE'),
 ('06','06','17','SAN JUAN DE LICUPIS'),
 ('06','06','18','CHOROPAMPA'),
 ('06','06','19','CHALAMARCA'),
 ('06','07','01','BAMBAMARCA'),
 ('06','07','02','CHUGUR'),
 ('06','07','03','HUALGAYOC'),
 ('06','08','01','JAEN'),
 ('06','08','02','BELLAVISTA'),
 ('06','08','03','COLASAY'),
 ('06','08','04','CHONTALI'),
 ('06','08','05','POMAHUACA'),
 ('06','08','06','PUCARA'),
 ('06','08','07','SALLIQUE'),
 ('06','08','08','SAN FELIPE'),
 ('06','08','09','SAN JOSE DEL ALTO'),
 ('06','08','10','SANTA ROSA'),
 ('06','08','11','LAS PIRIAS'),
 ('06','08','12','HUABAL'),
 ('06','09','01','SANTA CRUZ'),
 ('06','09','02','CATACHE'),
 ('06','09','03','CHANCAYBAÑOS'),
 ('06','09','04','LA ESPERANZA'),
 ('06','09','05','NINABAMBA'),
 ('06','09','06','PULAN'),
 ('06','09','07','SEXI'),
 ('06','09','08','UTICYACU'),
 ('06','09','09','YAUYUCAN'),
 ('06','09','10','ANDABAMBA'),
 ('06','09','11','SAUCEPAMPA'),
 ('06','10','01','SAN MIGUEL'),
 ('06','10','02','CALQUIS'),
 ('06','10','03','LA FLORIDA'),
 ('06','10','04','LLAPA'),
 ('06','10','05','NANCHOC'),
 ('06','10','06','NIEPOS'),
 ('06','10','07','SAN GREGORIO'),
 ('06','10','08','SAN SILVESTRE DE COCHAN'),
 ('06','10','09','EL PRADO'),
 ('06','10','10','UNION AGUA BLANCA'),
 ('06','10','11','TONGOD'),
 ('06','10','12','CATILLUC'),
 ('06','10','13','BOLIVAR'),
 ('06','11','01','SAN IGNACIO'),
 ('06','11','02','CHIRINOS'),
 ('06','11','03','HUARANGO'),
 ('06','11','04','NAMBALLE'),
 ('06','11','05','LA COIPA'),
 ('06','11','06','SAN JOSE DE LOURDES'),
 ('06','11','07','TABACONAS'),
 ('06','12','01','PEDRO GALVEZ'),
 ('06','12','02','ICHOCAN'),
 ('06','12','03','GREGORIO PITA'),
 ('06','12','04','JOSE MANUEL QUIROZ'),
 ('06','12','05','EDUARDO VILLANUEVA'),
 ('06','12','06','JOSE SABOGAL'),
 ('06','12','07','CHANCAY'),
 ('06','13','01','SAN PABLO'),
 ('06','13','02','SAN BERNARDINO'),
 ('06','13','03','SAN LUIS'),
 ('06','13','04','TUMBADEN'),
 ('07','01','01','CUSCO'),
 ('07','01','02','CCORCA'),
 ('07','01','03','POROY'),
 ('07','01','04','SAN JERONIMO'),
 ('07','01','05','SAN SEBASTIAN'),
 ('07','01','06','SANTIAGO'),
 ('07','01','07','SAYLLA'),
 ('07','01','08','WANCHAQ'),
 ('07','02','01','ACOMAYO'),
 ('07','02','02','ACOPIA'),
 ('07','02','03','ACOS'),
 ('07','02','04','POMACANCHI'),
 ('07','02','05','RONDOCAN'),
 ('07','02','06','SANGARARA'),
 ('07','02','07','MOSOC LLACTA'),
 ('07','03','01','ANTA'),
 ('07','03','02','CHINCHAYPUJIO'),
 ('07','03','03','HUAROCONDO'),
 ('07','03','04','LIMATAMBO'),
 ('07','03','05','MOLLEPATA'),
 ('07','03','06','PUCYURA'),
 ('07','03','07','ZURITE'),
 ('07','03','08','CACHIMAYO'),
 ('07','03','09','ANCAHUASI'),
 ('07','04','01','CALCA'),
 ('07','04','02','COYA'),
 ('07','04','03','LAMAY'),
 ('07','04','04','LARES'),
 ('07','04','05','PISAC'),
 ('07','04','06','SAN SALVADOR'),
 ('07','04','07','TARAY'),
 ('07','04','08','YANATILE'),
 ('07','05','01','YANAOCA'),
 ('07','05','02','CHECCA'),
 ('07','05','03','KUNTURKANKI'),
 ('07','05','04','LANGUI'),
 ('07','05','05','LAYO'),
 ('07','05','06','PAMPAMARCA'),
 ('07','05','07','QUEHUE'),
 ('07','05','08','TUPAC AMARU'),
 ('07','06','01','SICUANI'),
 ('07','06','02','COMBAPATA'),
 ('07','06','03','CHECACUPE'),
 ('07','06','04','MARANGANI'),
 ('07','06','05','PITUMARCA'),
 ('07','06','06','SAN PABLO'),
 ('07','06','07','SAN PEDRO'),
 ('07','06','08','TINTA'),
 ('07','07','01','SANTO TOMAS'),
 ('07','07','02','CAPACMARCA'),
 ('07','07','03','COLQUEMARCA'),
 ('07','07','04','CHAMACA'),
 ('07','07','05','LIVITACA'),
 ('07','07','06','LLUSCO'),
 ('07','07','07','QUIÑOTA'),
 ('07','07','08','VELILLE'),
 ('07','08','01','ESPINAR'),
 ('07','08','02','CONDOROMA'),
 ('07','08','03','COPORAQUE'),
 ('07','08','04','OCORURO'),
 ('07','08','05','PALLPATA'),
 ('07','08','06','PICHIGUA'),
 ('07','08','07','SUYCKUTAMBO'),
 ('07','08','08','ALTO PICHIGUA'),
 ('07','09','01','SANTA ANA'),
 ('07','09','02','ECHARATE'),
 ('07','09','03','HUAYOPATA'),
 ('07','09','04','MARANURA'),
 ('07','09','05','OCOBAMBA'),
 ('07','09','06','SANTA TERESA'),
 ('07','09','07','VILCABAMBA'),
 ('07','09','08','QUELLOUNO'),
 ('07','09','09','KIMBIRI'),
 ('07','09','10','PICHARI'),
 ('07','10','01','PARURO'),
 ('07','10','02','ACCHA'),
 ('07','10','03','CCAPI'),
 ('07','10','04','COLCHA'),
 ('07','10','05','HUANOQUITE'),
 ('07','10','06','OMACHA'),
 ('07','10','07','YAURISQUE'),
 ('07','10','08','PACCARITAMBO'),
 ('07','10','09','PILLPINTO'),
 ('07','11','01','PAUCARTAMBO'),
 ('07','11','02','CAICAY'),
 ('07','11','03','COLQUEPATA'),
 ('07','11','04','CHALLABAMBA'),
 ('07','11','05','KOSÑIPATA'),
 ('07','11','06','HUANCARANI'),
 ('07','12','01','URCOS'),
 ('07','12','02','ANDAHUAYLILLAS'),
 ('07','12','03','CAMANTI'),
 ('07','12','04','CCARHUAYO'),
 ('07','12','05','CCATCA'),
 ('07','12','06','CUSIPATA'),
 ('07','12','07','HUARO'),
 ('07','12','08','LUCRE'),
 ('07','12','09','MARCAPATA'),
 ('07','12','10','OCONGATE'),
 ('07','12','11','OROPESA'),
 ('07','12','12','QUIQUIJANA'),
 ('07','13','01','URUBAMBA'),
 ('07','13','02','CHINCHERO'),
 ('07','13','03','HUAYLLABAMBA'),
 ('07','13','04','MACHUPICCHU'),
 ('07','13','05','MARAS'),
 ('07','13','06','OLLANTAYTAMBO'),
 ('07','13','07','YUCAY'),
 ('08','01','01','HUANCAVELICA'),
 ('08','01','02','ACOBAMBILLA'),
 ('08','01','03','ACORIA'),
 ('08','01','04','CONAYCA'),
 ('08','01','05','CUENCA'),
 ('08','01','06','HUACHOCOLPA'),
 ('08','01','08','HUAYLLAHUARA'),
 ('08','01','09','IZCUCHACA'),
 ('08','01','10','LARIA'),
 ('08','01','11','MANTA'),
 ('08','01','12','MARISCAL CACERES'),
 ('08','01','13','MOYA'),
 ('08','01','14','NUEVO OCCORO'),
 ('08','01','15','PALCA'),
 ('08','01','16','PILCHACA'),
 ('08','01','17','VILCA'),
 ('08','01','18','YAULI'),
 ('08','01','19','ASCENSION'),
 ('08','01','20','HUANDO'),
 ('08','02','01','ACOBAMBA'),
 ('08','02','02','ANTA'),
 ('08','02','03','ANDABAMBA'),
 ('08','02','04','CAJA'),
 ('08','02','05','MARCAS'),
 ('08','02','06','PAUCARA'),
 ('08','02','07','POMACOCHA'),
 ('08','02','08','ROSARIO'),
 ('08','03','01','LIRCAY'),
 ('08','03','02','ANCHONGA'),
 ('08','03','03','CALLANMARCA'),
 ('08','03','04','CONGALLA'),
 ('08','03','05','CHINCHO'),
 ('08','03','06','HUALLAY-GRANDE'),
 ('08','03','07','HUANCA-HUANCA'),
 ('08','03','08','JULCAMARCA'),
 ('08','03','09','SAN ANTONIO DE ANTAPARCO'),
 ('08','03','10','SANTO TOMAS DE PATA'),
 ('08','03','11','SECCLLA'),
 ('08','03','12','CCOCHACCASA'),
 ('08','04','01','CASTROVIRREYNA'),
 ('08','04','02','ARMA'),
 ('08','04','03','AURAHUA'),
 ('08','04','05','CAPILLAS'),
 ('08','04','06','COCAS'),
 ('08','04','08','CHUPAMARCA'),
 ('08','04','09','HUACHOS'),
 ('08','04','10','HUAMATAMBO'),
 ('08','04','14','MOLLEPAMPA'),
 ('08','04','22','SAN JUAN'),
 ('08','04','27','TANTARA'),
 ('08','04','28','TICRAPO'),
 ('08','04','29','SANTA ANA'),
 ('08','05','01','PAMPAS'),
 ('08','05','02','ACOSTAMBO'),
 ('08','05','03','ACRAQUIA'),
 ('08','05','04','AHUAYCHA'),
 ('08','05','06','COLCABAMBA'),
 ('08','05','09','DANIEL HERNANDEZ'),
 ('08','05','11','HUACHOCOLPA'),
 ('08','05','12','HUARIBAMBA'),
 ('08','05','15','ÑAHUIMPUQUIO'),
 ('08','05','17','PAZOS'),
 ('08','05','18','QUISHUAR'),
 ('08','05','19','SALCABAMBA'),
 ('08','05','20','SAN MARCOS DE ROCCHAC'),
 ('08','05','23','SURCUBAMBA'),
 ('08','05','25','TINTAY PUNCU'),
 ('08','05','26','SALCAHUASI'),
 ('08','06','01','AYAVI'),
 ('08','06','02','CORDOVA'),
 ('08','06','03','HUAYACUNDO ARMA'),
 ('08','06','04','HUAYTARA'),
 ('08','06','05','LARAMARCA'),
 ('08','06','06','OCOYO'),
 ('08','06','07','PILPICHACA'),
 ('08','06','08','QUERCO'),
 ('08','06','09','QUITO ARMA'),
 ('08','06','10','SAN ANTONIO DE CUSICANCHA'),
 ('08','06','11','SAN FRANCISCO DE SANGAYAICO'),
 ('08','06','12','SAN ISIDRO'),
 ('08','06','13','SANTIAGO DE CHOCORVOS'),
 ('08','06','14','SANTIAGO DE QUIRAHUARA'),
 ('08','06','15','SANTO DOMINGO DE CAPILLAS'),
 ('08','06','16','TAMBO'),
 ('08','07','01','CHURCAMPA'),
 ('08','07','02','ANCO'),
 ('08','07','03','CHINCHIHUASI'),
 ('08','07','04','EL CARMEN'),
 ('08','07','05','LA MERCED'),
 ('08','07','06','LOCROJA'),
 ('08','07','07','PAUCARBAMBA'),
 ('08','07','08','SAN MIGUEL DE MAYOCC'),
 ('08','07','09','SAN PEDRO DE CORIS'),
 ('08','07','10','PACHAMARCA'),
 ('08','07','11','COSME'),
 ('09','01','01','HUANUCO'),
 ('09','01','02','CHINCHAO'),
 ('09','01','03','CHURUBAMBA'),
 ('09','01','04','MARGOS'),
 ('09','01','05','QUISQUI'),
 ('09','01','06','SAN FRANCISCO DE CAYRAN'),
 ('09','01','07','SAN PEDRO DE CHAULAN'),
 ('09','01','08','SANTA MARIA DEL VALLE'),
 ('09','01','09','YARUMAYO'),
 ('09','01','10','AMARILIS'),
 ('09','01','11','PILLCO MARCA'),
 ('09','01','12','YACUS'),
 ('09','02','01','AMBO'),
 ('09','02','02','CAYNA'),
 ('09','02','03','COLPAS'),
 ('09','02','04','CONCHAMARCA'),
 ('09','02','05','HUACAR'),
 ('09','02','06','SAN FRANCISCO'),
 ('09','02','07','SAN RAFAEL'),
 ('09','02','08','TOMAY-KICHWA'),
 ('09','03','01','LA UNION'),
 ('09','03','07','CHUQUIS'),
 ('09','03','12','MARIAS'),
 ('09','03','14','PACHAS'),
 ('09','03','16','QUIVILLA'),
 ('09','03','17','RIPAN'),
 ('09','03','21','SHUNQUI'),
 ('09','03','22','SILLAPATA'),
 ('09','03','23','YANAS'),
 ('09','04','01','LLATA'),
 ('09','04','02','ARANCAY'),
 ('09','04','03','CHAVIN DE PARIARCA'),
 ('09','04','04','JACAS GRANDE'),
 ('09','04','05','JIRCAN'),
 ('09','04','06','MIRAFLORES'),
 ('09','04','07','MONZON'),
 ('09','04','08','PUNCHAO'),
 ('09','04','09','PUÑOS'),
 ('09','04','10','SINGA'),
 ('09','04','11','TANTAMAYO'),
 ('09','05','01','HUACRACHUCO'),
 ('09','05','02','CHOLON'),
 ('09','05','05','SAN BUENAVENTURA'),
 ('09','06','01','RUPA-RUPA'),
 ('09','06','02','DANIEL ALOMIA ROBLES'),
 ('09','06','03','HERMILIO VALDIZAN'),
 ('09','06','04','LUYANDO'),
 ('09','06','05','MARIANO DAMASO BERAUN'),
 ('09','06','06','JOSE CRESPO Y CASTILLO'),
 ('09','07','01','PANAO'),
 ('09','07','02','CHAGLLA'),
 ('09','07','04','MOLINO'),
 ('09','07','06','UMARI'),
 ('09','08','01','HONORIA'),
 ('09','08','02','PUERTO INCA'),
 ('09','08','03','CODO DEL POZUZO'),
 ('09','08','04','TOURNAVISTA'),
 ('09','08','05','YUYAPICHIS'),
 ('09','09','01','HUACAYBAMBA'),
 ('09','09','02','PINRA'),
 ('09','09','03','CANCHABAMBA'),
 ('09','09','04','COCHABAMBA'),
 ('09','10','01','JESUS'),
 ('09','10','02','BAÑOS'),
 ('09','10','03','SAN FRANCISCO DE ASIS'),
 ('09','10','04','QUEROPALCA'),
 ('09','10','05','SAN MIGUEL DE CAURI'),
 ('09','10','06','RONDOS'),
 ('09','10','07','JIVIA'),
 ('09','11','01','CHAVINILLO'),
 ('09','11','02','APARICIO POMARES'),
 ('09','11','03','CAHUAC'),
 ('09','11','04','CHACABAMBA'),
 ('09','11','05','JACAS CHICO'),
 ('09','11','06','OBAS'),
 ('09','11','07','PAMPAMARCA'),
 ('09','11','08','CHORAS'),
 ('10','01','01','ICA'),
 ('10','01','02','LA TINGUIÑA'),
 ('10','01','03','LOS AQUIJES'),
 ('10','01','04','PARCONA'),
 ('10','01','05','PUEBLO NUEVO'),
 ('10','01','06','SALAS'),
 ('10','01','07','SAN JOSE DE LOS MOLINOS'),
 ('10','01','08','SAN JUAN BAUTISTA'),
 ('10','01','09','SANTIAGO'),
 ('10','01','10','SUBTANJALLA'),
 ('10','01','11','YAUCA DEL ROSARIO'),
 ('10','01','12','TATE'),
 ('10','01','13','PACHACUTEC'),
 ('10','01','14','OCUCAJE'),
 ('10','02','01','CHINCHA ALTA'),
 ('10','02','02','CHAVIN'),
 ('10','02','03','CHINCHA BAJA'),
 ('10','02','04','EL CARMEN'),
 ('10','02','05','GROCIO PRADO'),
 ('10','02','06','SAN PEDRO DE HUACARPANA'),
 ('10','02','07','SUNAMPE'),
 ('10','02','08','TAMBO DE MORA'),
 ('10','02','09','ALTO LARAN'),
 ('10','02','10','PUEBLO NUEVO'),
 ('10','02','11','SAN JUAN DE YANAC'),
 ('10','03','01','NAZCA'),
 ('10','03','02','CHANGUILLO'),
 ('10','03','03','EL INGENIO'),
 ('10','03','04','MARCONA'),
 ('10','03','05','VISTA ALEGRE'),
 ('10','04','01','PISCO'),
 ('10','04','02','HUANCANO'),
 ('10','04','03','HUMAY'),
 ('10','04','04','INDEPENDENCIA'),
 ('10','04','05','PARACAS'),
 ('10','04','06','SAN ANDRES'),
 ('10','04','07','SAN CLEMENTE'),
 ('10','04','08','TUPAC AMARU INCA'),
 ('10','05','01','PALPA'),
 ('10','05','02','LLIPATA'),
 ('10','05','03','RIO GRANDE'),
 ('10','05','04','SANTA CRUZ'),
 ('10','05','05','TIBILLO'),
 ('11','01','01','HUANCAYO'),
 ('11','01','03','CARHUACALLANGA'),
 ('11','01','04','COLCA'),
 ('11','01','05','CULLHUAS'),
 ('11','01','06','CHACAPAMPA'),
 ('11','01','07','CHICCHE'),
 ('11','01','08','CHILCA'),
 ('11','01','09','CHONGOS ALTO'),
 ('11','01','12','CHUPURO'),
 ('11','01','13','EL TAMBO'),
 ('11','01','14','HUACRAPUQUIO'),
 ('11','01','16','HUALHUAS'),
 ('11','01','18','HUANCAN'),
 ('11','01','19','HUASICANCHA'),
 ('11','01','20','HUAYUCACHI'),
 ('11','01','21','INGENIO'),
 ('11','01','22','PARIAHUANCA'),
 ('11','01','23','PILCOMAYO'),
 ('11','01','24','PUCARA'),
 ('11','01','25','QUICHUAY'),
 ('11','01','26','QUILCAS'),
 ('11','01','27','SAN AGUSTIN'),
 ('11','01','28','SAN JERONIMO DE TUNAN'),
 ('11','01','31','SANTO DOMINGO DE ACOBAMBA'),
 ('11','01','32','SAÑO'),
 ('11','01','33','SAPALLANGA'),
 ('11','01','34','SICAYA'),
 ('11','01','36','VIQUES'),
 ('11','02','01','CONCEPCION'),
 ('11','02','02','ACO'),
 ('11','02','03','ANDAMARCA'),
 ('11','02','04','COMAS'),
 ('11','02','05','COCHAS'),
 ('11','02','06','CHAMBARA'),
 ('11','02','07','HEROINAS TOLEDO'),
 ('11','02','08','MANZANARES'),
 ('11','02','09','MARISCAL CASTILLA'),
 ('11','02','10','MATAHUASI'),
 ('11','02','11','MITO'),
 ('11','02','12','NUEVE DE JULIO'),
 ('11','02','13','ORCOTUNA'),
 ('11','02','14','SANTA ROSA DE OCOPA'),
 ('11','02','15','SAN JOSE DE QUERO'),
 ('11','03','01','JAUJA'),
 ('11','03','02','ACOLLA'),
 ('11','03','03','APATA'),
 ('11','03','04','ATAURA'),
 ('11','03','05','CANCHAYLLO'),
 ('11','03','06','EL MANTARO'),
 ('11','03','07','HUAMALI'),
 ('11','03','08','HUARIPAMPA'),
 ('11','03','09','HUERTAS'),
 ('11','03','10','JANJAILLO'),
 ('11','03','11','JULCAN'),
 ('11','03','12','LEONOR ORDOÑEZ'),
 ('11','03','13','LLOCLLAPAMPA'),
 ('11','03','14','MARCO'),
 ('11','03','15','MASMA'),
 ('11','03','16','MOLINOS'),
 ('11','03','17','MONOBAMBA'),
 ('11','03','18','MUQUI'),
 ('11','03','19','MUQUIYAUYO'),
 ('11','03','20','PACA'),
 ('11','03','21','PACCHA'),
 ('11','03','22','PANCAN'),
 ('11','03','23','PARCO'),
 ('11','03','24','POMACANCHA'),
 ('11','03','25','RICRAN'),
 ('11','03','26','SAN LORENZO'),
 ('11','03','27','SAN PEDRO DE CHUNAN'),
 ('11','03','28','SINCOS'),
 ('11','03','29','TUNAN MARCA'),
 ('11','03','30','YAULI'),
 ('11','03','31','CURICACA'),
 ('11','03','32','MASMA CHICCHE'),
 ('11','03','33','SAUSA'),
 ('11','03','34','YAUYOS'),
 ('11','04','01','JUNIN'),
 ('11','04','02','CARHUAMAYO'),
 ('11','04','03','ONDORES'),
 ('11','04','04','ULCUMAYO'),
 ('11','05','01','TARMA'),
 ('11','05','02','ACOBAMBA'),
 ('11','05','03','HUARICOLCA'),
 ('11','05','04','HUASAHUASI'),
 ('11','05','05','LA UNION'),
 ('11','05','06','PALCA'),
 ('11','05','07','PALCAMAYO'),
 ('11','05','08','SAN PEDRO DE CAJAS'),
 ('11','05','09','TAPO'),
 ('11','06','01','LA OROYA'),
 ('11','06','02','CHACAPALPA'),
 ('11','06','03','HUAY HUAY'),
 ('11','06','04','MARCAPOMACOCHA'),
 ('11','06','05','MOROCOCHA'),
 ('11','06','06','PACCHA'),
 ('11','06','07','SANTA BARBARA DE CARHUACAYAN'),
 ('11','06','08','SUITUCANCHA'),
 ('11','06','09','YAULI'),
 ('11','06','10','SANTA ROSA DE SACCO'),
 ('11','07','01','SATIPO'),
 ('11','07','02','COVIRIALI'),
 ('11','07','03','LLAYLLA'),
 ('11','07','04','MAZAMARI'),
 ('11','07','05','PAMPA HERMOSA'),
 ('11','07','06','PANGOA'),
 ('11','07','07','RIO NEGRO'),
 ('11','07','08','RIO TAMBO'),
 ('11','08','01','CHANCHAMAYO'),
 ('11','08','02','SAN RAMON'),
 ('11','08','03','VITOC'),
 ('11','08','04','SAN LUIS DE SHUARO'),
 ('11','08','05','PICHANAQUI'),
 ('11','08','06','PERENE'),
 ('11','09','01','CHUPACA'),
 ('11','09','02','AHUAC'),
 ('11','09','03','CHONGOS BAJO'),
 ('11','09','04','HUACHAC'),
 ('11','09','05','HUAMANCACA CHICO'),
 ('11','09','06','SAN JUAN DE YSCOS'),
 ('11','09','07','SAN JUAN DE JARPA'),
 ('11','09','08','TRES DE DICIEMBRE'),
 ('11','09','09','YANACANCHA'),
 ('12','01','01','TRUJILLO'),
 ('12','01','02','HUANCHACO'),
 ('12','01','03','LAREDO'),
 ('12','01','04','MOCHE'),
 ('12','01','05','SALAVERRY'),
 ('12','01','06','SIMBAL'),
 ('12','01','07','VICTOR LARCO HERRERA'),
 ('12','01','09','POROTO'),
 ('12','01','10','EL PORVENIR'),
 ('12','01','11','LA ESPERANZA'),
 ('12','01','12','FLORENCIA DE MORA'),
 ('12','02','01','BOLIVAR'),
 ('12','02','02','BAMBAMARCA'),
 ('12','02','03','CONDORMARCA'),
 ('12','02','04','LONGOTEA'),
 ('12','02','05','UCUNCHA'),
 ('12','02','06','UCHUMARCA'),
 ('12','03','01','HUAMACHUCO'),
 ('12','03','02','COCHORCO'),
 ('12','03','03','CURGOS'),
 ('12','03','04','CHUGAY'),
 ('12','03','05','MARCABAL'),
 ('12','03','06','SANAGORAN'),
 ('12','03','07','SARIN'),
 ('12','03','08','SARTIMBAMBA'),
 ('12','04','01','OTUZCO'),
 ('12','04','02','AGALLPAMPA'),
 ('12','04','03','CHARAT'),
 ('12','04','04','HUARANCHAL'),
 ('12','04','05','LA CUESTA'),
 ('12','04','08','PARANDAY'),
 ('12','04','09','SALPO'),
 ('12','04','10','SINSICAP'),
 ('12','04','11','USQUIL'),
 ('12','04','13','MACHE'),
 ('12','05','01','SAN PEDRO DE LLOC'),
 ('12','05','03','GUADALUPE'),
 ('12','05','04','JEQUETEPEQUE'),
 ('12','05','06','PACASMAYO'),
 ('12','05','08','SAN JOSE'),
 ('12','06','01','TAYABAMBA'),
 ('12','06','02','BULDIBUYO'),
 ('12','06','03','CHILLIA'),
 ('12','06','04','HUAYLILLAS'),
 ('12','06','05','HUANCASPATA'),
 ('12','06','06','HUAYO'),
 ('12','06','07','ONGON'),
 ('12','06','08','PARCOY'),
 ('12','06','09','PATAZ'),
 ('12','06','10','PIAS'),
 ('12','06','11','TAURIJA'),
 ('12','06','12','URPAY'),
 ('12','06','13','SANTIAGO DE CHALLAS'),
 ('12','07','01','SANTIAGO DE CHUCO'),
 ('12','07','02','CACHICADAN'),
 ('12','07','03','MOLLEBAMBA'),
 ('12','07','04','MOLLEPATA'),
 ('12','07','05','QUIRUVILCA'),
 ('12','07','06','SANTA CRUZ DE CHUCA'),
 ('12','07','07','SITABAMBA'),
 ('12','07','08','ANGASMARCA'),
 ('12','08','01','ASCOPE'),
 ('12','08','02','CHICAMA'),
 ('12','08','03','CHOCOPE'),
 ('12','08','04','SANTIAGO DE CAO'),
 ('12','08','05','MAGDALENA DE CAO'),
 ('12','08','06','PAIJAN'),
 ('12','08','07','RAZURI'),
 ('12','08','08','CASA GRANDE'),
 ('12','09','01','CHEPEN'),
 ('12','09','02','PACANGA'),
 ('12','09','03','PUEBLO NUEVO'),
 ('12','10','01','JULCAN'),
 ('12','10','02','CARABAMBA'),
 ('12','10','03','CALAMARCA'),
 ('12','10','04','HUASO'),
 ('12','11','01','CASCAS'),
 ('12','11','02','LUCMA'),
 ('12','11','03','MARMOT'),
 ('12','11','04','SAYAPULLO'),
 ('12','12','01','VIRU'),
 ('12','12','02','CHAO'),
 ('12','12','03','GUADALUPITO'),
 ('13','01','01','CHICLAYO'),
 ('13','01','02','CHONGOYAPE'),
 ('13','01','03','ETEN'),
 ('13','01','04','ETEN PUERTO'),
 ('13','01','05','LAGUNAS'),
 ('13','01','06','MONSEFU'),
 ('13','01','07','NUEVA ARICA'),
 ('13','01','08','OYOTUN'),
 ('13','01','09','PICSI'),
 ('13','01','10','PIMENTEL'),
 ('13','01','11','REQUE'),
 ('13','01','12','JOSE LEONARDO ORTIZ'),
 ('13','01','13','SANTA ROSA'),
 ('13','01','14','SAÑA'),
 ('13','01','15','LA VICTORIA'),
 ('13','01','16','CAYALTI'),
 ('13','01','17','PATAPO'),
 ('13','01','18','POMALCA'),
 ('13','01','19','PUCALA'),
 ('13','01','20','TUMAN'),
 ('13','02','01','FERREÑAFE'),
 ('13','02','02','INCAHUASI'),
 ('13','02','03','CAÑARIS'),
 ('13','02','04','PITIPO'),
 ('13','02','05','PUEBLO NUEVO'),
 ('13','02','06','MANUEL ANTONIO MESONES MURO'),
 ('13','03','01','LAMBAYEQUE'),
 ('13','03','02','CHOCHOPE'),
 ('13','03','03','ILLIMO'),
 ('13','03','04','JAYANCA'),
 ('13','03','05','MOCHUMI'),
 ('13','03','06','MORROPE'),
 ('13','03','07','MOTUPE'),
 ('13','03','08','OLMOS'),
 ('13','03','09','PACORA'),
 ('13','03','10','SALAS'),
 ('13','03','11','SAN JOSE'),
 ('13','03','12','TUCUME'),
 ('14','01','01','LIMA'),
 ('14','01','02','ANCON'),
 ('14','01','03','ATE'),
 ('14','01','04','BREÑA'),
 ('14','01','05','CARABAYLLO'),
 ('14','01','06','COMAS'),
 ('14','01','07','CHACLACAYO'),
 ('14','01','08','CHORRILLOS'),
 ('14','01','09','LA VICTORIA'),
 ('14','01','10','LA MOLINA'),
 ('14','01','11','LINCE'),
 ('14','01','12','LURIGANCHO'),
 ('14','01','13','LURIN'),
 ('14','01','14','MAGDALENA DEL MAR'),
 ('14','01','15','MIRAFLORES'),
 ('14','01','16','PACHACAMAC'),
 ('14','01','17','PUEBLO LIBRE'),
 ('14','01','18','PUCUSANA'),
 ('14','01','19','PUENTE PIEDRA'),
 ('14','01','20','PUNTA HERMOSA'),
 ('14','01','21','PUNTA NEGRA'),
 ('14','01','22','RIMAC'),
 ('14','01','23','SAN BARTOLO'),
 ('14','01','24','SAN ISIDRO'),
 ('14','01','25','BARRANCO'),
 ('14','01','26','SAN MARTIN DE PORRES'),
 ('14','01','27','SAN MIGUEL'),
 ('14','01','28','SANTA MARIA DEL MAR'),
 ('14','01','29','SANTA ROSA'),
 ('14','01','30','SANTIAGO DE SURCO'),
 ('14','01','31','SURQUILLO'),
 ('14','01','32','VILLA MARIA DEL TRIUNFO'),
 ('14','01','33','JESUS MARIA'),
 ('14','01','34','INDEPENDENCIA'),
 ('14','01','35','EL AGUSTINO'),
 ('14','01','36','SAN JUAN DE MIRAFLORES'),
 ('14','01','37','SAN JUAN DE LURIGANCHO'),
 ('14','01','38','SAN LUIS'),
 ('14','01','39','CIENEGUILLA'),
 ('14','01','40','SAN BORJA'),
 ('14','01','41','VILLA EL SALVADOR'),
 ('14','01','42','LOS OLIVOS'),
 ('14','01','43','SANTA ANITA'),
 ('14','02','01','CAJATAMBO'),
 ('14','02','05','COPA'),
 ('14','02','06','GORGOR'),
 ('14','02','07','HUANCAPON'),
 ('14','02','08','MANAS'),
 ('14','03','01','CANTA'),
 ('14','03','02','ARAHUAY'),
 ('14','03','03','HUAMANTANGA'),
 ('14','03','04','HUAROS'),
 ('14','03','05','LACHAQUI'),
 ('14','03','06','SAN BUENAVENTURA'),
 ('14','03','07','SANTA ROSA DE QUIVES'),
 ('14','04','01','SAN VICENTE DE CAÑETE'),
 ('14','04','02','CALANGO'),
 ('14','04','03','CERRO AZUL'),
 ('14','04','04','COAYLLO'),
 ('14','04','05','CHILCA'),
 ('14','04','06','IMPERIAL'),
 ('14','04','07','LUNAHUANA'),
 ('14','04','08','MALA'),
 ('14','04','09','NUEVO IMPERIAL'),
 ('14','04','10','PACARAN'),
 ('14','04','11','QUILMANA'),
 ('14','04','12','SAN ANTONIO'),
 ('14','04','13','SAN LUIS'),
 ('14','04','14','SANTA CRUZ DE FLORES'),
 ('14','04','15','ZUÑIGA'),
 ('14','04','16','ASIA'),
 ('14','05','01','HUACHO'),
 ('14','05','02','AMBAR'),
 ('14','05','04','CALETA DE CARQUIN'),
 ('14','05','05','CHECRAS'),
 ('14','05','06','HUALMAY'),
 ('14','05','07','HUAURA'),
 ('14','05','08','LEONCIO PRADO'),
 ('14','05','09','PACCHO'),
 ('14','05','11','SANTA LEONOR'),
 ('14','05','12','SANTA MARIA'),
 ('14','05','13','SAYAN'),
 ('14','05','16','VEGUETA'),
 ('14','06','01','MATUCANA'),
 ('14','06','02','ANTIOQUIA'),
 ('14','06','03','CALLAHUANCA'),
 ('14','06','04','CARAMPOMA'),
 ('14','06','05','CASTA'),
 ('14','06','06','SAN JOSE DE LOS CHORRILLOS'),
 ('14','06','07','CHICLA'),
 ('14','06','08','HUANZA'),
 ('14','06','09','HUAROCHIRI'),
 ('14','06','10','LAHUAYTAMBO'),
 ('14','06','11','LANGA'),
 ('14','06','12','MARIATANA'),
 ('14','06','13','RICARDO PALMA'),
 ('14','06','14','SAN ANDRES DE TUPICOCHA'),
 ('14','06','15','SAN ANTONIO'),
 ('14','06','16','SAN BARTOLOME'),
 ('14','06','17','SAN DAMIAN'),
 ('14','06','18','SANGALLAYA'),
 ('14','06','19','SAN JUAN DE TANTARANCHE'),
 ('14','06','20','SAN LORENZO DE QUINTI'),
 ('14','06','21','SAN MATEO'),
 ('14','06','22','SAN MATEO DE OTAO'),
 ('14','06','23','SAN PEDRO DE HUANCAYRE'),
 ('14','06','24','SANTA CRUZ DE COCACHACRA'),
 ('14','06','25','SANTA EULALIA'),
 ('14','06','26','SANTIAGO DE ANCHUCAYA'),
 ('14','06','27','SANTIAGO DE TUNA'),
 ('14','06','28','SANTO DOMINGO DE LOS OLLEROS'),
 ('14','06','29','SURCO'),
 ('14','06','30','HUACHUPAMPA'),
 ('14','06','31','LARAOS'),
 ('14','06','32','SAN JUAN DE IRIS'),
 ('14','07','01','YAUYOS'),
 ('14','07','02','ALIS'),
 ('14','07','03','ALLAUCA'),
 ('14','07','04','AYAVIRI'),
 ('14','07','05','AZANGARO'),
 ('14','07','06','CACRA'),
 ('14','07','07','CARANIA'),
 ('14','07','08','COCHAS'),
 ('14','07','09','COLONIA'),
 ('14','07','10','CHOCOS'),
 ('14','07','11','HUAMPARA'),
 ('14','07','12','HUANCAYA'),
 ('14','07','13','HUANGASCAR'),
 ('14','07','14','HUANTAN'),
 ('14','07','15','HUAÑEC'),
 ('14','07','16','LARAOS'),
 ('14','07','17','LINCHA'),
 ('14','07','18','MIRAFLORES'),
 ('14','07','19','OMAS'),
 ('14','07','20','QUINCHES'),
 ('14','07','21','QUINOCAY'),
 ('14','07','22','SAN JOAQUIN'),
 ('14','07','23','SAN PEDRO DE PILAS'),
 ('14','07','24','TANTA'),
 ('14','07','25','TAURIPAMPA'),
 ('14','07','26','TUPE'),
 ('14','07','27','TOMAS'),
 ('14','07','28','VIÑAC'),
 ('14','07','29','VITIS'),
 ('14','07','30','HONGOS'),
 ('14','07','31','MADEAN'),
 ('14','07','32','PUTINZA'),
 ('14','07','33','CATAHUASI'),
 ('14','08','01','HUARAL'),
 ('14','08','02','ATAVILLOS ALTO'),
 ('14','08','03','ATAVILLOS BAJO'),
 ('14','08','04','AUCALLAMA'),
 ('14','08','05','CHANCAY'),
 ('14','08','06','IHUARI'),
 ('14','08','07','LAMPIAN'),
 ('14','08','08','PACARAOS'),
 ('14','08','09','SAN MIGUEL DE ACOS'),
 ('14','08','10','VEINTISIETE DE NOVIEMBRE'),
 ('14','08','11','SANTA CRUZ DE ANDAMARCA'),
 ('14','08','12','SUMBILCA'),
 ('14','09','01','BARRANCA'),
 ('14','09','02','PARAMONGA'),
 ('14','09','03','PATIVILCA'),
 ('14','09','04','SUPE'),
 ('14','09','05','SUPE PUERTO'),
 ('14','10','01','OYON'),
 ('14','10','02','NAVAN'),
 ('14','10','03','CAUJUL'),
 ('14','10','04','ANDAJES'),
 ('14','10','05','PACHANGARA'),
 ('14','10','06','COCHAMARCA'),
 ('15','01','01','IQUITOS'),
 ('15','01','02','ALTO NANAY'),
 ('15','01','03','FERNANDO LORES'),
 ('15','01','04','LAS AMAZONAS'),
 ('15','01','05','MAZAN'),
 ('15','01','06','NAPO'),
 ('15','01','07','PUTUMAYO'),
 ('15','01','08','TORRES CAUSANA'),
 ('15','01','10','INDIANA'),
 ('15','01','11','PUNCHANA'),
 ('15','01','12','BELEN'),
 ('15','01','13','SAN JUAN BAUTISTA'),
 ('15','01','14','TENIENTE MANUEL CLAVERO'),
 ('15','02','01','YURIMAGUAS'),
 ('15','02','02','BALSAPUERTO'),
 ('15','02','05','JEBEROS'),
 ('15','02','06','LAGUNAS'),
 ('15','02','10','SANTA CRUZ'),
 ('15','02','11','TENIENTE CESAR LOPEZ ROJAS'),
 ('15','03','01','NAUTA'),
 ('15','03','02','PARINARI'),
 ('15','03','03','TIGRE'),
 ('15','03','04','URARINAS'),
 ('15','03','05','TROMPETEROS'),
 ('15','04','01','REQUENA'),
 ('15','04','02','ALTO TAPICHE'),
 ('15','04','03','CAPELO'),
 ('15','04','04','EMILIO SAN MARTIN'),
 ('15','04','05','MAQUIA'),
 ('15','04','06','PUINAHUA'),
 ('15','04','07','SAQUENA'),
 ('15','04','08','SOPLIN'),
 ('15','04','09','TAPICHE'),
 ('15','04','10','JENARO HERRERA'),
 ('15','04','11','YAQUERANA'),
 ('15','05','01','CONTAMANA'),
 ('15','05','02','VARGAS GUERRA'),
 ('15','05','03','PADRE MARQUEZ'),
 ('15','05','04','PAMPA HERMOSA'),
 ('15','05','05','SARAYACU'),
 ('15','05','06','INAHUAYA'),
 ('15','06','01','RAMON CASTILLA'),
 ('15','06','02','PEBAS'),
 ('15','06','03','YAVARI'),
 ('15','06','04','SAN PABLO'),
 ('15','07','01','BARRANCA'),
 ('15','07','02','ANDOAS'),
 ('15','07','03','CAHUAPANAS'),
 ('15','07','04','MANSERICHE'),
 ('15','07','05','MORONA'),
 ('15','07','06','PASTAZA'),
 ('16','01','01','TAMBOPATA'),
 ('16','01','02','INAMBARI'),
 ('16','01','03','LAS PIEDRAS'),
 ('16','01','04','LABERINTO'),
 ('16','02','01','MANU'),
 ('16','02','02','FITZCARRALD'),
 ('16','02','03','MADRE DE DIOS'),
 ('16','02','04','HUEPETUHE'),
 ('16','03','01','IÑAPARI'),
 ('16','03','02','IBERIA'),
 ('16','03','03','TAHUAMANU'),
 ('17','01','01','MOQUEGUA'),
 ('17','01','02','CARUMAS'),
 ('17','01','03','CUCHUMBAYA'),
 ('17','01','04','SAN CRISTOBAL'),
 ('17','01','05','TORATA'),
 ('17','01','06','SAMEGUA'),
 ('17','02','01','OMATE'),
 ('17','02','02','COALAQUE'),
 ('17','02','03','CHOJATA'),
 ('17','02','04','ICHUÑA'),
 ('17','02','05','LA CAPILLA'),
 ('17','02','06','LLOQUE'),
 ('17','02','07','MATALAQUE'),
 ('17','02','08','PUQUINA'),
 ('17','02','09','QUINISTAQUILLAS'),
 ('17','02','10','UBINAS'),
 ('17','02','11','YUNGA'),
 ('17','03','01','ILO'),
 ('17','03','02','EL ALGARROBAL'),
 ('17','03','03','PACOCHA'),
 ('18','01','01','CHAUPIMARCA'),
 ('18','01','03','HUACHON'),
 ('18','01','04','HUARIACA'),
 ('18','01','05','HUAYLLAY'),
 ('18','01','06','NINACACA'),
 ('18','01','07','PALLANCHACRA'),
 ('18','01','08','PAUCARTAMBO'),
 ('18','01','09','SAN FCO DE ASIS DE YARUSYACAN'),
 ('18','01','10','SIMON BOLIVAR'),
 ('18','01','11','TICLACAYAN'),
 ('18','01','12','TINYAHUARCO'),
 ('18','01','13','VICCO'),
 ('18','01','14','YANACANCHA'),
 ('18','02','01','YANAHUANCA'),
 ('18','02','02','CHACAYAN'),
 ('18','02','03','GOYLLARISQUIZGA'),
 ('18','02','04','PAUCAR'),
 ('18','02','05','SAN PEDRO DE PILLAO'),
 ('18','02','06','SANTA ANA DE TUSI'),
 ('18','02','07','TAPUC'),
 ('18','02','08','VILCABAMBA'),
 ('18','03','01','OXAPAMPA'),
 ('18','03','02','CHONTABAMBA'),
 ('18','03','03','HUANCABAMBA'),
 ('18','03','04','PUERTO BERMUDEZ'),
 ('18','03','05','VILLA RICA'),
 ('18','03','06','POZUZO'),
 ('18','03','07','PALCAZU'),
 ('18','03','08','CONSTITUCION'),
 ('19','01','01','PIURA'),
 ('19','01','03','CASTILLA'),
 ('19','01','04','CATACAOS'),
 ('19','01','05','LA ARENA'),
 ('19','01','06','LA UNION'),
 ('19','01','07','LAS LOMAS'),
 ('19','01','09','TAMBO GRANDE'),
 ('19','01','13','CURA MORI'),
 ('19','01','14','EL TALLAN'),
 ('19','01','15','VEINTISEIS DE OCTUBRE'),
 ('19','02','01','AYABACA'),
 ('19','02','02','FRIAS'),
 ('19','02','03','LAGUNAS'),
 ('19','02','04','MONTERO'),
 ('19','02','05','PACAIPAMPA'),
 ('19','02','06','SAPILLICA'),
 ('19','02','07','SICCHEZ'),
 ('19','02','08','SUYO'),
 ('19','02','09','JILILI'),
 ('19','02','10','PAIMAS'),
 ('19','03','01','HUANCABAMBA'),
 ('19','03','02','CANCHAQUE'),
 ('19','03','03','HUARMACA'),
 ('19','03','04','SONDOR'),
 ('19','03','05','SONDORILLO'),
 ('19','03','06','EL CARMEN DE LA FRONTERA'),
 ('19','03','07','SAN MIGUEL DE EL FAIQUE'),
 ('19','03','08','LALAQUIZ'),
 ('19','04','01','CHULUCANAS'),
 ('19','04','02','BUENOS AIRES'),
 ('19','04','03','CHALACO'),
 ('19','04','04','MORROPON'),
 ('19','04','05','SALITRAL'),
 ('19','04','06','SANTA CATALINA DE MOSSA'),
 ('19','04','07','SANTO DOMINGO'),
 ('19','04','08','LA MATANZA'),
 ('19','04','09','YAMANGO'),
 ('19','04','10','SAN JUAN DE BIGOTE'),
 ('19','05','01','PAITA'),
 ('19','05','02','AMOTAPE'),
 ('19','05','03','ARENAL'),
 ('19','05','04','LA HUACA'),
 ('19','05','05','COLAN'),
 ('19','05','06','TAMARINDO'),
 ('19','05','07','VICHAYAL'),
 ('19','06','01','SULLANA'),
 ('19','06','02','BELLAVISTA'),
 ('19','06','03','LANCONES'),
 ('19','06','04','MARCAVELICA'),
 ('19','06','05','MIGUEL CHECA'),
 ('19','06','06','QUERECOTILLO'),
 ('19','06','07','SALITRAL'),
 ('19','06','08','IGNACIO ESCUDERO'),
 ('19','07','01','PARIÑAS'),
 ('19','07','02','EL ALTO'),
 ('19','07','03','LA BREA'),
 ('19','07','04','LOBITOS'),
 ('19','07','05','MANCORA'),
 ('19','07','06','LOS ORGANOS'),
 ('19','08','01','SECHURA'),
 ('19','08','02','VICE'),
 ('19','08','03','BERNAL'),
 ('19','08','04','BELLAVISTA DE LA UNION'),
 ('19','08','05','CRISTO NOS VALGA'),
 ('19','08','06','RINCONADA-LLICUAR'),
 ('20','01','01','PUNO'),
 ('20','01','02','ACORA'),
 ('20','01','03','ATUNCOLLA'),
 ('20','01','04','CAPACHICA'),
 ('20','01','05','COATA'),
 ('20','01','06','CHUCUITO'),
 ('20','01','07','HUATA'),
 ('20','01','08','MAÑAZO'),
 ('20','01','09','PAUCARCOLLA'),
 ('20','01','10','PICHACANI'),
 ('20','01','11','SAN ANTONIO'),
 ('20','01','12','TIQUILLACA'),
 ('20','01','13','VILQUE'),
 ('20','01','14','PLATERIA'),
 ('20','01','15','AMANTANI'),
 ('20','02','01','AZANGARO'),
 ('20','02','02','ACHAYA'),
 ('20','02','03','ARAPA'),
 ('20','02','04','ASILLO'),
 ('20','02','05','CAMINACA'),
 ('20','02','06','CHUPA'),
 ('20','02','07','JOSE DOMINGO CHOQUEHUANCA'),
 ('20','02','08','MUÑANI'),
 ('20','02','10','POTONI'),
 ('20','02','12','SAMAN'),
 ('20','02','13','SAN ANTON'),
 ('20','02','14','SAN JOSE'),
 ('20','02','15','SAN JUAN DE SALINAS'),
 ('20','02','16','SANTIAGO DE PUPUJA'),
 ('20','02','17','TIRAPATA'),
 ('20','03','01','MACUSANI'),
 ('20','03','02','AJOYANI'),
 ('20','03','03','AYAPATA'),
 ('20','03','04','COASA'),
 ('20','03','05','CORANI'),
 ('20','03','06','CRUCERO'),
 ('20','03','07','ITUATA'),
 ('20','03','08','OLLACHEA'),
 ('20','03','09','SAN GABAN'),
 ('20','03','10','USICAYOS'),
 ('20','04','01','JULI'),
 ('20','04','02','DESAGUADERO'),
 ('20','04','03','HUACULLANI'),
 ('20','04','06','PISACOMA'),
 ('20','04','07','POMATA'),
 ('20','04','10','ZEPITA'),
 ('20','04','12','KELLUYO'),
 ('20','05','01','HUANCANE'),
 ('20','05','02','COJATA'),
 ('20','05','04','INCHUPALLA'),
 ('20','05','06','PUSI'),
 ('20','05','07','ROSASPATA'),
 ('20','05','08','TARACO'),
 ('20','05','09','VILQUE CHICO'),
 ('20','05','11','HUATASANI'),
 ('20','06','01','LAMPA'),
 ('20','06','02','CABANILLA'),
 ('20','06','03','CALAPUJA'),
 ('20','06','04','NICASIO'),
 ('20','06','05','OCUVIRI'),
 ('20','06','06','PALCA'),
 ('20','06','07','PARATIA'),
 ('20','06','08','PUCARA'),
 ('20','06','09','SANTA LUCIA'),
 ('20','06','10','VILAVILA'),
 ('20','07','01','AYAVIRI'),
 ('20','07','02','ANTAUTA'),
 ('20','07','03','CUPI'),
 ('20','07','04','LLALLI'),
 ('20','07','05','MACARI'),
 ('20','07','06','NUÑOA'),
 ('20','07','07','ORURILLO'),
 ('20','07','08','SANTA ROSA'),
 ('20','07','09','UMACHIRI'),
 ('20','08','01','SANDIA'),
 ('20','08','03','CUYOCUYO'),
 ('20','08','04','LIMBANI'),
 ('20','08','05','PHARA'),
 ('20','08','06','PATAMBUCO'),
 ('20','08','07','QUIACA'),
 ('20','08','08','SAN JUAN DEL ORO'),
 ('20','08','10','YANAHUAYA'),
 ('20','08','11','ALTO INAMBARI'),
 ('20','08','12','SAN PEDRO DE PUTINA PUNCO'),
 ('20','09','01','JULIACA'),
 ('20','09','02','CABANA'),
 ('20','09','03','CABANILLAS'),
 ('20','09','04','CARACOTO'),
 ('20','10','01','YUNGUYO'),
 ('20','10','02','UNICACHI'),
 ('20','10','03','ANAPIA'),
 ('20','10','04','COPANI'),
 ('20','10','05','CUTURAPI'),
 ('20','10','06','OLLARAYA'),
 ('20','10','07','TINICACHI'),
 ('20','11','01','PUTINA'),
 ('20','11','02','PEDRO VILCA APAZA'),
 ('20','11','03','QUILCAPUNCU'),
 ('20','11','04','ANANEA'),
 ('20','11','05','SINA'),
 ('20','12','01','ILAVE'),
 ('20','12','02','PILCUYO'),
 ('20','12','03','SANTA ROSA'),
 ('20','12','04','CAPASO'),
 ('20','12','05','CONDURIRI'),
 ('20','13','01','MOHO'),
 ('20','13','02','CONIMA'),
 ('20','13','03','TILALI'),
 ('20','13','04','HUAYRAPATA'),
 ('21','01','01','MOYOBAMBA'),
 ('21','01','02','CALZADA'),
 ('21','01','03','HABANA'),
 ('21','01','04','JEPELACIO'),
 ('21','01','05','SORITOR'),
 ('21','01','06','YANTALO'),
 ('21','02','01','SAPOSOA'),
 ('21','02','02','PISCOYACU'),
 ('21','02','03','SACANCHE'),
 ('21','02','04','TINGO DE SAPOSOA'),
 ('21','02','05','ALTO SAPOSOA'),
 ('21','02','06','EL ESLABON'),
 ('21','03','01','LAMAS'),
 ('21','03','03','BARRANQUITA'),
 ('21','03','04','CAYNARACHI'),
 ('21','03','05','CUÑUMBUQUI'),
 ('21','03','06','PINTO RECODO'),
 ('21','03','07','RUMISAPA'),
 ('21','03','11','SHANAO'),
 ('21','03','13','TABALOSOS'),
 ('21','03','14','ZAPATERO'),
 ('21','03','15','ALONSO DE ALVARADO'),
 ('21','03','16','SAN ROQUE DE CUMBAZA'),
 ('21','04','01','JUANJUI'),
 ('21','04','02','CAMPANILLA'),
 ('21','04','03','HUICUNGO'),
 ('21','04','04','PACHIZA'),
 ('21','04','05','PAJARILLO'),
 ('21','05','01','RIOJA'),
 ('21','05','02','POSIC'),
 ('21','05','03','YORONGOS'),
 ('21','05','04','YURACYACU'),
 ('21','05','05','NUEVA CAJAMARCA'),
 ('21','05','06','ELIAS SOPLIN VARGAS'),
 ('21','05','07','SAN FERNANDO'),
 ('21','05','08','PARDO MIGUEL'),
 ('21','05','09','AWAJUN'),
 ('21','06','01','TARAPOTO'),
 ('21','06','02','ALBERTO LEVEAU'),
 ('21','06','04','CACATACHI'),
 ('21','06','06','CHAZUTA'),
 ('21','06','07','CHIPURANA'),
 ('21','06','08','EL PORVENIR'),
 ('21','06','09','HUIMBAYOC'),
 ('21','06','10','JUAN GUERRA'),
 ('21','06','11','MORALES'),
 ('21','06','12','PAPAPLAYA'),
 ('21','06','16','SAN ANTONIO'),
 ('21','06','19','SAUCE'),
 ('21','06','20','SHAPAJA'),
 ('21','06','21','LA BANDA DE SHILCAYO'),
 ('21','07','01','BELLAVISTA'),
 ('21','07','02','SAN RAFAEL'),
 ('21','07','03','SAN PABLO'),
 ('21','07','04','ALTO BIAVO'),
 ('21','07','05','HUALLAGA'),
 ('21','07','06','BAJO BIAVO'),
 ('21','08','01','TOCACHE'),
 ('21','08','02','NUEVO PROGRESO'),
 ('21','08','03','POLVORA'),
 ('21','08','04','SHUNTE'),
 ('21','08','05','UCHIZA'),
 ('21','09','01','PICOTA'),
 ('21','09','02','BUENOS AIRES'),
 ('21','09','03','CASPIZAPA'),
 ('21','09','04','PILLUANA'),
 ('21','09','05','PUCACACA'),
 ('21','09','06','SAN CRISTOBAL'),
 ('21','09','07','SAN HILARION'),
 ('21','09','08','TINGO DE PONASA'),
 ('21','09','09','TRES UNIDOS'),
 ('21','09','10','SHAMBOYACU'),
 ('21','10','01','SAN JOSE DE SISA'),
 ('21','10','02','AGUA BLANCA'),
 ('21','10','03','SHATOJA'),
 ('21','10','04','SAN MARTIN'),
 ('21','10','05','SANTA ROSA'),
 ('22','01','01','TACNA'),
 ('22','01','02','CALANA'),
 ('22','01','04','INCLAN'),
 ('22','01','07','PACHIA'),
 ('22','01','08','PALCA'),
 ('22','01','09','POCOLLAY'),
 ('22','01','10','SAMA'),
 ('22','01','11','ALTO DE LA ALIANZA'),
 ('22','01','12','CIUDAD NUEVA'),
 ('22','01','13','CORONEL GREGORIO ALBARRACIN L.'),
 ('22','02','01','TARATA'),
 ('22','02','05','HEROES ALBARRACIN'),
 ('22','02','06','ESTIQUE'),
 ('22','02','07','ESTIQUE PAMPA'),
 ('22','02','10','SITAJARA'),
 ('22','02','11','SUSAPAYA'),
 ('22','02','12','TARUCACHI'),
 ('22','02','13','TICACO'),
 ('22','03','01','LOCUMBA'),
 ('22','03','02','ITE'),
 ('22','03','03','ILABAYA'),
 ('22','04','01','CANDARAVE'),
 ('22','04','02','CAIRANI'),
 ('22','04','03','CURIBAYA'),
 ('22','04','04','HUANUARA'),
 ('22','04','05','QUILAHUANI'),
 ('22','04','06','CAMILACA'),
 ('23','01','01','TUMBES'),
 ('23','01','02','CORRALES'),
 ('23','01','03','LA CRUZ'),
 ('23','01','04','PAMPAS DE HOSPITAL'),
 ('23','01','05','SAN JACINTO'),
 ('23','01','06','SAN JUAN DE LA VIRGEN'),
 ('23','02','01','ZORRITOS'),
 ('23','02','02','CASITAS'),
 ('23','02','03','CANOAS DE PUNTA SAL'),
 ('23','03','01','ZARUMILLA'),
 ('23','03','02','MATAPALO'),
 ('23','03','03','PAPAYAL'),
 ('23','03','04','AGUAS VERDES'),
 ('24','01','01','CALLAO'),
 ('24','01','02','BELLAVISTA'),
 ('24','01','03','LA PUNTA'),
 ('24','01','04','CARMEN DE LA LEGUA-REYNOSO'),
 ('24','01','05','LA PERLA'),
 ('24','01','06','VENTANILLA'),
 ('25','01','01','CALLERIA'),
 ('25','01','02','YARINACOCHA'),
 ('25','01','03','MASISEA'),
 ('25','01','04','CAMPOVERDE'),
 ('25','01','05','IPARIA'),
 ('25','01','06','NUEVA REQUENA'),
 ('25','01','07','MANANTAY'),
 ('25','02','01','PADRE ABAD'),
 ('25','02','02','IRAZOLA'),
 ('25','02','03','CURIMANA'),
 ('25','03','01','RAIMONDI'),
 ('25','03','02','TAHUANIA'),
 ('25','03','03','YURUA'),
 ('25','03','04','SEPAHUA'),
 ('25','04','01','PURUS');
/*!40000 ALTER TABLE `distrito` ENABLE KEYS */;


--
-- Definition of table `documento`
--

DROP TABLE IF EXISTS `documento`;
CREATE TABLE `documento` (
  `idDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `Referencia` int(11) DEFAULT NULL COMMENT 'referencia',
  `Documento` varchar(200) NOT NULL,
  `Asunto` varchar(80) NOT NULL,
  `Folios` int(11) DEFAULT NULL,
  `Tomos` varchar(15) DEFAULT NULL,
  `FecRecep` date DEFAULT NULL,
  `FecControl` datetime DEFAULT NULL,
  `Descripcion` varchar(300) DEFAULT NULL,
  `Observacion` varchar(300) DEFAULT NULL,
  `Tipo_Ingreso` varchar(45) DEFAULT NULL COMMENT 'externos e internos',
  `idInstitucion` int(11) DEFAULT NULL,
  `idPersona` int(11) DEFAULT NULL,
  `idArea` int(11) DEFAULT NULL,
  `idCATEGORIA` int(11) NOT NULL,
  `idEstado` int(11) NOT NULL,
  `idExpediente` int(11) NOT NULL,
  `idTrabajador` int(11) NOT NULL,
  `idPrioridad` int(11) NOT NULL,
  PRIMARY KEY (`idDocumento`),
  UNIQUE KEY `codDoc_UNIQUE` (`Documento`),
  KEY `fk_DOCUMENTO_Institucion1_idx` (`idInstitucion`),
  KEY `fk_DOCUMENTO_CATEGORIA1_idx` (`idCATEGORIA`),
  KEY `fk_DOCUMENTO_PERSONA1_idx` (`idPersona`),
  KEY `fk_DOCUMENTO_Estado1_idx` (`idEstado`),
  KEY `fk_DOCUMENTO_Expediente1_idx` (`idExpediente`),
  KEY `fk_DOCUMENTO_TRABAJADOR1_idx` (`idTrabajador`),
  KEY `fk_DOCUMENTO_DOCUMENTO1_idx` (`Referencia`),
  KEY `fk_DOCUMENTO_Prioridad1_idx` (`idPrioridad`),
  KEY `fk_DOCUMENTO_AREA1_idx` (`idArea`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `documento`
--

/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` (`idDocumento`,`Referencia`,`Documento`,`Asunto`,`Folios`,`Tomos`,`FecRecep`,`FecControl`,`Descripcion`,`Observacion`,`Tipo_Ingreso`,`idInstitucion`,`idPersona`,`idArea`,`idCATEGORIA`,`idEstado`,`idExpediente`,`idTrabajador`,`idPrioridad`) VALUES 
 (1,NULL,'ASDFA','ASDASF',1,'01','2016-06-09','2016-06-09 03:15:23',NULL,NULL,'INTERNO',NULL,NULL,3,1,3,1,1,2),
 (2,NULL,'REGWG','SDGER',1,'01','2016-06-09','2016-06-09 03:15:53',NULL,NULL,'EXTERNO',1,NULL,NULL,2,3,2,1,3),
 (3,NULL,'ASDLKJAF','QSLDJKHFALH',0,'0','2016-06-09','2016-06-09 12:01:18',NULL,NULL,'EXTERNO',1,NULL,NULL,3,3,3,2,1),
 (4,NULL,'EQRKGQÑG','WLIUTGW',1,'01','2016-06-09','2016-06-09 12:09:44',NULL,NULL,'EXTERNO',1,NULL,NULL,1,3,4,2,1);
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;


--
-- Definition of table `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estado`
--

/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`idEstado`,`Descripcion`) VALUES 
 (1,'ANULADO'),
 (2,'VENCIDO'),
 (3,'EN TRAMITE'),
 (4,'ARCHIVADO');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;


--
-- Definition of table `expediente`
--

DROP TABLE IF EXISTS `expediente`;
CREATE TABLE `expediente` (
  `idExpediente` int(11) NOT NULL AUTO_INCREMENT,
  `NumExp` char(15) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idExpediente`),
  UNIQUE KEY `NumExp_UNIQUE` (`NumExp`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `expediente`
--

/*!40000 ALTER TABLE `expediente` DISABLE KEYS */;
INSERT INTO `expediente` (`idExpediente`,`NumExp`,`descripcion`) VALUES 
 (1,'001-2016','DERIVADO A 2'),
 (2,'002-2016','DERIVADO A 3'),
 (3,'003-2016','DERIVADO A 2'),
 (4,'004-2016','DERIVADO A 3');
/*!40000 ALTER TABLE `expediente` ENABLE KEYS */;


--
-- Definition of table `formularios`
--

DROP TABLE IF EXISTS `formularios`;
CREATE TABLE `formularios` (
  `idFORMULARIOS` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFORMULARIOS`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `formularios`
--

/*!40000 ALTER TABLE `formularios` DISABLE KEYS */;
INSERT INTO `formularios` (`idFORMULARIOS`,`descripcion`) VALUES 
 (1,'Registro de Empleados'),
 (2,'Registro de Usuarios'),
 (3,'Categoria de Documentos'),
 (4,'Registro de Cargos'),
 (5,'Tramite'),
 (6,'Reportes');
/*!40000 ALTER TABLE `formularios` ENABLE KEYS */;


--
-- Definition of table `historico_usuario`
--

DROP TABLE IF EXISTS `historico_usuario`;
CREATE TABLE `historico_usuario` (
  `ID` varchar(45) NOT NULL,
  `idTrabajador` int(11) NOT NULL,
  `fecha_Inicio` date DEFAULT NULL,
  `F_fin` date DEFAULT NULL,
  `F_creacion` datetime DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`,`idTrabajador`),
  KEY `fk_USUARIO_has_TRABAJADOR_TRABAJADOR1_idx` (`idTrabajador`),
  KEY `fk_USUARIO_has_TRABAJADOR_USUARIO1_idx` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `historico_usuario`
--

/*!40000 ALTER TABLE `historico_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_usuario` ENABLE KEYS */;


--
-- Definition of table `institucion`
--

DROP TABLE IF EXISTS `institucion`;
CREATE TABLE `institucion` (
  `idInstitucion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telf` varchar(45) DEFAULT NULL,
  `idDEPARTAMENTO` char(2) NOT NULL,
  `idPROVINCIA` char(2) NOT NULL,
  `idDISTRITO` char(2) NOT NULL,
  `idTipo` int(11) NOT NULL,
  `idPersona` int(11) DEFAULT NULL COMMENT 'REMITENTE O REP LEGAL',
  PRIMARY KEY (`idInstitucion`),
  KEY `fk_Institucion_DISTRITO1_idx` (`idDEPARTAMENTO`,`idPROVINCIA`,`idDISTRITO`),
  KEY `fk_Institucion_Tipo1_idx` (`idTipo`),
  KEY `fk_Institucion_PERSONA1_idx` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `institucion`
--

/*!40000 ALTER TABLE `institucion` DISABLE KEYS */;
INSERT INTO `institucion` (`idInstitucion`,`nombre`,`Direccion`,`Telf`,`idDEPARTAMENTO`,`idPROVINCIA`,`idDISTRITO`,`idTipo`,`idPersona`) VALUES 
 (1,'MUNI','','','02','01','02',1,NULL);
/*!40000 ALTER TABLE `institucion` ENABLE KEYS */;


--
-- Definition of table `nota`
--

DROP TABLE IF EXISTS `nota`;
CREATE TABLE `nota` (
  `idNOTA` int(11) NOT NULL AUTO_INCREMENT,
  `Mensaje` varchar(300) DEFAULT NULL,
  `Asunto` varchar(45) NOT NULL,
  `FecEmision` date NOT NULL,
  `idDeriv` int(11) NOT NULL,
  `idTrabajador` int(11) NOT NULL,
  PRIMARY KEY (`idNOTA`),
  KEY `fk_NOTA_DERIVACION1_idx` (`idDeriv`,`idTrabajador`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nota`
--

/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
INSERT INTO `nota` (`idNOTA`,`Mensaje`,`Asunto`,`FecEmision`,`idDeriv`,`idTrabajador`) VALUES 
 (1,' REVISAR, DEMAS, ','solucionalo mierda','2016-06-09',1,1),
 (2,' CONOCIMIENTO, REVISAR, ','tu tambien solucionalo mierda','2016-06-09',2,1),
 (3,' REVISAR, ','','2016-06-09',3,3),
 (4,' REVISAR, ','','2016-06-09',4,2),
 (5,' REVISAR, ','se resolvio en uan','2016-06-09',5,2),
 (6,' REVISAR, ','GAYY','2016-06-09',6,2);
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;


--
-- Definition of table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
  `ID` varchar(45) NOT NULL,
  `idFORMULARIOS` int(11) NOT NULL,
  `permiso` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`,`idFORMULARIOS`),
  KEY `fk_USUARIO_has_FORMULARIOS_FORMULARIOS1_idx` (`idFORMULARIOS`),
  KEY `fk_USUARIO_has_FORMULARIOS_USUARIO1_idx` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permisos`
--

/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` (`ID`,`idFORMULARIOS`,`permiso`) VALUES 
 ('arnold',1,0),
 ('arnold',2,0),
 ('arnold',3,1),
 ('arnold',4,1),
 ('arnold',5,1),
 ('arnold',6,1),
 ('Cgonzales',1,0),
 ('Cgonzales',2,0),
 ('Cgonzales',3,1),
 ('Cgonzales',4,1),
 ('Cgonzales',5,1),
 ('Cgonzales',6,1),
 ('moreno',1,0),
 ('moreno',2,0),
 ('moreno',3,1),
 ('moreno',4,1),
 ('moreno',5,1),
 ('moreno',6,1);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;


--
-- Definition of table `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `DNI` char(8) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `idDEPARTAMENTO` char(2) NOT NULL,
  `idPROVINCIA` char(2) NOT NULL,
  `idDISTRITO` char(2) NOT NULL,
  PRIMARY KEY (`idPersona`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`),
  KEY `fk_PERSONA_DISTRITO1_idx` (`idDEPARTAMENTO`,`idPROVINCIA`,`idDISTRITO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `persona`
--

/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`idPersona`,`DNI`,`apellidos`,`nombres`,`sexo`,`Direccion`,`telefono`,`email`,`idDEPARTAMENTO`,`idPROVINCIA`,`idDISTRITO`) VALUES 
 (1,'45564184','GONZALES RAMOS','CARLOS','M','','','','02','01','02'),
 (2,'48365243','NORABUENA ARANDA','ARNOLD','M','','','a','02','01','01'),
 (3,'70759644','MORENO VEGA','LENIN ELIO','M','','','','02','01','01');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;


--
-- Definition of table `prioridad`
--

DROP TABLE IF EXISTS `prioridad`;
CREATE TABLE `prioridad` (
  `idPrioridad` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `dias` int(11) DEFAULT NULL,
  `idANO` int(11) NOT NULL,
  PRIMARY KEY (`idPrioridad`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`),
  KEY `fk_Prioridad_ANO1_idx` (`idANO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prioridad`
--

/*!40000 ALTER TABLE `prioridad` DISABLE KEYS */;
INSERT INTO `prioridad` (`idPrioridad`,`Nombre`,`descripcion`,`dias`,`idANO`) VALUES 
 (1,'MUY URGENTE',NULL,1,1),
 (2,'URGENTE',NULL,2,1),
 (3,'NORMAL',NULL,5,1);
/*!40000 ALTER TABLE `prioridad` ENABLE KEYS */;


--
-- Definition of table `proveido`
--

DROP TABLE IF EXISTS `proveido`;
CREATE TABLE `proveido` (
  `idProveido` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`idProveido`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proveido`
--

/*!40000 ALTER TABLE `proveido` DISABLE KEYS */;
INSERT INTO `proveido` (`idProveido`,`Descripcion`) VALUES 
 (1,'REVISAR'),
 (2,'CONOCIMIENTO'),
 (3,'DEMAS');
/*!40000 ALTER TABLE `proveido` ENABLE KEYS */;


--
-- Definition of table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
CREATE TABLE `provincia` (
  `idDEPARTAMENTO` char(2) NOT NULL,
  `idPROVINCIA` char(2) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idDEPARTAMENTO`,`idPROVINCIA`),
  KEY `fk_PROVINCIA_DEPARTAMENTO1_idx` (`idDEPARTAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provincia`
--

/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` (`idDEPARTAMENTO`,`idPROVINCIA`,`nombre`) VALUES 
 ('01','01','CHACHAPOYAS'),
 ('01','02','BAGUA'),
 ('01','03','BONGARA'),
 ('01','04','LUYA'),
 ('01','05','RODRIGUEZ DE MENDOZA'),
 ('01','06','CONDORCANQUI'),
 ('01','07','UTCUBAMBA'),
 ('02','01','HUARAZ'),
 ('02','02','AIJA'),
 ('02','03','BOLOGNESI'),
 ('02','04','CARHUAZ'),
 ('02','05','CASMA'),
 ('02','06','CORONGO'),
 ('02','07','HUAYLAS'),
 ('02','08','HUARI'),
 ('02','09','MARISCAL LUZURIAGA'),
 ('02','10','PALLASCA'),
 ('02','11','POMABAMBA'),
 ('02','12','RECUAY'),
 ('02','13','SANTA'),
 ('02','14','SIHUAS'),
 ('02','15','YUNGAY'),
 ('02','16','ANTONIO RAIMONDI'),
 ('02','17','CARLOS FERMIN FITZCARRALD'),
 ('02','18','ASUNCION'),
 ('02','19','HUARMEY'),
 ('02','20','OCROS'),
 ('03','01','ABANCAY'),
 ('03','02','AYMARAES'),
 ('03','03','ANDAHUAYLAS'),
 ('03','04','ANTABAMBA'),
 ('03','05','COTABAMBAS'),
 ('03','06','GRAU'),
 ('03','07','CHINCHEROS'),
 ('04','01','AREQUIPA'),
 ('04','02','CAYLLOMA'),
 ('04','03','CAMANA'),
 ('04','04','CARAVELI'),
 ('04','05','CASTILLA'),
 ('04','06','CONDESUYOS'),
 ('04','07','ISLAY'),
 ('04','08','LA UNION'),
 ('05','01','HUAMANGA'),
 ('05','02','CANGALLO'),
 ('05','03','HUANTA'),
 ('05','04','LA MAR'),
 ('05','05','LUCANAS'),
 ('05','06','PARINACOCHAS'),
 ('05','07','VICTOR FAJARDO'),
 ('05','08','HUANCA SANCOS'),
 ('05','09','VILCAS HUAMAN'),
 ('05','10','PAUCAR DEL SARA SARA'),
 ('05','11','SUCRE'),
 ('06','01','CAJAMARCA'),
 ('06','02','CAJABAMBA'),
 ('06','03','CELENDIN'),
 ('06','04','CONTUMAZA'),
 ('06','05','CUTERVO'),
 ('06','06','CHOTA'),
 ('06','07','HUALGAYOC'),
 ('06','08','JAEN'),
 ('06','09','SANTA CRUZ'),
 ('06','10','SAN MIGUEL'),
 ('06','11','SAN IGNACIO'),
 ('06','12','SAN MARCOS'),
 ('06','13','SAN PABLO'),
 ('07','01','CUSCO'),
 ('07','02','ACOMAYO'),
 ('07','03','ANTA'),
 ('07','04','CALCA'),
 ('07','05','CANAS'),
 ('07','06','CANCHIS'),
 ('07','07','CHUMBIVILCAS'),
 ('07','08','ESPINAR'),
 ('07','09','LA CONVENCION'),
 ('07','10','PARURO'),
 ('07','11','PAUCARTAMBO'),
 ('07','12','QUISPICANCHI'),
 ('07','13','URUBAMBA'),
 ('08','01','HUANCAVELICA'),
 ('08','02','ACOBAMBA'),
 ('08','03','ANGARAES'),
 ('08','04','CASTROVIRREYNA'),
 ('08','05','TAYACAJA'),
 ('08','06','HUAYTARA'),
 ('08','07','CHURCAMPA'),
 ('09','01','HUANUCO'),
 ('09','02','AMBO'),
 ('09','03','DOS DE MAYO'),
 ('09','04','HUAMALIES'),
 ('09','05','MARAÑON'),
 ('09','06','LEONCIO PRADO'),
 ('09','07','PACHITEA'),
 ('09','08','PUERTO INCA'),
 ('09','09','HUACAYBAMBA'),
 ('09','10','LAURICOCHA'),
 ('09','11','YAROWILCA'),
 ('10','01','ICA'),
 ('10','02','CHINCHA'),
 ('10','03','NAZCA'),
 ('10','04','PISCO'),
 ('10','05','PALPA'),
 ('11','01','HUANCAYO'),
 ('11','02','CONCEPCION'),
 ('11','03','JAUJA'),
 ('11','04','JUNIN'),
 ('11','05','TARMA'),
 ('11','06','YAULI'),
 ('11','07','SATIPO'),
 ('11','08','CHANCHAMAYO'),
 ('11','09','CHUPACA'),
 ('12','01','TRUJILLO'),
 ('12','02','BOLIVAR'),
 ('12','03','SANCHEZ CARRION'),
 ('12','04','OTUZCO'),
 ('12','05','PACASMAYO'),
 ('12','06','PATAZ'),
 ('12','07','SANTIAGO DE CHUCO'),
 ('12','08','ASCOPE'),
 ('12','09','CHEPEN'),
 ('12','10','JULCAN'),
 ('12','11','GRAN CHIMU'),
 ('12','12','VIRU'),
 ('13','01','CHICLAYO'),
 ('13','02','FERREÑAFE'),
 ('13','03','LAMBAYEQUE'),
 ('14','01','LIMA'),
 ('14','02','CAJATAMBO'),
 ('14','03','CANTA'),
 ('14','04','CAÑETE'),
 ('14','05','HUAURA'),
 ('14','06','HUAROCHIRI'),
 ('14','07','YAUYOS'),
 ('14','08','HUARAL'),
 ('14','09','BARRANCA'),
 ('14','10','OYON'),
 ('15','01','MAYNAS'),
 ('15','02','ALTO AMAZONAS'),
 ('15','03','LORETO'),
 ('15','04','REQUENA'),
 ('15','05','UCAYALI'),
 ('15','06','MARISCAL RAMON CASTILLA'),
 ('15','07','DATEM DEL MARAÑON'),
 ('16','01','TAMBOPATA'),
 ('16','02','MANU'),
 ('16','03','TAHUAMANU'),
 ('17','01','MARISCAL NIETO'),
 ('17','02','GENERAL SANCHEZ CERRO'),
 ('17','03','ILO'),
 ('18','01','PASCO'),
 ('18','02','DANIEL ALCIDES CARRION'),
 ('18','03','OXAPAMPA'),
 ('19','01','PIURA'),
 ('19','02','AYABACA'),
 ('19','03','HUANCABAMBA'),
 ('19','04','MORROPON'),
 ('19','05','PAITA'),
 ('19','06','SULLANA'),
 ('19','07','TALARA'),
 ('19','08','SECHURA'),
 ('20','01','PUNO'),
 ('20','02','AZANGARO'),
 ('20','03','CARABAYA'),
 ('20','04','CHUCUITO'),
 ('20','05','HUANCANE'),
 ('20','06','LAMPA'),
 ('20','07','MELGAR'),
 ('20','08','SANDIA'),
 ('20','09','SAN ROMAN'),
 ('20','10','YUNGUYO'),
 ('20','11','SAN ANTONIO DE PUTINA'),
 ('20','12','EL COLLAO'),
 ('20','13','MOHO'),
 ('21','01','MOYOBAMBA'),
 ('21','02','HUALLAGA'),
 ('21','03','LAMAS'),
 ('21','04','MARISCAL CACERES'),
 ('21','05','RIOJA'),
 ('21','06','SAN MARTIN'),
 ('21','07','BELLAVISTA'),
 ('21','08','TOCACHE'),
 ('21','09','PICOTA'),
 ('21','10','EL DORADO'),
 ('22','01','TACNA'),
 ('22','02','TARATA'),
 ('22','03','JORGE BASADRE'),
 ('22','04','CANDARAVE'),
 ('23','01','TUMBES'),
 ('23','02','CONTRALMIRANTE VILLAR'),
 ('23','03','ZARUMILLA'),
 ('24','01','CALLAO'),
 ('25','01','CORONEL PORTILLO'),
 ('25','02','PADRE ABAD'),
 ('25','03','ATALAYA'),
 ('25','04','PURUS');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;


--
-- Definition of table `recepcion`
--

DROP TABLE IF EXISTS `recepcion`;
CREATE TABLE `recepcion` (
  `idNOTA` int(11) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `idTrabajador` int(11) NOT NULL,
  PRIMARY KEY (`idNOTA`,`idTrabajador`),
  KEY `fk_TRABAJADOR_has_NOTA_NOTA1_idx` (`idNOTA`),
  KEY `fk_Recepcion_TRABAJADOR1_idx` (`idTrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recepcion`
--

/*!40000 ALTER TABLE `recepcion` DISABLE KEYS */;
INSERT INTO `recepcion` (`idNOTA`,`Estado`,`idTrabajador`) VALUES 
 (1,'DERIVADO A 2',2),
 (2,'DERIVADO A 3',3),
 (3,'DERIVADO A SOLUCION',3),
 (4,'DERIVADO A SOLUCION',2),
 (5,'DERIVADO A SOLUCION',2),
 (6,'ACEPTADO',3);
/*!40000 ALTER TABLE `recepcion` ENABLE KEYS */;


--
-- Definition of table `seguimiento`
--

DROP TABLE IF EXISTS `seguimiento`;
CREATE TABLE `seguimiento` (
  `idSEGUIMIENTO` int(11) NOT NULL AUTO_INCREMENT,
  `idDeriv` int(11) NOT NULL,
  `idTrabajadorEmi` int(11) NOT NULL,
  `idTrabajadorRec` int(11) NOT NULL,
  `idNOTA` int(11) NOT NULL,
  PRIMARY KEY (`idSEGUIMIENTO`),
  KEY `fk_SEGUIMIENTO_Recepcion1_idx` (`idNOTA`,`idTrabajadorRec`),
  KEY `fk_SEGUIMIENTO_DERIVACION1_idx` (`idDeriv`,`idTrabajadorEmi`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seguimiento`
--

/*!40000 ALTER TABLE `seguimiento` DISABLE KEYS */;
INSERT INTO `seguimiento` (`idSEGUIMIENTO`,`idDeriv`,`idTrabajadorEmi`,`idTrabajadorRec`,`idNOTA`) VALUES 
 (1,1,1,2,1),
 (2,2,1,3,2),
 (3,3,3,3,3),
 (4,4,2,2,4),
 (5,5,2,2,5),
 (6,6,2,3,6);
/*!40000 ALTER TABLE `seguimiento` ENABLE KEYS */;


--
-- Definition of table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
CREATE TABLE `tipo` (
  `idTipo` int(11) NOT NULL AUTO_INCREMENT,
  `caracteristica` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo`
--

/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` (`idTipo`,`caracteristica`) VALUES 
 (1,'PUBLICA'),
 (2,'PRIVADA');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;


--
-- Definition of table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
CREATE TABLE `trabajador` (
  `idTrabajador` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL COMMENT 'Campo en caso de que sea el jefe del area u otra descripciono observacion',
  `idCARGO` int(11) DEFAULT NULL,
  `idPersona` int(11) NOT NULL,
  `idArea` int(11) NOT NULL,
  PRIMARY KEY (`idTrabajador`),
  UNIQUE KEY `idPersona_UNIQUE` (`idPersona`),
  KEY `fk_TRABAJADOR_CARGO_idx` (`idCARGO`),
  KEY `fk_TRABAJADOR_PERSONA1_idx` (`idPersona`),
  KEY `fk_TRABAJADOR_AREA1_idx` (`idArea`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trabajador`
--

/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` (`idTrabajador`,`estado`,`descripcion`,`idCARGO`,`idPersona`,`idArea`) VALUES 
 (1,1,NULL,2,1,2),
 (2,1,NULL,1,2,1),
 (3,1,NULL,3,3,5);
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `ID` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `codigo_sec` varchar(45) NOT NULL,
  `idTrabajador` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_USUARIO_TRABAJADOR1_idx` (`idTrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`ID`,`clave`,`codigo_sec`,`idTrabajador`,`estado`) VALUES 
 ('ADMIN','e10adc3949ba59abbe56e057f20f883e','7c4a8d09ca3762af61e59520943dc26494f8941b',0,1),
 ('arnold','e10adc3949ba59abbe56e057f20f883e','',2,1),
 ('Cgonzales','e10adc3949ba59abbe56e057f20f883e','',1,1),
 ('moreno','e10adc3949ba59abbe56e057f20f883e','',3,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


--
-- Definition of trigger `ingresa_permisos`
--

DROP TRIGGER /*!50030 IF EXISTS */ `ingresa_permisos`;

DELIMITER $$

CREATE DEFINER = `root`@`localhost` TRIGGER `ingresa_permisos` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
INSERT INTO permisos VALUES (NEW.ID,1,0);
INSERT INTO permisos VALUES (NEW.ID,2,0);
INSERT INTO permisos VALUES (NEW.ID,3,0);
INSERT INTO permisos VALUES (NEW.ID,4,0);
INSERT INTO permisos VALUES (NEW.ID,5,0);
INSERT INTO permisos VALUES (NEW.ID,6,0);
END $$

DELIMITER ;

--
-- Definition of function `referencia`
--

DROP FUNCTION IF EXISTS `referencia`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `referencia`(ref int) RETURNS varchar(200) CHARSET utf8
BEGIN
DECLARE refer VARCHAR(200);
SELECT documento into refer FROM documento WHERE iddocumento=ref;
RETURN refer;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `crea_trabajador`
--

DROP PROCEDURE IF EXISTS `crea_trabajador`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `crea_trabajador`(IN `dni` varchar(8),IN `apellidos` varchar(100),IN `nombres` varchar(100),IN `sexo` varchar(1),IN `direccion` varchar(100),IN `telefono` varchar(45),IN `email` varchar(45),IN `dep` varchar(45),IN `prov` varchar(45),IN `dist` varchar(45),IN `idarea` int,IN `idcargo` int)
BEGIN
DECLARE idP INT DEFAULT 0;
SELECT persona.idPersona INTO idP FROM persona WHERE persona.DNI=dni;
IF idP = 0 THEN
INSERT INTO persona VALUES (DEFAULT,dni,apellidos,nombres,sexo,direccion,telefono,email,dep,prov,dist);
SET idP=(SELECT persona.idPersona FROM persona WHERE persona.DNI=dni);
END IF;
INSERT INTO trabajador VALUES (DEFAULT,1,null,idcargo,idP,idarea);
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `Derivar`
--

DROP PROCEDURE IF EXISTS `Derivar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Derivar`(IN `emisor` int,IN `receptor` int,IN `idExpediente` int,IN `mensaje` varchar(300),IN `asunto` varchar(45),IN `notaPas` int)
BEGIN
INSERT INTO derivacion VALUES (DEFAULT,emisor,NOW(),null,null,idExpediente);
SET @idDer=(SELECT idDeriv FROM derivacion ORDER BY idDeriv DESC LIMIT 1);
INSERT INTO nota VALUES (DEFAULT,mensaje,asunto,CURDATE(),@idDer,emisor);
SET @idNota=(SELECT idnota FROM nota ORDER BY idnota DESC LIMIT 1);
INSERT INTO recepcion VALUES (@idNota,'PENDIENTE',receptor);
UPDATE recepcion SET recepcion.Estado=CONCAT('DERIVADO A ',receptor) WHERE recepcion.idNOTA=notaPas AND recepcion.idTrabajador=emisor;
INSERT INTO seguimiento VALUES (DEFAULT,@idDer,emisor,receptor,@idNota);
UPDATE expediente SET expediente.descripcion=CONCAT('DERIVADO A ',receptor) WHERE expediente.idExpediente=idExpediente;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `modifica_trabajador`
--

DROP PROCEDURE IF EXISTS `modifica_trabajador`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `modifica_trabajador`(IN id INT,IN `dni` varchar(8),IN `apellidos` varchar(100),IN `nombres` varchar(100),IN `sexo` varchar(1),IN `direccion` varchar(100),IN `telefono` varchar(45),IN `email` varchar(45),IN `dep` varchar(45),IN `prov` varchar(45),IN `dist` varchar(45),IN `idarea` int,IN `idcargo` int)
BEGIN
DECLARE idP INT DEFAULT 0;
SELECT persona.idPersona INTO idP FROM persona WHERE persona.DNI=dni;
IF idP = 0 THEN
INSERT INTO persona VALUES (DEFAULT,dni,apellidos,nombres,sexo,direccion,telefono,email,dep,prov,dist);
SET idP=(SELECT persona.idPersona FROM persona WHERE persona.DNI=dni);
ELSE
UPDATE persona
SET persona.DNI=dni,persona.apellidos=apellidos,persona.nombres=nombres,persona.sexo=sexo,persona.Direccion=direccion,persona.telefono=telefono,persona.email=email,persona.idDEPARTAMENTO=dep,persona.idPROVINCIA=prov,persona.idDISTRITO=dist
WHERE persona.idPersona=idP;
END IF;
UPDATE trabajador
SET trabajador.idCARGO=idcargo,trabajador.idPersona=idP,trabajador.idArea=idarea
WHERE trabajador.idTrabajador=id;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view `ver_documento`
--

DROP TABLE IF EXISTS `ver_documento`;
DROP VIEW IF EXISTS `ver_documento`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_documento` AS select `documento`.`idDocumento` AS `idDocumento`,`expediente`.`NumExp` AS `Expediente`,`documento`.`Documento` AS `Documento`,`referencia`(`documento`.`Referencia`) AS `Referencia`,`documento`.`Asunto` AS `Asunto`,`documento`.`Folios` AS `Folios`,`documento`.`Tomos` AS `Tomos`,date_format(`documento`.`FecRecep`,'%d%/%m%/%Y') AS `Fecha de Recepcion`,date_format(`documento`.`FecControl`,'%d%/%m%/%Y %h:%i:%s %p') AS `Fecha de ingreso`,`documento`.`Tipo_Ingreso` AS `Ingreso`,`prioridad`.`Nombre` AS `Prioridad`,`categoria`.`Nombre` AS `Categoria`,`institucion`.`nombre` AS `Institucion ingreso`,concat(`emisor`.`apellidos`,' ',`emisor`.`nombres`) AS `Apellidos y Nombres`,`area`.`nombre` AS `Area ingreso`,concat(`pt`.`apellidos`,' ',`pt`.`nombres`) AS `Recepcionado` from ((((((((`documento` join `trabajador` on((`trabajador`.`idTrabajador` = `documento`.`idTrabajador`))) join `persona` `pt` on((`pt`.`idPersona` = `trabajador`.`idPersona`))) join `prioridad` on((`prioridad`.`idPrioridad` = `documento`.`idPrioridad`))) join `expediente` on((`expediente`.`idExpediente` = `documento`.`idExpediente`))) join `categoria` on((`categoria`.`idCATEGORIA` = `documento`.`idCATEGORIA`))) left join `institucion` on((`institucion`.`idInstitucion` = `documento`.`idInstitucion`))) left join `persona` `emisor` on((`documento`.`idPersona` = `emisor`.`idPersona`))) left join `area` on((`area`.`idArea` = `documento`.`idArea`)));

--
-- Definition of view `ver_institucion`
--

DROP TABLE IF EXISTS `ver_institucion`;
DROP VIEW IF EXISTS `ver_institucion`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_institucion` AS select `institucion`.`idInstitucion` AS `idInstitucion`,`institucion`.`nombre` AS `Institucion`,`institucion`.`Direccion` AS `Direccion`,`institucion`.`Telf` AS `Telefono`,`persona`.`DNI` AS `DNI representante`,concat(`persona`.`apellidos`,' ',`persona`.`nombres`) AS `Apellidos y Nombres`,`tipo`.`caracteristica` AS `Tipo de Entidad`,`departamento`.`nombre` AS `Departamento`,`provincia`.`nombre` AS `Provincia`,`distrito`.`nombre` AS `Distrito` from (((((`institucion` left join `persona` on((`persona`.`idPersona` = `institucion`.`idPersona`))) join `tipo` on((`tipo`.`idTipo` = `institucion`.`idTipo`))) join `distrito` on(((`institucion`.`idDEPARTAMENTO` = `distrito`.`idDEPARTAMENTO`) and (`institucion`.`idPROVINCIA` = `distrito`.`idPROVINCIA`) and (`institucion`.`idDISTRITO` = `distrito`.`idDISTRITO`)))) join `provincia` on(((`distrito`.`idDEPARTAMENTO` = `provincia`.`idDEPARTAMENTO`) and (`distrito`.`idPROVINCIA` = `provincia`.`idPROVINCIA`)))) join `departamento` on((`departamento`.`idDEPARTAMENTO` = `provincia`.`idDEPARTAMENTO`)));

--
-- Definition of view `ver_trabajador`
--

DROP TABLE IF EXISTS `ver_trabajador`;
DROP VIEW IF EXISTS `ver_trabajador`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_trabajador` AS select `trabajador`.`idTrabajador` AS `idTrabajador`,`persona`.`DNI` AS `DNI`,`persona`.`apellidos` AS `apellidos`,`persona`.`nombres` AS `nombres`,`persona`.`sexo` AS `sexo`,`persona`.`Direccion` AS `Direccion`,`persona`.`telefono` AS `telefono`,`persona`.`email` AS `E-Mail`,`departamento`.`nombre` AS `Departamento`,`provincia`.`nombre` AS `Provincia`,`distrito`.`nombre` AS `Distrito`,`area`.`nombre` AS `Area`,`cargo`.`Nombre` AS `Cargo` from ((((((`trabajador` join `persona` on((`trabajador`.`idPersona` = `persona`.`idPersona`))) join `distrito` on(((`distrito`.`idPROVINCIA` = `persona`.`idPROVINCIA`) and (`distrito`.`idDISTRITO` = `persona`.`idDISTRITO`) and (`persona`.`idPROVINCIA` = `distrito`.`idPROVINCIA`) and (`distrito`.`idDEPARTAMENTO` = `persona`.`idDEPARTAMENTO`)))) join `provincia` on(((`provincia`.`idPROVINCIA` = `distrito`.`idPROVINCIA`) and (`provincia`.`idDEPARTAMENTO` = `distrito`.`idDEPARTAMENTO`)))) join `departamento` on((`provincia`.`idDEPARTAMENTO` = `departamento`.`idDEPARTAMENTO`))) join `area` on((`area`.`idArea` = `trabajador`.`idArea`))) join `cargo` on((`trabajador`.`idCARGO` = `cargo`.`idCARGO`)));



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
