-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 29-09-2022 a las 09:30:44
-- Versión del servidor: 5.7.30-cll-lve
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cre37351_emprendedor`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`cre37351`@`localhost` PROCEDURE `Borrar_Emp` (IN `a` VARCHAR(90))  NO SQL
delete from usuario where Rut = a$$

CREATE DEFINER=`cre37351`@`localhost` PROCEDURE `Buscar_Emprendedor` (IN `a` VARCHAR(45))  NO SQL
select * from usuario where Nombre like a or Apellido_Pa like a or Apellido_Ma like a or Comuna like a or Direccion like a or Email like a or Actividad_Economica like a or Telefono like a$$

CREATE DEFINER=`cre37351`@`localhost` PROCEDURE `Ingresar_Futuro_Emprendedor` (IN `a` VARCHAR(13), IN `b` VARCHAR(50), IN `c` VARCHAR(50), IN `d` VARCHAR(50), IN `e` VARCHAR(50), IN `f` VARCHAR(80), IN `g` INT(8), IN `h` VARCHAR(80), IN `i` VARCHAR(8), IN `j` VARCHAR(45), IN `k` VARCHAR(45), IN `l` VARCHAR(300), IN `m` VARCHAR(8), IN `n` VARCHAR(8))  NO SQL
insert into usuario(Rut, Nombre, Apellido_Pa, Apellido_Ma, Comuna, Direccion, Telefono, Email, Inicio_Act_SII, Primera_Categoria, Segunda_Categoria, Actividad_Economica, B_Financiamiento, Interez_Capacitacion) values(a,b,c,d,e,f,g,h,i,j,k,l,m,n)$$

CREATE DEFINER=`cre37351`@`localhost` PROCEDURE `Login` (IN `a` VARCHAR(200), IN `b` VARCHAR(200))  NO SQL
select Tipo_Usuario from login where Usuario = a and Clave = b$$

CREATE DEFINER=`cre37351`@`localhost` PROCEDURE `Recuperar_Login` (IN `a` VARCHAR(400))  NO SQL
select * from login where Usuario = a or Email = a$$

--
-- Funciones
--
CREATE DEFINER=`cre37351`@`localhost` FUNCTION `validate_rut` (`RUT` VARCHAR(12)) RETURNS INT(11) BEGIN
	DECLARE strlen INT;
	DECLARE i INT;
	DECLARE j INT;
	DECLARE suma NUMERIC;
	DECLARE temprut VARCHAR(12);
	DECLARE verify_dv CHAR(2);
	DECLARE DV CHAR(1);
	SET RUT = REPLACE(REPLACE(RUT, '.', ''),'-','');
	SET DV = SUBSTR(RUT,-1,1);
	SET RUT = SUBSTR(RUT,1,LENGTH(RUT)-1);
	SET i = 1;
  	SET strlen = LENGTH(RUT);
  	SET j = 2;
  	SET suma = 0;
	IF strlen = 8 OR strlen = 7 THEN
		SET temprut = REVERSE(RUT);
		moduloonce: LOOP
		    IF i <= LENGTH(temprut) THEN
    			SET suma = suma + (CONVERT(SUBSTRING(temprut, i, 1),UNSIGNED INTEGER) * j); 
	      		SET i = i + 1;
	      		IF j = 7 THEN
		    		SET j = 2;
	    		ELSE
	    			SET j = j + 1;
    			END IF;
	      		ITERATE moduloonce;
		    END IF;
		    LEAVE moduloonce;
	  	END LOOP moduloonce;
	  	SET verify_dv = 11 - (suma % 11);
	  	IF verify_dv = 11 THEN
	  		SET verify_dv = 0;
	  	ELSEIF verify_dv = 10 THEN 
	  		SET verify_dv = 'K';
	  	END IF;
	  	IF DV = verify_dv THEN
	  		RETURN 1;
	  	ELSE 
	  		RETURN 0;
	  	END IF;
	END IF;
	RETURN 0;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `ID` int(80) NOT NULL,
  `Usuario` varchar(200) NOT NULL,
  `Clave` varchar(200) NOT NULL,
  `Email` varchar(400) NOT NULL,
  `Tipo_Usuario` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`ID`, `Usuario`, `Clave`, `Email`, `Tipo_Usuario`) VALUES
(0, 'Rodrigo', 'rodrigo1112', 'roavila@muniperalillo.cl, terracompchile@gmail.com', 'Administrador'),
(435345667, 'Usuario', 'muniperalillo2020', 'roavila@muniperalillo.cl', 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Rut` varchar(10) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido_Pa` varchar(50) NOT NULL,
  `Apellido_Ma` varchar(50) NOT NULL,
  `Comuna` varchar(50) NOT NULL,
  `Direccion` varchar(80) NOT NULL,
  `Telefono` int(8) NOT NULL,
  `Email` varchar(80) NOT NULL,
  `Inicio_Act_SII` varchar(2) NOT NULL,
  `Primera_Categoria` varchar(2) NOT NULL,
  `Segunda_Categoria` varchar(2) NOT NULL,
  `Actividad_Economica` varchar(300) NOT NULL,
  `B_Financiamiento` varchar(2) NOT NULL,
  `Interez_Capacitacion` varchar(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Rut`, `Nombre`, `Apellido_Pa`, `Apellido_Ma`, `Comuna`, `Direccion`, `Telefono`, `Email`, `Inicio_Act_SII`, `Primera_Categoria`, `Segunda_Categoria`, `Actividad_Economica`, `B_Financiamiento`, `Interez_Capacitacion`) VALUES
('14013854-1', 'Mauricio', 'Leon', 'Leon', 'Peralillo', 'Hermanos Carrera  ', 90426601, 'mleonleon@gmail.com', 'No', 'No', 'No', 'Servicio de Areas Verdes y Lavado', 'Si', 'Si'),
('12234646-3', 'Jessica de Lourdes', 'Gajardo', 'Pavez', 'Peralillo ', 'Villa Renacer, Calle chacabuco 734 ', 46535921, 'Jessicagajardop@gmail.com', 'Si', 'Si', 'Si', 'Almacen y libreria', 'Si', 'Si'),
('17524820-K', 'Marcelo Antonio ', 'Castro', 'Allende', 'Peralillo', 'Manuel Bulnes 166', 54116396, 'castroallendem@gmail.com', 'Si', 'Si', 'Si', 'Artesaní­a en cacho y acero inoxidable', 'Si', 'No'),
('17065635-0', 'Paula', 'Gaete', 'Godoy', 'Peralillo', 'Rinconada de Molineros s/n', 76165044, 'p.gaetegodoy@gmail.com', 'No', 'No', 'No', 'Venta de ropa y accesorios', 'Si', 'Si'),
('12505494-3', 'Veronica', 'Lobos', 'Zapata', 'Peralillo', 'Ignacio serrano s/n', 50148547, 'yop_la_vero@hotmail.com', 'Si', 'No', 'Si', 'Venta de telas, confeccion y arreglos de prendas ', 'Si', 'Si'),
('15531876-7', 'Margarita ', 'Perez', 'Ravelo', 'Peralillo', 'Ruta  90 sector santa ana', 56502875, 'Margarita_perez1983@hotmail.com', 'Si', 'Si', 'Si', 'Venta de confites, cabrita y algodones', 'Si', 'Si'),
('11786595-9', 'Cristian', 'Gonzalez', 'Donoso', 'Peralillo', 'Alto campanario  San Jose Obrero', 88439647, 'i.pape@hotmail.com', 'Si', 'No', 'Si', 'Construcciónn, trasporte y gastronomía.', 'Si', 'Si'),
('16678952-4', 'Ana ', 'Leiva', 'Morales', 'Peralillo', 'Av. Hmnos carrera #149', 98440506, 'analeivamorales@gmail.com', 'No', 'No', 'No', 'Gastronomia, pasteleria', 'Si', 'Si'),
('16024365-1', 'Catherine', 'Zamorano', 'Martí­nez', 'Peralillo', 'Lourdes 843', 77285123, 'cz_zamorano@hotmail.es', 'Si', 'Si', 'Si', 'Uniformes escolares y uniformes para empresa', 'Si', 'Si'),
('17051998-1', 'Irene', 'Silva', 'Serrano', 'Peralillo', 'San Diego Puquillay', 84874816, 'guianelitadonoso07@gmail.com', 'No', 'No', 'No', 'Modista', 'Si', 'Si'),
('15497143-2', 'Alexis ', 'Leiva ', 'Gomez ', 'Peralillo ', 'La Troya sur sin numero', 95837963, 'A.leivagomez@gmail.com', 'No', 'No', 'No', 'Mueblerí­a y cubiertas postformadas ', 'Si', 'Si'),
('19216635-7', 'Angela', 'Gómez', 'Cezpedes ', 'Peralillo ', 'canto general #312 Población ', 47072694, 'Ag2699986@gmail.com', 'No', 'No', 'No', 'Cocteleria ', 'Si', 'Si'),
('5927038-9', 'Celinda', 'Canales', 'Gonzalez', 'Peralillo', 'Colo Colo 698', 79705607, 'Cecglp@hotmail.com', 'Si', 'Si', 'Si', 'Artesana', 'Si', 'Si'),
('16261034-1', 'Carol', 'Fuentes', 'Cornejo', 'Peralillo', 'Los vascos', 73364324, 'Carolmade.2007@gmail.com', 'No', 'No', 'No', 'Propagacion de plantas (vivero)', 'Si', 'Si'),
('15803595-2', 'Carol', 'Lecaros', 'Vargas', 'Peralillo', 'La Troya norte pasaje 1 s/n', 40264863, 'Katita9631zamorano@gmail.com', 'Si', 'No', 'Si', 'Confecciones de indumentarias folclóricas', 'Si', 'Si'),
('16432866-K', 'Nadia Francisca ', 'Morales ', 'Rí­os ', 'Peralillo', 'Villa renacer chacabuco 888', 72810657, 'Morales.rios_6@hotmail.com', 'No', 'No', 'No', 'Confeccion y costura ', 'Si', 'Si'),
('11995505-K', 'Cristian Antonio', 'Perez', 'Donoso', 'Peralillo', 'Pasaje San Juan de Dios  Lomas de San Isidro', 62604851, 'fomentoproductivo@muniperalillo.cl', 'No', 'No', 'No', 'Fabricacion de Pilares Cadenas Machones Vigas Lozas ', 'Si', 'Si'),
('19215911-3', 'Camila ', 'Miranda', 'Pino', 'Peralillo', 'Troya norte ', 90093510, 'camilamirandapino131355@gmail.com', 'No', 'No', 'Si', 'Venta de ropa nueva ', 'Si', 'Si'),
('10390585-0', 'MELANIA DE LAS MERCEDES', 'CABRERA', 'ABARCA', 'PERALILLO', 'OLAF VALENZUELA 825  VILLA CABALLEROS DEL FUEGO', 63192735, 'melaniacabrera999@gmail.com', 'No', 'No', 'No', 'Taller de Confeccion y Bordados', 'Si', 'Si'),
('6999685-K', 'SONIA DEL CARMEN', 'FARIAS', 'MORALES', 'PERALILLO', 'SANTA BLANCA SN', 83740328, 'fomentoproductivo@muniperalillo.cl', 'Si', 'Si', 'No', 'ALMACEN DE PUESTOS VARIOS', 'Si', 'Si'),
('16828349-0', 'PAULA ANTONIA', 'CASTRO', 'CASTRO', 'PERALILLO', 'POBLACION SAN FRANCISCO PASAJE LOS BOLDOS 263', 93750406, 'pepitacastroc@gmail.com', 'No', 'No', 'Si', 'Chocolateria Artesanal', 'Si', 'Si'),
('16943975-3', 'NATALIA EUGENIA', 'SOTO', 'ROJAS', 'PERALILLO', 'HERMANOS CARRERA 168', 88504668, 'natalia.soto.r@gmail.com', 'Si', 'No', 'Si', 'Artesania Gastronomia', 'Si', 'Si'),
('13348420-5', 'Wilson', 'Vargas', 'Castro', 'Peralillo', 'Iquique 653', 83667925, 'wilson_vargas09@hotmail.com', 'Si', 'Si', 'No', 'Mecanica en General y Arriendo de Maquinaria', 'Si', 'Si'),
('14013885-1', 'VIVIANA ALEJANDRA', 'LEON', 'TOLORZA', 'PERALILLO', 'HERMANOS CARRERA 168', 96321379, 'vivianaleont@gmail.com', 'Si', 'No', 'Si', 'Artesania Gastronomica', 'Si', 'Si'),
('11760402-0', 'AIDA MERCEDES', 'PINA', 'GONZALEZ', 'PERALILLO', 'COLO COLO 39', 40919065, '', 'Si', 'Si', 'No', 'AMASANDERIA Y ALMACEN', 'Si', 'Si'),
('16828534-5', 'Ximena', 'Muñoz', 'Guerrero', 'Peralillo ', 'Chacabuco 847 villa renacer', 64519902, 'Ximena88munoz@gmail.com ', 'Si', 'Si', 'No', 'Almacén ', 'Si', 'No'),
('14315013-5', 'Eduardo', 'Sánchez', 'Guajardo ', 'Peralillo', 'Alto Campanario 547', 85278197, 'eduardo.andress76@gmail.com', 'Si', 'Si', 'No', 'VENTA DE BAZAR PAQUETERIA ROPA ESTAMPADOS ESTABLECIDO AMBULANTE', 'Si', 'Si'),
('16829018-7', 'Patricia', 'Lorca', 'Muñoz', 'Peralillo', 'Villa el carmen, poblacion', 86724781, 'pathysecre@gmail.com', 'No', 'No', 'No', 'Pasteleria y chocolateria artesanal', 'Si', 'Si'),
('18541946-0', 'Lesli Paulina', 'Saldaña', 'Nuñez', 'Peralillo', 'Patria Nueva ', 65805322, 'lesliesaldananunez@gmail.com', 'No', 'No', 'Si', 'Reposteria y Manualidades', 'Si', 'Si'),
('16494285-6', 'Cristóbal ', 'Jiménez ', 'Tobar', 'Marchigue ', 'Alcones ', 61945277, 'cjimenezt8@gmail.com ', 'Si', 'Si', 'No', 'Servicios agricolas ', 'Si', 'Si'),
('11454854-5', 'Alejandra ', 'Cornejo ', 'Pérez ', 'Peralillo ', 'La troya Sur s/n', 68356237, 'alejandraperez12@yahoo.es ', 'Si', 'Si', 'No', 'Pastelería, amasanderia ', 'Si', 'Si'),
('12143295-1', 'Jeanette', 'Valenzuela', 'Reyes', 'Peralillo', 'Chorrillos', 41874388, 'yanettv004@gmail.com', 'No', 'No', 'No', 'Repostería chocolateria', 'Si', 'Si'),
('16919954-K', 'Tatiana', 'Arce', 'Crespo', 'Peralillo', 'Rinconada de molineros ', 94806082, 'arcetatiana1988@gmail.com', 'No', 'No', 'No', 'Muebles rusticos ', 'Si', 'Si'),
('25461608-7', 'Marielba ', 'Montero', 'Peña', 'San jose obrero', 'Alto campanario 393', 86870577, 'Marielbaymp@gmail.com', 'No', 'No', 'No', 'Peluqueria canina y venta de accesorios e insumos para mascotas', 'Si', 'Si'),
('16547146-6', 'Katherine Angelica ', 'Gutierrez ', 'Riquelme ', 'Peralillo', 'Pje bombero Edgardo nogales numero 72', 44702738, 'J.tobarcarvajaj@gmail.com ', 'No', 'No', 'No', 'Vendemos frambuesas nueces y almendras ', 'Si', 'Si'),
('13572040-2', 'Rosa', 'Castro', 'Miranda', 'Peralillo', 'Caballeros del Fuego Psaje San Isidro 855', 93245346, 'rositacm@hotmail.com', 'Si', 'Si', 'Si', 'Huerto y comida saludable ', 'Si', 'Si'),
('12501177-2', 'Patricia', 'Avendaño', 'Espinoza', 'Peralillo', 'Serrano s/n', 41551647, 'Patyae4@hotmailcom', 'No', 'No', 'No', 'Pruductos artesanales', 'Si', 'Si'),
('18723678-9', 'Salvador', 'Paz', 'Lizana', 'Peralillo', 'Calle hogiggins s/n poblacion ', 96754245, 'Salvadorpazlizana@hotmail.com', 'Si', 'Si', 'Si', 'Deporte', 'Si', 'Si'),
('12211129-6', 'Luis arnoldo ', 'Castro ', 'Figueroa', 'Peralillo', 'Chacabuco 904', 41611264, 'Luisprevriesgos@gmail.com', 'Si', 'No', 'Si', 'Produccion de eventos ', 'Si', 'Si'),
('12315779-6', 'Ximena ', 'Contreras', 'Castro', 'Peralillo', 'Chacabuco 904', 48084189, 'ximexcc@gmail.com', 'No', 'No', 'Si', 'Ventas ', 'Si', 'Si'),
('18723640-1', 'Tamara belen', 'Gomez', 'Contreras', 'Peralillo', 'Los cardos', 59981788, 'Tamaragomez975@gmail.com', 'No', 'No', 'No', 'Cocteleria', 'Si', 'Si'),
('13159346-5', 'Luz Arely ', 'Sáez ', 'Gómez ', 'Peralillo ', 'Troya norte pasaje 1#611', 75951056, 'Luz.saez.jp@gmail.com ', 'No', 'No', 'No', 'Elaboración y venta de comidas(colaciones.pasteleria etc)', 'Si', 'Si'),
('13779675-9', 'Danny', 'Gaete', 'Osorio', 'Peralillo', 'Calleuque s/n', 59954497, 'dannyj.gaete.osorio@gmail.com', 'No', 'No', 'No', 'Invernadero', 'Si', 'Si'),
('18750767-7', 'Maria joaquina', 'Gonzalez', 'Cornejo', 'Peralillo', 'Puquillay los leones', 54642383, 'Juaquinagonza31@gmail ', 'Si', 'Si', 'Si', 'Cultivo y venta de flores', 'Si', 'Si'),
('14121367-9', 'Paulina ', 'Salazar ', 'Pinto', 'Peralillo', 'Callejón los leones SN sector Puquillay', 66775863, 'Aarquitecturapsp@gmail,', 'Si', 'Si', 'Si', '', 'Si', 'Si'),
('17335483-5', 'Luz ', 'Abarca', 'Vargas', 'Peralillo', 'Peralillo', 64795273, 'Elianaabrcacargas@gmail.com', 'Si', 'Si', 'Si', 'Trabajo', 'Si', 'Si'),
('24193283-4', 'Gabriela Lourdes ', 'Huayllucu ', 'Choque ', 'Peralillo ', 'Calle baquedano N148 población ', 89026118, 'ga.huayllucu@gmail.com', 'Si', 'Si', 'Si', 'Venta de comida rápida y confites ', 'Si', 'Si'),
('17230215-7', 'Camila', 'Rios', 'Sanhueza', 'Peralillo', 'Alto campanario 263', 98949299, 'Kamy2157@gmail.com ', 'No', 'No', 'No', 'Artesanias', 'Si', 'Si'),
('13782287-3', 'Barbara Edith', 'Munoz', 'Guerrero', 'Peralillo', 'Villa Cristo Joven Pasaje Las Palmas 961', 91543507, 'barbaramg4m@hotmail.com', 'No', 'No', 'No', 'Pasteleria y Reposteria', 'Si', 'Si'),
('7021245-5', 'Maria Lastenia', 'Cornejo', 'Vargas', 'Peralillo', 'El Carmen SN  Poblacion', 61314409, 'laste.cornejo.v@gmail.com', 'No', 'No', 'No', 'Bazar de abarrotes y artesania', 'Si', 'Si'),
('13203005-7', 'Roberto', 'Michelini', 'Fernandez', 'Peralillo', 'Reserva San Jose sn Poblacion', 93224371, 'roberto@delsecano.cl', 'Si', 'No', 'Si', 'Produccion de Pasto Alfombra', 'Si', 'Si'),
('14607286-0', 'Monica', 'Reyes', 'Cornejo ', 'Peralillo ', 'San José Obrero pasaje Bernardo Ohiggins 759', 72839538, 'gugameme@outlook.es ', 'No', 'No', 'No', 'Pasteleria', 'Si', 'Si'),
('15115401-8', 'CLAUDIA LORENA', 'LECAROS', 'RODRIGUEZ', 'PERALILLO', 'ALTO CAMPANARIO 599', 97685531, 'claulecarosw2@gmail.com', 'No', 'No', 'No', 'Venta de Cabritas Algodon de Azucar  Juegos y Churros', 'Si', 'Si'),
('11454905-3', 'NANCY DEL CARMEN', 'CORNEJO', 'CASTRO', 'PERALILLO', 'LA VIROCA SN', 83475194, 'paulsepulveda57@gmail.com', 'No', 'No', 'No', 'Produccion y Venta de Hortalizas y Animales Menores', 'Si', 'Si'),
('10645102-8', 'LEONOR REGINA', 'DIAZ ', 'QUEZADA', 'PERALILLO', 'RINCONADA DE MOLINEROS SIN NUMERO', 53753126, 'masajess1@outlook.com', 'No', 'No', 'No', 'MESOTERAPEUTA A DOMICILIO', 'Si', 'Si'),
('10337270-4', 'SANDRA ANGELICA', 'PEREZ', 'DIAZ', 'PERALILLO', 'LA TROYA NORTE ', 89497879, '', 'No', 'No', 'No', 'VENTA DE ROPA Y MERMELADAS ARTESANALES', 'Si', 'Si'),
('8266017-8', 'ROSA INES', 'PEREZ ', 'LIZAMA', 'PERALILLO', 'LA TROYA CENTRO', 85409437, '', 'No', 'No', 'No', 'VENTA DE EMPANADAS', 'Si', 'Si'),
('7765438-0', 'MARIA FANNY', 'FLORES', 'QUINTANA', 'PERALILLO', 'CALLE COLO COLO PASAJE LOS ENCINOS SIN NUMERO', 85193210, '', 'No', 'No', 'No', 'VENTA DE COSMETICOS POR CATALOGO', 'Si', 'Si'),
('9993137-K', 'ELSA DE LAS MERCEDES', 'PINO', 'GALVEZ', 'PERALILLO', 'CALLEJON LOS LEONES SIN NUMERO PUQUILLAY', 85407343, '', 'No', 'No', 'No', 'ELABORACION Y COMERCIALIZACIN DE MERMELADAS ARTESANALES', 'Si', 'Si'),
('10065007-K', 'MINERVA DE LAS MERCEDES', 'SEPULVEDA', 'MONJE', 'PERALILLO', 'VILLA CABALLEROS DE FUEGO  PSJE ENRIQUE POUPEN 836', 45218209, '', 'No', 'No', 'No', 'VENTA DE ARTICULOS VARIOS', 'Si', 'Si'),
('11995502-5', 'ISABEL MARGARITA', 'CASTRO', 'PEREZ', 'PERALILLO', 'LOS BOLDOS NUMERO 268', 34629980, 'isabelcastro007@gmail.com', 'No', 'No', 'No', 'VENTA DE ROPA', 'Si', 'Si'),
('11110391-7', 'CECILIA DE LAS MERCEDES', 'MORALES', 'FLORES', 'PERALILLO', 'VILLA CRISTO JOVEN CALLE BICENTENARIO 1164', 48151971, '', 'No', 'No', 'No', 'ELABORACION DE PASTELES Y EMPANADAS', 'Si', 'Si'),
('10065730-9', 'LUZ MARINA', 'ALLENDE', 'VALENZUELA', 'PERALILLO', 'EL CORTIJO SECTOR POBLACION', 83444191, '', 'No', 'No', 'No', 'ELABORACION Y VENTA DE PAN AMASADO', 'Si', 'Si'),
('8973192-5', 'ELSA DEL CARMEN', 'GUERRERO', 'OSORIO', 'PERALILLO', 'CALLE LAUTARO NUMERO 40', 44053266, '', 'Si', 'Si', 'No', 'RESTAURANT', 'Si', 'Si'),
('26858250-9', 'JHOENMY JOSEFINA ', 'SANCHEZ', 'VARGAS', 'PERALILLO', 'AVENIDA MANUEL RODRIGUEZ NUMERO 578', 37168080, '', 'No', 'No', 'No', 'VENTA DE PAN Y AREPAS  SERVICIOS TRABAJADORA EN ORIENTACION', 'Si', 'Si'),
('9171690-9', 'ROSALIA DEL CARMEN', 'LEON', 'CORNEJO', 'PERALILLO', 'CALLE RAUL SILVA HENRIQUEZ NUMERO 849', 92681181, '', 'No', 'No', 'No', 'SERVICIOS DE COSTURAS Y LAVADO DE ROPA', 'Si', 'Si'),
('14247118-3', 'JOHANA DEL CARMEN', 'ESPARZA', 'DIAZ', 'PERALILLO', 'PSJE ALTO CAMPANARIO NUMERO 271', 74220715, '', 'No', 'No', 'No', 'ELABORACIN Y VENTA DE EMPANADAS Y PASTELES', 'Si', 'Si'),
('16016796-3', 'XIMENA LORETO', 'PEALOZA', 'ROZAS', 'PERALILLO', 'POBL SAN FRANCISCO PSJE 2 NUMERO 168', 85770053, '', 'No', 'No', 'No', 'SERVICIOS DE CARRO DE CABRITAS Y MOTE PARA FIESTAS Y EVENTOS', 'Si', 'Si'),
('11760374-1', 'SANDRA ISABEL', 'PARRAGUEZ', 'CARIS', 'PERALILLO', 'CALLE LOURDES NUMERO 868', 83259331, '', 'No', 'No', 'No', 'VENTA DE PRODUCTOS COSMETICOS Y DE BELLEZA ', 'Si', 'Si'),
('12316263-3', 'HADY GRACIELA', 'PINA', 'BUSTAMANTE ', 'PERALILLO', 'CALLE MANUEL RODRIGUEZ ', 44366706, '', 'Si', 'Si', 'No', 'LOCAL DE VENTA DE COMIDA RAPIDA', 'Si', 'Si'),
('12368133-9', 'ELLYS GERMANIA', 'CORNEJO', 'PEREZ', 'PERALILLO', 'LA TROYA NORTE', 94635910, '', 'No', 'No', 'No', 'VENTA DE SEMILLAS FRUTOS SECOS MIEL Y HUEVOS ', 'Si', 'Si'),
('15350470-9', 'MARTA ELENA', 'CONTRERAS', 'ESPINOZA', 'PERALILLO', 'SECTOR RINCONADA DE MOLINEROS RINCON LOS MAYOS', 41264842, '', 'No', 'No', 'No', 'VENTA DE JOYAS ', 'Si', 'Si'),
('14306211-2', 'YULY ANDREA', 'ARRANO', 'NAVARRO', 'PERALILLO', 'CALLE BERNARDO OHIGGINS NUMERO 718', 93938154, '', 'No', 'No', 'No', 'ELABORACIN Y VENTAS DE EMPANADAS', 'Si', 'Si'),
('11995411-8', 'PATRICIA ALEJANDRA', 'LUCERO ', 'HUERTA', 'PERALILLO', 'SECTOR DE PUQUILLAY CANETENES SIN NUMERO', 92634836, '', 'No', 'No', 'No', 'VENTA DE SAL Y TEJIDOS A CROCHET', 'Si', 'Si'),
('17497169-2', 'ISABEL DEL CARMEN', 'VALDES', 'GUTIERREZ', 'PERALILLO', 'LA TROYA NORTE CALLE CAUPOLICAN SIN NUMERO', 37860799, '', 'No', 'No', 'No', 'VENTA DE ARTICULOS DE CASA ', 'Si', 'Si'),
('15484162-8', 'INGRID KATHERINE', 'ROJAS', 'CALDERON', 'PERALILLO', 'RUTA I 90 SIN NUMERO SECTOR DE POBLACION', 61769565, '', 'No', 'No', 'No', 'VENTA DE JUGOS NATURALES HELADOS Y ROPA DE CASA', 'Si', 'Si'),
('15532466-K', 'JUANA PATRICIA', 'ORELLANA', 'TOBAR', 'PERALILLO', 'RINCONADA DE MOLINEROS SIN NUMERO', 61377335, '', 'No', 'No', 'No', 'CORTE Y CONFECCION DE PRENDAS ', 'Si', 'Si'),
('8993139-8', 'CARMEN MONICA', 'FLORES', 'PINO', 'PERALILLO', 'LA TROYA SUR SIN NUMERO', 61993588, '', 'No', 'No', 'No', 'ELABORACION Y VENTA DE MERMELADAS Y QUESOS', 'Si', 'Si'),
('15115625-8', 'ANDREA DEL CAMEN', 'MORAGA', 'CACERES', 'PERALILLO', 'LOMAS DE SAN ISIDRO PSJE DANIEL PARGA 757', 99812862, '', 'No', 'No', 'No', 'ELABORACION Y VENTA DE PASTELERIA', 'Si', 'Si'),
('10701197-8', 'MARIA INES', 'MUNOZ', 'MEDINA', 'PERALILLO', 'PABLO NERUDA 215 SECTOR POBLACION', 89288070, '', 'No', 'No', 'No', 'VENTA DE PAPAS FRITAS EN CARRO AMBULANTE', 'Si', 'Si'),
('14049633-2', 'PAULINA MARIBEL', 'TOBAR', 'AGUIRRE', 'PERALILLO', 'PASAJE SAN ISIDRO SIN NUMERO', 99814133, '', 'No', 'No', 'No', 'VENTA DE COMIDA Y ARTICULOS VARIOS', 'Si', 'Si'),
('14306545-6', 'YESENIA CAROLINA', 'CABRERA', 'REYES', 'PERALILLO', 'SECTOR EL BARCO SITIO 1', 38715791, '', 'No', 'No', 'No', 'VENTA DE VERDURAS', 'Si', 'Si'),
('19216939-9', 'SALOME ALMENDRA', 'MOLINA', 'AREVALO', 'PERALILLO', 'POBLACION SAN AGUSTIN CALLE CAUPOLICAN 525', 61145981, '', 'No', 'No', 'No', 'VENTA DE ARTICULOS VARIOS', 'Si', 'Si'),
('13296189-1', 'KATTY ALEJANDRA', 'VIDELA', 'MORALES', 'PERALILLO', 'VILLA RENACER CALLE CHACABUCO 708', 42332685, '', 'No', 'No', 'No', 'ELABORACION Y VENTA DE CHURROS ARTESANALES', 'Si', 'Si'),
('17716209-4', 'SINDY ROMINA', 'NAVARRO ', 'PEREZ', 'PERALILLO', 'SECTOR TROYA NORTE PASAJE 6 SIN NUMERO', 47752986, '', 'No', 'No', 'No', 'VENTA DE ROPA', 'Si', 'Si'),
('10017383-2', 'CARMEN JACQUELINE', 'PINO', 'CARVAJAL', 'PERALILLO', 'VILLA SAN JOSE OBRERO PSJE PADRE VICENTE 918', 74417905, 'pcarmenjacqueline@gmail.com', 'No', 'No', 'No', 'VENTA DE ROPA RECICLADA', 'Si', 'Si'),
('17118705-2', 'CLERIDA DEL CARMEN', 'GAETE', 'VALENZUELA', 'PERALILLO', 'POBL SAN JOSE OBRERO PSJE CARDENAL RAUL SILVA HENRIQUEZ 982', 53992376, 'troyanorte@gmail.com', 'No', 'No', 'No', 'VENTA DE ARTICULOS VARIOS Y ARRIENDO DE JUEGOS INFANTILES', 'Si', 'Si'),
('14903533-8', 'ROSANA ISOLINA', 'VALERIO', 'CISTERNA', 'PERALILLO', 'POBLACION SAN AGUSTIN CALLE IQUIQUE SIN NUMERO', 86220111, 'rosanaisolina511@gmail.com', 'No', 'No', 'No', 'ESTA COMPRANDO MAQUINAS PARA ABRIR UN ALMACEN', 'Si', 'Si'),
('26474209-9', 'AURA MILENNY', 'PEREZ', 'LOPEZ', 'PERALILLO', 'CALLE ECHENIQUE NUMERO 264', 41721927, 'milennyones@gmail.com', 'No', 'No', 'No', 'TRATAMIENTO DE LIMPIEZA FACIAL DEPILACION Y PERFILADO DE DEJAS', 'Si', 'Si'),
('9950843-4', 'AVELINA DEL CARMEN', 'OLMEDO', 'LOPEZ', 'PERALILLO', 'SECTOR SANTA VICTORIA LOS CARDOS CASAS SIN NUMERO', 40554089, 'avelinaolmedolopez@gmail.com', 'No', 'No', 'No', 'CORTE Y CONFECCION DE ROPA', 'Si', 'Si'),
('14158048-5', 'INGRID MIGUELINA', 'NAVARRO', 'ARRANO', 'PERALILLO', 'PASAJE LOS ALERCES 952', 77153045, 'ningridmiguelina@gmail.com', 'No', 'No', 'No', 'ELABORACION Y VENTA DE PAN AMASADO', 'Si', 'Si'),
('13569514-9', 'MARIA FERNANDA', 'MORALES ', 'DONOSO', 'PERALILLO', 'CALLE PEREZ BRITO SIN NUMERO', 38747454, 'ferardonay05@gmail.com', 'No', 'No', 'No', 'VENTA DE ARTESANIA', 'Si', 'Si'),
('25558985-7', 'MARICELA', 'HURTADO', 'PEREIRA', 'PERALILLO', 'VILLA RENACER CALLE CHACABUCO 920', 71619244, 'maricela.hurtado25558@gmail.com', 'No', 'No', 'No', 'SERVICIOS DE MANICURE A DOMICILIO', 'Si', 'Si'),
('10036377-1', 'LUCINDA MABEL DEL CARMEN', 'PINO', 'LORCA', 'PERALILLO', 'VILLA CRISTO JOVEN PSJE LOS ALERCES 951', 94735151, '', 'No', 'No', 'No', 'ELABORACION Y VENTA DE ARTESANIA CON MATERIALES RECICLADOS', 'Si', 'Si'),
('18931201-6', 'CHISTINA FABIOLA ', 'ESPINOZA', 'RODRIGUEZ', 'PERALILLO', 'SECTOR TROYA NORTE SIN NUMERO', 97832053, 'chistinaespinozarodriguez@gmail.com', 'No', 'No', 'No', 'SERVICIOS DE VENTA DE CAJAS DE REGALO CON DESAYUNO A DOMICILIO', 'Si', 'Si'),
('14315049-6', 'TERESA DEL CARMEN', 'CAROCA ', 'LORCA', 'PERALILLO', 'VILLA EL ESFUERZO PSJE LAS DALIAS 113', 58355636, 'carocalorca.teresadelcarmen@gmail.com', 'Si', 'No', 'Si', 'VENTA DE ROPA Y ARTICULOS VARIOS', 'Si', 'Si'),
('18931765-4', 'MARCELA STEPHANIE', 'VIDAL ', 'GALAZ', 'PERALILLO', 'VILLA CRISTO JOVEN PSJE LOS ROBLES 930', 48639027, 'marcela_vidal95@hotmail.com', 'No', 'No', 'No', 'ELABORACION Y VENTA DE PASTELES Y MERMELADAS GOURMET', 'Si', 'Si'),
('14306493-K', 'MARIA MERCEDES', 'HERRERA', 'PENA', 'PERALILLO', 'SECTOR SANTA VICTORIA SIN NUMERO', 93141432, 'maria.herrera17@hotmail.es', 'No', 'No', 'No', ' CRIA Y VENTA DE GALLINAS PONEDORAS Y HUEVOS ', 'Si', 'Si'),
('18930567-2', 'LORETO DE LAS MERCEDES', 'PADILLA', 'CARRENO', 'PERALILLO', 'VILLA SAN JOSE OBRERO PSJE RAUL SILVA HENRIQUEZ 987', 36878999, 'loreto21padilla@gmail.com', 'No', 'No', 'No', 'SERVICIOS DE MASOTERAPEUTA', 'Si', 'Si'),
('27079790-3', 'INGRID JOHANNA', 'SANDOVAL ', 'HERNANDEZ', 'PERALILLO', 'VILLA SAN JOSE OBRERO PSJE 18 DE SEPTIEMBRE NUMERO 307', 41839796, 'peralillo28@gmail.com', 'No', 'No', 'No', 'SERVICIOS DE DEPILACION Y PERFILACION DE CEJAS', 'Si', 'Si'),
('20186083-0', 'Luz emilia', 'Soto', 'Maltes', 'Peralillo', 'Caballeros del fuego. Edgardo morales #54', 67540311, 'Luzemiliasotomaltes@gmail.com', 'No', 'No', 'No', 'Manicure', 'Si', 'No'),
('09252655-0', '', 'LUIS HONORIO', 'PINA', 'MORAGA', 'MANUEL RODRIGUEZ 673  PERALILLO', 30561073, 'lpina@lproyectos.cl', 'Si', 'Si', 'No', 'Desarrollo de Proyectos de Ingenieria', 'Si', 'Si'),
('18835445-9', 'Vanessa', 'Vilches', 'Astorga', 'Peralillo', 'El cortijo', 64054567, 'vanesithaaavilches@gmail.com', 'No', 'No', 'No', 'Vender ropita', 'Si', 'Si'),
('16007493-0', 'Daniela ', 'Reyes', 'Rodriguez', 'Peralillo', 'pasaje las araucarias 901', 82926978, 'dareyes.r@gmail.com', 'No', 'No', 'No', 'Venta articulos de aseo', 'Si', 'Si'),
('27013395-9', 'Giuseppe francisco ', 'Veltri', 'Brazon ', 'Peralillo ', 'Pasaje san isidro', 31773813, 'Veltri402@gmail.com', 'Si', 'Si', 'Si', 'Venta', 'Si', 'Si'),
('16072088-3', 'Leslie', 'Arenas', 'Ruiz', 'Peralillo', 'Los cardos', 20990818, 'Arenasleslie29@gmail.com', 'Si', 'No', 'No', 'Tener un puesto en la feria', 'Si', 'Si'),
('17128579-8', 'victor', 'Ormazabal', 'Devia', 'Peralillo', 'Poblacion Villa el esfuerzo pje Las Camelias casa 67', 89682819, 'victor.ormazabal3@gmail.com', 'No', 'No', 'Si', 'agricultura y cultivo de plantas', 'Si', 'Si'),
('18001058-0', 'alexandra carolina ', 'moreno', 'acuna', 'peralillo', 'villa corazon el cortijo pasaje los copihues 940  poblacion ', 61164234, 'carolina1992.cm39@gmail.com', 'No', 'No', 'No', 'venta de ropa y joyas ', 'Si', 'Si'),
('12646446-0', 'Cristina ', 'Gálvez ', 'Ibarra ', 'Peralillo ', 'Mata redonda sin numero', 63537830, 'Kristy.allens.g@gmail.com ', 'No', 'No', 'No', 'Venta de plantas captus y suculentas ', 'Si', 'Si'),
('20100905-7', 'Vanessa Andrea ', 'Morales', 'Buschmann ', 'Peralillo ', 'Pasaje Vicente Irarrázaval 989', 84349483, 'vane.mb18@hotmail.com', 'Si', 'No', 'Si', 'Fabricación de alfajores Artesanales ', 'Si', 'Si'),
('11887303-3', 'Elena', 'Olivares', 'Valenzuela', 'Peralillo', 'Mataredonda s/n parcela 23 callejón los Cáceres', 91907237, 'eolivares7@hotmail.com', 'Si', 'No', 'Si', 'Podología', 'Si', 'Si'),
('19865526-0', 'Nayareth del Pilar', 'Lopez', 'Santander', 'Peralillo', 'Padre Vicente Irarrazabal 940 San Jose Obrero', 40408609, 'lopezsantandernayareth@gmail.com', 'Si', 'Si', 'No', 'Ventas de productos de aseo y accesorios de hogar', 'Si', 'Si'),
('17746094-K', 'Paula', 'Hernández', 'Torres', 'Peralillo', 'Parcela 27 Lote 9 Sector El Cortijo Poblacion', 82781740, 'pchernandezt@gmail.com', 'Si', 'No', 'Si', 'Coaching y Talleres a mujeres', 'Si', 'Si'),
('17139359-0', 'GERMAN', 'PEREZ', 'TOBAR', 'PERALILLO', 'POBLACON SAN AGUSTIN CALLE IQUIQUE 490', 97635281, 'yoselynlorca@gmail.com', 'No', 'No', 'No', '', 'Si', 'Si'),
('19550158-0', 'Francisca alejandra', 'Garrido ', 'Piña ', 'Peralillo', 'Santa blanca sn ', 76429706, 'franciscaale2309@icloud.com', 'No', 'No', 'No', 'Venta de ropa y accesorios varios ', 'Si', 'Si'),
('14338746-1', 'Andrés Eduardo', 'Mariqueo', 'Contreras', 'Peralillo', 'Los Parrones', 98170778, 'andresmariqueocontreras@gmail.com', 'No', 'No', 'No', 'Agrícola', 'Si', 'Si');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Rut`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
