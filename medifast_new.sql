-- Drop existing tables if they exist
DROP TABLE IF EXISTS `article`;
DROP TABLE IF EXISTS `doctor`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `token`;
DROP TABLE IF EXISTS `user_doctor_favorite`;

-- Create the user table
CREATE TABLE `user` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `firstname` TEXT,
  `lastname` TEXT,
  `email` TEXT,
  `telephone` TEXT,
  `hashed_password` TEXT
);

-- Create the token table
CREATE TABLE `token` (
  `user_id` INTEGER NOT NULL,
  `access_token` VARCHAR(450) PRIMARY KEY,
  `refresh_token` VARCHAR(450) NOT NULL,
  `status` BOOLEAN,
  `created_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)
);

-- Create the article table
CREATE TABLE `article` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `title` TEXT,
  `author` TEXT,
  `photo` TEXT,
  `content` TEXT,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create the doctor table without the `favorited` column
CREATE TABLE `doctor` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `name` TEXT,
  `photo` TEXT,
  `specialty` TEXT,
  `rating` TEXT,
  `experience` INTEGER,
  `about` TEXT,
  `schedule` TEXT
);

-- Create the user_doctor_favorite table for the relationship between users and doctors
CREATE TABLE `user_doctor_favorite` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `user_id` INTEGER,
  `doctor_id` INTEGER,
  FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
  FOREIGN KEY (`doctor_id`) REFERENCES `doctor`(`id`),
  UNIQUE(`user_id`, `doctor_id`)
);

-- Insert dummy data into the user table
INSERT INTO `user` (`firstname`, `lastname`, `email`, `telephone`, `hashed_password`)
VALUES
('wahyu', 'sanhusi', 'wahyu@gmail.com', '0835478853', 'password'),
('agus', 'william', 'agus@gmail.com', '0835478853', 'password'),
('rafi', 'ahmad', 'rafi@gmail.com', '0835478853', 'password'),
('odang', 'saluhi', 'odang@gmail.com', '0835478853', 'password'),
('budi', 'gunawan', 'budi@gmail.com', '0835478853', 'password');

-- Insert dummy data into the article table (add dummy values for the new columns)
INSERT INTO `article` (`title`, `author`, `photo`, `content`, `created_at`, `updated_at`)
VALUES
('4 Rekomendasi Obat Maag yang Ampuh', 'John Doe', 'artikel2.png', '1. Mylanta: Mylanta adalah salah satu obat maag yang bagus dan banyak dikenal masyarakat. Obat ini mengandung kombinasi dari magnesium hidroksida dan aluminium hidroksida yang dapat meredakan sakit maag.\n 2. Promag: Promag juga merupakan pilihan obat maag yang bagus dan mudah didapatkan di apotek maupun warung. Obat ini juga mengandung magnesium hidroksida dan aluminium hidroksida.\n 3. Polysilane: Polysilane adalah obat maag yang dapat membantu mengatasi masalah maag dan gangguan pencernaan lain seperti perut kembung dan rasa tidak nyaman di perut.\n 4. Polycrol Forte: Polycrol Forte adalah obat maag cair yang mengandung aluminium hidroksida, magnesium hidroksida, dan methylpolysiloxane. Obat ini efektif untuk mengobati gangguan pada saluran pencernaan seperti gastritis, perut kembung, maag, hiatus hernia, tukak lambung, dan usus duabelas jari.', '2024-04-11', '2024-04-21');

-- Insert dummy data into the doctor table (add dummy values for the new columns)
INSERT INTO `doctor` (`name`, `photo`, `specialty`, `rating`, `experience`, `about`, `schedule`)
VALUES
('Dr. Eki Rakhmah Z, Sp.A', 'dokter_1.png', 'Dokter Anak', '4.8', 1, 'apa ini 1', 'senin, 07:00 - 08:00'),
('Dr. Yudi Heriyanto', 'dokter_4.png', 'Dokter Umum', '4.2', 2, 'apa ini 2', 'selasa, 07:00 - 08:00'),
('Dr. Rina wijaya', NULL, 'Dokter Dalam', '4.8', 10, 'apa ini 3', 'rabu, 07:00 - 08:00');


-- Insert dummy data into the user_doctor_favorite table
INSERT INTO `user_doctor_favorite` (`user_id`, `doctor_id`)
VALUES
(1, 1), -- User with id 1 favorited Doctor with id 1
(1, 2), -- User with id 1 favorited Doctor with id 2
(2, 1), -- User with id 2 favorited Doctor with id 1
(3, 3), -- User with id 3 favorited Doctor with id 3
(4, 1), -- User with id 4 favorited Doctor with id 1
(4, 2), -- User with id 4 favorited Doctor with id 2
(4, 3); -- User with id 4 favorited Doctor with id 3
