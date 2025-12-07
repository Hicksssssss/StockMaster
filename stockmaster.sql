-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : dim. 07 déc. 2025 à 13:00
-- Version du serveur : 5.7.24
-- Version de PHP : 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `stockmaster`
--

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

CREATE TABLE `billing` (
  `item_number` varchar(255) NOT NULL,
  `quantity` int(25) NOT NULL,
  `price` double(50,2) NOT NULL,
  `total_amount` double(50,2) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `PhoneNumber` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`id`, `Name`, `PhoneNumber`) VALUES
(24, 'Oscar\r\n', '0661438616'),
(23, 'Zhang\r\n', '0689475222'),
(25, 'arthur', '0743583812'),
(28, 'test ', 'zaza');

-- --------------------------------------------------------

--
-- Structure de la table `inv_seq`
--

CREATE TABLE `inv_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `inv_seq`
--

INSERT INTO `inv_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(3001, 1, 99999999999999, 1, 1, 1000, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `item_number` varchar(255) NOT NULL,
  `item_group` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(50,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `item_number`, `item_group`, `quantity`, `price`) VALUES
(1, 'AX123456', 'Shirts ', 60, 700.00),
(2, 'BX123456', 'Shirts', 100, 300.00),
(3, 'ZX123456', 'Shirts', 40, 800.00);

-- --------------------------------------------------------

--
-- Structure de la table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `shop and address` varchar(1000) NOT NULL,
  `total_items` int(50) NOT NULL,
  `total_amount` double(50,2) NOT NULL,
  `date_of_purchase` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `purchase`
--

INSERT INTO `purchase` (`id`, `invoice`, `shop and address`, `total_items`, `total_amount`, `date_of_purchase`) VALUES
(1, '123XB123', '23 avenue du sdah paris 75014', 50, 200000.00, '06/12/2025'),
(2, 'babab', '45 rue du general de gaulle', 100, 100000.00, '05/12/2025');

-- --------------------------------------------------------

--
-- Structure de la table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `inv_num` varchar(255) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `price` double(50,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_amount` double(50,2) NOT NULL,
  `date` varchar(255) NOT NULL,
  `item_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `sales`
--

INSERT INTO `sales` (`id`, `inv_num`, `cust_id`, `price`, `quantity`, `total_amount`, `date`, `item_number`) VALUES
(28, 'INV-1', 23, 700.00, 4, 2800.00, '2023-06-03', 'AX123456'),
(29, 'INV-1', 23, 800.00, 2, 1600.00, '2023-06-03', 'ZX123456'),
(30, 'INV-2', 24, 700.00, 4, 2800.00, '2023-06-03', 'AX123456'),
(31, 'INV-3', 25, 900.00, 2, 1800.00, '2023-06-03', 'AX123456'),
(32, 'INV-3', 25, 800.00, 1, 800.00, '2023-06-03', 'ZX123456'),
(33, 'INV-4', 23, 700.00, 2, 1400.00, '2023-06-04', 'AX123456'),
(34, 'INV-5', 23, 300.00, 2, 600.00, '2023-06-04', 'BX123456');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`PhoneNumber`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
