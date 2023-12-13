-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-12-2023 a las 01:12:11
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fact10`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anulacion_venta`
--

DROP TABLE IF EXISTS `anulacion_venta`;
CREATE TABLE IF NOT EXISTS `anulacion_venta` (
  `ID_Venta` int DEFAULT NULL,
  `Fecha_Anulacion` date DEFAULT NULL,
  `Motivo_Anulacion` varchar(20) DEFAULT NULL,
  `ID_Anulacion` int NOT NULL,
  PRIMARY KEY (`ID_Anulacion`),
  KEY `ID_Venta` (`ID_Venta`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `N_Documento_Cliente` double DEFAULT NULL,
  `ID_Tipo_Documento` int DEFAULT NULL,
  `Nom_Cliente` varchar(20) DEFAULT NULL,
  `Telefono_Cliente` double DEFAULT NULL,
  `Email_Cliente` varchar(20) DEFAULT NULL,
  `Barrio` varchar(20) DEFAULT NULL,
  `ID_Cliente` int NOT NULL,
  PRIMARY KEY (`ID_Cliente`),
  KEY `ID_Tipo_Documento` (`ID_Tipo_Documento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `Total` float DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `ID_Venta` int DEFAULT NULL,
  `ID_Producto` int DEFAULT NULL,
  `ID_Detalle` int NOT NULL,
  PRIMARY KEY (`ID_Detalle`),
  KEY `ID_Venta` (`ID_Venta`),
  KEY `ID_Producto` (`ID_Producto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `N_Documento_Empleado` double DEFAULT NULL,
  `ID_Tipo_Documento` int DEFAULT NULL,
  `Nom_Empleado` varchar(20) DEFAULT NULL,
  `Telefono_Empleado` double DEFAULT NULL,
  `Email_Empleado` varchar(20) DEFAULT NULL,
  `Direccion_Empleado` varchar(20) DEFAULT NULL,
  `Nom_Usuario` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `ID_Empleado` int NOT NULL,
  PRIMARY KEY (`ID_Empleado`),
  KEY `ID_Tipo_Documento` (`ID_Tipo_Documento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`N_Documento_Empleado`, `ID_Tipo_Documento`, `Nom_Empleado`, `Telefono_Empleado`, `Email_Empleado`, `Direccion_Empleado`, `Nom_Usuario`, `Password`, `ID_Empleado`) VALUES
(123456789, 5, 'TATAN', 3124887598, 'este@hotmail.com', 'calle 45 67 45', 'tatan123', '123', 1),
(789456123, 3, 'Marcela', 3152894568, 'tambien@hotmail.es', 'diagona102 67 45', 'Marce', '159159', 2),
(123123123, 5, 'Aura', 3124785962, 'cual@yahoo.com', 'calle 170 01 24', 'aura01', '123456', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `Nom_Producto` varchar(20) DEFAULT NULL,
  `ID_Proveedor` int DEFAULT NULL,
  `Precio_Unitario` float DEFAULT NULL,
  `Fecha_vencimiento` date DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `ID_Producto` int NOT NULL,
  PRIMARY KEY (`ID_Producto`),
  KEY `ID_Proveedor` (`ID_Proveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `ID_Proveedor` int NOT NULL,
  `Nom_Proveedor` varchar(20) DEFAULT NULL,
  `RUT` double DEFAULT NULL,
  `Direccion_Proveedor` varchar(20) DEFAULT NULL,
  `Email_Preveedor` varchar(20) DEFAULT NULL,
  `Telefono_Proveedor` double DEFAULT NULL,
  PRIMARY KEY (`ID_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `ID_Tipo_Documento` int NOT NULL,
  `Nom_Tipo_Documento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Tipo_Documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `ID_Cliente` int DEFAULT NULL,
  `ID_Empleado` int DEFAULT NULL,
  `ID_Venta` int NOT NULL,
  PRIMARY KEY (`ID_Venta`),
  KEY `ID_Cliente` (`ID_Cliente`),
  KEY `ID_Empleado` (`ID_Empleado`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
