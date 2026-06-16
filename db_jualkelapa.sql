-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 15, 2026 at 11:56 PM
-- Server version: 8.0.44
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_jualkelapa`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailpesanans`
--

CREATE TABLE `detailpesanans` (
  `id` bigint UNSIGNED NOT NULL,
  `pesanan_id` int NOT NULL,
  `produk_id` int NOT NULL,
  `qty` int NOT NULL,
  `harga` double NOT NULL,
  `subtotal` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detailpesanans`
--

INSERT INTO `detailpesanans` (`id`, `pesanan_id`, `produk_id`, `qty`, `harga`, `subtotal`, `created_at`, `updated_at`) VALUES
(4, 5, 3, 5, 55000, 275000, '2026-06-12 17:42:59', '2026-06-12 17:42:59'),
(9, 10, 2, 2, 12000, 24000, '2026-06-15 16:43:29', '2026-06-15 16:43:29');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategoris`
--

CREATE TABLE `kategoris` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategoris`
--

INSERT INTO `kategoris` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Kelapa Muda', '2026-05-28 13:03:42', '2026-05-28 13:03:42'),
(2, 'Kelapa Tua', '2026-06-12 01:09:26', '2026-06-12 01:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_06_20_062215_create_kategoris_table', 1),
(7, '2024_06_20_072119_create_warungs_table', 1),
(8, '2024_06_20_083539_create_produks_table', 1),
(9, '2024_06_30_002936_create_keranjangs_table', 1),
(10, '2024_06_30_042741_create_mejas_table', 1),
(11, '2024_07_01_093441_create_pesanans_table', 1),
(12, '2024_07_01_093735_create_detailpesanans_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesanans`
--

CREATE TABLE `pesanans` (
  `id` bigint UNSIGNED NOT NULL,
  `kode_pesanan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_pemesanan` date NOT NULL,
  `nama_pembeli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_harga` double NOT NULL,
  `metode_pembayaran` enum('Cash','Qris') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pembayaran` enum('Pending','Paid','Expired','Failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `snap_token` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pesanans`
--

INSERT INTO `pesanans` (`id`, `kode_pesanan`, `tgl_pemesanan`, `nama_pembeli`, `no_hp`, `total_harga`, `metode_pembayaran`, `status_pembayaran`, `snap_token`, `created_at`, `updated_at`) VALUES
(5, 'ORD1781311379', '2026-06-13', 'diki', '0821865433', 275000, 'Cash', 'Paid', NULL, '2026-06-12 17:42:59', '2026-06-12 17:42:59'),
(10, 'ORD1781567009', '2026-06-15', 'ali', '0854322', 24000, 'Qris', 'Paid', '51271a79-c33a-4e36-860a-0c0acd441f3e', '2026-06-15 16:43:29', '2026-06-15 16:43:30');

-- --------------------------------------------------------

--
-- Table structure for table `produks`
--

CREATE TABLE `produks` (
  `id` bigint UNSIGNED NOT NULL,
  `id_kategori` int NOT NULL,
  `nama_produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int NOT NULL,
  `harga` double NOT NULL,
  `deskripsi_produk` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produks`
--

INSERT INTO `produks` (`id`, `id_kategori`, `nama_produk`, `stock`, `harga`, `deskripsi_produk`, `path_gambar`, `created_at`, `updated_at`) VALUES
(2, 1, 'Kelapa Muda', 20, 12000, 'segar sekali', 'Kelapa-Muda_1867721355489667.jpg', '2026-06-11 10:11:26', '2026-06-11 10:11:26'),
(3, 2, 'Kelapa Tua', 35, 55000, 'fresh', 'Kelapa-Tua_1867777965578343.jpeg', '2026-06-12 01:11:14', '2026-06-12 17:42:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `roles`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Henderson Witting', 'mohr.libbie@example.com', '2026-05-27 07:33:51', '$2y$12$DNpw9kGw3qlSCBRIkoWSju3eE/RvzdTo5AI2hZQ.x5jZH7XK05jyW', NULL, NULL, NULL, 'penjual', 'mgGSZ8sX9y', '2026-05-27 07:33:52', '2026-05-27 07:33:52'),
(2, 'Stephon Lynch', 'lorine.smith@example.org', '2026-05-27 07:33:52', '$2y$12$DNpw9kGw3qlSCBRIkoWSju3eE/RvzdTo5AI2hZQ.x5jZH7XK05jyW', NULL, NULL, NULL, 'penjual', 'MWbDWPlgSQ', '2026-05-27 07:33:52', '2026-05-27 07:33:52'),
(3, 'Danika Schoen', 'mallory71@example.org', '2026-05-27 07:33:52', '$2y$12$DNpw9kGw3qlSCBRIkoWSju3eE/RvzdTo5AI2hZQ.x5jZH7XK05jyW', NULL, NULL, NULL, 'penjual', 'lwNrtVeeXn', '2026-05-27 07:33:52', '2026-05-27 07:33:52'),
(4, 'Edmond Heller', 'marilyne71@example.org', '2026-05-27 07:33:52', '$2y$12$DNpw9kGw3qlSCBRIkoWSju3eE/RvzdTo5AI2hZQ.x5jZH7XK05jyW', NULL, NULL, NULL, 'penjual', 'C5juvklQ9V', '2026-05-27 07:33:52', '2026-05-27 07:33:52'),
(5, 'Mr. Gordon Dibbert', 'thomas.rosenbaum@example.org', '2026-05-27 07:33:52', '$2y$12$DNpw9kGw3qlSCBRIkoWSju3eE/RvzdTo5AI2hZQ.x5jZH7XK05jyW', NULL, NULL, NULL, 'penjual', 'AAj8RvrKCX', '2026-05-27 07:33:52', '2026-05-27 07:33:52'),
(6, 'Admin', 'admin@gmail.com', NULL, '$2y$12$dgootp73o7F5F5g1GXgFsOKI6VcKsIFITB6A7lUNmL5rlGyul.I9q', NULL, NULL, NULL, 'admin', NULL, '2026-05-27 07:33:53', '2026-05-27 07:33:53'),
(7, 'Penjual', 'penjual@gmail.com', NULL, '$2y$12$VwET/wARCsMARmcm/HGjMO5EecW4BvcVQ9/M8fwqmhIfxaNmCYw8u', NULL, NULL, NULL, 'penjual', NULL, '2026-05-27 07:33:54', '2026-05-27 07:33:54'),
(8, 'Pemilik', 'pemilik@gmail.com', NULL, '$2y$12$zv/4NlAhtBs/v1.fguJMt.Vdbp9ND4/aNkxbLwC0OKEAMzLFxg1M2', NULL, NULL, NULL, 'pemilik', NULL, '2026-05-27 07:33:55', '2026-05-27 07:33:55'),
(10, 'penjual2', 'penjual2@gmail.com', NULL, '$2y$12$r.85PnHEmiDeWRueIvCwb.ENYdLtilWuL7RtGsEtsHUATlZGtXEGm', NULL, NULL, NULL, 'penjual', NULL, '2026-06-15 16:30:13', '2026-06-15 16:30:13'),
(11, 'pemilik2', 'pemilik2@gmail.com', NULL, '$2y$12$6czgMUoeeXqi7xhuQNPj9eju5bO.N/IaPGvjI7Hmc9p/aL6yJeHbK', NULL, NULL, NULL, 'pemilik', NULL, '2026-06-15 16:31:04', '2026-06-15 16:31:04'),
(12, 'penjual4', 'penjual4@gmail.com', NULL, '$2y$12$Mg4EMDg5uK.t3KEXjQcZkuSrirGgaX.Vh5813Gp35rzz4mCHtvZj.', NULL, NULL, NULL, 'penjual', NULL, '2026-06-15 16:39:33', '2026-06-15 16:39:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailpesanans`
--
ALTER TABLE `detailpesanans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pesanans`
--
ALTER TABLE `pesanans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produks`
--
ALTER TABLE `produks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detailpesanans`
--
ALTER TABLE `detailpesanans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanans`
--
ALTER TABLE `pesanans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `produks`
--
ALTER TABLE `produks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
