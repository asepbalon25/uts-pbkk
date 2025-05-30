DROP DATABASE IF EXISTS `akademik_kampus`;
CREATE DATABASE IF NOT EXISTS `akademik_kampus` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `akademik_kampus`;


DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `credits` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `courses` (`course_id`, `name`, `code`, `credits`, `semester`) VALUES
	('CS001', 'Algoritma dan Pemrograman', 'ALPRO', '3', 'Ganjil'),
	('CS002', 'Struktur Data', 'STRDAT', '3', 'Genap'),
	('CS003', 'Basis Data', 'BASDAT', '4', 'Ganjil'),
	('CS004', 'Jaringan Komputer', 'JARKOM', '3', 'Genap'),
	('CS005', 'Pemrograman Web', 'WEB', '3', 'Ganjil'),
	('CS006', 'Kecerdasan Buatan', 'AI', '4', 'Genap'),
	('CS007', 'Sistem Operasi', 'SISOP', '3', 'Ganjil'),
	('CS008', 'Rekayasa Perangkat Lunak', 'RPL', '4', 'Genap'),
	('CS009', 'Grafika Komputer', 'GRAFKOM', '3', 'Ganjil'),
	('CS010', 'Keamanan Sistem', 'KAMSIS', '3', 'Genap');

DROP TABLE IF EXISTS `course_lecturers`;
CREATE TABLE IF NOT EXISTS `course_lecturers` (
  `id` varchar(50) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `lecturer_id` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  KEY `lecturer_id` (`lecturer_id`),
  CONSTRAINT `course_lecturers_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `course_lecturers_ibfk_2` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`lecturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `course_lecturers` (`id`, `course_id`, `lecturer_id`, `role`) VALUES
	('CL001', 'CS001', 'LC001', 'Pengampu Utama'),
	('CL002', 'CS002', 'LC002', 'Pengampu Utama'),
	('CL003', 'CS003', 'LC003', 'Pengampu Utama'),
	('CL004', 'CS004', 'LC004', 'Asisten'),
	('CL005', 'CS005', 'LC005', 'Pengampu Utama'),
	('CL006', 'CS006', 'LC006', 'Asisten'),
	('CL007', 'CS007', 'LC007', 'Pengampu Utama'),
	('CL008', 'CS008', 'LC008', 'Pengampu Utama'),
	('CL009', 'CS009', 'LC009', 'Asisten'),
	('CL010', 'CS010', 'LC010', 'Pengampu Utama');


DROP TABLE IF EXISTS `enrollment`;
CREATE TABLE IF NOT EXISTS `enrollment` (
  `enrollment_id` varchar(50) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `course_id` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `attendance` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `enrollment` (`enrollment_id`, `student_id`, `course_id`, `department`, `attendance`, `status`) VALUES
	('ENR001', 'ST001', 'CS001', 'Informatika', '85%', 'Aktif'),
	('ENR002', 'ST002', 'CS002', 'Sistem Informasi', '90%', 'Aktif'),
	('ENR003', 'ST003', 'CS003', 'Teknik Elektro', '78%', 'Aktif'),
	('ENR004', 'ST004', 'CS004', 'Manajemen', '92%', 'Aktif'),
	('ENR005', 'ST005', 'CS005', 'Akuntansi', '88%', 'Aktif'),
	('ENR006', 'ST006', 'CS006', 'Hukum', '95%', 'Aktif'),
	('ENR007', 'ST007', 'CS007', 'Kedokteran', '82%', 'Aktif'),
	('ENR008', 'ST008', 'CS008', 'Farmasi', '90%', 'Aktif'),
	('ENR009', 'ST009', 'CS009', 'Psikologi', '87%', 'Aktif'),
	('ENR010', 'ST010', 'CS010', 'Arsitektur', '93%', 'Aktif');

DROP TABLE IF EXISTS `lecturers`;
CREATE TABLE IF NOT EXISTS `lecturers` (
  `lecturer_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `NIP` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`lecturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `lecturers` (`lecturer_id`, `name`, `NIP`, `department`, `email`) VALUES
	('LC001', 'Prof. Dr. Ahmad Sanusi', 'NIP001', 'Informatika', 'ahmad@univ.edu'),
	('LC002', 'Dr. Bambang Setiawan', 'NIP002', 'Sistem Informasi', 'bambang@univ.edu'),
	('LC003', 'Dr. Citra Anggraeni', 'NIP003', 'Teknik Elektro', 'citra@univ.edu'),
	('LC004', 'Dewi Kusuma, M.Kom', 'NIP004', 'Informatika', 'dewi@univ.edu'),
	('LC005', 'Eko Prasetyo, M.Sc', 'NIP005', 'Sistem Informasi', 'eko@univ.edu'),
	('LC006', 'Fitriani, M.T', 'NIP006', 'Teknik Elektro', 'fitri@univ.edu'),
	('LC007', 'Gunawan Wibisono, Ph.D', 'NIP007', 'Informatika', 'gunawan@univ.edu'),
	('LC008', 'Hesti Rahayu, M.Kom', 'NIP008', 'Sistem Informasi', 'hesti@univ.edu'),
	('LC009', 'Irwan Setiawan, M.Sc', 'NIP009', 'Teknik Elektro', 'irwan@univ.edu'),
	('LC010', 'Johan Permana, Ph.D', 'NIP010', 'Informatika', 'johan@univ.edu');


DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `student_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `NIM` char(50) NOT NULL,
  `major` varchar(50) NOT NULL,
  `enrollment_year` date NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `students` (`student_id`, `name`, `email`, `NIM`, `major`, `enrollment_year`) VALUES
	('ST001', 'DADANG', 'andi@email.com', 'NIM001', 'Informatika', '2020-08-17'),
	('ST002', 'Budi Santoso', 'budi@email.com', 'NIM002', 'Sistem Informasi', '2020-08-17'),
	('ST003', 'Citra Dewi', 'citra@email.com', 'NIM003', 'Teknik Elektro', '2021-08-16'),
	('ST004', 'Dian Pratama', 'dian@email.com', 'NIM004', 'Manajemen', '2021-08-16'),
	('ST005', 'Eka Putri', 'eka@email.com', 'NIM005', 'Akuntansi', '2022-08-15'),
	('ST006', 'Fajar Nugroho', 'fajar@email.com', 'NIM006', 'Hukum', '2022-08-15'),
	('ST007', 'Gita Maharani', 'gita@email.com', 'NIM007', 'Kedokteran', '2023-08-21'),
	('ST008', 'Hadi Susanto', 'hadi@email.com', 'NIM008', 'Farmasi', '2023-08-21'),
	('ST009', 'Indra Kurniawan', 'indra@email.com', 'NIM009', 'Psikologi', '2019-08-19'),
	('ST010', 'Joko Prasetyo', 'joko@email.com', 'NIM010', 'Arsitektur', '2019-08-19');
