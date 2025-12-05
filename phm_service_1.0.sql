/*
 Navicat Premium Dump SQL

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50736 (5.7.36-log)
 Source Host           : localhost:3306
 Source Schema         : phm_service

 Target Server Type    : MySQL
 Target Server Version : 50736 (5.7.36-log)
 File Encoding         : 65001

 Date: 13/11/2025 09:47:39
*/
CREATE DATABASE device_management CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Switch to it
USE device_management;

CREATE USER 'device_admin'@'localhost' IDENTIFIED BY 'StrongPassword123';
GRANT ALL PRIVILEGES ON device_management.* TO 'device_admin'@'localhost';
FLUSH PRIVILEGES;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of databasechangelog
-- ----------------------------
INSERT INTO `databasechangelog` VALUES ('1', 'wfs', 'liquibase/default/init/init-ddl.sql', '2025-10-18 21:42:31', 1, 'EXECUTED', '8:c2e2556519f55b992c7be2b392f2ab70', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('1', 'chx', 'liquibase/default/init/init-ddl.sql', '2025-10-18 21:42:31', 2, 'EXECUTED', '8:d0c1d0b86ece3798884cdbcbaf218a84', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('2', 'wfs', 'liquibase/default/init/init-ddl.sql', '2025-10-18 21:42:31', 3, 'EXECUTED', '8:d4378b6346a5e5c01aad4c4bb0774d8b', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('1', 'wfs', 'liquibase/default/init/init-dml.sql', '2025-10-18 21:42:31', 4, 'EXECUTED', '8:7968efb76cdb33d22e49e037ba57ffd9', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('2', 'wfs', 'liquibase/default/init/init-dml.sql', '2025-10-18 21:42:31', 5, 'EXECUTED', '8:3a3554022e2c8edf7068af8d119bce20', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('3', 'wfs', 'liquibase/default/init/init-dml.sql', '2025-10-18 21:42:31', 6, 'EXECUTED', '8:fef4a16e5b2f66dbcc5bf9fa26008264', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('4', 'wfs', 'liquibase/default/init/init-dml.sql', '2025-10-18 21:42:31', 7, 'EXECUTED', '8:6513b29f59b6755bf0ff7a1bb7d6a376', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('1', 'wfs', 'liquibase/default/v1.0/v1.0-dml.sql', '2025-10-18 21:42:31', 8, 'EXECUTED', '8:5d9f687db7b980efdf6513d34c1d6da1', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('1', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:31', 9, 'EXECUTED', '8:b51568402317b925755aa7f40a72cf54', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('1', 'lpj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:31', 10, 'EXECUTED', '8:38f458d2119a4bd021367f732ebd7ac7', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('2', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:31', 11, 'EXECUTED', '8:e25e122a3bfc7a1ac9febeadfce2f574', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('2', 'lpj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:31', 12, 'EXECUTED', '8:e836c030907d03362c6020b35df5f9c7', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('1', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:31', 13, 'EXECUTED', '8:fedc012b3f1f851a6dde0cc5dd400588', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('2', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:32', 14, 'EXECUTED', '8:524c4baa7c3862ee6ca919853c1ffa26', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('3', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:32', 15, 'EXECUTED', '8:58fe8877f0ec457871067182f86b02bc', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('4', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:32', 16, 'EXECUTED', '8:572174d9847656b3dc63a56f0616dfe2', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('5', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:32', 17, 'EXECUTED', '8:627bf7fff0e059745a893a5c80e38487', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('6', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:32', 18, 'EXECUTED', '8:ae87a2684780dfa9fd1c9b6037be571d', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('3', 'lpj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:32', 19, 'EXECUTED', '8:617d3c77b840c99ee4da9e051ae85237', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('3', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:32', 20, 'EXECUTED', '8:a2b1a55625c97f9c2c405cb55c150c5f', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('4', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:32', 21, 'EXECUTED', '8:8fbb403734b0b9ed2398abda62f4ba48', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('5', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:32', 22, 'EXECUTED', '8:b3860b84a9acc6c0c5b291cd76d4962e', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('4', 'lpj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:32', 23, 'EXECUTED', '8:bcd7abb03772cf26a5a637449d42de06', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('6', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:33', 24, 'EXECUTED', '8:ccbc0e58d0423f7187f01f8adb7759d8', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('5', 'lpj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:33', 25, 'EXECUTED', '8:6a516fca44d01fc209efab43bdf90f2a', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('6', 'lpj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:33', 26, 'EXECUTED', '8:7d848e7156c6ecf27d337db39ec0ab4f', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('7', 'lpj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:33', 27, 'EXECUTED', '8:5cff92f305f8adda9614cd3cad07766c', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('7', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:33', 28, 'EXECUTED', '8:b2891c20f94178db6b593acdf1dd86cc', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('8', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:33', 29, 'EXECUTED', '8:fad2da7ab4761b4c8b41c36ed1428af2', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('9', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:33', 30, 'EXECUTED', '8:8f7c0eae89045c94c2663bbd64acfddc', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('10', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:33', 31, 'EXECUTED', '8:16e785d34f8da36c4c9c15e73d7ac036', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('11', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-18 21:42:33', 32, 'EXECUTED', '8:da27bbdfdc7615f8a7723725dd9d8bbb', 'sql', '', NULL, '4.3.5', NULL, NULL, '0794950565');
INSERT INTO `databasechangelog` VALUES ('12', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-20 08:45:56', 33, 'EXECUTED', '8:29192213317afca6868b8be3f73cdf49', 'sql', '', NULL, '4.3.5', NULL, NULL, '0921156381');
INSERT INTO `databasechangelog` VALUES ('13', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-20 08:45:56', 34, 'EXECUTED', '8:bf3b9a81a351efc7337844f7591d54f0', 'sql', '', NULL, '4.3.5', NULL, NULL, '0921156381');
INSERT INTO `databasechangelog` VALUES ('14', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-20 08:45:56', 35, 'EXECUTED', '8:7c68647dd3e6db98ab7768f23f61f60c', 'sql', '', NULL, '4.3.5', NULL, NULL, '0921156381');
INSERT INTO `databasechangelog` VALUES ('7', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-20 19:01:40', 36, 'EXECUTED', '8:815350f4837b7456b14d72e71e436798', 'sql', '', NULL, '4.3.5', NULL, NULL, '0958099630');
INSERT INTO `databasechangelog` VALUES ('8', 'lpj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-20 19:01:40', 37, 'EXECUTED', '8:d73b674fdbdecc270019682cabc412bb', 'sql', '', NULL, '4.3.5', NULL, NULL, '0958099630');
INSERT INTO `databasechangelog` VALUES ('8', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-20 19:01:40', 38, 'EXECUTED', '8:54ec39e9b4ceda53080679182ff083f8', 'sql', '', NULL, '4.3.5', NULL, NULL, '0958099630');
INSERT INTO `databasechangelog` VALUES ('9', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-20 19:01:40', 39, 'EXECUTED', '8:3a96fa5dc6641f12ea3d6c637e060232', 'sql', '', NULL, '4.3.5', NULL, NULL, '0958099630');
INSERT INTO `databasechangelog` VALUES ('15', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-20 19:01:40', 40, 'EXECUTED', '8:622a6e1affae14f6d14059004048c384', 'sql', '', NULL, '4.3.5', NULL, NULL, '0958099630');
INSERT INTO `databasechangelog` VALUES ('16', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-20 19:01:40', 41, 'EXECUTED', '8:54ab2a4dcf04b32ac4f811374e71a321', 'sql', '', NULL, '4.3.5', NULL, NULL, '0958099630');
INSERT INTO `databasechangelog` VALUES ('17', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-21 09:40:47', 42, 'EXECUTED', '8:a5a2d4039b00ea6eacd2afc72f559486', 'sql', '', NULL, '4.3.5', NULL, NULL, '1010847911');
INSERT INTO `databasechangelog` VALUES ('18', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-21 09:41:39', 43, 'EXECUTED', '8:dfbd338333d6b750e534d336ff7a6c35', 'sql', '', NULL, '4.3.5', NULL, NULL, '1010899711');
INSERT INTO `databasechangelog` VALUES ('19', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-21 10:15:09', 44, 'EXECUTED', '8:215e2d895576e5eb6dd5e1a0200c2647', 'sql', '', NULL, '4.3.5', NULL, NULL, '1012908899');
INSERT INTO `databasechangelog` VALUES ('10', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-21 16:07:46', 45, 'EXECUTED', '8:7a142c26953bd0698777764f6f5769b2', 'sql', '', NULL, '4.3.5', NULL, NULL, '1034066633');
INSERT INTO `databasechangelog` VALUES ('9', 'lpj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-21 16:07:46', 46, 'EXECUTED', '8:8537a3a389e8fcb27ab9d34d4653c210', 'sql', '', NULL, '4.3.5', NULL, NULL, '1034066633');
INSERT INTO `databasechangelog` VALUES ('11', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-21 16:07:46', 47, 'EXECUTED', '8:c00b2ccaa5e2b3d3a926c5235f839dc8', 'sql', '', NULL, '4.3.5', NULL, NULL, '1034066633');
INSERT INTO `databasechangelog` VALUES ('12', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-21 16:07:46', 48, 'EXECUTED', '8:5633d985e663170aaeff9e5ab7acefa7', 'sql', '', NULL, '4.3.5', NULL, NULL, '1034066633');
INSERT INTO `databasechangelog` VALUES ('13', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-22 08:36:12', 49, 'EXECUTED', '8:786aedf3314af73df7f91522d2b6ac27', 'sql', '', NULL, '4.3.5', NULL, NULL, '1093372100');
INSERT INTO `databasechangelog` VALUES ('20', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-22 16:41:13', 50, 'EXECUTED', '8:271888b4ae7208a467ea86097181d371', 'sql', '', NULL, '4.3.5', NULL, NULL, '1122473542');
INSERT INTO `databasechangelog` VALUES ('21', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-22 16:41:13', 51, 'EXECUTED', '8:f20fa79ced8d0cf54f245cff9782f859', 'sql', '', NULL, '4.3.5', NULL, NULL, '1122473542');
INSERT INTO `databasechangelog` VALUES ('22', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-22 16:42:09', 52, 'EXECUTED', '8:508f91fc46f628718a0b9bd36a1f2091', 'sql', '', NULL, '4.3.5', NULL, NULL, '1122529849');
INSERT INTO `databasechangelog` VALUES ('23', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-22 17:14:36', 53, 'EXECUTED', '8:2f7af19a0454f5e39117a9a4c996213a', 'sql', '', NULL, '4.3.5', NULL, NULL, '1124476627');
INSERT INTO `databasechangelog` VALUES ('24', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-22 17:19:25', 54, 'EXECUTED', '8:7ebdba4f9d04334b442b66b17372a4fb', 'sql', '', NULL, '4.3.5', NULL, NULL, '1124765363');
INSERT INTO `databasechangelog` VALUES ('25', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-22 18:16:38', 55, 'EXECUTED', '8:6d0b93c3bf3fd62c4fe09219cf7f74b1', 'sql', '', NULL, '4.3.5', NULL, NULL, '1128198337');
INSERT INTO `databasechangelog` VALUES ('26', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-22 18:16:38', 56, 'EXECUTED', '8:3f7f26870fec7b990c123b9e2795f54a', 'sql', '', NULL, '4.3.5', NULL, NULL, '1128198337');
INSERT INTO `databasechangelog` VALUES ('14', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-22 18:49:41', 57, 'EXECUTED', '8:edbe295e0cc5ac2c61f6c87620567826', 'sql', '', NULL, '4.3.5', NULL, NULL, '1130181918');
INSERT INTO `databasechangelog` VALUES ('10', 'lpj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-24 19:15:51', 58, 'EXECUTED', '8:e84b3c472d960648e7dfdda8ae97139a', 'sql', '', NULL, '4.3.5', NULL, NULL, '1304551857');
INSERT INTO `databasechangelog` VALUES ('27', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-28 08:46:01', 59, 'EXECUTED', '8:392f4aee67d949ef839d7b974805b16b', 'sql', '', NULL, '4.3.5', NULL, NULL, '1612361825');
INSERT INTO `databasechangelog` VALUES ('15', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-31 10:01:15', 60, 'EXECUTED', '8:d3a2b50011eb572c82662f5e7c24aa0b', 'sql', '', NULL, '4.3.5', NULL, NULL, '1876075275');
INSERT INTO `databasechangelog` VALUES ('11', 'lpj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-31 10:01:58', 61, 'EXECUTED', '8:678dba416aae329783651c00349fcb40', 'sql', '', NULL, '4.3.5', NULL, NULL, '1876117973');
INSERT INTO `databasechangelog` VALUES ('12', 'lpj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-31 10:01:58', 62, 'EXECUTED', '8:172e216802517edef793898519e136a1', 'sql', '', NULL, '4.3.5', NULL, NULL, '1876117973');
INSERT INTO `databasechangelog` VALUES ('16', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-10-31 17:28:58', 63, 'EXECUTED', '8:d3a77897e778b93b53ca8153c4af7fd2', 'sql', '', NULL, '4.3.5', NULL, NULL, '1902938341');
INSERT INTO `databasechangelog` VALUES ('1', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-dml.sql', '2025-10-31 18:05:41', 64, 'EXECUTED', '8:dbfbded0e300ba98038c1428501e6c55', 'sql', '', NULL, '4.3.5', NULL, NULL, '1905140939');
INSERT INTO `databasechangelog` VALUES ('2', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-dml.sql', '2025-11-03 13:43:51', 65, 'EXECUTED', '8:4fc47fe4d13aeb4be03b9346d5c1e6bd', 'sql', '', NULL, '4.3.5', NULL, NULL, '2148631156');
INSERT INTO `databasechangelog` VALUES ('3', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-dml.sql', '2025-11-03 14:59:29', 66, 'EXECUTED', '8:0e3ab8b6487783d0e891959c8b183e79', 'sql', '', NULL, '4.3.5', NULL, NULL, '2153169622');
INSERT INTO `databasechangelog` VALUES ('28', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-05 14:33:00', 67, 'EXECUTED', '8:674787f14522769eec301018d24ea996', 'sql', '', NULL, '4.3.5', NULL, NULL, '2324380485');
INSERT INTO `databasechangelog` VALUES ('4', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-dml.sql', '2025-11-05 14:33:00', 68, 'EXECUTED', '8:fc68cda83098e1bfb0d3618a65e020be', 'sql', '', NULL, '4.3.5', NULL, NULL, '2324380485');
INSERT INTO `databasechangelog` VALUES ('28', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-05 14:53:08', 69, 'EXECUTED', '8:49c2c1266fd86d33a1770cb82d1e3247', 'sql', '', NULL, '4.3.5', NULL, NULL, '2325588112');
INSERT INTO `databasechangelog` VALUES ('29', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-05 14:54:23', 70, 'EXECUTED', '8:5e504f44f9cb268debb13e055c29e984', 'sql', '', NULL, '4.3.5', NULL, NULL, '2325662952');
INSERT INTO `databasechangelog` VALUES ('30', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-05 14:55:57', 71, 'EXECUTED', '8:0c31370d3763db5e577e53b1150dc6a4', 'sql', '', NULL, '4.3.5', NULL, NULL, '2325757147');
INSERT INTO `databasechangelog` VALUES ('31', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-05 15:33:56', 72, 'EXECUTED', '8:22ee0ba28cd28acd0da599d8c1c9408d', 'sql', '', NULL, '4.3.5', NULL, NULL, '2328036771');
INSERT INTO `databasechangelog` VALUES ('32', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-05 15:54:59', 73, 'EXECUTED', '8:a23a840284ec710f6a001939c74e70e5', 'sql', '', NULL, '4.3.5', NULL, NULL, '2329299122');
INSERT INTO `databasechangelog` VALUES ('33', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-06 11:33:23', 74, 'EXECUTED', '8:29cd97b1b92746751ea2f6678895e3e9', 'sql', '', NULL, '4.3.5', NULL, NULL, '2400003756');
INSERT INTO `databasechangelog` VALUES ('34', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-06 14:47:36', 75, 'EXECUTED', '8:49a55d75caa506ff51ebf161c1fdc754', 'sql', '', NULL, '4.3.5', NULL, NULL, '2411656595');
INSERT INTO `databasechangelog` VALUES ('35', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-06 16:14:30', 76, 'EXECUTED', '8:ccdbefbfa3d25d37fdcf9a062c1390b9', 'sql', '', NULL, '4.3.5', NULL, NULL, '2416870355');
INSERT INTO `databasechangelog` VALUES ('36', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-06 16:32:47', 77, 'EXECUTED', '8:fed384295a35bc3adbcf7e3ffabd3b26', 'sql', '', NULL, '4.3.5', NULL, NULL, '2417967174');
INSERT INTO `databasechangelog` VALUES ('37', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-06 17:00:14', 78, 'EXECUTED', '8:55f8539479e67a32a5282fe2b19c0925', 'sql', '', NULL, '4.3.5', NULL, NULL, '2419613945');
INSERT INTO `databasechangelog` VALUES ('13', 'lpj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-07 09:32:55', 79, 'EXECUTED', '8:c10d190035f8f5590e5250e2c840d966', 'sql', '', NULL, '4.3.5', NULL, NULL, '2479175105');
INSERT INTO `databasechangelog` VALUES ('14', 'lpj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-07 09:32:55', 80, 'EXECUTED', '8:2905028ef7b23e7cbb08190b5e844325', 'sql', '', NULL, '4.3.5', NULL, NULL, '2479175105');
INSERT INTO `databasechangelog` VALUES ('29', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-08 16:13:38', 81, 'EXECUTED', '8:45d4b56fe001743a50b2a5c8698f4f49', 'sql', '', NULL, '4.3.5', NULL, NULL, '2589617633');
INSERT INTO `databasechangelog` VALUES ('30', 'xxj', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-08 16:13:38', 82, 'EXECUTED', '8:66ed7a12c2d1dc134179d748c8a7ee03', 'sql', '', NULL, '4.3.5', NULL, NULL, '2589617633');
INSERT INTO `databasechangelog` VALUES ('38', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-08 20:57:26', 83, 'EXECUTED', '8:b8c2d1c0baf3407fcc123cd771d77dd0', 'sql', '', NULL, '4.3.5', NULL, NULL, '2606644805');
INSERT INTO `databasechangelog` VALUES ('39', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-09 00:10:35', 84, 'EXECUTED', '8:a0fc2eb28232cdc1e4f575a278f1e3d5', 'sql', '', NULL, '4.3.5', NULL, NULL, '2618235446');
INSERT INTO `databasechangelog` VALUES ('40', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-09 18:20:52', 85, 'EXECUTED', '8:c349e7cb3bd16bfce45d407dc5c8c819', 'sql', '', NULL, '4.3.5', NULL, NULL, '2683652208');
INSERT INTO `databasechangelog` VALUES ('41', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-10 11:24:38', 86, 'EXECUTED', '8:5af5356c003a869467054aab04dc71b8', 'sql', '', NULL, '4.3.5', NULL, NULL, '2745076264');
INSERT INTO `databasechangelog` VALUES ('42', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-10 14:05:55', 87, 'EXECUTED', '8:4d5e766ff0e9cfa57c5f1e1219d775dd', 'sql', '', NULL, '4.3.5', NULL, NULL, '2754754932');
INSERT INTO `databasechangelog` VALUES ('43', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-10 14:05:56', 88, 'EXECUTED', '8:57983dabe72189dae58a5fd763ee0606', 'sql', '', NULL, '4.3.5', NULL, NULL, '2754754932');
INSERT INTO `databasechangelog` VALUES ('44', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-10 16:42:39', 89, 'EXECUTED', '8:9fc70bc89fa71aa0dde9ff6f2eb9c63c', 'sql', '', NULL, '4.3.5', NULL, NULL, '2764158174');
INSERT INTO `databasechangelog` VALUES ('45', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-12 15:08:50', 90, 'EXECUTED', '8:97ea41b8ee9f6679f6993a38c4ae0e1b', 'sql', '', NULL, '4.3.5', NULL, NULL, '2931329608');
INSERT INTO `databasechangelog` VALUES ('46', 'wfs', 'liquibase/default/v2.0.0/v2.0.0-ddl.sql', '2025-11-13 00:09:25', 91, 'EXECUTED', '8:a60f94a50a752289aa727f70694ab716', 'sql', '', NULL, '4.3.5', NULL, NULL, '2963764949');

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for doc_doc
-- ----------------------------
DROP TABLE IF EXISTS `doc_doc`;
CREATE TABLE `doc_doc`  (
  `id` bigint(20) NOT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件系统类别（本地/招行云/华为云...）',
  `doc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `ctime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `mtime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modifier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modifier_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标识 0正常 1.删除',
  `optimistic_lock` bigint(20) NULL DEFAULT NULL COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc_doc
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token`  (
  `token_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `client_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authentication` blob NULL,
  `refresh_token` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_access_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('app', NULL, '{bcrypt}$2a$06$xOud6hU9X103I5PHlA6qk.GbutDpwnTHryKDcisGE6ByP7CO0XYmW', 'app', 'client_credentials,password,refresh_token', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oauth_client_details` VALUES ('cmb', NULL, '{bcrypt}$2a$10$0YqfBvyEgD/F9xO/6mCrB.XvtooPAjT1xEHYWkC5g9GHfnwmIt02e', 'cmb', 'client_credentials,password,refresh_token', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oauth_client_details` VALUES ('web', NULL, '{bcrypt}$2a$10$UqQQEY2QOdKfgpbnbmVS7ejbHigEdXbokru1aImFfX58Lat8hy4we', 'web', 'client_credentials,password,refresh_token', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token`  (
  `token_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `client_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code`  (
  `code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authentication` blob NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_code
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token`  (
  `token_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication` blob NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_refresh_token
-- ----------------------------

-- ----------------------------
-- Table structure for phm_alert_event
-- ----------------------------
DROP TABLE IF EXISTS `phm_alert_event`;
CREATE TABLE `phm_alert_event`  (
  `alert_event_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '告警事件id',
  `rule_id` bigint(20) NULL DEFAULT NULL COMMENT '规则id',
  `rule_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `trigger_description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '触发详情',
  `monitoring_type` tinyint(4) NULL DEFAULT NULL COMMENT '监控指标 0-最终预测类别（故障检测模型）1-故障剩余天数（故障预测模型）2-健康状态等级（健康状态评估模型）',
  `biz_id` bigint(20) NULL DEFAULT NULL COMMENT '业务id',
  `biz_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务编码',
  `event_status` tinyint(4) NULL DEFAULT NULL COMMENT '状态 0-待处理 1-已确认 2-已修复 3-已关闭',
  `alert_level` tinyint(4) NULL DEFAULT NULL COMMENT '告警级别 0-紧急 1-警告 2-提示',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间/触发时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`alert_event_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1987765578574114819 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '告警事件表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phm_alert_event
-- ----------------------------
INSERT INTO `phm_alert_event` VALUES (1, 1, 'ceshi', 'cesjo', 0, 1980514445965377538, '2025102100012', 3, 0, NULL, '2025-10-21 14:07:58', 1981621769337565186, '2025-10-28 14:31:44');
INSERT INTO `phm_alert_event` VALUES (1986676658180501506, 4, '故障诊断规则1', '故障最终诊断等于14mil滚动体故障，当前值14mil滚动体故障', 5, 1986674792633823234, NULL, 0, 0, NULL, '2025-11-07 14:06:38', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1986677336726675457, 4, '故障诊断规则1', '故障最终诊断等于14mil滚动体故障，当前值14mil滚动体故障', 5, 1986674792633823234, NULL, 0, 0, NULL, '2025-11-07 14:09:22', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1986677916979273729, 4, '故障诊断规则1', '故障最终诊断等于14mil滚动体故障，当前值14mil滚动体故障', 5, 1986677908783603713, NULL, 0, 0, NULL, '2025-11-07 14:11:41', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1986678954234785793, 4, '故障诊断规则1', '故障最终诊断等于14mil滚动体故障，当前值14mil滚动体故障', 5, 1986678946034921474, NULL, 0, 0, NULL, '2025-11-07 14:15:48', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1986679298968866817, 4, '故障诊断规则1', '故障最终诊断等于14mil滚动体故障，当前值14mil滚动体故障', 5, 1986679290190188546, '2025110700018', 0, 0, NULL, '2025-11-07 14:17:10', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1986689756236955649, 5, '故障检测规则1', '最终预测类别等于轻度刀柄，当前值轻度刀柄null', 0, 1986686149802414081, '2025110700001', 0, 0, NULL, '2025-11-07 14:58:43', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1986690902632513537, 5, '故障检测规则1', '最终预测类别等于轻度刀柄，当前值轻度刀柄0.9698', 0, 1986690548226408449, '2025110700003', 0, 0, NULL, '2025-11-07 15:03:17', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1986749229924184066, 7, '维修优化规则1', '维修最终诊断等于7mil内圈，当前值7mil内圈', 4, 1986749219853660162, '2025110700010', 0, 0, NULL, '2025-11-07 18:55:03', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987081063212048386, 7, '维修优化规则1', '维修最终诊断等于7mil内圈，当前值7mil内圈', 4, 1987081050595581954, '2025110800001', 0, 0, NULL, '2025-11-08 16:53:38', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987142499766493185, 8, '故障预测规则1', '故障剩余时间小于1，当前值0.0142天后null', 1, 1987142487187775489, '2025110800006', 0, 0, NULL, '2025-11-08 20:57:46', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987143868971843585, 8, '故障预测规则1', '故障剩余时间小于1，当前值0.59天后0.0142', 1, 1987143858112790529, '2025110800007', 0, 0, NULL, '2025-11-08 21:03:12', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987154771909922818, 9, '剩余使用寿命规则1', '剩余使用寿命大于97.86%，当前值97.86%', 3, 1987154759272484865, '2025110800012', 0, 0, NULL, '2025-11-08 21:46:32', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987154782022389762, 9, '剩余使用寿命规则1', '剩余使用寿命大于97.86%，当前值97.86%', 3, 1987154672433614850, '2025110800011', 0, 0, NULL, '2025-11-08 21:46:34', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987374218197159937, 3, '健康状态评估规则1', '健康状态等级不等于故障，当前值故障分1.42', 2, 1987374207375855617, '2025110900009', 0, 1, NULL, '2025-11-09 12:18:32', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987376189226442753, 3, '健康状态评估规则1', '健康状态等级不等于健康，当前值故障分1.42', 2, 1987376176131825665, '2025110900010', 0, 1, NULL, '2025-11-09 12:26:22', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987377084777455617, 3, '健康状态评估规则1', '健康状态等级不等于健康，当前值故障分1.42', 2, 1987377074019065857, '2025110900011', 0, 1, NULL, '2025-11-09 12:29:55', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987377333549936641, 3, '健康状态评估规则1', '健康状态等级不等于健康，当前值故障1.42', 2, 1987377322418253825, '2025110900012', 0, 1, NULL, '2025-11-09 12:30:55', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987431265831759874, 9, '剩余使用寿命规则1', '剩余使用寿命大于80%，当前值97.86%', 3, 1987431253739581442, '2025110900001', 0, 0, NULL, '2025-11-09 16:05:13', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987433871878664194, 7, '维修优化规则1', '维修最终诊断等于7mil内圈故障，当前值7mil内圈故障', 4, 1987433859358666754, '2025110900002', 0, 0, NULL, '2025-11-09 16:15:34', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987762017299656705, 3, '健康状态评估规则1', '健康状态等级不等于健康，当前值故障1.42', 2, 1987762005790486529, '2025111000003', 0, 1, NULL, '2025-11-10 13:59:30', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987762017299656706, 10, '健康状态评估规则2', '健康状态等级等于故障，当前值故障1.42', 2, 1987762005790486529, '2025111000003', 0, 2, NULL, '2025-11-10 13:59:30', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987765578574114817, 3, '健康状态评估规则1', '健康状态等级不等于健康，当前值故障1.42', 2, 1987765557770366978, '2025111000004', 0, 1, NULL, '2025-11-10 14:13:39', NULL, NULL);
INSERT INTO `phm_alert_event` VALUES (1987765578574114818, 10, '健康状态评估规则2', '健康状态等级等于故障，当前值故障1.42', 2, 1987765557770366978, '2025111000004', 0, 2, NULL, '2025-11-10 14:13:39', NULL, NULL);

-- ----------------------------
-- Table structure for phm_alert_rule
-- ----------------------------
DROP TABLE IF EXISTS `phm_alert_rule`;
CREATE TABLE `phm_alert_rule`  (
  `rule_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '规则id',
  `rule_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则描述',
  `monitoring_type` tinyint(4) NULL DEFAULT NULL COMMENT '监控指标 0-最终预测类别（故障检测模型）1-故障剩余天数（故障预测模型）2-健康状态等级（健康状态评估模型）',
  `trigger_condition` tinyint(4) NULL DEFAULT NULL COMMENT '触发条件 0-等于 1-不等于 2-大于 3-小于 ',
  `threshold` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阈值类型 0-轻度刀柄 1-中度刀柄 2-重度刀柄 0-健康 1-亚健康 2-故障',
  `alert_level` tinyint(4) NULL DEFAULT NULL COMMENT '告警级别 0-紧急 1-警告 2-提示',
  `rule_status` tinyint(4) NULL DEFAULT 1 COMMENT '规则状态 0-禁用 1-启用',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '告警规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phm_alert_rule
-- ----------------------------
INSERT INTO `phm_alert_rule` VALUES (2, 'guize', 'miaoshu', 0, 1, '1', 1, 0, 1981621769337565186, '2025-10-28 14:16:24', 3, '2025-10-28 16:06:24');
INSERT INTO `phm_alert_rule` VALUES (3, '健康状态评估规则1', '健康状态评估规则1', 2, 1, '0', 1, 1, 3, '2025-10-28 16:09:11', 1981621769337565186, '2025-11-09 12:18:20');
INSERT INTO `phm_alert_rule` VALUES (4, '故障诊断规则1', '故障诊断规则1', 5, 0, '2', 0, 1, 1981621769337565186, '2025-11-07 09:51:01', 1981621769337565186, '2025-11-07 09:51:01');
INSERT INTO `phm_alert_rule` VALUES (5, '故障检测规则1', '故障检测规则1', 0, 0, '0', 0, 1, 1981621769337565186, '2025-11-07 14:42:09', 1981621769337565186, '2025-11-07 14:58:36');
INSERT INTO `phm_alert_rule` VALUES (6, '故障检测规则1', '故障检测规则1', 0, 0, '0', 0, 1, 1981621769337565186, '2025-11-07 14:42:09', 1981621769337565186, '2025-11-07 14:58:36');
INSERT INTO `phm_alert_rule` VALUES (7, '维修优化规则1', '维修优化规则1', 4, 0, '4', 0, 1, 1981621769337565186, '2025-11-07 18:47:32', 1981621769337565186, '2025-11-07 18:48:05');
INSERT INTO `phm_alert_rule` VALUES (8, '故障预测规则1', '故障预测规则1', 1, 3, '100', 0, 1, 1981621769337565186, '2025-11-08 20:57:03', 1981621769337565186, '2025-11-12 15:18:46');
INSERT INTO `phm_alert_rule` VALUES (9, '剩余使用寿命规则1', '剩余使用寿命规则1', 3, 2, '80', 0, 1, 1981621769337565186, '2025-11-08 21:27:57', 1981621769337565186, '2025-11-08 21:27:57');
INSERT INTO `phm_alert_rule` VALUES (10, '健康状态评估规则2', '健康状态评估规则2', 2, 0, '3', 2, 1, 1981621769337565186, '2025-11-10 13:50:04', 1981621769337565186, '2025-11-10 13:50:17');

-- ----------------------------
-- Table structure for phm_algorithm
-- ----------------------------
DROP TABLE IF EXISTS `phm_algorithm`;
CREATE TABLE `phm_algorithm`  (
  `algorithm_id` bigint(20) NOT NULL COMMENT '算法id',
  `algorithm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法编码',
  `algorithm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法名称',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `algorithm_type` tinyint(4) NULL DEFAULT NULL COMMENT '算法类型 0-故障检测 1-故障预测 2-故障诊断 3-健康状态评估 4-剩余寿命预测 5-维修优化',
  `algorithm_port` int(11) NULL DEFAULT NULL COMMENT 'docker端口',
  `docker_algorithm_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'docker算法ip',
  `algorithm_status` tinyint(4) NULL DEFAULT NULL COMMENT '状态 0-禁用 1-启用',
  `real_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '实际状态 0-未启动 1-已启动',
  `algorithm_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法文件路径',
  `algorithm_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法文件名称',
  `image_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'docker镜像id',
  `docker_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'dockerID',
  `machine_port` int(11) NULL DEFAULT NULL COMMENT '宿主机端口',
  `correlation_task_num` int(11) NOT NULL DEFAULT 0 COMMENT '关联任务数',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `whether_hide` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏 0-否 1-是',
  PRIMARY KEY (`algorithm_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '算法信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phm_algorithm
-- ----------------------------
INSERT INTO `phm_algorithm` VALUES (1, '202511062', '载荷预测算法', 'v1.0.0', 8, 5000, '127.0.0.1', 0, 0, '/algorithmFile/2025-11/machining-service-v1.docker', 'machining-service-v1.docker', 'machining-service:v1', 'd4f53d2d73b3beb5512278b1012cdecf64f0d7c98399deab5b7564cb97d0d8f4', 9333, 0, NULL, NULL, 1981621769337565186, NULL, 1);
INSERT INTO `phm_algorithm` VALUES (2, '202511062', '临界转速预测算法', 'v1.0.0', 6, 8000, '127.0.0.1', 0, 0, '/algorithmFile/2025-11/lobe-api(3).docker', 'lobe-api(3).docker', 'lobe-api:latest', '4f9e57b3c574f0aafec8b58b5ecb74e43b799aef392491e536f3c32fc4110f05', 9485, 0, NULL, NULL, 1981621769337565186, NULL, 1);
INSERT INTO `phm_algorithm` VALUES (3, '202511062', '退化预测算法', 'v1.0.0', 9, 8000, '127.0.0.1', 0, 0, '/algorithmFile/2025-11/lobe-api(3).docker', 'lobe-api(3).docker', 'spindle_health_classifier:v3', 'fc42e9ecc1768b168e895f2b0eeabbd55f85218c52f7e24c42106d16993cc279', 9486, 0, NULL, NULL, 1981621769337565186, NULL, 1);
INSERT INTO `phm_algorithm` VALUES (7, '20251106', '颤振算法-离线', 'v1.0.0', 7, 8000, '127.0.0.1', 0, 0, '/algorithmFile/2025-11/flutter-api.docker', 'flutter-api.docker', 'flutter-api:1.0.0', '49374ff6832062911de9b732a29b1bd3de2f6c163cb551d5cd43bf01749b4219', 9348, 0, NULL, NULL, 1981621769337565186, NULL, 1);
INSERT INTO `phm_algorithm` VALUES (1986368745823150082, '202511063', '故障诊断算法', 'v1.0.0', 2, 5000, '127.0.0.1', 1, 0, '/algorithmFile/2025-11/bearing-diagnosis-api.docker', 'bearing-diagnosis-api.docker', 'bearing-diagnosis-final:latest', '6e68241322f4eacf61bd260e852b764a759f74ff80f8c35637becb426b33b1c7', 5000, 4, NULL, NULL, 1981621769337565186, NULL, 0);
INSERT INTO `phm_algorithm` VALUES (1986373999872634882, '202511064', '故障检测算法', 'v1.0.0', 0, 5000, '127.0.0.1', 1, 0, '/algorithmFile/2025-11/cnc-fault-detection.docker', 'cnc-fault-detection.docker', 'cnc-fault-detection-final:v2.0', 'f2362b871698c7bda60e7d533a0baca61826bef9a64140207f927b58b159e3d7', 5000, 0, NULL, NULL, 1981621769337565186, NULL, 0);
INSERT INTO `phm_algorithm` VALUES (1986671969963700225, '202511071', '故障诊断2', 'v1.1.0', 2, 5000, '127.0.0.1', 1, 0, '/algorithmFile/2025-11/bearing-diagnosis-api.docker', 'bearing-diagnosis-api.docker', 'bearing-diagnosis-final:latest', 'd0211bbd54eb2a61248848fe7252aadba009048505dc042887d3568e3a1bd881', 5000, 1, NULL, NULL, 1981621769337565186, NULL, 0);
INSERT INTO `phm_algorithm` VALUES (1986684819729895426, '202511074', '维修优化', 'v1.0.0', 5, 5000, '127.0.0.1', 1, 0, '/algorithmFile/2025-11/cnc-fault-detection.docker', 'cnc-fault-detection.docker', 'bearing-fault-diagnosis:v1.0', 'e8f3668f77386ce521ada119b302ad8d023c7fea424b20cec0c2e37f7713eecf', 9334, 3, NULL, NULL, 1981621769337565186, NULL, 0);
INSERT INTO `phm_algorithm` VALUES (1986684819729895427, '202511075', '故障预测', 'v1.0.0', 1, 5001, '127.0.0.1', 1, 0, '/algorithmFile/2025-11/cnc-fault-detection.docker', 'cnc-fault-detection.docker', 'bearing-fault-predict-api:latest', '0902e25ee87dc9f034f8ca48364f4ba288d9ce5818a685e376f63bad8ab72722', 9078, 1, NULL, NULL, 1981621769337565186, NULL, 0);
INSERT INTO `phm_algorithm` VALUES (1986684819729895428, '202511081', '剩余寿命预测', 'v1.0.0', 4, 8001, '127.0.0.1', 1, 0, '/algorithmFile/2025-11/cnc-fault-detection.docker', 'cnc-fault-detection.docker', 'fault-detection-api:v2', '7096d089f9c7284bf0541eafe032cf4a35fb0bcdfbd3cb65c870997bdc7ba7f4', 9079, 3, NULL, NULL, 1981621769337565186, NULL, 0);
INSERT INTO `phm_algorithm` VALUES (1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', 3, 5001, '127.0.0.1', 1, 0, '/algorithmFile/2025-11/cnc-fault-detection.docker', 'cnc-fault-detection.docker', 'bearing-health-predict-api:latest', 'b319613d17ac0e0a0da867e31640d0789547365bcfcaefe0dab157286fbde507', 5001, 3, NULL, NULL, 1981621769337565186, NULL, 0);

-- ----------------------------
-- Table structure for phm_collect_file
-- ----------------------------
DROP TABLE IF EXISTS `phm_collect_file`;
CREATE TABLE `phm_collect_file`  (
  `collect_file_id` bigint(20) NOT NULL COMMENT '采集文件id',
  `file_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_real_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件真实名称',
  `source_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '来源 0-手动 1-自动',
  `biz_id` bigint(20) NULL DEFAULT NULL COMMENT '关联id',
  `biz_record_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联记录ID',
  `file_path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `file_size` int(11) NOT NULL DEFAULT 0 COMMENT '文件大小（字节）',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `whether_hide` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏 0-否 1-是',
  PRIMARY KEY (`collect_file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采集文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phm_collect_file
-- ----------------------------
INSERT INTO `phm_collect_file` VALUES (1980144469212831746, '测试', '语言配置.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510201330005763_语言配置.xlsx', 0, 3, '2025-10-20 13:30:05', 3, '2025-10-20 13:30:05', 0);
INSERT INTO `phm_collect_file` VALUES (1980144643138035713, '111', '语言配置.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510201330455483_语言配置.xlsx', 0, 3, '2025-10-20 13:30:46', 3, '2025-10-20 13:30:46', 0);
INSERT INTO `phm_collect_file` VALUES (1980189350392143874, '111111', '语言配置.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510201628020572_语言配置.xlsx', 0, 3, '2025-10-20 16:28:25', 3, '2025-10-20 16:28:25', 0);
INSERT INTO `phm_collect_file` VALUES (1980448589717671938, NULL, NULL, 0, NULL, NULL, NULL, 0, 3, '2025-10-21 09:38:33', 3, '2025-10-21 09:38:33', 1);
INSERT INTO `phm_collect_file` VALUES (1980449838269616130, NULL, NULL, 0, NULL, NULL, NULL, 0, 3, '2025-10-21 09:43:31', 3, '2025-10-21 09:43:31', 1);
INSERT INTO `phm_collect_file` VALUES (1980450254550093826, NULL, NULL, 0, NULL, NULL, NULL, 0, 3, '2025-10-21 09:45:10', 3, '2025-10-21 09:45:10', 1);
INSERT INTO `phm_collect_file` VALUES (1980452351488225282, NULL, NULL, 0, NULL, NULL, NULL, 0, 3, '2025-10-21 09:53:30', 3, '2025-10-21 09:53:30', 1);
INSERT INTO `phm_collect_file` VALUES (1980453266970624001, '订单列表 (7).xlsx', '订单列表 (7).xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510210957014221_订单列表 (7).xlsx', 9390, 3, '2025-10-21 09:57:08', 3, '2025-10-21 09:57:08', 1);
INSERT INTO `phm_collect_file` VALUES (1980453641534554115, '订单列表 (7).xlsx', '订单列表 (7).xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510210958288967_订单列表 (7).xlsx', 9390, 3, '2025-10-21 09:58:37', 3, '2025-10-21 09:58:37', 1);
INSERT INTO `phm_collect_file` VALUES (1980461158687809537, '123', '订单列表.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510211028221815_订单列表.xlsx', 4470, 3, '2025-10-21 10:28:30', 3, '2025-10-21 10:28:30', 0);
INSERT INTO `phm_collect_file` VALUES (1980477810401845250, '语言配置.xlsx', '语言配置.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510211134323307_语言配置.xlsx', 0, 3, '2025-10-21 11:34:40', 3, '2025-10-21 11:34:40', 1);
INSERT INTO `phm_collect_file` VALUES (1980495867614466049, '订单列表 (7).xlsx', '订单列表 (7).xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510211246188167_订单列表 (7).xlsx', 0, 3, '2025-10-21 12:46:25', 3, '2025-10-21 12:46:25', 1);
INSERT INTO `phm_collect_file` VALUES (1980504128136810498, '订单列表 (7).xlsx', '订单列表 (7).xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510211319000271_订单列表 (7).xlsx', 0, 3, '2025-10-21 13:19:14', 3, '2025-10-21 13:19:14', 1);
INSERT INTO `phm_collect_file` VALUES (1980504405564854274, '订单列表 (7).xlsx', '订单列表 (7).xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510211320057092_订单列表 (7).xlsx', 0, 3, '2025-10-21 13:20:20', 3, '2025-10-21 13:20:20', 1);
INSERT INTO `phm_collect_file` VALUES (1980504721366585346, 'aaaaaa', '订单列表.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510211321317523_订单列表.xlsx', 4469, 3, '2025-10-21 13:21:36', 3, '2025-10-21 13:21:36', 0);
INSERT INTO `phm_collect_file` VALUES (1980504800093671426, '1111111111111', '订单列表 (7).xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510211321510423_订单列表 (7).xlsx', 9390, 3, '2025-10-21 13:21:55', 3, '2025-10-21 13:21:55', 0);
INSERT INTO `phm_collect_file` VALUES (1980514445965377539, '语言配置.xlsx', '语言配置.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510211400024800_语言配置.xlsx', 0, 3, '2025-10-21 14:00:14', 3, '2025-10-21 14:00:14', 1);
INSERT INTO `phm_collect_file` VALUES (1980517082894946306, '订单列表 (7).xlsx', '订单列表 (7).xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510211410358937_订单列表 (7).xlsx', 0, 3, '2025-10-21 14:10:43', 3, '2025-10-21 14:10:43', 1);
INSERT INTO `phm_collect_file` VALUES (1980517667836776449, '订单列表.xlsx', '订单列表.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510211412520231_订单列表.xlsx', 0, 3, '2025-10-21 14:13:02', 3, '2025-10-21 14:13:02', 1);
INSERT INTO `phm_collect_file` VALUES (1980811680271806466, '订单列表 (7).xlsx', '订单列表 (7).xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510220941120714_订单列表 (7).xlsx', 0, 3, '2025-10-22 09:41:20', 3, '2025-10-22 09:41:20', 1);
INSERT INTO `phm_collect_file` VALUES (1980850949216514051, '订单列表 (7).xlsx', '订单列表 (7).xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510221217139829_订单列表 (7).xlsx', 0, 3, '2025-10-22 12:17:23', 3, '2025-10-22 12:17:23', 1);
INSERT INTO `phm_collect_file` VALUES (1980854765848604674, '订单列表 (7).xlsx', '订单列表 (7).xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510221232252558_订单列表 (7).xlsx', 0, 3, '2025-10-22 12:32:33', 3, '2025-10-22 12:32:33', 1);
INSERT INTO `phm_collect_file` VALUES (1980856811771375619, '订单列表.xlsx', '订单列表.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510221240331932_订单列表.xlsx', 0, 3, '2025-10-22 12:40:41', 3, '2025-10-22 12:40:41', 1);
INSERT INTO `phm_collect_file` VALUES (1980863309205450755, '语言配置.xlsx', '语言配置.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510221306251462_语言配置.xlsx', 0, 3, '2025-10-22 13:06:30', 3, '2025-10-22 13:06:30', 1);
INSERT INTO `phm_collect_file` VALUES (1980870441774592002, '语言配置.xlsx', '语言配置.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510221334256020_语言配置.xlsx', 0, 3, '2025-10-22 13:34:50', 3, '2025-10-22 13:34:50', 1);
INSERT INTO `phm_collect_file` VALUES (1980874998764240899, '语言配置.xlsx', '语言配置.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510221352489041_语言配置.xlsx', 0, 3, '2025-10-22 13:52:57', 3, '2025-10-22 13:52:57', 1);
INSERT INTO `phm_collect_file` VALUES (1980875959142379521, '订单列表 (7).xlsx', '订单列表 (7).xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510221356376673_订单列表 (7).xlsx', 0, 3, '2025-10-22 13:56:46', 3, '2025-10-22 13:56:46', 1);
INSERT INTO `phm_collect_file` VALUES (1980876300525170690, '语言配置.xlsx', '语言配置.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510221357522300_语言配置.xlsx', 0, 3, '2025-10-22 13:58:07', 3, '2025-10-22 13:58:07', 1);
INSERT INTO `phm_collect_file` VALUES (1980912978312712195, 'Q5.xlsx', 'Q5.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510221623175877_Q5.xlsx', 0, 3, '2025-10-22 16:23:52', 3, '2025-10-22 16:23:52', 1);
INSERT INTO `phm_collect_file` VALUES (1980923884165791746, '订单列表 (7).xlsx', '订单列表 (7).xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510221707027440_订单列表 (7).xlsx', 0, 3, '2025-10-22 17:07:12', 3, '2025-10-22 17:07:12', 1);
INSERT INTO `phm_collect_file` VALUES (1981199985735766018, '订单列表 (7).xlsx', '订单列表 (7).xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510231121027504_订单列表 (7).xlsx', 0, 3, '2025-10-23 11:24:20', 3, '2025-10-23 11:24:20', 1);
INSERT INTO `phm_collect_file` VALUES (1981203494027792387, '语言配置.xlsx', '语言配置.xlsx', 0, NULL, NULL, '/collectFile/2025-10/202510231138104779_语言配置.xlsx', 0, 3, '2025-10-23 11:38:16', 3, '2025-10-23 11:38:16', 1);
INSERT INTO `phm_collect_file` VALUES (1981375581514264577, '2222222', '语言配置.xlsx', 0, NULL, NULL, '/collectFile/2025-10/语言配置.xlsx', 45310, 3, '2025-10-23 23:02:05', 3, '2025-10-23 23:02:05', 0);
INSERT INTO `phm_collect_file` VALUES (1981631137881653250, '语言配置.xlsx', '语言配置.xlsx', 0, NULL, NULL, '/collectFile/2025-10/语言配置.xlsx', 0, 1981622068357885954, '2025-10-24 15:57:34', 1981622068357885954, '2025-10-24 15:57:34', 1);
INSERT INTO `phm_collect_file` VALUES (1981662076057812994, '语言配置.xlsx', '语言配置.xlsx', 0, NULL, NULL, '/collectFile/2025-10/语言配置.xlsx', 0, 1981622068357885954, '2025-10-24 18:00:31', 1981622068357885954, '2025-10-24 18:00:31', 1);
INSERT INTO `phm_collect_file` VALUES (1985977432548225026, 'test.xlsx', 'test.xlsx', 0, NULL, NULL, '/collectFile/2025-11/6bced017c02ac26fb7cb94117e80a8c4.xlsx', 22554506, 1981621769337565186, '2025-11-05 15:48:12', 1981621769337565186, '2025-11-06 15:38:51', 0);
INSERT INTO `phm_collect_file` VALUES (1985989160480677890, 'test.xlsx', 'test.xlsx', 0, NULL, NULL, '/collectFile/2025-11/e75e1e629165dbd46c4200abda0cd051.xlsx', 22554506, 1981621769337565186, '2025-11-05 16:34:48', 1981621769337565186, '2025-11-05 16:34:48', 1);
INSERT INTO `phm_collect_file` VALUES (1986067658100600834, '媒体报道统计表.xlsx', '媒体报道统计表.xlsx', 0, NULL, NULL, '/collectFile/2025-11/253320a2dd73fb7b76b3522277cc5dd6.xlsx', 11875, 3, '2025-11-05 21:46:43', 3, '2025-11-05 21:46:43', 1);
INSERT INTO `phm_collect_file` VALUES (1986068793163149314, '媒体报道统计表.xlsx', '媒体报道统计表.xlsx', 0, NULL, NULL, '/collectFile/2025-11/7b208cd28477a0cf2e16e76e9581a614.xlsx', 11875, 3, '2025-11-05 21:51:14', 3, '2025-11-05 21:51:14', 1);
INSERT INTO `phm_collect_file` VALUES (1986076326007304194, '媒体报道统计表.xlsx', '媒体报道统计表.xlsx', 0, NULL, NULL, '/collectFile/2025-11/5423bbe3fae4a84f81de2589015ba578.xlsx', 11875, 3, '2025-11-05 22:21:10', 3, '2025-11-05 22:21:10', 1);
INSERT INTO `phm_collect_file` VALUES (1986370400899702786, 'B014_0_converted.xlsx', 'B014_0_converted.xlsx', 0, NULL, NULL, '/collectFile/2025-11/e55522728591b2fb17061f7a28e8b519.xlsx', 3161598, 1981621769337565186, '2025-11-06 17:49:43', 1981621769337565186, '2025-11-07 10:01:25', 0);
INSERT INTO `phm_collect_file` VALUES (1986375699031322625, '轻度_6000.xlsx', '轻度_6000.xlsx', 0, NULL, NULL, '/collectFile/2025-11/40f6bdbc73144c6cabe54143aa212fe4.xlsx', 151862443, 1981621769337565186, '2025-11-06 18:10:46', 1981621769337565186, '2025-11-06 18:21:00', 0);
INSERT INTO `phm_collect_file` VALUES (1986673630408962050, 'B014_0_converted.xlsx', 'B014_0_converted.xlsx', 0, NULL, NULL, '/collectFile/2025-11/dc7bd4d1a23b5800b495f65209f1f2b5.xlsx', 3161598, 1981621769337565186, '2025-11-07 13:54:40', 1981621769337565186, '2025-11-07 13:54:40', 1);
INSERT INTO `phm_collect_file` VALUES (1986674079455342595, 'B014_0_converted.xlsx', 'B014_0_converted.xlsx', 0, NULL, NULL, '/collectFile/2025-11/dc7bd4d1a23b5800b495f65209f1f2b5.xlsx', 3161598, 1981621769337565186, '2025-11-07 13:56:27', 1981621769337565186, '2025-11-07 13:56:27', 1);
INSERT INTO `phm_collect_file` VALUES (1986674494108430339, 'B014_0_converted.xlsx', 'B014_0_converted.xlsx', 0, NULL, NULL, '/collectFile/2025-11/dc7bd4d1a23b5800b495f65209f1f2b5.xlsx', 3161598, 1981621769337565186, '2025-11-07 13:58:06', 1981621769337565186, '2025-11-07 13:58:06', 1);
INSERT INTO `phm_collect_file` VALUES (1986674792633823235, 'B014_0_converted.xlsx', 'B014_0_converted.xlsx', 0, NULL, NULL, '/collectFile/2025-11/dc7bd4d1a23b5800b495f65209f1f2b5.xlsx', 3161598, 1981621769337565186, '2025-11-07 13:59:17', 1981621769337565186, '2025-11-07 13:59:20', 0);
INSERT INTO `phm_collect_file` VALUES (1986677908783603714, 'B014_0_converted.xlsx', 'B014_0_converted.xlsx', 0, NULL, NULL, '/collectFile/2025-11/dc7bd4d1a23b5800b495f65209f1f2b5.xlsx', 3161598, 1981621769337565186, '2025-11-07 14:11:40', 1981621769337565186, '2025-11-07 14:11:42', 0);
INSERT INTO `phm_collect_file` VALUES (1986678946034921475, 'B014_0_converted.xlsx', 'B014_0_converted.xlsx', 0, NULL, NULL, '/collectFile/2025-11/dc7bd4d1a23b5800b495f65209f1f2b5.xlsx', 3161598, 1981621769337565186, '2025-11-07 14:15:48', 1981621769337565186, '2025-11-07 14:15:50', 0);
INSERT INTO `phm_collect_file` VALUES (1986679290232131586, 'B014_0_converted.xlsx', 'B014_0_converted.xlsx', 0, NULL, NULL, '/collectFile/2025-11/dc7bd4d1a23b5800b495f65209f1f2b5.xlsx', 3161598, 1981621769337565186, '2025-11-07 14:17:10', 1981621769337565186, '2025-11-07 14:17:12', 0);
INSERT INTO `phm_collect_file` VALUES (1986686149802414082, '轻度_6000.xlsx', '轻度_6000.xlsx', 0, NULL, NULL, '/collectFile/2025-11/300bda006de836a261dbc62a9fa75c2d.xlsx', 151862443, 1981621769337565186, '2025-11-07 14:44:25', 1981621769337565186, '2025-11-07 14:45:51', 0);
INSERT INTO `phm_collect_file` VALUES (1986690548226408450, '轻度_6000.xlsx', '轻度_6000.xlsx', 0, NULL, NULL, '/collectFile/2025-11/300bda006de836a261dbc62a9fa75c2d.xlsx', 151862443, 1981621769337565186, '2025-11-07 15:01:54', 1981621769337565186, '2025-11-07 15:03:19', 0);
INSERT INTO `phm_collect_file` VALUES (1986737045026443265, '1.xlsx', '1.xlsx', 0, NULL, NULL, '/collectFile/2025-11/a30b300884e819e05d694768964bc9c4.xlsx', 1038173, 1981621769337565186, '2025-11-07 18:06:37', 1981621769337565186, '2025-11-07 18:06:37', 0);
INSERT INTO `phm_collect_file` VALUES (1986744490830458882, 'B021_2.xlsx', 'B021_2.xlsx', 0, NULL, NULL, '/collectFile/2025-11/e0c19009f96abeb76f5e0bdf0bd99702.xlsx', 3173374, 1981621769337565186, '2025-11-07 18:36:13', 1981621769337565186, '2025-11-07 18:36:13', 1);
INSERT INTO `phm_collect_file` VALUES (1986745654863065090, 'B021_2.xlsx', 'B021_2.xlsx', 0, NULL, NULL, '/collectFile/2025-11/e0c19009f96abeb76f5e0bdf0bd99702.xlsx', 3173374, 1981621769337565186, '2025-11-07 18:40:50', 1981621769337565186, '2025-11-07 18:40:50', 1);
INSERT INTO `phm_collect_file` VALUES (1986745732264751106, 'B021_2.xlsx', 'B021_2.xlsx', 0, NULL, NULL, '/collectFile/2025-11/e0c19009f96abeb76f5e0bdf0bd99702.xlsx', 3173374, 1981621769337565186, '2025-11-07 18:41:09', 1981621769337565186, '2025-11-07 18:41:09', 1);
INSERT INTO `phm_collect_file` VALUES (1986746005502685187, 'B021_2.xlsx', 'B021_2.xlsx', 0, NULL, NULL, '/collectFile/2025-11/e0c19009f96abeb76f5e0bdf0bd99702.xlsx', 3173374, 1981621769337565186, '2025-11-07 18:42:14', 1981621769337565186, '2025-11-07 18:42:14', 1);
INSERT INTO `phm_collect_file` VALUES (1986746177448177666, 'B021_2.xlsx', 'B021_2.xlsx', 0, NULL, NULL, '/collectFile/2025-11/e0c19009f96abeb76f5e0bdf0bd99702.xlsx', 3173374, 1981621769337565186, '2025-11-07 18:42:55', 1981621769337565186, '2025-11-07 18:42:55', 1);
INSERT INTO `phm_collect_file` VALUES (1986747362594910211, 'B021_2.xlsx', 'B021_2.xlsx', 0, NULL, NULL, '/collectFile/2025-11/e0c19009f96abeb76f5e0bdf0bd99702.xlsx', 3173374, 1981621769337565186, '2025-11-07 18:47:37', 1981621769337565186, '2025-11-07 18:47:37', 1);
INSERT INTO `phm_collect_file` VALUES (1986747971213516803, 'B021_2.xlsx', 'B021_2.xlsx', 0, NULL, NULL, '/collectFile/2025-11/e0c19009f96abeb76f5e0bdf0bd99702.xlsx', 3173374, 1981621769337565186, '2025-11-07 18:50:02', 1981621769337565186, '2025-11-07 18:50:02', 1);
INSERT INTO `phm_collect_file` VALUES (1986749219883020289, 'B021_2.xlsx', 'B021_2.xlsx', 0, NULL, NULL, '/collectFile/2025-11/e0c19009f96abeb76f5e0bdf0bd99702.xlsx', 3173374, 1981621769337565186, '2025-11-07 18:55:00', 1981621769337565186, '2025-11-07 18:55:00', 1);
INSERT INTO `phm_collect_file` VALUES (1987081050683662338, 'B021_2.xlsx', 'B021_2.xlsx', 0, NULL, NULL, '/collectFile/2025-11/e0c19009f96abeb76f5e0bdf0bd99702.xlsx', 3173374, 1981621769337565186, '2025-11-08 16:53:35', 1981621769337565186, '2025-11-08 16:53:35', 1);
INSERT INTO `phm_collect_file` VALUES (1987433859358666755, 'B021_2.xlsx', 'B021_2.xlsx', 0, NULL, NULL, '/collectFile/2025-11/e0c19009f96abeb76f5e0bdf0bd99702.xlsx', 3173374, 1981621769337565186, '2025-11-09 16:15:32', 1981621769337565186, '2025-11-09 16:15:32', 1);

-- ----------------------------
-- Table structure for phm_collect_file_channel_mapping
-- ----------------------------
DROP TABLE IF EXISTS `phm_collect_file_channel_mapping`;
CREATE TABLE `phm_collect_file_channel_mapping`  (
  `collect_file_channel_mapping_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '采集文件通道映射id',
  `collect_file_id` bigint(20) NULL DEFAULT NULL COMMENT '采集文件id',
  `channel_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道id',
  `measure_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '测量类型0-电压测量, 1-应变应力, 2-桥式传感器, 3-热电偶测温',
  `sensor_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '传感器类型 0-加速度',
  `sensor_value` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '传感器类型0-电压, 1-位移, 2-速度, 3-加速度, 4-力, 5-压力, 6-应变, 7-流速, 8-角速度 9-温度 10-力矩 11-应力',
  PRIMARY KEY (`collect_file_channel_mapping_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采集文件通道映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phm_collect_file_channel_mapping
-- ----------------------------
INSERT INTO `phm_collect_file_channel_mapping` VALUES (1, 1980453266970624001, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (2, 1980453266970624001, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (3, 1980453266970624001, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (4, 1980453266970624001, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (5, 1980453266970624001, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (6, 1980453641534554115, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (7, 1980453641534554115, '2', 0, 2, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (8, 1980453641534554115, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (9, 1980453641534554115, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (10, 1980453641534554115, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (11, 1980477810401845250, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (12, 1980477810401845250, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (13, 1980477810401845250, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (14, 1980477810401845250, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (15, 1980477810401845250, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (16, 1980495867614466049, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (17, 1980495867614466049, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (18, 1980495867614466049, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (19, 1980495867614466049, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (20, 1980495867614466049, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (21, 1980504128136810498, '1', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (22, 1980504128136810498, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (23, 1980504128136810498, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (24, 1980504128136810498, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (25, 1980504128136810498, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (26, 1980504405564854274, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (27, 1980504405564854274, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (28, 1980504405564854274, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (29, 1980504405564854274, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (30, 1980504405564854274, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (31, 1980514445965377539, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (32, 1980514445965377539, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (33, 1980514445965377539, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (34, 1980514445965377539, '4', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (35, 1980514445965377539, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (36, 1980517082894946306, '1', 0, 2, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (37, 1980517082894946306, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (38, 1980517082894946306, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (39, 1980517082894946306, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (40, 1980517082894946306, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (41, 1980517667836776449, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (42, 1980517667836776449, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (43, 1980517667836776449, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (44, 1980517667836776449, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (45, 1980517667836776449, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (46, 1980811680271806466, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (47, 1980811680271806466, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (48, 1980811680271806466, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (49, 1980811680271806466, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (50, 1980811680271806466, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (51, 1980850949216514051, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (52, 1980850949216514051, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (53, 1980850949216514051, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (54, 1980850949216514051, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (55, 1980850949216514051, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (56, 1980854765848604674, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (57, 1980854765848604674, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (58, 1980854765848604674, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (59, 1980854765848604674, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (60, 1980854765848604674, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (61, 1980863309205450755, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (62, 1980863309205450755, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (63, 1980863309205450755, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (64, 1980863309205450755, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (65, 1980863309205450755, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (66, 1980504800093671426, '1', 0, 4, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (67, 1980504800093671426, '2', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (68, 1980504800093671426, '3', 0, 2, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (69, 1980504800093671426, '4', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (70, 1980504800093671426, '5', 0, 2, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (71, 1980874998764240899, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (72, 1980874998764240899, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (73, 1980874998764240899, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (74, 1980874998764240899, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (75, 1980874998764240899, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (76, 1980875959142379521, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (77, 1980875959142379521, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (78, 1980875959142379521, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (79, 1980875959142379521, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (80, 1980875959142379521, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (81, 1980876300525170690, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (82, 1980876300525170690, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (83, 1980876300525170690, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (84, 1980876300525170690, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (85, 1980876300525170690, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (86, 1980912978312712195, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (87, 1980912978312712195, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (88, 1980912978312712195, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (89, 1980912978312712195, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (90, 1980912978312712195, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (91, 1980912978312712195, '6', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (92, 1980912978312712195, '7', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (93, 1980923884165791746, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (94, 1980923884165791746, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (95, 1980923884165791746, '3', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (96, 1980923884165791746, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (97, 1980923884165791746, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (98, 1981199985735766018, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (99, 1981199985735766018, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (100, 1981199985735766018, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (101, 1981199985735766018, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (102, 1981199985735766018, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (103, 1981203494027792387, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (104, 1981203494027792387, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (105, 1981203494027792387, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (106, 1981203494027792387, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (107, 1981203494027792387, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (108, 1981631137881653250, '1', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (109, 1981631137881653250, '2', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (110, 1981631137881653250, '3', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (111, 1981631137881653250, '4', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (112, 1981631137881653250, '5', 0, 0, NULL);
INSERT INTO `phm_collect_file_channel_mapping` VALUES (113, 1981662076057812994, '1', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (114, 1981662076057812994, '2', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (115, 1981662076057812994, '3', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (116, 1981662076057812994, '4', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (117, 1981662076057812994, '5', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (118, 1985977432548225026, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (119, 1985989160480677890, '1', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (120, 1986067658100600834, '1', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (121, 1986067658100600834, '2', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (122, 1986067658100600834, '3', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (123, 1986067658100600834, '4', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (124, 1986067658100600834, '5', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (125, 1986067658100600834, '6', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (126, 1986068793163149314, '1', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (127, 1986068793163149314, '2', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (128, 1986068793163149314, '3', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (129, 1986068793163149314, '4', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (130, 1986068793163149314, '5', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (131, 1986068793163149314, '6', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (132, 1986076326007304194, '1', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (133, 1986076326007304194, '2', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (134, 1986076326007304194, '3', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (135, 1986076326007304194, '4', 3, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (136, 1986076326007304194, '5', 0, 2, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (137, 1986076326007304194, '6', 0, 0, '');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (138, 1986370400899702786, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (139, 1986370400899702786, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (140, 1986375699031322625, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (141, 1986375699031322625, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (142, 1986375699031322625, '3', 0, 3, '2');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (143, 1986673630408962050, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (144, 1986673630408962050, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (145, 1986674079455342595, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (146, 1986674079455342595, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (147, 1986674494108430339, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (148, 1986674494108430339, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (149, 1986674792633823235, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (150, 1986674792633823235, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (151, 1986677908783603714, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (152, 1986677908783603714, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (153, 1986678946034921475, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (154, 1986678946034921475, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (155, 1986679290232131586, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (156, 1986679290232131586, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (157, 1986686149802414082, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (158, 1986686149802414082, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (159, 1986686149802414082, '3', 0, 3, '2');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (160, 1986690548226408450, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (161, 1986690548226408450, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (162, 1986690548226408450, '3', 0, 3, '2');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (163, 1986737045026443265, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (164, 1986737045026443265, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (165, 1986744490830458882, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (166, 1986744490830458882, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (167, 1986744490830458882, '3', 0, 3, '2');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (168, 1986745654863065090, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (169, 1986745654863065090, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (170, 1986745654863065090, '3', 0, 3, '2');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (171, 1986745732264751106, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (172, 1986745732264751106, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (173, 1986745732264751106, '3', 0, 3, '2');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (174, 1986746005502685187, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (175, 1986746005502685187, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (176, 1986746005502685187, '3', 0, 3, '2');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (177, 1986746177448177666, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (178, 1986746177448177666, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (179, 1986746177448177666, '3', 0, 3, '2');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (180, 1986747362594910211, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (181, 1986747362594910211, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (182, 1986747362594910211, '3', 0, 3, '2');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (183, 1986747971213516803, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (184, 1986747971213516803, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (185, 1986747971213516803, '3', 0, 3, '2');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (186, 1986749219883020289, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (187, 1986749219883020289, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (188, 1986749219883020289, '3', 0, 3, '2');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (189, 1987081050683662338, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (190, 1987081050683662338, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (191, 1987081050683662338, '3', 0, 3, '2');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (192, 1987433859358666755, '1', 0, 3, '0');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (193, 1987433859358666755, '2', 0, 3, '1');
INSERT INTO `phm_collect_file_channel_mapping` VALUES (194, 1987433859358666755, '3', 0, 3, '2');

-- ----------------------------
-- Table structure for phm_critical_speed_prediction_task
-- ----------------------------
DROP TABLE IF EXISTS `phm_critical_speed_prediction_task`;
CREATE TABLE `phm_critical_speed_prediction_task`  (
  `critical_speed_prediction_task_id` bigint(20) NOT NULL COMMENT '临界转速任务id',
  `critical_speed_prediction_task_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '临界转速任务编号',
  `critical_speed_prediction_task_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '临界转速任务名称',
  `critical_speed_prediction_task_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '临界转速任务描述',
  `task_status` tinyint(4) NULL DEFAULT 0 COMMENT '任务状态 0-分析中 1-排队中 2-已完成 3-失败',
  `failure_reason` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `algorithm_id` bigint(20) NULL DEFAULT NULL COMMENT '算法id',
  `algorithm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法编号',
  `algorithm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法名称',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法版本号',
  `harmonic_order_range` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '谐波阶数范围',
  `leaf_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '叶瓣数',
  `cutter_tooth_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '刀齿数',
  `x_direction_natural_freq` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0.00' COMMENT 'x方向0转速自然频率',
  `y_direction_natural_freq` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0.00' COMMENT 'y方向0转速自然频率',
  `x_direction_damping` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0.00' COMMENT 'x方向阻尼',
  `y_direction_damping` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0.00' COMMENT 'y方向阻尼',
  `x_direction_stiffness` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0.00' COMMENT 'x方向刚度',
  `y_direction_stiffness` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0.00' COMMENT 'y方向刚度',
  `rotational_speed_scan_range_start` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0.00' COMMENT '临界速度扫描范围起始值',
  `rotational_speed_scan_range_end` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0.00' COMMENT '临界速度扫描范围结束值',
  `tolerance_ratio` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0.00' COMMENT '容差比例',
  `img_file_path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图像文件路径',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`critical_speed_prediction_task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '临界转速任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of phm_critical_speed_prediction_task
-- ----------------------------
INSERT INTO `phm_critical_speed_prediction_task` VALUES (1986347853407735809, '2025110600002', '临界转速测试1', '临界转速测试1', 3, NULL, 2, '202511062', '临界转速预测算法', 'v1.0.0', '1', '1', '1', '1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '1.00', NULL, 1981621769337565186, '2025-11-06 16:20:07');
INSERT INTO `phm_critical_speed_prediction_task` VALUES (1986349027431194626, '2025110600003', '临界转速测试2', '临界转速测试2', 3, NULL, 2, '202511062', '临界转速预测算法', 'v1.0.0', '1', '1', '2', '3.00', '3.00', '4.00', '4.00', '5.00', '5.00', '6.00', '6.00', '7.00', NULL, 1981621769337565186, '2025-11-06 16:24:47');
INSERT INTO `phm_critical_speed_prediction_task` VALUES (1986351285728350209, '2025110600004', '临界转速测试3', '临界转速测试3', 3, NULL, 2, '202511062', '临界转速预测算法', 'v1.0.0', '1', '1', '2', '3.00', '3.00', '4.00', '4.00', '5.00', '5.00', '6.00', '6.00', '7.00', NULL, 3, '2025-11-06 16:33:45');
INSERT INTO `phm_critical_speed_prediction_task` VALUES (1986351442863755266, '2025110600005', '临界转速测试3', '临界转速测试3', 3, NULL, 2, '202511062', '临界转速预测算法', 'v1.0.0', '1', '1', '2', '3.00', '3.00', '4.00', '4.00', '5.00', '5.00', '6.00', '6.00', '7.00', NULL, 3, '2025-11-06 16:34:23');
INSERT INTO `phm_critical_speed_prediction_task` VALUES (1986351806950354946, '2025110600006', '临界转速测试3', '临界转速测试3', 3, NULL, 2, '202511062', '临界转速预测算法', 'v1.0.0', '1', '1', '2', '3.00', '3.00', '4.00', '4.00', '5.00', '5.00', '6.00', '6.00', '7.00', NULL, 3, '2025-11-06 16:35:50');
INSERT INTO `phm_critical_speed_prediction_task` VALUES (1986353189011312641, '2025110600007', '临界转速测试3', '临界转速测试3', 3, NULL, 2, '202511062', '临界转速预测算法', 'v1.0.0', '1', '1', '2', '3.00', '3.00', '4.00', '4.00', '5.00', '5.00', '6.00', '6.00', '7.00', NULL, 3, '2025-11-06 16:41:19');
INSERT INTO `phm_critical_speed_prediction_task` VALUES (1986353253028974593, '2025110600008', '临界转速测试3', '临界转速测试3', 3, NULL, 2, '202511062', '临界转速预测算法', 'v1.0.0', '1', '1', '2', '3.00', '3.00', '4.00', '4.00', '5.00', '5.00', '6.00', '6.00', '7.00', NULL, 3, '2025-11-06 16:41:34');
INSERT INTO `phm_critical_speed_prediction_task` VALUES (1986353966580670465, '2025110600009', '临界转速测试3', '临界转速测试3', 3, NULL, 2, '202511062', '临界转速预测算法', 'v1.0.0', '1', '1', '2', '3.00', '3.00', '4.00', '4.00', '5.00', '5.00', '6.00', '6.00', '7.00', NULL, 3, '2025-11-06 16:44:24');
INSERT INTO `phm_critical_speed_prediction_task` VALUES (1986354208369680385, '2025110600010', '临界转速测试3', '临界转速测试3', 3, NULL, 2, '202511062', '临界转速预测算法', 'v1.0.0', '1', '1', '2', '3.00', '3.00', '4.00', '4.00', '5.00', '5.00', '6.00', '6.00', '7.00', NULL, 3, '2025-11-06 16:45:22');
INSERT INTO `phm_critical_speed_prediction_task` VALUES (1986354654672986113, '2025110600011', '临界转速测试3', '临界转速测试3', 3, NULL, 2, '202511062', '临界转速预测算法', 'v1.0.0', '1', '1', '2', '3.00', '3.00', '4.00', '4.00', '5.00', '5.00', '6.00', '6.00', '7.00', NULL, 3, '2025-11-06 16:47:09');
INSERT INTO `phm_critical_speed_prediction_task` VALUES (1986358119373623297, '2025110600013', '临界转速测试9', '临界转速测试9', 2, NULL, 2, '202511062', '临界转速预测算法', 'v1.0.0', '3', '8', '3', '510.00', '802.00', '0.04', '0.05', '96200000.00', '47500000.00', '5000.00', '50000.00', '0.01', '/criticalSpeed/2025-11/stability_20251106_090222_143559.png', 3, '2025-11-06 17:00:55');

-- ----------------------------
-- Table structure for phm_device
-- ----------------------------
DROP TABLE IF EXISTS `phm_device`;
CREATE TABLE `phm_device`  (
  `device_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备id',
  `device_ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备IP地址',
  `passage_num` int(10) NULL DEFAULT NULL COMMENT '通道数',
  `interface_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口类型',
  `device_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `current_sample_freq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前采样频率',
  `device_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '连接状态 0-未连接 1-在线运行中 2-基础采集中 3-业务采集中',
  `run_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '运行状态 0-在线运行 1-基础采集中 2-业务采集中',
  PRIMARY KEY (`device_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备仪器信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phm_device
-- ----------------------------

-- ----------------------------
-- Table structure for phm_device_passage
-- ----------------------------
DROP TABLE IF EXISTS `phm_device_passage`;
CREATE TABLE `phm_device_passage`  (
  `passage_id` bigint(20) NOT NULL COMMENT '通道id',
  `passage_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通道号',
  `device_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联设备id',
  `whether_online` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否在线 0-是 1-否',
  `group_number` int(11) NULL DEFAULT 0 COMMENT '所属分组号',
  `passage_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道名称',
  `user_logo` tinyint(1) NOT NULL DEFAULT 0 COMMENT '通道使用标志',
  `usage_description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道使用描述',
  `passage_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '通道类型',
  `measure_meterage` tinyint(4) NOT NULL DEFAULT 0 COMMENT '测量量',
  `strain_bridge_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '应变桥路方式',
  `bridge_voltage` tinyint(4) NOT NULL DEFAULT 0 COMMENT '桥压',
  `measure_type` tinyint(8) NULL DEFAULT 0 COMMENT '通道测量类型',
  `full_scale_range` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '全量程',
  `transducer_sensitivity` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '100' COMMENT '传感器敏感度',
  `engineering_unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工程单位',
  `integral_type` tinyint(8) NULL DEFAULT 0 COMMENT '积分类型',
  `upper_limit_frequency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上限频率',
  `lower_limit_frequency` tinyint(8) NULL DEFAULT 0 COMMENT '下限频率',
  `input_mode` tinyint(8) NULL DEFAULT 0 COMMENT '输入方式',
  `compensation_channel` tinyint(4) NOT NULL DEFAULT 0 COMMENT '补偿通道',
  `material_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '材料类型',
  `sensor_bridge_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '传感器桥路方式',
  `sensitivity_correction` tinyint(4) NOT NULL DEFAULT 0 COMMENT '灵敏度修正',
  `thermocouple_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '热电偶类型',
  `cold_end_temperature` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冷端温度',
  `direction_exchange` tinyint(1) NOT NULL DEFAULT 0 COMMENT '方向交换',
  `signal_mode` tinyint(4) NOT NULL DEFAULT 0 COMMENT '信号方式',
  `frequency_doubling_method` tinyint(4) NOT NULL DEFAULT 0 COMMENT '倍频方式',
  `reset_mode` tinyint(4) NOT NULL DEFAULT 0 COMMENT '复位方式',
  `position_counter_threshold` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '位置计数器阈值',
  `speed_timing_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '速度定时时间',
  `key_phase_channel` tinyint(4) NOT NULL DEFAULT 0 COMMENT '键相通道',
  `pulse_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '脉冲数',
  `turn_ratio` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转数比',
  `dividing_ratio` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分频比',
  `anti_mixing_filter` tinyint(1) NULL DEFAULT 0 COMMENT '抗混滤波器 0-ON 1-OFF',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_id` bigint(20) NOT NULL COMMENT '创建人id',
  PRIMARY KEY (`passage_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备通道信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phm_device_passage
-- ----------------------------

-- ----------------------------
-- Table structure for phm_fault_detection_task
-- ----------------------------
DROP TABLE IF EXISTS `phm_fault_detection_task`;
CREATE TABLE `phm_fault_detection_task`  (
  `fault_detection_task_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '故障检测任务id',
  `fault_detection_task_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '故障检测任务编码',
  `fault_detection_task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障检测任务名称',
  `fault_detection_task_description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障检测任务描述',
  `collect_file_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采集文件id',
  `collect_file_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采集文件信息-采集编码/文件名',
  `collect_file_size` int(11) NOT NULL DEFAULT 0 COMMENT '采集文件大小',
  `data_source` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源 0-采集记录 1-上传文件',
  `task_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '任务状态 0-分析中 1-排队中 2-已完成 3-失败',
  `failure_reason` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `alert_level` tinyint(4) NULL DEFAULT NULL COMMENT '告警级别 0-提示 1-告警 2-紧急',
  `algorithm_id` bigint(20) NULL DEFAULT NULL COMMENT '算法id',
  `algorithm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法编号',
  `algorithm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法名称',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法版本号',
  `predict_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预测类别',
  `predict_probability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预测概率',
  `predict_each_segment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '各段预测',
  `confidence_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '置信度',
  `average_probability` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平均概率',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`fault_detection_task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1986690548226408450 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '故障检测任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phm_fault_detection_task
-- ----------------------------
INSERT INTO `phm_fault_detection_task` VALUES (1986375698968408065, '2025110600001', '故障检测测试1', '故障检测测试1', '1986375699031322625', '轻度_6000.xlsx', 151862443, 1, 3, NULL, NULL, 1986373999872634882, '202511064', '故障检测算法', 'v1.0.0', NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-06 18:10:46');
INSERT INTO `phm_fault_detection_task` VALUES (1986377319626502146, '2025110600002', '故障检测测试2', NULL, '1986375699031322625', '轻度_6000.xlsx', 151862443, 0, 3, NULL, NULL, 1986373999872634882, '202511064', '故障检测算法', 'v1.0.0', NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-06 18:17:13');
INSERT INTO `phm_fault_detection_task` VALUES (1986377798326550530, '2025110600003', '故障检测测试3', NULL, '1986375699031322625', '轻度_6000.xlsx', 151862443, 0, 2, NULL, NULL, 1986373999872634882, '202511064', '故障检测算法', 'v1.0.0', '轻度刀柄', '[{\"predictionType\":\"轻度刀柄\",\"probabilityValue\":\"0.9698\"},{\"predictionType\":\"中度刀柄\",\"probabilityValue\":\"0.0067\"},{\"predictionType\":\"重度刀柄\",\"probabilityValue\":\"0.0235\"}]', '[{\"segmentId\": 1, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 2, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 3, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 4, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 5, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 6, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 7, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 8, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 9, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 10, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 11, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 12, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 13, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 14, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 15, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 16, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 17, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 18, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 19, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 20, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 21, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 22, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 23, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 24, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 25, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 26, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 27, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 28, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 29, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 30, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 31, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 32, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 33, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 34, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 35, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 36, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 37, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 38, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 39, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 40, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 41, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 42, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 43, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 44, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 45, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 46, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 47, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 48, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 49, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 50, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 51, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 52, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 53, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 54, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 55, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 56, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 57, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 58, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 59, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 60, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 61, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 62, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 63, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 64, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 65, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 66, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 67, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 68, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 69, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 70, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 71, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 72, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 73, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 74, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 75, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 76, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 77, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 78, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 79, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 80, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 81, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 82, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 83, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 84, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 85, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 86, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 87, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 88, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 89, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 90, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 91, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 92, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 93, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 94, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 95, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 96, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 97, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 98, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 99, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 100, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 101, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 102, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 103, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 104, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 105, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 106, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 107, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 108, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 109, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 110, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 111, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 112, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 113, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 114, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 115, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 116, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 117, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 118, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 119, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 120, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 121, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 122, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 123, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 124, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 125, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 126, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 127, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 128, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 129, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 130, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 131, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 132, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 133, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 134, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 135, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 136, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 137, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 138, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 139, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 140, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 141, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 142, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 143, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 144, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 145, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 146, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 147, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 148, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 149, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 150, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 151, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 152, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 153, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 154, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 155, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 156, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 157, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 158, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 159, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 160, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 161, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 162, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 163, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 164, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 165, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 166, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 167, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 168, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 169, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 170, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 171, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 172, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 173, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 174, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 175, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 176, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 177, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 178, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 179, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 180, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 181, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 182, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 183, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 184, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 185, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 186, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 187, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 188, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 189, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 190, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 191, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 192, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 193, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 194, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 195, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 196, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 197, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 198, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 199, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 200, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 201, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 202, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 203, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 204, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 205, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 206, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 207, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 208, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 209, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 210, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 211, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 212, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 213, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 214, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 215, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 216, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 217, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 218, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 219, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 220, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 221, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 222, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 223, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 224, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 225, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 226, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 227, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 228, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 229, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 230, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 231, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 232, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 233, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 234, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 235, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 236, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 237, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 238, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 239, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 240, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 241, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 242, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 243, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 244, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 245, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 246, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 247, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 248, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 249, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 250, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 251, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 252, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 253, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 254, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 255, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 256, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 257, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 258, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 259, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 260, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 261, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 262, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 263, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 264, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 265, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 266, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 267, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 268, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 269, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 270, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 271, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 272, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 273, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 274, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 275, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 276, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 277, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 278, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 279, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 280, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 281, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 282, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 283, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 284, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 285, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 286, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 287, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 288, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 289, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 290, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 291, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 292, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 293, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 294, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 295, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 296, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 297, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 298, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 299, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 300, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 301, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 302, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 303, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 304, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 305, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 306, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 307, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 308, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 309, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 310, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 311, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 312, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 313, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 314, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 315, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 316, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 317, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 318, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 319, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 320, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 321, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 322, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 323, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 324, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 325, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 326, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 327, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 328, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 329, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 330, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 331, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 332, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 333, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 334, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 335, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 336, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 337, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 338, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 339, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 340, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 341, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 342, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 343, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 344, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 345, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 346, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 347, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 348, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 349, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 350, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 351, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 352, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 353, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 354, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 355, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 356, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 357, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 358, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 359, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 360, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 361, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 362, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 363, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 364, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 365, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 366, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 367, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 368, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 369, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 370, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 371, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 372, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 373, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 374, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 375, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 376, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 377, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 378, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 379, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 380, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 381, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 382, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 383, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 384, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 385, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 386, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 387, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 388, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 389, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 390, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 391, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 392, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 393, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 394, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 395, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 396, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 397, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 398, \"predictionType\": \"轻度刀柄\"}, {\"segmentId\": 399, \"predictionType\": \"轻度刀柄\"}]', NULL, NULL, 1981621769337565186, '2025-11-06 18:19:07');
INSERT INTO `phm_fault_detection_task` VALUES (1986686149802414081, '2025110700001', '故障检测任务', NULL, '1986686149802414082', '轻度_6000.xlsx', 151862443, 1, 2, NULL, NULL, 1986684819729895426, '202511073', '故障检测2', 'v1.1.0', '轻度刀柄', '[{\"predictionType\":\"轻度刀柄\",\"probabilityValue\":\"0.9698\"},{\"predictionType\":\"中度刀柄\",\"probabilityValue\":\"0.0067\"},{\"predictionType\":\"重度刀柄\",\"probabilityValue\":\"0.0235\"}]', '轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度', NULL, NULL, 1981621769337565186, '2025-11-07 14:44:24');
INSERT INTO `phm_fault_detection_task` VALUES (1986690548226408449, '2025110700003', '故障检测任务', NULL, '1986690548226408450', '轻度_6000.xlsx', 151862443, 1, 2, NULL, NULL, 1986684819729895426, '202511073', '故障检测2', 'v1.1.0', '轻度刀柄', '[{\"predictionType\":\"轻度刀柄\",\"probabilityValue\":\"0.9698\"},{\"predictionType\":\"中度刀柄\",\"probabilityValue\":\"0.0067\"},{\"predictionType\":\"重度刀柄\",\"probabilityValue\":\"0.0235\"}]', '轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度,轻度', '100.00', '0.9698', 1981621769337565186, '2025-11-07 15:01:52');

-- ----------------------------
-- Table structure for phm_fault_diagnosis_task
-- ----------------------------
DROP TABLE IF EXISTS `phm_fault_diagnosis_task`;
CREATE TABLE `phm_fault_diagnosis_task`  (
  `fault_diagnosis_task_id` bigint(20) NOT NULL COMMENT '故障诊断任务id',
  `fault_diagnosis_task_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障诊断任务编号',
  `fault_diagnosis_task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障诊断任务名称',
  `fault_diagnosis_task_description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障诊断任务描述',
  `collect_file_id` bigint(20) NULL DEFAULT NULL COMMENT '采集文件id',
  `collect_file_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采集文件信息-采集编码/文件名',
  `collect_file_size` int(11) NULL DEFAULT NULL COMMENT '采集文件大小',
  `data_source` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源 0-采集记录 1-上传文件',
  `task_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '任务状态 0-分析中 1-排队中 2-已完成 3-失败',
  `failure_reason` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `alert_level` tinyint(4) NULL DEFAULT NULL COMMENT '告警级别 0-提示 1-告警 2-紧急',
  `algorithm_id` bigint(20) NULL DEFAULT NULL COMMENT '算法id',
  `algorithm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法编号',
  `algorithm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法名称',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法版本号',
  `final_diagnosis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最终诊断',
  `diagnosis_confidence` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断置信度',
  `voting_statistics` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投票统计',
  `fault_cause_analysis` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障原因分析',
  `ave_probability_distribution` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '平均概率分布',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`fault_diagnosis_task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '故障诊断任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of phm_fault_diagnosis_task
-- ----------------------------
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986370400899702785, '2025110600001', '故障诊断测试1', '故障诊断测试1', 1986370400899702786, 'B014_0_converted.xlsx', 3161598, 1, 3, NULL, NULL, 1986368745823150082, '202511063', '故障诊断算法', 'v1.0.0', NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-06 17:49:43');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986371059636170753, '2025110600002', '故障诊断测试2', '故障诊断测试2', 1986370400899702786, 'B014_0_converted.xlsx', 3161598, 0, 3, NULL, NULL, 1986368745823150082, '202511063', '故障诊断算法', 'v1.0.0', NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-06 17:52:20');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986371455419084802, '2025110600003', '故障诊断测试3', '故障诊断测试3', 1986370400899702786, 'B014_0_converted.xlsx', 3161598, 0, 3, NULL, NULL, 1986368745823150082, '202511063', '故障诊断算法', 'v1.0.0', NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-06 17:53:55');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986604074558779394, '2025110700001', '故障诊断测试1', '故障诊断测试1', 1986370400899702786, 'B014_0_converted.xlsx', 3161598, 0, 3, NULL, NULL, 1986368745823150082, '202511063', '故障诊断算法', 'v1.0.0', NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-07 09:18:15');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986604859715710977, '2025110700002', '故障诊断检测', NULL, 1986370400899702786, 'B014_0_converted.xlsx', 3161598, 0, 3, NULL, NULL, 1986368745823150082, '202511063', '故障诊断算法', 'v1.0.0', NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-07 09:21:23');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986605726795788290, '2025110700004', '故障诊断检测', NULL, 1986370400899702786, 'B014_0_converted.xlsx', 3161598, 0, 2, NULL, NULL, 1986368745823150082, '202511063', '故障诊断算法', 'v1.0.0', '14mil滚动体故障', NULL, '[{\"faultType\":\"7mil滚动体故障\",\"percentage\":\"5.1%\",\"votes\":\"6\"},{\"faultType\":\"14mil滚动体故障\",\"percentage\":\"94.1%\",\"votes\":\"111\"},{\"faultType\":\"21mil滚动体故障\",\"percentage\":\"0.8%\",\"votes\":\"1\"}]', '滚动体表面出现直径0.014英寸的点蚀或剥落。可能原因：长期过载、润滑剂污染或安装误差。故障特征：明显的周期性冲击，冲击能量较7mil故障更强。', '[{\"faultType\":\"正常状态\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil滚动体故障\",\"probability\":\"0.0468\"},{\"faultType\":\"14mil滚动体故障\",\"probability\":\"0.9240\"},{\"faultType\":\"21mil滚动体故障\",\"probability\":\"0.0283\"},{\"faultType\":\"7mil内圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil内圈故障\",\"probability\":\"0.0003\"},{\"faultType\":\"21mil内圈故障\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil外圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil外圈故障\",\"probability\":\"0.0002\"},{\"faultType\":\"21mil外圈故障\",\"probability\":\"0.0001\"}]', 1981621769337565186, '2025-11-07 09:24:49');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986611976627531777, '2025110700005', '故障诊断检测', NULL, 1986370400899702786, 'B014_0_converted.xlsx', 3161598, 0, 2, NULL, NULL, 1986368745823150082, '202511063', '故障诊断算法', 'v1.0.0', '14mil滚动体故障', '94.07%', '[{\"faultType\":\"7mil滚动体故障\",\"percentage\":\"5.1%\",\"votes\":\"6\"},{\"faultType\":\"14mil滚动体故障\",\"percentage\":\"94.1%\",\"votes\":\"111\"},{\"faultType\":\"21mil滚动体故障\",\"percentage\":\"0.8%\",\"votes\":\"1\"}]', '滚动体表面出现直径0.014英寸的点蚀或剥落。可能原因：长期过载、润滑剂污染或安装误差。故障特征：明显的周期性冲击，冲击能量较7mil故障更强。', '[{\"faultType\":\"正常状态\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil滚动体故障\",\"probability\":\"0.0468\"},{\"faultType\":\"14mil滚动体故障\",\"probability\":\"0.9240\"},{\"faultType\":\"21mil滚动体故障\",\"probability\":\"0.0283\"},{\"faultType\":\"7mil内圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil内圈故障\",\"probability\":\"0.0003\"},{\"faultType\":\"21mil内圈故障\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil外圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil外圈故障\",\"probability\":\"0.0002\"},{\"faultType\":\"21mil外圈故障\",\"probability\":\"0.0001\"}]', 1981621769337565186, '2025-11-07 09:49:39');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986612407831343106, '2025110700006', '故障诊断检测', NULL, 1986370400899702786, 'B014_0_converted.xlsx', 3161598, 0, 2, NULL, NULL, 1986368745823150082, '202511063', '故障诊断算法', 'v1.0.0', '14mil滚动体故障', '94.07%', '[{\"faultType\":\"7mil滚动体故障\",\"percentage\":\"5.1%\",\"votes\":\"6\"},{\"faultType\":\"14mil滚动体故障\",\"percentage\":\"94.1%\",\"votes\":\"111\"},{\"faultType\":\"21mil滚动体故障\",\"percentage\":\"0.8%\",\"votes\":\"1\"}]', '滚动体表面出现直径0.014英寸的点蚀或剥落。可能原因：长期过载、润滑剂污染或安装误差。故障特征：明显的周期性冲击，冲击能量较7mil故障更强。', '[{\"faultType\":\"正常状态\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil滚动体故障\",\"probability\":\"0.0468\"},{\"faultType\":\"14mil滚动体故障\",\"probability\":\"0.9240\"},{\"faultType\":\"21mil滚动体故障\",\"probability\":\"0.0283\"},{\"faultType\":\"7mil内圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil内圈故障\",\"probability\":\"0.0003\"},{\"faultType\":\"21mil内圈故障\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil外圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil外圈故障\",\"probability\":\"0.0002\"},{\"faultType\":\"21mil外圈故障\",\"probability\":\"0.0001\"}]', 1981621769337565186, '2025-11-07 09:51:22');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986613948533420034, '2025110700007', '故障诊断检测', NULL, 1986370400899702786, 'B014_0_converted.xlsx', 3161598, 0, 3, NULL, NULL, 1986368745823150082, '202511063', '故障诊断算法', 'v1.0.0', NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-07 09:57:29');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986614753009311746, '2025110700008', '故障诊断检测', NULL, 1986370400899702786, 'B014_0_converted.xlsx', 3161598, 0, 3, NULL, NULL, 1986368745823150082, '202511063', '故障诊断算法', 'v1.0.0', NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-07 10:00:41');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986614928880672770, '2025110700009', '故障诊断检测', NULL, 1986370400899702786, 'B014_0_converted.xlsx', 3161598, 0, 2, NULL, NULL, 1986368745823150082, '202511063', '故障诊断算法', 'v1.0.0', '14mil滚动体故障', '94.07%', '[{\"faultType\":\"7mil滚动体故障\",\"percentage\":\"5.1%\",\"votes\":\"6\"},{\"faultType\":\"14mil滚动体故障\",\"percentage\":\"94.1%\",\"votes\":\"111\"},{\"faultType\":\"21mil滚动体故障\",\"percentage\":\"0.8%\",\"votes\":\"1\"}]', '滚动体表面出现直径0.014英寸的点蚀或剥落。可能原因：长期过载、润滑剂污染或安装误差。故障特征：明显的周期性冲击，冲击能量较7mil故障更强。', '[{\"faultType\":\"正常状态\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil滚动体故障\",\"probability\":\"0.0468\"},{\"faultType\":\"14mil滚动体故障\",\"probability\":\"0.9240\"},{\"faultType\":\"21mil滚动体故障\",\"probability\":\"0.0283\"},{\"faultType\":\"7mil内圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil内圈故障\",\"probability\":\"0.0003\"},{\"faultType\":\"21mil内圈故障\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil外圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil外圈故障\",\"probability\":\"0.0002\"},{\"faultType\":\"21mil外圈故障\",\"probability\":\"0.0001\"}]', 1981621769337565186, '2025-11-07 10:01:23');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986624494942957569, '2025110700010', '故障诊断检测', NULL, 1986370400899702786, 'B014_0_converted.xlsx', 3161598, 0, 3, NULL, NULL, 1986368745823150082, '202511063', '故障诊断算法', 'v1.0.0', NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-07 10:39:24');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986625706593550337, '2025110700011', '故障诊断检测', NULL, 1986370400899702786, 'B014_0_converted.xlsx', 3161598, 0, 3, NULL, NULL, 1986368745823150082, '202511063', '故障诊断算法', 'v1.0.0', NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-07 10:44:13');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986673630408962049, '2025110700012', '故障检测任务', NULL, 1986673630408962050, 'B014_0_converted.xlsx', 3161598, 1, 3, NULL, NULL, 1986671969963700225, '202511071', '故障诊断2', 'v1.1.0', NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-07 13:54:39');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986674079455342594, '2025110700013', '故障检测任务', NULL, 1986674079455342595, 'B014_0_converted.xlsx', 3161598, 1, 3, NULL, NULL, 1986671969963700225, '202511071', '故障诊断2', 'v1.1.0', NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-07 13:56:26');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986674494108430338, '2025110700014', '故障检测任务', NULL, 1986674494108430339, 'B014_0_converted.xlsx', 3161598, 1, 3, NULL, NULL, 1986671969963700225, '202511071', '故障诊断2', 'v1.1.0', NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-07 13:58:05');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986674792633823234, '2025110700015', '故障检测任务', NULL, 1986674792633823235, 'B014_0_converted.xlsx', 3161598, 1, 2, NULL, NULL, 1986671969963700225, '202511071', '故障诊断2', 'v1.1.0', '14mil滚动体故障', '94.07%', '[{\"faultType\":\"7mil滚动体故障\",\"percentage\":\"5.1%\",\"votes\":\"6\"},{\"faultType\":\"14mil滚动体故障\",\"percentage\":\"94.1%\",\"votes\":\"111\"},{\"faultType\":\"21mil滚动体故障\",\"percentage\":\"0.8%\",\"votes\":\"1\"}]', '滚动体表面出现直径0.014英寸的点蚀或剥落。可能原因：长期过载、润滑剂污染或安装误差。故障特征：明显的周期性冲击，冲击能量较7mil故障更强。', '[{\"faultType\":\"正常状态\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil滚动体故障\",\"probability\":\"0.0468\"},{\"faultType\":\"14mil滚动体故障\",\"probability\":\"0.9240\"},{\"faultType\":\"21mil滚动体故障\",\"probability\":\"0.0283\"},{\"faultType\":\"7mil内圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil内圈故障\",\"probability\":\"0.0003\"},{\"faultType\":\"21mil内圈故障\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil外圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil外圈故障\",\"probability\":\"0.0002\"},{\"faultType\":\"21mil外圈故障\",\"probability\":\"0.0001\"}]', 1981621769337565186, '2025-11-07 13:59:16');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986677908783603713, '2025110700016', '故障检测任务', NULL, 1986677908783603714, 'B014_0_converted.xlsx', 3161598, 1, 2, NULL, NULL, 1986671969963700225, '202511071', '故障诊断2', 'v1.1.0', '14mil滚动体故障', '94.07%', '[{\"faultType\":\"7mil滚动体故障\",\"percentage\":\"5.1%\",\"votes\":\"6\"},{\"faultType\":\"14mil滚动体故障\",\"percentage\":\"94.1%\",\"votes\":\"111\"},{\"faultType\":\"21mil滚动体故障\",\"percentage\":\"0.8%\",\"votes\":\"1\"}]', '滚动体表面出现直径0.014英寸的点蚀或剥落。可能原因：长期过载、润滑剂污染或安装误差。故障特征：明显的周期性冲击，冲击能量较7mil故障更强。', '[{\"faultType\":\"正常状态\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil滚动体故障\",\"probability\":\"0.0468\"},{\"faultType\":\"14mil滚动体故障\",\"probability\":\"0.9240\"},{\"faultType\":\"21mil滚动体故障\",\"probability\":\"0.0283\"},{\"faultType\":\"7mil内圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil内圈故障\",\"probability\":\"0.0003\"},{\"faultType\":\"21mil内圈故障\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil外圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil外圈故障\",\"probability\":\"0.0002\"},{\"faultType\":\"21mil外圈故障\",\"probability\":\"0.0001\"}]', 1981621769337565186, '2025-11-07 14:11:39');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986678946034921474, '2025110700017', '故障检测任务', NULL, 1986678946034921475, 'B014_0_converted.xlsx', 3161598, 1, 2, NULL, NULL, 1986671969963700225, '202511071', '故障诊断2', 'v1.1.0', '14mil滚动体故障', '94.07%', '[{\"faultType\":\"7mil滚动体故障\",\"percentage\":\"5.1%\",\"votes\":\"6\"},{\"faultType\":\"14mil滚动体故障\",\"percentage\":\"94.1%\",\"votes\":\"111\"},{\"faultType\":\"21mil滚动体故障\",\"percentage\":\"0.8%\",\"votes\":\"1\"}]', '滚动体表面出现直径0.014英寸的点蚀或剥落。可能原因：长期过载、润滑剂污染或安装误差。故障特征：明显的周期性冲击，冲击能量较7mil故障更强。', '[{\"faultType\":\"正常状态\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil滚动体故障\",\"probability\":\"0.0468\"},{\"faultType\":\"14mil滚动体故障\",\"probability\":\"0.9240\"},{\"faultType\":\"21mil滚动体故障\",\"probability\":\"0.0283\"},{\"faultType\":\"7mil内圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil内圈故障\",\"probability\":\"0.0003\"},{\"faultType\":\"21mil内圈故障\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil外圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil外圈故障\",\"probability\":\"0.0002\"},{\"faultType\":\"21mil外圈故障\",\"probability\":\"0.0001\"}]', 1981621769337565186, '2025-11-07 14:15:46');
INSERT INTO `phm_fault_diagnosis_task` VALUES (1986679290190188546, '2025110700018', '故障检测任务', NULL, 1986679290232131586, 'B014_0_converted.xlsx', 3161598, 1, 2, NULL, NULL, 1986671969963700225, '202511071', '故障诊断2', 'v1.1.0', '14mil滚动体故障', '94.07%', '[{\"faultType\":\"7mil滚动体故障\",\"percentage\":\"5.1%\",\"votes\":\"6\"},{\"faultType\":\"14mil滚动体故障\",\"percentage\":\"94.1%\",\"votes\":\"111\"},{\"faultType\":\"21mil滚动体故障\",\"percentage\":\"0.8%\",\"votes\":\"1\"}]', '滚动体表面出现直径0.014英寸的点蚀或剥落。可能原因：长期过载、润滑剂污染或安装误差。故障特征：明显的周期性冲击，冲击能量较7mil故障更强。', '[{\"faultType\":\"正常状态\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil滚动体故障\",\"probability\":\"0.0468\"},{\"faultType\":\"14mil滚动体故障\",\"probability\":\"0.9240\"},{\"faultType\":\"21mil滚动体故障\",\"probability\":\"0.0283\"},{\"faultType\":\"7mil内圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil内圈故障\",\"probability\":\"0.0003\"},{\"faultType\":\"21mil内圈故障\",\"probability\":\"0.0001\"},{\"faultType\":\"7mil外圈故障\",\"probability\":\"0.0000\"},{\"faultType\":\"14mil外圈故障\",\"probability\":\"0.0002\"},{\"faultType\":\"21mil外圈故障\",\"probability\":\"0.0001\"}]', 1981621769337565186, '2025-11-07 14:17:08');

-- ----------------------------
-- Table structure for phm_fault_prediction_task
-- ----------------------------
DROP TABLE IF EXISTS `phm_fault_prediction_task`;
CREATE TABLE `phm_fault_prediction_task`  (
  `fault_prediction_task_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '故障预测任务id',
  `fault_prediction_task_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '故障预测任务编码',
  `fault_prediction_task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障预测任务名称',
  `fault_prediction_task_description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障预测任务描述',
  `collect_file_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采集文件id',
  `collect_file_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采集文件信息-采集编码/文件名',
  `collect_file_size` int(11) NULL DEFAULT NULL COMMENT '采集文件大小',
  `data_source` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源 0-采集记录 1-上传文件',
  `task_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '任务状态 0-分析中 1-排队中 2-已完成 3-失败',
  `failure_reason` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `alert_level` tinyint(4) NULL DEFAULT NULL COMMENT '告警级别 0-提示 1-告警 2-紧急',
  `algorithm_id` bigint(20) NULL DEFAULT NULL COMMENT '算法id',
  `algorithm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法编号',
  `algorithm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法名称',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法版本号',
  `predict_fault_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预测故障时间',
  `predict_probability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预测概率',
  `health_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '健康状态',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`fault_prediction_task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1987143858112790530 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '故障预测任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phm_fault_prediction_task
-- ----------------------------
INSERT INTO `phm_fault_prediction_task` VALUES (1986737045013860353, '2025110700002', '故障预测任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 1, 3, NULL, NULL, 1986684819729895427, '202511075', '故障预测', 'v1.0.0', NULL, NULL, NULL, 1981621769337565186, '2025-11-07 18:06:38');
INSERT INTO `phm_fault_prediction_task` VALUES (1987136527585042434, '2025110800002', '故障预测任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 3, NULL, NULL, 1986684819729895427, '202511075', '故障预测', 'v1.0.0', NULL, NULL, NULL, 1981621769337565186, '2025-11-08 20:34:02');
INSERT INTO `phm_fault_prediction_task` VALUES (1987137391536168962, '2025110800003', '故障预测任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 3, NULL, NULL, 1986684819729895427, '202511075', '故障预测', 'v1.0.0', NULL, NULL, NULL, 1981621769337565186, '2025-11-08 20:37:28');
INSERT INTO `phm_fault_prediction_task` VALUES (1987137789122633729, '2025110800004', '故障预测任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 3, NULL, NULL, 1986684819729895427, '202511075', '故障预测', 'v1.0.0', NULL, NULL, NULL, 1981621769337565186, '2025-11-08 20:39:03');
INSERT INTO `phm_fault_prediction_task` VALUES (1987138512845594626, '2025110800005', '故障预测任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895427, '202511075', '故障预测', 'v1.0.0', '1.0', '0.0142', NULL, 1981621769337565186, '2025-11-08 20:41:55');
INSERT INTO `phm_fault_prediction_task` VALUES (1987142487187775489, '2025110800006', '故障预测任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895427, '202511075', '故障预测', 'v1.0.0', '0.59', '0.0142', '严重磨损，建议更换', 1981621769337565186, '2025-11-08 20:57:43');
INSERT INTO `phm_fault_prediction_task` VALUES (1987143858112790529, '2025110800007', '故障预测任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895427, '202511075', '故障预测', 'v1.0.0', '0.59', '0.0142', '严重磨损，建议更换', 1981621769337565186, '2025-11-08 21:03:10');

-- ----------------------------
-- Table structure for phm_flutter_prediction_task
-- ----------------------------
DROP TABLE IF EXISTS `phm_flutter_prediction_task`;
CREATE TABLE `phm_flutter_prediction_task`  (
  `flutter_prediction_task_id` bigint(20) NOT NULL COMMENT '颤振预测任务id',
  `flutter_prediction_task_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颤振预测任务编号',
  `flutter_prediction_task_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颤振预测任务名称',
  `flutter_prediction_task_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颤振预测任务描述',
  `collect_file_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采集文件id',
  `collect_file_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采集文件信息-采集编码/文件名',
  `collect_file_size` int(11) NULL DEFAULT NULL COMMENT '采集文件大小',
  `data_source` tinyint(1) NULL DEFAULT 0 COMMENT '数据来源 0-采集记录 1-上传文件',
  `task_status` tinyint(4) NULL DEFAULT 0 COMMENT '任务状态 0-分析中 1-排队中 2-已完成 3-失败',
  `failure_reason` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `algorithm_id` bigint(20) NULL DEFAULT NULL COMMENT '算法id',
  `algorithm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法编号',
  `algorithm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法名称',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法版本号',
  `processing_block_number` int(11) NULL DEFAULT 0 COMMENT '总处理分块数',
  `stabilize_number` int(11) NULL DEFAULT 0 COMMENT '稳定数',
  `mild_or_moderate_flutter` int(11) NULL DEFAULT 0 COMMENT '轻度或中等颤振数',
  `flutter_number` int(11) NULL DEFAULT 0 COMMENT '颤振数',
  `unknown_number` int(11) NULL DEFAULT 0 COMMENT '未知数',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `task_mode` tinyint(1) NOT NULL DEFAULT 0 COMMENT '任务模式（0=离线模式，1=在线模式）',
  `dir_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件夹路径',
  `file_path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `device_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备id',
  `channel_id` tinyint(4) NULL DEFAULT NULL COMMENT '通道号',
  `current_sample_freq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采样频率',
  PRIMARY KEY (`flutter_prediction_task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '颤振预测任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of phm_flutter_prediction_task
-- ----------------------------
INSERT INTO `phm_flutter_prediction_task` VALUES (1986281152066519042, '2025110600001', '测试离线预测', '测试在线预测', '1985977432548225026', 'test.xlsx', 22554506, 0, 2, NULL, 7, '20251106', '颤振算法-离线', 'v1.0.0', 1426, 724, 487, 132, 83, 1981621769337565186, '2025-11-06 11:55:04', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `phm_flutter_prediction_task` VALUES (1986336709255258114, '2025110600002', '离线颤振测试1', '离线颤振测试1', '1985977432548225026', 'test.xlsx', 22554506, 0, 3, NULL, 7, '20251106', '颤振算法-离线', 'v1.0.0', 0, 0, 0, 0, 0, 1981621769337565186, '2025-11-06 15:35:50', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `phm_flutter_prediction_task` VALUES (1986337307677589506, '2025110600003', '离线预测2', '离线预测2', '1985977432548225026', 'test.xlsx', 22554506, 0, 2, NULL, 7, '20251106', '颤振算法-离线', 'v1.0.0', 1426, 724, 487, 132, 83, 1981621769337565186, '2025-11-06 15:38:13', 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for phm_health_assess_task
-- ----------------------------
DROP TABLE IF EXISTS `phm_health_assess_task`;
CREATE TABLE `phm_health_assess_task`  (
  `health_assess_task_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '健康评估任务id',
  `health_assess_task_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '健康评估任务编码',
  `health_assess_task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '健康评估任务名称',
  `health_assess_task_description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '健康评估任务描述',
  `collect_file_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采集文件id',
  `collect_file_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采集文件信息-采集编码/文件名',
  `collect_file_size` int(11) NULL DEFAULT NULL COMMENT '采集文件大小',
  `data_source` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源 0-采集记录 1-上传文件',
  `task_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '任务状态 0-分析中 1-排队中 2-已完成 3-失败',
  `failure_reason` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `alert_level` tinyint(4) NULL DEFAULT NULL COMMENT '告警级别 0-提示 1-告警 2-紧急',
  `algorithm_id` bigint(20) NULL DEFAULT NULL COMMENT '算法id',
  `algorithm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法编号',
  `algorithm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法名称',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法版本号',
  `health_status_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '健康状态等级',
  `health_status_rating` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '健康状态评分',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`health_assess_task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1987765557770366979 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '健康评估任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phm_health_assess_task
-- ----------------------------
INSERT INTO `phm_health_assess_task` VALUES (1987182013591420929, '2025110800001', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 3, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', NULL, NULL, 1981621769337565186, '2025-11-08 23:34:47');
INSERT INTO `phm_health_assess_task` VALUES (1987349235538382849, '2025110900001', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 3, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', NULL, NULL, 1981621769337565186, '2025-11-09 10:39:16');
INSERT INTO `phm_health_assess_task` VALUES (1987349443802353666, '2025110900002', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 3, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', NULL, NULL, 1981621769337565186, '2025-11-09 10:40:05');
INSERT INTO `phm_health_assess_task` VALUES (1987349744059994114, '2025110900003', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 3, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', NULL, NULL, 1981621769337565186, '2025-11-09 10:41:17');
INSERT INTO `phm_health_assess_task` VALUES (1987350178208223233, '2025110900004', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', '故障', '1.42', 1981621769337565186, '2025-11-09 10:43:00');
INSERT INTO `phm_health_assess_task` VALUES (1987370876410597377, '2025110900005', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', '故障', '1.42', 1981621769337565186, '2025-11-09 12:05:15');
INSERT INTO `phm_health_assess_task` VALUES (1987372082323357697, '2025110900006', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', '故障', '1.42', 1981621769337565186, '2025-11-09 12:10:03');
INSERT INTO `phm_health_assess_task` VALUES (1987372175420129282, '2025110900007', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', '故障', '1.42', 1981621769337565186, '2025-11-09 12:10:25');
INSERT INTO `phm_health_assess_task` VALUES (1987374012596572161, '2025110900008', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', '故障', '1.42', 1981621769337565186, '2025-11-09 12:17:43');
INSERT INTO `phm_health_assess_task` VALUES (1987374207375855617, '2025110900009', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', '故障', '1.42', 1981621769337565186, '2025-11-09 12:18:29');
INSERT INTO `phm_health_assess_task` VALUES (1987376176131825665, '2025110900010', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', '故障', '1.42', 1981621769337565186, '2025-11-09 12:26:19');
INSERT INTO `phm_health_assess_task` VALUES (1987377074019065857, '2025110900011', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', '故障', '1.42', 1981621769337565186, '2025-11-09 12:29:53');
INSERT INTO `phm_health_assess_task` VALUES (1987377322418253825, '2025110900012', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', '故障', '1.42', 1981621769337565186, '2025-11-09 12:30:52');
INSERT INTO `phm_health_assess_task` VALUES (1987759822927884290, '2025111000001', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 3, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', NULL, NULL, 1981621769337565186, '2025-11-10 13:50:47');
INSERT INTO `phm_health_assess_task` VALUES (1987761921208152065, '2025111000002', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 3, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', NULL, NULL, 1981621769337565186, '2025-11-10 13:59:08');
INSERT INTO `phm_health_assess_task` VALUES (1987762005790486529, '2025111000003', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', '故障', '1.42', 1981621769337565186, '2025-11-10 13:59:28');
INSERT INTO `phm_health_assess_task` VALUES (1987765557770366978, '2025111000004', '健康状态评估任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, 2, 1986684819729895429, '202511082', '健康状态评估', 'v1.0.0', '故障', '1.42', 1981621769337565186, '2025-11-10 14:13:35');

-- ----------------------------
-- Table structure for phm_load_prediction_task
-- ----------------------------
DROP TABLE IF EXISTS `phm_load_prediction_task`;
CREATE TABLE `phm_load_prediction_task`  (
  `load_prediction_task_id` bigint(20) NOT NULL COMMENT '机床加工载荷转化和预测任务id',
  `load_prediction_task_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机床加工载荷转化和预测任务编号',
  `load_prediction_task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机床加工载荷转化和预测任务名称',
  `load_prediction_task_description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机床加工载荷转化和预测任务详情',
  `algorithm_id` bigint(20) NULL DEFAULT NULL COMMENT '算法id',
  `algorithm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法编号',
  `algorithm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法名称',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法版本号',
  `task_status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态 0-分析中 1-排队中 2-已完成 3-失败',
  `failure_reason` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `operating_condition_type` tinyint(4) NULL DEFAULT NULL COMMENT '工况类型',
  `cutting_depth` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '切削深度',
  `feed_rate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '进给量',
  `workpiece_material` tinyint(4) NULL DEFAULT NULL COMMENT '加工材料 0-铸铁 1-钢材',
  `cutting_intensity` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '切削强度',
  `comprehensive_current_strength` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电流综合强',
  `direct_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直流电流',
  `alternating_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交流电流',
  `direct_current_interaction` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直流电流交互',
  `square_of_feed_rate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '进给量平方',
  `torque_mae` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扭矩MAE',
  `torque_rmse` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扭矩RMSE',
  `torque_r_square` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扭矩r平方',
  `torque_mape` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扭矩MAPE',
  `radial_force_mae` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '径向力MAE',
  `radial_force_rmse` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '径向力RMSE',
  `radial_force_r_square` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '径向力R平方',
  `radial_force_mape` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '径向力MAPE',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`load_prediction_task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '机床加工载荷转化和预测任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of phm_load_prediction_task
-- ----------------------------
INSERT INTO `phm_load_prediction_task` VALUES (1986326719043915778, '2025110600001', '载荷预测任务测试', '载荷预测任务测试', 1, '202511062', '载荷预测算法', 'v1.0.0', 3, NULL, 1, '10.00', '11.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2025-11-06 14:56:09');
INSERT INTO `phm_load_prediction_task` VALUES (1986327514393018370, '2025110600002', '载荷预测任务测试', '载荷预测任务测试', 1, '202511062', '载荷预测算法', 'v1.0.0', 2, NULL, 2, '1.00', '1.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, '6906.11', NULL, NULL, NULL, '626.18', NULL, NULL, NULL, 3, '2025-11-06 14:59:18');

-- ----------------------------
-- Table structure for phm_maintenance_optimization_task
-- ----------------------------
DROP TABLE IF EXISTS `phm_maintenance_optimization_task`;
CREATE TABLE `phm_maintenance_optimization_task`  (
  `maintenance_optimization_task_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '维修优化任务id',
  `maintenance_optimization_task_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '维修优化任务编码',
  `maintenance_optimization_task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维修优化任务名称',
  `maintenance_optimization_task_description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维修优化任务描述',
  `collect_file_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采集文件id',
  `collect_file_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采集文件信息-采集编码/文件名',
  `collect_file_size` int(11) NULL DEFAULT NULL COMMENT '采集文件大小',
  `data_source` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源 0-采集记录 1-上传文件',
  `task_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '任务状态 0-分析中 1-排队中 2-已完成 3-失败',
  `failure_reason` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `alert_level` tinyint(4) NULL DEFAULT NULL COMMENT '告警级别 0-提示 1-告警 2-紧急',
  `algorithm_id` bigint(20) NULL DEFAULT NULL COMMENT '算法id',
  `algorithm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法编号',
  `algorithm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法名称',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法版本号',
  `final_diagnosis` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最终诊断',
  `diagnosis_confidence` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断置信度',
  `maintenance_strategy_recommendations` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维护策略和建议',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`maintenance_optimization_task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1987433859358666755 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '维修优化任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of phm_maintenance_optimization_task
-- ----------------------------
INSERT INTO `phm_maintenance_optimization_task` VALUES (1986712484981567490, '2025110700001', '维修优化任务', NULL, '1986690548226408450', '轻度_6000.xlsx', 151862443, 0, 3, NULL, NULL, 1986684819729895426, '202511074', '维修优化', 'v1.0.0', NULL, NULL, NULL, 1981621769337565186, '2025-11-07 16:29:02');
INSERT INTO `phm_maintenance_optimization_task` VALUES (1986744490830458881, '2025110700003', '维修优化任务', NULL, '1986744490830458882', 'B021_2.xlsx', 3173374, 1, 3, NULL, NULL, 1986684819729895426, '202511074', '维修优化', 'v1.0.0', NULL, NULL, NULL, 1981621769337565186, '2025-11-07 18:36:13');
INSERT INTO `phm_maintenance_optimization_task` VALUES (1986745654863065089, '2025110700004', '维修优化任务', NULL, '1986745654863065090', 'B021_2.xlsx', 3173374, 1, 3, NULL, NULL, 1986684819729895426, '202511074', '维修优化', 'v1.0.0', NULL, NULL, NULL, 1981621769337565186, '2025-11-07 18:40:51');
INSERT INTO `phm_maintenance_optimization_task` VALUES (1986745732264751105, '2025110700005', '维修优化任务', NULL, '1986745732264751106', 'B021_2.xlsx', 3173374, 1, 3, NULL, NULL, 1986684819729895426, '202511074', '维修优化', 'v1.0.0', NULL, NULL, NULL, 1981621769337565186, '2025-11-07 18:41:09');
INSERT INTO `phm_maintenance_optimization_task` VALUES (1986746005502685186, '2025110700006', '维修优化任务', NULL, '1986746005502685187', 'B021_2.xlsx', 3173374, 1, 3, NULL, NULL, 1986684819729895426, '202511074', '维修优化', 'v1.0.0', NULL, NULL, NULL, 1981621769337565186, '2025-11-07 18:42:14');
INSERT INTO `phm_maintenance_optimization_task` VALUES (1986746177448177665, '2025110700007', '维修优化任务', NULL, '1986746177448177666', 'B021_2.xlsx', 3173374, 1, 2, NULL, NULL, 1986684819729895426, '202511074', '维修优化', 'v1.0.0', '7mil内圈故障', '47.06%', '{}', 1981621769337565186, '2025-11-07 18:42:55');
INSERT INTO `phm_maintenance_optimization_task` VALUES (1986747362594910210, '2025110700008', '维修优化任务', NULL, '1986747362594910211', 'B021_2.xlsx', 3173374, 1, 2, NULL, NULL, 1986684819729895426, '202511074', '维修优化', 'v1.0.0', '7mil内圈故障', '47.06%', '{}', 1981621769337565186, '2025-11-07 18:47:38');
INSERT INTO `phm_maintenance_optimization_task` VALUES (1986747971213516802, '2025110700009', '维修优化任务', NULL, '1986747971213516803', 'B021_2.xlsx', 3173374, 1, 2, NULL, NULL, 1986684819729895426, '202511074', '维修优化', 'v1.0.0', '7mil内圈故障', '47.06%', '{}', 1981621769337565186, '2025-11-07 18:50:03');
INSERT INTO `phm_maintenance_optimization_task` VALUES (1986749219853660162, '2025110700010', '维修优化任务', NULL, '1986749219883020289', 'B021_2.xlsx', 3173374, 1, 2, NULL, NULL, 1986684819729895426, '202511074', '维修优化', 'v1.0.0', '7mil内圈故障', '47.06%', '{}', 1981621769337565186, '2025-11-07 18:55:01');
INSERT INTO `phm_maintenance_optimization_task` VALUES (1987081050595581954, '2025110800001', '维修优化任务', NULL, '1987081050683662338', 'B021_2.xlsx', 3173374, 1, 2, NULL, NULL, 1986684819729895426, '202511074', '维修优化', 'v1.0.0', '7mil内圈故障', '47.06%', '紧急程度: 中\n维修策略: 针对性维修 + 改善措施\n立即执行: 检查轴配合状态、评估润滑条件、监测温度变化\n短期计划: 调整轴承预紧、改善润滑方式、检查安装精度\n长期计划: 更换轴承内圈、修复轴颈磨损、优化运行参数\n预计停机: 6-8小时\n所需工具: 内圈拉马、加热设备、测量工具\n注意事项: 注意安装时的过盈配合要求', 1981621769337565186, '2025-11-08 16:53:35');
INSERT INTO `phm_maintenance_optimization_task` VALUES (1987433859358666754, '2025110900002', '维修优化任务', NULL, '1987433859358666755', 'B021_2.xlsx', 3173374, 1, 2, NULL, NULL, 1986684819729895426, '202511074', '维修优化', 'v1.0.0', '7mil内圈故障', '47.06%', '紧急程度: 中\n维修策略: 针对性维修 + 改善措施\n立即执行: 检查轴配合状态、评估润滑条件、监测温度变化\n短期计划: 调整轴承预紧、改善润滑方式、检查安装精度\n长期计划: 更换轴承内圈、修复轴颈磨损、优化运行参数\n预计停机: 6-8小时\n所需工具: 内圈拉马、加热设备、测量工具\n注意事项: 注意安装时的过盈配合要求', 1981621769337565186, '2025-11-09 16:15:31');

-- ----------------------------
-- Table structure for phm_remain_life_prediction_task
-- ----------------------------
DROP TABLE IF EXISTS `phm_remain_life_prediction_task`;
CREATE TABLE `phm_remain_life_prediction_task`  (
  `remain_life_prediction_task_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '剩余寿命预测任务id',
  `remain_life_prediction_task_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '剩余寿命预测任务编码',
  `remain_life_prediction_task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '剩余寿命预测任务名称',
  `remain_life_prediction_task_description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '剩余寿命预测任务描述',
  `collect_file_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采集文件id',
  `collect_file_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采集文件信息-采集编码/文件名',
  `collect_file_size` int(11) NULL DEFAULT NULL COMMENT '采集文件大小',
  `data_source` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源 0-采集记录 1-上传文件',
  `task_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '任务状态 0-分析中 1-排队中 2-已完成 3-失败',
  `failure_reason` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `alert_level` tinyint(4) NULL DEFAULT NULL COMMENT '告警级别 0-提示 1-告警 2-紧急',
  `algorithm_id` bigint(20) NULL DEFAULT NULL COMMENT '算法id',
  `algorithm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法编号',
  `algorithm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法名称',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法版本号',
  `remain_use_life_prediction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '剩余使用寿命预测',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`remain_life_prediction_task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1987431253739581443 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '剩余寿命预测任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of phm_remain_life_prediction_task
-- ----------------------------
INSERT INTO `phm_remain_life_prediction_task` VALUES (1987152562115682306, '2025110800008', '剩余寿命预测任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 3, NULL, NULL, 1986684819729895428, '202511081', '剩余寿命预测', 'v1.0.0', NULL, 1981621769337565186, '2025-11-08 21:37:45');
INSERT INTO `phm_remain_life_prediction_task` VALUES (1987153545357008897, '2025110800009', '剩余寿命预测任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 3, NULL, NULL, 1986684819729895428, '202511081', '剩余寿命预测', 'v1.0.0', NULL, 1981621769337565186, '2025-11-08 21:41:39');
INSERT INTO `phm_remain_life_prediction_task` VALUES (1987154277330165762, '2025110800010', '剩余寿命预测任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 3, NULL, NULL, 1986684819729895428, '202511081', '剩余寿命预测', 'v1.0.0', NULL, 1981621769337565186, '2025-11-08 21:44:34');
INSERT INTO `phm_remain_life_prediction_task` VALUES (1987154672433614850, '2025110800011', '剩余寿命预测任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895428, '202511081', '剩余寿命预测', 'v1.0.0', '97.86%', 1981621769337565186, '2025-11-08 21:46:08');
INSERT INTO `phm_remain_life_prediction_task` VALUES (1987154759272484865, '2025110800012', '剩余寿命预测任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895428, '202511081', '剩余寿命预测', 'v1.0.0', '97.86%', 1981621769337565186, '2025-11-08 21:46:29');
INSERT INTO `phm_remain_life_prediction_task` VALUES (1987431253739581442, '2025110900001', '剩余寿命预测任务', NULL, '1986737045026443265', '1.xlsx', 1038173, 0, 2, NULL, NULL, 1986684819729895428, '202511081', '剩余寿命预测', 'v1.0.0', '97.86%', 1981621769337565186, '2025-11-09 16:05:10');

-- ----------------------------
-- Table structure for phm_sample_passage
-- ----------------------------
DROP TABLE IF EXISTS `phm_sample_passage`;
CREATE TABLE `phm_sample_passage`  (
  `sample_passage_id` bigint(20) NOT NULL COMMENT '采样通道id',
  `sample_id` bigint(20) NULL DEFAULT NULL COMMENT '关联采样id',
  `passage_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道号',
  `whether_online` tinyint(1) NULL DEFAULT 0 COMMENT '是否在线 0-是 1-否',
  `group_number` int(11) NULL DEFAULT 0 COMMENT '分组号',
  `passage_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道名',
  `user_logo` tinyint(1) NOT NULL DEFAULT 0 COMMENT '通道使用标志',
  `usage_description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道使用描述',
  `passage_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '通道类型',
  `measure_meterage` tinyint(4) NOT NULL DEFAULT 0 COMMENT '测量量',
  `strain_bridge_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '应变桥路方式',
  `bridge_voltage` tinyint(4) NOT NULL DEFAULT 0 COMMENT '桥压',
  `measure_type` tinyint(8) NULL DEFAULT 0 COMMENT '通道测量类型',
  `full_scale_range` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '全量程',
  `transducer_sensitivity` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '传感器敏感度',
  `engineering_unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工程单位',
  `integral_type` tinyint(8) NULL DEFAULT 0 COMMENT '积分类型',
  `upper_limit_frequency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上限频率',
  `lower_limit_frequency` tinyint(8) NULL DEFAULT 0 COMMENT '下线频率',
  `input_mode` tinyint(8) NULL DEFAULT 0 COMMENT '输入方式',
  `compensation_channel` tinyint(4) NOT NULL DEFAULT 0 COMMENT '补偿通道',
  `material_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '材料类型',
  `sensor_bridge_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '传感器桥路方式',
  `sensitivity_correction` tinyint(4) NOT NULL DEFAULT 0 COMMENT '灵敏度修正',
  `thermocouple_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '热电偶类型',
  `cold_end_temperature` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冷端温度',
  `direction_exchange` tinyint(1) NOT NULL DEFAULT 0 COMMENT '方向交换',
  `signal_mode` tinyint(4) NOT NULL DEFAULT 0 COMMENT '信号方式',
  `frequency_doubling_method` tinyint(4) NOT NULL DEFAULT 0 COMMENT '倍频方式',
  `reset_mode` tinyint(4) NOT NULL DEFAULT 0 COMMENT '复位方式',
  `position_counter_threshold` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '位置计数器阈值',
  `speed_timing_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '速度定时时间',
  `key_phase_channel` tinyint(4) NOT NULL DEFAULT 0 COMMENT '键相通道',
  `pulse_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '脉冲数',
  `turn_ratio` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转数比',
  `dividing_ratio` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分频比',
  `anti_mixing_filter` tinyint(1) NULL DEFAULT 0 COMMENT '抗混滤波器 0-ON 1-OFF',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`sample_passage_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采样通道信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phm_sample_passage
-- ----------------------------

-- ----------------------------
-- Table structure for phm_sample_record
-- ----------------------------
DROP TABLE IF EXISTS `phm_sample_record`;
CREATE TABLE `phm_sample_record`  (
  `sample_id` bigint(20) NOT NULL COMMENT '采样id',
  `sample_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '采样编号',
  `device_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联设备id',
  `sample_start_time` datetime NOT NULL COMMENT '采样开始时间',
  `sample_end_time` datetime NULL DEFAULT NULL COMMENT '采样结束时间',
  `sample_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '采样状态 0-采样中 1-已结束 2-已暂停',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `file_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '文件状态 0-未生成 1-生成中 2-已生成',
  `source_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '源文件路径',
  `target_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目标文件路径',
  `current_sample_freq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采样频率',
  `create_id` bigint(20) NOT NULL COMMENT '创建人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`sample_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采样记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phm_sample_record
-- ----------------------------
INSERT INTO `phm_sample_record` VALUES (1979830845112115201, '2025101900002', '0', '2025-10-19 16:43:52', NULL, 2, NULL, 0, NULL, NULL, NULL, 3, '2025-10-19 16:44:05');
INSERT INTO `phm_sample_record` VALUES (1979832409604333569, '2025101900003', '0', '2025-10-19 16:50:04', NULL, 2, NULL, 0, NULL, NULL, NULL, 3, '2025-10-19 16:50:18');
INSERT INTO `phm_sample_record` VALUES (1979834674645856257, '2025101900004', '0', '2025-10-19 16:59:04', NULL, 2, NULL, 0, NULL, NULL, NULL, 3, '2025-10-19 16:59:18');
INSERT INTO `phm_sample_record` VALUES (1979840146438406146, '2025101900005', '0', '2025-10-19 17:20:48', NULL, 2, NULL, 0, NULL, NULL, NULL, 3, '2025-10-19 17:21:03');
INSERT INTO `phm_sample_record` VALUES (1979840395563286530, '2025101900006', '0', '2025-10-19 17:21:49', NULL, 2, NULL, 0, NULL, NULL, NULL, 3, '2025-10-19 17:22:02');
INSERT INTO `phm_sample_record` VALUES (1979841984797655042, '2025101900007', '0', '2025-10-19 17:28:08', NULL, 2, NULL, 0, NULL, NULL, NULL, 3, '2025-10-19 17:28:21');

-- ----------------------------
-- Table structure for phm_spindle_simulation_parameter
-- ----------------------------
DROP TABLE IF EXISTS `phm_spindle_simulation_parameter`;
CREATE TABLE `phm_spindle_simulation_parameter`  (
  `spindle_simulation_parameter_id` bigint(20) NOT NULL COMMENT '主轴仿真参数id',
  `spindle_simulation_task_id` bigint(20) NOT NULL COMMENT '主轴仿真任务id',
  `parameter_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '参数类型 0-健康状态 1-亚健康状态 2-故障状态',
  `stiffness_ks` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '刚度ks',
  `stiffness_kx` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '刚度kx',
  `damping_ks` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阻尼ks',
  `damping_kx` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阻尼kx',
  PRIMARY KEY (`spindle_simulation_parameter_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主轴仿真参数表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of phm_spindle_simulation_parameter
-- ----------------------------
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981567083146326017, 1981567082978553857, 0, '3', '1', '4', '2');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981567083146326018, 1981567082978553857, 1, '1', '3', '4', '2');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981567083146326019, 1981567082978553857, 2, '4', '2', '1', '3');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981567083146326020, 1981567082978553857, 3, '2', '4', '1', '3');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981623619809964034, 1981623619747049474, 0, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981623619809964035, 1981623619747049474, 1, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981623619809964036, 1981623619747049474, 2, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981623619809964037, 1981623619747049474, 3, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981625126680662018, 1981625126617747457, 0, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981625126680662019, 1981625126617747457, 1, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981625126680662020, 1981625126617747457, 2, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981625126680662021, 1981625126617747457, 3, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981627673835393025, 1981627673684398081, 0, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981627673835393026, 1981627673684398081, 1, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981627673835393027, 1981627673684398081, 2, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981627673835393028, 1981627673684398081, 3, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981628614508728322, 1981628614445813762, 0, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981628614508728323, 1981628614445813762, 1, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981628614508728324, 1981628614445813762, 2, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981628614508728325, 1981628614445813762, 3, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981628897829715969, 1981628897573863426, 0, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981628897829715970, 1981628897573863426, 1, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981628897829715971, 1981628897573863426, 2, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981628897829715972, 1981628897573863426, 3, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981632627778244609, 1981632627564335105, 0, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981632627778244610, 1981632627564335105, 1, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981632627778244611, 1981632627564335105, 2, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1981632627778244612, 1981632627564335105, 3, '11', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982724150477422594, 1982724150259318785, 0, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982724150477422595, 1982724150259318785, 1, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982724150477422596, 1982724150259318785, 2, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982724150477422597, 1982724150259318785, 3, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982725522383859714, 1982725522148978689, 0, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982725522383859715, 1982725522148978689, 1, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982725522383859716, 1982725522148978689, 2, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982725522383859717, 1982725522148978689, 3, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982733088526594049, 1982733088463679490, 0, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982733088526594050, 1982733088463679490, 1, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982733088526594051, 1982733088463679490, 2, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982733088526594052, 1982733088463679490, 3, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982750418803601409, 1982750418598080513, 0, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982750418803601410, 1982750418598080513, 1, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982750418803601411, 1982750418598080513, 2, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982750418803601412, 1982750418598080513, 3, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982975453982867458, 1982975453785735170, 0, '3', '1', '1', '2');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982975453982867459, 1982975453785735170, 1, '2', '3', '3', '1');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982975453982867460, 1982975453785735170, 2, '1', '4', '3', '2');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982975453982867461, 1982975453785735170, 3, '4', '2', '5', '3');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982975916513935362, 1982975916513935361, 0, '1', '2', '2', '1');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982975916513935363, 1982975916513935361, 1, '5', '3', '2', '4');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982975916513935364, 1982975916513935361, 2, '1', '3', '3', '2');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1982975916513935365, 1982975916513935361, 3, '2', '3', '5', '4');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1984087589283106818, 1984087588809150465, 0, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1984087589283106819, 1984087588809150465, 1, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1984087589283106820, 1984087588809150465, 2, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1984087589283106821, 1984087588809150465, 3, '10', '0.5', '0.5', '0.5');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1988642048163110913, 1988642048104390657, 0, '1', '1', '1', '1');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1988642048163110914, 1988642048104390657, 1, '2', '2', '2', '2');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1988642048163110915, 1988642048104390657, 2, '3', '3', '3', '3');
INSERT INTO `phm_spindle_simulation_parameter` VALUES (1988642048163110916, 1988642048104390657, 3, '4', '4', '4', '4');

-- ----------------------------
-- Table structure for phm_spindle_simulation_task
-- ----------------------------
DROP TABLE IF EXISTS `phm_spindle_simulation_task`;
CREATE TABLE `phm_spindle_simulation_task`  (
  `spindle_simulation_task_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '故障检测任务id',
  `spindle_simulation_task_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '故障检测任务编码',
  `spindle_simulation_task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障检测任务名称',
  `spindle_simulation_task_description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障检测任务描述',
  `task_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '任务状态 0-分析中 1-排队中 2-已完成 3-失败',
  `failure_reason` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `an_sys_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ansys文件路径',
  `an_sys_command_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ansys命令文件路径',
  `modal_results` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模态计算结果',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`spindle_simulation_task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1988642048104390658 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主轴仿真任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of phm_spindle_simulation_task
-- ----------------------------
INSERT INTO `phm_spindle_simulation_task` VALUES (1988642048104390657, '2025111300005', 'ddd', NULL, 2, NULL, '/ansysFile/1BSdBV0B2POH6h/1hSZfbN6N573ZsFRM7ZjKPvL3X', '/ansysFile/1BSdBV0B2POH6h/1hSZfbN6N573ZsFRM7ZjKPvL3X/1LPNXt5fPoVWZuqtoz.ans', '[0,1642,3012,4718,5041,7380,8086,9401,12774,14217,14987,15241,16310,19161,20418,21093,21784,22380,25903,27849,28865]', 1981621769337565186, '2025-11-13 00:16:26');

-- ----------------------------
-- Table structure for phm_surface_prediction_task
-- ----------------------------
DROP TABLE IF EXISTS `phm_surface_prediction_task`;
CREATE TABLE `phm_surface_prediction_task`  (
  `surface_prediction_task_id` bigint(20) NOT NULL COMMENT '关键结合面预测任务id',
  `surface_prediction_task_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键结合面预测任务编号',
  `surface_prediction_task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键结合面预测任务名称',
  `surface_prediction_task_description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键结合面预测任务详情',
  `algorithm_id` bigint(20) NULL DEFAULT NULL COMMENT '算法id',
  `algorithm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法编号',
  `algorithm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法名称',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '算法版本号',
  `task_status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态 0-分析中 1-排队中 2-已完成 3-失败',
  `failure_reason` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `z_axis_force_signal_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'z维力信号文件名称',
  `z_axis_force_signal_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'z维力信号文件路径',
  `z_axis_force_signal_sampling_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'z维力信号采集点',
  `z_axis_vibration_signal_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'z维振动信号文件名称',
  `z_axis_vibration_signal_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'z维振动信号文件路径',
  `z_axis_vibration_signal_sampling_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'z维振动信号采集点',
  `ae_rms_signal_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'AE-RMS信号文件名称',
  `ae_rms_signal_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'AE-RMS信号文件路径',
  `ae_rms_signal_sampling_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'AE-RMS信号采集点',
  `window_size` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '窗口大小',
  `step_length` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '步长',
  `confirm_sampling_point` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认采样点',
  `predicted_relative_stiffness_value` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相对刚度预测值',
  `r_squared_coefficient_determination` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'R²决定系数',
  `mape_mean_absolute_percentage_error` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MAPE平均百分比误差',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `kx_f1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主轴 - 刀柄界面 X 方向刚度（N/m）',
  `ks_f1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主轴 - 刀柄界面转动刚度（N/m）',
  `cx_f1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主轴 - 刀柄界面 X 方向阻尼（N・s/m）',
  `cs_f1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主轴 - 刀柄界面转动阻尼（N・s/m）',
  `stiffness_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '刚度退化等级（0=健康，1=退化，2=严重退化）',
  `level_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '等级描述',
  `confidence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预测置信度（0~1）',
  PRIMARY KEY (`surface_prediction_task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关键结合面预测任务信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of phm_surface_prediction_task
-- ----------------------------
INSERT INTO `phm_surface_prediction_task` VALUES (1987467739843313665, '2025110900003', '退化预测任务', NULL, NULL, NULL, NULL, NULL, 3, NULL, '0nux.csv', '/surfaceFile/2025-11/afedebd2d61b2359798ddec1a84903e7.csv', '4000', '0nuy.csv', '/surfaceFile/2025-11/7f7a123ee752173d63d78390b96d2a77.csv', '4000', '0nuz.csv', '/surfaceFile/2025-11/bdbc57038e2394df29f7ea0ba68b1b30.csv', '4000', NULL, NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-09 18:30:09', '10', '10', '10', '10', NULL, NULL, NULL);
INSERT INTO `phm_surface_prediction_task` VALUES (1987470214465953793, '2025110900004', '退化预测任务', NULL, 3, '202511062', '退化预测算法', 'v1.0.0', 3, NULL, '0nux.csv', '/surfaceFile/2025-11/afedebd2d61b2359798ddec1a84903e7.csv', '4000', '0nuy.csv', '/surfaceFile/2025-11/7f7a123ee752173d63d78390b96d2a77.csv', '4000', '0nuz.csv', '/surfaceFile/2025-11/bdbc57038e2394df29f7ea0ba68b1b30.csv', '4000', NULL, NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-09 18:39:59', '10', '10', '10', '10', NULL, NULL, NULL);
INSERT INTO `phm_surface_prediction_task` VALUES (1987470448415842305, '2025110900005', '退化预测任务', NULL, 3, '202511062', '退化预测算法', 'v1.0.0', 2, NULL, '0nux.csv', '/surfaceFile/2025-11/afedebd2d61b2359798ddec1a84903e7.csv', '4000', '0nuy.csv', '/surfaceFile/2025-11/7f7a123ee752173d63d78390b96d2a77.csv', '4000', '0nuz.csv', '/surfaceFile/2025-11/bdbc57038e2394df29f7ea0ba68b1b30.csv', '4000', NULL, NULL, NULL, NULL, NULL, NULL, 1981621769337565186, '2025-11-09 18:40:55', '10', '10', '10', '10', '2', 'Severely（严重退化）', '1.0');

-- ----------------------------
-- Table structure for phm_time_step
-- ----------------------------
DROP TABLE IF EXISTS `phm_time_step`;
CREATE TABLE `phm_time_step`  (
  `time_step_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '时间步id',
  `load_prediction_task_id` bigint(20) NULL DEFAULT NULL COMMENT '机床加工载荷转化和预测任务id',
  `dc_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直流电流',
  `ac_current` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交流电流',
  PRIMARY KEY (`time_step_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1986327514472710150 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '时间步信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of phm_time_step
-- ----------------------------
INSERT INTO `phm_time_step` VALUES (1986326719144579073, 1986326719043915778, '1.00', '2.00');
INSERT INTO `phm_time_step` VALUES (1986326719144579074, 1986326719043915778, '2.00', '2.00');
INSERT INTO `phm_time_step` VALUES (1986326719144579075, 1986326719043915778, '3.00', '3.00');
INSERT INTO `phm_time_step` VALUES (1986326719144579076, 1986326719043915778, '4.00', '5.00');
INSERT INTO `phm_time_step` VALUES (1986326719144579077, 1986326719043915778, '5.00', '5.00');
INSERT INTO `phm_time_step` VALUES (1986327514472710145, 1986327514393018370, '1.00', '1.00');
INSERT INTO `phm_time_step` VALUES (1986327514472710146, 1986327514393018370, '2.00', '2.00');
INSERT INTO `phm_time_step` VALUES (1986327514472710147, 1986327514393018370, '3.00', '3.00');
INSERT INTO `phm_time_step` VALUES (1986327514472710148, 1986327514393018370, '4.00', '4.00');
INSERT INTO `phm_time_step` VALUES (1986327514472710149, 1986327514393018370, '5.00', '5.00');

-- ----------------------------
-- Table structure for tb_account
-- ----------------------------
DROP TABLE IF EXISTS `tb_account`;
CREATE TABLE `tb_account`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `gesture_password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '手势密码',
  `finger_password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '指纹密码',
  `nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `def_type` tinyint(1) NULL DEFAULT NULL COMMENT '默认用户类型',
  `def_tenant` bigint(20) NULL DEFAULT NULL COMMENT '默认租户',
  `openid` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招行小程序openid',
  `ctime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `mtime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modifier_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除状态0.可用1.删除',
  `modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `def_student` bigint(20) NULL DEFAULT NULL COMMENT '默认子女ID',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像路径',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帐号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_account
-- ----------------------------
INSERT INTO `tb_account` VALUES (3, 'maintain', '{bcrypt}$2a$10$FDau4qk/UXI/lSD2Ax5QgON56adrRBhNJd7thpO3HYcVd5hUhP7nq', NULL, NULL, 'maintain', '15259737881', 3, 0, 'oFw2V6zuf1uMVQS9JYQmdPNlgpPk', '2018-08-14 10:57:37', NULL, NULL, '2024-02-03 16:31:51', NULL, 0, NULL, NULL, NULL);
INSERT INTO `tb_account` VALUES (4, 'wfs', '{bcrypt}$2a$10$FDau4qk/UXI/lSD2Ax5QgON56adrRBhNJd7thpO3HYcVd5hUhP7nq', NULL, NULL, 'wfs', '15259737881', 3, 0, 'oFw2V6zuf1uMVQS9JYQmdPNlgpPk', '2018-08-14 10:57:37', NULL, NULL, '2024-02-03 16:31:51', NULL, 0, NULL, NULL, NULL);
INSERT INTO `tb_account` VALUES (1981619674500788226, 'Ab', '{bcrypt}$2a$10$WWVS7y1OOnIQZ3HMCntxkOn7XPxKFf/8wAY5yyNgTLsKCtbKj4bcG', NULL, NULL, '321', '15446546546', 3, 0, NULL, '2025-10-24 15:12:02', 3, 'maintain', '2025-10-24 15:12:02', NULL, 0, NULL, NULL, NULL);
INSERT INTO `tb_account` VALUES (1981621769337565185, 'wangfs', '{bcrypt}$2a$10$YuYDRWGEmWfiXeSfZovDeuAUTcpP8sQ7oL9Y7JVNo0lSabTpD31Nq', NULL, NULL, 'wfs1', '14343434343', 3, 0, NULL, '2025-10-24 15:20:21', 3, 'maintain', '2025-11-04 14:26:09', NULL, 0, NULL, NULL, NULL);
INSERT INTO `tb_account` VALUES (1981622068357885953, 'hht', '{bcrypt}$2a$10$Qq6PeOXeto2iCH1oWt9P5u1XdK537/Hi7GGGfROzNBLSfSRJbh9w2', NULL, NULL, 'hht', '17859675343', 3, 0, NULL, '2025-10-24 15:21:33', 3, 'maintain', '2025-10-24 15:21:33', NULL, 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_data_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `tb_data_dictionary`;
CREATE TABLE `tb_data_dictionary`  (
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fk_category_id` bigint(30) NULL DEFAULT NULL,
  `id` bigint(30) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_data_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for tb_dictionary_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_dictionary_category`;
CREATE TABLE `tb_dictionary_category`  (
  `code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` bigint(30) NOT NULL AUTO_INCREMENT,
  `remove_able` tinyint(1) NULL DEFAULT NULL,
  `edit_able` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_dictionary_category
-- ----------------------------

-- ----------------------------
-- Table structure for tb_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_group`;
CREATE TABLE `tb_group`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `unit_id` bigint(20) NULL DEFAULT NULL COMMENT '组织机构id',
  `data_scope` tinyint(4) NULL DEFAULT NULL COMMENT '数据权限',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `group_type` tinyint(1) NULL DEFAULT 1 COMMENT '角色类型 0.默认角色 1.普通角色',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态 0.禁用 1.启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_group
-- ----------------------------
INSERT INTO `tb_group` VALUES (2, '管理员', '管理员', -1, 3, 0, 1, 1);
INSERT INTO `tb_group` VALUES (3, '超级管理员', '超级管理员', -1, 0, 0, 0, 1);
INSERT INTO `tb_group` VALUES (4, '开发角色', '开发角色', -1, 3, 0, 1, 1);

-- ----------------------------
-- Table structure for tb_group_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_group_resource`;
CREATE TABLE `tb_group_resource`  (
  `fk_resource_id` bigint(20) NOT NULL COMMENT '资源id',
  `fk_group_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`fk_resource_id`, `fk_group_id`) USING BTREE,
  INDEX `fk_q82fpmfh128qxoeyymrkg71e2`(`fk_group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_group_resource
-- ----------------------------
INSERT INTO `tb_group_resource` VALUES (1, 2);
INSERT INTO `tb_group_resource` VALUES (2, 2);
INSERT INTO `tb_group_resource` VALUES (3, 2);
INSERT INTO `tb_group_resource` VALUES (4, 2);
INSERT INTO `tb_group_resource` VALUES (5, 2);
INSERT INTO `tb_group_resource` VALUES (6, 2);
INSERT INTO `tb_group_resource` VALUES (7, 2);
INSERT INTO `tb_group_resource` VALUES (8, 2);
INSERT INTO `tb_group_resource` VALUES (9, 2);
INSERT INTO `tb_group_resource` VALUES (10, 2);
INSERT INTO `tb_group_resource` VALUES (11, 2);
INSERT INTO `tb_group_resource` VALUES (12, 2);
INSERT INTO `tb_group_resource` VALUES (13, 2);
INSERT INTO `tb_group_resource` VALUES (14, 2);
INSERT INTO `tb_group_resource` VALUES (1061795714310340609, 2);
INSERT INTO `tb_group_resource` VALUES (1061796635891204097, 2);
INSERT INTO `tb_group_resource` VALUES (1061796792326160384, 2);
INSERT INTO `tb_group_resource` VALUES (1061796876346458113, 2);
INSERT INTO `tb_group_resource` VALUES (1061796962749120512, 2);
INSERT INTO `tb_group_resource` VALUES (1062237803993104384, 2);
INSERT INTO `tb_group_resource` VALUES (1062239403281219584, 2);
INSERT INTO `tb_group_resource` VALUES (1062239572546551808, 2);
INSERT INTO `tb_group_resource` VALUES (1062240364850577408, 2);
INSERT INTO `tb_group_resource` VALUES (1810233573149229057, 2);
INSERT INTO `tb_group_resource` VALUES (1810233791907348481, 2);
INSERT INTO `tb_group_resource` VALUES (1945292986967646209, 2);
INSERT INTO `tb_group_resource` VALUES (1945293161396166657, 2);
INSERT INTO `tb_group_resource` VALUES (1945314380950528001, 2);
INSERT INTO `tb_group_resource` VALUES (1945315651732365313, 2);
INSERT INTO `tb_group_resource` VALUES (1945359133784137729, 2);
INSERT INTO `tb_group_resource` VALUES (1945360342116982785, 2);
INSERT INTO `tb_group_resource` VALUES (1945360520039358466, 2);
INSERT INTO `tb_group_resource` VALUES (1945370007219462146, 2);
INSERT INTO `tb_group_resource` VALUES (1945370037095489537, 2);
INSERT INTO `tb_group_resource` VALUES (1945680628070735873, 2);
INSERT INTO `tb_group_resource` VALUES (1945768144668975106, 2);
INSERT INTO `tb_group_resource` VALUES (1945782459782389762, 2);
INSERT INTO `tb_group_resource` VALUES (1945782602682327042, 2);
INSERT INTO `tb_group_resource` VALUES (1946039811613908993, 2);
INSERT INTO `tb_group_resource` VALUES (1978645263203688449, 2);
INSERT INTO `tb_group_resource` VALUES (1978983927632879617, 2);
INSERT INTO `tb_group_resource` VALUES (1978984307850731521, 2);
INSERT INTO `tb_group_resource` VALUES (1978992820429774849, 2);
INSERT INTO `tb_group_resource` VALUES (1978996790145572866, 2);
INSERT INTO `tb_group_resource` VALUES (1978997029019574274, 2);
INSERT INTO `tb_group_resource` VALUES (1979002894040686593, 2);
INSERT INTO `tb_group_resource` VALUES (1979003092854890497, 2);
INSERT INTO `tb_group_resource` VALUES (1979003339802927105, 2);
INSERT INTO `tb_group_resource` VALUES (1979122433579540482, 2);
INSERT INTO `tb_group_resource` VALUES (1980542349600346113, 2);
INSERT INTO `tb_group_resource` VALUES (1980545169812606977, 2);
INSERT INTO `tb_group_resource` VALUES (1980545422561366018, 2);
INSERT INTO `tb_group_resource` VALUES (1983436806057877505, 2);
INSERT INTO `tb_group_resource` VALUES (1985191615847440385, 2);
INSERT INTO `tb_group_resource` VALUES (1985228969026985986, 2);
INSERT INTO `tb_group_resource` VALUES (1, 4);
INSERT INTO `tb_group_resource` VALUES (2, 4);
INSERT INTO `tb_group_resource` VALUES (3, 4);
INSERT INTO `tb_group_resource` VALUES (4, 4);
INSERT INTO `tb_group_resource` VALUES (5, 4);
INSERT INTO `tb_group_resource` VALUES (6, 4);
INSERT INTO `tb_group_resource` VALUES (7, 4);
INSERT INTO `tb_group_resource` VALUES (8, 4);
INSERT INTO `tb_group_resource` VALUES (9, 4);
INSERT INTO `tb_group_resource` VALUES (10, 4);
INSERT INTO `tb_group_resource` VALUES (11, 4);
INSERT INTO `tb_group_resource` VALUES (12, 4);
INSERT INTO `tb_group_resource` VALUES (13, 4);
INSERT INTO `tb_group_resource` VALUES (14, 4);
INSERT INTO `tb_group_resource` VALUES (1061795714310340609, 4);
INSERT INTO `tb_group_resource` VALUES (1061796635891204097, 4);
INSERT INTO `tb_group_resource` VALUES (1061796792326160384, 4);
INSERT INTO `tb_group_resource` VALUES (1061796876346458113, 4);
INSERT INTO `tb_group_resource` VALUES (1061796962749120512, 4);
INSERT INTO `tb_group_resource` VALUES (1062237803993104384, 4);
INSERT INTO `tb_group_resource` VALUES (1062239403281219584, 4);
INSERT INTO `tb_group_resource` VALUES (1062239572546551808, 4);
INSERT INTO `tb_group_resource` VALUES (1062240364850577408, 4);
INSERT INTO `tb_group_resource` VALUES (1810233573149229057, 4);
INSERT INTO `tb_group_resource` VALUES (1810233791907348481, 4);
INSERT INTO `tb_group_resource` VALUES (1945292986967646209, 4);
INSERT INTO `tb_group_resource` VALUES (1945293161396166657, 4);
INSERT INTO `tb_group_resource` VALUES (1945314380950528001, 4);
INSERT INTO `tb_group_resource` VALUES (1945315651732365313, 4);
INSERT INTO `tb_group_resource` VALUES (1945359133784137729, 4);
INSERT INTO `tb_group_resource` VALUES (1945360342116982785, 4);
INSERT INTO `tb_group_resource` VALUES (1945360520039358466, 4);
INSERT INTO `tb_group_resource` VALUES (1945360693440274434, 4);
INSERT INTO `tb_group_resource` VALUES (1945370007219462146, 4);
INSERT INTO `tb_group_resource` VALUES (1945370037095489537, 4);
INSERT INTO `tb_group_resource` VALUES (1945680628070735873, 4);
INSERT INTO `tb_group_resource` VALUES (1945768144668975106, 4);
INSERT INTO `tb_group_resource` VALUES (1945768292157480961, 4);
INSERT INTO `tb_group_resource` VALUES (1945782459782389762, 4);
INSERT INTO `tb_group_resource` VALUES (1945782602682327042, 4);
INSERT INTO `tb_group_resource` VALUES (1978983927632879617, 4);
INSERT INTO `tb_group_resource` VALUES (1978984307850731521, 4);
INSERT INTO `tb_group_resource` VALUES (1978996790145572866, 4);
INSERT INTO `tb_group_resource` VALUES (1978997029019574274, 4);
INSERT INTO `tb_group_resource` VALUES (1979122433579540482, 4);
INSERT INTO `tb_group_resource` VALUES (1980542349600346113, 4);
INSERT INTO `tb_group_resource` VALUES (1980545169812606977, 4);
INSERT INTO `tb_group_resource` VALUES (1980545422561366018, 4);

-- ----------------------------
-- Table structure for tb_group_unit
-- ----------------------------
DROP TABLE IF EXISTS `tb_group_unit`;
CREATE TABLE `tb_group_unit`  (
  `group_id` bigint(20) NOT NULL COMMENT '角色id',
  `unit_id` bigint(20) NOT NULL COMMENT '机构id',
  PRIMARY KEY (`group_id`, `unit_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_group_unit
-- ----------------------------

-- ----------------------------
-- Table structure for tb_group_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_group_user`;
CREATE TABLE `tb_group_user`  (
  `fk_group_id` bigint(20) NOT NULL COMMENT '角色id',
  `fk_user_id` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`fk_group_id`, `fk_user_id`) USING BTREE,
  INDEX `fk_7k068ltfepa1q75qtmvxuawk`(`fk_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_group_user
-- ----------------------------
INSERT INTO `tb_group_user` VALUES (2, 3);
INSERT INTO `tb_group_user` VALUES (2, 4);
INSERT INTO `tb_group_user` VALUES (2, 1981619674500788227);
INSERT INTO `tb_group_user` VALUES (2, 1981621769337565186);
INSERT INTO `tb_group_user` VALUES (2, 1981622068357885954);
INSERT INTO `tb_group_user` VALUES (4, 1981622068357885954);

-- ----------------------------
-- Table structure for tb_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `component` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面标识',
  `permission` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `sort` int(11) NOT NULL COMMENT '排序',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `type` int(11) NOT NULL COMMENT '类型 1菜单，2按钮',
  `value` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `fk_parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级资源id',
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `platform_type` tinyint(1) NULL DEFAULT 2 COMMENT '平台类型 1.全部 2.运营平台 3.校园平台',
  `resource_fk_id` bigint(20) NULL DEFAULT NULL COMMENT '外联资源id,表示该资源来自哪个id的资源',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_k2heqvi9muk4cjyyd53r9y37x`(`fk_parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_resource
-- ----------------------------
INSERT INTO `tb_resource` VALUES (1, 'main', 'upms', '', 122, '系统管理', 1, '/account', NULL, 'logo-buffer', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (2, '/count-to/count-to', 'user:list', '', 4, '用户管理', 1, '/upms/user-list', 1, 'md-contacts', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (3, '/count-to/count-to', 'user:save', '', 3, '保存用户', 2, '', 2, '', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (4, '/count-to/count-to', 'user:delete', '', 4, '删除用户', 2, '', 2, '', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (5, '/count-to/count-to', 'user:edit', '', 5, '编辑用户', 2, '', 2, '', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (6, '/count-to/count-to', 'group:list', '', 5, '角色管理', 1, '/upms/group-list', 1, 'ios-people', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (7, 'ACCOUNT_GROUP_SAVE', 'group:save', '', 7, '保存组', 2, '', 6, '', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (8, 'ACCOUNT_GROUP_EDIT', 'group:edit', '', 8, '编辑组', 2, '', 6, '', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (9, 'ACCOUNT_GROUP_DELETE', 'group:delete', '', 9, '删除组', 2, '', 6, '', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (10, '/count-to/count-to', 'resource:list', '', 6, '资源管理', 1, '/upms/resource-mgr', 1, 'ios-basket-outline', 0, 2, -1);
INSERT INTO `tb_resource` VALUES (11, 'ACCOUNT_RESOURCE_SAVE', 'resource:save', '', 11, '保存资源', 2, '', 10, '', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (12, 'ACCOUNT_RESOURCE_EDIT', 'resource:edit', '', 12, '编辑资源', 2, '', 10, '', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (13, 'ACCOUNT_RESOURCE_DELETE', 'resource:delete', '', 13, '删除资源', 2, '', 10, '', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (14, NULL, NULL, NULL, 9, '部门管理', 1, '/upms/department-management', 1, '', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1001, NULL, 'attendance-manager/day-summary', NULL, 4, '每日统计', 1, '/attendance-manager/day-summary', 1234295088964755457, NULL, 0, 3, -1);
INSERT INTO `tb_resource` VALUES (1003, NULL, 'attendance-manager/original-attendance', NULL, 5, '原始记录', 1, '/attendance-manager/original-attendance', 1234295088964755457, NULL, 0, 3, -1);
INSERT INTO `tb_resource` VALUES (1061795714310340609, NULL, 'job:list', NULL, 26, '定时任务', 1, '/upms/job-manager', 1, NULL, 0, 2, -1);
INSERT INTO `tb_resource` VALUES (1061796635891204097, NULL, 'job:start', NULL, 26, '启动定时任务', 2, NULL, 1061795714310340609, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1061796792326160384, NULL, 'job:stop', NULL, 27, '停止定时任务', 2, NULL, 1061795714310340609, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1061796876346458113, NULL, 'job:pause', NULL, 28, '暂停定时任务', 2, NULL, 1061795714310340609, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1061796962749120512, NULL, 'job:resmue', NULL, 29, '恢复定时任务', 2, NULL, 1061795714310340609, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1062237803993104384, NULL, 'user:list', NULL, 1, '查看用户列表', 2, NULL, 2, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1062239403281219584, NULL, 'group:list', NULL, 1, '查看组', 2, NULL, 6, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1062239572546551808, NULL, 'resource:list', NULL, 1, '查看资源', 2, NULL, 10, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1062239650648686593, NULL, 'unit:list', NULL, 1, '查看架构', 2, NULL, 990792035847897088, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1062239772619046913, NULL, 'unit:edit', NULL, 2, '编辑架构', 2, NULL, 990792035847897088, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1062239960465145856, NULL, 'unit:save', NULL, 3, '保存架构', 2, NULL, 990792035847897088, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1062240022591176704, NULL, 'unit:delete', NULL, 4, '删除架构', 2, NULL, 990792035847897088, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1062240186521354241, NULL, 'data-dictionary:list', NULL, 37, '查看数据字典', 2, NULL, 15, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1062240281648168960, NULL, 'dictionary-category:list', NULL, 1, '查看字典类别', 2, NULL, 19, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1062240364850577408, NULL, 'job:list', NULL, 1, '查看定时任务', 2, NULL, 1061795714310340609, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1810233573149229057, NULL, NULL, NULL, 7, '字典类别', 1, '/dictionary/dictionary-category', 1, '', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1810233791907348481, NULL, NULL, NULL, 8, '字典管理', 1, '/dictionary/dictionary', 1, '', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945292986967646209, NULL, NULL, NULL, 33, '数据调用', 1, '/data-invocation', NULL, 'ios-infinite', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945293161396166657, NULL, NULL, NULL, 1, '数据调用', 1, '/data-invocation/data-invocation', 1945292986967646209, 'ios-infinite', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945314380950528001, NULL, NULL, NULL, 35, '三维展示', 1, '/3dDisplay', NULL, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945315651732365313, NULL, NULL, NULL, 36, '三维展示', 1, '/3dDisplay/index', 1945314380950528001, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945359133784137729, NULL, NULL, NULL, 37, '告警管理', 1, NULL, NULL, 'md-alert', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945360342116982785, NULL, NULL, NULL, 1, '告警规则', 1, '/alarm-management/alarm-rule', 1945359133784137729, 'ios-create', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945360520039358466, NULL, NULL, NULL, 2, '告警事件', 1, '/alarm-management/alarm-list', 1945359133784137729, 'ios-list-box', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945360693440274434, NULL, NULL, NULL, 3, '告警推送', 1, '/alarm-management/alarm-push', 1945359133784137729, 'ios-paper-plane', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945370007219462146, NULL, NULL, NULL, 41, 'CAE仿真', 1, NULL, NULL, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945370037095489537, NULL, NULL, NULL, 42, '机床加工裁荷转化和预测', 1, '/CAE/loadingPrediction', 1945370007219462146, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945680628070735873, NULL, NULL, NULL, 43, '主轴系统动力学模型与有限元仿真', 1, '/CAE/simulation', 1945370007219462146, 'ios-alert-outline', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945768144668975106, NULL, NULL, NULL, 44, '统计分析', 1, NULL, NULL, 'md-desktop', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945768292157480961, NULL, NULL, NULL, 1, '统计分析', 1, '/statistical-analysis/statistical-analysis', 1945768144668975106, 'md-desktop', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945782459782389762, NULL, NULL, NULL, 46, '文件管理', 1, '/document-management', NULL, 'md-folder', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1945782602682327042, NULL, NULL, NULL, 1, '文件列表', 1, '/document-management/document-list', 1945782459782389762, 'ios-list-box', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1946039811613908993, NULL, NULL, NULL, 48, '主轴关键结合面退化模型与退化预测', 1, '/CAE/degradationPrediction', 1945370007219462146, 'ios-alert', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1978645263203688449, NULL, NULL, NULL, 49, '综合分析', 1, '/statistical-analysis/comprehensive-report', 1945768144668975106, 'md-desktop', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1978983927632879617, NULL, NULL, NULL, 55, 'python接口各项算法', 1, '/arithmetic', NULL, '', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1978984307850731521, NULL, NULL, NULL, 1, '故障检测', 1, '/arithmetic/fault-detect/index', 1978983927632879617, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1978992820429774849, NULL, NULL, NULL, 52, '采集文件', 1, '/document-management/collect-document', 1945782459782389762, 'ios-list', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1978996790145572866, NULL, NULL, NULL, 5, '健康状态评估', 1, '/arithmetic/health-assessment/index', 1978983927632879617, 'ios-alert', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1978997029019574274, NULL, NULL, NULL, 6, '故障预测', 1, '/arithmetic/fault-predict/index', 1978983927632879617, 'ios-trending-up', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1979002894040686593, NULL, NULL, NULL, 33, '仪器管理', 1, '/instrument-management', NULL, '', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1979003092854890497, NULL, NULL, NULL, 2, '查看仪器', 1, '/instrument-management/view/index', 1979002894040686593, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1979003339802927105, NULL, NULL, NULL, 4, '采样记录', 1, '/instrument-management/sampling-record', 1979002894040686593, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1979122433579540482, NULL, NULL, NULL, 3, '算法管理', 1, '/arithmetic/algorithm-management/index', 1978983927632879617, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1980542349600346113, NULL, NULL, NULL, 59, '故障诊断', 1, '/arithmetic/fault-diagnosis/index', 1978983927632879617, 'md-trending-up', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1980545169812606977, NULL, NULL, NULL, 60, '剩余寿命预测', 1, '/arithmetic/life-prediction/index', 1978983927632879617, 'md-trending-up', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1980545422561366018, NULL, NULL, NULL, 61, '维修优化', 1, '/arithmetic/maintain-optimization/index', 1978983927632879617, 'md-trending-up', 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1983436806057877505, NULL, NULL, NULL, 59, '临界转速预测', 1, '/CAE/criticalSpeedPrediction', 1945370007219462146, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1985191615847440385, NULL, NULL, NULL, 88, '颤振预测', 1, '/CAE/flutterPrediction', 1945370007219462146, NULL, 0, 1, -1);
INSERT INTO `tb_resource` VALUES (1985228969026985986, NULL, NULL, NULL, 44, '设备指标趋势', 1, '/statistical-analysis/indicator-trends', 1945768144668975106, NULL, 0, 1, -1);

-- ----------------------------
-- Table structure for tb_unit
-- ----------------------------
DROP TABLE IF EXISTS `tb_unit`;
CREATE TABLE `tb_unit`  (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级编号',
  `level` int(11) NULL DEFAULT NULL COMMENT '层级',
  `org_code` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `area_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属区域',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域编码',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '机构类型',
  `master` bigint(20) NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `ctime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modifier_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `mtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标识',
  `creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_org_parent_id`(`parent_id`) USING BTREE,
  INDEX `idx_org_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_unit
-- ----------------------------
INSERT INTO `tb_unit` VALUES (1981619386624733186, 0, 1, NULL, 'test', 0, NULL, NULL, NULL, NULL, NULL, 1, 3, '2025-10-24 15:10:53', NULL, '2025-10-24 15:10:53', NULL, '0', 'maintain', NULL, 0);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `state` int(11) NOT NULL DEFAULT 1 COMMENT '状态 0-禁用 1-启用',
  `unit_id` bigint(20) NULL DEFAULT NULL COMMENT '组织机构id',
  `ctime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `creator_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人id',
  `mtime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `modifier_id` bigint(20) NULL DEFAULT NULL COMMENT '更新人id',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除状态',
  `tenant_id` bigint(20) NOT NULL COMMENT '租户id',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '用户类型 1.学生 2.教职工',
  `creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `account_id` bigint(20) NULL DEFAULT NULL COMMENT '账号id',
  `tenant_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (3, 1, 1753311069616480257, '2018-08-14 10:57:37', NULL, '2024-02-03 16:31:51', NULL, 0, 0, 3, NULL, NULL, 3, '0');
INSERT INTO `tb_user` VALUES (4, 1, 1753311069616480257, '2018-08-14 10:57:37', NULL, '2024-02-03 16:31:51', NULL, 0, 0, 3, NULL, NULL, 3, '0');
INSERT INTO `tb_user` VALUES (1981619674500788227, 1, 1981619386624733186, '2025-10-24 15:12:02', 3, '2025-10-24 15:12:02', NULL, 0, 0, 3, 'maintain', NULL, 1981619674500788226, '0');
INSERT INTO `tb_user` VALUES (1981621769337565186, 1, 1981619386624733186, '2025-10-24 15:20:21', 3, '2025-11-04 14:26:09', NULL, 0, 0, 3, 'maintain', NULL, 1981621769337565185, '0');
INSERT INTO `tb_user` VALUES (1981622068357885954, 1, 1981619386624733186, '2025-10-24 15:21:33', 3, '2025-10-24 15:21:33', NULL, 0, 0, 3, 'maintain', NULL, 1981622068357885953, '0');

SET FOREIGN_KEY_CHECKS = 1;
