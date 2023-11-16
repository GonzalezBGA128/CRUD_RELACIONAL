-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2023 a las 22:32:06
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_organica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcategoria` int(10) NOT NULL,
  `nombrecategoria` varchar(100) NOT NULL,
  `estadocategoria` varchar(50) NOT NULL DEFAULT '1',
  `descripcioncategoria` varchar(50) NOT NULL,
  `fechacreacion` date NOT NULL,
  `creadorcategoria` varchar(50) NOT NULL,
  `notacategoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcategoria`, `nombrecategoria`, `estadocategoria`, `descripcioncategoria`, `fechacreacion`, `creadorcategoria`, `notacategoria`) VALUES
(7, 'skincare', 'Inactiva', 'productos para el cuidado de la piel', '2023-11-15', 'skincare', 'Ninguna');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `idMarca` int(10) NOT NULL,
  `nombreMarca` varchar(100) NOT NULL,
  `estadoMarca` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(10) NOT NULL,
  `categoriaId` int(10) NOT NULL,
  `provedoorId` int(10) NOT NULL,
  `preciopaquete` decimal(10,2) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `preciounidad` decimal(10,2) NOT NULL,
  `noexistencias` int(50) NOT NULL,
  `nombreproducto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `categoriaId`, `provedoorId`, `preciopaquete`, `descripcion`, `preciounidad`, `noexistencias`, `nombreproducto`) VALUES
(46, 7, 1, 2500.00, 'Agua de rosas con extracto de aloe vera', 250.00, 120, 'agua de rosas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provedoor`
--

CREATE TABLE `provedoor` (
  `idprovedoor` int(10) NOT NULL,
  `establecimiento` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` int(12) NOT NULL,
  `direccionempresa` varchar(100) NOT NULL,
  `nombreempresa` varchar(50) NOT NULL,
  `codigopostal` int(6) NOT NULL,
  `pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `provedoor`
--

INSERT INTO `provedoor` (`idprovedoor`, `establecimiento`, `correo`, `telefono`, `direccionempresa`, `nombreempresa`, `codigopostal`, `pais`) VALUES
(1, 'Empresa', 'grecia@gmail.com', 123456789, 'calle cerro  de colima 6598', 'belleza organica', 32680, 'mexico');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `categoriaId` (`categoriaId`),
  ADD KEY `marcaId` (`provedoorId`);

--
-- Indices de la tabla `provedoor`
--
ALTER TABLE `provedoor`
  ADD PRIMARY KEY (`idprovedoor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcategoria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `provedoor`
--
ALTER TABLE `provedoor`
  MODIFY `idprovedoor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
