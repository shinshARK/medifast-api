/*
Navicat MySQL Data Transfer

Source Server         : coba01
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_medifast

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-06-09 16:50:22
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `antrian`
-- ----------------------------
DROP TABLE IF EXISTS `antrian`;
CREATE TABLE `antrian` (
  `id_antrian` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `current_antrian` int(11) DEFAULT NULL,
  `max-antrian` int(11) DEFAULT NULL,
  `id_dokter_shift` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_antrian`),
  KEY `key_doktershift` (`id_dokter_shift`),
  CONSTRAINT `key_doktershift` FOREIGN KEY (`id_dokter_shift`) REFERENCES `dokter_shift` (`id_dokter_shift`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of antrian
-- ----------------------------
INSERT INTO `antrian` VALUES ('1', '2024-06-03', '1', '10', '1');
INSERT INTO `antrian` VALUES ('2', '2024-06-09', '2', '10', '1');
INSERT INTO `antrian` VALUES ('3', '2024-06-09', '3', '10', '1');
INSERT INTO `antrian` VALUES ('4', '2024-06-09', '4', '10', '1');
INSERT INTO `antrian` VALUES ('5', '2024-06-09', '5', '10', '1');
INSERT INTO `antrian` VALUES ('6', '2024-06-09', '6', '10', '1');
INSERT INTO `antrian` VALUES ('7', '2024-06-09', '7', '10', '1');
INSERT INTO `antrian` VALUES ('8', '2024-06-09', '8', '10', '1');
INSERT INTO `antrian` VALUES ('9', '2024-06-09', '9', '10', '1');
INSERT INTO `antrian` VALUES ('10', '2024-06-09', '10', '10', '1');
INSERT INTO `antrian` VALUES ('11', '2024-06-09', '1', '10', '2');
INSERT INTO `antrian` VALUES ('12', '2024-06-09', '2', '10', '2');
INSERT INTO `antrian` VALUES ('13', '2024-06-09', '3', '10', '2');
INSERT INTO `antrian` VALUES ('14', '2024-06-09', '4', '10', '2');
INSERT INTO `antrian` VALUES ('15', '2024-06-09', '5', '10', '2');
INSERT INTO `antrian` VALUES ('16', '2024-06-09', '6', '10', '2');
INSERT INTO `antrian` VALUES ('17', '2024-06-09', '7', '10', '2');
INSERT INTO `antrian` VALUES ('18', '2024-06-09', '8', '10', '2');
INSERT INTO `antrian` VALUES ('19', '2024-06-09', '9', '10', '2');
INSERT INTO `antrian` VALUES ('20', '2024-06-09', '10', '10', '2');
INSERT INTO `antrian` VALUES ('21', '2024-06-09', '1', '10', '3');
INSERT INTO `antrian` VALUES ('22', '2024-06-09', '2', '10', '3');
INSERT INTO `antrian` VALUES ('23', '2024-06-09', '3', '10', '3');
INSERT INTO `antrian` VALUES ('24', '2024-06-09', '4', '10', '3');
INSERT INTO `antrian` VALUES ('25', '2024-06-09', '5', '10', '3');
INSERT INTO `antrian` VALUES ('26', '2024-06-09', '6', '10', '3');
INSERT INTO `antrian` VALUES ('27', '2024-06-09', '7', '10', '3');
INSERT INTO `antrian` VALUES ('28', '2024-06-09', '8', '10', '3');
INSERT INTO `antrian` VALUES ('29', '2024-06-09', '9', '10', '3');
INSERT INTO `antrian` VALUES ('30', '2024-06-09', '10', '10', '3');
INSERT INTO `antrian` VALUES ('31', '2024-06-09', '1', '10', '4');
INSERT INTO `antrian` VALUES ('32', '2024-06-09', '2', '10', '4');
INSERT INTO `antrian` VALUES ('33', '2024-06-09', '3', '10', '4');
INSERT INTO `antrian` VALUES ('34', '2024-06-09', '4', '10', '4');
INSERT INTO `antrian` VALUES ('35', '2024-06-09', '5', '10', '4');
INSERT INTO `antrian` VALUES ('36', '2024-06-09', '6', '10', '4');
INSERT INTO `antrian` VALUES ('37', '2024-06-09', '7', '10', '4');
INSERT INTO `antrian` VALUES ('38', '2024-06-09', '8', '10', '4');
INSERT INTO `antrian` VALUES ('39', '2024-06-09', '9', '10', '4');
INSERT INTO `antrian` VALUES ('40', '2024-06-09', '10', '10', '4');
INSERT INTO `antrian` VALUES ('41', '2024-06-09', '1', '10', '5');
INSERT INTO `antrian` VALUES ('42', '2024-06-09', '2', '10', '5');
INSERT INTO `antrian` VALUES ('43', '2024-06-09', '3', '10', '5');
INSERT INTO `antrian` VALUES ('44', '2024-06-09', '4', '10', '5');
INSERT INTO `antrian` VALUES ('45', '2024-06-09', '5', '10', '5');
INSERT INTO `antrian` VALUES ('46', '2024-06-09', '6', '10', '5');
INSERT INTO `antrian` VALUES ('47', '2024-06-09', '7', '10', '5');
INSERT INTO `antrian` VALUES ('48', '2024-06-09', '8', '10', '5');
INSERT INTO `antrian` VALUES ('49', '2024-06-09', '9', '10', '5');
INSERT INTO `antrian` VALUES ('50', '2024-06-09', '10', '10', '5');
INSERT INTO `antrian` VALUES ('51', '2024-06-10', '1', '10', '1');
INSERT INTO `antrian` VALUES ('52', '2024-06-10', '2', '10', '1');
INSERT INTO `antrian` VALUES ('53', '2024-06-10', '3', '10', '1');
INSERT INTO `antrian` VALUES ('54', '2024-06-10', '4', '10', '1');
INSERT INTO `antrian` VALUES ('55', '2024-06-10', '5', '10', '1');
INSERT INTO `antrian` VALUES ('56', '2024-06-10', '6', '10', '1');
INSERT INTO `antrian` VALUES ('57', '2024-06-10', '7', '10', '1');
INSERT INTO `antrian` VALUES ('58', '2024-06-10', '8', '10', '1');
INSERT INTO `antrian` VALUES ('59', '2024-06-10', '9', '10', '1');
INSERT INTO `antrian` VALUES ('60', '2024-06-10', '10', '10', '1');
INSERT INTO `antrian` VALUES ('61', '2024-06-10', '1', '10', '2');
INSERT INTO `antrian` VALUES ('62', '2024-06-10', '2', '10', '2');
INSERT INTO `antrian` VALUES ('63', '2024-06-10', '3', '10', '2');
INSERT INTO `antrian` VALUES ('64', '2024-06-10', '4', '10', '2');
INSERT INTO `antrian` VALUES ('65', '2024-06-10', '5', '10', '2');
INSERT INTO `antrian` VALUES ('66', '2024-06-10', '6', '10', '2');
INSERT INTO `antrian` VALUES ('67', '2024-06-10', '7', '10', '2');
INSERT INTO `antrian` VALUES ('68', '2024-06-10', '8', '10', '2');
INSERT INTO `antrian` VALUES ('69', '2024-06-10', '9', '10', '2');
INSERT INTO `antrian` VALUES ('70', '2024-06-10', '10', '10', '2');
INSERT INTO `antrian` VALUES ('71', '2024-06-10', '1', '10', '3');
INSERT INTO `antrian` VALUES ('72', '2024-06-10', '2', '10', '3');
INSERT INTO `antrian` VALUES ('73', '2024-06-10', '3', '10', '3');
INSERT INTO `antrian` VALUES ('74', '2024-06-10', '4', '10', '3');
INSERT INTO `antrian` VALUES ('75', '2024-06-10', '5', '10', '3');
INSERT INTO `antrian` VALUES ('76', '2024-06-10', '6', '10', '3');
INSERT INTO `antrian` VALUES ('77', '2024-06-10', '7', '10', '3');
INSERT INTO `antrian` VALUES ('78', '2024-06-10', '8', '10', '3');
INSERT INTO `antrian` VALUES ('79', '2024-06-10', '9', '10', '3');
INSERT INTO `antrian` VALUES ('80', '2024-06-10', '10', '10', '3');
INSERT INTO `antrian` VALUES ('81', '2024-06-10', '1', '10', '4');
INSERT INTO `antrian` VALUES ('82', '2024-06-10', '2', '10', '4');
INSERT INTO `antrian` VALUES ('83', '2024-06-10', '3', '10', '4');
INSERT INTO `antrian` VALUES ('84', '2024-06-10', '4', '10', '4');
INSERT INTO `antrian` VALUES ('85', '2024-06-10', '5', '10', '4');
INSERT INTO `antrian` VALUES ('86', '2024-06-10', '6', '10', '4');
INSERT INTO `antrian` VALUES ('87', '2024-06-10', '7', '10', '4');
INSERT INTO `antrian` VALUES ('88', '2024-06-10', '8', '10', '4');
INSERT INTO `antrian` VALUES ('89', '2024-06-10', '9', '10', '4');
INSERT INTO `antrian` VALUES ('90', '2024-06-10', '10', '10', '4');
INSERT INTO `antrian` VALUES ('91', '2024-06-10', '1', '10', '5');
INSERT INTO `antrian` VALUES ('92', '2024-06-10', '2', '10', '5');
INSERT INTO `antrian` VALUES ('93', '2024-06-10', '3', '10', '5');
INSERT INTO `antrian` VALUES ('94', '2024-06-10', '4', '10', '5');
INSERT INTO `antrian` VALUES ('95', '2024-06-10', '5', '10', '5');
INSERT INTO `antrian` VALUES ('96', '2024-06-10', '6', '10', '5');
INSERT INTO `antrian` VALUES ('97', '2024-06-10', '7', '10', '5');
INSERT INTO `antrian` VALUES ('98', '2024-06-10', '8', '10', '5');
INSERT INTO `antrian` VALUES ('99', '2024-06-10', '9', '10', '5');
INSERT INTO `antrian` VALUES ('100', '2024-06-10', '10', '10', '5');
INSERT INTO `antrian` VALUES ('101', '2024-06-11', '1', '10', '1');
INSERT INTO `antrian` VALUES ('102', '2024-06-11', '2', '10', '1');
INSERT INTO `antrian` VALUES ('103', '2024-06-11', '3', '10', '1');
INSERT INTO `antrian` VALUES ('104', '2024-06-11', '4', '10', '1');
INSERT INTO `antrian` VALUES ('105', '2024-06-11', '5', '10', '1');
INSERT INTO `antrian` VALUES ('106', '2024-06-11', '6', '10', '1');
INSERT INTO `antrian` VALUES ('107', '2024-06-11', '7', '10', '1');
INSERT INTO `antrian` VALUES ('108', '2024-06-11', '8', '10', '1');
INSERT INTO `antrian` VALUES ('109', '2024-06-11', '9', '10', '1');
INSERT INTO `antrian` VALUES ('110', '2024-06-11', '10', '10', '1');
INSERT INTO `antrian` VALUES ('111', '2024-06-11', '1', '10', '2');
INSERT INTO `antrian` VALUES ('112', '2024-06-11', '2', '10', '2');
INSERT INTO `antrian` VALUES ('113', '2024-06-11', '3', '10', '2');
INSERT INTO `antrian` VALUES ('114', '2024-06-11', '4', '10', '2');
INSERT INTO `antrian` VALUES ('115', '2024-06-11', '5', '10', '2');
INSERT INTO `antrian` VALUES ('116', '2024-06-11', '6', '10', '2');
INSERT INTO `antrian` VALUES ('117', '2024-06-11', '7', '10', '2');
INSERT INTO `antrian` VALUES ('118', '2024-06-11', '8', '10', '2');
INSERT INTO `antrian` VALUES ('119', '2024-06-11', '9', '10', '2');
INSERT INTO `antrian` VALUES ('120', '2024-06-11', '10', '10', '2');
INSERT INTO `antrian` VALUES ('121', '2024-06-11', '1', '10', '3');
INSERT INTO `antrian` VALUES ('122', '2024-06-11', '2', '10', '3');
INSERT INTO `antrian` VALUES ('123', '2024-06-11', '3', '10', '3');
INSERT INTO `antrian` VALUES ('124', '2024-06-11', '4', '10', '3');
INSERT INTO `antrian` VALUES ('125', '2024-06-11', '5', '10', '3');
INSERT INTO `antrian` VALUES ('126', '2024-06-11', '6', '10', '3');
INSERT INTO `antrian` VALUES ('127', '2024-06-11', '7', '10', '3');
INSERT INTO `antrian` VALUES ('128', '2024-06-11', '8', '10', '3');
INSERT INTO `antrian` VALUES ('129', '2024-06-11', '9', '10', '3');
INSERT INTO `antrian` VALUES ('130', '2024-06-11', '10', '10', '3');
INSERT INTO `antrian` VALUES ('131', '2024-06-11', '1', '10', '4');
INSERT INTO `antrian` VALUES ('132', '2024-06-11', '2', '10', '4');
INSERT INTO `antrian` VALUES ('133', '2024-06-11', '3', '10', '4');
INSERT INTO `antrian` VALUES ('134', '2024-06-11', '4', '10', '4');
INSERT INTO `antrian` VALUES ('135', '2024-06-11', '5', '10', '4');
INSERT INTO `antrian` VALUES ('136', '2024-06-11', '6', '10', '4');
INSERT INTO `antrian` VALUES ('137', '2024-06-11', '7', '10', '4');
INSERT INTO `antrian` VALUES ('138', '2024-06-11', '8', '10', '4');
INSERT INTO `antrian` VALUES ('139', '2024-06-11', '9', '10', '4');
INSERT INTO `antrian` VALUES ('140', '2024-06-11', '10', '10', '4');
INSERT INTO `antrian` VALUES ('141', '2024-06-11', '1', '10', '5');
INSERT INTO `antrian` VALUES ('142', '2024-06-11', '2', '10', '5');
INSERT INTO `antrian` VALUES ('143', '2024-06-11', '3', '10', '5');
INSERT INTO `antrian` VALUES ('144', '2024-06-11', '4', '10', '5');
INSERT INTO `antrian` VALUES ('145', '2024-06-11', '5', '10', '5');
INSERT INTO `antrian` VALUES ('146', '2024-06-11', '6', '10', '5');
INSERT INTO `antrian` VALUES ('147', '2024-06-11', '7', '10', '5');
INSERT INTO `antrian` VALUES ('148', '2024-06-11', '8', '10', '5');
INSERT INTO `antrian` VALUES ('149', '2024-06-11', '9', '10', '5');
INSERT INTO `antrian` VALUES ('150', '2024-06-11', '10', '10', '5');
INSERT INTO `antrian` VALUES ('151', '2024-06-12', '1', '10', '1');
INSERT INTO `antrian` VALUES ('152', '2024-06-12', '2', '10', '1');
INSERT INTO `antrian` VALUES ('153', '2024-06-12', '3', '10', '1');
INSERT INTO `antrian` VALUES ('154', '2024-06-12', '4', '10', '1');
INSERT INTO `antrian` VALUES ('155', '2024-06-12', '5', '10', '1');
INSERT INTO `antrian` VALUES ('156', '2024-06-12', '6', '10', '1');
INSERT INTO `antrian` VALUES ('157', '2024-06-12', '7', '10', '1');
INSERT INTO `antrian` VALUES ('158', '2024-06-12', '8', '10', '1');
INSERT INTO `antrian` VALUES ('159', '2024-06-12', '9', '10', '1');
INSERT INTO `antrian` VALUES ('160', '2024-06-12', '10', '10', '1');
INSERT INTO `antrian` VALUES ('161', '2024-06-12', '1', '10', '2');
INSERT INTO `antrian` VALUES ('162', '2024-06-12', '2', '10', '2');
INSERT INTO `antrian` VALUES ('163', '2024-06-12', '3', '10', '2');
INSERT INTO `antrian` VALUES ('164', '2024-06-12', '4', '10', '2');
INSERT INTO `antrian` VALUES ('165', '2024-06-12', '5', '10', '2');
INSERT INTO `antrian` VALUES ('166', '2024-06-12', '6', '10', '2');
INSERT INTO `antrian` VALUES ('167', '2024-06-12', '7', '10', '2');
INSERT INTO `antrian` VALUES ('168', '2024-06-12', '8', '10', '2');
INSERT INTO `antrian` VALUES ('169', '2024-06-12', '9', '10', '2');
INSERT INTO `antrian` VALUES ('170', '2024-06-12', '10', '10', '2');
INSERT INTO `antrian` VALUES ('171', '2024-06-12', '1', '10', '3');
INSERT INTO `antrian` VALUES ('172', '2024-06-12', '2', '10', '3');
INSERT INTO `antrian` VALUES ('173', '2024-06-12', '3', '10', '3');
INSERT INTO `antrian` VALUES ('174', '2024-06-12', '4', '10', '3');
INSERT INTO `antrian` VALUES ('175', '2024-06-12', '5', '10', '3');
INSERT INTO `antrian` VALUES ('176', '2024-06-12', '6', '10', '3');
INSERT INTO `antrian` VALUES ('177', '2024-06-12', '7', '10', '3');
INSERT INTO `antrian` VALUES ('178', '2024-06-12', '8', '10', '3');
INSERT INTO `antrian` VALUES ('179', '2024-06-12', '9', '10', '3');
INSERT INTO `antrian` VALUES ('180', '2024-06-12', '10', '10', '3');
INSERT INTO `antrian` VALUES ('181', '2024-06-12', '1', '10', '4');
INSERT INTO `antrian` VALUES ('182', '2024-06-12', '2', '10', '4');
INSERT INTO `antrian` VALUES ('183', '2024-06-12', '3', '10', '4');
INSERT INTO `antrian` VALUES ('184', '2024-06-12', '4', '10', '4');
INSERT INTO `antrian` VALUES ('185', '2024-06-12', '5', '10', '4');
INSERT INTO `antrian` VALUES ('186', '2024-06-12', '6', '10', '4');
INSERT INTO `antrian` VALUES ('187', '2024-06-12', '7', '10', '4');
INSERT INTO `antrian` VALUES ('188', '2024-06-12', '8', '10', '4');
INSERT INTO `antrian` VALUES ('189', '2024-06-12', '9', '10', '4');
INSERT INTO `antrian` VALUES ('190', '2024-06-12', '10', '10', '4');
INSERT INTO `antrian` VALUES ('191', '2024-06-12', '1', '10', '5');
INSERT INTO `antrian` VALUES ('192', '2024-06-12', '2', '10', '5');
INSERT INTO `antrian` VALUES ('193', '2024-06-12', '3', '10', '5');
INSERT INTO `antrian` VALUES ('194', '2024-06-12', '4', '10', '5');
INSERT INTO `antrian` VALUES ('195', '2024-06-12', '5', '10', '5');
INSERT INTO `antrian` VALUES ('196', '2024-06-12', '6', '10', '5');
INSERT INTO `antrian` VALUES ('197', '2024-06-12', '7', '10', '5');
INSERT INTO `antrian` VALUES ('198', '2024-06-12', '8', '10', '5');
INSERT INTO `antrian` VALUES ('199', '2024-06-12', '9', '10', '5');
INSERT INTO `antrian` VALUES ('200', '2024-06-12', '10', '10', '5');
INSERT INTO `antrian` VALUES ('201', '2024-06-13', '1', '10', '1');
INSERT INTO `antrian` VALUES ('202', '2024-06-13', '2', '10', '1');
INSERT INTO `antrian` VALUES ('203', '2024-06-13', '3', '10', '1');
INSERT INTO `antrian` VALUES ('204', '2024-06-13', '4', '10', '1');
INSERT INTO `antrian` VALUES ('205', '2024-06-13', '5', '10', '1');
INSERT INTO `antrian` VALUES ('206', '2024-06-13', '6', '10', '1');
INSERT INTO `antrian` VALUES ('207', '2024-06-13', '7', '10', '1');
INSERT INTO `antrian` VALUES ('208', '2024-06-13', '8', '10', '1');
INSERT INTO `antrian` VALUES ('209', '2024-06-13', '9', '10', '1');
INSERT INTO `antrian` VALUES ('210', '2024-06-13', '10', '10', '1');
INSERT INTO `antrian` VALUES ('211', '2024-06-13', '1', '10', '2');
INSERT INTO `antrian` VALUES ('212', '2024-06-13', '2', '10', '2');
INSERT INTO `antrian` VALUES ('213', '2024-06-13', '3', '10', '2');
INSERT INTO `antrian` VALUES ('214', '2024-06-13', '4', '10', '2');
INSERT INTO `antrian` VALUES ('215', '2024-06-13', '5', '10', '2');
INSERT INTO `antrian` VALUES ('216', '2024-06-13', '6', '10', '2');
INSERT INTO `antrian` VALUES ('217', '2024-06-13', '7', '10', '2');
INSERT INTO `antrian` VALUES ('218', '2024-06-13', '8', '10', '2');
INSERT INTO `antrian` VALUES ('219', '2024-06-13', '9', '10', '2');
INSERT INTO `antrian` VALUES ('220', '2024-06-13', '10', '10', '2');
INSERT INTO `antrian` VALUES ('221', '2024-06-13', '1', '10', '3');
INSERT INTO `antrian` VALUES ('222', '2024-06-13', '2', '10', '3');
INSERT INTO `antrian` VALUES ('223', '2024-06-13', '3', '10', '3');
INSERT INTO `antrian` VALUES ('224', '2024-06-13', '4', '10', '3');
INSERT INTO `antrian` VALUES ('225', '2024-06-13', '5', '10', '3');
INSERT INTO `antrian` VALUES ('226', '2024-06-13', '6', '10', '3');
INSERT INTO `antrian` VALUES ('227', '2024-06-13', '7', '10', '3');
INSERT INTO `antrian` VALUES ('228', '2024-06-13', '8', '10', '3');
INSERT INTO `antrian` VALUES ('229', '2024-06-13', '9', '10', '3');
INSERT INTO `antrian` VALUES ('230', '2024-06-13', '10', '10', '3');
INSERT INTO `antrian` VALUES ('231', '2024-06-13', '1', '10', '4');
INSERT INTO `antrian` VALUES ('232', '2024-06-13', '2', '10', '4');
INSERT INTO `antrian` VALUES ('233', '2024-06-13', '3', '10', '4');
INSERT INTO `antrian` VALUES ('234', '2024-06-13', '4', '10', '4');
INSERT INTO `antrian` VALUES ('235', '2024-06-13', '5', '10', '4');
INSERT INTO `antrian` VALUES ('236', '2024-06-13', '6', '10', '4');
INSERT INTO `antrian` VALUES ('237', '2024-06-13', '7', '10', '4');
INSERT INTO `antrian` VALUES ('238', '2024-06-13', '8', '10', '4');
INSERT INTO `antrian` VALUES ('239', '2024-06-13', '9', '10', '4');
INSERT INTO `antrian` VALUES ('240', '2024-06-13', '10', '10', '4');
INSERT INTO `antrian` VALUES ('241', '2024-06-13', '1', '10', '5');
INSERT INTO `antrian` VALUES ('242', '2024-06-13', '2', '10', '5');
INSERT INTO `antrian` VALUES ('243', '2024-06-13', '3', '10', '5');
INSERT INTO `antrian` VALUES ('244', '2024-06-13', '4', '10', '5');
INSERT INTO `antrian` VALUES ('245', '2024-06-13', '5', '10', '5');
INSERT INTO `antrian` VALUES ('246', '2024-06-13', '6', '10', '5');
INSERT INTO `antrian` VALUES ('247', '2024-06-13', '7', '10', '5');
INSERT INTO `antrian` VALUES ('248', '2024-06-13', '8', '10', '5');
INSERT INTO `antrian` VALUES ('249', '2024-06-13', '9', '10', '5');
INSERT INTO `antrian` VALUES ('250', '2024-06-13', '10', '10', '5');
INSERT INTO `antrian` VALUES ('251', '2024-06-14', '1', '10', '1');
INSERT INTO `antrian` VALUES ('252', '2024-06-14', '2', '10', '1');
INSERT INTO `antrian` VALUES ('253', '2024-06-14', '3', '10', '1');
INSERT INTO `antrian` VALUES ('254', '2024-06-14', '4', '10', '1');
INSERT INTO `antrian` VALUES ('255', '2024-06-14', '5', '10', '1');
INSERT INTO `antrian` VALUES ('256', '2024-06-14', '6', '10', '1');
INSERT INTO `antrian` VALUES ('257', '2024-06-14', '7', '10', '1');
INSERT INTO `antrian` VALUES ('258', '2024-06-14', '8', '10', '1');
INSERT INTO `antrian` VALUES ('259', '2024-06-14', '9', '10', '1');
INSERT INTO `antrian` VALUES ('260', '2024-06-14', '10', '10', '1');
INSERT INTO `antrian` VALUES ('261', '2024-06-14', '1', '10', '2');
INSERT INTO `antrian` VALUES ('262', '2024-06-14', '2', '10', '2');
INSERT INTO `antrian` VALUES ('263', '2024-06-14', '3', '10', '2');
INSERT INTO `antrian` VALUES ('264', '2024-06-14', '4', '10', '2');
INSERT INTO `antrian` VALUES ('265', '2024-06-14', '5', '10', '2');
INSERT INTO `antrian` VALUES ('266', '2024-06-14', '6', '10', '2');
INSERT INTO `antrian` VALUES ('267', '2024-06-14', '7', '10', '2');
INSERT INTO `antrian` VALUES ('268', '2024-06-14', '8', '10', '2');
INSERT INTO `antrian` VALUES ('269', '2024-06-14', '9', '10', '2');
INSERT INTO `antrian` VALUES ('270', '2024-06-14', '10', '10', '2');
INSERT INTO `antrian` VALUES ('271', '2024-06-14', '1', '10', '3');
INSERT INTO `antrian` VALUES ('272', '2024-06-14', '2', '10', '3');
INSERT INTO `antrian` VALUES ('273', '2024-06-14', '3', '10', '3');
INSERT INTO `antrian` VALUES ('274', '2024-06-14', '4', '10', '3');
INSERT INTO `antrian` VALUES ('275', '2024-06-14', '5', '10', '3');
INSERT INTO `antrian` VALUES ('276', '2024-06-14', '6', '10', '3');
INSERT INTO `antrian` VALUES ('277', '2024-06-14', '7', '10', '3');
INSERT INTO `antrian` VALUES ('278', '2024-06-14', '8', '10', '3');
INSERT INTO `antrian` VALUES ('279', '2024-06-14', '9', '10', '3');
INSERT INTO `antrian` VALUES ('280', '2024-06-14', '10', '10', '3');
INSERT INTO `antrian` VALUES ('281', '2024-06-14', '1', '10', '4');
INSERT INTO `antrian` VALUES ('282', '2024-06-14', '2', '10', '4');
INSERT INTO `antrian` VALUES ('283', '2024-06-14', '3', '10', '4');
INSERT INTO `antrian` VALUES ('284', '2024-06-14', '4', '10', '4');
INSERT INTO `antrian` VALUES ('285', '2024-06-14', '5', '10', '4');
INSERT INTO `antrian` VALUES ('286', '2024-06-14', '6', '10', '4');
INSERT INTO `antrian` VALUES ('287', '2024-06-14', '7', '10', '4');
INSERT INTO `antrian` VALUES ('288', '2024-06-14', '8', '10', '4');
INSERT INTO `antrian` VALUES ('289', '2024-06-14', '9', '10', '4');
INSERT INTO `antrian` VALUES ('290', '2024-06-14', '10', '10', '4');
INSERT INTO `antrian` VALUES ('291', '2024-06-14', '1', '10', '5');
INSERT INTO `antrian` VALUES ('292', '2024-06-14', '2', '10', '5');
INSERT INTO `antrian` VALUES ('293', '2024-06-14', '3', '10', '5');
INSERT INTO `antrian` VALUES ('294', '2024-06-14', '4', '10', '5');
INSERT INTO `antrian` VALUES ('295', '2024-06-14', '5', '10', '5');
INSERT INTO `antrian` VALUES ('296', '2024-06-14', '6', '10', '5');
INSERT INTO `antrian` VALUES ('297', '2024-06-14', '7', '10', '5');
INSERT INTO `antrian` VALUES ('298', '2024-06-14', '8', '10', '5');
INSERT INTO `antrian` VALUES ('299', '2024-06-14', '9', '10', '5');
INSERT INTO `antrian` VALUES ('300', '2024-06-14', '10', '10', '5');
INSERT INTO `antrian` VALUES ('301', '2024-06-15', '1', '10', '1');
INSERT INTO `antrian` VALUES ('302', '2024-06-15', '2', '10', '1');
INSERT INTO `antrian` VALUES ('303', '2024-06-15', '3', '10', '1');
INSERT INTO `antrian` VALUES ('304', '2024-06-15', '4', '10', '1');
INSERT INTO `antrian` VALUES ('305', '2024-06-15', '5', '10', '1');
INSERT INTO `antrian` VALUES ('306', '2024-06-15', '6', '10', '1');
INSERT INTO `antrian` VALUES ('307', '2024-06-15', '7', '10', '1');
INSERT INTO `antrian` VALUES ('308', '2024-06-15', '8', '10', '1');
INSERT INTO `antrian` VALUES ('309', '2024-06-15', '9', '10', '1');
INSERT INTO `antrian` VALUES ('310', '2024-06-15', '10', '10', '1');
INSERT INTO `antrian` VALUES ('311', '2024-06-15', '1', '10', '2');
INSERT INTO `antrian` VALUES ('312', '2024-06-15', '2', '10', '2');
INSERT INTO `antrian` VALUES ('313', '2024-06-15', '3', '10', '2');
INSERT INTO `antrian` VALUES ('314', '2024-06-15', '4', '10', '2');
INSERT INTO `antrian` VALUES ('315', '2024-06-15', '5', '10', '2');
INSERT INTO `antrian` VALUES ('316', '2024-06-15', '6', '10', '2');
INSERT INTO `antrian` VALUES ('317', '2024-06-15', '7', '10', '2');
INSERT INTO `antrian` VALUES ('318', '2024-06-15', '8', '10', '2');
INSERT INTO `antrian` VALUES ('319', '2024-06-15', '9', '10', '2');
INSERT INTO `antrian` VALUES ('320', '2024-06-15', '10', '10', '2');
INSERT INTO `antrian` VALUES ('321', '2024-06-15', '1', '10', '3');
INSERT INTO `antrian` VALUES ('322', '2024-06-15', '2', '10', '3');
INSERT INTO `antrian` VALUES ('323', '2024-06-15', '3', '10', '3');
INSERT INTO `antrian` VALUES ('324', '2024-06-15', '4', '10', '3');
INSERT INTO `antrian` VALUES ('325', '2024-06-15', '5', '10', '3');
INSERT INTO `antrian` VALUES ('326', '2024-06-15', '6', '10', '3');
INSERT INTO `antrian` VALUES ('327', '2024-06-15', '7', '10', '3');
INSERT INTO `antrian` VALUES ('328', '2024-06-15', '8', '10', '3');
INSERT INTO `antrian` VALUES ('329', '2024-06-15', '9', '10', '3');
INSERT INTO `antrian` VALUES ('330', '2024-06-15', '10', '10', '3');
INSERT INTO `antrian` VALUES ('331', '2024-06-15', '1', '10', '4');
INSERT INTO `antrian` VALUES ('332', '2024-06-15', '2', '10', '4');
INSERT INTO `antrian` VALUES ('333', '2024-06-15', '3', '10', '4');
INSERT INTO `antrian` VALUES ('334', '2024-06-15', '4', '10', '4');
INSERT INTO `antrian` VALUES ('335', '2024-06-15', '5', '10', '4');
INSERT INTO `antrian` VALUES ('336', '2024-06-15', '6', '10', '4');
INSERT INTO `antrian` VALUES ('337', '2024-06-15', '7', '10', '4');
INSERT INTO `antrian` VALUES ('338', '2024-06-15', '8', '10', '4');
INSERT INTO `antrian` VALUES ('339', '2024-06-15', '9', '10', '4');
INSERT INTO `antrian` VALUES ('340', '2024-06-15', '10', '10', '4');
INSERT INTO `antrian` VALUES ('341', '2024-06-15', '1', '10', '5');
INSERT INTO `antrian` VALUES ('342', '2024-06-15', '2', '10', '5');
INSERT INTO `antrian` VALUES ('343', '2024-06-15', '3', '10', '5');
INSERT INTO `antrian` VALUES ('344', '2024-06-15', '4', '10', '5');
INSERT INTO `antrian` VALUES ('345', '2024-06-15', '5', '10', '5');
INSERT INTO `antrian` VALUES ('346', '2024-06-15', '6', '10', '5');
INSERT INTO `antrian` VALUES ('347', '2024-06-15', '7', '10', '5');
INSERT INTO `antrian` VALUES ('348', '2024-06-15', '8', '10', '5');
INSERT INTO `antrian` VALUES ('349', '2024-06-15', '9', '10', '5');
INSERT INTO `antrian` VALUES ('350', '2024-06-15', '10', '10', '5');

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
-- Table structure for `catatan_doctor`
-- ----------------------------
DROP TABLE IF EXISTS `catatan_doctor`;
CREATE TABLE `catatan_doctor` (
  `id_catatan_doctor` int(11) NOT NULL AUTO_INCREMENT,
  `gejala` varchar(255) DEFAULT NULL,
  `diagnosa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_catatan_doctor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of catatan_doctor
-- ----------------------------
INSERT INTO `catatan_doctor` VALUES ('1', 'Anak tubuh panas melebihi 37°C, batuk pilek dan flu, muntah berkepanjangan, jarang buang air kecil, tidak mengeluarkan air mata saat menangis, dan lemas.', 'Mengalami Demam');
INSERT INTO `catatan_doctor` VALUES ('2', 'Nafsu Makan Berkurang, Demam Tinggi mencapai 40°C, Keringat Berlebih, Diare dan Sembelit', 'Mengalami Tipes');
INSERT INTO `catatan_doctor` VALUES ('3', 'Refluks asam lambung, Asma, Alergi,  Infeksi saluran pernapasan atas', 'Mengalami Batuk');

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
  `id_doctor` int(11) DEFAULT NULL,
  `id_shift` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_dokter_shift`),
  KEY `dokter_keyDS` (`id_doctor`),
  KEY `shift_keyDS` (`id_shift`),
  CONSTRAINT `dokter_keyDS` FOREIGN KEY (`id_doctor`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
-- Table structure for `pasien`
-- ----------------------------
DROP TABLE IF EXISTS `pasien`;
CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pasien` varchar(255) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `jenis_kelamin` varchar(255) DEFAULT NULL,
  `keluhan` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pasien`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of pasien
-- ----------------------------
INSERT INTO `pasien` VALUES ('1', 'ilham akbar', '21', 'laki-laki', 'sakit perut', 'jalan ciwaruga');
INSERT INTO `pasien` VALUES ('2', 'adrian mulianto', '22', 'laki-laki', 'mual dan pusing', 'cilimus');
INSERT INTO `pasien` VALUES ('3', 'repan dhia', '23', 'laki-laki', 'batuk', 'gerlong bawah');

-- ----------------------------
-- Table structure for `resep_digital`
-- ----------------------------
DROP TABLE IF EXISTS `resep_digital`;
CREATE TABLE `resep_digital` (
  `id_resep_digital` int(11) NOT NULL AUTO_INCREMENT,
  `id_doctor` int(11) DEFAULT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `id_obat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_resep_digital`),
  KEY `dokter_keyRESEP` (`id_doctor`),
  KEY `pasien_keyRESEP` (`id_pasien`),
  KEY `obay_keyRESEP` (`id_obat`),
  CONSTRAINT `dokter_keyRESEP` FOREIGN KEY (`id_doctor`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `obay_keyRESEP` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pasien_keyRESEP` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of resep_digital
-- ----------------------------
INSERT INTO `resep_digital` VALUES ('1', '1', '1', '1');
INSERT INTO `resep_digital` VALUES ('2', '3', '2', '2');
INSERT INTO `resep_digital` VALUES ('3', '5', '3', '3');

-- ----------------------------
-- Table structure for `riwayat_transaksi`
-- ----------------------------
DROP TABLE IF EXISTS `riwayat_transaksi`;
CREATE TABLE `riwayat_transaksi` (
  `id_riwayat_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `jam` varchar(255) DEFAULT '',
  `id_doctor` int(11) DEFAULT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `id_antrian` int(11) DEFAULT NULL,
  `tipe_pembayaran` varchar(255) DEFAULT NULL,
  `jumlah_pembayaran` varchar(255) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_resep_digital` int(11) DEFAULT NULL,
  `id_catatan_dokter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_riwayat_transaksi`),
  KEY `dokter_key` (`id_doctor`),
  KEY `pasien_keyT` (`id_pasien`),
  KEY `userKey_T` (`id_user`),
  KEY `antri_keyT` (`id_antrian`),
  KEY `resep_digital_keyT` (`id_resep_digital`),
  KEY `cataanD_keyT` (`id_catatan_dokter`),
  CONSTRAINT `antri_keyT` FOREIGN KEY (`id_antrian`) REFERENCES `antrian` (`id_antrian`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cataanD_keyT` FOREIGN KEY (`id_catatan_dokter`) REFERENCES `catatan_doctor` (`id_catatan_doctor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dokter_key` FOREIGN KEY (`id_doctor`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pasien_keyT` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resep_digital_keyT` FOREIGN KEY (`id_resep_digital`) REFERENCES `resep_digital` (`id_resep_digital`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userKey_T` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of riwayat_transaksi
-- ----------------------------
INSERT INTO `riwayat_transaksi` VALUES ('1', 'Segera', '02:00', '1', '1', '97', 'BCA', '120000', '4', '1', '3');
INSERT INTO `riwayat_transaksi` VALUES ('2', 'Selesai', '12:00', '4', '2', '99', 'BNI', '1500000', '1', '2', '2');
INSERT INTO `riwayat_transaksi` VALUES ('3', 'Batal', '05:00', '5', '3', '35', 'Bayar Ditempat', '480000', '3', '3', '1');

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
  `id_user` int(11) DEFAULT NULL,
  `id_doctor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`id_user`,`id_doctor`),
  KEY `doctor_id` (`id_doctor`),
  CONSTRAINT `user_doctor_favorite_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  CONSTRAINT `user_doctor_favorite_ibfk_2` FOREIGN KEY (`id_doctor`) REFERENCES `doctor` (`id`)
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
