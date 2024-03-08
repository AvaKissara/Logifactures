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


INSERT INTO `Cat_facture` (`id_cat_facture`, `nom_cat_facture`) VALUES
(1, 'Achat de biens ou services'),
(7, 'Frais généraux'),
(6, 'Vente de biens ou services'),
(8, 'Loyers et charges'),
(9, 'Salaires et avantages sociaux'),
(10, 'Frais de marketing et publicité'),
(11, 'Frais opérateurs téléphonie'),
(12, 'Taxes et impôts'),
(13, 'Entretien et réparations'),
(14, 'Assurances'),
(15, 'Formation et développement'),
(16, 'Frais financiers'),
(17, 'Investissements et acquisitions'),
(18, 'Frais énergétiques'),
(19, 'Frais de déplacements'),
(20, 'Autre');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
