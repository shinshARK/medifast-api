/*
Navicat MySQL Data Transfer

Source Server         : coba01
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_medifast

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-06-07 16:27:52
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('1', 'Dr. Eki Rakhmah Z, Sp.A', 'dokter_1.png', 'Dokter Anak', '4.8', '1', 'apa ini 1', 'senin, 07:00 - 08:00');
INSERT INTO `doctor` VALUES ('2', 'Dr. Yudi Heriyanto', 'dokter_4.png', 'Dokter Umum', '4.2', '2', 'apa ini 2', 'selasa, 07:00 - 08:00');
INSERT INTO `doctor` VALUES ('3', 'Dr. Rina wijaya', null, 'Dokter Dalam', '4.8', '10', 'apa ini 3', 'rabu, 07:00 - 08:00');

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
