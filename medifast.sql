-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `title` TEXT,
  `photo` TEXT,
  `content` TEXT,
  `createdat` DATE,
  `updatedat` DATE
);

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '4 Rekomendasi Obat Maag yang Ampuh', 'artikel2.png', '1. Mylanta: Mylanta adalah salah satu obat maag yang bagus dan banyak dikenal masyarakat. Obat ini mengandung kombinasi dari magnesium hidroksida dan aluminium hidroksida yang dapat meredakan sakit maag.\\n 2. Promag: Promag juga merupakan pilihan obat maag yang bagus dan mudah didapatkan di apotek maupun warung. Obat ini juga mengandung magnesium hidroksida dan aluminium hidroksida.\\n 3. Polysilane: Polysilane adalah obat maag yang dapat membantu mengatasi masalah maag dan gangguan pencernaan lain seperti perut kembung dan rasa tidak nyaman di perut.\\n 4. Polycrol Forte: Polycrol Forte adalah obat maag cair yang mengandung aluminium hidroksida, magnesium hidroksida, dan methylpolysiloxane. Obat ini efektif untuk mengobati gangguan pada saluran pencernaan seperti gastritis, perut kembung, maag, hiatus hernia, tukak lambung, dan usus duabelas jari.', '2024-04-11', '2024-04-26');

-- ----------------------------
-- Table structure for `doctor`
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` TEXT,
  `photo` TEXT,
  `specialty` TEXT,
  `rating` TEXT,
  `favorited` INTEGER,
  `experience` INTEGER,
  `about` TEXT,
  `schedule` TEXT
);

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, 'Dr. Eki Rakhmah Z, Sp.A', 'dokter_1.png', 'Dokter Anak', '4.8', 1, 1, 'apa ini 1', 'senin, 07:00 - 08:00');
INSERT INTO `doctor` VALUES (2, 'Dr. Yudi Heriyanto', 'dokter_4.png', 'Dokter Umum', '4.2', 0, 2, 'apa ini 2', 'selasa, 07:00 - 08:00');
INSERT INTO `doctor` VALUES (3, 'Dr. Rina wijaya, Sp.PD', 'dokter_2.png', 'Dokter Dalam', '4.8', 0, 10, 'apa ini 3', 'rabu, 07:00 - 08:00');
INSERT INTO `doctor` VALUES (4, 'Dr. Budi Santoso, Sp.A', 'dokter_5.png', 'Dokter Anak', '4.3', 1, 11, 'apa ini 4', 'kamis, 07:00 - 08:00');
INSERT INTO `doctor` VALUES (5, 'Dr. Lilis', 'dokter_3.png', 'Dokter Umum', '4.5', 0, 5, 'apa ini 5', 'jumat, 07:00 - 08:00');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `firstname` TEXT,
  `lastname` TEXT,
  `email` TEXT,
  `telephone` TEXT,
  `password` TEXT
);

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'wahyu', 'sanhusi', 'wahyu@gmail.com', '0835478853', 'password');
INSERT INTO `user` VALUES (2, 'agus', 'william', 'agus@gmail.com', '0835478853', 'password');
INSERT INTO `user` VALUES (3, 'rafi', 'ahmad', 'rafi@gmail.com', '0835478853', 'password');
INSERT INTO `user` VALUES (4, 'odang', 'saluhi', 'odang@gmail.com', '0835478853', 'password');
INSERT INTO `user` VALUES (5, 'budi', 'gunawan', 'budi@gmail.com', '0835478853', 'password');

