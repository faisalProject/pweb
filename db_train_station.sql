-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 08, 2023 at 07:50 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_train_station`
--
CREATE DATABASE IF NOT EXISTS `db_train_station` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_train_station`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_m_ticket`
--

DROP TABLE IF EXISTS `tbl_m_ticket`;
CREATE TABLE `tbl_m_ticket` (
  `id_tmt` int(11) NOT NULL,
  `kd_ticket_tmt` varchar(50) NOT NULL,
  `route_ticket_tmt` varchar(10) NOT NULL,
  `status_deactive_tmt` tinyint(4) NOT NULL DEFAULT 0,
  `status_deleted_tmt` tinyint(4) NOT NULL DEFAULT 0,
  `created_by_tmt` int(11) NOT NULL,
  `created_date_tmt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by_tmt` int(11) DEFAULT NULL,
  `updated_date_tmt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_m_train`
--

DROP TABLE IF EXISTS `tbl_m_train`;
CREATE TABLE `tbl_m_train` (
  `id_tmtr` int(11) NOT NULL,
  `kd_train_tmtr` int(11) NOT NULL,
  `class_train_tmtr` varchar(25) NOT NULL,
  `status_deactive_tmtr` tinyint(4) NOT NULL DEFAULT 0,
  `status_deleted_tmtr` tinyint(4) NOT NULL DEFAULT 0,
  `created_by_tmtr` int(11) NOT NULL,
  `created_date_tmtr` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by_tmtr` int(11) DEFAULT NULL,
  `updated_date_tmtr` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_m_user`
--

DROP TABLE IF EXISTS `tbl_m_user`;
CREATE TABLE `tbl_m_user` (
  `id_tmu` int(11) NOT NULL,
  `nik_tmu` int(20) NOT NULL,
  `name_tmu` varchar(50) NOT NULL,
  `address_tmu` varchar(225) NOT NULL,
  `gender_tmu` enum('LAKI-LAKI','PEREMPUAN') NOT NULL,
  `username_tmu` varchar(75) NOT NULL,
  `password_tmu` varchar(500) NOT NULL,
  `status_deactived_tmu` tinyint(4) NOT NULL DEFAULT 0,
  `status_deleted_tmu` tinyint(4) NOT NULL DEFAULT 0,
  `created_by_tmu` int(11) NOT NULL,
  `created_date_tmu` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by_tmu` int(11) DEFAULT NULL,
  `updated_date_tmu` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_m_user`
--

INSERT INTO `tbl_m_user` (`id_tmu`, `nik_tmu`, `name_tmu`, `address_tmu`, `gender_tmu`, `username_tmu`, `password_tmu`, `status_deactived_tmu`, `status_deleted_tmu`, `created_by_tmu`, `created_date_tmu`, `updated_by_tmu`, `updated_date_tmu`) VALUES
(1, 1452564, 'Iman Sanjaya', 'Karawang', 'LAKI-LAKI', 'iman.sanjaya@ubpkarawang.ac.id', '123456', 0, 0, 1, '2023-11-08 02:23:28', NULL, NULL),
(2, 1452574, 'Aditya Pratama', 'Cilamaya', 'LAKI-LAKI', 'adit@ubpkarawang.ac.id', '123456', 0, 0, 1, '2023-11-08 02:24:12', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_t_buy_ticket`
--

DROP TABLE IF EXISTS `tbl_t_buy_ticket`;
CREATE TABLE `tbl_t_buy_ticket` (
  `id_ttbt` int(11) NOT NULL,
  `id_ttt` int(11) NOT NULL,
  `id_tmu` int(11) NOT NULL,
  `date_buy_ttbt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_t_refund_ticket`
--

DROP TABLE IF EXISTS `tbl_t_refund_ticket`;
CREATE TABLE `tbl_t_refund_ticket` (
  `id_ttrt` int(11) NOT NULL,
  `id_ttbt` int(11) NOT NULL,
  `amount_refund_ttrt` int(11) NOT NULL,
  `date_refund_ttrt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_t_ticket`
--

DROP TABLE IF EXISTS `tbl_t_ticket`;
CREATE TABLE `tbl_t_ticket` (
  `id_ttt` int(11) NOT NULL,
  `id_tmt` int(11) NOT NULL,
  `id_tmtr` int(11) NOT NULL,
  `price_ticket_ttt` int(11) NOT NULL,
  `stock_ticket_ttt` int(11) NOT NULL,
  `for_date_ttt` date NOT NULL,
  `status_deactived_ttt` tinyint(4) NOT NULL DEFAULT 0,
  `status_deleted_ttt` tinyint(4) NOT NULL DEFAULT 0,
  `created_by_ttt` int(11) NOT NULL,
  `created_date_ttt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by_ttt` int(11) DEFAULT NULL,
  `updated_date_ttt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_m_ticket`
--
ALTER TABLE `tbl_m_ticket`
  ADD PRIMARY KEY (`id_tmt`);

--
-- Indexes for table `tbl_m_train`
--
ALTER TABLE `tbl_m_train`
  ADD PRIMARY KEY (`id_tmtr`);

--
-- Indexes for table `tbl_m_user`
--
ALTER TABLE `tbl_m_user`
  ADD PRIMARY KEY (`id_tmu`);

--
-- Indexes for table `tbl_t_buy_ticket`
--
ALTER TABLE `tbl_t_buy_ticket`
  ADD PRIMARY KEY (`id_ttbt`),
  ADD KEY `id_ttt` (`id_ttt`),
  ADD KEY `id_tmu` (`id_tmu`);

--
-- Indexes for table `tbl_t_refund_ticket`
--
ALTER TABLE `tbl_t_refund_ticket`
  ADD PRIMARY KEY (`id_ttrt`),
  ADD KEY `id_ttbt` (`id_ttbt`);

--
-- Indexes for table `tbl_t_ticket`
--
ALTER TABLE `tbl_t_ticket`
  ADD PRIMARY KEY (`id_ttt`),
  ADD KEY `id_tmt` (`id_tmt`),
  ADD KEY `id_tmtr` (`id_tmtr`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_m_ticket`
--
ALTER TABLE `tbl_m_ticket`
  MODIFY `id_tmt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_m_train`
--
ALTER TABLE `tbl_m_train`
  MODIFY `id_tmtr` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_m_user`
--
ALTER TABLE `tbl_m_user`
  MODIFY `id_tmu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_t_buy_ticket`
--
ALTER TABLE `tbl_t_buy_ticket`
  MODIFY `id_ttbt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_t_refund_ticket`
--
ALTER TABLE `tbl_t_refund_ticket`
  MODIFY `id_ttrt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_t_ticket`
--
ALTER TABLE `tbl_t_ticket`
  MODIFY `id_ttt` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_t_buy_ticket`
--
ALTER TABLE `tbl_t_buy_ticket`
  ADD CONSTRAINT `tbl_t_buy_ticket_ibfk_1` FOREIGN KEY (`id_ttt`) REFERENCES `tbl_t_ticket` (`id_ttt`),
  ADD CONSTRAINT `tbl_t_buy_ticket_ibfk_2` FOREIGN KEY (`id_tmu`) REFERENCES `tbl_m_user` (`id_tmu`);

--
-- Constraints for table `tbl_t_refund_ticket`
--
ALTER TABLE `tbl_t_refund_ticket`
  ADD CONSTRAINT `tbl_t_refund_ticket_ibfk_1` FOREIGN KEY (`id_ttbt`) REFERENCES `tbl_t_buy_ticket` (`id_ttbt`);

--
-- Constraints for table `tbl_t_ticket`
--
ALTER TABLE `tbl_t_ticket`
  ADD CONSTRAINT `tbl_t_ticket_ibfk_1` FOREIGN KEY (`id_tmt`) REFERENCES `tbl_m_ticket` (`id_tmt`),
  ADD CONSTRAINT `tbl_t_ticket_ibfk_2` FOREIGN KEY (`id_tmtr`) REFERENCES `tbl_m_train` (`id_tmtr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
