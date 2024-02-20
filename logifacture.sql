-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 20 fév. 2024 à 17:24
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
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(72, 'Can view session', 18, 'view_session');

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
(1, 'pbkdf2_sha256$720000$L9OfSLjrrtrmsCz9Bvr0Ob$q0NzEsSPogbNSVFOCx7xak7Tes6Z6lzycAS94fugZsg=', '2024-02-20 16:25:43.636406', 1, 'avakissara', '', '', 'avakissara@gmail.com', 1, 1, '2024-02-11 16:16:47.276797'),
(2, 'pbkdf2_sha256$720000$IcWvYhBPnpofaajnHp8yHm$Lry+tRtx2l9S2DHmnEaALYKPwgbOzBujcbOv1Rh2u7I=', '2024-02-20 16:25:19.209813', 0, 'syntenera', '', '', 'lilabadi06@gmail.com', 0, 1, '2024-02-20 12:24:04.000000'),
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cat_facture`
--

INSERT INTO `cat_facture` (`id_cat_facture`, `nom_cat_facture`) VALUES
(1, 'Achat de biens'),
(6, 'Vente de biens');

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
  PRIMARY KEY (`id_client`),
  KEY `Client_siret_client_b854bf92` (`siret_client`),
  KEY `Client_civilite_id_3da0032f` (`civilite_id`),
  KEY `Client_ville_id_a92145cb` (`ville_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `r_social_client`, `siret_client`, `nom_client`, `prenom_client`, `adr_client`, `adr2_client`, `tel_client`, `mail_client`, `civilite_id`, `ville_id`) VALUES
(1, 'decadence', '12345', 'badi', 'lila', '1 rue albert marmotte', 'none', 12345, 'T@gam.com', 1, 1),
(2, 'pickachup\'', '98765', 'pika', 'chu', '1 rue fatal foudre', 'none', 999999, 'pc@mail.com', 2, 1),
(3, NULL, NULL, 'tonton', 'david', '37 rue du doudou', 'none', 333111111, NULL, 2, 1),
(4, NULL, NULL, 'hulk', 'hoggan', '37 av tournesol fané', 'none', 666666, NULL, 2, 1),
(5, 'test', '9865430927', 'toto', 'georges', '3 av cercle vicieux', 'none', 675423, 'hj@mail.com', 2, 1);

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
('06000', 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `devise`
--

INSERT INTO `devise` (`id_devise`, `nom_devise`, `abbr_devise`, `symb_devise`) VALUES
(1, 'euro', 'eur', '€'),
(2, 'dollar américain', 'usd', '$');

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
(43, '2024-02-20 16:34:16.952092', '5', 'toto georges', 2, '[{\"changed\": {\"fields\": [\"Adr client\"]}}]', 6, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(18, 'sessions', 'session');

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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(23, 'logifacturapp', '0005_alter_facture_user', '2024-02-20 13:19:16.483696');

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
('vxo9y47ezdf684xkwl3hoegqz3q34a76', '.eJxVjMEOgjAQRP-lZ9O07FKKR-98Q7PdbS1qIKFwMv67kHDQ22Tem3mrQNtawlbTEkZRV2XV5beLxM80HUAeNN1nzfO0LmPUh6JPWvUwS3rdTvfvoFAt-7rrXC8syTR2D5QtCwJ6jmAAfEZunUGw2DOCd9lTTzm2JktujANA9fkC2yU3dQ:1rcSwB:snI2PX3Rk96QYeFoAXod8_P2MpJp2o-QriWTsEbnzCs', '2024-03-05 16:25:43.637404');

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
  KEY `Facture_num_facture_406339fd` (`num_facture`),
  KEY `Facture_cat_facture_id_c086ba75` (`cat_facture_id`),
  KEY `Facture_client_id_a15b2107` (`client_id`),
  KEY `Facture_devise_id_e9e27a4c` (`devise_id`),
  KEY `Facture_fournisseur_id_1c6a017c` (`fournisseur_id`),
  KEY `Facture_methode_paiement_id_c0c2247f` (`methode_paiement_id`),
  KEY `FK_Facture_User` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id_facture`, `num_facture`, `date_facture`, `total_ht_facture`, `total_ttc_facture`, `statut_facture`, `cat_facture_id`, `client_id`, `devise_id`, `fournisseur_id`, `methode_paiement_id`, `user_id`) VALUES
(51, 'BS-TT-2024', '2022-02-20', '96.00', '115.20', 0, 6, 4, 1, 3, 2, 1),
(52, 'Test - 888', '2022-02-21', '128.00', '153.60', 0, 1, 5, 1, 3, 1, 1),
(53, 'Test - 455A', '2024-02-20', '128.00', '153.60', 1, 6, 3, 1, 3, 2, 1);

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
  PRIMARY KEY (`id_fourn`),
  KEY `Fournisseur_siret_fourn_84db49aa` (`siret_fourn`),
  KEY `Fournisseur_civilite_id_3ec47cb8` (`civilite_id`),
  KEY `Fournisseur_ville_id_e896334d` (`ville_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id_fourn`, `r_social_fourn`, `siret_fourn`, `nom_fourn`, `prenom_fourn`, `adr_fourn`, `adr2_fourn`, `tel_fourn`, `mail_fourn`, `civilite_id`, `ville_id`) VALUES
(1, 'roublard décadent', '1234', 'Lila', 'Badi', '221 rue terreur nocturne', 'none', 22, 'az@f.com', 1, 1),
(3, 'tata yoyo', '1111111', NULL, NULL, '7 rue du doudou', 'none', 3111111, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `methode_paiement`
--

DROP TABLE IF EXISTS `methode_paiement`;
CREATE TABLE IF NOT EXISTS `methode_paiement` (
  `id_m_paie` int NOT NULL AUTO_INCREMENT,
  `nom_m_paie` varchar(20) NOT NULL,
  PRIMARY KEY (`id_m_paie`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `methode_paiement`
--

INSERT INTO `methode_paiement` (`id_m_paie`, `nom_m_paie`) VALUES
(1, 'espèce'),
(2, 'paypal');

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
('fr', 'france', 33);

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`id_reg`, `nom_reg`, `pays_id`) VALUES
(1, 'provence-alpes-côte-d\'azur', 'fr');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nom_user` varchar(40) NOT NULL,
  `prenom_user` varchar(40) NOT NULL,
  `adr_user` varchar(100) NOT NULL,
  `adr2_user` varchar(100) DEFAULT NULL,
  `tel_user` int DEFAULT NULL,
  `mail_user` varchar(180) NOT NULL,
  `mdp_user` varchar(254) NOT NULL,
  `sel_user` varchar(254) NOT NULL,
  `civilite_id` int NOT NULL,
  `ville_id` int NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `mail_user` (`mail_user`),
  KEY `User_civilite_id_17addae1` (`civilite_id`),
  KEY `User_ville_id_3c2817b3` (`ville_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id_ville`, `nom_ville`, `region_id`) VALUES
(1, 'nice', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
