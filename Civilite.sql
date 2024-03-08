-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 08 mars 2024 à 19:45
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
-- Structure de la table `Civilite`
--

DROP TABLE IF EXISTS `Civilite`;
CREATE TABLE IF NOT EXISTS `Civilite` (
  `id_civi` int NOT NULL AUTO_INCREMENT,
  `nom_civi` varchar(14) NOT NULL,
  `abbr_civi` varchar(5) NOT NULL,
  PRIMARY KEY (`id_civi`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Civilite`
--

INSERT INTO `Civilite` (`id_civi`, `nom_civi`, `abbr_civi`) VALUES
(1, 'madame', 'mme'),
(2, 'monsieur', 'm');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
