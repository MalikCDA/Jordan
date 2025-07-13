-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 13 juil. 2025 à 10:07
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `jordan_ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `email`, `roles`, `password`) VALUES
(1, 'Admin@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$47shzOVEfgnrllSzdcCEOecWAQV0iM/1/a/upyI6BK5vyOKQe5waG');

-- --------------------------------------------------------

--
-- Structure de la table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE IF NOT EXISTS `cart_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F0FE25274584665A` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cart_item`
--

INSERT INTO `cart_item` (`id`, `product_id`, `quantity`, `session_id`) VALUES
(2, 14, 1, 'r2q7q367jj0sld933jjjamboc8'),
(3, 16, 1, 'r2q7q367jj0sld933jjjamboc8'),
(5, 16, 2, ''),
(6, 14, 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250710174302', '2025-07-10 17:43:33', 163),
('DoctrineMigrations\\Version20250710184010', '2025-07-10 18:40:16', 46);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `model`, `price`, `type`, `quantity`, `image`, `description`, `created_at`) VALUES
(14, 'Air Jordan 1 Retro High OG', 'Chicago', 169.99, 'basket', 13, 'https://m.media-amazon.com/images/I/71Fi4DZJ+1L._AC_UY900_.jpg', 'La légendaire Air Jordan 1 dans sa version Chicago originale. Un classique intemporel avec du cuir premium blanc et rouge.', '2025-07-10 17:47:45'),
(15, 'Air Jordan 4 Retro', 'Black Cat', 199.99, 'basket', 8, 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=400&h=300&fit=crop', 'Air Jordan 4 entièrement noire, surnommée \"Black Cat\". Design épuré et élégant pour un look streetwear parfait.', '2025-07-10 17:47:45'),
(16, 'Air Jordan 11 Retro', 'Bred', 219.99, 'basket', 9, 'https://images.unsplash.com/photo-1600269452121-4f2416e55c28?w=400&h=300&fit=crop', 'La mythique Air Jordan 11 Bred avec son vernis iconique. Portée par Michael Jordan lors de sa victoire en 1996.', '2025-07-10 17:47:45'),
(17, 'Air Jordan 3 Retro', 'White Cement', 189.99, 'basket', 6, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=300&fit=crop', 'Air Jordan 3 White Cement, première chaussure conçue par Tinker Hatfield. Motif éléphant emblématique.', '2025-07-10 17:47:45'),
(18, 'Air Jordan 1 Low', 'Triple White', 89.99, 'basket', 20, 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=400&h=300&fit=crop', 'Version basse de la Air Jordan 1 en coloris entièrement blanc. Parfait pour le quotidien.', '2025-07-10 17:47:45'),
(19, 'Air Jordan 6 Retro', 'Infrared', 199.99, 'basket', 0, 'https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?w=400&h=300&fit=crop', 'Air Jordan 6 Infrared, modèle porté par MJ lors de son premier titre NBA. Accents rouge infrarouge distinctifs.', '2025-07-10 17:47:45'),
(20, 'Jordan T-Shirt', 'Jumpman Logo', 34.99, 'vêtement', 25, 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=300&fit=crop', 'T-shirt Jordan classique avec le logo Jumpman emblématique. Coton premium pour un confort optimal.', '2025-07-10 17:47:45'),
(21, 'Jordan Hoodie', 'Flight Essentials', 79.99, 'vêtement', 18, 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400&h=300&fit=crop', 'Sweat à capuche Jordan Flight Essentials. Molleton brossé pour une chaleur et un confort durables.', '2025-07-10 17:47:45'),
(22, 'Jordan Short', 'Jumpman Diamond', 49.99, 'vêtement', 22, 'https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=400&h=300&fit=crop', 'Short Jordan Jumpman Diamond. Tissu léger et respirant, parfait pour le sport et le streetwear.', '2025-07-10 17:47:45'),
(23, 'Jordan Tracksuit', 'Jumpman Air', 129.99, 'vêtement', 10, 'https://images.unsplash.com/photo-1556906781-9a412961c28c?w=400&h=300&fit=crop', 'Ensemble de survêtement Jordan Jumpman Air. Design moderne avec détails rétro-inspirés.', '2025-07-10 17:47:45'),
(24, 'Jordan Cap', 'Jumpman Snapback', 29.99, 'vêtement', 30, 'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=400&h=300&fit=crop', 'Casquette Jordan Jumpman Snapback. Broderie premium du logo Jumpman sur le devant.', '2025-07-10 17:47:45'),
(25, 'Jordan Jacket', 'Flight Heritage', 159.99, 'vêtement', 7, 'https://i.ebayimg.com/00/s/MTYwMFgxNjAw/z/nfwAAOSw3Mhla40k/$_57.JPG?set_id=880000500F', 'Veste Jordan Flight Heritage. Style vintage avec technologies modernes pour un look authentique.', '2025-07-10 17:47:45'),
(26, 'Jordan Tank Top', 'Dri-FIT', 39.99, 'vêtement', 0, 'https://images.unsplash.com/photo-1503341504253-dff4815485f1?w=400&h=300&fit=crop', 'Débardeur Jordan Dri-FIT. Technologie d\'évacuation de l\'humidité pour des performances optimales.', '2025-07-10 17:47:45');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`) VALUES
(1, 'Malik@gmail.com', '[\"ROLE_USER\"]', '$2y$13$byKC6qL53X8ctFhB4FmhdO9YYTa08FPLHEyFOqs/A74TphI55Bgae', 'Malik');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `FK_F0FE25274584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
