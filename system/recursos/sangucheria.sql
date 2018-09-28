-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-09-2018 a las 22:34:27
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sangucheria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aderezo`
--

CREATE TABLE `aderezo` (
  `id_aderezo` int(11) NOT NULL,
  `cod_aderezo` int(11) DEFAULT NULL,
  `nom_aderezo` varchar(50) DEFAULT NULL,
  `precio_aderezo` int(15) DEFAULT NULL,
  `disp_aderezo` int(1) NOT NULL,
  `public_aderezo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aderezo`
--

INSERT INTO `aderezo` (`id_aderezo`, `cod_aderezo`, `nom_aderezo`, `precio_aderezo`, `disp_aderezo`, `public_aderezo`) VALUES
(1, 0, 'salsa española', 500, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aderezo_pedido`
--

CREATE TABLE `aderezo_pedido` (
  `id_ader_pedido` int(11) NOT NULL,
  `cant_aderezo` int(11) DEFAULT NULL,
  `id_aderezo` int(11) DEFAULT NULL,
  `id_detventa` int(11) DEFAULT NULL,
  `cost_aderezo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aderezo_tmp`
--

CREATE TABLE `aderezo_tmp` (
  `id_ade` int(11) NOT NULL,
  `nom_ade` varchar(60) NOT NULL,
  `cos_ade` int(11) NOT NULL,
  `can_ade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_venta`
--

CREATE TABLE `det_venta` (
  `id_detventa` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(111) NOT NULL,
  `uni_producto` int(11) NOT NULL,
  `obs_producto` text NOT NULL,
  `val_ing` int(11) NOT NULL,
  `ing_extprod` varchar(50) NOT NULL,
  `cant_producto` int(11) NOT NULL,
  `total_prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` int(11) NOT NULL,
  `rut_empresa` varchar(15) DEFAULT NULL,
  `nom_empresa` varchar(50) DEFAULT NULL,
  `giro_empresa` varchar(50) DEFAULT NULL,
  `dire_empresa` varchar(50) DEFAULT NULL,
  `eml_empresa` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `rut_empresa`, `nom_empresa`, `giro_empresa`, `dire_empresa`, `eml_empresa`) VALUES
(1, '13593532-8', 'El Ajo Sandwicheria', 'Alimentacion', 'Pudeto 410', 'elajo@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id_ingr` int(11) NOT NULL,
  `cod_ingr` int(11) DEFAULT NULL,
  `nom_ingr` varchar(50) DEFAULT NULL,
  `precio_ingr` int(11) DEFAULT NULL,
  `disp_ingr` int(1) NOT NULL,
  `public_ingr` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id_ingr`, `cod_ingr`, `nom_ingr`, `precio_ingr`, `disp_ingr`, `public_ingr`) VALUES
(1, 0, 'porotos verdes', 400, 1, 1),
(2, 0, 'tomate', 400, 1, 1),
(3, 0, 'aji verde', 0, 1, 1),
(4, 0, 'vacuno', 1000, 1, 1),
(5, 0, 'pollo', 1000, 1, 1),
(6, 0, 'chancho', 1000, 1, 1),
(7, 0, 'palta', 400, 1, 1),
(8, 0, 'queso laminado', 400, 1, 1),
(9, 0, 'queso campo', 700, 1, 1),
(10, 0, 'lechuga', 400, 1, 1),
(11, 0, 'cebolla frita', 400, 1, 1),
(12, 0, 'cebolla cruda', 400, 1, 1),
(13, 0, 'tocino', 400, 1, 1),
(14, 0, 'huevo frito', 400, 1, 1),
(15, 0, 'pastelera de choclo', 400, 1, 1),
(16, 0, 'esparragos', 400, 1, 1),
(17, 0, 'cebolla en escabeche', 400, 1, 1),
(18, 0, 'aji en escabeche', 400, 1, 1),
(19, 0, 'chucrut', 400, 1, 1),
(20, 0, 'champiñones', 400, 1, 1),
(21, 0, 'rucula', 400, 1, 1),
(22, 0, 'choclo grano', 400, 1, 1),
(23, 0, 'mayonesa al ajo', 0, 1, 1),
(24, 0, 'mayonesa normal', 0, 1, 1),
(25, 0, 'pesto perejil', 0, 1, 1),
(26, 0, 'chancho en piedra', 0, 1, 1),
(27, 0, 'mostaza finas hierbas', 0, 1, 1),
(28, 0, 'salsa aji cacho de cabra', 0, 1, 1),
(29, 0, 'mostaza tradicional', 0, 1, 1),
(30, 0, 'ketchup', 0, 1, 1),
(31, 0, 'sandwich+bebida+salsa+bolitas de trauco', 3400, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `url_log` varchar(80) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_prod` int(11) NOT NULL,
  `cod_prod` int(11) DEFAULT NULL,
  `nom_prod` varchar(50) DEFAULT NULL,
  `desc_prod` text NOT NULL,
  `precio_prod` int(10) DEFAULT NULL,
  `dcto_prod` int(3) NOT NULL,
  `disp_prod` int(1) NOT NULL,
  `public_prod` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_prod`, `cod_prod`, `nom_prod`, `desc_prod`, `precio_prod`, `dcto_prod`, `disp_prod`, `public_prod`) VALUES
(1, 0, ' ahui vacuno', 'carne de vacuno, palta,lechuga y mayonesa', 2200, 0, 1, 1),
(2, 0, 'ahui con chancho', 'carne de chancho, palta,lechuga y mayonesa', 1800, 0, 1, 1),
(3, 0, 'ahui de pollo', 'pollo,palta,lechuga y mayonesa', 1800, 0, 1, 1),
(4, 0, 'ahui con fricandela', 'fricandela,palta,lechuga y mayonesa', 3500, 0, 1, 1),
(5, 0, 'ahui con plateada', 'plateada,palta,lechuga y mayonesa', 3500, 0, 1, 1),
(6, 0, 'ahui con prieta', 'prieta, palta,lechuga y mayonesa', 3500, 0, 1, 1),
(7, 0, 'ahui con pernil', 'pernil, palta,lechuga y mayonesa', 3800, 0, 1, 1),
(8, 0, 'ahui con chicharron', 'chicharron,palta,lechuga y mayonesa', 3800, 0, 1, 1),
(9, 0, 'ahui con lengua', 'lengua, palta,lechuga y mayonesa', 4000, 0, 1, 1),
(10, 0, 'ahui de pavo', 'pavo, palta,lechuga y mayonesa', 4000, 0, 1, 1),
(11, 0, 'ahui con cordero', 'cordero, palta,lechuga y mayonesa', 4500, 0, 1, 1),
(12, 0, 'mar brava vacuno', 'vacuno,tomate,palta y mayonesa', 2200, 0, 1, 1),
(13, 0, 'mar brava chancho', 'chancho,tomate ,palta y mayonesa', 1800, 0, 1, 1),
(14, 0, 'mar brava pollo', 'pollo,tomate, palta y mayonesa', 1800, 0, 1, 1),
(15, 0, 'mar brava fricandela', 'fricandela,tomate,palta y mayonesa', 3500, 0, 1, 1),
(16, 0, 'mar brava con plateada', 'plateada, tomate,palta y mayonesa', 3500, 0, 1, 1),
(17, 0, 'mar brava con prieta', 'prieta, tomate,palta y mayonesa', 3500, 0, 1, 1),
(18, 0, 'mar brava con pernil', 'pernil,tomate,palta y mayonesa', 3800, 0, 1, 1),
(19, 0, 'mar brava con chicharron', 'chicharron, tomate,palta y mayonesa', 3800, 0, 1, 1),
(20, 0, 'mar brava con lengua', 'lengua,tomate,palta y mayonesa', 4000, 0, 1, 1),
(21, 0, 'mar brava con pavo', 'pavo,tomate,palta y mayonesa', 4000, 0, 1, 1),
(22, 0, 'mar brava con cordero', 'cordero, tomate,palta y mayonesa', 4500, 0, 1, 1),
(23, 0, 'lechagua con vacuno', 'vacuno,porotos,tomate,aji verde y mayonesa', 2200, 0, 1, 1),
(24, 0, 'lechagua chancho', 'chancho, porotos,tomate,aji verde y mayonesa', 1800, 0, 1, 1),
(25, 0, 'lechagua pollo', 'pollo, porotos,tomate,aji verde y mayonesa', 1800, 0, 1, 1),
(26, 0, 'lechagua con fricandela', 'fricandela, porotos,tomate,aji verde y mayonesa', 3500, 0, 1, 1),
(27, 0, 'lechagua con plateada', 'plateada,porotos,tomate,aji verde y mayonesa', 3500, 0, 1, 1),
(28, 0, 'lechagua con prieta', 'prieta,porotos,tomate,aji verde y mayonesa', 3500, 0, 1, 1),
(29, 0, 'lechagua con pernil', 'pernil,porotos,tomate,aji verde y mayonesa', 3800, 0, 1, 1),
(30, 0, 'lechagua con chicharron', 'chicharron, porotos,tomate,aji verde y mayonesa', 3800, 0, 1, 1),
(31, 0, 'lechagua con lengua', 'lengua,porotos,tomate,aji verde y mayonesa', 4000, 0, 1, 1),
(32, 0, 'lechagua con pavo', 'pavo, porotos,tomate,aji verde y mayonesa', 4000, 0, 1, 1),
(33, 0, 'lechagua con cordero', 'cordero,porotos,tomate,aji verde y mayonesa', 4500, 0, 1, 1),
(34, 0, 'arena gruesa vacuno', 'vacuno,queso derretido', 2200, 0, 1, 1),
(35, 0, 'arena gruesa chancho', 'chancho ,queso derretido', 1800, 0, 1, 1),
(36, 0, 'arena gruesa pollo', 'pollo,queso derretido', 1800, 0, 1, 1),
(37, 0, 'arena gruesa fricandela', 'fricandela,queso derretido', 3500, 0, 1, 1),
(38, 0, 'arena gruesa con plateada', 'plateada, queso derretido', 3500, 0, 1, 1),
(39, 0, 'arena gruesa con prieta', 'prieta,queso derretido', 3500, 0, 1, 1),
(40, 0, 'arena gruesa con pernil', 'pernil,queso derretido', 3800, 0, 1, 1),
(41, 0, 'arena gruesa con chicharron', 'chicharron,queso derretido', 3800, 0, 1, 1),
(42, 0, 'arena gruesa con lengua', 'lengua,queso derretido', 4000, 0, 1, 1),
(43, 0, 'arena gruesa con pavo', 'pavo,queso derretido', 4000, 0, 1, 1),
(44, 0, 'arena gruesa con cordero', 'cordero, queso derretido', 4500, 0, 1, 1),
(45, 0, 'quetalmahue con vacuno', 'vacuno, huevofrito,cebolla frita', 2200, 0, 1, 1),
(46, 0, 'quetalmahuecon chancho', 'chancho,huevo frito,cebolla frita', 1800, 0, 1, 1),
(47, 0, 'quetalmahue pollo', 'pollo,huevo frito,cebolla frita', 1800, 0, 1, 1),
(48, 0, 'quetalmahue con fricandela', 'fricandela,huevo frito y cebolla frita', 3500, 0, 1, 1),
(49, 0, 'quetalmahue con plateada', 'plateada,huevo frito, cebolla frita', 3500, 0, 1, 1),
(50, 0, 'quetalmahue con prieta', 'prieta, huevo frito,cebolla frita', 3500, 0, 1, 1),
(51, 0, 'quetalmahue con pernil', 'pernil, huevo frito, cebolla frita', 3800, 0, 1, 1),
(52, 0, 'quetalmahue con chicharron', 'chicharron,huevo frito,cebolla frita', 3800, 0, 1, 1),
(53, 0, 'quetalmahue con lengua', 'lengua, huevo frito,cebolla frita', 4000, 0, 1, 1),
(54, 0, 'quetalmahue con pavo', 'pavo, huevo frito,cebolla frita', 4000, 0, 1, 1),
(55, 0, 'quetalmahue con cordero', 'cordero, huevo frito,cebolla frita', 4500, 0, 1, 1),
(56, 0, 'puñihuil vacuno', 'vacuno, tomate,cebolla, tocino y mayonesa', 2200, 0, 1, 1),
(57, 0, 'puñihuil chancho', 'chancho TOMATE,CEBOLLA, TOCINO Y MAYONESA', 1800, 0, 1, 1),
(58, 0, 'puñihuil pollo', 'pollo, TOMATE,CEBOLLA, TOCINO Y MAYONESA', 1800, 0, 1, 1),
(59, 0, 'puñihuil fricandela', 'fricandela,TOMATE,CEBOLLA, TOCINO Y MAYONESA', 3500, 0, 1, 1),
(60, 0, 'puñihuil con plateada', 'plateada,TOMATE,CEBOLLA, TOCINO Y MAYONESA', 3500, 0, 1, 1),
(61, 0, 'puñihuil con prieta', 'prieta,TOMATE,CEBOLLA, TOCINO Y MAYONESA', 3500, 0, 1, 1),
(62, 0, 'puñihuil con pernil', 'pernil,TOMATE,CEBOLLA, TOCINO Y MAYONESA', 3800, 0, 1, 1),
(63, 0, 'puñuhuil con pernil', 'pernil,TOMATE,CEBOLLA, TOCINO Y MAYONESA', 3800, 0, 1, 1),
(64, 0, 'puñihuil con chicharron', 'chicharron,TOMATE,CEBOLLA, TOCINO Y MAYONESA', 3800, 0, 1, 1),
(65, 0, 'puñihuil con lengua', 'lengua,TOMATE,CEBOLLA, TOCINO Y MAYONESA', 4000, 0, 1, 1),
(66, 0, 'puñihuil con pavo', 'pavo,TOMATE,CEBOLLA, TOCINO Y MAYONESA', 4000, 0, 1, 1),
(67, 0, 'puñihuil con cordero', 'cordero,TOMATE,CEBOLLA, TOCINO Y MAYONESA', 4500, 0, 1, 1),
(68, 0, 'rosaura vacuno', 'vacuno, tomate, lechuga y mayonesa', 2200, 0, 1, 1),
(69, 0, 'rosaura chancho', 'chancho,TOMATE, LECHUGA Y MAYONESA', 1800, 0, 1, 1),
(70, 0, 'rosaura pollo', 'pollo,TOMATE, LECHUGA Y MAYONESA', 1800, 0, 1, 1),
(71, 0, 'rosaura fricandela', 'fricandela,TOMATE, LECHUGA Y MAYONESA', 3500, 0, 1, 1),
(72, 0, 'rosaura con plateada', 'plateada,TOMATE, LECHUGA Y MAYONESA', 3500, 0, 1, 1),
(73, 0, 'rosaura con prieta', 'prieta,TOMATE, LECHUGA Y MAYONESA', 3500, 0, 1, 1),
(74, 0, 'rosaura con pernil', 'pernil,TOMATE, LECHUGA Y MAYONESA', 3800, 0, 1, 1),
(75, 0, 'rosaura con chicharron', 'chicharron,TOMATE, LECHUGA Y MAYONESA', 3800, 0, 1, 1),
(76, 0, 'rosaura con lengua', 'lengua,TOMATE, LECHUGA Y MAYONESA', 4000, 0, 1, 1),
(77, 0, 'rosaura con pavo', 'pavo,TOMATE, LECHUGA Y MAYONESA', 4000, 0, 1, 1),
(78, 0, 'rosaura con cordero', 'cordero,TOMATE, LECHUGA Y MAYONESA', 4500, 0, 1, 1),
(79, 0, 'vegetariano de siempre', 'tomate,palta,lechuga,choclo y queso', 1700, 0, 1, 1),
(80, 0, 'vegetariano del huerto', 'pastelera de choclo,champiñones,lechuga y cebolla morada', 2000, 0, 1, 1),
(81, 0, 'guabun', 'jamon y queso', 2000, 0, 1, 1),
(82, 0, 'plateada', 'plateada,pastelera,tomate y lechuga', 3500, 0, 1, 1),
(83, 0, 'gran ajo', 'vacuno,cebolla,choclo,tocino,huevo y cilantro', 3500, 0, 1, 1),
(84, 0, 'pollo al pil pil', 'pollo al pil pil, choclo y queso', 3500, 0, 1, 1),
(85, 0, 'cancato sanguche', 'salmon ahumado,tocino,cebolla,tomate y queso', 3800, 0, 1, 1),
(86, 0, 'pollo al champiñon', 'pollo apanado, champiñon, vegetales de temporada', 3800, 0, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refresco`
--

CREATE TABLE `refresco` (
  `id_ref` int(11) NOT NULL,
  `cod_ref` int(11) DEFAULT NULL,
  `nom_ref` varchar(50) DEFAULT NULL,
  `precio_ref` int(11) DEFAULT NULL,
  `disp_ref` int(1) NOT NULL,
  `public_ref` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `refresco`
--

INSERT INTO `refresco` (`id_ref`, `cod_ref`, `nom_ref`, `precio_ref`, `disp_ref`, `public_ref`) VALUES
(1, 0, 'bebida express', 500, 1, 1),
(2, 0, 'jugo natural', 1000, 1, 1),
(3, 0, 'bebida lata 350cc', 900, 1, 1),
(4, 0, 'agua con gas', 800, 1, 1),
(5, 0, 'agua sin gas', 800, 1, 1),
(6, 0, 'red bull', 1500, 1, 1),
(7, 0, 'monster', 1500, 1, 1),
(8, 0, 'bebida 1.5 lts', 1700, 1, 1),
(9, 0, 'cafe -tè variedades', 500, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refresco_pedido`
--

CREATE TABLE `refresco_pedido` (
  `id_ref_pedido` int(11) NOT NULL,
  `cant_ref` int(11) DEFAULT NULL,
  `id_ref` int(11) DEFAULT NULL,
  `id_detventa` int(11) DEFAULT NULL,
  `cost_ref` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refresco_tmp`
--

CREATE TABLE `refresco_tmp` (
  `id_ref` int(11) NOT NULL,
  `nom_ref` varchar(60) NOT NULL,
  `cos_ref` int(11) NOT NULL,
  `can_ref` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temp`
--

CREATE TABLE `temp` (
  `id_temp` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `obs_prod` varchar(100) NOT NULL,
  `uni_prod` int(11) NOT NULL,
  `val_ing_prod` int(11) NOT NULL,
  `ing_ext_prod` varchar(100) NOT NULL,
  `cant_prod` int(11) NOT NULL,
  `tot_prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `temp`
--

INSERT INTO `temp` (`id_temp`, `id_prod`, `obs_prod`, `uni_prod`, `val_ing_prod`, `ing_ext_prod`, `cant_prod`, `tot_prod`) VALUES
(0, 0, '', 0, 0, '', 0, 0),
(0, 16, '1 sin pastelera con choclo ', 3500, 0, 'MOSTAZA FINAS HIERBAS, CHANCHO EN PIEDRA, ', 2, 7000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp_cotizacion`
--

CREATE TABLE `tmp_cotizacion` (
  `id_prod` int(11) NOT NULL,
  `cod_prod` int(11) DEFAULT NULL,
  `nom_prod` varchar(50) DEFAULT NULL,
  `desc_prod` text,
  `precio_prod` int(10) DEFAULT NULL,
  `disp_prod` int(1) DEFAULT NULL,
  `public_prod` int(1) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `can_prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usr_usuario` varchar(50) DEFAULT NULL,
  `pass_usuario` varchar(50) DEFAULT NULL,
  `nom_usuario` varchar(50) DEFAULT NULL,
  `ape_usuario` varchar(50) DEFAULT NULL,
  `lvl_usuario` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usr_usuario`, `pass_usuario`, `nom_usuario`, `ape_usuario`, `lvl_usuario`) VALUES
(3, 'rguineoa@gmail.com', '5e0719e565ce9ae65fb3b5431d1e3409', 'Roberto', 'Guineo', 0),
(7, 'usuario@usuario.cl', 'e10adc3949ba59abbe56e057f20f883e', 'usuario', 'estandar', 1),
(8, 'demmis@elajo.cl', '202cb962ac59075b964b07152d234b70', 'demmis', 'hennings', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `fecha_venta` datetime DEFAULT NULL,
  `nom_venta` varchar(50) NOT NULL,
  `obs_venta` text,
  `mpago_venta` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `fecha_venta`, `nom_venta`, `obs_venta`, `mpago_venta`) VALUES
(1, '2018-09-27 00:16:18', 'Roberto Andres', NULL, '1'),
(2, '2018-09-27 00:17:01', 'Roberto Andres', NULL, '1'),
(3, '2018-09-27 17:09:49', 'Andres Guineo', NULL, '1'),
(4, '2018-09-27 17:10:12', 'Andres Guineo', NULL, '1'),
(5, '2018-09-27 17:15:08', 'Andres Avendaño', '', '1'),
(6, '2018-09-27 17:16:46', 'Andres Avendaño', 'Sin mayonesa\r\nCortado en 4', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventaaderezos`
--

CREATE TABLE `ventaaderezos` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `aderezo` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventaaderezos`
--

INSERT INTO `ventaaderezos` (`id`, `id_venta`, `aderezo`, `valor`) VALUES
(1, 1, 0, 500),
(2, 2, 0, 500),
(3, 5, 0, 500),
(4, 6, 0, 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventaproducto`
--

CREATE TABLE `ventaproducto` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `producto` text COLLATE utf8_spanish_ci NOT NULL,
  `ingredientes` text COLLATE utf8_spanish_ci,
  `valorProducto` int(11) NOT NULL,
  `valorIngrediente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventaproducto`
--

INSERT INTO `ventaproducto` (`id`, `id_venta`, `producto`, `ingredientes`, `valorProducto`, `valorIngrediente`) VALUES
(1, 2, ' AHUI VACUNO', 'POROTOS VERDES,TOMATE', 2200, 800),
(2, 3, ' AHUI VACUNO', 'POROTOS VERDES,TOMATE', 2200, 800),
(3, 4, ' AHUI VACUNO', 'POROTOS VERDES,TOMATE', 2200, 800),
(4, 5, ' AHUI VACUNO', 'POROTOS VERDES,TOMATE', 2200, 800),
(5, 6, 'AHUI CON CHANCHO', 'POROTOS VERDES', 1800, 400);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventarefrescos`
--

CREATE TABLE `ventarefrescos` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `refresco` text COLLATE utf8_spanish_ci NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventarefrescos`
--

INSERT INTO `ventarefrescos` (`id`, `id_venta`, `refresco`, `valor`) VALUES
(1, 1, 'BEBIDA EXPRESS', 500),
(2, 2, 'BEBIDA EXPRESS', 500),
(3, 5, 'BEBIDA EXPRESS', 500),
(4, 6, 'BEBIDA EXPRESS', 500);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aderezo`
--
ALTER TABLE `aderezo`
  ADD PRIMARY KEY (`id_aderezo`);

--
-- Indices de la tabla `aderezo_pedido`
--
ALTER TABLE `aderezo_pedido`
  ADD PRIMARY KEY (`id_ader_pedido`),
  ADD KEY `id_aderezo` (`id_aderezo`),
  ADD KEY `id_detventa` (`id_detventa`);

--
-- Indices de la tabla `det_venta`
--
ALTER TABLE `det_venta`
  ADD PRIMARY KEY (`id_detventa`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`id_ingr`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_prod`);

--
-- Indices de la tabla `refresco`
--
ALTER TABLE `refresco`
  ADD PRIMARY KEY (`id_ref`);

--
-- Indices de la tabla `refresco_pedido`
--
ALTER TABLE `refresco_pedido`
  ADD PRIMARY KEY (`id_ref_pedido`),
  ADD KEY `id_ref` (`id_ref`),
  ADD KEY `id_detventa` (`id_detventa`);

--
-- Indices de la tabla `tmp_cotizacion`
--
ALTER TABLE `tmp_cotizacion`
  ADD PRIMARY KEY (`id_prod`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`);

--
-- Indices de la tabla `ventaaderezos`
--
ALTER TABLE `ventaaderezos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventaproducto`
--
ALTER TABLE `ventaproducto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventarefrescos`
--
ALTER TABLE `ventarefrescos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aderezo`
--
ALTER TABLE `aderezo`
  MODIFY `id_aderezo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `aderezo_pedido`
--
ALTER TABLE `aderezo_pedido`
  MODIFY `id_ader_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `det_venta`
--
ALTER TABLE `det_venta`
  MODIFY `id_detventa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `id_ingr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `refresco`
--
ALTER TABLE `refresco`
  MODIFY `id_ref` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `refresco_pedido`
--
ALTER TABLE `refresco_pedido`
  MODIFY `id_ref_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tmp_cotizacion`
--
ALTER TABLE `tmp_cotizacion`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ventaaderezos`
--
ALTER TABLE `ventaaderezos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventaproducto`
--
ALTER TABLE `ventaproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ventarefrescos`
--
ALTER TABLE `ventarefrescos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aderezo_pedido`
--
ALTER TABLE `aderezo_pedido`
  ADD CONSTRAINT `aderezo_pedido_ibfk_1` FOREIGN KEY (`id_aderezo`) REFERENCES `aderezo` (`id_aderezo`),
  ADD CONSTRAINT `aderezo_pedido_ibfk_2` FOREIGN KEY (`id_detventa`) REFERENCES `det_venta` (`id_detventa`);

--
-- Filtros para la tabla `det_venta`
--
ALTER TABLE `det_venta`
  ADD CONSTRAINT `det_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`);

--
-- Filtros para la tabla `refresco_pedido`
--
ALTER TABLE `refresco_pedido`
  ADD CONSTRAINT `refresco_pedido_ibfk_1` FOREIGN KEY (`id_ref`) REFERENCES `refresco` (`id_ref`),
  ADD CONSTRAINT `refresco_pedido_ibfk_2` FOREIGN KEY (`id_detventa`) REFERENCES `det_venta` (`id_detventa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
