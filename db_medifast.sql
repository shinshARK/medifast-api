/*
Navicat MySQL Data Transfer

Source Server         : coba01
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_medifast

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-06-08 20:54:07
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `author` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '4 Rekomendasi Obat Maag yang Ampuh', 'John Doe', 'artikel2.png', '1. Mylanta: Mylanta adalah salah satu obat maag yang bagus dan banyak dikenal masyarakat. Obat ini mengandung kombinasi dari magnesium hidroksida dan aluminium hidroksida yang dapat meredakan sakit maag.\n 2. Promag: Promag juga merupakan pilihan obat maag yang bagus dan mudah didapatkan di apotek maupun warung. Obat ini juga mengandung magnesium hidroksida dan aluminium hidroksida.\n 3. Polysilane: Polysilane adalah obat maag yang dapat membantu mengatasi masalah maag dan gangguan pencernaan lain seperti perut kembung dan rasa tidak nyaman di perut.\n 4. Polycrol Forte: Polycrol Forte adalah obat maag cair yang mengandung aluminium hidroksida, magnesium hidroksida, dan methylpolysiloxane. Obat ini efektif untuk mengobati gangguan pada saluran pencernaan seperti gastritis, perut kembung, maag, hiatus hernia, tukak lambung, dan usus duabelas jari.', '2024-04-11 00:00:00', '2024-04-21 00:00:00');
INSERT INTO `article` VALUES ('2', '5 Rekomendasi Obat Pusing paling ampuh', 'ilham', 'artikel3.png', '1. Paracetamol dapat dikonsumsi sebelum atau sesudah makan. Minumlah obat ini dengan bantuan segelas air. 2. Sebelum mengonsumsi paracetamol sirop atau tetes, kocok botol terlebih dahulu. 3. Gunakan alat takar atau pipet yang tersedia di dalam kemasan paracetamol sirop maupun tetes. Jangan menggunakan sendok makan atau sendok teh karena dosisnya bisa tidak sesuai. 4. Paracetamol tidak untuk digunakan dalam jangka panjang. Konsumsi obat ini bisa segera dihentikan begitu keluhan mereda. 5. Bila demam belum membaik setelah 3 hari atau nyeri belum mereda setelah 7 hari, hentikan konsumsi paracetamol dan konsultasikan ke dokter. 6. Pada anak-anak, segera bawa ia ke dokter jika demam belum turun setelah 3 hari, atau nyeri belum membaik setelah 5 hari pemberian paracetamol. 7. Simpan paracetamol di tempat bersuhu ruangan dan terhindar dari paparan sinar matahari langsung. Jauhkan obat dari jangkauan anak-anak.', '2024-06-06 10:28:36', '2024-06-06 10:28:36');
INSERT INTO `article` VALUES ('3', '6 Rekomendasi Obat Tidur', 'repan', 'artikel4.png', '1. Sandepril adalah obat dengan kandungan maprotiline hidroklorida (HCl) yang termasuk pada golongan antidepresan trisiklik (TCA). Sandepril adalah obat yang bermanfaat untuk mengatasi depresi mayor. 2. Depresi mayor sendiri merupakan gangguan kejiwaan yang mengakibatkan terjadinya gangguan suasana hati dan perilaku. 3. Cara kerja dari Sandepril adalah menghambat pengembalian serotonin dan norepinefrin di otak. Efeknya ini akan menimbulkan peningkatan neurotransmitter (senyawa kimia yang membawa pesan antarsaraf) sehingga dapat memperbaiki suasana hati. 4. Sandepril diproduksi dalam bentuk sediaan tablet salut selaput. Selain sandepril, terdapat juga obat antikecemasan (alprazolam) dengan kandungan benzodiazepin, yang mungkin diresepkan dokter untuk pengidap depresi.', '2024-06-07 16:20:09', '2024-06-07 16:20:09');
INSERT INTO `article` VALUES ('4', 'Rekomendasi Obat Mual dan Sakit Perut', 'Adrian', 'artikel5.png', '1. Polysilane adalah obat untuk mengurangi gejala-gejala yang berhubungan dengan kelebihan produksi asam lambung, GERD, hingga mag. 2. Obat Polysilane mengandung aluminium hydroxide, magnesium hydroxide, dan simethicone. 3. Aluminium hidroksida adalah salah satu jenis obat antasida, yang digunakan untuk menangani gejala akibat produksi asam lambung yang berlebihan. 4. Sementara magnesium hidroksida adalah antasida yang digunakan bersama-sama dengan aluminium hidroksida untuk menetralkan asam lambung. 5. Simethicone digunakan untuk mengurangi kembung, ketidaknyamanan, atau rasa sakit akibat gas berlebihan dalam perut atau usus. 6. Obat Polysilane tersedia dalam bentuk suspensi, tablet kunyah, dan kaplet. Bagaimana dosis, efek samping dan manfaat Polysilane? Simak di bawah ini.', '2024-06-07 16:27:34', '2024-06-07 16:27:34');

-- ----------------------------
-- Table structure for `catatan_dokter`
-- ----------------------------
DROP TABLE IF EXISTS `catatan_dokter`;
CREATE TABLE `catatan_dokter` (
  `id_catatan_dokter` int(11) NOT NULL AUTO_INCREMENT,
  `gejala` varchar(255) DEFAULT NULL,
  `diagnosa` varchar(255) DEFAULT NULL,
  `id_resep_digital` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_catatan_dokter`),
  KEY `resep_key` (`id_resep_digital`),
  CONSTRAINT `resep_key` FOREIGN KEY (`id_resep_digital`) REFERENCES `resep_digital` (`id_resep_digital`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of catatan_dokter
-- ----------------------------
INSERT INTO `catatan_dokter` VALUES ('1', 'Anak tubuh panas melebihi 37°C, batuk pilek dan flu, muntah berkepanjangan, jarang buang air kecil, tidak mengeluarkan air mata saat menangis, dan lemas.', 'Mengalami Demam', '1');

-- ----------------------------
-- Table structure for `doctor`
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `specialty` text DEFAULT NULL,
  `rating` text DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `schedule` text DEFAULT NULL,
  `id_spesialis` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spesialis_key` (`id_spesialis`),
  CONSTRAINT `spesialis_key` FOREIGN KEY (`id_spesialis`) REFERENCES `spesialis` (`id_spesialis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('1', 'Dr. Eki Rakhmah Z, Sp.A', 'dokter_1.png', 'Dokter Anak', '4.8', '1', 'ramah, dan tegas', 'senin, 07:00 - 08:00', '3');
INSERT INTO `doctor` VALUES ('2', 'Dr. Hudi Heriyanto', 'dokter_4.png', 'Dokter Umum', '4.2', '2', 'galak,serius', 'selasa, 07:00 - 08:00', '8');
INSERT INTO `doctor` VALUES ('3', 'Dr. Rina wijaya', 'dokter_2.png', 'Dokter Dalam', '4.8', '10', 'ramah, cantik', 'rabu, 07:00 - 08:00', '1');
INSERT INTO `doctor` VALUES ('4', 'Dr. Budi Santoso, Sp.A', 'dokter_5.png', 'Dokter Anak', '4.3', '11', 'ramah, pengertian', 'kamis, 07:00 - 08:00', '2');
INSERT INTO `doctor` VALUES ('5', 'Dr. Lilis', 'dokter_3.png', 'Dokter Umum', '4.5', '5', 'ceria, baik', 'jumat, 07:00 - 08:00', '6');

-- ----------------------------
-- Table structure for `dokter_shift`
-- ----------------------------
DROP TABLE IF EXISTS `dokter_shift`;
CREATE TABLE `dokter_shift` (
  `id_dokter_shift` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokter` int(11) DEFAULT NULL,
  `id_shift` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_dokter_shift`),
  KEY `dokter_keyDS` (`id_dokter`),
  KEY `shift_keyDS` (`id_shift`),
  CONSTRAINT `dokter_keyDS` FOREIGN KEY (`id_dokter`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shift_keyDS` FOREIGN KEY (`id_shift`) REFERENCES `shift` (`id_shift`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of dokter_shift
-- ----------------------------
INSERT INTO `dokter_shift` VALUES ('1', '1', '3');
INSERT INTO `dokter_shift` VALUES ('2', '2', '1');
INSERT INTO `dokter_shift` VALUES ('3', '3', '12');
INSERT INTO `dokter_shift` VALUES ('4', '4', '7');
INSERT INTO `dokter_shift` VALUES ('5', '5', '14');

-- ----------------------------
-- Table structure for `obat`
-- ----------------------------
DROP TABLE IF EXISTS `obat`;
CREATE TABLE `obat` (
  `id_obat` int(11) NOT NULL AUTO_INCREMENT,
  `nama_obat` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `harga_satuan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_obat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of obat
-- ----------------------------
INSERT INTO `obat` VALUES ('1', 'paracetamol', 'strip', '1000');
INSERT INTO `obat` VALUES ('2', 'amblodifin', 'kaplet', '37000');
INSERT INTO `obat` VALUES ('3', 'paramex', 'sirup', '8000');

-- ----------------------------
-- Table structure for `resep_digital`
-- ----------------------------
DROP TABLE IF EXISTS `resep_digital`;
CREATE TABLE `resep_digital` (
  `id_resep_digital` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokter` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_obat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_resep_digital`),
  KEY `dokter_keyR` (`id_dokter`),
  KEY `user_keyR` (`id_user`),
  KEY `obat_keyR` (`id_obat`),
  CONSTRAINT `dokter_keyR` FOREIGN KEY (`id_dokter`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `obat_keyR` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_keyR` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of resep_digital
-- ----------------------------
INSERT INTO `resep_digital` VALUES ('1', '1', '1', '1');
INSERT INTO `resep_digital` VALUES ('2', '4', '5', '2');
INSERT INTO `resep_digital` VALUES ('3', '5', '4', '3');

-- ----------------------------
-- Table structure for `riwayat_transaksi`
-- ----------------------------
DROP TABLE IF EXISTS `riwayat_transaksi`;
CREATE TABLE `riwayat_transaksi` (
  `id_riwayat_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` varchar(255) DEFAULT NULL,
  `id_dokter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_riwayat_transaksi`),
  KEY `dokter_key` (`id_dokter`),
  CONSTRAINT `dokter_key` FOREIGN KEY (`id_dokter`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of riwayat_transaksi
-- ----------------------------
INSERT INTO `riwayat_transaksi` VALUES ('1', 'segera', '2024-04-16', '02:00:00.857', '1');
INSERT INTO `riwayat_transaksi` VALUES ('2', 'selesai', '2022-05-10', '12:00:00.857', '2');
INSERT INTO `riwayat_transaksi` VALUES ('3', 'batal', '2011-12-01', '05:00:00.857', '3');

-- ----------------------------
-- Table structure for `shift`
-- ----------------------------
DROP TABLE IF EXISTS `shift`;
CREATE TABLE `shift` (
  `id_shift` int(11) NOT NULL AUTO_INCREMENT,
  `hari` varchar(255) DEFAULT NULL,
  `tipe_shift` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_shift`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of shift
-- ----------------------------
INSERT INTO `shift` VALUES ('1', 'Senin', 'Pagi');
INSERT INTO `shift` VALUES ('2', 'Senin', 'Sore');
INSERT INTO `shift` VALUES ('3', 'Selasa', 'Pagi');
INSERT INTO `shift` VALUES ('4', 'Selasa', 'Sore');
INSERT INTO `shift` VALUES ('5', 'Rabu', 'Pagi');
INSERT INTO `shift` VALUES ('6', 'Rabu', 'Sore');
INSERT INTO `shift` VALUES ('7', 'Kamis', 'Pagi');
INSERT INTO `shift` VALUES ('8', 'Kamis', 'Sore');
INSERT INTO `shift` VALUES ('9', 'Jumat', 'Pagi');
INSERT INTO `shift` VALUES ('10', 'Jumat', 'Sore');
INSERT INTO `shift` VALUES ('11', 'Sabtu', 'Pagi');
INSERT INTO `shift` VALUES ('12', 'Sabtu', 'Sore');
INSERT INTO `shift` VALUES ('13', 'Minggu', 'Pagi');
INSERT INTO `shift` VALUES ('14', 'Minggu', 'Sore');

-- ----------------------------
-- Table structure for `spesialis`
-- ----------------------------
DROP TABLE IF EXISTS `spesialis`;
CREATE TABLE `spesialis` (
  `id_spesialis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_spesialis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_spesialis`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of spesialis
-- ----------------------------
INSERT INTO `spesialis` VALUES ('1', 'anak');
INSERT INTO `spesialis` VALUES ('2', 'umum');
INSERT INTO `spesialis` VALUES ('3', 'dalam');
INSERT INTO `spesialis` VALUES ('4', 'bedah');
INSERT INTO `spesialis` VALUES ('5', 'mata');
INSERT INTO `spesialis` VALUES ('6', 'saraf');
INSERT INTO `spesialis` VALUES ('7', 'urologi');
INSERT INTO `spesialis` VALUES ('8', 'patologi');

-- ----------------------------
-- Table structure for `token`
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `access_token` varchar(450) NOT NULL,
  `refresh_token` varchar(450) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`access_token`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of token
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` text DEFAULT NULL,
  `lastname` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telephone` text DEFAULT NULL,
  `hashed_password` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'wahyu', 'sanhusi', 'wahyu@gmail.com', '0835478853', 'password');
INSERT INTO `user` VALUES ('2', 'agus', 'william', 'agus@gmail.com', '0835478853', 'password');
INSERT INTO `user` VALUES ('3', 'rafi', 'ahmad', 'rafi@gmail.com', '0835478853', 'password');
INSERT INTO `user` VALUES ('4', 'odang', 'saluhi', 'odang@gmail.com', '0835478853', 'password');
INSERT INTO `user` VALUES ('5', 'budi', 'gunawan', 'budi@gmail.com', '0835478853', 'password');

-- ----------------------------
-- Table structure for `user_doctor_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `user_doctor_favorite`;
CREATE TABLE `user_doctor_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`doctor_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `user_doctor_favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_doctor_favorite_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user_doctor_favorite
-- ----------------------------
INSERT INTO `user_doctor_favorite` VALUES ('1', '1', '1');
INSERT INTO `user_doctor_favorite` VALUES ('2', '1', '2');
INSERT INTO `user_doctor_favorite` VALUES ('3', '2', '1');
INSERT INTO `user_doctor_favorite` VALUES ('4', '3', '3');
INSERT INTO `user_doctor_favorite` VALUES ('5', '4', '1');
INSERT INTO `user_doctor_favorite` VALUES ('6', '4', '2');
INSERT INTO `user_doctor_favorite` VALUES ('7', '4', '3');
