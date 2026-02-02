-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 01 jan. 2026 à 17:49
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET @@time_zone = '+00:00';




/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bibliotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id_categorie`, `nom_categorie`, `description`) VALUES
(1, 'Informatique', 'Livres de programmation et technologie'),
(2, 'Mathématiques', 'Livres de mathématiques et statistiques'),
(3, 'Physique', 'Livres de physique et sciences'),
(4, 'Littérature', 'Romans et littérature générale'),
(5, 'Économie', 'Livres d\'économie et gestion');

-- --------------------------------------------------------

--
-- Structure de la table `emprunts`
--

CREATE TABLE `emprunts` (
  `id_emprunt` int(11) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `cne` varchar(20) NOT NULL,
  `date_emprunt` date NOT NULL,
  `date_retour_prevue` date NOT NULL,
  `date_retour_effective` date DEFAULT NULL,
  `penalite` decimal(10,2) DEFAULT 0.00,
  `statut` enum('EN_COURS','RETOURNE','EN_RETARD') DEFAULT 'EN_COURS'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `emprunts`
--

INSERT INTO `emprunts` (`id_emprunt`, `isbn`, `cne`, `date_emprunt`, `date_retour_prevue`, `date_retour_effective`, `penalite`, `statut`) VALUES
(1, '9780134685991', 'CNE001', '2024-12-01', '2024-12-15', NULL, 0.00, 'EN_COURS'),
(2, '9782070368228', 'CNE002', '2024-12-03', '2024-12-17', NULL, 0.00, 'EN_COURS'),
(3, '9780201633610', 'CNE003', '2024-11-01', '2024-11-15', '2024-11-14', 0.00, 'RETOURNE'),
(4, '9782253006329', 'CNE004', '2024-11-05', '2024-11-19', '2024-11-25', 30.00, 'RETOURNE'),
(5, '9782842450179', 'CNE005', '2024-11-20', '2024-12-04', NULL, 50.00, 'EN_RETARD'),
(6, '9782100804991', 'CNE001', '2024-11-18', '2024-12-02', NULL, 40.00, 'EN_RETARD');

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

CREATE TABLE `etudiants` (
  `cne` varchar(20) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `filiere` varchar(100) DEFAULT NULL,
  `date_inscription` timestamp NOT NULL DEFAULT current_timestamp(),
  `actif` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiants`
--

INSERT INTO `etudiants` (`cne`, `nom`, `prenom`, `email`, `telephone`, `filiere`, `date_inscription`, `actif`) VALUES
('CNE001', 'EL AMRANI', 'Yassine', 'yassine.elamrani@univ.ma', '0600000001', 'Informatique', '2026-01-01 16:48:49', 1),
('CNE002', 'BENALI', 'Sara', 'sara.benali@univ.ma', '0600000002', 'Mathématiques', '2026-01-01 16:48:49', 1),
('CNE003', 'HADDAD', 'Omar', 'omar.haddad@univ.ma', '0600000003', 'Physique', '2026-01-01 16:48:49', 1),
('CNE004', 'EL FASSI', 'Imane', 'imane.elfassi@univ.ma', '0600000004', 'Économie', '2026-01-01 16:48:49', 1),
('CNE005', 'AIT LAHCEN', 'Khalid', 'khalid.aitlahcen@univ.ma', '0600000005', 'Informatique', '2026-01-01 16:48:49', 1);

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `isbn` varchar(20) NOT NULL,
  `titre` varchar(200) NOT NULL,
  `auteur` varchar(150) NOT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `annee_publication` int(11) DEFAULT NULL,
  `nombre_exemplaires` int(11) DEFAULT 1,
  `exemplaires_disponibles` int(11) DEFAULT 1,
  `date_ajout` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`isbn`, `titre`, `auteur`, `id_categorie`, `annee_publication`, `nombre_exemplaires`, `exemplaires_disponibles`, `date_ajout`) VALUES
('1', 'IRISI', 'ZAIATE', 1, 2025, 1, 1, '2026-01-01 12:51:29'),
('9780134685991', 'Effective Java', 'Joshua Bloch', 1, 2018, 5, 3, '2026-01-01 16:48:29'),
('9780201633610', 'Design Patterns', 'Erich Gamma', 1, 1994, 3, 2, '2026-01-01 16:48:29'),
('9781492056270', 'Learning MySQL', 'Seyed Tahaghoghi', 1, 2020, 4, 4, '2026-01-01 16:48:29'),
('9782070368228', 'Les Misérables', 'Victor Hugo', 4, 2012, 7, 6, '2026-01-01 16:48:29'),
('9782100737626', 'Introduction à l’Économie', 'Paul Samuelson', 5, 2017, 5, 5, '2026-01-01 16:48:29'),
('9782100748882', 'Algèbre Linéaire', 'Gilbert Strang', 2, 2016, 5, 4, '2026-01-01 16:48:29'),
('9782100804991', 'Analyse Mathématique', 'Jean Dieudonné', 2, 2015, 6, 6, '2026-01-01 16:48:29'),
('9782253006329', 'L’Étranger', 'Albert Camus', 4, 2011, 6, 4, '2026-01-01 16:48:29'),
('9782842450179', 'Physique Quantique', 'Claude Cohen-Tannoudji', 3, 2014, 4, 3, '2026-01-01 16:48:29');

-- --------------------------------------------------------

--
-- Structure de la table `parametres`
--

CREATE TABLE `parametres` (
  `cle` varchar(50) NOT NULL,
  `valeur` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `parametres`
--

INSERT INTO `parametres` (`cle`, `valeur`, `description`) VALUES
('DUREE_EMPRUNT_JOURS', '14', 'Durée d\'emprunt en jours'),
('MAX_EMPRUNTS_SIMULTANES', '3', 'Nombre maximum d\'emprunts simultanés'),
('PENALITE_PAR_JOUR', '5.00', 'Pénalité en DH par jour de retard');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_statistiques_emprunts`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vue_statistiques_emprunts` (
`isbn` varchar(20)
,`titre` varchar(200)
,`auteur` varchar(150)
,`nom_categorie` varchar(100)
,`nombre_emprunts` bigint(21)
,`emprunts_en_cours` decimal(22,0)
,`emprunts_en_retard` decimal(22,0)
);

-- --------------------------------------------------------

--
-- Structure de la vue `vue_statistiques_emprunts`
--
DROP TABLE IF EXISTS `vue_statistiques_emprunts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_statistiques_emprunts`  AS SELECT `l`.`isbn` AS `isbn`, `l`.`titre` AS `titre`, `l`.`auteur` AS `auteur`, `c`.`nom_categorie` AS `nom_categorie`, count(`e`.`id_emprunt`) AS `nombre_emprunts`, sum(case when `e`.`statut` = 'EN_COURS' then 1 else 0 end) AS `emprunts_en_cours`, sum(case when `e`.`statut` = 'EN_RETARD' then 1 else 0 end) AS `emprunts_en_retard` FROM ((`livres` `l` left join `emprunts` `e` on(`l`.`isbn` = `e`.`isbn`)) left join `categories` `c` on(`l`.`id_categorie` = `c`.`id_categorie`)) GROUP BY `l`.`isbn`, `l`.`titre`, `l`.`auteur`, `c`.`nom_categorie` ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD PRIMARY KEY (`id_emprunt`),
  ADD KEY `isbn` (`isbn`),
  ADD KEY `cne` (`cne`);

--
-- Index pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`cne`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `parametres`
--
ALTER TABLE `parametres`
  ADD PRIMARY KEY (`cle`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `emprunts`
--
ALTER TABLE `emprunts`
  MODIFY `id_emprunt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD CONSTRAINT `emprunts_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `livres` (`isbn`),
  ADD CONSTRAINT `emprunts_ibfk_2` FOREIGN KEY (`cne`) REFERENCES `etudiants` (`cne`);

--
-- Contraintes pour la table `livres`
--
ALTER TABLE `livres`
  ADD CONSTRAINT `livres_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categories` (`id_categorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
