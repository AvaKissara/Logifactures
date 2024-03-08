-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 08 mars 2024 à 18:21
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
-- Structure de la table `agenda_event`
--

DROP TABLE IF EXISTS `agenda_event`;
CREATE TABLE IF NOT EXISTS `agenda_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_facture` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext,
  `start_datetime` datetime(6) NOT NULL,
  `end_datetime` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `logifacturapp_agendaevent_user_id_412cf78f` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `agenda_event`
--

INSERT INTO `agenda_event` (`id`, `num_facture`, `title`, `description`, `start_datetime`, `end_datetime`, `created_at`, `updated_at`, `user_id`) VALUES
(2, 'Test - 221134A', 'Relance', 'Relance - Test - 221134A', '2024-02-28 08:00:00.000000', '2024-02-28 11:00:00.000000', '2024-02-26 20:15:57.780598', '2024-03-01 09:47:48.571033', 1),
(55, NULL, 'Rdv test 26', '', '2024-03-05 08:00:00.000000', '2024-03-05 10:18:00.000000', '2024-03-05 11:43:23.993721', '2024-03-05 16:21:28.289736', 1),
(27, NULL, 'Rdv test', '', '2024-02-04 10:00:00.000000', '2024-02-04 12:00:00.000000', '2024-03-03 16:27:45.085579', '2024-03-03 16:27:45.085579', 1),
(4, 'Test - 221134A', 'Relance', 'test', '2024-03-01 10:00:00.000000', '2024-03-01 12:00:00.000000', '2024-02-26 22:52:47.584152', '2024-03-04 20:35:44.393188', 1),
(7, NULL, 'test4', 'ghghgh', '2024-03-02 08:00:00.000000', '2024-03-02 10:00:00.000000', '2024-03-01 12:30:43.334778', '2024-03-01 12:30:43.334778', 1),
(65, NULL, 'testH', '', '2024-01-15 08:00:00.000000', '2024-01-15 10:00:00.000000', '2024-03-05 12:25:18.331165', '2024-03-05 12:25:40.589353', 1),
(9, NULL, 'Rdv test 2', 'hdfh', '2024-03-04 09:00:00.000000', '2024-03-04 11:00:00.000000', '2024-03-01 12:36:33.690722', '2024-03-01 12:36:33.690722', 1),
(69, NULL, 'test', 'upoujpô', '2024-03-04 10:00:00.000000', '2024-03-04 12:00:00.000000', '2024-03-05 15:50:06.175142', '2024-03-06 02:06:10.031159', 1),
(70, 'freee1', 'Echéance', 'La facture freee1 doit être acquittée ce jour.', '2024-03-18 08:00:00.000000', '2024-03-18 09:00:00.000000', '2024-03-06 17:27:01.627140', '2024-03-06 17:27:01.627140', 1),
(24, NULL, 'Rdv YY', '', '2024-03-26 09:00:00.000000', '2024-03-26 11:00:00.000000', '2024-03-03 16:03:37.045909', '2024-03-05 01:33:39.743573', 1),
(26, NULL, 'Rdv test 2', '', '2024-03-03 08:00:00.000000', '2024-03-03 10:00:00.000000', '2024-03-03 16:09:11.438660', '2024-03-03 16:09:11.438660', 1),
(33, NULL, 'Rdv test 26', '', '2024-03-06 12:00:00.000000', '2024-03-06 14:00:00.000000', '2024-03-05 04:02:07.474837', '2024-03-05 04:02:07.474837', 1),
(58, NULL, 'test', '', '2024-02-13 10:00:00.000000', '2024-02-13 14:00:00.000000', '2024-03-05 12:00:31.713103', '2024-03-05 12:00:31.713103', 1),
(62, NULL, 'cvcv', '', '2024-02-06 10:00:00.000000', '2024-02-06 12:00:00.000000', '2024-03-05 12:03:32.960225', '2024-03-05 12:03:32.960225', 1),
(18, 'DDD 3206', 'Echéance', 'La facture Facture test agenda doit être acquittée ce jour.', '2024-03-18 08:00:00.000000', '2024-03-18 09:00:00.000000', '2024-03-01 14:19:07.282874', '2024-03-05 03:56:39.141756', 1),
(19, NULL, 'Rdv test 21', 'dfgg', '2024-03-01 13:00:00.000000', '2024-03-01 15:00:00.000000', '2024-03-01 16:36:28.731898', '2024-03-05 01:30:48.562164', 1),
(50, NULL, 'Rdv test 23', '', '2024-03-14 08:00:00.000000', '2024-03-14 10:00:00.000000', '2024-03-05 11:12:22.234276', '2024-03-05 11:12:22.234276', 1),
(32, NULL, 'Rdv 63', '', '2024-02-05 08:00:00.000000', '2024-02-05 10:00:00.000000', '2024-03-05 01:23:09.322241', '2024-03-05 01:29:58.278977', 1),
(66, NULL, 'Rdv test', '', '2024-01-15 14:00:00.000000', '2024-01-15 16:00:00.000000', '2024-03-05 12:25:28.001095', '2024-03-05 12:25:34.686744', 1),
(71, 'freee111', 'Echéance', 'La facture freee111 doit être acquittée ce jour.', '2024-03-18 08:00:00.000000', '2024-03-18 09:00:00.000000', '2024-03-06 20:24:45.617115', '2024-03-06 20:24:45.617115', 1),
(56, NULL, 'testS', '', '2024-03-05 14:17:00.000000', '2024-03-05 16:17:00.000000', '2024-03-05 11:43:35.621795', '2024-03-05 16:17:57.344294', 1),
(61, NULL, 'vvv', '', '2024-02-06 08:00:00.000000', '2024-02-06 09:00:00.000000', '2024-03-05 12:03:25.415907', '2024-03-05 12:03:25.415907', 1),
(60, NULL, 'Rdv test 2', '', '2024-02-13 08:00:00.000000', '2024-02-13 09:00:00.000000', '2024-03-05 12:00:39.427602', '2024-03-05 12:00:39.427602', 1),
(63, NULL, 'test', '', '2024-02-16 08:00:00.000000', '2024-02-16 09:00:00.000000', '2024-03-05 12:03:46.926310', '2024-03-05 12:03:46.926310', 1),
(72, 'mmmlee111', 'Echéance', 'La facture mmmlee111 doit être acquittée ce jour.', '2024-03-28 08:00:00.000000', '2024-03-28 09:00:00.000000', '2024-03-06 20:29:46.035768', '2024-03-06 20:29:46.035768', 1),
(73, 'uulee111', 'Echéance', 'La facture uulee111 doit être acquittée ce jour.', '2024-03-28 08:00:00.000000', '2024-03-28 09:00:00.000000', '2024-03-06 21:52:39.791118', '2024-03-06 21:52:39.791118', 1),
(74, 'SZQ111', 'Echéance', 'La facture SZQ111 doit être acquittée ce jour.', '2024-04-28 08:00:00.000000', '2024-04-28 09:00:00.000000', '2024-03-06 22:46:47.276110', '2024-03-06 22:46:47.276110', 1),
(75, 'SZQ11ff', 'Echéance', 'La facture SZQ11ff doit être acquittée ce jour.', '2024-04-28 08:00:00.000000', '2024-04-28 09:00:00.000000', '2024-03-06 22:48:00.548884', '2024-03-06 22:48:00.548884', 1),
(76, 'SDS11ff', 'Echéance', 'La facture SDS11ff doit être acquittée ce jour.', '2024-04-28 08:00:00.000000', '2024-04-28 09:00:00.000000', '2024-03-07 01:09:02.974687', '2024-03-07 01:09:02.974687', 1),
(77, 'HGFS11ff', 'Echéance', 'La facture HGFS11ff doit être acquittée ce jour.', '2024-04-28 08:00:00.000000', '2024-04-28 09:00:00.000000', '2024-03-07 01:12:54.677116', '2024-03-07 01:12:54.678103', 1),
(78, 'DDDGFS11ff', 'Echéance', 'La facture DDDGFS11ff doit être acquittée ce jour.', '2024-04-28 08:00:00.000000', '2024-04-28 09:00:00.000000', '2024-03-07 11:23:07.072001', '2024-03-07 11:23:07.072001', 1);

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add civilite', 1, 'add_civilite'),
(2, 'Can change civilite', 1, 'change_civilite'),
(3, 'Can delete civilite', 1, 'delete_civilite'),
(4, 'Can view civilite', 1, 'view_civilite'),
(5, 'Can add devise', 2, 'add_devise'),
(6, 'Can change devise', 2, 'change_devise'),
(7, 'Can delete devise', 2, 'delete_devise'),
(8, 'Can view devise', 2, 'view_devise'),
(9, 'Can add pays', 3, 'add_pays'),
(10, 'Can change pays', 3, 'change_pays'),
(11, 'Can delete pays', 3, 'delete_pays'),
(12, 'Can view pays', 3, 'view_pays'),
(13, 'Can add region', 4, 'add_region'),
(14, 'Can change region', 4, 'change_region'),
(15, 'Can delete region', 4, 'delete_region'),
(16, 'Can view region', 4, 'view_region'),
(17, 'Can add ville', 5, 'add_ville'),
(18, 'Can change ville', 5, 'change_ville'),
(19, 'Can delete ville', 5, 'delete_ville'),
(20, 'Can view ville', 5, 'view_ville'),
(21, 'Can add client', 6, 'add_client'),
(22, 'Can change client', 6, 'change_client'),
(23, 'Can delete client', 6, 'delete_client'),
(24, 'Can view client', 6, 'view_client'),
(25, 'Can add fournisseur', 7, 'add_fournisseur'),
(26, 'Can change fournisseur', 7, 'change_fournisseur'),
(27, 'Can delete fournisseur', 7, 'delete_fournisseur'),
(28, 'Can view fournisseur', 7, 'view_fournisseur'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add cat_facture', 9, 'add_cat_facture'),
(34, 'Can change cat_facture', 9, 'change_cat_facture'),
(35, 'Can delete cat_facture', 9, 'delete_cat_facture'),
(36, 'Can view cat_facture', 9, 'view_cat_facture'),
(37, 'Can add cp', 10, 'add_cp'),
(38, 'Can change cp', 10, 'change_cp'),
(39, 'Can delete cp', 10, 'delete_cp'),
(40, 'Can view cp', 10, 'view_cp'),
(41, 'Can add methode_paiement', 11, 'add_methode_paiement'),
(42, 'Can change methode_paiement', 11, 'change_methode_paiement'),
(43, 'Can delete methode_paiement', 11, 'delete_methode_paiement'),
(44, 'Can view methode_paiement', 11, 'view_methode_paiement'),
(45, 'Can add facture', 12, 'add_facture'),
(46, 'Can change facture', 12, 'change_facture'),
(47, 'Can delete facture', 12, 'delete_facture'),
(48, 'Can view facture', 12, 'view_facture'),
(49, 'Can add log entry', 13, 'add_logentry'),
(50, 'Can change log entry', 13, 'change_logentry'),
(51, 'Can delete log entry', 13, 'delete_logentry'),
(52, 'Can view log entry', 13, 'view_logentry'),
(53, 'Can add permission', 14, 'add_permission'),
(54, 'Can change permission', 14, 'change_permission'),
(55, 'Can delete permission', 14, 'delete_permission'),
(56, 'Can view permission', 14, 'view_permission'),
(57, 'Can add group', 15, 'add_group'),
(58, 'Can change group', 15, 'change_group'),
(59, 'Can delete group', 15, 'delete_group'),
(60, 'Can view group', 15, 'view_group'),
(61, 'Can add user', 16, 'add_user'),
(62, 'Can change user', 16, 'change_user'),
(63, 'Can delete user', 16, 'delete_user'),
(64, 'Can view user', 16, 'view_user'),
(65, 'Can add content type', 17, 'add_contenttype'),
(66, 'Can change content type', 17, 'change_contenttype'),
(67, 'Can delete content type', 17, 'delete_contenttype'),
(68, 'Can view content type', 17, 'view_contenttype'),
(69, 'Can add session', 18, 'add_session'),
(70, 'Can change session', 18, 'change_session'),
(71, 'Can delete session', 18, 'delete_session'),
(72, 'Can view session', 18, 'view_session'),
(73, 'Can add agenda event', 19, 'add_agendaevent'),
(74, 'Can change agenda event', 19, 'change_agendaevent'),
(75, 'Can delete agenda event', 19, 'delete_agendaevent'),
(76, 'Can view agenda event', 19, 'view_agendaevent'),
(77, 'Can add calendar', 20, 'add_calendar'),
(78, 'Can change calendar', 20, 'change_calendar'),
(79, 'Can delete calendar', 20, 'delete_calendar'),
(80, 'Can view calendar', 20, 'view_calendar'),
(81, 'Can add calendar relation', 21, 'add_calendarrelation'),
(82, 'Can change calendar relation', 21, 'change_calendarrelation'),
(83, 'Can delete calendar relation', 21, 'delete_calendarrelation'),
(84, 'Can view calendar relation', 21, 'view_calendarrelation'),
(85, 'Can add event', 22, 'add_event'),
(86, 'Can change event', 22, 'change_event'),
(87, 'Can delete event', 22, 'delete_event'),
(88, 'Can view event', 22, 'view_event'),
(89, 'Can add event relation', 23, 'add_eventrelation'),
(90, 'Can change event relation', 23, 'change_eventrelation'),
(91, 'Can delete event relation', 23, 'delete_eventrelation'),
(92, 'Can view event relation', 23, 'view_eventrelation'),
(93, 'Can add occurrence', 24, 'add_occurrence'),
(94, 'Can change occurrence', 24, 'change_occurrence'),
(95, 'Can delete occurrence', 24, 'delete_occurrence'),
(96, 'Can view occurrence', 24, 'view_occurrence'),
(97, 'Can add rule', 25, 'add_rule'),
(98, 'Can change rule', 25, 'change_rule'),
(99, 'Can delete rule', 25, 'delete_rule'),
(100, 'Can view rule', 25, 'view_rule');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$L9OfSLjrrtrmsCz9Bvr0Ob$q0NzEsSPogbNSVFOCx7xak7Tes6Z6lzycAS94fugZsg=', '2024-03-07 11:34:46.044404', 1, 'kissara', '', '', 'avakissara@mail.com', 1, 1, '2024-02-11 16:16:47.276797'),
(2, 'pbkdf2_sha256$720000$IcWvYhBPnpofaajnHp8yHm$Lry+tRtx2l9S2DHmnEaALYKPwgbOzBujcbOv1Rh2u7I=', '2024-02-25 14:13:12.443293', 0, 'syntenera', '', '', 'lilabadi06@gmail.com', 0, 1, '2024-02-20 12:24:04.000000'),
(3, 'pbkdf2_sha256$720000$Rtl9p6JMM5fg4mYlQXT9N8$+xg/3pCYCJLTJ0RrfDFuT52Qq0sDLHlirMZ4r35VEkU=', '2024-02-20 16:16:23.603856', 0, 'patatedouce', '', '', 'pd@gmail.com', 0, 1, '2024-02-20 16:16:22.988066');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cat_facture`
--

DROP TABLE IF EXISTS `cat_facture`;
CREATE TABLE IF NOT EXISTS `cat_facture` (
  `id_cat_facture` int NOT NULL AUTO_INCREMENT,
  `nom_cat_facture` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cat_facture`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cat_facture`
--

INSERT INTO `cat_facture` (`id_cat_facture`, `nom_cat_facture`) VALUES
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

-- --------------------------------------------------------

--
-- Structure de la table `civilite`
--

DROP TABLE IF EXISTS `civilite`;
CREATE TABLE IF NOT EXISTS `civilite` (
  `id_civi` int NOT NULL AUTO_INCREMENT,
  `nom_civi` varchar(14) NOT NULL,
  `abbr_civi` varchar(5) NOT NULL,
  PRIMARY KEY (`id_civi`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `civilite`
--

INSERT INTO `civilite` (`id_civi`, `nom_civi`, `abbr_civi`) VALUES
(1, 'madame', 'mme'),
(2, 'monsieur', 'm');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `r_social_client` varchar(100) DEFAULT NULL,
  `siret_client` varchar(14) DEFAULT NULL,
  `nom_client` varchar(40) NOT NULL,
  `prenom_client` varchar(40) NOT NULL,
  `adr_client` varchar(100) NOT NULL,
  `adr2_client` varchar(100) DEFAULT NULL,
  `tel_client` int DEFAULT NULL,
  `mail_client` varchar(180) DEFAULT NULL,
  `civilite_id` int NOT NULL,
  `ville_id` int NOT NULL,
  `cree_le` datetime(6) NOT NULL,
  `modifie_le` datetime(6) NOT NULL,
  PRIMARY KEY (`id_client`),
  KEY `Client_siret_client_b854bf92` (`siret_client`),
  KEY `Client_civilite_id_3da0032f` (`civilite_id`),
  KEY `Client_ville_id_a92145cb` (`ville_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `r_social_client`, `siret_client`, `nom_client`, `prenom_client`, `adr_client`, `adr2_client`, `tel_client`, `mail_client`, `civilite_id`, `ville_id`, `cree_le`, `modifie_le`) VALUES
(1, 'decadence', '12345', 'badi', 'lila', '1 rue albert marmotte', 'none', 12345, 'T@gam.com', 1, 1, '2024-03-06 16:26:43.845492', '2024-03-06 16:26:43.892477'),
(2, 'pickachup\'', '98765', 'pika', 'chu', '1 rue fatal foudre', 'none', 999999, 'pc@mail.com', 2, 1, '2024-03-06 16:26:43.845492', '2024-03-06 16:26:43.892477'),
(3, NULL, NULL, 'tonton', 'david', '8 rue du dikens', 'none', 333111111, NULL, 2, 1, '2024-03-06 16:26:43.845492', '2024-03-06 22:28:55.888686'),
(4, NULL, NULL, 'hulk', 'hoggan', '37 av tournesol fané', 'none', 666666, NULL, 2, 1, '2024-03-06 16:26:43.845492', '2024-03-06 16:26:43.892477'),
(5, 'test', '9865430927', 'toto', 'lato', '3 av cercle vicieux', 'none', 675423, 'hj@mail.com', 2, 1, '2024-03-06 16:26:43.845492', '2024-03-06 16:26:43.892477'),
(6, 'revolution', '88888888', 'robespierre', 'maximilien', '158 bd tartiflette', 'none', 2147483647, 'rb@gmail.com', 2, 1, '2024-03-06 16:26:43.845492', '2024-03-06 16:26:43.892477'),
(7, NULL, NULL, 'client', 'test', '158 bd tartiflette', 'none', 493114412, NULL, 2, 1, '2024-03-06 16:26:43.845492', '2024-03-06 16:26:43.892477'),
(8, 'Tex Avery', '99876543092', 'avery', 'tex', '158 bd bernard lhermite', 'none', 2147483647, 'llj@mail.com', 2, 1, '2024-03-06 16:26:43.845492', '2024-03-06 16:26:43.892477'),
(9, NULL, NULL, 'chaplin', 'charlie', '1 rue du miel', 'none', 493114412, NULL, 2, 236, '2024-03-06 16:26:43.845492', '2024-03-06 16:26:43.892477'),
(10, NULL, NULL, 'douis', 'jonathan', '1 rue du divin', 'none', 69114412, NULL, 2, 236, '2024-03-06 16:26:43.845492', '2024-03-06 16:26:43.892477'),
(11, NULL, NULL, 'douis', 'jonathan', '5 rue du divins', 'none', 69114412, NULL, 2, 1, '2024-03-06 17:27:01.622141', '2024-03-06 17:27:01.622141'),
(12, NULL, NULL, 'tonton', 'david', '8 rue dela ffff', 'cedex8', 69114412, NULL, 2, 236, '2024-03-06 22:46:47.263114', '2024-03-06 22:48:17.269464'),
(13, NULL, NULL, 'tura', 'matteo', '18 rue dela mif', 'cedex3', 691141111, NULL, 2, 236, '2024-03-07 01:09:02.963698', '2024-03-07 01:11:06.590608'),
(14, NULL, NULL, 'tura', 'matteo', '18 rue dela mif', 'cedex3', 691141111, NULL, 2, 1, '2024-03-07 01:12:54.674117', '2024-03-07 01:12:54.674117'),
(15, NULL, NULL, 'tura', 'matteo', '18 rue dela mif', 'cedex3', 691141111, NULL, 2, 2, '2024-03-07 11:24:00.995561', '2024-03-07 11:24:00.995561');

-- --------------------------------------------------------

--
-- Structure de la table `cp`
--

DROP TABLE IF EXISTS `cp`;
CREATE TABLE IF NOT EXISTS `cp` (
  `cp` varchar(9) NOT NULL,
  `ville_id` int NOT NULL,
  PRIMARY KEY (`cp`),
  KEY `Cp_ville_id_e341f523` (`ville_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cp`
--

INSERT INTO `cp` (`cp`, `ville_id`) VALUES
('06000', 1),
('06100', 1),
('13000', 2);

-- --------------------------------------------------------

--
-- Structure de la table `devise`
--

DROP TABLE IF EXISTS `devise`;
CREATE TABLE IF NOT EXISTS `devise` (
  `id_devise` int NOT NULL AUTO_INCREMENT,
  `nom_devise` varchar(40) NOT NULL,
  `abbr_devise` varchar(6) NOT NULL,
  `symb_devise` varchar(1) NOT NULL,
  PRIMARY KEY (`id_devise`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `devise`
--

INSERT INTO `devise` (`id_devise`, `nom_devise`, `abbr_devise`, `symb_devise`) VALUES
(1, 'euro', 'eur', '€'),
(2, 'dollar américain', 'usd', '$'),
(3, 'livre sterling', 'gpb', '£');

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-02-11 16:17:27.603141', '1', 'achat de bien', 1, '[{\"added\": {}}]', 9, 1),
(2, '2024-02-11 16:17:34.826485', '1', 'madame', 1, '[{\"added\": {}}]', 1, 1),
(3, '2024-02-11 16:17:50.728388', 'fr', 'france', 1, '[{\"added\": {}}]', 3, 1),
(4, '2024-02-11 16:18:03.232579', '1', 'provence alpes côte d\'azur', 1, '[{\"added\": {}}]', 4, 1),
(5, '2024-02-11 16:18:10.094168', '1', 'nice', 1, '[{\"added\": {}}]', 5, 1),
(6, '2024-02-11 16:18:17.907436', '06000', '06000', 1, '[{\"added\": {}}]', 10, 1),
(7, '2024-02-11 16:18:30.181545', '1', 'euro', 1, '[{\"added\": {}}]', 2, 1),
(8, '2024-02-11 16:18:46.128458', '1', 'espèce', 1, '[{\"added\": {}}]', 11, 1),
(9, '2024-02-11 16:19:23.350696', '1', 'LIla Badi', 1, '[{\"added\": {}}]', 8, 1),
(10, '2024-02-11 16:20:38.261039', '1', 'Lila Badi', 1, '[{\"added\": {}}]', 6, 1),
(11, '2024-02-11 16:21:14.205969', '1', 'Lila Badi', 1, '[{\"added\": {}}]', 7, 1),
(12, '2024-02-11 16:49:07.711292', '1', 'Lila Badi', 2, '[{\"changed\": {\"fields\": [\"Nom user\"]}}]', 8, 1),
(13, '2024-02-11 16:49:15.450857', '1', '1', 2, '[]', 12, 1),
(14, '2024-02-11 19:30:04.523554', '3', '1', 3, '', 12, 1),
(15, '2024-02-11 19:30:04.524053', '2', '1', 3, '', 12, 1),
(16, '2024-02-11 19:30:04.524552', '1', '1', 3, '', 12, 1),
(17, '2024-02-17 10:21:14.906621', '2', 'monsieur', 1, '[{\"added\": {}}]', 1, 1),
(18, '2024-02-17 10:22:51.322965', '2', 'pika chu', 1, '[{\"added\": {}}]', 6, 1),
(19, '2024-02-17 10:36:12.662346', '6', 'vente biens', 1, '[{\"added\": {}}]', 9, 1),
(20, '2024-02-17 10:36:21.470053', '6', 'vente de  biens', 2, '[{\"changed\": {\"fields\": [\"Nom cat facture\"]}}]', 9, 1),
(21, '2024-02-17 10:36:25.343411', '1', 'achat de biens', 2, '[{\"changed\": {\"fields\": [\"Nom cat facture\"]}}]', 9, 1),
(22, '2024-02-17 14:03:08.453931', '2', 'Paypal', 1, '[{\"added\": {}}]', 11, 1),
(23, '2024-02-17 14:03:13.742123', '2', 'paypal', 2, '[{\"changed\": {\"fields\": [\"Nom m paie\"]}}]', 11, 1),
(24, '2024-02-17 15:18:08.998100', '1', 'provence-alpes-côte-d\'azur', 2, '[{\"changed\": {\"fields\": [\"Nom reg\"]}}]', 4, 1),
(25, '2024-02-17 16:27:12.917552', '1', 'badi lila', 2, '[{\"changed\": {\"fields\": [\"Nom client\", \"Prenom client\"]}}]', 6, 1),
(26, '2024-02-17 22:36:18.623895', '2', 'dollar américain', 1, '[{\"added\": {}}]', 2, 1),
(27, '2024-02-19 21:06:01.980633', '2', 'tata yoyo', 2, '[{\"changed\": {\"fields\": [\"Civilite\", \"Nom fourn\", \"Prenom fourn\", \"Mail fourn\"]}}]', 7, 1),
(28, '2024-02-19 21:17:02.762406', '2', 'tata yoyo', 3, '', 7, 1),
(29, '2024-02-19 21:40:15.484731', '2', 'monsieur', 2, '[{\"changed\": {\"fields\": [\"Abbr civi\"]}}]', 1, 1),
(30, '2024-02-19 23:09:48.333446', '45', 'Facture Test - 22H30 - 2022-02-19', 3, '', 12, 1),
(31, '2024-02-19 23:09:48.334446', '44', 'Facture Test - 22H30 - 2022-02-19', 3, '', 12, 1),
(32, '2024-02-19 23:09:48.334446', '41', 'Facture 123 - 2022-02-19', 3, '', 12, 1),
(33, '2024-02-19 23:09:48.335445', '39', 'Facture 123 - 2022-02-19', 3, '', 12, 1),
(34, '2024-02-19 23:09:48.335445', '38', 'Facture 123 - 2022-02-19', 3, '', 12, 1),
(35, '2024-02-19 23:09:48.336445', '13', 'Facture 1.0 - 2022-02-09', 3, '', 12, 1),
(36, '2024-02-19 23:09:48.336445', '11', 'Facture 1.0 - 2022-02-09', 3, '', 12, 1),
(37, '2024-02-19 23:09:48.337445', '5', 'Facture 1.0 - 2022-02-09', 3, '', 12, 1),
(38, '2024-02-20 00:41:24.576921', '6', 'Vente de biens', 2, '[{\"changed\": {\"fields\": [\"Nom cat facture\"]}}]', 9, 1),
(39, '2024-02-20 00:41:31.021432', '1', 'Achat de biens', 2, '[{\"changed\": {\"fields\": [\"Nom cat facture\"]}}]', 9, 1),
(40, '2024-02-20 00:43:30.075657', '1', 'roublard décadent', 2, '[{\"changed\": {\"fields\": [\"Adr fourn\"]}}]', 7, 1),
(41, '2024-02-20 12:25:40.126919', '2', 'syntenera', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 16, 1),
(42, '2024-02-20 16:33:07.621439', '5', 'toto georges', 2, '[{\"changed\": {\"fields\": [\"R social client\", \"Siret client\", \"Nom client\", \"Prenom client\", \"Adr client\", \"Tel client\", \"Mail client\"]}}]', 6, 1),
(43, '2024-02-20 16:34:16.952092', '5', 'toto georges', 2, '[{\"changed\": {\"fields\": [\"Adr client\"]}}]', 6, 1),
(44, '2024-02-20 18:34:26.101454', '5', 'toto lato', 2, '[{\"changed\": {\"fields\": [\"Prenom client\"]}}]', 6, 1),
(45, '2024-02-20 22:14:23.758759', '06100', '06100', 1, '[{\"added\": {}}]', 10, 1),
(46, '2024-02-20 22:14:40.544383', '2', 'marseille', 1, '[{\"added\": {}}]', 5, 1),
(47, '2024-02-20 22:14:55.232685', '13000', '13000', 1, '[{\"added\": {}}]', 10, 1),
(48, '2024-02-20 22:15:22.028684', '3', 'livre sterling', 1, '[{\"added\": {}}]', 2, 1),
(49, '2024-02-24 10:22:12.469108', '6', 'robespierre maximilien', 2, '[{\"changed\": {\"fields\": [\"R social client\", \"Siret client\", \"Nom client\", \"Prenom client\", \"Mail client\"]}}]', 6, 1),
(50, '2024-02-24 14:23:45.656817', '55', 'Facture test case - espace - 2023-03-07', 2, '[{\"changed\": {\"fields\": [\"Date facture\"]}}]', 12, 1),
(51, '2024-02-24 14:24:31.407417', '55', 'Facture test case - espace - 2024-03-19', 2, '[{\"changed\": {\"fields\": [\"Date facture\"]}}]', 12, 1),
(52, '2024-02-25 19:30:30.931703', 'ita', 'italie', 1, '[{\"added\": {}}]', 3, 1),
(53, '2024-02-25 19:45:43.332772', 'IT', 'italie', 2, '[{\"changed\": {\"fields\": [\"Id pays\"]}}]', 3, 1),
(54, '2024-02-25 19:45:55.068968', 'ita', 'italie', 3, '', 3, 1),
(55, '2024-02-25 19:46:05.333922', 'FR', 'france', 2, '[{\"changed\": {\"fields\": [\"Id pays\"]}}]', 3, 1),
(56, '2024-02-25 19:54:35.166463', 'IT', 'Italie', 2, '[{\"changed\": {\"fields\": [\"Nom pays\"]}}]', 3, 1),
(57, '2024-02-25 19:54:40.993667', 'fr', 'France', 2, '[{\"changed\": {\"fields\": [\"Nom pays\"]}}]', 3, 1),
(58, '2024-02-25 21:32:16.259775', '8', 'avery tex', 2, '[{\"changed\": {\"fields\": [\"R social client\", \"Siret client\", \"Nom client\", \"Prenom client\", \"Adr client\", \"Mail client\"]}}]', 6, 1),
(59, '2024-02-25 21:47:36.429318', '6', 'Vente de biens ou services', 2, '[{\"changed\": {\"fields\": [\"Nom cat facture\"]}}]', 9, 1),
(60, '2024-02-25 21:47:43.821124', '1', 'Achat de biens ou services', 2, '[{\"changed\": {\"fields\": [\"Nom cat facture\"]}}]', 9, 1),
(61, '2024-02-25 21:49:37.560270', '6', 'Vente de biens / services', 2, '[{\"changed\": {\"fields\": [\"Nom cat facture\"]}}]', 9, 1),
(62, '2024-02-25 21:49:44.307233', '1', 'Achat de biens / services', 2, '[{\"changed\": {\"fields\": [\"Nom cat facture\"]}}]', 9, 1),
(63, '2024-02-25 21:50:18.880877', '7', 'Frais généraux', 1, '[{\"added\": {}}]', 9, 1),
(64, '2024-02-25 21:50:32.844371', '8', 'Loyers et charges', 1, '[{\"added\": {}}]', 9, 1),
(65, '2024-02-25 21:51:56.464840', '6', 'Vente de biens ou services', 2, '[{\"changed\": {\"fields\": [\"Nom cat facture\"]}}]', 9, 1),
(66, '2024-02-25 21:52:08.992995', '1', 'Achat de biens ou services', 2, '[{\"changed\": {\"fields\": [\"Nom cat facture\"]}}]', 9, 1),
(67, '2024-02-25 21:54:34.451565', '2', 'Paypal', 2, '[{\"changed\": {\"fields\": [\"Nom m paie\"]}}]', 11, 1),
(68, '2024-02-25 21:54:39.536630', '1', 'Espèce', 2, '[{\"changed\": {\"fields\": [\"Nom m paie\"]}}]', 11, 1),
(69, '2024-02-25 21:55:40.497558', '9', 'Salaires et avantages sociaux', 1, '[{\"added\": {}}]', 9, 1),
(70, '2024-02-25 21:55:52.236462', '10', 'Frais de marketing et publicité', 1, '[{\"added\": {}}]', 9, 1),
(71, '2024-02-25 21:56:58.255873', '11', 'Frais opérateurs téléphonie', 1, '[{\"added\": {}}]', 9, 1),
(72, '2024-02-25 21:57:14.615100', '12', 'Taxes et impôts', 1, '[{\"added\": {}}]', 9, 1),
(73, '2024-02-25 21:57:23.803223', '13', 'Entretien et réparations', 1, '[{\"added\": {}}]', 9, 1),
(74, '2024-02-25 21:57:31.504106', '14', 'Assurances', 1, '[{\"added\": {}}]', 9, 1),
(75, '2024-02-25 21:57:41.289535', '15', 'Formation et développement', 1, '[{\"added\": {}}]', 9, 1),
(76, '2024-02-25 21:57:51.859678', '16', 'Frais financiers', 1, '[{\"added\": {}}]', 9, 1),
(77, '2024-02-25 21:58:01.128468', '17', 'Investissements et acquisitions', 1, '[{\"added\": {}}]', 9, 1),
(78, '2024-02-25 21:58:27.221048', '18', 'Autres', 1, '[{\"added\": {}}]', 9, 1),
(79, '2024-02-25 21:59:51.775208', '18', 'Frais énergétique', 2, '[{\"changed\": {\"fields\": [\"Nom cat facture\"]}}]', 9, 1),
(80, '2024-02-25 22:00:14.586064', '19', 'Frais de déplacement', 1, '[{\"added\": {}}]', 9, 1),
(81, '2024-02-25 22:00:27.254227', '18', 'Frais énergétiques', 2, '[{\"changed\": {\"fields\": [\"Nom cat facture\"]}}]', 9, 1),
(82, '2024-02-25 22:00:30.627088', '19', 'Frais de déplacements', 2, '[{\"changed\": {\"fields\": [\"Nom cat facture\"]}}]', 9, 1),
(83, '2024-02-25 22:01:19.128104', '20', 'Autre', 1, '[{\"added\": {}}]', 9, 1),
(84, '2024-02-25 22:02:31.751654', '3', 'Carte de crédit', 1, '[{\"added\": {}}]', 11, 1),
(85, '2024-02-25 22:02:50.310998', '4', 'Carte de débit', 1, '[{\"added\": {}}]', 11, 1),
(86, '2024-02-25 22:02:58.475732', '5', 'Virement bancaire', 1, '[{\"added\": {}}]', 11, 1),
(87, '2024-02-25 22:03:07.121351', '6', 'Chèque', 1, '[{\"added\": {}}]', 11, 1),
(88, '2024-02-25 22:03:12.391628', '1', 'Espèces', 2, '[{\"changed\": {\"fields\": [\"Nom m paie\"]}}]', 11, 1),
(89, '2024-02-25 22:03:34.809097', '7', 'Prélèvement', 1, '[{\"added\": {}}]', 11, 1),
(90, '2024-02-25 22:03:54.822201', '8', 'Cryptomonnaie', 1, '[{\"added\": {}}]', 11, 1),
(91, '2024-02-25 22:04:08.525460', '9', 'Chèque-cadeau', 1, '[{\"added\": {}}]', 11, 1),
(92, '2024-02-25 22:04:19.686279', '10', 'Avoir', 1, '[{\"added\": {}}]', 11, 1),
(93, '2024-02-25 22:05:52.857921', '11', 'Autre', 1, '[{\"added\": {}}]', 11, 1),
(94, '2024-02-26 12:12:26.713702', '1', 'Relance', 1, '[{\"added\": {}}]', 19, 1),
(95, '2024-02-26 12:56:57.899289', '1', 'Relance', 3, '', 19, 1),
(96, '2024-02-26 20:15:57.781598', '2', 'RELANCE - Test - 221134A', 1, '[{\"added\": {}}]', 19, 1),
(97, '2024-02-26 20:27:24.816618', '2', 'RELANCE - Test - 221134A', 2, '[{\"changed\": {\"fields\": [\"End datetime\"]}}]', 19, 1),
(98, '2024-02-26 20:53:41.018748', '3', 'Echéance - Test - 221134A', 1, '[{\"added\": {}}]', 19, 1),
(99, '2024-02-26 22:52:04.557085', '2', 'Relance - Test - 221134A', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 19, 1),
(100, '2024-02-26 22:52:47.585153', '4', 'test', 1, '[{\"added\": {}}]', 19, 1),
(101, '2024-02-27 09:33:47.923483', '4', 'test', 2, '[{\"changed\": {\"fields\": [\"Start datetime\", \"End datetime\"]}}]', 19, 1),
(102, '2024-02-27 14:21:10.747961', '3', 'Echéance', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 19, 1),
(103, '2024-02-27 14:25:05.787884', '2', 'Relance', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 19, 1),
(104, '2024-02-29 22:31:50.683354', '3', 'Echéance', 2, '[{\"changed\": {\"fields\": [\"Start datetime\", \"End datetime\"]}}]', 19, 1),
(105, '2024-02-29 23:58:45.433355', '4', 'test', 2, '[{\"changed\": {\"fields\": [\"Start datetime\", \"End datetime\"]}}]', 19, 1),
(106, '2024-03-01 09:47:48.572033', '2', 'Relance', 2, '[{\"changed\": {\"fields\": [\"Start datetime\", \"End datetime\"]}}]', 19, 1),
(107, '2024-03-01 13:08:43.508295', '15', 'Rdv test 26', 2, '[{\"changed\": {\"fields\": [\"End datetime\"]}}]', 19, 1),
(108, '2024-03-01 13:36:26.058230', '8', 'le finistère', 2, '[{\"changed\": {\"fields\": [\"Civilite\", \"R social fourn\", \"Nom fourn\", \"Prenom fourn\", \"Adr fourn\", \"Mail fourn\"]}}]', 7, 1),
(109, '2024-03-01 14:18:50.147268', '17', 'Echéance', 3, '', 19, 1),
(110, '2024-03-03 22:48:43.615035', '87', 'Facture test agenda - 2024-03-01', 2, '[{\"changed\": {\"fields\": [\"Num facture\"]}}]', 12, 1),
(111, '2024-03-03 22:49:10.345905', '87', 'Facture test agenda - 2024-03-01', 2, '[]', 12, 1),
(112, '2024-03-04 17:14:41.379351', '76', 'Facture Test - 1134B - 2024-02-13', 2, '[{\"changed\": {\"fields\": [\"Num facture\"]}}]', 12, 1),
(113, '2024-03-04 17:14:50.179829', '74', 'Facture Test - 1134C - 2024-02-13', 2, '[{\"changed\": {\"fields\": [\"Num facture\"]}}]', 12, 1),
(114, '2024-03-04 17:14:55.569185', '73', 'Facture Test - 1134D - 2024-02-13', 2, '[{\"changed\": {\"fields\": [\"Num facture\"]}}]', 12, 1),
(115, '2024-03-04 17:15:20.073988', '55', 'Facture test case - espace é - 2024-03-19', 2, '[{\"changed\": {\"fields\": [\"Num facture\"]}}]', 12, 1),
(116, '2024-03-04 17:15:40.457951', '65', 'Facture test - 3206A - 2024-02-20', 2, '[{\"changed\": {\"fields\": [\"Num facture\"]}}]', 12, 1),
(117, '2024-03-04 17:15:48.085529', '64', 'Facture test - 3206Z - 2024-02-20', 2, '[{\"changed\": {\"fields\": [\"Num facture\"]}}]', 12, 1),
(118, '2024-03-04 17:15:56.193597', '62', 'Facture test - 3206D - 2024-02-20', 2, '[{\"changed\": {\"fields\": [\"Num facture\"]}}]', 12, 1),
(119, '2024-03-04 17:16:07.107922', '63', 'Facture 3006 - 2024-02-20', 2, '[{\"changed\": {\"fields\": [\"Num facture\"]}}]', 12, 1),
(120, '2024-03-04 17:16:12.299582', '69', 'Facture Test - 3206D - 2024-01-10', 2, '[{\"changed\": {\"fields\": [\"Num facture\"]}}]', 12, 1),
(121, '2024-03-04 17:16:21.163870', '61', 'Facture sA006 - 2024-02-20', 2, '[{\"changed\": {\"fields\": [\"Num facture\"]}}]', 12, 1),
(122, '2024-03-04 17:16:42.553786', '72', 'Facture C4444A - 2024-04-01', 2, '[{\"changed\": {\"fields\": [\"Num facture\"]}}]', 12, 1),
(123, '2024-03-04 20:17:51.158820', '18', 'Echéance', 2, '[{\"changed\": {\"fields\": [\"Num facture\"]}}]', 19, 1),
(124, '2024-03-04 20:35:44.394175', '4', 'Relance', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 19, 1),
(125, '2024-03-05 01:26:31.521145', '66', 'Facture 66 test case - espace - 2024-02-20', 2, '[{\"changed\": {\"fields\": [\"Date facture\"]}}]', 12, 1),
(126, '2024-03-05 01:26:51.435320', '64', 'Facture 64 test - 3206Z - 2024-01-20', 2, '[{\"changed\": {\"fields\": [\"Date facture\"]}}]', 12, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'logifacturapp', 'civilite'),
(2, 'logifacturapp', 'devise'),
(3, 'logifacturapp', 'pays'),
(4, 'logifacturapp', 'region'),
(5, 'logifacturapp', 'ville'),
(6, 'logifacturapp', 'client'),
(7, 'logifacturapp', 'fournisseur'),
(8, 'logifacturapp', 'user'),
(9, 'logifacturapp', 'cat_facture'),
(10, 'logifacturapp', 'cp'),
(11, 'logifacturapp', 'methode_paiement'),
(12, 'logifacturapp', 'facture'),
(13, 'admin', 'logentry'),
(14, 'auth', 'permission'),
(15, 'auth', 'group'),
(16, 'auth', 'user'),
(17, 'contenttypes', 'contenttype'),
(18, 'sessions', 'session'),
(19, 'logifacturapp', 'agendaevent'),
(20, 'schedule', 'calendar'),
(21, 'schedule', 'calendarrelation'),
(22, 'schedule', 'event'),
(23, 'schedule', 'eventrelation'),
(24, 'schedule', 'occurrence'),
(25, 'schedule', 'rule');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-02-11 16:00:27.850533'),
(2, 'auth', '0001_initial', '2024-02-11 16:00:28.105124'),
(3, 'admin', '0001_initial', '2024-02-11 16:00:28.184496'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-02-11 16:00:28.191485'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-11 16:00:28.196976'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-02-11 16:00:28.247395'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-02-11 16:00:28.265366'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-02-11 16:00:28.284835'),
(9, 'auth', '0004_alter_user_username_opts', '2024-02-11 16:00:28.290326'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-02-11 16:00:28.310793'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-02-11 16:00:28.312790'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-02-11 16:00:28.318281'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-02-11 16:00:28.337251'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-02-11 16:00:28.357718'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-02-11 16:00:28.376687'),
(16, 'auth', '0011_update_proxy_permissions', '2024-02-11 16:00:28.388668'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-02-11 16:00:28.407638'),
(18, 'sessions', '0001_initial', '2024-02-11 16:00:28.427107'),
(19, 'logifacturapp', '0001_initial', '2024-02-11 16:12:19.086907'),
(20, 'logifacturapp', '0002_alter_methode_paiement_table', '2024-02-11 16:13:10.150838'),
(21, 'logifacturapp', '0003_alter_fournisseur_civilite', '2024-02-16 15:10:56.477792'),
(22, 'logifacturapp', '0004_auto_20240220_1415', '2024-02-20 13:19:16.465707'),
(23, 'logifacturapp', '0005_alter_facture_user', '2024-02-20 13:19:16.483696'),
(24, 'logifacturapp', '0006_delete_user', '2024-02-26 08:28:22.091902'),
(25, 'logifacturapp', '0007_agendaevent', '2024-02-26 12:10:53.483157'),
(26, 'logifacturapp', '0008_alter_agendaevent_table', '2024-02-26 12:30:39.822652'),
(27, 'schedule', '0001_initial', '2024-02-26 12:54:32.571202'),
(28, 'schedule', '0002_event_color_event', '2024-02-26 12:54:32.598193'),
(29, 'schedule', '0003_auto_20160715_0028', '2024-02-26 12:54:32.757142'),
(30, 'schedule', '0006_update_text_fields_empty_string', '2024-02-26 12:54:32.777136'),
(31, 'schedule', '0004_text_fields_not_null', '2024-02-26 12:54:32.994066'),
(32, 'schedule', '0005_verbose_name_plural_for_calendar', '2024-02-26 12:54:32.998065'),
(33, 'schedule', '0007_merge_text_fields', '2024-02-26 12:54:32.999064'),
(34, 'schedule', '0008_gfk_index', '2024-02-26 12:54:33.120025'),
(35, 'schedule', '0009_merge_20180108_2303', '2024-02-26 12:54:33.121024'),
(36, 'schedule', '0010_events_set_missing_calendar', '2024-02-26 12:54:33.136019'),
(37, 'schedule', '0011_event_calendar_not_null', '2024-02-26 12:54:33.178005'),
(38, 'schedule', '0012_auto_20191025_1852', '2024-02-26 12:54:33.205997'),
(39, 'schedule', '0013_auto_20210502_2303', '2024-02-26 12:54:33.529892'),
(40, 'schedule', '0014_use_autofields_for_pk', '2024-02-26 12:54:33.846793'),
(41, 'logifacturapp', '0009_alter_facture_num_facture', '2024-03-04 17:31:54.437490'),
(42, 'logifacturapp', '0010_client_cree_le_client_modifie_le_fournisseur_cree_le_and_more', '2024-03-06 16:26:44.029432');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('15qf3pgbbm2n7odacp8pxqpd8msnjt36', '.eJxVjMEOgjAQRP-lZ9O07FKKR-98Q7PdbS1qIKFwMv67kHDQ22Tem3mrQNtawlbTEkZRV2XV5beLxM80HUAeNN1nzfO0LmPUh6JPWvUwS3rdTvfvoFAt-7rrXC8syTR2D5QtCwJ6jmAAfEZunUGw2DOCd9lTTzm2JktujANA9fkC2yU3dQ:1rg2zk:dFw7ZZK4eOPJY8Z17v_2Nz6dHhLk3sQgLWVhTJY0ruQ', '2024-03-15 13:32:12.754166'),
('2x9ldy85sy5a219u6wzfan96w12yrbwz', '.eJxVjMEOgjAQRP-lZ9O07FKKR-98Q7PdbS1qIKFwMv67kHDQ22Tem3mrQNtawlbTEkZRV2XV5beLxM80HUAeNN1nzfO0LmPUh6JPWvUwS3rdTvfvoFAt-7rrXC8syTR2D5QtCwJ6jmAAfEZunUGw2DOCd9lTTzm2JktujANA9fkC2yU3dQ:1riC1O:FdyvABNuLm6jfglq6ea6VtRzLkBS-eB1opTM1LLGUhs', '2024-03-21 11:34:46.045404');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `id_facture` int NOT NULL AUTO_INCREMENT,
  `num_facture` varchar(40) NOT NULL,
  `date_facture` date NOT NULL,
  `total_ht_facture` decimal(10,2) NOT NULL,
  `total_ttc_facture` decimal(10,2) NOT NULL,
  `statut_facture` tinyint(1) NOT NULL,
  `cat_facture_id` int NOT NULL,
  `client_id` int NOT NULL,
  `devise_id` int NOT NULL,
  `fournisseur_id` int NOT NULL,
  `methode_paiement_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id_facture`),
  UNIQUE KEY `Facture_num_facture_406339fd_uniq` (`num_facture`),
  KEY `Facture_cat_facture_id_c086ba75` (`cat_facture_id`),
  KEY `Facture_client_id_a15b2107` (`client_id`),
  KEY `Facture_devise_id_e9e27a4c` (`devise_id`),
  KEY `Facture_fournisseur_id_1c6a017c` (`fournisseur_id`),
  KEY `Facture_methode_paiement_id_c0c2247f` (`methode_paiement_id`),
  KEY `FK_Facture_User` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id_facture`, `num_facture`, `date_facture`, `total_ht_facture`, `total_ttc_facture`, `statut_facture`, `cat_facture_id`, `client_id`, `devise_id`, `fournisseur_id`, `methode_paiement_id`, `user_id`) VALUES
(51, 'BS-TT-2024', '2022-02-20', '96.00', '115.20', 0, 6, 4, 1, 3, 2, 1),
(52, 'Test - 888', '2022-02-21', '128.00', '153.60', 0, 1, 5, 1, 3, 1, 1),
(53, 'T - 455A', '2024-02-20', '128.00', '153.60', 1, 6, 3, 1, 3, 2, 1),
(54, 'Test - Nom - Ville', '2023-02-20', '96.00', '105.60', 1, 1, 4, 1, 3, 1, 1),
(55, 'test case - espace é', '2024-03-19', '96.00', '105.60', 0, 6, 4, 1, 4, 1, 1),
(56, 'test - 3002', '2024-02-20', '108.00', '118.80', 1, 1, 6, 1, 5, 1, 1),
(66, 'test case - espace', '2024-02-20', '96.00', '105.60', 1, 6, 4, 1, 4, 1, 1),
(67, 'test - 455a', '2024-02-20', '128.00', '153.60', 0, 1, 3, 1, 3, 1, 1),
(61, 'sA006', '2024-02-20', '132.00', '145.20', 0, 1, 6, 1, 5, 2, 1),
(62, 'test - 3206D', '2024-02-20', '132.00', '145.20', 1, 6, 6, 1, 5, 1, 1),
(63, '3006', '2024-02-20', '132.00', '145.20', 0, 1, 6, 1, 5, 1, 1),
(64, 'test - 3206Z', '2024-01-20', '132.00', '145.20', 1, 1, 6, 1, 5, 2, 1),
(65, 'test - 3206A', '2024-02-20', '132.00', '145.20', 1, 1, 6, 1, 5, 2, 1),
(68, 'C - 3206', '2024-02-20', '132.00', '145.20', 1, 1, 3, 1, 5, 2, 1),
(69, 'T- 3206D', '2024-01-10', '132.00', '145.20', 0, 6, 3, 1, 5, 1, 1),
(71, 'Test - 4444A', '2024-04-01', '156.00', '171.60', 1, 1, 3, 1, 5, 2, 1),
(72, 'C4444A', '2024-04-01', '156.00', '171.60', 1, 6, 3, 1, 5, 2, 1),
(73, 'Test - 1134D', '2024-02-13', '156.00', '171.60', 1, 6, 3, 1, 5, 1, 1),
(74, 'Test - 1134C', '2024-02-13', '156.00', '171.60', 1, 1, 3, 1, 5, 2, 1),
(75, 'Test - 1134A', '2024-02-13', '156.00', '171.60', 1, 6, 7, 1, 6, 1, 1),
(76, 'Test - 1134B', '2024-02-13', '156.00', '171.60', 1, 1, 7, 1, 6, 1, 2),
(81, 'Facture ye', '2024-01-29', '236.00', '283.20', 0, 7, 10, 1, 8, 2, 1),
(78, 'DDD 3206', '2024-01-10', '132.00', '145.20', 1, 6, 3, 1, 5, 1, 1),
(79, 'Test - 3206', '2024-02-20', '132.00', '145.20', 1, 6, 8, 1, 5, 2, 1),
(80, 'Test - 221134A', '2024-01-17', '356.00', '391.60', 0, 19, 9, 1, 7, 3, 1),
(87, 'test agenda', '2024-03-01', '236.00', '283.20', 1, 8, 10, 1, 9, 6, 1),
(88, 'freee1', '2024-03-01', '236.00', '283.20', 1, 7, 11, 1, 9, 2, 1),
(89, 'freee111', '2024-03-11', '236.00', '283.20', 1, 7, 11, 1, 9, 4, 1),
(90, 'mmmlee111', '2024-03-11', '236.00', '283.20', 0, 7, 11, 1, 9, 2, 1),
(91, 'uulee111', '2024-03-11', '908.00', '1089.60', 1, 8, 3, 1, 9, 3, 1),
(92, 'SZQ111', '2024-01-11', '908.00', '1089.60', 1, 7, 12, 1, 9, 7, 1),
(93, 'SZQ11ff', '2024-01-11', '908.00', '1089.60', 1, 8, 12, 1, 9, 3, 1),
(94, 'SDS11ff', '2024-01-11', '908.00', '1089.60', 1, 8, 13, 1, 9, 4, 1),
(95, 'HGFS11ff', '2024-05-11', '908.00', '1089.60', 1, 6, 14, 1, 9, 4, 1),
(96, 'DDDGFS11ff', '2024-05-11', '908.00', '1089.60', 1, 6, 14, 1, 9, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id_fourn` int NOT NULL AUTO_INCREMENT,
  `r_social_fourn` varchar(100) NOT NULL,
  `siret_fourn` varchar(14) NOT NULL,
  `nom_fourn` varchar(40) DEFAULT NULL,
  `prenom_fourn` varchar(40) DEFAULT NULL,
  `adr_fourn` varchar(100) NOT NULL,
  `adr2_fourn` varchar(100) DEFAULT NULL,
  `tel_fourn` int DEFAULT NULL,
  `mail_fourn` varchar(180) DEFAULT NULL,
  `civilite_id` int DEFAULT NULL,
  `ville_id` int NOT NULL,
  `cree_le` datetime(6) NOT NULL,
  `modifie_le` datetime(6) NOT NULL,
  PRIMARY KEY (`id_fourn`),
  UNIQUE KEY `Fournisseur_siret_fourn_84db49aa_uniq` (`siret_fourn`),
  KEY `Fournisseur_civilite_id_3ec47cb8` (`civilite_id`),
  KEY `Fournisseur_ville_id_e896334d` (`ville_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id_fourn`, `r_social_fourn`, `siret_fourn`, `nom_fourn`, `prenom_fourn`, `adr_fourn`, `adr2_fourn`, `tel_fourn`, `mail_fourn`, `civilite_id`, `ville_id`, `cree_le`, `modifie_le`) VALUES
(1, 'roublard décadent', '1234', 'Lila', 'Badi', '221 rue terreur nocturne', 'none', 22, 'az@f.com', 1, 1, '2024-03-06 16:26:43.923479', '2024-03-06 16:26:43.956473'),
(3, 'tata yoyo', '1111111', NULL, NULL, '7 rue du doudou', 'none', 3111111, NULL, NULL, 1, '2024-03-06 16:26:43.923479', '2024-03-06 16:26:43.956473'),
(4, 'rebelles du 06', '436237568', NULL, NULL, '12 rue dante', 'none', 2147483647, NULL, NULL, 1, '2024-03-06 16:26:43.923479', '2024-03-06 16:26:43.956473'),
(5, 'linx', '34629303', NULL, NULL, '31 rue jean médecin', 'none', 124343546, NULL, NULL, 1, '2024-03-06 16:26:43.923479', '2024-03-06 16:26:43.956473'),
(6, 'fournisseur test', '34629303654412', NULL, NULL, '31 rue du puit', 'none', 491564412, NULL, NULL, 2, '2024-03-06 16:26:43.923479', '2024-03-06 16:26:43.956473'),
(7, 'SNCF gare de nice', '55204944770389', NULL, NULL, '12 av thiers', 'none', 491564412, NULL, NULL, 1, '2024-03-06 16:26:43.923479', '2024-03-06 16:26:43.956473'),
(8, 'le finistère', '898944770389', 'lepetit', 'robert', '12 av de la bourse', 'none', 491564412, 'ap@f.com', 2, 1, '2024-03-06 16:26:43.923479', '2024-03-06 16:26:43.956473'),
(9, 'flambysamba', '44444770389', NULL, NULL, '15 rue des enjôliveurs', 'none', 491564455, NULL, NULL, 1, '2024-03-06 16:26:43.923479', '2024-03-06 16:26:43.956473');

-- --------------------------------------------------------

--
-- Structure de la table `methode_paiement`
--

DROP TABLE IF EXISTS `methode_paiement`;
CREATE TABLE IF NOT EXISTS `methode_paiement` (
  `id_m_paie` int NOT NULL AUTO_INCREMENT,
  `nom_m_paie` varchar(20) NOT NULL,
  PRIMARY KEY (`id_m_paie`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `methode_paiement`
--

INSERT INTO `methode_paiement` (`id_m_paie`, `nom_m_paie`) VALUES
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

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `id_pays` varchar(3) NOT NULL,
  `nom_pays` varchar(45) NOT NULL,
  `indicatif_pays` smallint NOT NULL,
  PRIMARY KEY (`id_pays`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id_pays`, `nom_pays`, `indicatif_pays`) VALUES
('FR', 'France', 33),
('0', 'Sahara occidental', 0),
('IT', 'Italie', 39),
('1', 'Territoires palestiniens', 0),
('2', 'Taïwan', 886),
('3', 'Antarctique', 0),
('AD', 'Andorre', 376),
('AE', 'Émirats arabes unis', 971),
('AF', 'Afghanistan', 93),
('AG', 'Antigua-et-Barbuda', 1),
('AL', 'Albanie', 355),
('AM', 'Arm', 374),
('AO', 'Angola', 244),
('AR', 'Argentine', 54),
('AT', 'Autriche', 43),
('AU', 'Australie', 672),
('AZ', 'Azerba', 994),
('BA', 'Bosnie-Herz', 387),
('BB', 'Barbade', 1),
('BD', 'Bangladesh', 880),
('BE', 'Belgique', 32),
('BF', 'Burkina', 226),
('BG', 'Bulgarie', 359),
('BH', 'Bahrein', 973),
('BI', 'Burundi', 257),
('BJ', 'Bénin', 229),
('BN', 'Brunei', 673),
('BO', 'Bolivie', 591),
('BR', 'Brésil', 55),
('BS', 'Bahamas', 1),
('BT', 'Bhoutan', 975),
('BW', 'Botswana', 267),
('BY', 'Biélorussie', 375),
('BZ', 'Bélize', 501),
('CA', 'Canada', 1),
('CD', 'République démocratique du Congo', 243),
('CF', 'Centrafrique', 236),
('CG', 'Congo', 242),
('CH', 'Suisse', 41),
('CI', 'Côte d\'Ivoire', 225),
('CK', 'Îles Cook', 682),
('CL', 'Chili', 56),
('CM', 'Cameroun', 237),
('CN', 'Chine', 86),
('CO', 'Colombie', 57),
('CR', 'Costa Rica', 506),
('CU', 'Cuba', 53),
('CV', 'Cap-Vert', 238),
('CY', 'Chypre', 357),
('CZ', 'Tchéquie', 420),
('DE', 'Allemagne', 49),
('DJ', 'Djibouti', 253),
('DK', 'Danemark', 45),
('DM', 'Dominique', 1),
('DO', 'République dominicaine', 1),
('DZ', 'Algérie', 213),
('EC', 'Équateur', 593),
('EE', 'Estonie', 372),
('EG', 'Égypte', 20),
('ER', 'Érythrée', 291),
('ES', 'Espagne', 34),
('ET', 'Éthiopie', 251),
('FI', 'Finlande', 0),
('FJ', 'Fidji', 679),
('FM', 'Micronésie', 691),
('GA', 'Gabon', 241),
('GB', 'Royaume-Uni', 44),
('GD', 'Grenade', 1),
('GE', 'Géorgie', 995),
('GH', 'Ghana', 233),
('GM', 'Gambie', 220),
('GN', 'Guinée', 224),
('GQ', 'Guinée équatoriale', 240),
('GR', 'Grèce', 30),
('GT', 'Guatémala', 502),
('GW', 'Guinée-Bissao', 245),
('GY', 'Guyana', 592),
('HN', 'Honduras', 504),
('HR', 'Croatie', 385),
('HT', 'Haïti', 509),
('HU', 'Hongrie', 36),
('ID', 'Indonésie', 62),
('IE', 'Irlande', 353),
('IL', 'Israël', 972),
('IN', 'Inde', 91),
('IQ', 'Irak', 964),
('IR', 'Iran', 98),
('IS', 'Islande', 354),
('JM', 'Jamaïque', 1),
('JO', 'Jordanie', 962),
('JP', 'Japon', 81),
('KE', 'Kénya', 254),
('KG', 'Kirghizstan', 996),
('KH', 'Cambodge', 855),
('KI', 'Kiribati', 686),
('KM', 'Comores', 269),
('KN', 'Saint-Christophe-et-Niévès', 1),
('KP', 'Corée du Nord', 850),
('KR', 'Corée du Sud', 82),
('KW', 'Koweït', 965),
('KZ', 'Kazakhstan', 7),
('LA', 'Laos', 856),
('LB', 'Liban', 961),
('LC', 'Sainte-Lucie', 1),
('LI', 'Liechtenstein', 423),
('LK', 'Sri Lanka', 94),
('LR', 'Libéria', 231),
('LS', 'Lésotho', 266),
('LT', 'Lituanie', 370),
('LU', 'Luxembourg', 352),
('LV', 'Lettonie', 371),
('LY', 'Libye', 218),
('MA', 'Maroc', 212),
('MC', 'Monaco', 377),
('MD', 'Moldavie', 373),
('ME', 'Monténégro', 382),
('MG', 'Madagascar', 261),
('MH', 'Îles Marshall', 692),
('MK', 'Macédoine du Nord', 389),
('ML', 'Mali', 223),
('MM', 'Birmanie', 95),
('MN', 'Mongolie', 976),
('MR', 'Mauritanie', 222),
('MT', 'Malte', 356),
('MU', 'Maurice', 230),
('MV', 'Maldives', 960),
('MW', 'Malawi', 265),
('MX', 'Mexique', 52),
('MY', 'Malaisie', 60),
('MZ', 'Mozambique', 258),
('NA', 'Namibie', 264),
('NE', 'Niger', 227),
('NG', 'Nigéria', 234),
('NI', 'Nicaragua', 505),
('NL', 'Pays-Bas', 31),
('NO', 'Norvège', 47),
('NP', 'Népal', 977),
('NR', 'Nauru', 674),
('NU', 'Niue', 683),
('NZ', 'Nouvelle-Zélande', 64),
('OM', 'Oman', 968),
('PA', 'Panama', 507),
('PE', 'Pérou', 51),
('PG', 'Papouasie-Nouvelle-Guinée', 675),
('PH', 'Philippines', 63),
('PK', 'Pakistan', 92),
('PL', 'Pologne', 48),
('PT', 'Portugal', 351),
('PW', 'Palaos', 680),
('PY', 'Paraguay', 595),
('QA', 'Qatar', 974),
('RO', 'Roumanie', 40),
('RS', 'Serbie', 381),
('RU', 'Russie', 7),
('RW', 'Rwanda', 250),
('SA', 'Arabie saoudite', 966),
('SB', 'Salomon', 677),
('SC', 'Seychelles', 248),
('SD', 'Soudan', 249),
('SE', 'Suède', 46),
('SG', 'Singapour', 65),
('SI', 'Slovénie', 386),
('SK', 'Slovaquie', 421),
('SL', 'Sierra Leone', 232),
('SM', 'Saint-Marin', 378),
('SN', 'Sénégal', 221),
('SO', 'Somalie', 252),
('SR', 'Suriname', 597),
('SS', 'Soudan du Sud', 211),
('ST', 'Sao Tomé-et-Principe', 239),
('SV', 'Salvador', 503),
('SY', 'Syrie', 963),
('SZ', 'Eswatini', 268),
('TD', 'Tchad', 235),
('TG', 'Togo', 228),
('TH', 'Thaïlande', 66),
('TJ', 'Tadjikistan', 992),
('TL', 'Timor oriental', 670),
('TM', 'Turkménistan', 993),
('TN', 'Tunisie', 216),
('TO', 'Tonga', 676),
('TR', 'Turquie', 90),
('TT', 'Trinité-et-Tobago', 1),
('TV', 'Tuvalu', 688),
('TZ', 'Tanzanie', 255),
('UA', 'Ukraine', 380),
('UG', 'Ouganda', 256),
('US', 'États-Unis', 1),
('UY', 'Uruguay', 598),
('UZ', 'Ouzbékistan', 998),
('VA', 'Vatican', 39),
('VC', 'Saint-Vincent-et-les-Grenadines', 1),
('VE', 'Vénézuéla', 58),
('VN', 'Vietnam', 84),
('VU', 'Vanuatu', 678),
('WS', 'Samoa', 685),
('YE', 'Yémen', 967),
('YK', 'Kosovo', 383),
('ZA', 'Afrique du Sud', 27),
('ZM', 'Zambie', 260),
('ZW', 'Zimbabwé', 263);

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `id_reg` int NOT NULL AUTO_INCREMENT,
  `nom_reg` varchar(60) NOT NULL,
  `pays_id` varchar(3) NOT NULL,
  PRIMARY KEY (`id_reg`),
  KEY `Region_pays_id_83dfb4ea` (`pays_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`id_reg`, `nom_reg`, `pays_id`) VALUES
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

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `id_ville` int NOT NULL AUTO_INCREMENT,
  `nom_ville` varchar(60) NOT NULL,
  `region_id` int NOT NULL,
  PRIMARY KEY (`id_ville`),
  KEY `Ville_region_id_6fdcae40` (`region_id`)
) ENGINE=MyISAM AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id_ville`, `nom_ville`, `region_id`) VALUES
(1, 'Nice', 1),
(2, 'Marseille', 1),
(3, 'Marseille', 1),
(4, 'Nice', 1),
(5, 'Toulon', 1),
(6, 'Aix-en-Provence', 1),
(7, 'Avignon', 1),
(8, 'Antibes', 1),
(9, 'Cannes', 1),
(10, 'La Seyne-sur-Mer', 1),
(11, 'Hyères', 1),
(12, 'Fréjus', 1),
(13, 'Arles', 1),
(14, 'Grasse', 1),
(15, 'Martigues', 1),
(16, 'Saint-Raphaël', 1),
(17, 'Istres', 1),
(18, 'Vitrolles', 1),
(19, 'Manosque', 1),
(20, 'Draguignan', 1),
(21, 'Marignane', 1),
(22, 'Aubagne', 1),
(23, 'Basse-Terre', 2),
(24, 'Pointe-à-Pitre', 2),
(25, 'Les Abymes', 2),
(26, 'Baie-Mahault', 2),
(27, 'Le Gosier', 2),
(28, 'Petit-Bourg', 2),
(29, 'Sainte-Anne', 2),
(30, 'Sainte-Rose', 2),
(31, 'Lamentin', 2),
(32, 'Capesterre-Belle-Eau', 2),
(33, 'Morne-à-l\'Eau', 2),
(34, 'Saint-François', 2),
(35, 'Saint-Claude', 2),
(36, 'Goyave', 2),
(37, 'Fort-de-France', 3),
(38, 'Le Lamentin', 3),
(39, 'Le Robert', 3),
(40, 'Schœlcher', 3),
(41, 'Ducos', 3),
(42, 'Sainte-Marie', 3),
(43, 'La Trinité', 3),
(44, 'Rivière-Pilote', 3),
(45, 'Les Trois-Îlets', 3),
(46, 'Le François', 3),
(47, 'Saint-Joseph', 3),
(48, 'Le Marin', 3),
(49, 'Saint-Pierre', 3),
(50, 'Rivière-Salée', 3),
(51, 'Cayenne', 4),
(52, 'Matoury', 4),
(53, 'Saint-Laurent-du-Maroni', 4),
(54, 'Kourou', 4),
(55, 'Remire-Montjoly', 4),
(56, 'Mana', 4),
(57, 'Macouria', 4),
(58, 'Maripasoula', 4),
(59, 'Apatou', 4),
(60, 'Grand-Santi', 4),
(61, 'Iracoubo', 4),
(62, 'Saint-Georges', 4),
(63, 'Roura', 4),
(64, 'Sinnamary', 4),
(65, 'Saint-Denis', 5),
(66, 'Saint-Paul', 5),
(67, 'Saint-Pierre', 5),
(68, 'Le Tampon', 5),
(69, 'Saint-André', 5),
(70, 'Le Port', 5),
(71, 'Saint-Louis', 5),
(72, 'Saint-Benoît', 5),
(73, 'Saint-Joseph', 5),
(74, 'Sainte-Marie', 5),
(75, 'Saint-Leu', 5),
(76, 'La Possession', 5),
(77, 'Petite-Île', 5),
(78, 'Cilaos', 5),
(79, 'Mamoudzou', 6),
(80, 'Dzaoudzi', 6),
(81, 'Koungou', 6),
(82, 'Dembeni', 6),
(83, 'Sada', 6),
(84, 'Bandraboua', 6),
(85, 'Ouangani', 6),
(86, 'Chirongui', 6),
(87, 'Chiconi', 6),
(88, 'Tsingoni', 6),
(89, 'Mtsamboro', 6),
(90, 'Acoua', 6),
(91, 'Mtsangamouji', 6),
(92, 'Bouéni', 6),
(93, 'Paris', 7),
(94, 'Versailles', 7),
(95, 'Boulogne-Billancourt', 7),
(96, 'Argenteuil', 7),
(97, 'Montreuil', 7),
(98, 'Saint-Denis', 7),
(99, 'Nanterre', 7),
(100, 'Créteil', 7),
(101, 'Aulnay-sous-Bois', 7),
(102, 'Vitry-sur-Seine', 7),
(103, 'Colombes', 7),
(104, 'Asnières-sur-Seine', 7),
(105, 'Champigny-sur-Marne', 7),
(106, 'Rueil-Malmaison', 7),
(107, 'Saint-Maur-des-Fossés', 7),
(108, 'Courbevoie', 7),
(109, 'Aubervilliers', 7),
(110, 'Drancy', 7),
(111, 'Issy-les-Moulineaux', 7),
(112, 'Levallois-Perret', 7),
(113, 'Noisy-le-Grand', 7),
(114, 'Pantin', 7),
(115, 'Sevran', 7),
(116, 'Clamart', 7),
(117, 'Villejuif', 7),
(118, 'Fontenay-sous-Bois', 7),
(119, 'Sarcelles', 7),
(120, 'Cergy', 7),
(121, 'Tours', 8),
(122, 'Orléans', 8),
(123, 'Blois', 8),
(124, 'Châteauroux', 8),
(125, 'Chartres', 8),
(126, 'Bourges', 8),
(127, 'Joué-lès-Tours', 8),
(128, 'Dreux', 8),
(129, 'Vierzon', 8),
(130, 'Fleury-les-Aubrais', 8),
(131, 'Saint-Cyr-sur-Loire', 8),
(132, 'Saint-Jean-de-Braye', 8),
(133, 'Château-Thierry', 8),
(134, 'Romorantin-Lanthenay', 8),
(135, 'Vendôme', 8),
(136, 'Dijon', 9),
(137, 'Besançon', 9),
(138, 'Chalon-sur-Saône', 9),
(139, 'Mâcon', 9),
(140, 'Nevers', 9),
(141, 'Auxerre', 9),
(142, 'Montbéliard', 9),
(143, 'Belfort', 9),
(144, 'Sens', 9),
(145, 'Autun', 9),
(146, 'Beaune', 9),
(147, 'Lons-le-Saunier', 9),
(148, 'Dole', 9),
(149, 'Pontarlier', 9),
(150, 'Rouen', 10),
(151, 'Caen', 10),
(152, 'Le Havre', 10),
(153, 'Cherbourg-Octeville', 10),
(154, 'Évreux', 10),
(155, 'Dieppe', 10),
(156, 'Saint-Étienne-du-Rouvray', 10),
(157, 'Sotteville-lès-Rouen', 10),
(158, 'Alençon', 10),
(159, 'Le Grand-Quevilly', 10),
(160, 'Hérouville-Saint-Clair', 10),
(161, 'Lisieux', 10),
(162, 'Vernon', 10),
(163, 'Saint-Lô', 10),
(164, 'Lille', 11),
(165, 'Amiens', 11),
(166, 'Roubaix', 11),
(167, 'Tourcoing', 11),
(168, 'Dunkerque', 11),
(169, 'Calais', 11),
(170, 'Villeneuve-d\'Ascq', 11),
(171, 'Saint-Quentin', 11),
(172, 'Beauvais', 11),
(173, 'Compiègne', 11),
(174, 'Arras', 11),
(175, 'Boulogne-sur-Mer', 11),
(176, 'Lens', 11),
(177, 'Amiens', 11),
(178, 'Valenciennes', 11),
(179, 'Strasbourg', 12),
(180, 'Reims', 12),
(181, 'Metz', 12),
(182, 'Mulhouse', 12),
(183, 'Nancy', 12),
(184, 'Colmar', 12),
(185, 'Troyes', 12),
(186, 'Charleville-Mézières', 12),
(187, 'Thionville', 12),
(188, 'Épinal', 12),
(189, 'Saint-Dizier', 12),
(190, 'Châlons-en-Champagne', 12),
(191, 'Vandœuvre-lès-Nancy', 12),
(192, 'Freyming-Merlebach', 12),
(193, 'Nantes', 13),
(194, 'Angers', 13),
(195, 'Le Mans', 13),
(196, 'Saint-Nazaire', 13),
(197, 'Cholet', 13),
(198, 'Laval', 13),
(199, 'Saumur', 13),
(200, 'La Roche-sur-Yon', 13),
(201, 'Saint-Herblain', 13),
(202, 'Rezé', 13),
(203, 'Lorient', 13),
(204, 'Saint-Sébastien-sur-Loire', 13),
(205, 'Saint-Herblain', 13),
(206, 'Angoulême', 13),
(207, 'Cholet', 13),
(208, 'Rennes', 14),
(209, 'Brest', 14),
(210, 'Quimper', 14),
(211, 'Lorient', 14),
(212, 'Vannes', 14),
(213, 'Saint-Malo', 14),
(214, 'Saint-Brieuc', 14),
(215, 'Dinard', 14),
(216, 'Fougères', 14),
(217, 'Lanester', 14),
(218, 'Concarneau', 14),
(219, 'Landerneau', 14),
(220, 'Morlaix', 14),
(221, 'Douarnenez', 14),
(222, 'Bordeaux', 15),
(223, 'Limoges', 15),
(224, 'Pau', 15),
(225, 'La Rochelle', 15),
(226, 'Bayonne', 15),
(227, 'Mérignac', 15),
(228, 'Pessac', 15),
(229, 'Talence', 15),
(230, 'Angoulême', 15),
(231, 'Agen', 15),
(232, 'Biarritz', 15),
(233, 'Poitiers', 15),
(234, 'Périgueux', 15),
(235, 'Mont-de-Marsan', 15),
(236, 'Toulouse', 16),
(237, 'Montpellier', 16),
(238, 'Nîmes', 16),
(239, 'Perpignan', 16),
(240, 'Carcassonne', 16),
(241, 'Mende', 16),
(242, 'Albi', 16),
(243, 'Béziers', 16),
(244, 'Tarbes', 16),
(245, 'Cahors', 16),
(246, 'Auch', 16),
(247, 'Rodez', 16),
(248, 'Foix', 16),
(249, 'Millau', 16),
(250, 'Lyon', 17),
(251, 'Grenoble', 17),
(252, 'Saint-Étienne', 17),
(253, 'Villeurbanne', 17),
(254, 'Chambéry', 17),
(255, 'Annecy', 17),
(256, 'Valence', 17),
(257, 'Clermont-Ferrand', 17),
(258, 'Aix-les-Bains', 17),
(259, 'Roanne', 17),
(260, 'Bourg-en-Bresse', 17),
(261, 'Vénissieux', 17),
(262, 'Saint-Priest', 17),
(263, 'Caluire-et-Cuire', 17),
(264, 'Ajaccio', 18),
(265, 'Bastia', 18),
(266, 'Corte', 18),
(267, 'Porto-Vecchio', 18),
(268, 'Calvi', 18),
(269, 'Bonifacio', 18),
(270, 'Propriano', 18),
(271, 'L\'Île-Rousse', 18),
(272, 'Grosseto-Prugna', 18),
(273, 'Alata', 18),
(274, 'Sartène', 18),
(275, 'Biguglia', 18),
(276, 'Borgo', 18),
(277, 'Ghisonaccia', 18);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
