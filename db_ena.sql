-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-03-2022 a las 05:48:24
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `db_ena`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncios`
--

CREATE TABLE IF NOT EXISTS `anuncios` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `creacion` datetime(6) NOT NULL,
  `persona_id` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_alumno`
--

CREATE TABLE IF NOT EXISTS `asignacion_alumno` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_grado` int(4) NOT NULL,
  `id_alumno` int(6) NOT NULL,
  `id_padre` int(6) NOT NULL,
  `creacion` datetime(6) NOT NULL,
  `id_usuario` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Volcado de datos para la tabla `asignacion_alumno`
--

INSERT INTO `asignacion_alumno` (`id`, `id_grado`, `id_alumno`, `id_padre`, `creacion`, `id_usuario`) VALUES
(10, 9, 86, 69, '2020-08-26 14:02:42.000000', 1),
(24, 9, 97, 69, '2020-08-26 15:28:23.000000', 1),
(25, 10, 101, 69, '2020-10-04 17:08:29.000000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_anuncios`
--

CREATE TABLE IF NOT EXISTS `asignacion_anuncios` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_anuncio` int(25) NOT NULL,
  `id_materia` int(25) NOT NULL,
  `id_bimestre` int(4) NOT NULL,
  `creacion` datetime(6) NOT NULL,
  `persona_id` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `anuncio_id` (`id_anuncio`),
  KEY `materia_id` (`id_materia`),
  KEY `bimestre_id` (`id_bimestre`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_bgmp`
--

CREATE TABLE IF NOT EXISTS `asignacion_bgmp` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_grado` int(4) DEFAULT NULL,
  `id_materia` int(3) DEFAULT NULL,
  `id_bimestre` int(2) DEFAULT NULL,
  `id_profesor` int(6) DEFAULT NULL,
  `creacion` datetime(6) NOT NULL,
  `id_usuario` int(3) NOT NULL,
  `id_calname` int(11) DEFAULT NULL,
  `id_cal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`id_usuario`),
  KEY `id_grado` (`id_grado`),
  KEY `id_materia` (`id_materia`),
  KEY `id_bimestre` (`id_bimestre`),
  KEY `id_profesor` (`id_profesor`),
  KEY `id_profesor_2` (`id_profesor`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `asignacion_bgmp`
--

INSERT INTO `asignacion_bgmp` (`id`, `id_grado`, `id_materia`, `id_bimestre`, `id_profesor`, `creacion`, `id_usuario`, `id_calname`, `id_cal`) VALUES
(14, 9, 12, 1, 99, '2020-08-27 17:30:32.000000', 1, NULL, NULL),
(15, 9, 13, NULL, 99, '2020-09-30 16:56:00.000000', 1, NULL, NULL),
(16, 10, 14, NULL, 100, '2020-10-04 16:35:01.000000', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_examen`
--

CREATE TABLE IF NOT EXISTS `asignacion_examen` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `creacion` datetime(6) NOT NULL,
  `estado` int(2) NOT NULL DEFAULT '0',
  `persona_id` int(3) NOT NULL,
  `id_examen` int(255) NOT NULL,
  `id_materia` int(255) NOT NULL,
  `id_bimestre` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`persona_id`),
  KEY `id_examen` (`id_examen`),
  KEY `id_materia` (`id_materia`),
  KEY `id_bimestre` (`id_bimestre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_material`
--

CREATE TABLE IF NOT EXISTS `asignacion_material` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_material` int(25) NOT NULL,
  `id_materia` int(25) NOT NULL,
  `id_bimestre` int(4) NOT NULL,
  `creacion` datetime(6) NOT NULL,
  `persona_id` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `material_id` (`id_material`),
  KEY `materia_id` (`id_materia`),
  KEY `bimestre_id` (`id_bimestre`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_tarea`
--

CREATE TABLE IF NOT EXISTS `asignacion_tarea` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `creacion` datetime(6) NOT NULL,
  `estado` int(2) NOT NULL DEFAULT '1',
  `persona_id` int(3) NOT NULL,
  `id_tarea` int(255) NOT NULL,
  `id_materia` int(255) NOT NULL,
  `id_bimestre` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`persona_id`),
  KEY `id_tarea` (`id_tarea`),
  KEY `id_materia` (`id_materia`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bimestre`
--

CREATE TABLE IF NOT EXISTS `bimestre` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `creacion` datetime(6) NOT NULL,
  `persona_id` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `bimestre`
--

INSERT INTO `bimestre` (`id`, `nombre`, `creacion`, `persona_id`) VALUES
(1, 'Primer Bimestre', '2020-07-22 00:00:00.000000', 1),
(2, 'Segundo Bimestre', '2020-07-22 00:00:00.000000', 1),
(3, 'Tercer Bimestre', '2020-07-22 00:00:00.000000', 1),
(4, 'Cuarto Bimestre', '2020-07-22 00:00:00.000000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_categoria`
--

CREATE TABLE IF NOT EXISTS `calificacion_categoria` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `creacion` datetime(6) NOT NULL,
  `persona_id` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega_examen`
--

CREATE TABLE IF NOT EXISTS `entrega_examen` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `persona_id` int(3) NOT NULL,
  `id_examen` int(255) NOT NULL,
  `creacion` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`persona_id`),
  KEY `id_examen` (`id_examen`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega_tarea`
--

CREATE TABLE IF NOT EXISTS `entrega_tarea` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `persona_id` int(3) NOT NULL,
  `id_tarea` int(255) NOT NULL,
  `creacion` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`persona_id`),
  KEY `id_tarea` (`id_tarea`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etapa`
--

CREATE TABLE IF NOT EXISTS `etapa` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `creacion` datetime(6) NOT NULL,
  `persona_id` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `etapa`
--

INSERT INTO `etapa` (`id`, `nombre`, `creacion`, `persona_id`) VALUES
(1, 'Primaria', '2020-07-22 00:00:00.000000', 1),
(2, 'Basico', '2020-07-22 00:00:00.000000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE IF NOT EXISTS `examen` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `valor` int(3) NOT NULL,
  `f_inicio` date NOT NULL,
  `f_entrega` date NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `c_preguntas` int(10) DEFAULT NULL,
  `creacion` datetime(6) NOT NULL,
  `persona_id` int(3) NOT NULL,
  `documento` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE IF NOT EXISTS `grado` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `creacion` datetime(6) NOT NULL,
  `user_id` int(3) NOT NULL,
  `id_etapa` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`id`, `nombre`, `creacion`, `user_id`, `id_etapa`) VALUES
(9, 'Tercero', '2020-08-26 11:40:25.000000', 1, 2),
(10, 'Quinto', '2020-10-04 16:34:44.000000', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE IF NOT EXISTS `materia` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `id_usuario` int(3) NOT NULL,
  `id_grado` int(4) DEFAULT NULL,
  `creacion` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id`, `nombre`, `id_usuario`, `id_grado`, `creacion`) VALUES
(3, 'Matematica', 1, 8, NULL),
(4, 'Matematica', 1, 8, NULL),
(5, 'Matematica', 1, 8, NULL),
(6, 'Matematica', 1, 8, NULL),
(7, 'Matematica', 1, 8, NULL),
(8, 'Matematica', 1, 8, NULL),
(9, 'Sociales', 1, 8, NULL),
(10, 'Sociales', 1, 8, NULL),
(11, 'Matematica', 1, 8, NULL),
(12, 'Matematica', 1, 9, NULL),
(13, 'FIsica', 1, 9, NULL),
(14, 'FIsica2', 1, 10, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE IF NOT EXISTS `material` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `persona_id` int(3) DEFAULT NULL,
  `creacion` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_examen`
--

CREATE TABLE IF NOT EXISTS `nota_examen` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) DEFAULT NULL,
  `nota` int(2) NOT NULL,
  `creacion` datetime(6) NOT NULL,
  `persona_id` int(3) NOT NULL,
  `entrega_id` int(100) DEFAULT NULL,
  `id_alumno` int(220) DEFAULT NULL,
  `id_examen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entrega_id_2` (`entrega_id`),
  KEY `persona_id` (`persona_id`),
  KEY `entrega_id` (`entrega_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_tarea`
--

CREATE TABLE IF NOT EXISTS `nota_tarea` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) DEFAULT NULL,
  `nota` int(2) NOT NULL,
  `creacion` datetime(6) NOT NULL,
  `persona_id` int(3) NOT NULL,
  `entrega_id` int(100) DEFAULT NULL,
  `id_alumno` int(200) DEFAULT NULL,
  `id_tarea` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entrega_id_2` (`entrega_id`),
  KEY `persona_id` (`persona_id`),
  KEY `entrega_id` (`entrega_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(30) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `edad` int(3) DEFAULT NULL,
  `codigo` varchar(12) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `alergias` varchar(30) DEFAULT NULL,
  `medicamento` varchar(30) DEFAULT NULL,
  `profesion` varchar(20) DEFAULT NULL,
  `telefono_1` int(8) DEFAULT NULL,
  `telefono_2` int(8) DEFAULT NULL,
  `dpi` bigint(13) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `ref_nombre` varchar(60) DEFAULT NULL,
  `ref_telefono` int(8) DEFAULT NULL,
  `ref_direccion` varchar(30) DEFAULT NULL,
  `ref_correo` varchar(30) DEFAULT NULL,
  `ref_parentesco` varchar(15) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `rol` int(2) DEFAULT NULL,
  `creacion` datetime(6) DEFAULT NULL,
  `id_rol` int(2) DEFAULT NULL,
  `id_usuario` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dpi` (`dpi`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `correo` (`correo`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_rol` (`id_rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=102 ;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombres`, `apellidos`, `fecha_nac`, `edad`, `codigo`, `direccion`, `alergias`, `medicamento`, `profesion`, `telefono_1`, `telefono_2`, `dpi`, `correo`, `username`, `password`, `ref_nombre`, `ref_telefono`, `ref_direccion`, `ref_correo`, `ref_parentesco`, `image`, `rol`, `creacion`, `id_rol`, `id_usuario`) VALUES
(1, 'Maria Celeste', 'Morán Morales', NULL, NULL, NULL, 'San Juan, Santa Rita', NULL, NULL, NULL, 42722887, NULL, 0, 'celemoran721@gmail.com', 'mcmoran', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', '', 0, NULL, NULL, NULL, NULL, 2, '2020-07-22 00:00:00.000000', NULL, 1),
(69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21474836478, NULL, NULL, NULL, 'Ricardo Alberto Gomez', 58595653, 'Sanarate', 'ricardoa12@gmail.com', NULL, 'phombre_1.jpg', 4, '2020-08-26 11:53:37.000000', 0, 1),
(72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28196, NULL, NULL, NULL, 'Lorena Bautista', 58595657, 'Guastatoya', 'lore145@gmail.com', NULL, 'pmujer_2.jpg', 4, '2020-08-26 13:22:29.000000', NULL, 1),
(86, 'Maria Kristal', 'Gomez Perez', '2020-08-13', 0, 'A14FFE', 'Sanarate', '--', '--', NULL, NULL, NULL, NULL, 'mariag12@gmail.com', 'Mgmez', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', NULL, NULL, NULL, NULL, 'Padre', 'emujer_3.jpg', 1, '2020-08-26 14:02:42.000000', NULL, 1),
(97, 'Pedro Pablo', 'Gomez Perez', '2020-08-18', NULL, 'A14FF5T', 'Sanarate', '--', '--', NULL, NULL, NULL, NULL, 'pedpakb@gmail.com', 'PedroP3', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', NULL, NULL, NULL, NULL, 'Padre', 'varon.jpg', 1, '2020-08-26 15:28:23.000000', NULL, 1),
(98, 'MarÃ­a ', 'MorÃ¡n', '2020-08-25', NULL, '589588', 'Sanarate', '--', '--', NULL, NULL, NULL, NULL, 'pedpakb@gmail.com5', 'pedroP15', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', NULL, NULL, NULL, NULL, 'Padre', NULL, 1, '2020-08-26 15:29:26.000000', NULL, 1),
(99, 'Carlos Gilberto', 'Morataya', '2020-08-12', 25, NULL, 'Aldea Santa Rita, Guastatoya', NULL, NULL, 'Prof. EnseÃ±anza Med', 42722887, 11458965, 2819633390456, 'cmpra@gmail.com', 'cMorataya', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 'Claudia MorÃ¡n', 55757230, NULL, 'clmora@gmail.com', NULL, 'p.jpg', 3, '2020-08-27 17:10:16.000000', 1, 1),
(100, 'MArio ', 'Aldana', '2020-10-19', NULL, NULL, 'San Juan', NULL, NULL, 'Profesor', 1258, 8569, 12459632, 'admin2@gmail.com', 'admin2', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 'prieba', 45865, NULL, 'coreo@gmail.com', NULL, NULL, 3, '2020-10-04 16:34:18.000000', 1, 1),
(101, 'MArio ', 'Aldana', '2020-10-21', NULL, '7lo4', 'San Juan', '--', '--', NULL, NULL, NULL, NULL, 'alum2@gmial.com', 'admin3', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', NULL, NULL, NULL, NULL, 'padre', 'emujer_4.jpg', 1, '2020-10-04 17:08:29.000000', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `persona_id` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`, `persona_id`) VALUES
(1, 'Guia', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE IF NOT EXISTS `tarea` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `valor` int(3) NOT NULL,
  `f_entrega` date NOT NULL,
  `creacion` datetime(6) NOT NULL,
  `persona_id` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_id` (`persona_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion_anuncios`
--
ALTER TABLE `asignacion_anuncios`
  ADD CONSTRAINT `asignacion_anuncios_ibfk_1` FOREIGN KEY (`id_anuncio`) REFERENCES `anuncios` (`id`),
  ADD CONSTRAINT `asignacion_anuncios_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  ADD CONSTRAINT `asignacion_anuncios_ibfk_3` FOREIGN KEY (`id_bimestre`) REFERENCES `bimestre` (`id`);

--
-- Filtros para la tabla `asignacion_bgmp`
--
ALTER TABLE `asignacion_bgmp`
  ADD CONSTRAINT `asignacion_bgmp_ibfk_1` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`),
  ADD CONSTRAINT `asignacion_bgmp_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  ADD CONSTRAINT `asignacion_bgmp_ibfk_3` FOREIGN KEY (`id_bimestre`) REFERENCES `bimestre` (`id`),
  ADD CONSTRAINT `asignacion_bgmp_ibfk_4` FOREIGN KEY (`id_profesor`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `asignacion_bgmp_ibfk_5` FOREIGN KEY (`id_usuario`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `asignacion_examen`
--
ALTER TABLE `asignacion_examen`
  ADD CONSTRAINT `asignacion_examen_ibfk_4` FOREIGN KEY (`id_bimestre`) REFERENCES `bimestre` (`id`),
  ADD CONSTRAINT `asignacion_examen_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `asignacion_examen_ibfk_2` FOREIGN KEY (`id_examen`) REFERENCES `examen` (`id`),
  ADD CONSTRAINT `asignacion_examen_ibfk_3` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`);

--
-- Filtros para la tabla `asignacion_material`
--
ALTER TABLE `asignacion_material`
  ADD CONSTRAINT `asignacion_material_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `asignacion_material_ibfk_2` FOREIGN KEY (`id_material`) REFERENCES `material` (`id`),
  ADD CONSTRAINT `asignacion_material_ibfk_3` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  ADD CONSTRAINT `asignacion_material_ibfk_4` FOREIGN KEY (`id_bimestre`) REFERENCES `bimestre` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
