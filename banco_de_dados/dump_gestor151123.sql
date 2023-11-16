-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 16-Nov-2023 às 21:42
-- Versão do servidor: 5.6.13
-- versão do PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `sistema`
--
CREATE DATABASE IF NOT EXISTS `sistema` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sistema`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bills`
--

CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) NOT NULL DEFAULT '0',
  `id_supplier` int(11) NOT NULL DEFAULT '0',
  `type_movement` varchar(1) DEFAULT 'O',
  `amount` decimal(10,2) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_unit_id` (`unit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `books`
--

INSERT INTO `books` (`id`, `title`, `price`, `unit_id`) VALUES
(1, 'A menina que roubava livros', '45.90', 1),
(2, 'Diario de um banana', '32.90', 1),
(3, 'Crepusculo', '29.90', 1),
(4, 'A lista de Schindler', '37.90', 2),
(5, 'A teoria de tudo', '42.90', 2),
(6, 'O guia do mochileiro das galáxias', '46.90', 1),
(7, 'Java: Como Programar ?', '199.90', 3),
(8, 'Redes de Computadores - Tanembaum', '85.99', 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `books_by_units`
--
CREATE TABLE IF NOT EXISTS `books_by_units` (
`id` int(11)
,`title` varchar(100)
,`price` decimal(8,2)
,`city` varchar(50)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `cart_items`
--

CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `total_value` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_product_cart` (`id_product`),
  KEY `fk_id_order_cart` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Teste', 'Categoria de teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `salary` decimal(10,0) NOT NULL,
  `date_admission` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `job` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `installments`
--

CREATE TABLE IF NOT EXISTS `installments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) NOT NULL DEFAULT 'P',
  `due_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_order` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL DEFAULT '0',
  `id_supplier` int(11) NOT NULL DEFAULT '0',
  `total` decimal(10,2) NOT NULL,
  `doc` varchar(5) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'O',
  PRIMARY KEY (`id`),
  KEY `fk_installments_id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` char(1) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `payment_method` char(2) DEFAULT NULL,
  `quant_installments` int(11) NOT NULL DEFAULT '1',
  `id_customer` int(11) NOT NULL DEFAULT '0',
  `id_supplier` int(11) NOT NULL DEFAULT '0',
  `id_employee` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ID_EMPLOYEE` (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `inventory` decimal(10,0) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ID_SUPPLIER` (`id_supplier`),
  KEY `FK_ID_CATEGORY` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `units`
--

CREATE TABLE IF NOT EXISTS `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `state` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `units`
--

INSERT INTO `units` (`id`, `city`, `state`) VALUES
(1, 'Porto Alegre', 'RS'),
(2, 'Canoas', 'RS'),
(3, 'Novo Hamburgo', 'RS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `user_password` varchar(16) NOT NULL,
  `role` varchar(16) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for view `books_by_units`
--
DROP TABLE IF EXISTS `books_by_units`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `books_by_units` AS select `b`.`id` AS `id`,`b`.`title` AS `title`,`b`.`price` AS `price`,`u`.`city` AS `city` from (`books` `b` join `units` `u`) where (`b`.`unit_id` = `u`.`id`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Limitadores para a tabela `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `fk_id_order_cart` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `fk_id_product_cart` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Limitadores para a tabela `installments`
--
ALTER TABLE `installments`
  ADD CONSTRAINT `fk_installments_id_order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`);

--
-- Limitadores para a tabela `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_ID_EMPLOYEE` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`);

--
-- Limitadores para a tabela `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_ID_CATEGORY` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `FK_ID_SUPPLIER` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
