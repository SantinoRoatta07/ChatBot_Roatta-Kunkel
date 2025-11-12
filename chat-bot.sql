-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2025 a las 13:34:11
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `chat-bot`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `medico_id` int(11) DEFAULT NULL,
  `dia_semana` varchar(20) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id`, `medico_id`, `dia_semana`, `hora_inicio`, `hora_fin`) VALUES
(1, 1, 'Lunes', '09:00:00', '12:00:00'),
(2, 1, 'Miércoles', '14:00:00', '18:00:00'),
(3, 2, 'Martes', '10:00:00', '16:00:00'),
(4, 2, 'Jueves', '10:00:00', '16:00:00'),
(5, 3, 'Viernes', '08:00:00', '12:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `especialidad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id`, `nombre`, `especialidad`) VALUES
(1, 'Dra. Ana Pérez', 'Cardiología'),
(2, 'Dr. Luis Gómez', 'Dermatología'),
(3, 'Dr. Carlos Solís', 'Pediatría'),
(10, 'Dra. Marta López', 'Neurología'),
(11, 'Dr. Javier Fernández', 'Traumatología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros_chat`
--

CREATE TABLE `registros_chat` (
  `id` int(11) NOT NULL,
  `pregunta` varchar(255) DEFAULT NULL,
  `respuesta` varchar(255) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registros_chat`
--

INSERT INTO `registros_chat` (`id`, `pregunta`, `respuesta`, `fecha`) VALUES
(1, 'hola', '¡Hola! Soy el asistente de la clínica. Puedes consultar sobre horarios, seguros o especialidades.', '2025-11-12 11:44:47'),
(2, 'seguros', 'Aceptamos los siguientes seguros: Galeno, OSDE, PAMI, Swiss Medical.', '2025-11-12 11:44:55'),
(3, 'Obras Sociales', 'Aceptamos los siguientes seguros: Galeno, OSDE, PAMI, Swiss Medical.', '2025-11-12 11:45:09'),
(4, 'especialidades', 'Ofrecemos las siguientes especialidades: Cardiología, Dermatología, Pediatría.', '2025-11-12 11:45:30'),
(5, 'especialidad', 'Ofrecemos las siguientes especialidades: Cardiología, Dermatología, Pediatría.', '2025-11-12 11:45:46'),
(6, 'horarios', 'Nuestros horarios son: D(a). Dr. Carlos Solís: Viernes de 08:00 a 12:00. D(a). Dr. Luis Gómez: Jueves de 10:00 a 16:00. D(a). Dr. Luis Gómez: Martes de 10:00 a 16:00. D(a). Dra. Ana Pérez: Miércoles de 14:00 a 18:00. D(a). Dra. Ana Pérez: Lunes de 09:00 a', '2025-11-12 11:46:29'),
(7, 'medicos', 'Nuestro equipo de médicos es: Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). ', '2025-11-12 11:46:51'),
(8, 'médicos', 'No entiendo tu pregunta. Puedes consultar sobre horarios, seguros, médicos o especialidades.', '2025-11-12 11:47:20'),
(9, 'médicos', 'No entiendo tu pregunta. Puedes consultar sobre horarios, seguros, médicos o especialidades.', '2025-11-12 11:49:32'),
(10, 'médicos', 'Nuestro equipo de médicos es: Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). ', '2025-11-12 11:50:02'),
(11, 'hola', '¡Hola! Soy el asistente de la clínica. Puedes consultar sobre horarios, seguros o especialidades.', '2025-11-12 11:54:40'),
(12, 'horarios', 'Nuestros horarios son: D(a). Dr. Carlos Solís: Viernes de 08:00 a 12:00. D(a). Dr. Luis Gómez: Jueves de 10:00 a 16:00. D(a). Dr. Luis Gómez: Martes de 10:00 a 16:00. D(a). Dra. Ana Pérez: Miércoles de 14:00 a 18:00. D(a). Dra. Ana Pérez: Lunes de 09:00 a', '2025-11-12 11:54:48'),
(13, 'medicos', 'Nuestro equipo de médicos es: Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). ', '2025-11-12 11:55:23'),
(14, 'hola', '¡Hola! Soy el asistente de la clínica. Puedes consultar sobre horarios, seguros o especialidades.', '2025-11-12 11:58:08'),
(15, 'especialidades', 'Ofrecemos las siguientes especialidades: Cardiología, Dermatología, Pediatría.', '2025-11-12 11:58:16'),
(16, 'doctores', 'Nuestro equipo de médicos es: Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). ', '2025-11-12 11:58:24'),
(17, 'hola', '¡Hola! Soy el asistente de la clínica. Puedes consultar sobre horarios, seguros o especialidades.', '2025-11-12 12:00:59'),
(18, 'doctor', 'Nuestro equipo de médicos es: Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). ', '2025-11-12 12:01:06'),
(19, 'hola', '¡Hola! Soy el asistente de la clínica. Puedes consultar sobre horarios, seguros o especialidades.', '2025-11-12 12:09:20'),
(20, 'doctor', 'Nuestro equipo de médicos es: Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). ', '2025-11-12 12:09:24'),
(21, 'hola', '¡Hola! Soy el asistente de la clínica. Puedes consultar sobre horarios, seguros o especialidades.', '2025-11-12 12:10:12'),
(22, 'horarios', 'Nuestros horarios son: D(a). Dr. Carlos Solís: Viernes de 08:00 a 12:00. D(a). Dr. Luis Gómez: Jueves de 10:00 a 16:00. D(a). Dr. Luis Gómez: Martes de 10:00 a 16:00. D(a). Dra. Ana Pérez: Miércoles de 14:00 a 18:00. D(a). Dra. Ana Pérez: Lunes de 09:00 a', '2025-11-12 12:10:19'),
(23, 'doctor', 'Nuestro equipo de médicos es: Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). ', '2025-11-12 12:10:28'),
(24, 'hola', '¡Hola! Soy el asistente de la clínica. Puedes consultar sobre horarios, seguros o especialidades.', '2025-11-12 12:15:07'),
(25, 'horarios', 'Nuestros horarios son: D(a). Dr. Carlos Solís: Viernes de 08:00 a 12:00. D(a). Dr. Luis Gómez: Jueves de 10:00 a 16:00. D(a). Dr. Luis Gómez: Martes de 10:00 a 16:00. D(a). Dra. Ana Pérez: Miércoles de 14:00 a 18:00. D(a). Dra. Ana Pérez: Lunes de 09:00 a', '2025-11-12 12:15:13'),
(26, 'doctor', 'Nuestro equipo de médicos es: Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). ', '2025-11-12 12:15:18'),
(27, 'hola', '¡Hola! Soy el asistente de la clínica. Puedes consultar sobre horarios, seguros o especialidades.', '2025-11-12 12:16:03'),
(28, 'obras sociales', 'Aceptamos los siguientes seguros: Galeno, OSDE, PAMI, Swiss Medical.', '2025-11-12 12:16:15'),
(29, 'doctor', 'Nuestro equipo de médicos es: Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). ', '2025-11-12 12:16:32'),
(30, 'horarios', 'Nuestros horarios son: D(a). Dr. Carlos Solís: Viernes de 08:00 a 12:00. D(a). Dr. Luis Gómez: Jueves de 10:00 a 16:00. D(a). Dr. Luis Gómez: Martes de 10:00 a 16:00. D(a). Dra. Ana Pérez: Miércoles de 14:00 a 18:00. D(a). Dra. Ana Pérez: Lunes de 09:00 a', '2025-11-12 12:16:42'),
(31, 'hola', '¡Hola! Soy el asistente de la clínica. Puedes consultar sobre horarios, seguros o especialidades.', '2025-11-12 12:20:28'),
(32, 'horarios', 'Nuestros horarios son: D(a). Dr. Carlos Solís: Viernes de 08:00 a 12:00. D(a). Dr. Luis Gómez: Jueves de 10:00 a 16:00. D(a). Dr. Luis Gómez: Martes de 10:00 a 16:00. D(a). Dra. Ana Pérez: Miércoles de 14:00 a 18:00. D(a). Dra. Ana Pérez: Lunes de 09:00 a', '2025-11-12 12:20:32'),
(33, 'medicos', 'Nuestro equipo de médicos es: Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). ', '2025-11-12 12:20:38'),
(34, 'medicos', 'Nuestro equipo de médicos es: Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). ', '2025-11-12 12:24:19'),
(35, 'hola', '¡Hola! Soy el asistente de la clínica. Puedes consultar sobre horarios, seguros o especialidades.', '2025-11-12 12:28:09'),
(36, 'holaaaa', '¡Hola! Soy el asistente de la clínica. Puedes consultar sobre horarios, seguros o especialidades.', '2025-11-12 12:28:16'),
(37, 'medicos', 'Nuestro equipo de médicos es: Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). Dra. Marta López (Neurología). Dr. Javier F', '2025-11-12 12:28:25'),
(38, 'hol', 'No entiendo tu pregunta. Puedes consultar sobre horarios, seguros, médicos o especialidades.', '2025-11-12 12:31:15'),
(39, 'hola', '¡Hola! Soy el asistente de la clínica. Puedes consultar sobre horarios, seguros o especialidades.', '2025-11-12 12:31:20'),
(40, 'doctor', 'Nuestro equipo de médicos es: Dra. Ana Pérez (Cardiología). Dr. Luis Gómez (Dermatología). Dr. Carlos Solís (Pediatría). Dra. Marta López (Neurología). Dr. Javier Fernández (Traumatología). ', '2025-11-12 12:31:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguros`
--

CREATE TABLE `seguros` (
  `id` int(11) NOT NULL,
  `nombre_seguro` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seguros`
--

INSERT INTO `seguros` (`id`, `nombre_seguro`) VALUES
(3, 'Galeno'),
(1, 'OSDE'),
(4, 'PAMI'),
(2, 'Swiss Medical');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medico_id` (`medico_id`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registros_chat`
--
ALTER TABLE `registros_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `seguros`
--
ALTER TABLE `seguros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_seguro` (`nombre_seguro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `registros_chat`
--
ALTER TABLE `registros_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `seguros`
--
ALTER TABLE `seguros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
