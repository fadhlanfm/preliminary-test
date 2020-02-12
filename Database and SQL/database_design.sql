-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Feb 2020 pada 13.00
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insertion`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_category`
--

CREATE TABLE `ku_category` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_order`
--

CREATE TABLE `ku_order` (
  `id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `status` int(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_order_detail`
--

CREATE TABLE `ku_order_detail` (
  `id` int(6) NOT NULL,
  `user_location_id` int(6) NOT NULL,
  `order_id` int(6) NOT NULL,
  `product_id` int(6) NOT NULL,
  `quantity` int(6) NOT NULL,
  `delivery_date` date NOT NULL,
  `status` int(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_order_detail_status`
--

CREATE TABLE `ku_order_detail_status` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_order_status`
--

CREATE TABLE `ku_order_status` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_product`
--

CREATE TABLE `ku_product` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `effective_date` date NOT NULL,
  `effective_until` date NOT NULL,
  `photo` varchar(100) NOT NULL,
  `price` decimal(10,1) NOT NULL,
  `status` int(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_product_category`
--

CREATE TABLE `ku_product_category` (
  `id` int(6) NOT NULL,
  `product_id` int(6) NOT NULL,
  `category_id` int(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_product_status`
--

CREATE TABLE `ku_product_status` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_user`
--

CREATE TABLE `ku_user` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `salt` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `status` int(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_user_location`
--

CREATE TABLE `ku_user_location` (
  `id` int(6) NOT NULL,
  `type` int(6) NOT NULL,
  `status` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `location` point NOT NULL,
  `address` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_user_location_status`
--

CREATE TABLE `ku_user_location_status` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_user_location_type`
--

CREATE TABLE `ku_user_location_type` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_user_status`
--

CREATE TABLE `ku_user_status` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ku_category`
--
ALTER TABLE `ku_category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ku_order`
--
ALTER TABLE `ku_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `ku_order_detail`
--
ALTER TABLE `ku_order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_location_id` (`user_location_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `ku_order_detail_status`
--
ALTER TABLE `ku_order_detail_status`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ku_order_status`
--
ALTER TABLE `ku_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ku_product`
--
ALTER TABLE `ku_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `ku_product_category`
--
ALTER TABLE `ku_product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `ku_product_status`
--
ALTER TABLE `ku_product_status`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ku_user`
--
ALTER TABLE `ku_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indeks untuk tabel `ku_user_location`
--
ALTER TABLE `ku_user_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `ku_user_location_status`
--
ALTER TABLE `ku_user_location_status`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ku_user_location_type`
--
ALTER TABLE `ku_user_location_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ku_user_status`
--
ALTER TABLE `ku_user_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `ku_category`
--
ALTER TABLE `ku_category`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ku_order`
--
ALTER TABLE `ku_order`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ku_order_detail`
--
ALTER TABLE `ku_order_detail`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ku_order_detail_status`
--
ALTER TABLE `ku_order_detail_status`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ku_order_status`
--
ALTER TABLE `ku_order_status`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ku_product`
--
ALTER TABLE `ku_product`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ku_product_category`
--
ALTER TABLE `ku_product_category`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ku_product_status`
--
ALTER TABLE `ku_product_status`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ku_user`
--
ALTER TABLE `ku_user`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ku_user_location`
--
ALTER TABLE `ku_user_location`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ku_user_location_status`
--
ALTER TABLE `ku_user_location_status`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ku_user_location_type`
--
ALTER TABLE `ku_user_location_type`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ku_user_status`
--
ALTER TABLE `ku_user_status`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ku_order`
--
ALTER TABLE `ku_order`
  ADD CONSTRAINT `ku_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ku_user` (`id`),
  ADD CONSTRAINT `ku_order_ibfk_2` FOREIGN KEY (`status`) REFERENCES `ku_order_status` (`id`);

--
-- Ketidakleluasaan untuk tabel `ku_order_detail`
--
ALTER TABLE `ku_order_detail`
  ADD CONSTRAINT `ku_order_detail_ibfk_1` FOREIGN KEY (`user_location_id`) REFERENCES `ku_user_location` (`id`),
  ADD CONSTRAINT `ku_order_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `ku_order` (`id`),
  ADD CONSTRAINT `ku_order_detail_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `ku_product` (`id`),
  ADD CONSTRAINT `ku_order_detail_ibfk_4` FOREIGN KEY (`status`) REFERENCES `ku_order_detail_status` (`id`);

--
-- Ketidakleluasaan untuk tabel `ku_product`
--
ALTER TABLE `ku_product`
  ADD CONSTRAINT `ku_product_ibfk_1` FOREIGN KEY (`status`) REFERENCES `ku_product_status` (`id`);

--
-- Ketidakleluasaan untuk tabel `ku_product_category`
--
ALTER TABLE `ku_product_category`
  ADD CONSTRAINT `ku_product_category_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `ku_product` (`id`),
  ADD CONSTRAINT `ku_product_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `ku_category` (`id`);

--
-- Ketidakleluasaan untuk tabel `ku_user`
--
ALTER TABLE `ku_user`
  ADD CONSTRAINT `ku_user_ibfk_1` FOREIGN KEY (`status`) REFERENCES `ku_user_status` (`id`);

--
-- Ketidakleluasaan untuk tabel `ku_user_location`
--
ALTER TABLE `ku_user_location`
  ADD CONSTRAINT `ku_user_location_ibfk_1` FOREIGN KEY (`type`) REFERENCES `ku_user_location_type` (`id`),
  ADD CONSTRAINT `ku_user_location_ibfk_2` FOREIGN KEY (`status`) REFERENCES `ku_user_location_status` (`id`),
  ADD CONSTRAINT `ku_user_location_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `ku_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
