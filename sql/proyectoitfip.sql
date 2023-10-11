-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2023 a las 10:12:22
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectoitfip`
--CREATE DATABASE IF NOT EXISTS `proyectoitfip` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
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
-- Estructura de tabla para la tabla `pasillos`
--

CREATE TABLE `pasillos` (
  `id` int(11) NOT NULL,
  `nombre_pasillos` char(11) NOT NULL,
  `bloques_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pasillos`
--

INSERT INTO `pasillos` (`id`, `nombre_pasillos`, `bloques_id`) VALUES
(1, 'Pasillo A', 1),
(2, 'Pasillo B', 1),
(3, 'Pasillo C', 1),
(4, 'Pasillo D', 1),
(5, 'Pasillo E', 1),
(6, 'Pasillo A', 1),
(7, 'Pasillo B', 1),
(8, 'Pasillo C', 1),
(9, 'Pasillo D', 1),
(10, 'Pasillo E', 1),
(11, 'Pasillo A', 1),
(12, 'Pasillo B', 1),
(13, 'Pasillo C', 1),
(14, 'Pasillo D', 1),
(15, 'Pasillo E', 1),
(16, 'Pasillo A', 1),
(17, 'Pasillo B', 1),
(18, 'Pasillo C', 1),
(19, 'Pasillo D', 1),
(20, 'Pasillo E', 1),
(21, 'Pasillo A', 1),
(22, 'Pasillo B', 1),
(23, 'Pasillo C', 1),
(24, 'Pasillo D', 1),
(25, 'Pasillo E', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regisalones`
--

CREATE TABLE `regisalones` (
  `id` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `mac` varchar(20) DEFAULT NULL,
  `salones_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `regisalones`
--

INSERT INTO `regisalones` (`id`, `estado`, `fecha`, `mac`, `salones_id`) VALUES
(1, 1, '2023-10-07 03:15:01', 'B0:A7:32:DC:32:AC', 25),
(2, 1, '2023-10-07 03:15:02', 'B0:A7:32:DC:32:AC', 26),
(3, 0, '2023-10-07 03:15:03', 'B0:A7:32:DC:32:AC', 27),
(4, 1, '2023-10-07 03:15:08', 'B0:A7:32:DC:32:AC', 25),
(5, 1, '2023-10-07 03:15:09', 'B0:A7:32:DC:32:AC', 26),
(6, 0, '2023-10-07 03:15:10', 'B0:A7:32:DC:32:AC', 27),
(7, 1, '2023-10-07 03:15:14', 'B0:A7:32:DC:32:AC', 25),
(8, 1, '2023-10-07 03:15:15', 'B0:A7:32:DC:32:AC', 26),
(9, 0, '2023-10-07 03:15:17', 'B0:A7:32:DC:32:AC', 27),
(10, 1, '2023-10-07 03:15:21', 'B0:A7:32:DC:32:AC', 25),
(11, 1, '2023-10-07 03:15:22', 'B0:A7:32:DC:32:AC', 26),
(12, 1, '2023-10-07 03:15:24', 'B0:A7:32:DC:32:AC', 27),
(13, 1, '2023-10-07 03:15:29', 'B0:A7:32:DC:32:AC', 25),
(14, 1, '2023-10-07 03:15:30', 'B0:A7:32:DC:32:AC', 26),
(15, 0, '2023-10-07 03:15:32', 'B0:A7:32:DC:32:AC', 27),
(16, 1, '2023-10-07 03:15:36', 'B0:A7:32:DC:32:AC', 25),
(17, 1, '2023-10-07 03:15:37', 'B0:A7:32:DC:32:AC', 26),
(18, 0, '2023-10-07 03:15:39', 'B0:A7:32:DC:32:AC', 27),
(19, 1, '2023-10-07 03:15:43', 'B0:A7:32:DC:32:AC', 25),
(20, 1, '2023-10-07 03:15:44', 'B0:A7:32:DC:32:AC', 26),
(21, 1, '2023-10-07 03:15:45', 'B0:A7:32:DE:9F:6C', 32),
(22, 1, '2023-10-07 03:15:46', 'B0:A7:32:DC:32:AC', 27),
(23, 1, '2023-10-07 03:15:46', 'B0:A7:32:DE:9F:6C', 35),
(24, 1, '2023-10-07 03:15:47', 'B0:A7:32:DE:9F:6C', 34),
(25, 1, '2023-10-07 03:15:50', 'B0:A7:32:DC:32:AC', 25),
(26, 1, '2023-10-07 03:15:51', 'B0:A7:32:DC:32:AC', 26),
(27, 1, '2023-10-07 03:15:52', 'B0:A7:32:DE:9F:6C', 32),
(28, 0, '2023-10-07 03:15:53', 'B0:A7:32:DC:32:AC', 27),
(29, 1, '2023-10-07 03:15:53', 'B0:A7:32:DE:9F:6C', 35),
(30, 1, '2023-10-07 03:15:54', 'B0:A7:32:DE:9F:6C', 34),
(31, 1, '2023-10-07 03:15:57', 'B0:A7:32:DC:32:AC', 25),
(32, 1, '2023-10-07 03:15:58', 'B0:A7:32:DC:32:AC', 26),
(33, 1, '2023-10-07 03:15:59', 'B0:A7:32:DE:9F:6C', 32),
(34, 1, '2023-10-07 03:15:59', 'B0:A7:32:DC:32:AC', 27),
(35, 1, '2023-10-07 03:16:00', 'B0:A7:32:DE:9F:6C', 35),
(36, 1, '2023-10-07 03:16:01', 'B0:A7:32:DE:9F:6C', 34),
(37, 1, '2023-10-07 03:16:04', 'B0:A7:32:DC:32:AC', 25),
(38, 1, '2023-10-07 03:16:05', 'B0:A7:32:DC:32:AC', 26),
(39, 1, '2023-10-07 03:16:06', 'B0:A7:32:DE:9F:6C', 32),
(40, 0, '2023-10-07 03:16:06', 'B0:A7:32:DC:32:AC', 27),
(41, 1, '2023-10-07 03:16:07', 'B0:A7:32:DE:9F:6C', 35),
(42, 1, '2023-10-07 03:16:08', 'B0:A7:32:DE:9F:6C', 34),
(43, 1, '2023-10-07 03:16:11', 'B0:A7:32:DC:32:AC', 25),
(44, 1, '2023-10-07 03:16:12', 'B0:A7:32:DC:32:AC', 26),
(45, 1, '2023-10-07 03:16:13', 'B0:A7:32:DE:9F:6C', 32),
(46, 0, '2023-10-07 03:16:13', 'B0:A7:32:DC:32:AC', 27),
(47, 1, '2023-10-07 03:16:14', 'B0:A7:32:DE:9F:6C', 35),
(48, 1, '2023-10-07 03:16:15', 'B0:A7:32:DE:9F:6C', 34),
(49, 1, '2023-10-07 03:16:18', 'B0:A7:32:DC:32:AC', 25),
(50, 1, '2023-10-07 03:16:19', 'B0:A7:32:DC:32:AC', 26),
(51, 1, '2023-10-07 03:16:20', 'B0:A7:32:DE:9F:6C', 32),
(52, 1, '2023-10-07 03:16:20', 'B0:A7:32:DC:32:AC', 27),
(53, 1, '2023-10-07 03:16:21', 'B0:A7:32:DE:9F:6C', 35),
(54, 1, '2023-10-07 03:16:22', 'B0:A7:32:DE:9F:6C', 34),
(55, 1, '2023-10-07 03:16:25', 'B0:A7:32:DC:32:AC', 25),
(56, 1, '2023-10-07 03:16:26', 'B0:A7:32:DC:32:AC', 26),
(57, 1, '2023-10-07 03:16:27', 'B0:A7:32:DC:32:AC', 27),
(58, 1, '2023-10-07 03:16:27', 'B0:A7:32:DE:9F:6C', 32),
(59, 1, '2023-10-07 03:16:28', 'B0:A7:32:DE:9F:6C', 35),
(60, 1, '2023-10-07 03:16:29', 'B0:A7:32:DE:9F:6C', 34),
(61, 1, '2023-10-07 03:16:31', 'B0:A7:32:DC:32:AC', 25),
(62, 1, '2023-10-07 03:16:32', 'B0:A7:32:DC:32:AC', 26),
(63, 1, '2023-10-07 03:16:34', 'B0:A7:32:DC:32:AC', 27),
(64, 1, '2023-10-07 03:16:34', 'B0:A7:32:DE:9F:6C', 32),
(65, 1, '2023-10-07 03:16:35', 'B0:A7:32:DE:9F:6C', 35),
(66, 1, '2023-10-07 03:16:36', 'B0:A7:32:DE:9F:6C', 34),
(67, 1, '2023-10-07 03:16:38', 'B0:A7:32:DC:32:AC', 25),
(68, 1, '2023-10-07 03:16:40', 'B0:A7:32:DC:32:AC', 26),
(69, 1, '2023-10-07 03:16:41', 'B0:A7:32:DC:32:AC', 27),
(70, 1, '2023-10-07 03:16:41', 'B0:A7:32:DE:9F:6C', 32),
(71, 1, '2023-10-07 03:16:42', 'B0:A7:32:DE:9F:6C', 35),
(72, 1, '2023-10-07 03:16:43', 'B0:A7:32:DE:9F:6C', 34),
(73, 1, '2023-10-07 03:16:45', 'B0:A7:32:DC:32:AC', 25),
(74, 1, '2023-10-07 03:16:47', 'B0:A7:32:DC:32:AC', 26),
(75, 1, '2023-10-07 03:16:48', 'B0:A7:32:DC:32:AC', 27),
(76, 1, '2023-10-07 03:16:48', 'B0:A7:32:DE:9F:6C', 32),
(77, 1, '2023-10-07 03:16:50', 'B0:A7:32:DE:9F:6C', 35),
(78, 1, '2023-10-07 03:16:51', 'B0:A7:32:DE:9F:6C', 34),
(79, 1, '2023-10-07 03:16:52', 'B0:A7:32:DC:32:AC', 25),
(80, 1, '2023-10-07 03:16:53', 'B0:A7:32:DC:32:AC', 26),
(81, 1, '2023-10-07 03:16:55', 'B0:A7:32:DC:32:AC', 27),
(82, 1, '2023-10-07 03:16:56', 'B0:A7:32:DE:9F:6C', 32),
(83, 1, '2023-10-07 03:16:57', 'B0:A7:32:DE:9F:6C', 35),
(84, 1, '2023-10-07 03:16:58', 'B0:A7:32:DE:9F:6C', 34),
(85, 1, '2023-10-07 03:16:59', 'B0:A7:32:DC:32:AC', 25),
(86, 1, '2023-10-07 03:17:00', 'B0:A7:32:DC:32:AC', 26),
(87, 1, '2023-10-07 03:17:01', 'B0:A7:32:DC:32:AC', 27),
(88, 1, '2023-10-07 03:17:03', 'B0:A7:32:DE:9F:6C', 32),
(89, 0, '2023-10-07 03:17:04', 'B0:A7:32:DE:9F:6C', 35),
(90, 1, '2023-10-07 03:17:05', 'B0:A7:32:DE:9F:6C', 34),
(91, 1, '2023-10-07 03:17:06', 'B0:A7:32:DC:32:AC', 25),
(92, 1, '2023-10-07 03:17:07', 'B0:A7:32:DC:32:AC', 26),
(93, 1, '2023-10-07 03:17:09', 'B0:A7:32:DC:32:AC', 27),
(94, 1, '2023-10-07 03:17:10', 'B0:A7:32:DE:9F:6C', 32),
(95, 0, '2023-10-07 03:17:11', 'B0:A7:32:DE:9F:6C', 35),
(96, 1, '2023-10-07 03:17:12', 'B0:A7:32:DE:9F:6C', 34),
(97, 1, '2023-10-07 03:17:13', 'B0:A7:32:DC:32:AC', 25),
(98, 1, '2023-10-07 03:17:15', 'B0:A7:32:DC:32:AC', 26),
(99, 1, '2023-10-07 03:17:16', 'B0:A7:32:DC:32:AC', 27),
(100, 1, '2023-10-07 03:17:17', 'B0:A7:32:DE:9F:6C', 32),
(101, 0, '2023-10-07 03:17:18', 'B0:A7:32:DE:9F:6C', 35),
(102, 1, '2023-10-07 03:17:19', 'B0:A7:32:DE:9F:6C', 34),
(103, 1, '2023-10-07 03:17:21', 'B0:A7:32:DC:32:AC', 25),
(104, 1, '2023-10-07 03:17:22', 'B0:A7:32:DC:32:AC', 26),
(105, 1, '2023-10-07 03:17:23', 'B0:A7:32:DC:32:AC', 27),
(106, 1, '2023-10-07 03:17:24', 'B0:A7:32:DE:9F:6C', 32),
(107, 0, '2023-10-07 03:17:25', 'B0:A7:32:DE:9F:6C', 35),
(108, 1, '2023-10-07 03:17:26', 'B0:A7:32:DE:9F:6C', 34),
(109, 1, '2023-10-07 03:17:27', 'B0:A7:32:DC:32:AC', 25),
(110, 1, '2023-10-07 03:17:29', 'B0:A7:32:DC:32:AC', 26),
(111, 1, '2023-10-07 03:17:30', 'B0:A7:32:DC:32:AC', 27),
(112, 1, '2023-10-07 03:17:31', 'B0:A7:32:DE:9F:6C', 32),
(113, 0, '2023-10-07 03:17:32', 'B0:A7:32:DE:9F:6C', 35),
(114, 1, '2023-10-07 03:17:33', 'B0:A7:32:DE:9F:6C', 34),
(115, 1, '2023-10-07 03:17:35', 'B0:A7:32:DC:32:AC', 25),
(116, 1, '2023-10-07 03:17:36', 'B0:A7:32:DC:32:AC', 26),
(117, 1, '2023-10-07 03:17:37', 'B0:A7:32:DC:32:AC', 27),
(118, 1, '2023-10-07 03:17:38', 'B0:A7:32:DE:9F:6C', 32),
(119, 0, '2023-10-07 03:17:39', 'B0:A7:32:DE:9F:6C', 35),
(120, 1, '2023-10-07 03:17:40', 'B0:A7:32:DE:9F:6C', 34),
(121, 1, '2023-10-07 03:17:41', 'B0:A7:32:DC:32:AC', 25),
(122, 1, '2023-10-07 03:17:43', 'B0:A7:32:DC:32:AC', 26),
(123, 1, '2023-10-07 03:17:44', 'B0:A7:32:DC:32:AC', 27),
(124, 1, '2023-10-07 03:17:45', 'B0:A7:32:DE:9F:6C', 32),
(125, 0, '2023-10-07 03:17:46', 'B0:A7:32:DE:9F:6C', 35),
(126, 1, '2023-10-07 03:17:47', 'B0:A7:32:DE:9F:6C', 34),
(127, 1, '2023-10-07 03:17:49', 'B0:A7:32:DC:32:AC', 25),
(128, 1, '2023-10-07 03:17:50', 'B0:A7:32:DC:32:AC', 26),
(129, 1, '2023-10-07 03:17:51', 'B0:A7:32:DC:32:AC', 27),
(130, 1, '2023-10-07 03:17:53', 'B0:A7:32:DE:9F:6C', 32),
(131, 1, '2023-10-07 03:17:56', 'B0:A7:32:DC:32:AC', 25),
(132, 1, '2023-10-07 03:17:57', 'B0:A7:32:DC:32:AC', 26),
(133, 1, '2023-10-07 03:17:58', 'B0:A7:32:DC:32:AC', 27),
(134, 1, '2023-10-07 03:18:03', 'B0:A7:32:DC:32:AC', 25),
(135, 1, '2023-10-07 03:18:04', 'B0:A7:32:DC:32:AC', 26),
(136, 1, '2023-10-07 03:18:05', 'B0:A7:32:DC:32:AC', 27),
(137, 1, '2023-10-07 03:18:09', 'B0:A7:32:DC:32:AC', 25),
(138, 1, '2023-10-07 03:18:10', 'B0:A7:32:DC:32:AC', 26),
(139, 1, '2023-10-07 03:18:12', 'B0:A7:32:DC:32:AC', 27),
(140, 1, '2023-10-07 03:18:16', 'B0:A7:32:DC:32:AC', 25),
(141, 1, '2023-10-07 03:18:17', 'B0:A7:32:DC:32:AC', 26),
(142, 1, '2023-10-07 03:18:19', 'B0:A7:32:DC:32:AC', 27),
(143, 1, '2023-10-07 03:18:23', 'B0:A7:32:DC:32:AC', 25),
(144, 1, '2023-10-07 03:18:25', 'B0:A7:32:DC:32:AC', 26),
(145, 1, '2023-10-07 03:18:26', 'B0:A7:32:DC:32:AC', 27),
(146, 1, '2023-10-07 03:18:30', 'B0:A7:32:DC:32:AC', 25),
(147, 1, '2023-10-07 03:18:31', 'B0:A7:32:DC:32:AC', 26),
(148, 1, '2023-10-07 03:18:33', 'B0:A7:32:DC:32:AC', 27),
(149, 1, '2023-10-07 03:18:37', 'B0:A7:32:DC:32:AC', 25),
(150, 1, '2023-10-07 03:18:38', 'B0:A7:32:DC:32:AC', 26),
(151, 1, '2023-10-07 03:18:39', 'B0:A7:32:DC:32:AC', 27),
(152, 1, '2023-10-07 03:18:44', 'B0:A7:32:DC:32:AC', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regispasillos`
--

CREATE TABLE `regispasillos` (
  `id` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `mac` varchar(20) NOT NULL,
  `pasillos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `regispasillos`
--

INSERT INTO `regispasillos` (`id`, `estado`, `fecha`, `mac`, `pasillos_id`) VALUES
(1, 1, '2023-10-10 08:00:00', 'B0:A7:32:DC:32:AC', 1),
(2, 0, '2023-10-10 08:15:00', 'B0:A7:32:DC:32:AC', 2),
(3, 1, '2023-10-10 08:30:00', 'B0:A7:32:DC:32:AC', 3),
(4, 0, '2023-10-10 08:45:00', 'B0:A7:32:DC:32:AC', 4),
(5, 1, '2023-10-10 09:00:00', 'B0:A7:32:DC:32:AC', 5),
(6, 0, '2023-10-10 09:15:00', 'B0:A7:32:DC:32:AC', 1),
(7, 1, '2023-10-10 09:30:00', 'B0:A7:32:DC:32:AC', 2),
(8, 0, '2023-10-10 09:45:00', 'B0:A7:32:DC:32:AC', 3),
(9, 1, '2023-10-10 10:00:00', 'B0:A7:32:DC:32:AC', 4),
(10, 0, '2023-10-10 10:15:00', 'B0:A7:32:DC:32:AC', 5),
(11, 1, '2023-10-10 10:30:00', 'B0:A7:32:DC:32:AC', 1),
(12, 0, '2023-10-10 10:45:00', 'B0:A7:32:DC:32:AC', 2),
(13, 1, '2023-10-10 11:00:00', 'B0:A7:32:DC:32:AC', 3),
(14, 0, '2023-10-10 11:15:00', 'B0:A7:32:DC:32:AC', 4),
(15, 1, '2023-10-10 11:30:00', 'B0:A7:32:DC:32:AC', 5),
(16, 0, '2023-10-10 11:45:00', 'B0:A7:32:DC:32:AC', 1),
(17, 1, '2023-10-10 12:00:00', 'B0:A7:32:DC:32:AC', 2),
(18, 0, '2023-10-10 12:15:00', 'B0:A7:32:DC:32:AC', 3),
(19, 1, '2023-10-10 12:30:00', 'B0:A7:32:DC:32:AC', 4),
(20, 0, '2023-10-10 12:45:00', 'B0:A7:32:DC:32:AC', 5),
(21, 1, '2023-10-10 13:00:00', 'B0:A7:32:DC:32:AC', 1),
(22, 0, '2023-10-10 13:15:00', 'B0:A7:32:DC:32:AC', 2),
(23, 1, '2023-10-10 13:30:00', 'B0:A7:32:DC:32:AC', 3),
(24, 0, '2023-10-10 13:45:00', 'B0:A7:32:DC:32:AC', 4),
(25, 0, '2023-10-10 14:00:00', 'B0:A7:32:DC:32:AC', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salones`
--

CREATE TABLE `salones` (
  `id` int(11) NOT NULL,
  `nombre_salones` char(5) NOT NULL,
  `bloques_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `salones`
--

INSERT INTO `salones` (`id`, `nombre_salones`, `bloques_id`) VALUES
(25, '303', 1),
(26, '216', 1),
(27, '600', 1),
(32, '202', 1),
(34, '203', 1),
(35, '204', 1);

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
-- Indices de la tabla `pasillos`
--
ALTER TABLE `pasillos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bloques_id` (`bloques_id`);

--
-- Indices de la tabla `regisalones`
--
ALTER TABLE `regisalones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salones_id` (`salones_id`);

--
-- Indices de la tabla `regispasillos`
--
ALTER TABLE `regispasillos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasillos_id` (`pasillos_id`);

--
-- Indices de la tabla `salones`
--
ALTER TABLE `salones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bloques_id` (`bloques_id`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bloques`
--
ALTER TABLE `bloques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pasillos`
--
ALTER TABLE `pasillos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `regisalones`
--
ALTER TABLE `regisalones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1785;

--
-- AUTO_INCREMENT de la tabla `regispasillos`
--
ALTER TABLE `regispasillos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bloques`
--
ALTER TABLE `bloques`
  ADD CONSTRAINT `bloques_ibfk_1` FOREIGN KEY (`sedes_id`) REFERENCES `sedes` (`id`);

--
-- Filtros para la tabla `pasillos`
--
ALTER TABLE `pasillos`
  ADD CONSTRAINT `pasillos_ibfk_1` FOREIGN KEY (`bloques_id`) REFERENCES `bloques` (`id`);

--
-- Filtros para la tabla `regisalones`
--
ALTER TABLE `regisalones`
  ADD CONSTRAINT `regisalones_ibfk_1` FOREIGN KEY (`salones_id`) REFERENCES `salones` (`id`);

--
-- Filtros para la tabla `regispasillos`
--
ALTER TABLE `regispasillos`
  ADD CONSTRAINT `regispasillos_ibfk_1` FOREIGN KEY (`pasillos_id`) REFERENCES `pasillos` (`id`);

--
-- Filtros para la tabla `salones`
--
ALTER TABLE `salones`
  ADD CONSTRAINT `salones_ibfk_1` FOREIGN KEY (`bloques_id`) REFERENCES `bloques` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
