-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-07-2022 a las 17:48:56
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_limpiobe`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ordena` (IN `an` INT)   select c.Nombres, sum(Precio*Cantidad) total
from cliente c join ventas f on c.IdCliente=f.IdCliente
join detalle_ventas d on f.IdVentas=d.IdVentas
join producto a on a.IdProducto=d.IdProducto
where year(FechaVentas)=an
group by c.Nombres
order by 2 DESC$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `IdAdmin` int(10) UNSIGNED NOT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Contrasena` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`IdAdmin`, `Correo`, `Contrasena`) VALUES
(1, 'carloschafloque@limpiobe.com',aes_encrypt('C6C9','lb')),
(2, 'jhonllapapasca@limpiobe.com',aes_encrypt('J4L10','lb'));

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `IdCliente` int(11) UNSIGNED NOT NULL,
  `Dni` varchar(11) DEFAULT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Telefono` varchar(9) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`IdCliente`, `Dni`, `Nombre`, `Telefono`, `Correo`, `Direccion`) VALUES
(1, '0712345', 'Juan Guerrero', '90712345', 'juanguerrero@gmail.com', 'Av. Mexico y 27 de Julio - JLO'),
(2, '7034545', 'Anypsa SAC', '080100110', 'Anypsasac@hotmail.com', 'Calle, El­ias Aguirre N° 87 - Chiclayo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `IdDetalleVentas` int(11) UNSIGNED NOT NULL,
  `IdVentas` int(11) UNSIGNED NOT NULL,
  `IdProducto` int(11) UNSIGNED NOT NULL,
  `Cantidad` int(11) UNSIGNED DEFAULT NULL,
  `PrecioVenta` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `IdEmpleado` int(10) UNSIGNED NOT NULL,
  `IdAdmin` int(11) UNSIGNED NOT NULL,
  `Dni` varchar(8) NOT NULL,
  `Nombres` varchar(25) DEFAULT NULL,
  `Apellidos` varchar(25) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Contrasena` varchar(200) DEFAULT NULL,
  `Foto` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`IdEmpleado`, `IdAdmin`, `Dni`, `Nombres`, `Apellidos`, `Correo`, `Contrasena`, `Foto`) VALUES
(1,1, '49587412', 'Kevin Guztavo','Diaz Figuero', 'kevindiaz@limpiobe.com', aes_encrypt('K5D4','lb') ,'https://i.postimg.cc/fbLFZVcP/Empleado-1.png'),
(2,2, '47152541', 'Julio Guztavo','Guzman Arrobas','julioguzman@limpiobe.com',aes_encrypt('J5G6','lb'),'https://i.postimg.cc/43S03Xwx/Empleado-2.png'),
(3,2, '41847415', 'Carlos Efrain','Chafloque Llontop', 'carloschafloque@limpiobe.com',aes_encrypt('C6C9','lb') ,'https://i.postimg.cc/sXGNQb09/Empleado-3.png'),
(4,1, '36741512', 'Jhon Alexander','Llapapasca Montes', 'jhonllapapasca@limpiobe.com', aes_encrypt('J4L10','lb'),'https://i.postimg.cc/PJGFmKgG/Empleado-4.png'),
(5,2, '41647418', 'Maria Flor','Gonzales Cruz', 'mariagonzales@limpiobe.com', aes_encrypt('C6C9','lb'),'https://i.postimg.cc/htK6yyfc/Empleada-1.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `IdProducto` int(11) UNSIGNED NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Presentacion` varchar(30) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Stock` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`IdProducto`, `Nombre`, `Presentacion`, `Precio`, `Stock`) VALUES
(1, 'Jabón Líquido', '380 ml', 6.0, 10),
(2, 'Jabón Líquido', '500 ml', 7.0, 10),
(3, 'Jabón Líquido', '1 L', 9.0, 10),
(4, 'Jabón Líquido', '3.8 L ', 24.0, 10),
(5, 'Alcohol en Gel', '380 ml', 9.0, 10),
(6, 'Alcohol en Gel', '500 ml', 12.0, 10),
(7, 'Alcohol en Gel', '1 L', 20.0, 10),
(8, 'Alcohol en Gel', '3.8 L', 62.0, 10),
(9, 'Lejía', '500 ml', 2.0, 10),
(10, 'Lejía', '1 L', 3.5, 10),
(11, 'Lejía', '3.8 L', 11.0, 10),
(12, 'Limpiatodo Aromatizado', '900 ml', 4.5, 10),
(13, 'Limpiatodo Aromatizado', '1.5 L', 9.0, 10),
(14, 'Limpiatodo Aspersor', '3.8 L', 14, 10),
(15, 'Desifectante Pino', '900 ml', 7.0, 10),
(16, 'Desifectante Pino', '1 L', 14.0, 10),
(17, 'Desifectante Pino', '3.8 L', 20.0, 10),
(18, 'Silicona para Tableros', '600 ml', 11.0, 10),
(19, 'Silicona para Tableros', '1 L', 16.0, 10),
(20, 'Silicona para Tableros', '3.8 L', 48.0, 10),
(21, 'Shampoo para Autos', '500 ml', 11.0, 10),
(22, 'Shampoo para Autos', '1 L', 15.0, 10),
(23, 'Shampoo para Autos', '1.8 L', 32.0, 10),
(24, 'Alcohol Puro 96° G.L', '500 ml', 5.0, 10),
(25, 'Alcohol Puro 96° G.L', '1 L', 9.0, 10),
(26, 'Alcohol Puro 96° G.L', '1 L + Aspersor', 10.0, 10),
(27, 'Alcohol de Eucalipto', '500 ml', 5.0, 10),
(28, 'Alcohol de Eucalipto', '1 L', 10.0, 10),
(29, 'Alcohol de Eucalipto', '1 L + Aspersor', 11.0, 10),
(30, 'Lavavajilla', '600 ml', 9.0, 10),
(31, 'Lavavajilla', '900 ml', 12.0, 10),
(32, 'Lavavajilla', '3.8 L', 30.0, 10),
(33, 'Quitagrasa', '600 ml', 8.0, 10),
(34, 'Quitagrasa', '900 ml', 11.0, 10),
(35, 'Quitagrasa', '3.8 L', 17.0, 10),
(36, 'Sacasarro', '500 ml', 6.0, 10),
(37, 'Sacasarro', '900 ml', 8.0, 10),
(38, 'Sacasarro', '3.8 L', 20.0, 10),
(39, 'Limpiavidrio', '600 ml', 9.0, 10),
(40, 'Limpiavidrio', '900 ml', 11.0, 10),
(41, 'Limpiavidrio', '3.8 L', 18.0, 10),
(42, 'Suavizante de Ropa', '500 ml', 7.0, 10),
(43, 'Suavizante de Ropa', '900 ml', 10.0, 10),
(44, 'Suavizante de Ropa', '3.8 L', 28.0, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `IdVentas` int(11) UNSIGNED NOT NULL,
  `IdCliente` int(11) UNSIGNED NOT NULL,
  `IdEmpleado` int(10) UNSIGNED NOT NULL,
  `NumeroSerie` varchar(10) DEFAULT NULL,
  `FechaVentas` date DEFAULT NULL,
  `Monto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`IdAdmin`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`IdDetalleVentas`,`IdVentas`,`IdProducto`),
  ADD KEY `Ventas_has_Producto_FKIndex1` (`IdVentas`),
  ADD KEY `Ventas_has_Producto_FKIndex2` (`IdProducto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`IdEmpleado`),
  ADD KEY `Empleado_FKIndex1` (`IdAdmin`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`IdProducto`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`IdVentas`),
  ADD KEY `Ventas_FKIndex1` (`IdEmpleado`),
  ADD KEY `Ventas_FKIndex2` (`IdCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `IdAdmin` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `IdCliente` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `IdDetalleVentas` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `IdEmpleado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `IdProducto` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `IdVentas` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`IdVentas`) REFERENCES `ventas` (`IdVentas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`IdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`IdAdmin`) REFERENCES `admin` (`IdAdmin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleado` (`IdEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
