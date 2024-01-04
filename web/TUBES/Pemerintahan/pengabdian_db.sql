-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jan 2024 pada 16.39
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengabdian_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `informasi_jurnal`
--

CREATE TABLE `informasi_jurnal` (
  `id_jurnal` int(11) NOT NULL,
  `judul_jurnal` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `tanggal_publikasi` date DEFAULT NULL,
  `file_jurnal` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `informasi_jurnal`
--

INSERT INTO `informasi_jurnal` (`id_jurnal`, `judul_jurnal`, `penulis`, `tanggal_publikasi`, `file_jurnal`, `created_at`, `updated_at`) VALUES
(3, 'tes', 'tse', '2023-12-30', 'uploads/jurnal/1703902086_a6faa95a30d78fb51189.pdf', '2023-12-30 02:08:06', '2023-12-30 02:08:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyuluhan`
--

CREATE TABLE `penyuluhan` (
  `id_penyuluhan` int(11) NOT NULL,
  `nama_penyuluhan` varchar(255) DEFAULT NULL,
  `tanggal_pelaksanaan` date DEFAULT NULL,
  `no_sk` varchar(100) DEFAULT NULL,
  `surat_kinerja` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penyuluhan`
--

INSERT INTO `penyuluhan` (`id_penyuluhan`, `nama_penyuluhan`, `tanggal_pelaksanaan`, `no_sk`, `surat_kinerja`, `created_at`, `updated_at`) VALUES
(3, 'naem', '2023-12-30', '123', 'uploads/penyuluhan/1703902523_4473094377288383b404.pdf', '2023-12-30 09:15:23', '2023-12-30 09:15:23');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `informasi_jurnal`
--
ALTER TABLE `informasi_jurnal`
  ADD PRIMARY KEY (`id_jurnal`);

--
-- Indeks untuk tabel `penyuluhan`
--
ALTER TABLE `penyuluhan`
  ADD PRIMARY KEY (`id_penyuluhan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `informasi_jurnal`
--
ALTER TABLE `informasi_jurnal`
  MODIFY `id_jurnal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `penyuluhan`
--
ALTER TABLE `penyuluhan`
  MODIFY `id_penyuluhan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
