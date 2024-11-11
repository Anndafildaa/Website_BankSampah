-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2024 at 03:48 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pilah_cantik`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_telepon` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nama`, `email`, `password`, `no_telepon`, `created_at`) VALUES
(1, 'admin1    ', 'admin1@gmail.com', 'admin1', '085273129962', '2024-06-18 10:12:13'),
(2, 'admin2  ', 'admin2@gmail.com', 'admin2', '085139886871', '2024-10-15 15:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_telepon` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT 0.00,
  `sampah` int(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`id`, `nama`, `alamat`, `no_telepon`, `email`, `saldo`, `sampah`, `created_at`, `password`) VALUES
(1, 'Filda Dwi', 'Perum IkIP Gunung Anyar', '085231456789', 'fildaaaa@gamil.com', 145000.00, 25, '2024-06-19 07:01:43', 'filda12'),
(2, 'Anisa Putri', 'Jemur Sari Timur 24', '087852389915', 'anisaputri@gmail.com', 100000.00, 25, '2024-10-15 15:16:38', 'anisa123'),
(3, 'Azka Ramaditya', 'Medokan Sawah Blok E-18', '085214156798', 'azkarama@gmail.com', 101000.00, 14, '2024-10-15 15:17:42', 'azkarama'),
(4, 'Ririna Sari', 'Medokan Asri Barat 26', '085711456277', 'ririnsari@gmail.com', 206000.00, 35, '2024-10-15 15:19:31', 'ririni'),
(5, 'Hanah Syah', 'Rungkut Asri timur X-12', '085166289315', 'hanahsyah@gmail.com', 56000.00, 10, '2024-10-15 15:21:08', 'hanahehe'),
(6, 'Fajar', 'Perum Wiguna Blok C-09', '087355108282', 'Fajarmaulana12@gmail.com', 0.00, 0, '2024-10-22 18:13:49', 'ibnufajar');

-- --------------------------------------------------------

--
-- Table structure for table `sampah`
--

CREATE TABLE `sampah` (
  `id` int(11) NOT NULL,
  `jenis_sampah` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `satuan` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sampah`
--

INSERT INTO `sampah` (`id`, `jenis_sampah`, `deskripsi`, `gambar`, `harga`, `satuan`, `created_at`) VALUES
(1, 'Plastik ', 'Limbah plastik dari berbagai jenis, termasuk plastik kemasan, botol, kantong, dan jenis plastik lainnya yang dapat didaur ulang. Pastikan sampah plastik dalam kondisi bersih sebelum disetorkan untuk menjaga kualitas dan mendukung proses daur ulang.', 'sampah_plastik.png', 6000.00, 'KG', '2024-06-19 10:27:03'),
(3, 'Minyak Jelantah   ', 'Limbah minyak jelantaMinyak jelantah yang sudah digunakan untuk menggoreng berbagai jenis makanan. Pastikan minyak dalam keadaan dingin dan disaring dari sisa makanan sebelum disetorkan.', 'sampah_minyak.jpg', 8000.00, 'LT', '2024-10-14 07:36:07'),
(5, 'Kertas     ', 'Limbah Kertas Kertas bekas dari berbagai jenis, seperti kertas HVS, koran, majalah, kardus, dan kertas cetak lainnya. Pastikan kertas dalam keadaan kering, bersih, dan tidak tercampur dengan bahan lain seperti plastik atau logam.Apapun', 'sampah_kertas.jpg', 6000.00, 'KG', '2024-10-14 07:38:06'),
(6, 'Kaca ', 'Kaca bekas dari berbagai jenis, seperti botol kaca, pecahan kaca jendela, dan wadah kaca lainnya. Pastikan kaca dalam keadaan bersih dan terpisah dari bahan lain seperti plastik atau logam. Pecahan kaca harus dibungkus dengan aman untuk mencegah cedera.', 'sampah_kaca.jpg', 7000.00, 'KG', '2024-10-15 15:11:43');

-- --------------------------------------------------------

--
-- Table structure for table `setor`
--

CREATE TABLE `setor` (
  `id` int(11) NOT NULL,
  `id_nasabah` int(11) NOT NULL,
  `jenis_sampah` varchar(100) NOT NULL,
  `berat` decimal(10,2) NOT NULL,
  `harga` int(255) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `tanggal_setor` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `setor`
--

INSERT INTO `setor` (`id`, `id_nasabah`, `jenis_sampah`, `berat`, `harga`, `total`, `id_admin`, `tanggal_setor`, `created_at`) VALUES
(9, 1, 'Minyak Jelantah ', 3.00, 8000, 24000.00, 2, '2024-09-02', '2024-10-15 15:25:39'),
(10, 1, 'Kertas   ', 5.00, 5000, 25000.00, 2, '2024-09-02', '2024-10-15 15:27:01'),
(11, 4, 'Plastik', 6.00, 6000, 36000.00, 2, '2024-09-02', '2024-10-15 15:27:38'),
(12, 2, 'Kertas   ', 10.00, 5000, 50000.00, 2, '2024-09-02', '2024-10-15 15:28:04'),
(13, 5, 'Kaca', 3.00, 7000, 21000.00, 2, '2024-09-02', '2024-10-15 15:28:27'),
(14, 3, 'Plastik ', 7.00, 8000, 56000.00, 1, '2024-09-03', '2024-10-15 15:30:44'),
(15, 4, 'Plastik', 2.00, 6000, 12000.00, 1, '2024-09-03', '2024-10-15 15:31:10'),
(16, 1, 'Kertas   ', 10.00, 5000, 50000.00, 1, '2024-09-05', '2024-10-15 15:32:34'),
(17, 3, 'Kaca', 5.00, 7000, 35000.00, 1, '2024-09-05', '2024-10-15 15:33:07'),
(18, 4, 'Plastik', 4.00, 6000, 24000.00, 1, '2024-09-05', '2024-10-15 15:33:59'),
(19, 1, 'Plastik', 5.00, 6000, 30000.00, 1, '2024-09-06', '2024-10-16 01:52:07'),
(20, 2, 'Minyak Jelantah ', 3.00, 8000, 24000.00, 1, '2024-09-06', '2024-10-16 01:52:57'),
(21, 2, 'Kaca', 7.00, 7000, 49000.00, 1, '2024-09-06', '2024-10-16 01:56:13'),
(22, 4, 'Kertas   ', 12.00, 5000, 60000.00, 1, '2024-09-06', '2024-10-16 01:59:09'),
(23, 3, 'Kaca', 6.00, 7000, 42000.00, 1, '2024-09-07', '2024-10-16 02:00:16'),
(24, 5, 'Kertas   ', 7.00, 5000, 35000.00, 2, '2024-09-07', '2024-10-16 02:04:13'),
(25, 1, 'Minyak Jelantah ', 2.00, 8000, 16000.00, 2, '2024-09-08', '2024-10-16 02:06:18'),
(26, 2, 'Kertas   ', 5.00, 5000, 25000.00, 2, '2024-09-08', '2024-10-16 02:07:39'),
(27, 4, 'Plastik', 3.00, 6000, 18000.00, 2, '2024-09-08', '2024-10-16 02:09:51'),
(28, 4, 'Kaca', 8.00, 7000, 56000.00, 2, '2024-09-08', '2024-10-16 02:10:34');

-- --------------------------------------------------------

--
-- Table structure for table `tarik`
--

CREATE TABLE `tarik` (
  `id` int(11) NOT NULL,
  `id_nasabah` int(11) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `tanggal_tarik` date NOT NULL,
  `jumlah_tarik` int(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tarik`
--

INSERT INTO `tarik` (`id`, `id_nasabah`, `saldo`, `id_admin`, `tanggal_tarik`, `jumlah_tarik`, `created_at`) VALUES
(1, 2, 148000.00, 2, '2024-10-01', 48000, '2024-10-22 18:06:53'),
(2, 1, 145000.00, 1, '2024-09-20', 50000, '2024-10-24 17:25:37'),
(3, 4, 206000.00, 1, '2024-09-24', 100000, '2024-10-24 17:26:19'),
(4, 5, 56000.00, 2, '2024-09-26', 20000, '2024-10-24 17:26:57'),
(5, 3, 101000.00, 2, '2024-09-28', 30000, '2024-10-24 17:27:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `sampah`
--
ALTER TABLE `sampah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setor`
--
ALTER TABLE `setor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_nasabah` (`id_nasabah`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `tarik`
--
ALTER TABLE `tarik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_nasabah` (`id_nasabah`),
  ADD KEY `id_admin` (`id_admin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `nasabah`
--
ALTER TABLE `nasabah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sampah`
--
ALTER TABLE `sampah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `setor`
--
ALTER TABLE `setor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tarik`
--
ALTER TABLE `tarik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `setor`
--
ALTER TABLE `setor`
  ADD CONSTRAINT `setor_ibfk_1` FOREIGN KEY (`id_nasabah`) REFERENCES `nasabah` (`id`),
  ADD CONSTRAINT `setor_ibfk_3` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`);

--
-- Constraints for table `tarik`
--
ALTER TABLE `tarik`
  ADD CONSTRAINT `tarik_ibfk_1` FOREIGN KEY (`id_nasabah`) REFERENCES `nasabah` (`id`),
  ADD CONSTRAINT `tarik_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
