-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 08 mars 2024 à 19:35
-- Version du serveur : 8.0.27
-- Version de PHP : 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `logifacture`
--

-- --------------------------------------------------------

--

INSERT INTO `Region` (`id_reg`, `nom_reg`, `pays_id`) VALUES
(1, 'Provence-alpes-côte-d\'azur', 'FR'),
(2, 'Guadeloupe', 'FR'),
(3, 'Martinique', 'FR'),
(4, 'Guyane', 'FR'),
(5, 'La Réunion', 'FR'),
(6, 'Mayotte', 'FR'),
(7, 'Île-de-France', 'FR'),
(8, 'Centre-Val de Loire', 'FR'),
(9, 'Bourgogne-Franche-Comté', 'FR'),
(10, 'Normandie', 'FR'),
(11, 'Hauts-de-France', 'FR'),
(12, 'Grand Est', 'FR'),
(13, 'Pays de la Loire', 'FR'),
(14, 'Bretagne', 'FR'),
(15, 'Nouvelle-Aquitaine', 'FR'),
(16, 'Occitanie', 'FR'),
(17, 'Auvergne-Rhône-Alpes', 'FR'),
(18, 'Corse', 'FR');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
