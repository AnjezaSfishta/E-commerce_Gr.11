-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 20, 2023 at 10:18 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

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
(5, 'Karrige'),
(6, 'Kufje'),
(7, 'Monitor'),
(8, 'Tastierë'),
(9, 'Laptop'),
(10, 'Mbajtëse');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `created_at`) VALUES
(1, 'Hello', 'hi', '2023-05-16 15:36:24'),
(2, 'Hello', 'hi', '2023-05-17 01:51:08');

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
(7, 4, 'Anjeza<br />049891848<br />anjezasfishta@gmail.com<br />Podujeve', 'hello', 1),
(8, 4, 'Anjeza<br />045894832<br />anjezasfishta@gmail.com<br />hahj', 'jaajja', 11),
(9, 4, 'Arlind<br />049893828<br />anjezasfishta@gmail.com<br />podujeve', 'hello', 0),
(10, 4, 'Anjeza<br />049043945<br />anjezasfishta@gmail.com<br />hxbcnjkm', 'nmz,xc', 2.74),
(11, 4, 'Anjeza<br />049891848<br />anjezasfishta@gmail.com<br />Podujeve', 'hello', 1),
(12, 5, 'Blerona Jashanica<br />0456736281<br />blerona12@gmail.com<br />hello', 'hi', 1),
(13, 5, 'Blerona Jashanica<br />0456736281<br />blerona12@gmail.com<br />hello', 'hi', 0),
(14, 4, 'nmm<br />nm<br />nm@hj<br />nkm', '', 1);

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
(NULL, NULL),
(NULL, NULL),
(NULL, NULL),
(NULL, NULL),
(NULL, NULL),
(7, NULL),
(8, NULL),
(8, NULL),
(10, NULL),
(11, NULL),
(12, NULL),
(14, NULL);

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
(11, 4, 'Karrige', 99.9, 10, 0, 'Karrige Sense7', '1684243735karrige sense7.jpg', 5),
(12, 4, 'Kufje', 89.5, 10, 10, 'Kufje HyperX Cloud II, të zeza të hirta', '1684247600Kufje HyperX Cloud II, të zeza hirta 89.50 euro.jpg', 6),
(13, 4, 'Dëgjuese Canyon TWS-1', 78.5, 5, 2, 'Dëgjuese Canyon TWS-1, të zeza ', '1684247640Dëgjuese Canyon TWS-1, të zeza 22.504.jpg', 6),
(14, 4, 'Monitor Acer Nitro, i zi', 99, 12, 10, 'Monitor Acer Nitro, i zi', '1684247666Monitor Acer Nitro ,i zi 639.50.jpg', 7),
(15, 4, 'Tastierë SteelSeries Apex 3 TKL, US', 120.35, 7, 20, 'Tastierë SteelSeries Apex 3, TKL, US', '1684244752Tastierë SteelSeries Apex 3 TKL, US, e zezë.jpg', 8),
(16, 4, 'Mbajtëse Satechi Dual Vertical për MacBook Pro dhe iPad', 67, 3, 0, 'Mbajtëse Satechi Dual Vertical për MacBook Pro dhe iPad', '1684247707Mbajtëse Satechi Dual Vertical për MacBook Pro dhe iPad, e hirtë 67 euro.jpg', 10),
(17, 4, 'Laptop Victus by HP ', 98, 2, -1, 'Laptop Victus by HP 816.50', '1684245088Laptop Victus by HP 816.50.jpg', 9),
(18, 4, 'Monitor Samsung Odyssey', 135.55, 1, 2, 'Monitor Samsung Odyssey G32AFull HD', '1684247735Monitor Samsung Odyssey G32AFull HD 169.50.jpg', 7),
(19, 4, 'Laptop Dell G15', 1578, 6, 3, 'Laptop Dell G15 (5525), AMD Ryzen', '1684247768Laptop Dell G15 (5525), AMD Ryzen 7 1,578 euro.jpg', 9),
(20, 4, 'Laptop Lenovo Legion 5 ', 1461.99, 3, 4, 'Laptop Lenovo Legion 5 17ACH6H, 17.3', '1684247788Laptop Lenovo Legion 5 17ACH6H, 17.3 1,461 euro.jpg', 9),
(21, 4, 'Karrige SENSE7 Spellcaster, e zezë', 325, 1, 11, 'Karrige SENSE7 Spellcaster, e zezë', '1684247813Karrige SENSE7 Spellcaster, e zezë.jpg', 5),
(22, 4, 'Karrige DXRacer Formula, e zezë', 421.3, 3, 5, 'Karrige DXRacer Formula, e zezë gjelbër', '1684246952Karrige DXRacer Formula , e zezë gjelbërt.jpg', 5);

-- --------------------------------------------------------

--
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
(22, 'Samusung HQ TV', 'Bota reale ne ekranin tuaj', 0, '16843540031678837242TV.jpg'),
(23, 'Karrike per gamera', 'Karrige komode nga brendi i ASUS', 1, '168435401716788383571678131832mb-d-1677936208.jpg'),
(26, 'ASUS ROG Strike 500', 'Best gaming laptop of 2023', 0, '168435663516788381951678131699mb_d-KS-1678094748.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` text DEFAULT NULL,
  `answered` tinyint(4) DEFAULT 0,
  `answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `answered`, `answer`) VALUES
(1, 'Hello how are you ', 1, 'Hello good '),
(2, 'hellp', 1, 'hi good '),
(3, 'hello how are you ', 1, 'good'),
(4, 'Hej si po kaloni ', 1, 'Mire'),
(5, 'How can I order', 1, 'You can order when you select products'),
(6, 'How can i see what i order?', 0, NULL),
(7, 'Can i have 2 or 3 products in my cart?', 0, NULL),
(8, 'How to  return products ', 0, NULL),
(9, 'Can i see product?', 1, 'Yes');

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
(4, 'Anjeza', '', 'anjezasfishta@gmail.com', '$2y$10$DadOiKHD3GayZPg/CYOByuFI5UDcKyCglHCoZVt8oWDdbXdT9q1Ay', NULL, NULL, 'avatar.png', '1'),
(5, 'Blerona', 'Jashanica', 'blerona12@gmail.com', '$2y$10$fdbr6isntytVhE50nCrwbu/L.ViCm2Lmt/Nfjb3QS/rkYN5BPRNom', NULL, NULL, 'avatar.png', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
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
-- Indexes for table `questions`
--
ALTER TABLE `questions`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
