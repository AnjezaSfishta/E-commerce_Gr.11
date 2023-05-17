-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Mar 16, 2023 at 02:05 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(2, 'Food'),
(3, 'Drinks'),
(4, 'pizza');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_data` text NOT NULL,
  `notes` text DEFAULT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `customer_data`, `notes`, `total`) VALUES
(3, 3, 'Anjeza sfishta<br />121323<br />anjeza.sfishta@gmail.com<br />Ukshin Hoti', 'sadasd', 4),
(4, 3, 'Anila Luta<br />121323<br />Anila.Luta@gmail.com<br />Ukshin Hoti', '., ,. lkmkl;m', 15),
(5, 2, 'Anjeza sfishta<br />121323<br />anjeza.sfishta@gmail.com<br />Ukshin Hoti', 'ASAP', 25),
(6, 2, 'Anjeza sfishta<br />121323<br />anjeza.sfishta@gmail.com<br />Ukshin Hoti', 'asap', 4.11);

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `order_id` int(11) DEFAULT NULL,
  `products_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`order_id`, `products_id`) VALUES
(NULL, 13),
(3, 14),
(4, 15),
(5, 15),
(6, 11);

-- --------------------------------------------------------

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `image` varchar(150) DEFAULT 'noimage.png',
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `name`, `price`, `qty`, `discount`, `description`, `image`, `category_id`) VALUES
(11, 1, 'Karrige', 99.9, 10, 0, 'Karrige Sense7', '1684243735karrige sense7.jpg', 3),
(12, 1, 'Kufje', 89.5, 10, 10, 'Kufje HyperX Cloud II, të zeza të hirta', '1684247600Kufje HyperX Cloud II, të zeza hirta 89.50 euro.jpg', 4),
(13, 1, 'Dëgjuese Canyon TWS-1', 78.5, 5, 2, 'Dëgjuese Canyon TWS-1, të zeza ', '1684247640Dëgjuese Canyon TWS-1, të zeza 22.504.jpg', 4),
(14, 1, 'Monitor Acer Nitro, i zi', 99, 12, 10, 'Monitor Acer Nitro, i zi', '1684247666Monitor Acer Nitro ,i zi 639.50.jpg', 4),
(15, 1, 'Tastierë SteelSeries Apex 3 TKL, US', 120.35, 7, 20, 'Tastierë SteelSeries Apex 3, TKL, US', '1684244752Tastierë SteelSeries Apex 3 TKL, US, e zezë.jpg', 4),
(16, 1, 'Mbajtëse Satechi Dual Vertical për MacBook Pro dhe iPad', 67, 3, 0, 'Mbajtëse Satechi Dual Vertical për MacBook Pro dhe iPad', '1684247707Mbajtëse Satechi Dual Vertical për MacBook Pro dhe iPad, e hirtë 67 euro.jpg', 4),
(17, 1, 'Laptop Victus by HP ', 98, 2, -1, 'Laptop Victus by HP 816.50', '1684245088Laptop Victus by HP 816.50.jpg', 2),
(18, 1, 'Monitor Samsung Odyssey', 135.55, 1, 2, 'Monitor Samsung Odyssey G32AFull HD', '1684247735Monitor Samsung Odyssey G32AFull HD 169.50.jpg', 4),
(19, 1, 'Laptop Dell G15', 1578, 6, 3, 'Laptop Dell G15 (5525), AMD Ryzen', '1684247768Laptop Dell G15 (5525), AMD Ryzen 7 1,578 euro.jpg', 2),
(20, 1, 'Laptop Lenovo Legion 5 ', 1461.99, 3, 4, 'Laptop Lenovo Legion 5 17ACH6H, 17.3', '1684247788Laptop Lenovo Legion 5 17ACH6H, 17.3 1,461 euro.jpg', 2),
(21, 1, 'Karrige SENSE7 Spellcaster, e zezë', 325, 1, 11, 'Karrige SENSE7 Spellcaster, e zezë', '1684247813Karrige SENSE7 Spellcaster, e zezë.jpg', 3),
(22, 1, 'Karrige DXRacer Formula, e zezë', 421.3, 3, 5, 'Karrige DXRacer Formula, e zezë gjelbër', '1684246952Karrige DXRacer Formula , e zezë gjelbërt.jpg', 3);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products_user_idx` (`user_id`),
  ADD KEY `fk_products_categories_idx` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_products_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;


-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `image` varchar(255) NOT NULL DEFAULT 'noimage.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `title`, `subtitle`, `is_active`, `image`) VALUES
(4, 'Samsung HQ TV', 'Bota reale ne ekranin tuaj', 1, '1678837242TV.jpg'),
(6, 'ASUS Rog Strike 500', 'Best gaming laptop of 2023', 1, '16788381951678131699mb_d-KS-1678094748.jpg'),
(7, 'Karrige per gamera', 'Karrige komode nga brendi i ASUS', 0, '16788383571678131832mb-d-1677936208.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT 'avatar.png',
  `role` varchar(45) DEFAULT ' customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `email`, `password`, `address`, `phone`, `avatar`, `role`) VALUES
(1, 'Arlind', 'Nimani', 'arlind.nimani@gmail.com', 'a.n8', '123456', '045267671', 'avatar.png', '1'),
(2, 'Anjeza', 'sfishta', 'anjeza.sfishta@gmail.com', '$2y$10$pwLvO8W9U92JTtNuZxIc2uNN.DeF9AKPcy33iAw76oQYyX4YKne7q', NULL, NULL, 'avatar.png', 'customer'),
(3, 'Anila', 'Luta', 'Anila.Luta@gmail.com', '$2y$10$jidJg60wEivVN/CusgxebOxxuYLncDasXEC2Fd6KTnwDCwEw052ZG', 'Ukshin Hoti 10000', '045545454', '1678971298images.jpg', ' customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_users_idx` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD KEY `fk_op_orders_idx` (`order_id`),
  ADD KEY `fk_op_products_idx` (`products_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products_user_idx` (`user_id`),
  ADD KEY `fk_products_categories_idx` (`category_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `fk_op_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_op_products` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_products_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE TABLE questions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  question TEXT,
  answered TINYINT DEFAULT 0,
  answer TEXT
);
