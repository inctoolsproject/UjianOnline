-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2019 at 03:28 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_elearning_course`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment_analytics`
--

CREATE TABLE `assignment_analytics` (
  `id_aanalytics` int(60) NOT NULL,
  `id_assignment` int(50) DEFAULT NULL,
  `id_student` int(50) DEFAULT NULL,
  `id_question` int(50) DEFAULT NULL,
  `id_option` int(60) DEFAULT NULL,
  `option_char` varchar(10) DEFAULT NULL,
  `analytics_status` enum('true','false','empty') DEFAULT NULL,
  `analytics_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignment_analytics`
--

INSERT INTO `assignment_analytics` (`id_aanalytics`, `id_assignment`, `id_student`, `id_question`, `id_option`, `option_char`, `analytics_status`, `analytics_created`) VALUES
(1, 16, 138, 360, 1737, 'A', 'true', '2019-11-21 18:18:16'),
(2, 17, 138, 359, 1733, 'B', 'false', '2019-11-21 18:22:51'),
(3, 15, 138, 358, 1727, 'A', 'true', '2019-11-21 18:23:33');

-- --------------------------------------------------------

--
-- Table structure for table `assignment_begin`
--

CREATE TABLE `assignment_begin` (
  `id_abegin` int(20) NOT NULL,
  `id_assignment` int(50) DEFAULT NULL,
  `id_student` int(50) DEFAULT NULL,
  `time_begin` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_class`
--

CREATE TABLE `assignment_class` (
  `id_aclass` int(10) NOT NULL,
  `id_assignment` int(50) DEFAULT NULL,
  `id_class` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignment_class`
--

INSERT INTO `assignment_class` (`id_aclass`, `id_assignment`, `id_class`) VALUES
(1, 16, 17),
(2, 17, 17),
(3, 15, 17);

-- --------------------------------------------------------

--
-- Table structure for table `assignment_question`
--

CREATE TABLE `assignment_question` (
  `id_aquestion` int(50) NOT NULL,
  `id_assignment` int(50) DEFAULT NULL,
  `id_question` int(10) DEFAULT NULL,
  `val_hide` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignment_question`
--

INSERT INTO `assignment_question` (`id_aquestion`, `id_assignment`, `id_question`, `val_hide`) VALUES
(362, 15, 358, 0),
(363, 17, 359, 0),
(364, 16, 360, 0);

-- --------------------------------------------------------

--
-- Table structure for table `assignment_result`
--

CREATE TABLE `assignment_result` (
  `id_aresult` int(50) NOT NULL,
  `id_assignment` int(50) DEFAULT NULL,
  `id_student` int(50) DEFAULT NULL,
  `result_true` int(10) DEFAULT NULL,
  `result_false` int(10) DEFAULT NULL,
  `result_score` float DEFAULT NULL,
  `result_status` enum('lulus','gagal') DEFAULT NULL,
  `result_created` datetime DEFAULT NULL,
  `result_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignment_result`
--

INSERT INTO `assignment_result` (`id_aresult`, `id_assignment`, `id_student`, `result_true`, `result_false`, `result_score`, `result_status`, `result_created`, `result_update`) VALUES
(1, 16, 138, 1, 0, 100, 'lulus', '2019-11-21 18:18:16', '2019-11-21 11:18:16'),
(2, 17, 138, 0, 1, 0, 'gagal', '2019-11-21 18:22:51', '2019-11-21 11:22:51'),
(3, 15, 138, 1, 0, 100, 'lulus', '2019-11-21 18:23:33', '2019-11-21 11:23:33');

-- --------------------------------------------------------

--
-- Table structure for table `ms_admin`
--

CREATE TABLE `ms_admin` (
  `id_admin` int(10) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `full_name` text,
  `level` enum('admin','guru','staff') DEFAULT NULL,
  `admin_hide` tinyint(1) DEFAULT '0',
  `admin_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_admin`
--

INSERT INTO `ms_admin` (`id_admin`, `username`, `password`, `full_name`, `level`, `admin_hide`, `admin_created`) VALUES
(1, 'admin', '$1$Ju3.ei3.$ABHHxCLVKvQhAS1hdA3pU/', 'Administrator', 'admin', 0, '2018-12-07');

-- --------------------------------------------------------

--
-- Table structure for table `ms_assignment`
--

CREATE TABLE `ms_assignment` (
  `id_assignment` int(50) NOT NULL,
  `id_` int(10) DEFAULT NULL,
  `author_` enum('admin','guru','staff') DEFAULT NULL,
  `id_lesson` int(10) DEFAULT NULL,
  `assignment_type` varchar(100) DEFAULT NULL,
  `assignment_order` enum('asc','desc','random') DEFAULT NULL,
  `assignment_author` varchar(100) DEFAULT NULL,
  `assignment_kkm` int(10) DEFAULT NULL,
  `question_used` int(10) DEFAULT '0',
  `assignment_path` varchar(100) DEFAULT NULL,
  `show_report` tinyint(1) DEFAULT '0',
  `show_analytic` tinyint(1) DEFAULT '0',
  `assignment_active` tinyint(1) DEFAULT '0',
  `assignment_hide` tinyint(1) DEFAULT '0',
  `assignment_duration` int(10) DEFAULT NULL,
  `assignment_created` datetime DEFAULT NULL,
  `assignment_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_assignment`
--

INSERT INTO `ms_assignment` (`id_assignment`, `id_`, `author_`, `id_lesson`, `assignment_type`, `assignment_order`, `assignment_author`, `assignment_kkm`, `question_used`, `assignment_path`, `show_report`, `show_analytic`, `assignment_active`, `assignment_hide`, `assignment_duration`, `assignment_created`, `assignment_updated`) VALUES
(15, 1, 'admin', 17, 'TryOut 1', 'desc', 'Rara Widya', 50, 0, '12-192b791-1', 0, 1, 1, 0, 80, '2019-11-21 16:22:12', '2019-11-21 11:22:12'),
(16, 1, 'admin', 19, 'TryOut 1', 'desc', 'Rara Widya', 50, 0, '50-192b791-1', 0, 1, 1, 0, 10, '2019-11-21 18:12:50', '2019-11-21 11:17:17'),
(17, 1, 'admin', 16, 'TryOut 1', 'desc', 'Rara Widya', 50, 0, '23-192b791-1', 0, 1, 1, 0, 10, '2019-11-21 18:13:23', '2019-11-21 11:21:54');

-- --------------------------------------------------------

--
-- Table structure for table `ms_class`
--

CREATE TABLE `ms_class` (
  `id_class` int(10) NOT NULL,
  `class_name` varchar(100) DEFAULT NULL,
  `class_hide` tinyint(1) DEFAULT '0',
  `class_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_class`
--

INSERT INTO `ms_class` (`id_class`, `class_name`, `class_hide`, `class_created`) VALUES
(17, 'SBMPTN', 0, '2019-11-21'),
(18, 'SKD KEDINASAN', 0, '2019-11-21');

-- --------------------------------------------------------

--
-- Table structure for table `ms_lesson`
--

CREATE TABLE `ms_lesson` (
  `id_lesson` int(10) NOT NULL,
  `lesson_name` varchar(100) DEFAULT NULL,
  `lesson_hide` tinyint(1) DEFAULT '0',
  `lesson_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_lesson`
--

INSERT INTO `ms_lesson` (`id_lesson`, `lesson_name`, `lesson_hide`, `lesson_created`) VALUES
(15, 'Matematika', 0, '2019-11-21'),
(16, 'Fisika', 0, '2019-11-21'),
(17, 'Binggris', 0, '2019-11-21'),
(18, 'Kimia', 0, '2019-11-21'),
(19, 'Biologi', 0, '2019-11-21');

-- --------------------------------------------------------

--
-- Table structure for table `ms_log`
--

CREATE TABLE `ms_log` (
  `id_log` int(255) NOT NULL,
  `log_author` text,
  `log_desc` text,
  `log_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ms_question`
--

CREATE TABLE `ms_question` (
  `id_question` int(50) NOT NULL,
  `id_lesson` int(10) DEFAULT NULL,
  `question_` text CHARACTER SET utf8,
  `question_image` varchar(100) DEFAULT NULL,
  `question_sound` varchar(100) DEFAULT NULL,
  `question_created` datetime DEFAULT NULL,
  `question_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `question_hide` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_question`
--

INSERT INTO `ms_question` (`id_question`, `id_lesson`, `question_`, `question_image`, `question_sound`, `question_created`, `question_update`, `question_hide`) VALUES
(358, 17, '1.	Diketahui  . Jika determinan matriks   adalah – 8 dan   maka   adalah …', NULL, NULL, '2019-11-21 16:24:14', '2019-11-21 09:24:14', 0),
(359, 16, '1.	Atom A memiliki no atom 9, sedangkan atom B memiliki no atom 14. Senyawa yang akan dibentuk oleh kedua atom tersebut adalah...', NULL, NULL, '2019-11-21 18:16:04', '2019-11-21 11:16:04', 0),
(360, 19, '11.	Pada suhu tertentu, campuran gas hidrogen dan karbon dioksida mula-mula berbanding 1 : 2. Pada saat 25% karbon dioksida bereaksi, dalam ruang 1 liter tercapai kesetimbangan menurut reaksi:\r\nH2(g) + CO2(g) ⇄ H2O(g) + CO(g)\r\nTetapan kesetimbangan untuk reaksi tersebut adalah … .\r\n', NULL, NULL, '2019-11-21 18:17:07', '2019-11-21 11:17:07', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ms_student`
--

CREATE TABLE `ms_student` (
  `id_student` int(50) NOT NULL,
  `id_class` int(10) DEFAULT NULL,
  `student_nis` int(30) DEFAULT NULL,
  `student_nisn` int(100) DEFAULT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `student_password` varchar(100) DEFAULT NULL,
  `student_email` varchar(100) DEFAULT NULL,
  `student_phone` varchar(20) DEFAULT NULL,
  `student_photo` varchar(100) DEFAULT NULL,
  `student_created` date DEFAULT NULL,
  `parent_name` varchar(100) DEFAULT NULL,
  `parent_phone` varchar(20) DEFAULT NULL,
  `parent_password` varchar(100) DEFAULT NULL,
  `student_hide` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_student`
--

INSERT INTO `ms_student` (`id_student`, `id_class`, `student_nis`, `student_nisn`, `student_name`, `student_password`, `student_email`, `student_phone`, `student_photo`, `student_created`, `parent_name`, `parent_phone`, `parent_password`, `student_hide`) VALUES
(138, 17, 1, NULL, 'Rara', '$1$awMZY23.$B4eQTnuD1C914402P1Hbv0', 'rara12148@gmail.com', '087656789876', '1f98c17f1700da6354711957a293c946.jpg', '2019-11-21', NULL, NULL, NULL, 0),
(139, NULL, 123, NULL, 'QW', '$1$EHYRlX11$94xX7XLJ5jqArCGnz5U7p0', 'widya@gmail.com', '1234567', 'IPDN.jpg', NULL, NULL, NULL, NULL, 0),
(140, NULL, 123, NULL, 'QW', '$1$boXCkhEQ$e2S1h2gUmXiVp7YpyrJug/', 'widya@gmail.com', '1234567', 'IPDN.jpg', NULL, NULL, NULL, NULL, 0),
(141, NULL, 123, NULL, 'QW', '$1$BqNPXe3Q$mC4m4iAXPNTazLk0sqhDy/', 'widya@gmail.com', '1234567', 'IPDN.jpg', NULL, NULL, NULL, NULL, 0),
(142, NULL, 90, NULL, 'ere', '$1$ekWYoGAi$hF9d8ToYmCiWvRXWtNOyZ/', 'indah@gmail.com', '09876546', 'STIS pre.jpg', NULL, NULL, NULL, NULL, 0),
(143, NULL, 4567, NULL, 'ruy', '$1$4wS7O7tL$0VK152ojP0VJv3aQvxXd11', 'ery@gmail.com', '1234567', '', NULL, NULL, NULL, NULL, 0),
(144, NULL, 4567, NULL, 'ruy', '$1$9u2IjKrv$W.5.to6zWNRiqEo6AugSm1', 'ery@gmail.com', '1234567', '', NULL, NULL, NULL, NULL, 0),
(145, NULL, 4567, NULL, 'ruy', '$1$mWZd/ssn$mz9H4cgLh1yWVhjcQGSZ1/', 'ery@gmail.com', '1234567', '', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ms_teacher`
--

CREATE TABLE `ms_teacher` (
  `id_teacher` int(10) NOT NULL,
  `teacher_name` varchar(100) DEFAULT NULL,
  `teacher_username` varchar(50) DEFAULT NULL,
  `teacher_password` varchar(100) DEFAULT NULL,
  `teacher_phone` varchar(20) DEFAULT NULL,
  `teacher_email` varchar(50) DEFAULT NULL,
  `teacher_address` text,
  `teacher_photo` varchar(100) DEFAULT NULL,
  `teacher_created` date DEFAULT NULL,
  `teacher_hide` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ms_token`
--

CREATE TABLE `ms_token` (
  `id_token` int(100) NOT NULL,
  `access_token` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_token`
--

INSERT INTO `ms_token` (`id_token`, `access_token`) VALUES
(113, '$1$kY1Myacj$ejkr57xbxzPw5Fxle8LI31'),
(114, '$1$3ycJSuiH$MzNeO/FfBoG1v.ZODkZH2.');

-- --------------------------------------------------------

--
-- Table structure for table `question_option`
--

CREATE TABLE `question_option` (
  `id_option` int(60) NOT NULL,
  `id_question` int(10) DEFAULT NULL,
  `option_` text CHARACTER SET utf8,
  `option_image` varchar(100) DEFAULT NULL,
  `option_true` tinyint(1) DEFAULT '0',
  `option_created` datetime DEFAULT NULL,
  `option_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `option_hide` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_option`
--

INSERT INTO `question_option` (`id_option`, `id_question`, `option_`, `option_image`, `option_true`, `option_created`, `option_updated`, `option_hide`) VALUES
(1727, 358, '17', NULL, 1, '2019-11-21 16:24:14', '2019-11-21 09:24:14', 0),
(1728, 358, '6', NULL, 0, '2019-11-21 16:24:14', '2019-11-21 09:24:14', 0),
(1729, 358, '60', NULL, 0, '2019-11-21 16:24:14', '2019-11-21 09:24:14', 0),
(1730, 358, '21', NULL, 0, '2019-11-21 16:24:14', '2019-11-21 09:24:14', 0),
(1731, 358, '34', NULL, 0, '2019-11-21 16:24:14', '2019-11-21 09:24:14', 0),
(1732, 359, 'A.	A2B', NULL, 1, '2019-11-21 18:16:04', '2019-11-21 11:16:04', 0),
(1733, 359, 'B.	BA4', NULL, 0, '2019-11-21 18:16:04', '2019-11-21 11:16:04', 0),
(1734, 359, 'C.	AB2', NULL, 0, '2019-11-21 18:16:04', '2019-11-21 11:16:04', 0),
(1735, 359, 'D.	B2A3', NULL, 0, '2019-11-21 18:16:05', '2019-11-21 11:16:05', 0),
(1736, 359, 'E.	AB4', NULL, 0, '2019-11-21 18:16:05', '2019-11-21 11:16:05', 0),
(1737, 360, 'A.	1/5', NULL, 1, '2019-11-21 18:17:08', '2019-11-21 11:17:08', 0),
(1738, 360, '3', NULL, 0, '2019-11-21 18:17:09', '2019-11-21 11:17:09', 0),
(1739, 360, '4', NULL, 0, '2019-11-21 18:17:09', '2019-11-21 11:17:09', 0),
(1740, 360, '0,5', NULL, 0, '2019-11-21 18:17:09', '2019-11-21 11:17:09', 0),
(1741, 360, '2', NULL, 0, '2019-11-21 18:17:09', '2019-11-21 11:17:09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `st_presence`
--

CREATE TABLE `st_presence` (
  `idpresence` int(10) UNSIGNED NOT NULL,
  `presence_log` timestamp NULL DEFAULT NULL,
  `nis` int(20) DEFAULT NULL,
  `presence_type` enum('alpha','leave','attend','out','sick') NOT NULL DEFAULT 'attend',
  `presence_out` timestamp NULL DEFAULT NULL,
  `presence_res` enum('finger','mobile','website') NOT NULL DEFAULT 'finger',
  `presence_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notif_sent` int(2) NOT NULL DEFAULT '0',
  `notif_read` timestamp NULL DEFAULT NULL,
  `leave_approve` tinyint(4) NOT NULL DEFAULT '0',
  `leave_reason` text CHARACTER SET utf8 NOT NULL,
  `leave_image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_class`
--

CREATE TABLE `teacher_class` (
  `id_teacher_class` int(10) NOT NULL,
  `id_teacher` int(10) DEFAULT NULL,
  `id_class` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_lesson`
--

CREATE TABLE `teacher_lesson` (
  `id_teacher_lesson` int(10) NOT NULL,
  `id_teacher` int(10) DEFAULT NULL,
  `id_lesson` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment_analytics`
--
ALTER TABLE `assignment_analytics`
  ADD PRIMARY KEY (`id_aanalytics`),
  ADD KEY `id_assignment` (`id_assignment`);

--
-- Indexes for table `assignment_begin`
--
ALTER TABLE `assignment_begin`
  ADD PRIMARY KEY (`id_abegin`),
  ADD KEY `id_assignment` (`id_assignment`),
  ADD KEY `id_student` (`id_student`);

--
-- Indexes for table `assignment_class`
--
ALTER TABLE `assignment_class`
  ADD PRIMARY KEY (`id_aclass`),
  ADD KEY `id_assignment` (`id_assignment`),
  ADD KEY `id_class` (`id_class`);

--
-- Indexes for table `assignment_question`
--
ALTER TABLE `assignment_question`
  ADD PRIMARY KEY (`id_aquestion`),
  ADD KEY `id_assignment` (`id_assignment`),
  ADD KEY `id_question` (`id_question`);

--
-- Indexes for table `assignment_result`
--
ALTER TABLE `assignment_result`
  ADD PRIMARY KEY (`id_aresult`),
  ADD KEY `id_assignment` (`id_assignment`);

--
-- Indexes for table `ms_admin`
--
ALTER TABLE `ms_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `ms_assignment`
--
ALTER TABLE `ms_assignment`
  ADD PRIMARY KEY (`id_assignment`);

--
-- Indexes for table `ms_class`
--
ALTER TABLE `ms_class`
  ADD PRIMARY KEY (`id_class`);

--
-- Indexes for table `ms_lesson`
--
ALTER TABLE `ms_lesson`
  ADD PRIMARY KEY (`id_lesson`);

--
-- Indexes for table `ms_log`
--
ALTER TABLE `ms_log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `ms_question`
--
ALTER TABLE `ms_question`
  ADD PRIMARY KEY (`id_question`);

--
-- Indexes for table `ms_student`
--
ALTER TABLE `ms_student`
  ADD PRIMARY KEY (`id_student`);

--
-- Indexes for table `ms_teacher`
--
ALTER TABLE `ms_teacher`
  ADD PRIMARY KEY (`id_teacher`);

--
-- Indexes for table `ms_token`
--
ALTER TABLE `ms_token`
  ADD PRIMARY KEY (`id_token`);

--
-- Indexes for table `question_option`
--
ALTER TABLE `question_option`
  ADD PRIMARY KEY (`id_option`),
  ADD KEY `id_question` (`id_question`);

--
-- Indexes for table `st_presence`
--
ALTER TABLE `st_presence`
  ADD PRIMARY KEY (`idpresence`),
  ADD KEY `nis` (`nis`);

--
-- Indexes for table `teacher_class`
--
ALTER TABLE `teacher_class`
  ADD PRIMARY KEY (`id_teacher_class`),
  ADD KEY `id_teacher` (`id_teacher`),
  ADD KEY `id_class` (`id_class`);

--
-- Indexes for table `teacher_lesson`
--
ALTER TABLE `teacher_lesson`
  ADD PRIMARY KEY (`id_teacher_lesson`),
  ADD KEY `id_teacher` (`id_teacher`),
  ADD KEY `id_lesson` (`id_lesson`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment_analytics`
--
ALTER TABLE `assignment_analytics`
  MODIFY `id_aanalytics` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assignment_begin`
--
ALTER TABLE `assignment_begin`
  MODIFY `id_abegin` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignment_class`
--
ALTER TABLE `assignment_class`
  MODIFY `id_aclass` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assignment_question`
--
ALTER TABLE `assignment_question`
  MODIFY `id_aquestion` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT for table `assignment_result`
--
ALTER TABLE `assignment_result`
  MODIFY `id_aresult` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ms_admin`
--
ALTER TABLE `ms_admin`
  MODIFY `id_admin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ms_assignment`
--
ALTER TABLE `ms_assignment`
  MODIFY `id_assignment` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ms_class`
--
ALTER TABLE `ms_class`
  MODIFY `id_class` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ms_lesson`
--
ALTER TABLE `ms_lesson`
  MODIFY `id_lesson` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ms_log`
--
ALTER TABLE `ms_log`
  MODIFY `id_log` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ms_question`
--
ALTER TABLE `ms_question`
  MODIFY `id_question` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT for table `ms_student`
--
ALTER TABLE `ms_student`
  MODIFY `id_student` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `ms_teacher`
--
ALTER TABLE `ms_teacher`
  MODIFY `id_teacher` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ms_token`
--
ALTER TABLE `ms_token`
  MODIFY `id_token` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `question_option`
--
ALTER TABLE `question_option`
  MODIFY `id_option` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1742;

--
-- AUTO_INCREMENT for table `st_presence`
--
ALTER TABLE `st_presence`
  MODIFY `idpresence` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_class`
--
ALTER TABLE `teacher_class`
  MODIFY `id_teacher_class` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_lesson`
--
ALTER TABLE `teacher_lesson`
  MODIFY `id_teacher_lesson` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignment_analytics`
--
ALTER TABLE `assignment_analytics`
  ADD CONSTRAINT `assignment_analytics_ibfk_1` FOREIGN KEY (`id_assignment`) REFERENCES `ms_assignment` (`id_assignment`) ON DELETE CASCADE;

--
-- Constraints for table `assignment_begin`
--
ALTER TABLE `assignment_begin`
  ADD CONSTRAINT `assignment_begin_ibfk_1` FOREIGN KEY (`id_assignment`) REFERENCES `ms_assignment` (`id_assignment`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_begin_ibfk_2` FOREIGN KEY (`id_student`) REFERENCES `ms_student` (`id_student`) ON DELETE CASCADE;

--
-- Constraints for table `assignment_class`
--
ALTER TABLE `assignment_class`
  ADD CONSTRAINT `assignment_class_ibfk_1` FOREIGN KEY (`id_assignment`) REFERENCES `ms_assignment` (`id_assignment`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_class_ibfk_2` FOREIGN KEY (`id_class`) REFERENCES `ms_class` (`id_class`) ON DELETE CASCADE;

--
-- Constraints for table `assignment_question`
--
ALTER TABLE `assignment_question`
  ADD CONSTRAINT `assignment_question_ibfk_1` FOREIGN KEY (`id_assignment`) REFERENCES `ms_assignment` (`id_assignment`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_question_ibfk_2` FOREIGN KEY (`id_question`) REFERENCES `ms_question` (`id_question`) ON DELETE CASCADE;

--
-- Constraints for table `assignment_result`
--
ALTER TABLE `assignment_result`
  ADD CONSTRAINT `assignment_result_ibfk_1` FOREIGN KEY (`id_assignment`) REFERENCES `ms_assignment` (`id_assignment`) ON DELETE CASCADE;

--
-- Constraints for table `question_option`
--
ALTER TABLE `question_option`
  ADD CONSTRAINT `question_option_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `ms_question` (`id_question`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_class`
--
ALTER TABLE `teacher_class`
  ADD CONSTRAINT `teacher_class_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `ms_teacher` (`id_teacher`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_class_ibfk_2` FOREIGN KEY (`id_class`) REFERENCES `ms_class` (`id_class`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_lesson`
--
ALTER TABLE `teacher_lesson`
  ADD CONSTRAINT `teacher_lesson_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `ms_teacher` (`id_teacher`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_lesson_ibfk_2` FOREIGN KEY (`id_lesson`) REFERENCES `ms_lesson` (`id_lesson`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
