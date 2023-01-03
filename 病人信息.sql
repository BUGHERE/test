/*
 Navicat Premium Data Transfer

 Source Server         : 666
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : 病人信息

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 27/12/2022 22:52:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 个人病历
-- ----------------------------
DROP TABLE IF EXISTS `个人病历`;
CREATE TABLE `个人病历`  (
  `编号` int NOT NULL AUTO_INCREMENT,
  `病案号` int NULL DEFAULT NULL,
  `病前是否生育` enum('是','否') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `G` int NULL DEFAULT NULL,
  `P` int NULL DEFAULT NULL,
  `自然/辅助生育` enum('自然','辅助') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `确诊时是否为哺乳期` enum('是','否') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `病前是否哺乳` enum('是','否') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `哺乳侧别` enum('左乳','右乳','双乳') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`编号`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 复发信息
-- ----------------------------
DROP TABLE IF EXISTS `复发信息`;
CREATE TABLE `复发信息`  (
  `编号` int NOT NULL AUTO_INCREMENT,
  `病案号` int NULL DEFAULT NULL,
  `首次复发部位` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `首次复发日期` date NULL DEFAULT NULL,
  `首次复发确诊手段` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `首次局部复发部位` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `首次局部复发日期` date NULL DEFAULT NULL,
  `首次区域复发部位` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `首次区域复发日期` date NULL DEFAULT NULL,
  `首次远处复发部位` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `首次远处复发日期` date NULL DEFAULT NULL,
  `首次复发后治疗` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `复发后治疗效果评价` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 家族病历
-- ----------------------------
DROP TABLE IF EXISTS `家族病历`;
CREATE TABLE `家族病历`  (
  `编号` int NULL DEFAULT NULL,
  `病案号` int NULL DEFAULT NULL,
  `术前影像肿瘤大小(T)` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `术前影像腋下淋巴结(N)` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `远处转移与否(M)` enum('是','否') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `转移部位` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TNM分期` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `穿刺ER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `穿刺Her2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `穿刺Ki67` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `穿刺P53` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `术前是否行新辅助治疗` enum('化疗','内分泌','靶向') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `新辅助治疗方案及周期` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `新辅助治疗疗效评价` enum('CR','PR','SD','PD') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 手术信息
-- ----------------------------
DROP TABLE IF EXISTS `手术信息`;
CREATE TABLE `手术信息`  (
  `编号` int NOT NULL AUTO_INCREMENT,
  `病案号` int NULL DEFAULT NULL,
  `手术日期` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `手术方式` enum('全切','保乳') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `腋窝淋巴结清扫方式` enum('腋清','前哨淋巴结活检') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 术后治疗
-- ----------------------------
DROP TABLE IF EXISTS `术后治疗`;
CREATE TABLE `术后治疗`  (
  `编号` int NOT NULL AUTO_INCREMENT,
  `病案号` int NULL DEFAULT NULL,
  `术后化疗1` enum('是','否') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `术后化疗2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `术后内分泌治疗1` enum('是','否') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `术后内分泌治疗2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `内分泌治疗副作用` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `卵巢功能抑制剂` enum('是','否') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `卵巢功能抑制剂具体药物` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `术后靶向治疗` enum('是','否') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `靶向治疗具体药物` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `术后放疗` enum('是','否') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `术后免疫治疗` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 病人信息
-- ----------------------------
DROP TABLE IF EXISTS `病人信息`;
CREATE TABLE `病人信息`  (
  `病案号` int NOT NULL AUTO_INCREMENT,
  `姓名` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `电话` int NULL DEFAULT NULL,
  `发病时年龄` int NULL DEFAULT NULL,
  `发现日期` date NULL DEFAULT NULL,
  `入院日期` date NULL DEFAULT NULL,
  `右乳or左乳or双乳` enum('左乳','右乳','双乳') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`病案号`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 病理特征
-- ----------------------------
DROP TABLE IF EXISTS `病理特征`;
CREATE TABLE `病理特征`  (
  `编号` int NOT NULL AUTO_INCREMENT,
  `病案号` int NULL DEFAULT NULL,
  `病理学分期` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `组织学分级` enum('I','II','III') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `病理类型` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `化疗反应` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `保乳手术断端情况` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `淋巴结情况` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `腋窝淋巴结总数` int NULL DEFAULT NULL,
  `阳性腋窝淋巴结数` int NULL DEFAULT NULL,
  `ER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HER2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Ki67` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `P53` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `淋巴血管侵犯与否` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `淋巴管癌栓` enum('阴','阳') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`编号`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 随访信息
-- ----------------------------
DROP TABLE IF EXISTS `随访信息`;
CREATE TABLE `随访信息`  (
  `编号` int NOT NULL AUTO_INCREMENT,
  `病案号` int NULL DEFAULT NULL,
  `DFS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `二次复发` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `三次复发` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `死亡与否` enum('是','否') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `死亡时间` date NULL DEFAULT NULL,
  `OS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `末次复查时间` date NULL DEFAULT NULL,
  `治疗后生育情况` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `双原发癌症` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `最后随访时间` date NULL DEFAULT NULL,
  `随访备注` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`编号`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
