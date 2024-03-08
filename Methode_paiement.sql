-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 08 mars 2024 à 19:46
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
-- Structure de la table `Methode_paiement`
--

DROP TABLE IF EXISTS `Methode_paiement`;
CREATE TABLE IF NOT EXISTS `Methode_paiement` (
  `id_m_paie` int NOT NULL AUTO_INCREMENT,
  `nom_m_paie` varchar(20) NOT NULL,
  PRIMARY KEY (`id_m_paie`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Methode_paiement`
--

INSERT INTO `Methode_paiement` (`id_m_paie`, `nom_m_paie`) VALUES
(1, 'Espèces'),
(2, 'Paypal'),
(3, 'Carte de crédit'),
(4, 'Carte de débit'),
(5, 'Virement bancaire'),
(6, 'Chèque'),
(7, 'Prélèvement'),
(8, 'Cryptomonnaie'),
(9, 'Chèque-cadeau'),
(10, 'Avoir'),
(11, 'Autre');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
