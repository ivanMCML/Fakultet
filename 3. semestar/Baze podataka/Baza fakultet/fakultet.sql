-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2024 at 10:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fakultet`
--

-- --------------------------------------------------------

--
-- Table structure for table `kolegij`
--

CREATE TABLE `kolegij` (
  `sifra` char(6) NOT NULL DEFAULT '',
  `Naziv` varchar(100) NOT NULL,
  `Vrsta` char(1) DEFAULT NULL,
  `ECTS` tinyint(4) DEFAULT 0,
  `PR` tinyint(4) DEFAULT 0,
  `AV` tinyint(4) DEFAULT 0,
  `LV` tinyint(4) DEFAULT 0,
  `KV` tinyint(4) DEFAULT 0,
  `NastavnikID` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_croatian_ci;

--
-- Dumping data for table `kolegij`
--

INSERT INTO `kolegij` (`sifra`, `Naziv`, `Vrsta`, `ECTS`, `PR`, `AV`, `LV`, `KV`, `NastavnikID`) VALUES
('FELA09', 'Teorija sustava', 'O', 5, 45, 0, 15, 0, 1),
('FELB14', 'Projektiranje informacijskih sustava', 'O', 5, 30, 0, 30, 0, 7),
('FELB16', 'Programiranje za Windows', 'I', 4, 30, 0, 15, 0, 7),
('FELP04', 'Arhitektura digitalnih računala', 'O', 6, 45, 15, 30, 0, 2),
('FELP22', 'Baze podataka', 'O', 5, 30, 0, 30, 0, 1),
('FENI10', 'Zaštita u električnim postrojenjima', 'O', 7, 30, 15, 15, 0, 5),
('FENO06', 'Električna postrojenja', 'O', 6, 45, 15, 15, 0, 3),
('FESC06', 'Termodinamika 1', 'O', 7, 45, 30, 0, 0, 4),
('FESC09', 'Termodinamika 2', 'O', 7, 45, 30, 0, 0, 4),
('FETL22', 'Nekonvencionalni postupci obrade', 'I', 5, 45, 0, 15, 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `nastavnik`
--

CREATE TABLE `nastavnik` (
  `NastavnikID` smallint(6) NOT NULL,
  `Ime` varchar(25) NOT NULL,
  `Prezime` varchar(50) NOT NULL,
  `Zavod` char(3) DEFAULT NULL,
  `Soba` char(4) DEFAULT NULL,
  `Zvanje` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_croatian_ci;

--
-- Dumping data for table `nastavnik`
--

INSERT INTO `nastavnik` (`NastavnikID`, `Ime`, `Prezime`, `Zavod`, `Soba`, `Zvanje`) VALUES
(1, 'Vladan', 'Papić', 'ZER', 'A419', 'red'),
(2, 'Sven', 'Gotovac', 'ZER', 'B510', 'red'),
(3, 'Tonči', 'Modrić', 'ZEN', 'A307', 'izv'),
(4, 'Sandro', 'Nižetić', 'ZSB', 'C514', 'red'),
(5, 'Petar', 'Sarajčev', 'ZEN', 'B306', 'red'),
(6, 'Sonja', 'Jozić', 'ZPS', 'C405', 'izv'),
(7, 'Maja', 'Štula', 'ZER', 'B512', 'red');

-- --------------------------------------------------------

--
-- Table structure for table `polaze`
--

CREATE TABLE `polaze` (
  `JMBAG` char(10) NOT NULL DEFAULT '',
  `Sifra` char(6) NOT NULL DEFAULT '',
  `Datum_polaganja` date DEFAULT NULL,
  `Ocjena` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_croatian_ci;

--
-- Dumping data for table `polaze`
--

INSERT INTO `polaze` (`JMBAG`, `Sifra`, `Datum_polaganja`, `Ocjena`) VALUES
('1123983512', 'FENI10', '2023-02-13', 3),
('1123764190', 'FELA09', '2022-07-01', 3),
('1123712948', 'FESC06', '2023-02-12', 5),
('1123712948', 'FESC09', '2023-02-26', 5),
('1123713521', 'FESC06', '2022-02-18', 3),
('1123713521', 'FESC09', '2022-09-03', 4),
('1123713521', 'FETL22', '2023-02-07', 5),
('1123693362', 'FENO06', '2023-07-14', 2),
('1123392325', 'FELB14', '2023-07-02', 4),
('1123392325', 'FELB16', '2023-07-16', 5),
('1123847515', 'FELP04', '2023-02-10', 5),
('1123847515', 'FELP22', '2023-08-26', 4),
('1123697213', 'FELP04', '2023-02-09', 4),
('1123697213', 'FELP22', '2023-02-22', 3),
('1123747213', 'FESC06', '2022-08-26', 2),
('1123747213', 'FESC09', '2022-09-15', 2),
('1123968318', 'FELA09', '2023-07-13', 5);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `JMBAG` char(10) NOT NULL DEFAULT '',
  `Ime` varchar(25) NOT NULL,
  `Prezime` varchar(50) NOT NULL,
  `OIB` char(13) DEFAULT NULL,
  `Datum_rodjenja` date DEFAULT NULL,
  `Grad` varchar(25) DEFAULT NULL,
  `Godina_upisa` smallint(6) DEFAULT NULL,
  `Spol` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_croatian_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`JMBAG`, `Ime`, `Prezime`, `OIB`, `Datum_rodjenja`, `Grad`, `Godina_upisa`, `Spol`) VALUES
('1123983512', 'Darko', 'Matas', '6732981775373', '2000-10-21', 'Imotski', 2019, 'M'),
('1123764190', 'Josipa', 'Lovrić', '0445920225849', '1997-04-17', 'Šibenik', 2020, 'F'),
('1123712948', 'Veljko', 'Olujić', '6704802507914', '2002-05-23', 'Supetar', 2021, 'M'),
('1123713521', 'Ivan', 'Vasilj', '8236361685619', '2002-05-16', 'Split', 2020, 'M'),
('1123693362', 'Alen', 'Rogošić', '6796971538627', '2004-01-09', NULL, 2022, 'M'),
('1123392325', 'Tihomir', 'Stanić', '2994557532358', '2003-03-14', 'Hvar', 2021, 'M'),
('1123847515', 'Anita', 'Sušac', '7241665088358', '2003-09-07', 'Trogir', 2022, 'F'),
('1123745871', 'Petar', 'Slavić', '8223742440437', '2005-03-19', 'Omiš', 2023, 'M'),
('1123697213', 'Jelena', 'Pleština', '0860087394501', '2003-08-23', 'Makarska', 2022, 'F'),
('1123747213', 'Ljubo', 'Batistić', '2091189019011', '2002-08-08', 'Split', 2021, 'M'),
('1123968318', 'Marina', 'Tadić', '1628048406788', '2004-02-27', 'Split', 2022, 'F'),
('1123418721', 'Ivona', 'Juranović', '8748512981225', '2006-03-14', 'Solin', 2024, 'F');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kolegij`
--
ALTER TABLE `kolegij`
  ADD PRIMARY KEY (`sifra`),
  ADD KEY `fk_nastavnik` (`NastavnikID`);

--
-- Indexes for table `nastavnik`
--
ALTER TABLE `nastavnik`
  ADD PRIMARY KEY (`NastavnikID`);

--
-- Indexes for table `polaze`
--
ALTER TABLE `polaze`
  ADD PRIMARY KEY (`JMBAG`,`Sifra`),
  ADD KEY `fk_kolegij` (`Sifra`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`JMBAG`),
  ADD UNIQUE KEY `uq_oib` (`OIB`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nastavnik`
--
ALTER TABLE `nastavnik`
  MODIFY `NastavnikID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kolegij`
--
ALTER TABLE `kolegij`
  ADD CONSTRAINT `fk_nastavnik` FOREIGN KEY (`NastavnikID`) REFERENCES `nastavnik` (`NastavnikID`);

--
-- Constraints for table `polaze`
--
ALTER TABLE `polaze`
  ADD CONSTRAINT `fk_kolegij` FOREIGN KEY (`Sifra`) REFERENCES `kolegij` (`sifra`),
  ADD CONSTRAINT `fk_student` FOREIGN KEY (`JMBAG`) REFERENCES `student` (`JMBAG`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
