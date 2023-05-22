-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Bulan Mei 2023 pada 09.39
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.12

-- Buat database 'e-voting1' jika belum ada
CREATE DATABASE IF NOT EXISTS `e-voting1`;
USE `e-voting1`;

-- Hapus tabel jika sudah ada sebelumnya
DROP TABLE IF EXISTS `tb_vote`; -- Hapus tabel tb_vote terlebih dahulu
DROP TABLE IF EXISTS `tb_calon`;
DROP TABLE IF EXISTS `tb_pengguna`;
DROP TABLE IF EXISTS `tb_admin`;

-- Buat tabel 'tb_admin'
CREATE TABLE IF NOT EXISTS `tb_admin` (
  `id_pengguna` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pengguna` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` enum('Administrator','Petugas','Pemilih') NOT NULL,
  `status` enum('1','0') NOT NULL,
  `jenis` enum('PAN','PST') NOT NULL,
  PRIMARY KEY (`id_pengguna`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Isi data untuk tabel 'tb_admin'
INSERT INTO `tb_admin` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `level`, `status`, `jenis`) VALUES
(1, 'Azka Lazuardi', 'azkafarghani', '1234', 'Administrator', '0', 'PAN'),
(2, '', 'asdadad', 'asdad', 'Administrator', '1', 'PAN'),
(3, '', 'fghfgh', 'fghfgh', 'Administrator', '1', 'PAN'),
(4, '', 'fghfgh', 'fghfgh', 'Administrator', '1', 'PAN'),
(5, 'hokage', 'bismillahbisa ', '1234', 'Administrator', '1', 'PAN'),
(6, 'hashirama', 'hokage1', 'hokage1', 'Administrator', '1', 'PAN'),
(7, 'tsunade', 'tsuna', 'suna', 'Administrator', '1', 'PAN'),
(8, 'Azka Lazuardi', 'azkafarghani', '12345', 'Administrator', '1', 'PAN');

-- Buat tabel 'tb_calon'
CREATE TABLE IF NOT EXISTS `tb_calon` (
  `id_calon` varchar(2) NOT NULL,
  `nama_calon` varchar(100) NOT NULL,
  `foto_calon` varchar(200) NOT NULL,
  `keterangan` varchar(500) NOT NULL,
  PRIMARY KEY (`id_calon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Isi data untuk tabel 'tb_calon'
INSERT INTO `tb_calon` (`id_calon`, `nama_calon`, `foto_calon`, `keterangan`) VALUES
('1', 'calon1', 'Jellyfish.jpg', 'yups'),
('2', 'calon2', 'Jellyfish.jpg', 'yups'),
('3', 'calon 3', 'Jellyfish.jpg', 'yups');

-- Buat tabel 'tb_pengguna'
CREATE TABLE IF NOT EXISTS `tb_pengguna` (
  `id_pengguna` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pengguna` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` enum('Administrator','Petugas','Pemilih') NOT NULL,
  `status` enum('1','0') NOT NULL,
  `jenis` enum('PAN','PST') NOT NULL,
  PRIMARY KEY (`id_pengguna`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Isi data untuk tabel 'tb_pengguna'
INSERT INTO `tb_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `level`, `status`, `jenis`) VALUES
(4, 'azki lawal', 'azkilawal1', 'azki22', 'Pemilih', '0', 'PST'),
(5, 'dualima', '25dualima', '2525', 'Administrator', '0', 'PST'),
(9, 'tes', 'tes', '9294', 'Pemilih', '1', 'PST'),
(17, 'minato', '13123', '12313', 'Petugas', '1', 'PAN'),
(20, 'tobirama', 'tobi', 'tobirama', 'Administrator', '0', 'PAN'),
(21, 'hashirama', 'hokage1', 'hokage1', 'Administrator', '1', 'PAN'),
(23, 'Azka Lazuardi', 'azkafarghani', '12345', 'Administrator', '1', 'PAN');

-- Buat tabel 'tb_vote'
CREATE TABLE IF NOT EXISTS `tb_vote` (
  `id_vote` int(11) NOT NULL AUTO_INCREMENT,
  `id_calon` varchar(2) NOT NULL,
  `id_pemilih` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_vote`),
  KEY `id_calon` (`id_calon`),
  CONSTRAINT `tb_vote_ibfk_1` FOREIGN KEY (`id_calon`) REFERENCES `tb_calon` (`id_calon`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Isi data untuk tabel 'tb_vote'
INSERT INTO `tb_vote` (`id_vote`, `id_calon`, `id_pemilih`, `date`) VALUES
(25, '1', 5, '2021-12-19 10:48:48'),
(26, '2', 5, '2021-12-19 10:54:50'),
(27, '2', 5, '2021-12-19 12:20:22');
