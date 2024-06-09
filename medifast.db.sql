BEGIN TRANSACTION;
DROP TABLE IF EXISTS "antrian";
CREATE TABLE IF NOT EXISTS "antrian" (
	"id_antrian"	INTEGER,
	"tanggal"	DATE,
	"current_antrian"	INTEGER,
	"max_antrian"	INTEGER,
	"id_doctor_shift"	INTEGER,
	FOREIGN KEY("id_doctor_shift") REFERENCES "doctor_shift"("id_doctor_shift") ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY("id_antrian" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "article";
CREATE TABLE IF NOT EXISTS "article" (
	"id"	INTEGER,
	"title"	TEXT,
	"author"	TEXT,
	"photo"	TEXT,
	"content"	TEXT,
	"created_at"	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	"updated_at"	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "catatan_doctor";
CREATE TABLE IF NOT EXISTS "catatan_doctor" (
	"id_catatan_doctor"	INTEGER,
	"gejala"	TEXT,
	"diagnosa"	TEXT,
	PRIMARY KEY("id_catatan_doctor" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "doctor";
CREATE TABLE IF NOT EXISTS "doctor" (
	"id"	INTEGER,
	"name"	TEXT DEFAULT NULL,
	"photo"	TEXT DEFAULT NULL,
	"specialty"	TEXT DEFAULT NULL,
	"rating"	TEXT DEFAULT NULL,
	"experience"	INTEGER DEFAULT NULL,
	"about"	TEXT DEFAULT NULL,
	"schedule"	TEXT DEFAULT NULL,
	"id_spesialis"	INTEGER,
	FOREIGN KEY("id_spesialis") REFERENCES "spesialis"("id_spesialis") ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "doctor_shift";
CREATE TABLE IF NOT EXISTS "doctor_shift" (
	"id_doctor_shift"	INTEGER,
	"id_doctor"	INTEGER,
	"id_shift"	INTEGER,
	FOREIGN KEY("id_doctor") REFERENCES "doctor"("id") ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY("id_shift") REFERENCES "shift"("id_shift") ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY("id_doctor_shift" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "obat";
CREATE TABLE IF NOT EXISTS "obat" (
	"id_obat"	INTEGER,
	"nama_obat"	TEXT,
	"tipe"	TEXT,
	"harga_satuan"	TEXT,
	PRIMARY KEY("id_obat" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "pasien";
CREATE TABLE IF NOT EXISTS "pasien" (
	"id_pasien"	INTEGER,
	"nama_pasien"	TEXT,
	"umur"	INTEGER,
	"jenis_kelamin"	TEXT,
	"keluhan"	TEXT,
	"alamat"	TEXT,
	PRIMARY KEY("id_pasien" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "resep_digital";
CREATE TABLE IF NOT EXISTS "resep_digital" (
	"id_resep_digital"	INTEGER,
	"id_doctor"	INTEGER,
	"id_pasien"	INTEGER,
	"id_obat"	INTEGER,
	FOREIGN KEY("id_doctor") REFERENCES "doctor"("id") ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY("id_obat") REFERENCES "obat"("id_obat") ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY("id_pasien") REFERENCES "pasien"("id_pasien") ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY("id_resep_digital" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "riwayat_transaksi";
CREATE TABLE IF NOT EXISTS "riwayat_transaksi" (
	"id_riwayat_transaksi"	INTEGER,
	"status"	VARCHAR(255) DEFAULT NULL,
	"jam"	VARCHAR(255) DEFAULT '',
	"id_doctor"	INTEGER,
	"id_pasien"	INTEGER,
	"id_antrian"	INTEGER,
	"tipe_pembayaran"	VARCHAR(255) DEFAULT NULL,
	"jumlah_pembayaran"	VARCHAR(255) DEFAULT NULL,
	"id_user"	INTEGER,
	"id_resep_digital"	INTEGER,
	"id_catatan_dokter"	INTEGER,
	FOREIGN KEY("id_antrian") REFERENCES "antrian"("id_antrian") ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY("id_catatan_dokter") REFERENCES "catatan_doctor"("id_catatan_doctor") ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY("id_doctor") REFERENCES "doctor"("id") ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY("id_pasien") REFERENCES "pasien"("id_pasien") ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY("id_resep_digital") REFERENCES "resep_digital"("id_resep_digital") ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY("id_user") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY("id_riwayat_transaksi" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "shift";
CREATE TABLE IF NOT EXISTS "shift" (
	"id_shift"	INTEGER,
	"hari"	TEXT,
	"tipe_shift"	TEXT,
	PRIMARY KEY("id_shift" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "spesialis";
CREATE TABLE IF NOT EXISTS "spesialis" (
	"id_spesialis"	INTEGER,
	"nama_spesialis"	TEXT,
	PRIMARY KEY("id_spesialis" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "token";
CREATE TABLE IF NOT EXISTS "token" (
	"user_id"	INTEGER NOT NULL,
	"access_token"	TEXT NOT NULL,
	"refresh_token"	TEXT NOT NULL,
	"status"	INTEGER,
	"created_date"	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("access_token"),
	FOREIGN KEY("user_id") REFERENCES "user"("id")
);
DROP TABLE IF EXISTS "user";
CREATE TABLE IF NOT EXISTS "user" (
	"id"	INTEGER,
	"firstname"	TEXT,
	"lastname"	TEXT,
	"email"	TEXT,
	"telephone"	TEXT,
	"hashed_password"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "user_doctor_favorite";
CREATE TABLE IF NOT EXISTS "user_doctor_favorite" (
	"id"	INTEGER,
	"id_user"	INTEGER,
	"id_doctor"	INTEGER,
	UNIQUE("id_user","id_doctor"),
	FOREIGN KEY("id_user") REFERENCES "user"("id"),
	FOREIGN KEY("id_doctor") REFERENCES "doctor"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "antrian" ("id_antrian","tanggal","current_antrian","max_antrian","id_doctor_shift") VALUES (1,'2024-06-03',1,10,1),
 (2,'2024-06-09',2,10,1),
 (3,'2024-06-09',3,10,1),
 (4,'2024-06-09',4,10,1),
 (5,'2024-06-09',5,10,1),
 (6,'2024-06-09',6,10,1),
 (7,'2024-06-09',7,10,1),
 (8,'2024-06-09',8,10,1),
 (9,'2024-06-09',9,10,1),
 (10,'2024-06-09',10,10,1),
 (11,'2024-06-09',1,10,2),
 (12,'2024-06-09',2,10,2),
 (13,'2024-06-09',3,10,2),
 (14,'2024-06-09',4,10,2),
 (15,'2024-06-09',5,10,2),
 (16,'2024-06-09',6,10,2),
 (17,'2024-06-09',7,10,2),
 (18,'2024-06-09',8,10,2),
 (19,'2024-06-09',9,10,2),
 (20,'2024-06-09',10,10,2),
 (21,'2024-06-09',1,10,3),
 (22,'2024-06-09',2,10,3),
 (23,'2024-06-09',3,10,3),
 (24,'2024-06-09',4,10,3),
 (25,'2024-06-09',5,10,3),
 (26,'2024-06-09',6,10,3),
 (27,'2024-06-09',7,10,3),
 (28,'2024-06-09',8,10,3),
 (29,'2024-06-09',9,10,3),
 (30,'2024-06-09',10,10,3),
 (31,'2024-06-09',1,10,4),
 (32,'2024-06-09',2,10,4),
 (33,'2024-06-09',3,10,4),
 (34,'2024-06-09',4,10,4),
 (35,'2024-06-09',5,10,4),
 (36,'2024-06-09',6,10,4),
 (37,'2024-06-09',7,10,4),
 (38,'2024-06-09',8,10,4),
 (39,'2024-06-09',9,10,4),
 (40,'2024-06-09',10,10,4),
 (41,'2024-06-09',1,10,5),
 (42,'2024-06-09',2,10,5),
 (43,'2024-06-09',3,10,5),
 (44,'2024-06-09',4,10,5),
 (45,'2024-06-09',5,10,5),
 (46,'2024-06-09',6,10,5),
 (47,'2024-06-09',7,10,5),
 (48,'2024-06-09',8,10,5),
 (49,'2024-06-09',9,10,5),
 (50,'2024-06-09',10,10,5),
 (51,'2024-06-10',1,10,1),
 (52,'2024-06-10',2,10,1),
 (53,'2024-06-10',3,10,1),
 (54,'2024-06-10',4,10,1),
 (55,'2024-06-10',5,10,1),
 (56,'2024-06-10',6,10,1),
 (57,'2024-06-10',7,10,1),
 (58,'2024-06-10',8,10,1),
 (59,'2024-06-10',9,10,1),
 (60,'2024-06-10',10,10,1),
 (61,'2024-06-10',1,10,2),
 (62,'2024-06-10',2,10,2),
 (63,'2024-06-10',3,10,2),
 (64,'2024-06-10',4,10,2),
 (65,'2024-06-10',5,10,2),
 (66,'2024-06-10',6,10,2),
 (67,'2024-06-10',7,10,2),
 (68,'2024-06-10',8,10,2),
 (69,'2024-06-10',9,10,2),
 (70,'2024-06-10',10,10,2),
 (71,'2024-06-10',1,10,3),
 (72,'2024-06-10',2,10,3),
 (73,'2024-06-10',3,10,3),
 (74,'2024-06-10',4,10,3),
 (75,'2024-06-10',5,10,3),
 (76,'2024-06-10',6,10,3),
 (77,'2024-06-10',7,10,3),
 (78,'2024-06-10',8,10,3),
 (79,'2024-06-10',9,10,3),
 (80,'2024-06-10',10,10,3),
 (81,'2024-06-10',1,10,4),
 (82,'2024-06-10',2,10,4),
 (83,'2024-06-10',3,10,4),
 (84,'2024-06-10',4,10,4),
 (85,'2024-06-10',5,10,4),
 (86,'2024-06-10',6,10,4),
 (87,'2024-06-10',7,10,4),
 (88,'2024-06-10',8,10,4),
 (89,'2024-06-10',9,10,4),
 (90,'2024-06-10',10,10,4),
 (91,'2024-06-10',1,10,5),
 (92,'2024-06-10',2,10,5),
 (93,'2024-06-10',3,10,5),
 (94,'2024-06-10',4,10,5),
 (95,'2024-06-10',5,10,5),
 (96,'2024-06-10',6,10,5),
 (97,'2024-06-10',7,10,5),
 (98,'2024-06-10',8,10,5),
 (99,'2024-06-10',9,10,5),
 (100,'2024-06-10',10,10,5),
 (101,'2024-06-11',1,10,1),
 (102,'2024-06-11',2,10,1),
 (103,'2024-06-11',3,10,1),
 (104,'2024-06-11',4,10,1),
 (105,'2024-06-11',5,10,1),
 (106,'2024-06-11',6,10,1),
 (107,'2024-06-11',7,10,1),
 (108,'2024-06-11',8,10,1),
 (109,'2024-06-11',9,10,1),
 (110,'2024-06-11',10,10,1),
 (111,'2024-06-11',1,10,2),
 (112,'2024-06-11',2,10,2),
 (113,'2024-06-11',3,10,2),
 (114,'2024-06-11',4,10,2),
 (115,'2024-06-11',5,10,2),
 (116,'2024-06-11',6,10,2),
 (117,'2024-06-11',7,10,2),
 (118,'2024-06-11',8,10,2),
 (119,'2024-06-11',9,10,2),
 (120,'2024-06-11',10,10,2),
 (121,'2024-06-11',1,10,3),
 (122,'2024-06-11',2,10,3),
 (123,'2024-06-11',3,10,3),
 (124,'2024-06-11',4,10,3),
 (125,'2024-06-11',5,10,3),
 (126,'2024-06-11',6,10,3),
 (127,'2024-06-11',7,10,3),
 (128,'2024-06-11',8,10,3),
 (129,'2024-06-11',9,10,3),
 (130,'2024-06-11',10,10,3),
 (131,'2024-06-11',1,10,4),
 (132,'2024-06-11',2,10,4),
 (133,'2024-06-11',3,10,4),
 (134,'2024-06-11',4,10,4),
 (135,'2024-06-11',5,10,4),
 (136,'2024-06-11',6,10,4),
 (137,'2024-06-11',7,10,4),
 (138,'2024-06-11',8,10,4),
 (139,'2024-06-11',9,10,4),
 (140,'2024-06-11',10,10,4),
 (141,'2024-06-11',1,10,5),
 (142,'2024-06-11',2,10,5),
 (143,'2024-06-11',3,10,5),
 (144,'2024-06-11',4,10,5),
 (145,'2024-06-11',5,10,5),
 (146,'2024-06-11',6,10,5),
 (147,'2024-06-11',7,10,5),
 (148,'2024-06-11',8,10,5),
 (149,'2024-06-11',9,10,5),
 (150,'2024-06-11',10,10,5),
 (151,'2024-06-12',1,10,1),
 (152,'2024-06-12',2,10,1),
 (153,'2024-06-12',3,10,1),
 (154,'2024-06-12',4,10,1),
 (155,'2024-06-12',5,10,1),
 (156,'2024-06-12',6,10,1),
 (157,'2024-06-12',7,10,1),
 (158,'2024-06-12',8,10,1),
 (159,'2024-06-12',9,10,1),
 (160,'2024-06-12',10,10,1),
 (161,'2024-06-12',1,10,2),
 (162,'2024-06-12',2,10,2),
 (163,'2024-06-12',3,10,2),
 (164,'2024-06-12',4,10,2),
 (165,'2024-06-12',5,10,2),
 (166,'2024-06-12',6,10,2),
 (167,'2024-06-12',7,10,2),
 (168,'2024-06-12',8,10,2),
 (169,'2024-06-12',9,10,2),
 (170,'2024-06-12',10,10,2),
 (171,'2024-06-12',1,10,3),
 (172,'2024-06-12',2,10,3),
 (173,'2024-06-12',3,10,3),
 (174,'2024-06-12',4,10,3),
 (175,'2024-06-12',5,10,3),
 (176,'2024-06-12',6,10,3),
 (177,'2024-06-12',7,10,3),
 (178,'2024-06-12',8,10,3),
 (179,'2024-06-12',9,10,3),
 (180,'2024-06-12',10,10,3),
 (181,'2024-06-12',1,10,4),
 (182,'2024-06-12',2,10,4),
 (183,'2024-06-12',3,10,4),
 (184,'2024-06-12',4,10,4),
 (185,'2024-06-12',5,10,4),
 (186,'2024-06-12',6,10,4),
 (187,'2024-06-12',7,10,4),
 (188,'2024-06-12',8,10,4),
 (189,'2024-06-12',9,10,4),
 (190,'2024-06-12',10,10,4),
 (191,'2024-06-12',1,10,5),
 (192,'2024-06-12',2,10,5),
 (193,'2024-06-12',3,10,5),
 (194,'2024-06-12',4,10,5),
 (195,'2024-06-12',5,10,5),
 (196,'2024-06-12',6,10,5),
 (197,'2024-06-12',7,10,5),
 (198,'2024-06-12',8,10,5),
 (199,'2024-06-12',9,10,5),
 (200,'2024-06-12',10,10,5),
 (201,'2024-06-13',1,10,1),
 (202,'2024-06-13',2,10,1),
 (203,'2024-06-13',3,10,1),
 (204,'2024-06-13',4,10,1),
 (205,'2024-06-13',5,10,1),
 (206,'2024-06-13',6,10,1),
 (207,'2024-06-13',7,10,1),
 (208,'2024-06-13',8,10,1),
 (209,'2024-06-13',9,10,1),
 (210,'2024-06-13',10,10,1),
 (211,'2024-06-13',1,10,2),
 (212,'2024-06-13',2,10,2),
 (213,'2024-06-13',3,10,2),
 (214,'2024-06-13',4,10,2),
 (215,'2024-06-13',5,10,2),
 (216,'2024-06-13',6,10,2),
 (217,'2024-06-13',7,10,2),
 (218,'2024-06-13',8,10,2),
 (219,'2024-06-13',9,10,2),
 (220,'2024-06-13',10,10,2),
 (221,'2024-06-13',1,10,3),
 (222,'2024-06-13',2,10,3),
 (223,'2024-06-13',3,10,3),
 (224,'2024-06-13',4,10,3),
 (225,'2024-06-13',5,10,3),
 (226,'2024-06-13',6,10,3),
 (227,'2024-06-13',7,10,3),
 (228,'2024-06-13',8,10,3),
 (229,'2024-06-13',9,10,3),
 (230,'2024-06-13',10,10,3),
 (231,'2024-06-13',1,10,4),
 (232,'2024-06-13',2,10,4),
 (233,'2024-06-13',3,10,4),
 (234,'2024-06-13',4,10,4),
 (235,'2024-06-13',5,10,4),
 (236,'2024-06-13',6,10,4),
 (237,'2024-06-13',7,10,4),
 (238,'2024-06-13',8,10,4),
 (239,'2024-06-13',9,10,4),
 (240,'2024-06-13',10,10,4),
 (241,'2024-06-13',1,10,5),
 (242,'2024-06-13',2,10,5),
 (243,'2024-06-13',3,10,5),
 (244,'2024-06-13',4,10,5),
 (245,'2024-06-13',5,10,5),
 (246,'2024-06-13',6,10,5),
 (247,'2024-06-13',7,10,5),
 (248,'2024-06-13',8,10,5),
 (249,'2024-06-13',9,10,5),
 (250,'2024-06-13',10,10,5),
 (251,'2024-06-14',1,10,1),
 (252,'2024-06-14',2,10,1),
 (253,'2024-06-14',3,10,1),
 (254,'2024-06-14',4,10,1),
 (255,'2024-06-14',5,10,1),
 (256,'2024-06-14',6,10,1),
 (257,'2024-06-14',7,10,1),
 (258,'2024-06-14',8,10,1),
 (259,'2024-06-14',9,10,1),
 (260,'2024-06-14',10,10,1),
 (261,'2024-06-14',1,10,2),
 (262,'2024-06-14',2,10,2),
 (263,'2024-06-14',3,10,2),
 (264,'2024-06-14',4,10,2),
 (265,'2024-06-14',5,10,2),
 (266,'2024-06-14',6,10,2),
 (267,'2024-06-14',7,10,2),
 (268,'2024-06-14',8,10,2),
 (269,'2024-06-14',9,10,2),
 (270,'2024-06-14',10,10,2),
 (271,'2024-06-14',1,10,3),
 (272,'2024-06-14',2,10,3),
 (273,'2024-06-14',3,10,3),
 (274,'2024-06-14',4,10,3),
 (275,'2024-06-14',5,10,3),
 (276,'2024-06-14',6,10,3),
 (277,'2024-06-14',7,10,3),
 (278,'2024-06-14',8,10,3),
 (279,'2024-06-14',9,10,3),
 (280,'2024-06-14',10,10,3),
 (281,'2024-06-14',1,10,4),
 (282,'2024-06-14',2,10,4),
 (283,'2024-06-14',3,10,4),
 (284,'2024-06-14',4,10,4),
 (285,'2024-06-14',5,10,4),
 (286,'2024-06-14',6,10,4),
 (287,'2024-06-14',7,10,4),
 (288,'2024-06-14',8,10,4),
 (289,'2024-06-14',9,10,4),
 (290,'2024-06-14',10,10,4),
 (291,'2024-06-14',1,10,5),
 (292,'2024-06-14',2,10,5),
 (293,'2024-06-14',3,10,5),
 (294,'2024-06-14',4,10,5),
 (295,'2024-06-14',5,10,5),
 (296,'2024-06-14',6,10,5),
 (297,'2024-06-14',7,10,5),
 (298,'2024-06-14',8,10,5),
 (299,'2024-06-14',9,10,5),
 (300,'2024-06-14',10,10,5),
 (301,'2024-06-15',1,10,1),
 (302,'2024-06-15',2,10,1),
 (303,'2024-06-15',3,10,1),
 (304,'2024-06-15',4,10,1),
 (305,'2024-06-15',5,10,1),
 (306,'2024-06-15',6,10,1),
 (307,'2024-06-15',7,10,1),
 (308,'2024-06-15',8,10,1),
 (309,'2024-06-15',9,10,1),
 (310,'2024-06-15',10,10,1),
 (311,'2024-06-15',1,10,2),
 (312,'2024-06-15',2,10,2),
 (313,'2024-06-15',3,10,2),
 (314,'2024-06-15',4,10,2),
 (315,'2024-06-15',5,10,2),
 (316,'2024-06-15',6,10,2),
 (317,'2024-06-15',7,10,2),
 (318,'2024-06-15',8,10,2),
 (319,'2024-06-15',9,10,2),
 (320,'2024-06-15',10,10,2),
 (321,'2024-06-15',1,10,3),
 (322,'2024-06-15',2,10,3),
 (323,'2024-06-15',3,10,3),
 (324,'2024-06-15',4,10,3),
 (325,'2024-06-15',5,10,3),
 (326,'2024-06-15',6,10,3),
 (327,'2024-06-15',7,10,3),
 (328,'2024-06-15',8,10,3),
 (329,'2024-06-15',9,10,3),
 (330,'2024-06-15',10,10,3),
 (331,'2024-06-15',1,10,4),
 (332,'2024-06-15',2,10,4),
 (333,'2024-06-15',3,10,4),
 (334,'2024-06-15',4,10,4),
 (335,'2024-06-15',5,10,4),
 (336,'2024-06-15',6,10,4),
 (337,'2024-06-15',7,10,4),
 (338,'2024-06-15',8,10,4),
 (339,'2024-06-15',9,10,4),
 (340,'2024-06-15',10,10,4),
 (341,'2024-06-15',1,10,5),
 (342,'2024-06-15',2,10,5),
 (343,'2024-06-15',3,10,5),
 (344,'2024-06-15',4,10,5),
 (345,'2024-06-15',5,10,5),
 (346,'2024-06-15',6,10,5),
 (347,'2024-06-15',7,10,5),
 (348,'2024-06-15',8,10,5),
 (349,'2024-06-15',9,10,5),
 (350,'2024-06-15',10,10,5);
INSERT INTO "article" ("id","title","author","photo","content","created_at","updated_at") VALUES (1,'4 Rekomendasi Obat Maag yang Ampuh','John Doe','artikel2.png','1. Mylanta: Mylanta adalah salah satu obat maag yang bagus dan banyak dikenal masyarakat. Obat ini mengandung kombinasi dari magnesium hidroksida dan aluminium hidroksida yang dapat meredakan sakit maag.\n 2. Promag: Promag juga merupakan pilihan obat maag yang bagus dan mudah didapatkan di apotek maupun warung. Obat ini juga mengandung magnesium hidroksida dan aluminium hidroksida.\n 3. Polysilane: Polysilane adalah obat maag yang dapat membantu mengatasi masalah maag dan gangguan pencernaan lain seperti perut kembung dan rasa tidak nyaman di perut.\n 4. Polycrol Forte: Polycrol Forte adalah obat maag cair yang mengandung aluminium hidroksida, magnesium hidroksida, dan methylpolysiloxane. Obat ini efektif untuk mengobati gangguan pada saluran pencernaan seperti gastritis, perut kembung, maag, hiatus hernia, tukak lambung, dan usus duabelas jari.','2024-04-11 00:00:00','2024-04-21 00:00:00'),
 (2,'5 Rekomendasi Obat Pusing paling ampuh','ilham','artikel3.png','1. Paracetamol dapat dikonsumsi sebelum atau sesudah makan. Minumlah obat ini dengan bantuan segelas air. 2. Sebelum mengonsumsi paracetamol sirop atau tetes, kocok botol terlebih dahulu. 3. Gunakan alat takar atau pipet yang tersedia di dalam kemasan paracetamol sirop maupun tetes. Jangan menggunakan sendok makan atau sendok teh karena dosisnya bisa tidak sesuai. 4. Paracetamol tidak untuk digunakan dalam jangka panjang. Konsumsi obat ini bisa segera dihentikan begitu keluhan mereda. 5. Bila demam belum membaik setelah 3 hari atau nyeri belum mereda setelah 7 hari, hentikan konsumsi paracetamol dan konsultasikan ke dokter. 6. Pada anak-anak, segera bawa ia ke dokter jika demam belum turun setelah 3 hari, atau nyeri belum membaik setelah 5 hari pemberian paracetamol. 7. Simpan paracetamol di tempat bersuhu ruangan dan terhindar dari paparan sinar matahari langsung. Jauhkan obat dari jangkauan anak-anak.','2024-06-06 10:28:36','2024-06-06 10:28:36'),
 (3,'6 Rekomendasi Obat Tidur','repan','artikel4.png','1. Sandepril adalah obat dengan kandungan maprotiline hidroklorida (HCl) yang termasuk pada golongan antidepresan trisiklik (TCA). Sandepril adalah obat yang bermanfaat untuk mengatasi depresi mayor. 2. Depresi mayor sendiri merupakan gangguan kejiwaan yang mengakibatkan terjadinya gangguan suasana hati dan perilaku. 3. Cara kerja dari Sandepril adalah menghambat pengembalian serotonin dan norepinefrin di otak. Efeknya ini akan menimbulkan peningkatan neurotransmitter (senyawa kimia yang membawa pesan antarsaraf) sehingga dapat memperbaiki suasana hati. 4. Sandepril diproduksi dalam bentuk sediaan tablet salut selaput. Selain sandepril, terdapat juga obat antikecemasan (alprazolam) dengan kandungan benzodiazepin, yang mungkin diresepkan dokter untuk pengidap depresi.','2024-06-07 16:20:09','2024-06-07 16:20:09'),
 (4,'Rekomendasi Obat Mual dan Sakit Perut','Adrian','artikel5.png','1. Polysilane adalah obat untuk mengurangi gejala-gejala yang berhubungan dengan kelebihan produksi asam lambung, GERD, hingga mag. 2. Obat Polysilane mengandung aluminium hydroxide, magnesium hydroxide, dan simethicone. 3. Aluminium hidroksida adalah salah satu jenis obat antasida, yang digunakan untuk menangani gejala akibat produksi asam lambung yang berlebihan. 4. Sementara magnesium hidroksida adalah antasida yang digunakan bersama-sama dengan aluminium hidroksida untuk menetralkan asam lambung. 5. Simethicone digunakan untuk mengurangi kembung, ketidaknyamanan, atau rasa sakit akibat gas berlebihan dalam perut atau usus. 6. Obat Polysilane tersedia dalam bentuk suspensi, tablet kunyah, dan kaplet. Bagaimana dosis, efek samping dan manfaat Polysilane? Simak di bawah ini.','2024-06-07 16:27:34','2024-06-07 16:27:34');
INSERT INTO "catatan_doctor" ("id_catatan_doctor","gejala","diagnosa") VALUES (1,'Anak tubuh panas melebihi 37°C, batuk pilek dan flu, muntah berkepanjangan, jarang buang air kecil, tidak mengeluarkan air mata saat menangis, dan lemas.','Mengalami Demam'),
 (2,'Nafsu Makan Berkurang, Demam Tinggi mencapai 40°C, Keringat Berlebih, Diare dan Sembelit','Mengalami Tipes'),
 (3,'Refluks asam lambung, Asma, Alergi,  Infeksi saluran pernapasan atas','Mengalami Batuk');
INSERT INTO "doctor" ("id","name","photo","specialty","rating","experience","about","schedule","id_spesialis") VALUES (1,'Dr. Eki Rakhmah Z, Sp.A','dokter_1.png','Dokter Anak','4.8',1,'ramah, dan tegas','senin, 07:00 - 08:00',3),
 (2,'Dr. Hudi Heriyanto','dokter_4.png','Dokter Umum','4.2',2,'galak,serius','selasa, 07:00 - 08:00',8),
 (3,'Dr. Rina wijaya','dokter_2.png','Dokter Dalam','4.8',10,'ramah, cantik','rabu, 07:00 - 08:00',1),
 (4,'Dr. Budi Santoso, Sp.A','dokter_5.png','Dokter Anak','4.3',11,'ramah, pengertian','kamis, 07:00 - 08:00',2),
 (5,'Dr. Lilis','dokter_3.png','Dokter Umum','4.5',5,'ceria, baik','jumat, 07:00 - 08:00',6);
INSERT INTO "doctor_shift" ("id_doctor_shift","id_doctor","id_shift") VALUES (1,1,3),
 (2,2,1),
 (3,3,12),
 (4,4,7),
 (5,5,14);
INSERT INTO "obat" ("id_obat","nama_obat","tipe","harga_satuan") VALUES (1,'paracetamol','strip','1000'),
 (2,'amblodifin','kaplet','37000'),
 (3,'paramex','sirup','8000');
INSERT INTO "pasien" ("id_pasien","nama_pasien","umur","jenis_kelamin","keluhan","alamat") VALUES (1,'ilham akbar',21,'laki-laki','sakit perut','jalan ciwaruga'),
 (2,'adrian mulianto',22,'laki-laki','mual dan pusing','cilimus'),
 (3,'repan dhia',23,'laki-laki','batuk','gerlong bawah');
INSERT INTO "resep_digital" ("id_resep_digital","id_doctor","id_pasien","id_obat") VALUES (1,1,1,1),
 (2,3,2,2),
 (3,5,3,3);
INSERT INTO "riwayat_transaksi" ("id_riwayat_transaksi","status","jam","id_doctor","id_pasien","id_antrian","tipe_pembayaran","jumlah_pembayaran","id_user","id_resep_digital","id_catatan_dokter") VALUES (1,'Segera','02:00',1,1,97,'BCA','120000',4,1,3),
 (2,'Selesai','12:00',4,2,99,'BNI','1500000',1,2,2),
 (3,'Batal','05:00',5,3,35,'Bayar Ditempat','480000',3,3,1);
INSERT INTO "shift" ("id_shift","hari","tipe_shift") VALUES (1,'Senin','Pagi'),
 (2,'Senin','Sore'),
 (3,'Selasa','Pagi'),
 (4,'Selasa','Sore'),
 (5,'Rabu','Pagi'),
 (6,'Rabu','Sore'),
 (7,'Kamis','Pagi'),
 (8,'Kamis','Sore'),
 (9,'Jumat','Pagi'),
 (10,'Jumat','Sore'),
 (11,'Sabtu','Pagi'),
 (12,'Sabtu','Sore'),
 (13,'Minggu','Pagi'),
 (14,'Minggu','Sore');
INSERT INTO "spesialis" ("id_spesialis","nama_spesialis") VALUES (1,'anak'),
 (2,'umum'),
 (3,'dalam'),
 (4,'bedah'),
 (5,'mata'),
 (6,'saraf'),
 (7,'urologi'),
 (8,'patologi');
INSERT INTO "token" ("user_id","access_token","refresh_token","status","created_date") VALUES (6,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5MzE1MzIsInN1YiI6IjYifQ._8lUpf4r8s_JGy1jDl8OnC5J2KHmpeZr_Z5KAZzfPxU','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg1MzQ1MzIsInN1YiI6IjYifQ.WHAnPHTET3HuzXTMORHbZCd3wZE0k3K-10itOSo3Wxw',1,'2024-06-09 17:41:41.499350'),
 (6,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5MzIxMjMsInN1YiI6IjYifQ.ac5kd2ZTFMmsA98EKMELdEpSyYf-WmEBdS_qQ3vI2Q4','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg1MzUxMjMsInN1YiI6IjYifQ.opM-nQXaKVmTLkkI0sL0Ygi3wTkWJXfi5QR5kRC4SSQ',1,'2024-06-09 17:52:01.123647');
INSERT INTO "user" ("id","firstname","lastname","email","telephone","hashed_password") VALUES (1,'wahyu','sanhusi','wahyu@gmail.com','0835478853','password'),
 (2,'agus','william','agus@gmail.com','0835478853','password'),
 (3,'rafi','ahmad','rafi@gmail.com','0835478853','password'),
 (4,'odang','saluhi','odang@gmail.com','0835478853','password'),
 (5,'budi','gunawan','budi@gmail.com','0835478853','password'),
 (6,'a','a','a.com','a','$2b$12$yq3oa4Jhseoe.38GVYU3Cu1n5W2UcKbacu7rWRneCJZPh85oDH0Qi');
INSERT INTO "user_doctor_favorite" ("id","id_user","id_doctor") VALUES (1,1,1),
 (2,1,2),
 (3,2,1),
 (4,3,3),
 (5,4,1),
 (6,4,2),
 (7,4,3);
DROP INDEX IF EXISTS "key_doktershift";
CREATE INDEX IF NOT EXISTS "key_doktershift" ON "antrian" (
	"id_doctor_shift"
);
COMMIT;
