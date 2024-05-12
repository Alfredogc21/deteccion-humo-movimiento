-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-05-2024 a las 04:41:31
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
-- Base de datos: `proyectoitfip2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bloques`
--

CREATE TABLE `bloques` (
  `id` int(11) NOT NULL,
  `nombre_bloques` char(5) NOT NULL,
  `sedes_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `bloques`
--

INSERT INTO `bloques` (`id`, `nombre_bloques`, `sedes_id`) VALUES
(1, 'B', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrohumo`
--

CREATE TABLE `registrohumo` (
  `id` int(11) NOT NULL,
  `estado` smallint(5) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `mac` varchar(20) NOT NULL,
  `sensorhumo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `registrohumo`
--

INSERT INTO `registrohumo` (`id`, `estado`, `fecha`, `mac`, `sensorhumo_id`) VALUES
(1, 1902, '2023-11-27 05:52:07', 'B0:A7:32:DC:32:AC', 32),
(2, 913, '2023-10-28 06:21:54', 'A1:B2:33:ED:43:BD', 34),
(3, 945, '2023-10-28 07:03:12', 'B0:A7:32:DC:32:AC', 32),
(4, 922, '2023-10-28 07:32:45', 'A1:B2:33:ED:43:BD', 34),
(5, 957, '2023-10-28 08:14:09', 'B0:A7:32:DC:32:AC', 32),
(6, 930, '2023-10-28 08:42:56', 'A1:B2:33:ED:43:BD', 34),
(7, 914, '2023-10-28 09:24:23', 'B0:A7:32:DC:32:AC', 32),
(8, 929, '2023-10-28 09:53:59', 'A1:B2:33:ED:43:BD', 34),
(9, 951, '2023-10-28 10:35:17', 'B0:A7:32:DC:32:AC', 32),
(10, 926, '2023-10-28 11:03:44', 'A1:B2:33:ED:43:BD', 34),
(11, 943, '2023-10-28 11:45:08', 'B0:A7:32:DC:32:AC', 32),
(12, 916, '2023-10-28 12:13:56', 'A1:B2:33:ED:43:BD', 34),
(13, 932, '2023-10-28 12:55:21', 'B0:A7:32:DC:32:AC', 32),
(14, 955, '2023-10-28 13:23:47', 'A1:B2:33:ED:43:BD', 34),
(15, 919, '2023-10-28 14:05:04', 'B0:A7:32:DC:32:AC', 32),
(16, 949, '2023-10-28 14:33:41', 'A1:B2:33:ED:43:BD', 34),
(17, 921, '2023-10-28 15:15:07', 'B0:A7:32:DC:32:AC', 32),
(18, 1936, '2023-10-28 15:43:54', 'A1:B2:33:ED:43:BD', 34),
(19, 953, '2023-11-15 16:25:20', 'B0:A7:32:DC:32:AC', 32),
(20, 1924, '2023-11-27 16:53:46', 'A1:B2:33:ED:43:BD', 34);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registromovi`
--

CREATE TABLE `registromovi` (
  `id` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `mac` varchar(20) DEFAULT NULL,
  `sensormovi_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `registromovi`
--

INSERT INTO `registromovi` (`id`, `estado`, `fecha`, `mac`, `sensormovi_id`) VALUES
(1, 1, '2023-11-28 03:50:54', 'B0:A7:32:DC:32:AC', 25),
(2, 0, '2023-11-28 03:50:54', 'A1:B2:33:ED:43:BD', 26),
(3, 1, '2023-11-28 03:50:54', 'C2:D3:44:FE:54:CE', 27),
(4, 0, '2023-11-28 03:50:54', 'D4:E5:55:GF:65:EF', 18),
(5, 0, '2023-11-28 03:50:54', 'G6:H7:66:HG:76:GH', 33),
(6, 0, '2023-11-28 03:50:54', 'I8:J9:77:IH:87:HI', 35),
(7, 1, '2023-11-28 03:50:54', 'K0:L1:88:JK:98:KJ', 25),
(8, 0, '2023-11-28 03:50:54', 'M2:N3:99:LM:09:ML', 26),
(9, 1, '2023-11-28 03:50:54', 'O4:P5:00:NO:10:ON', 27),
(10, 0, '2023-11-28 03:50:54', 'Q6:R7:11:QP:21:PQ', 18),
(11, 0, '2023-11-28 04:16:41', 'M2:N3:99:LM:09:ML', 26),
(12, 1, '2023-11-30 02:09:18', 'Q6:R7:11:SP:21:PS', 18),
(13, 0, '2023-12-04 04:23:48', 'C2:D3:44:FE:54:CE', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id` int(11) NOT NULL,
  `nombre_sedes` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id`, `nombre_sedes`) VALUES
(1, 'Espinal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sensorhumo`
--

CREATE TABLE `sensorhumo` (
  `id` int(11) NOT NULL,
  `nombre_pasillos` char(11) NOT NULL,
  `bloques_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `sensorhumo`
--

INSERT INTO `sensorhumo` (`id`, `nombre_pasillos`, `bloques_id`) VALUES
(32, 'Pasillo B', 1),
(34, 'Pasillo A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sensormovi`
--

CREATE TABLE `sensormovi` (
  `id` int(11) NOT NULL,
  `nombre_salones` char(5) NOT NULL,
  `bloques_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `sensormovi`
--

INSERT INTO `sensormovi` (`id`, `nombre_salones`, `bloques_id`) VALUES
(18, '202', 1),
(25, '303', 1),
(26, '216', 1),
(27, '600', 1),
(33, '203', 1),
(35, '204', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bloques`
--
ALTER TABLE `bloques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sedes_id` (`sedes_id`);

--
-- Indices de la tabla `registrohumo`
--
ALTER TABLE `registrohumo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasillos_id` (`sensorhumo_id`);

--
-- Indices de la tabla `registromovi`
--
ALTER TABLE `registromovi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salones_id` (`sensormovi_id`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sensorhumo`
--
ALTER TABLE `sensorhumo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bloques_id` (`bloques_id`);

--
-- Indices de la tabla `sensormovi`
--
ALTER TABLE `sensormovi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bloques_id` (`bloques_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bloques`
--
ALTER TABLE `bloques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `registrohumo`
--
ALTER TABLE `registrohumo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `registromovi`
--
ALTER TABLE `registromovi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sensorhumo`
--
ALTER TABLE `sensorhumo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bloques`
--
ALTER TABLE `bloques`
  ADD CONSTRAINT `bloques_ibfk_1` FOREIGN KEY (`sedes_id`) REFERENCES `sedes` (`id`);

--
-- Filtros para la tabla `registrohumo`
--
ALTER TABLE `registrohumo`
  ADD CONSTRAINT `registrohumo_ibfk_1` FOREIGN KEY (`sensorhumo_id`) REFERENCES `sensorhumo` (`id`);

--
-- Filtros para la tabla `registromovi`
--
ALTER TABLE `registromovi`
  ADD CONSTRAINT `registromovi_ibfk_1` FOREIGN KEY (`sensormovi_id`) REFERENCES `sensormovi` (`id`);

--
-- Filtros para la tabla `sensorhumo`
--
ALTER TABLE `sensorhumo`
  ADD CONSTRAINT `sensorhumo_ibfk_1` FOREIGN KEY (`bloques_id`) REFERENCES `bloques` (`id`);

--
-- Filtros para la tabla `sensormovi`
--
ALTER TABLE `sensormovi`
  ADD CONSTRAINT `sensormovi_ibfk_1` FOREIGN KEY (`bloques_id`) REFERENCES `bloques` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
