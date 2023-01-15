/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.7
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : hospital

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 15/01/2023 08:46:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assist_cure
-- ----------------------------
DROP TABLE IF EXISTS `assist_cure`;
CREATE TABLE `assist_cure`  (
  `编号` int NULL DEFAULT NULL,
  `病案号` int NULL DEFAULT NULL,
  `术前影像肿瘤大小(T)` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `术前影像腋下淋巴结(N)` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `远处转移与否(M)` enum('是','否') CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `转移部位` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `TNM分期` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `穿刺ER` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `穿刺Her2` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `穿刺Ki67` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `穿刺P53` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `术前是否行新辅助治疗` enum('化疗','内分泌','靶向') CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `新辅助治疗方案及周期` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `新辅助治疗疗效评价` enum('CR','PR','SD','PD') CHARACTER SET utf8mb4  NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4  COMMENT = '辅助治疗表' ;

-- ----------------------------
-- Records of assist_cure
-- ----------------------------

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `病案号` int NOT NULL AUTO_INCREMENT,
  `姓名` varchar(25) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `电话` int NULL DEFAULT NULL,
  `发病时年龄` int NULL DEFAULT NULL,
  `发现日期` date NULL DEFAULT NULL,
  `入院日期` datetime NULL DEFAULT NULL,
  `出院日期` datetime NULL DEFAULT NULL,
  `死亡与否` enum('是','否') CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `死亡时间` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`病案号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4  COMMENT = '病人表' ;

-- ----------------------------
-- Records of patient
-- ----------------------------

-- ----------------------------
-- Table structure for patient_follow
-- ----------------------------
DROP TABLE IF EXISTS `patient_follow`;
CREATE TABLE `patient_follow`  (
  `编号` int NOT NULL AUTO_INCREMENT,
  `病案号` int NULL DEFAULT NULL,
  `DFS` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `二次复发` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `三次复发` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `OS` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `末次复查时间` date NULL DEFAULT NULL,
  `治疗后生育情况` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `双原发癌症` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `最后随访时间` datetime NULL DEFAULT NULL,
  `随访备注` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  PRIMARY KEY (`编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4  COMMENT = '病人跟踪记录表' ;

-- ----------------------------
-- Records of patient_follow
-- ----------------------------

-- ----------------------------
-- Table structure for patient_pathological
-- ----------------------------
DROP TABLE IF EXISTS `patient_pathological`;
CREATE TABLE `patient_pathological`  (
  `编号` int NOT NULL AUTO_INCREMENT,
  `病案号` int NULL DEFAULT NULL,
  `病前是否生育` enum('是','否') CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `G` tinyint NULL DEFAULT NULL,
  `P` tinyint NULL DEFAULT NULL,
  `自然/辅助生育` enum('自然','辅助') CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `确诊时是否为哺乳期` enum('是','否') CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `病前是否哺乳` enum('是','否') CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `哺乳侧别` enum('左乳','右乳','双乳') CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `病理学分期` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `组织学分级` enum('I','II','III') CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `病理类型` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `化疗反应` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `保乳手术断端情况` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `淋巴结情况` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `腋窝淋巴结总数` int NULL DEFAULT NULL,
  `阳性腋窝淋巴结数` int NULL DEFAULT NULL,
  `ER` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `PR` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `HER2` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `Ki67` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `P53` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `淋巴血管侵犯与否` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `淋巴管癌栓` enum('阴','阳') CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  PRIMARY KEY (`编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4  COMMENT = '病人病例表' ;

-- ----------------------------
-- Records of patient_pathological
-- ----------------------------

-- ----------------------------
-- Table structure for patient_reappear
-- ----------------------------
DROP TABLE IF EXISTS `patient_reappear`;
CREATE TABLE `patient_reappear`  (
  `编号` int NULL DEFAULT NULL,
  `病案号` int NULL DEFAULT NULL,
  `复发日期` datetime NULL DEFAULT NULL,
  `复发位置编号` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '病人复发区域信息表' ;

-- ----------------------------
-- Records of patient_reappear
-- ----------------------------

-- ----------------------------
-- Table structure for postoperative_treatment
-- ----------------------------
DROP TABLE IF EXISTS `postoperative_treatment`;
CREATE TABLE `postoperative_treatment`  (
  `编号` int NOT NULL AUTO_INCREMENT,
  `病案号` int NULL DEFAULT NULL,
  `治疗措施编号` int NULL DEFAULT NULL,
  `治疗时间` datetime NULL DEFAULT NULL,
  `治疗备注` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  PRIMARY KEY (`编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4  COMMENT = '术后治疗表' ;

-- ----------------------------
-- Records of postoperative_treatment
-- ----------------------------

-- ----------------------------
-- Table structure for relapse_information
-- ----------------------------
DROP TABLE IF EXISTS `relapse_information`;
CREATE TABLE `relapse_information`  (
  `编号` int NOT NULL AUTO_INCREMENT,
  `病案号` int NULL DEFAULT NULL,
  `首次复发部位` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `首次复发日期` date NULL DEFAULT NULL,
  `首次复发确诊手段` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `首次复发后治疗` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `复发后治疗效果评价` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  PRIMARY KEY (`编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4  COMMENT = '复发信息表' ;

-- ----------------------------
-- Records of relapse_information
-- ----------------------------

-- ----------------------------
-- Table structure for surgical_information
-- ----------------------------
DROP TABLE IF EXISTS `surgical_information`;
CREATE TABLE `surgical_information`  (
  `编号` int NOT NULL AUTO_INCREMENT,
  `病案号` int NULL DEFAULT NULL,
  `手术日期` datetime NULL DEFAULT NULL,
  `手术方式` enum('全切','保乳') CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `腋窝淋巴结清扫方式` enum('腋清','前哨淋巴结活检') CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  PRIMARY KEY (`编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4  COMMENT = '手术信息表' ;

-- ----------------------------
-- Records of surgical_information
-- ----------------------------

-- ----------------------------
-- Table structure for sys_place
-- ----------------------------
DROP TABLE IF EXISTS `sys_place`;
CREATE TABLE `sys_place`  (
  `编号` int NOT NULL,
  `位置名字` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '位置名字' ;

-- ----------------------------
-- Records of sys_place
-- ----------------------------
INSERT INTO `sys_place` VALUES (1, '局部');
INSERT INTO `sys_place` VALUES (2, '区域');
INSERT INTO `sys_place` VALUES (3, '远处');

-- ----------------------------
-- Table structure for sys_treatment
-- ----------------------------
DROP TABLE IF EXISTS `sys_treatment`;
CREATE TABLE `sys_treatment`  (
  `编号` int NULL DEFAULT NULL,
  `治疗措施名字` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `治疗措施备注` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '治疗措施表' ;

-- ----------------------------
-- Records of sys_treatment
-- ----------------------------
INSERT INTO `sys_treatment` VALUES (1, '术后化疗', '');
INSERT INTO `sys_treatment` VALUES (2, '术后内分泌治疗', NULL);
INSERT INTO `sys_treatment` VALUES (3, '内分泌治疗', '内分泌治疗副作用');
INSERT INTO `sys_treatment` VALUES (4, '卵巢功能抑制剂', '卵巢功能抑制剂具体药物');
INSERT INTO `sys_treatment` VALUES (5, '术后靶向治疗', '靶向治疗具体药物');
INSERT INTO `sys_treatment` VALUES (6, '术后放疗', NULL);
INSERT INTO `sys_treatment` VALUES (7, '术后免疫治疗', NULL);

SET FOREIGN_KEY_CHECKS = 1;
