/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50621
 Source Host           : localhost:3306
 Source Schema         : personal

 Target Server Type    : MySQL
 Target Server Version : 50621
 File Encoding         : 65001

 Date: 06/04/2021 08:45:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for business_inf
-- ----------------------------
DROP TABLE IF EXISTS `business_inf`;
CREATE TABLE `business_inf`  (
  `id` int(11) NOT NULL,
  `mailmarketing` int(11) NULL DEFAULT NULL,
  `allianceadvertising` int(11) NULL DEFAULT NULL,
  `videoadvertising` int(11) NULL DEFAULT NULL,
  `directaccess` int(11) NULL DEFAULT NULL,
  `searchengine` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of business_inf
-- ----------------------------
INSERT INTO `business_inf` VALUES (1, 120, 220, 150, 320, 820);
INSERT INTO `business_inf` VALUES (2, 132, 182, 232, 332, 932);
INSERT INTO `business_inf` VALUES (3, 101, 191, 201, 301, 901);
INSERT INTO `business_inf` VALUES (4, 134, 234, 154, 334, 934);
INSERT INTO `business_inf` VALUES (5, 90, 290, 190, 390, 1290);
INSERT INTO `business_inf` VALUES (6, 230, 330, 330, 330, 1330);
INSERT INTO `business_inf` VALUES (7, 210, 310, 410, 320, 1340);

-- ----------------------------
-- Table structure for checkwork_inf
-- ----------------------------
DROP TABLE IF EXISTS `checkwork_inf`;
CREATE TABLE `checkwork_inf`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEPT_ID` int(11) NOT NULL,
  `JOB_ID` int(11) NOT NULL,
  `EMP_ID` int(11) NOT NULL,
  `WORKINGDAYS` int(11) NOT NULL,
  `DAYSLEAVE` int(11) NOT NULL,
  `CREATEDATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DAYSOUT` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `EMP_ID`) USING BTREE,
  INDEX `FK_EMP_DEPT`(`DEPT_ID`) USING BTREE,
  INDEX `FK_EMP_JOB`(`JOB_ID`) USING BTREE,
  INDEX `ID`(`ID`) USING BTREE,
  INDEX `checkwork_inf_ibfk_3`(`EMP_ID`) USING BTREE,
  CONSTRAINT `che_1` FOREIGN KEY (`DEPT_ID`) REFERENCES `dept_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `che_2` FOREIGN KEY (`JOB_ID`) REFERENCES `job_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `che_3` FOREIGN KEY (`EMP_ID`) REFERENCES `employee_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of checkwork_inf
-- ----------------------------
INSERT INTO `checkwork_inf` VALUES (6, 1, 7, 1, 20, 2, '2021-03-09 21:42:41', 3);
INSERT INTO `checkwork_inf` VALUES (7, 1, 1, 14, 20, 2, '2021-03-31 10:18:41', 3);

-- ----------------------------
-- Table structure for code_inf
-- ----------------------------
DROP TABLE IF EXISTS `code_inf`;
CREATE TABLE `code_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of code_inf
-- ----------------------------
INSERT INTO `code_inf` VALUES (1, 'KPHMYKTKT', '2019-03-29 14:25:14');
INSERT INTO `code_inf` VALUES (2, 'PBB7KUYBT', '2019-03-29 16:47:29');
INSERT INTO `code_inf` VALUES (3, '9I2AN4D3W', '2019-03-29 16:47:37');
INSERT INTO `code_inf` VALUES (4, 'WLMGU4RZH', '2019-03-29 17:01:09');
INSERT INTO `code_inf` VALUES (5, 'YQ2QEJ8WL', '2019-03-29 17:01:17');
INSERT INTO `code_inf` VALUES (6, 'IMSQKMG6X', '2019-04-01 15:00:04');
INSERT INTO `code_inf` VALUES (7, 'A7537ZTEJ', '2019-04-01 15:00:17');
INSERT INTO `code_inf` VALUES (8, 'ZQ8VIGSF9', '2019-04-01 15:00:21');
INSERT INTO `code_inf` VALUES (9, 'F8R7ANA6G', '2019-04-03 08:41:24');
INSERT INTO `code_inf` VALUES (10, 'QNTGMEIXV', '2019-04-04 19:34:59');
INSERT INTO `code_inf` VALUES (11, 'BYKZN687L', '2019-04-10 17:56:31');
INSERT INTO `code_inf` VALUES (12, 'VDEY3V646', '2019-04-15 15:26:05');
INSERT INTO `code_inf` VALUES (13, 'PK6K2AQNA', '2019-05-29 13:48:21');
INSERT INTO `code_inf` VALUES (14, 'FIU8ZY2M7', '2019-05-29 13:48:29');
INSERT INTO `code_inf` VALUES (15, 'V7P6G6WSB', '2019-05-29 13:48:31');
INSERT INTO `code_inf` VALUES (16, 'VHVPEBDBE', '2020-04-03 00:13:09');
INSERT INTO `code_inf` VALUES (17, 'AYPW9LTDK', '2020-04-16 15:37:30');
INSERT INTO `code_inf` VALUES (18, '33IP3H9J5', '2020-04-16 16:00:48');

-- ----------------------------
-- Table structure for completion_inf
-- ----------------------------
DROP TABLE IF EXISTS `completion_inf`;
CREATE TABLE `completion_inf`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of completion_inf
-- ----------------------------
INSERT INTO `completion_inf` VALUES (1, '优秀');
INSERT INTO `completion_inf` VALUES (2, '良好');
INSERT INTO `completion_inf` VALUES (3, '不合格');

-- ----------------------------
-- Table structure for confidentialitycontract_inf
-- ----------------------------
DROP TABLE IF EXISTS `confidentialitycontract_inf`;
CREATE TABLE `confidentialitycontract_inf`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of confidentialitycontract_inf
-- ----------------------------
INSERT INTO `confidentialitycontract_inf` VALUES (1, '已签');
INSERT INTO `confidentialitycontract_inf` VALUES (2, '未签');

-- ----------------------------
-- Table structure for contract_inf
-- ----------------------------
DROP TABLE IF EXISTS `contract_inf`;
CREATE TABLE `contract_inf`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEPT_ID` int(11) NOT NULL,
  `JOB_ID` int(11) NOT NULL,
  `STATUS_ID` int(11) NULL DEFAULT 0,
  `EMP_ID` int(11) NOT NULL,
  `TRAIN_CONTRACT` int(11) NOT NULL,
  `LABOR_CONTRACT` int(11) NOT NULL,
  `CREATE_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CONFIDENTIALITY_CONTRACT` int(11) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_EMP_DEPT`(`DEPT_ID`) USING BTREE,
  INDEX `FK_EMP_JOB`(`JOB_ID`) USING BTREE,
  INDEX `ID`(`ID`) USING BTREE,
  INDEX `checkwork_inf_ibfk_3`(`EMP_ID`) USING BTREE,
  CONSTRAINT `con_1` FOREIGN KEY (`DEPT_ID`) REFERENCES `dept_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `con_2` FOREIGN KEY (`JOB_ID`) REFERENCES `job_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `con_3` FOREIGN KEY (`EMP_ID`) REFERENCES `employee_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of contract_inf
-- ----------------------------
INSERT INTO `contract_inf` VALUES (1, 1, 7, 0, 1, 1, 1, '2019-01-16 09:05:00', 1);
INSERT INTO `contract_inf` VALUES (3, 3, 1, 0, 11, 1, 2, '2021-03-28 11:06:34', 1);
INSERT INTO `contract_inf` VALUES (4, 3, 1, 0, 11, 1, 2, '2021-03-28 11:58:11', 1);
INSERT INTO `contract_inf` VALUES (5, 1, 1, 0, 14, 1, 1, '2021-03-02 11:35:45', 1);

-- ----------------------------
-- Table structure for dept_inf
-- ----------------------------
DROP TABLE IF EXISTS `dept_inf`;
CREATE TABLE `dept_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dept_inf
-- ----------------------------
INSERT INTO `dept_inf` VALUES (1, '技术部部', '技术研发研发');
INSERT INTO `dept_inf` VALUES (2, '运营部', '运营部');
INSERT INTO `dept_inf` VALUES (3, '财务部', '财务分析与统计计划');
INSERT INTO `dept_inf` VALUES (5, '总公办', '总公办');
INSERT INTO `dept_inf` VALUES (6, '市场部', '市场部');
INSERT INTO `dept_inf` VALUES (7, '教学部', '教学部');
INSERT INTO `dept_inf` VALUES (13, '网商公司', '网商部网商部二');
INSERT INTO `dept_inf` VALUES (14, '教学一部', '研发教学一部');
INSERT INTO `dept_inf` VALUES (15, '宣传部', '我是假的选出');

-- ----------------------------
-- Table structure for document_inf
-- ----------------------------
DROP TABLE IF EXISTS `document_inf`;
CREATE TABLE `document_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filename` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of document_inf
-- ----------------------------
INSERT INTO `document_inf` VALUES (1, '实习协议', '实习协议.doc', '实习协议文档信息', '2019-05-19 10:37:39', 1);
INSERT INTO `document_inf` VALUES (2, '员工模板', '员工导入模板.xlsx', '员工信息导入模板', '2020-06-27 21:19:35', 1);
INSERT INTO `document_inf` VALUES (25, '这是什么', 'VOCALOID3 中文音源基础示范篇.doc', '今晚看完否者', '2021-03-27 19:21:47', 1);
INSERT INTO `document_inf` VALUES (28, '换个人', '2020.2.毕业设计（论文）开题报告.docx', '上传一个文件', '2021-03-30 11:32:47', 16);

-- ----------------------------
-- Table structure for education_inf
-- ----------------------------
DROP TABLE IF EXISTS `education_inf`;
CREATE TABLE `education_inf`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of education_inf
-- ----------------------------
INSERT INTO `education_inf` VALUES (1, '大专');
INSERT INTO `education_inf` VALUES (2, '本科');
INSERT INTO `education_inf` VALUES (3, '硕士');
INSERT INTO `education_inf` VALUES (4, '博士');

-- ----------------------------
-- Table structure for employee_inf
-- ----------------------------
DROP TABLE IF EXISTS `employee_inf`;
CREATE TABLE `employee_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex_id` int(11) NULL DEFAULT NULL,
  `education_id` int(11) NULL DEFAULT NULL,
  `createdate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_EMP_DEPT`(`dept_id`) USING BTREE,
  INDEX `FK_EMP_JOB`(`job_id`) USING BTREE,
  CONSTRAINT `FK_EMP_DEPT` FOREIGN KEY (`dept_id`) REFERENCES `dept_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_EMP_JOB` FOREIGN KEY (`job_id`) REFERENCES `job_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee_inf
-- ----------------------------
INSERT INTO `employee_inf` VALUES (1, 1, 7, '爱丽丝', '432801197711251052', '浙江省杭州市', '13902001111', 2, 3, '2019-05-09 19:45:59', 1);
INSERT INTO `employee_inf` VALUES (3, 1, 3, '袭人', '620523199410103810', '江苏省南京市', '13902001111', 2, 3, '2019-05-11 13:19:32', 3);
INSERT INTO `employee_inf` VALUES (5, 3, 9, '翎幺', '620523199810103810', '甘肃省兰州市', '13902001111', 1, 3, '2019-04-15 15:44:57', 5);
INSERT INTO `employee_inf` VALUES (11, 3, 1, '小三', '410303167899009878', '月亮之上', '11022232232', 1, 3, '2020-06-29 03:09:34', 1);
INSERT INTO `employee_inf` VALUES (13, 13, 1, '看看书', '410303167899009878', '大理石省家乡市', '15677789110', 2, 4, '2021-03-27 16:07:45', 1);
INSERT INTO `employee_inf` VALUES (14, 1, 12, '猪八戒', '130425198708092057', '杀杀杀省杀市', '18436081213', 2, 1, '2021-03-31 15:13:03', 17);

-- ----------------------------
-- Table structure for job_inf
-- ----------------------------
DROP TABLE IF EXISTS `job_inf`;
CREATE TABLE `job_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job_inf
-- ----------------------------
INSERT INTO `job_inf` VALUES (1, '职员', '职员');
INSERT INTO `job_inf` VALUES (2, 'Java开发工程师', 'Java开发工程师');
INSERT INTO `job_inf` VALUES (3, 'Java中级开发工程师', 'Java中级开发工作');
INSERT INTO `job_inf` VALUES (6, '架构师', '架构师');
INSERT INTO `job_inf` VALUES (7, '主管', '主管');
INSERT INTO `job_inf` VALUES (9, '总经理', '负责项目总体工作');
INSERT INTO `job_inf` VALUES (12, '职员职员', '职员职员职员');
INSERT INTO `job_inf` VALUES (13, '运维工程师', '去各个公司装网页系统');

-- ----------------------------
-- Table structure for jobtype_inf
-- ----------------------------
DROP TABLE IF EXISTS `jobtype_inf`;
CREATE TABLE `jobtype_inf`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jobtype_inf
-- ----------------------------
INSERT INTO `jobtype_inf` VALUES (1, '人才项目');
INSERT INTO `jobtype_inf` VALUES (2, '技术方向');
INSERT INTO `jobtype_inf` VALUES (3, '设计方向');
INSERT INTO `jobtype_inf` VALUES (4, '产品方向');
INSERT INTO `jobtype_inf` VALUES (5, '客户服务');
INSERT INTO `jobtype_inf` VALUES (6, '金融方向');
INSERT INTO `jobtype_inf` VALUES (7, '市场与职能方向');

-- ----------------------------
-- Table structure for laborcontract_inf
-- ----------------------------
DROP TABLE IF EXISTS `laborcontract_inf`;
CREATE TABLE `laborcontract_inf`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of laborcontract_inf
-- ----------------------------
INSERT INTO `laborcontract_inf` VALUES (1, '已签');
INSERT INTO `laborcontract_inf` VALUES (2, '未签');

-- ----------------------------
-- Table structure for leave_inf
-- ----------------------------
DROP TABLE IF EXISTS `leave_inf`;
CREATE TABLE `leave_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NULL DEFAULT NULL,
  `dept_id` int(11) NULL DEFAULT NULL,
  `job_id` int(11) NULL DEFAULT NULL,
  `startdata` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enddata` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leavedays` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leavetype` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leavestatus` int(11) NULL DEFAULT 2,
  `leavetime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lea_1`(`emp_id`) USING BTREE,
  INDEX `lea_2`(`dept_id`) USING BTREE,
  INDEX `lea_3`(`job_id`) USING BTREE,
  CONSTRAINT `lea_1` FOREIGN KEY (`emp_id`) REFERENCES `employee_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lea_2` FOREIGN KEY (`dept_id`) REFERENCES `dept_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lea_3` FOREIGN KEY (`job_id`) REFERENCES `job_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of leave_inf
-- ----------------------------
INSERT INTO `leave_inf` VALUES (12, 1, 1, 7, '2019-05-07', '2019-05-16', '9', 1, '感冒', 1, '2019-05-24 15:38:10');
INSERT INTO `leave_inf` VALUES (15, 14, 1, 1, '2021-03-01', '2021-03-10', '9', 2, '真的有事', 0, '2021-03-31 14:01:54');
INSERT INTO `leave_inf` VALUES (16, 14, 1, 1, '2021-03-01', '2021-03-26', '25', 2, '我病了', 0, '2021-03-31 15:05:42');

-- ----------------------------
-- Table structure for leavestatus_inf
-- ----------------------------
DROP TABLE IF EXISTS `leavestatus_inf`;
CREATE TABLE `leavestatus_inf`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of leavestatus_inf
-- ----------------------------
INSERT INTO `leavestatus_inf` VALUES (1, '批准');
INSERT INTO `leavestatus_inf` VALUES (2, '未批准');

-- ----------------------------
-- Table structure for leavetype_inf
-- ----------------------------
DROP TABLE IF EXISTS `leavetype_inf`;
CREATE TABLE `leavetype_inf`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of leavetype_inf
-- ----------------------------
INSERT INTO `leavetype_inf` VALUES (1, '病假');
INSERT INTO `leavetype_inf` VALUES (2, '事假');

-- ----------------------------
-- Table structure for notice_inf
-- ----------------------------
DROP TABLE IF EXISTS `notice_inf`;
CREATE TABLE `notice_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_notice`(`user_id`) USING BTREE,
  CONSTRAINT `user_notice` FOREIGN KEY (`user_id`) REFERENCES `user_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notice_inf
-- ----------------------------
INSERT INTO `notice_inf` VALUES (1, '你好', '明天就是你自己的生日了', '2019-01-29 15:06:36', 1);
INSERT INTO `notice_inf` VALUES (2, '下午开会', '技术部下午3.00开会,请各部门准时参加会议', '2019-01-29 15:13:24', 2);
INSERT INTO `notice_inf` VALUES (3, '五一放假', '五一放假安排时间调整及时通知', '2019-02-22 19:06:23', 1);
INSERT INTO `notice_inf` VALUES (4, '发布新消息', '在普通用户页面实时提示！！！', '2019-03-03 17:21:30', 1);
INSERT INTO `notice_inf` VALUES (6, '公告测试', '公告测试内容一，发送邮', '2019-05-20 10:19:39', 1);
INSERT INTO `notice_inf` VALUES (8, '开会', '明天开会开会', '2021-03-27 16:56:23', 1);

-- ----------------------------
-- Table structure for recruitment_inf
-- ----------------------------
DROP TABLE IF EXISTS `recruitment_inf`;
CREATE TABLE `recruitment_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobtype` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `peoplenum` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 1,
  `enddate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of recruitment_inf
-- ----------------------------
INSERT INTO `recruitment_inf` VALUES (1, 1, '管培生', 1, 1, '2019-06-30');
INSERT INTO `recruitment_inf` VALUES (2, 2, 'java初级工程师', 2, 2, '2019-5-30');
INSERT INTO `recruitment_inf` VALUES (3, 3, 'UI设计工程师', 5, 1, '2019-6-30');
INSERT INTO `recruitment_inf` VALUES (5, 5, '客服专员', 2, 1, '2019-6-30');
INSERT INTO `recruitment_inf` VALUES (6, 6, '会计师', 1, 1, '2019-6-30');
INSERT INTO `recruitment_inf` VALUES (7, 7, '行政专员', 2, 2, '2019-5-30');
INSERT INTO `recruitment_inf` VALUES (8, 2, '算法工程师', 2, 1, '2019-6-30');
INSERT INTO `recruitment_inf` VALUES (9, 2, 'C++开发工程师', 1, 1, '2019-06-30');
INSERT INTO `recruitment_inf` VALUES (10, 2, 'Java专家', 1, 1, '2019-06-30');
INSERT INTO `recruitment_inf` VALUES (11, 4, '产品经理', 1, 1, '2019-06-30');
INSERT INTO `recruitment_inf` VALUES (12, 6, '高级会计师', 1, 1, '2019-06-30');
INSERT INTO `recruitment_inf` VALUES (13, 5, '高级客服专员', 2, 1, '2019-06-30');

-- ----------------------------
-- Table structure for recruitmentstatus_inf
-- ----------------------------
DROP TABLE IF EXISTS `recruitmentstatus_inf`;
CREATE TABLE `recruitmentstatus_inf`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of recruitmentstatus_inf
-- ----------------------------
INSERT INTO `recruitmentstatus_inf` VALUES (1, '正在招聘');
INSERT INTO `recruitmentstatus_inf` VALUES (2, '已结束');

-- ----------------------------
-- Table structure for resume_inf
-- ----------------------------
DROP TABLE IF EXISTS `resume_inf`;
CREATE TABLE `resume_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex_id` int(11) NULL DEFAULT NULL,
  `education_id` int(11) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_id` int(11) NULL DEFAULT 2,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of resume_inf
-- ----------------------------
INSERT INTO `resume_inf` VALUES (1, '设计方向', 'UI设计工程师', '翎幺', '13902001111@163.com', 1, 2, '13902001111', 2, '翎幺-苏州简历(2019年5月版) .pdf', '2019-06-03 20:27:12');
INSERT INTO `resume_inf` VALUES (2, '技术方向', 'C++开发工程师', '翎幺', '13902001111@163.com', 1, 1, '13902001111', 1, '翎幺-苏州简历(2019年5月版) .pdf', '2019-06-04 08:55:09');
INSERT INTO `resume_inf` VALUES (3, '市场与职能方向', '行政专员', '安安', '13902001111@163.com', 1, 2, '13902001111', 1, '翎幺-西安简历(2019年5月版) .pdf', '2019-06-04 09:41:18');
INSERT INTO `resume_inf` VALUES (4, '产品方向', '产品研发工程师', '都受到', '13902001111@163.com', 2, 4, '13902001111', 2, '翎幺-简历(2019年6月版) .pdf', '2019-06-04 10:30:18');
INSERT INTO `resume_inf` VALUES (5, '客户服务', '客服专员', '苟富贵', '13902001111@qq.com', 1, 3, '13902001111', 1, '翎幺-简历(2019年6月版) .pdf', '2019-06-04 10:30:54');

-- ----------------------------
-- Table structure for salary_inf
-- ----------------------------
DROP TABLE IF EXISTS `salary_inf`;
CREATE TABLE `salary_inf`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEPT_ID` int(11) NOT NULL,
  `JOB_ID` int(11) NOT NULL,
  `EMP_ID` int(11) NOT NULL,
  `SALARY_STATION` int(11) NOT NULL,
  `SALARY_LEVEL` int(11) NOT NULL,
  `SENIORITY_PAY` int(11) NULL DEFAULT NULL,
  `PERFORMANCE` int(11) NULL DEFAULT NULL,
  `INDIVIDUAL_INCOME` float(11, 0) NOT NULL,
  `CREATE_DATE` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_EMP_DEPT`(`DEPT_ID`) USING BTREE,
  INDEX `FK_EMP_JOB`(`JOB_ID`) USING BTREE,
  INDEX `ID`(`ID`) USING BTREE,
  INDEX `salary_inf_ibfk_3`(`EMP_ID`) USING BTREE,
  CONSTRAINT `sal_1` FOREIGN KEY (`DEPT_ID`) REFERENCES `dept_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sal_2` FOREIGN KEY (`JOB_ID`) REFERENCES `job_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sal_3` FOREIGN KEY (`EMP_ID`) REFERENCES `employee_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of salary_inf
-- ----------------------------
INSERT INTO `salary_inf` VALUES (1, 1, 7, 1, 6050, 3, 620, 150, 690, '2019-04-19 09:12:08');
INSERT INTO `salary_inf` VALUES (3, 1, 3, 3, 5000, 3, 450, 360, 500, '2019-04-19 09:12:53');
INSERT INTO `salary_inf` VALUES (4, 1, 1, 14, 6000, 3, 500, 400, 5000, '2021-03-03 11:21:06');

-- ----------------------------
-- Table structure for sex_inf
-- ----------------------------
DROP TABLE IF EXISTS `sex_inf`;
CREATE TABLE `sex_inf`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sex_inf
-- ----------------------------
INSERT INTO `sex_inf` VALUES (1, '男');
INSERT INTO `sex_inf` VALUES (2, '女');

-- ----------------------------
-- Table structure for staticid_inf
-- ----------------------------
DROP TABLE IF EXISTS `staticid_inf`;
CREATE TABLE `staticid_inf`  (
  `staticId` int(11) NOT NULL,
  PRIMARY KEY (`staticId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of staticid_inf
-- ----------------------------
INSERT INTO `staticid_inf` VALUES (13);

-- ----------------------------
-- Table structure for status_inf
-- ----------------------------
DROP TABLE IF EXISTS `status_inf`;
CREATE TABLE `status_inf`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of status_inf
-- ----------------------------
INSERT INTO `status_inf` VALUES (0, '未审核');
INSERT INTO `status_inf` VALUES (1, '已审核');

-- ----------------------------
-- Table structure for train_inf
-- ----------------------------
DROP TABLE IF EXISTS `train_inf`;
CREATE TABLE `train_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NULL DEFAULT NULL,
  `dept_id` int(11) NULL DEFAULT NULL,
  `job_id` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startdata` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enddata` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `totallength` int(11) NULL DEFAULT NULL,
  `completion` int(11) NULL DEFAULT NULL,
  `grade` int(11) NULL DEFAULT NULL,
  `traintime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lea_1`(`emp_id`) USING BTREE,
  INDEX `lea_2`(`dept_id`) USING BTREE,
  INDEX `lea_3`(`job_id`) USING BTREE,
  CONSTRAINT `train_inf_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `train_inf_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `dept_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `train_inf_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `job_inf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of train_inf
-- ----------------------------
INSERT INTO `train_inf` VALUES (2, 3, 1, 3, 'java', '2021-03-11', '2021-03-19', 8, 1, 86, '2021-03-09 21:08:04');
INSERT INTO `train_inf` VALUES (3, 1, 1, 7, 'SSM', '2021-03-09', '2021-03-24', 15, 1, 90, '2021-03-29 14:55:45');
INSERT INTO `train_inf` VALUES (4, 14, 1, 1, 'java', '2021-03-09', '2021-03-24', 15, 1, 60, '2021-03-31 14:27:07');

-- ----------------------------
-- Table structure for traincontract_inf
-- ----------------------------
DROP TABLE IF EXISTS `traincontract_inf`;
CREATE TABLE `traincontract_inf`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of traincontract_inf
-- ----------------------------
INSERT INTO `traincontract_inf` VALUES (1, '已签');
INSERT INTO `traincontract_inf` VALUES (2, '未签');

-- ----------------------------
-- Table structure for traindata_inf
-- ----------------------------
DROP TABLE IF EXISTS `traindata_inf`;
CREATE TABLE `traindata_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filename` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of traindata_inf
-- ----------------------------
INSERT INTO `traindata_inf` VALUES (38, '喵喵喵', '眼睛瞪得像铜铃 - 1.眼睛瞪得像铜铃(Av757295987,P1).mp4', '撒打撒阿迪斯', '2021-03-30 21:14:42', 1);
INSERT INTO `traindata_inf` VALUES (40, '音乐阿', '周杰伦-一路向北.wma', '秒啊啊啊得到', '2021-03-31 16:09:22', 1);

-- ----------------------------
-- Table structure for user_inf
-- ----------------------------
DROP TABLE IF EXISTS `user_inf`;
CREATE TABLE `user_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_id` int(11) NULL DEFAULT 2 COMMENT '0：未审核，1：已审核',
  `createdate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_inf
-- ----------------------------
INSERT INTO `user_inf` VALUES (1, 'admin', '7d6e2695689a3a3bb586481622e8e69b', '13902001111@163.com', 1, '2021-03-26 11:32:07', '超级管理员', 1);
INSERT INTO `user_inf` VALUES (2, 'manager', '7304b1d41dbd735711f9e25db40b4f63', '13902001111@163.com', 1, '2021-03-20 09:36:33', '总经理', 3);
INSERT INTO `user_inf` VALUES (3, 'addas', '7ac6e9b93d3e3ecc13968f6cc53a9093', '13902001111@163.com', 1, '2021-03-20 09:34:30', '阿迪达斯', 11);
INSERT INTO `user_inf` VALUES (5, 'ahualy', '0246876c1c966a36923ceb77c1d82e3a', '13902001111@163.com', 1, '2019-05-18 09:04:08', '测试', 5);
INSERT INTO `user_inf` VALUES (6, 'Leetcode', '28621d88e9551ce4086aa466239ecb16', '13902001111@163.com', 1, '2021-03-20 09:34:48', '铭星', NULL);
INSERT INTO `user_inf` VALUES (10, 'xuzheng', 'e7b336879539d04ce882ff205d1903f1', '546881916@qq.com', 0, '2021-03-20 08:56:46', '徐政', 12);
INSERT INTO `user_inf` VALUES (11, 'xujie', '33f68e36f818d6165efd550d20fc8d48', '1234567@qq.com', 1, '2020-04-17 14:20:17', '徐杰', 13);
INSERT INTO `user_inf` VALUES (12, 'zhaoyun', '4ba21ea1c0e3b03de441d797e54547c1', 'zhaoyun@126.com', 0, '2021-03-20 08:56:48', '赵云', NULL);
INSERT INTO `user_inf` VALUES (13, 'zhangsq', '94860f25f3783d136327952dd47042fb', 'zhangsq@126.com', 1, '2020-06-30 05:09:58', '张胜强', NULL);
INSERT INTO `user_inf` VALUES (15, 'zhangdanfeng', 'b8988ee1335fec445b5b6e9a05fe84c5', '87704991@qq.com', 0, '2021-03-20 08:56:51', '张丹峰', NULL);
INSERT INTO `user_inf` VALUES (16, 'sunwukong', '6035d7a170ff97458068c79e64310a38', 'swk@qq.com', 1, '2021-03-30 10:38:48', '孙悟空空', 14);
INSERT INTO `user_inf` VALUES (17, 'zhubajie', 'fde6adda55d5898a5b4bb1a8e106ac08', 'zbj@126.com', 1, '2020-07-01 04:02:39', '猪八戒', NULL);
INSERT INTO `user_inf` VALUES (18, 'tangsanzang', 'd1c386d4ea21688642d74b0cf51b9a9d', 'tsz@126.com', 1, '2021-03-24 10:51:23', '唐三藏', NULL);
INSERT INTO `user_inf` VALUES (20, 'liubeibei', '2f0c2ea3a256abcbdc2fc60c1b04a9d0', 'liubei@qq.com', 0, '2021-03-20 09:09:46', '刘备备', NULL);
INSERT INTO `user_inf` VALUES (21, 'zhugel', 'fda93c79275b812a6c1c189fbebf8b08', 'zhugl@qq.com', 1, '2021-03-19 22:48:44', '诸葛亮', NULL);
INSERT INTO `user_inf` VALUES (22, 'simayi', 'b0359dec92e4665c022157ad58e6efd1', 'smy@qq.com', 1, '2021-03-23 11:01:58', '大仲马', NULL);
INSERT INTO `user_inf` VALUES (66, 'xiaozhongma', 'e2f5e798186344470f784f353a80ef7f', 'dddd@qqq.com', 2, '2021-03-30 09:21:55', '小仲马', NULL);
INSERT INTO `user_inf` VALUES (67, 'mana', 'bfd59291e825b5f2bbf1eb76569f8fe7', '4564564@qwda5sd.com', 0, '2021-03-24 15:51:21', 'manager', NULL);
INSERT INTO `user_inf` VALUES (68, 'lisiji', '1f3d7baf1e59534c374ea2bebdbd31ce', '123456@123.com', 0, '2021-03-25 11:38:43', '利斯基', NULL);
INSERT INTO `user_inf` VALUES (69, 'shawujing', 'd388b8af1ec663a48f3b11190e026bfe', '123456789@123.com', 1, '2021-03-30 21:54:51', '沙悟净', NULL);

-- ----------------------------
-- Table structure for uservisit_inf
-- ----------------------------
DROP TABLE IF EXISTS `uservisit_inf`;
CREATE TABLE `uservisit_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visit_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_from` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `opsystem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uservisit_inf
-- ----------------------------
INSERT INTO `uservisit_inf` VALUES (1, '2019-02-12 09:13:56', '2019-02-12 20:10:21', '117.157.184.39', '北京 移动', '移动端', 'Chrome', 'Android', '57.0.2987.132', 'admin', 'HUAWEIFIG-AL10');
INSERT INTO `uservisit_inf` VALUES (2, '2019-02-12 09:16:46', '2019-02-12 20:10:21', '117.157.180.39', '北京 移动', 'PC端', 'Firefox', 'Windows', '65.0', 'admin', 'Windows NT 10.0; Win64; x64');
INSERT INTO `uservisit_inf` VALUES (3, '2019-02-12 09:17:19', '2019-02-12 20:10:21', '124.152.216.170', '北京 联通', '移动端', 'Mobile Safari', 'Android', '4.0', 'admin', 'HUAWEICLT-AL00');
INSERT INTO `uservisit_inf` VALUES (4, '2020-04-16 15:36:00', '2020-04-16 15:38:01', '0:0:0:0:0:0:0:1', NULL, 'PC端', 'Chrome', 'Windows', '71.0.3578.98', 'admin', 'Windows NT 10.0; Win64');
INSERT INTO `uservisit_inf` VALUES (5, '2020-04-16 22:19:38', '2020-04-16 22:22:08', '0:0:0:0:0:0:0:1', NULL, 'PC端', 'Chrome', 'Windows', '71.0.3578.98', 'admin', 'Windows NT 10.0; Win64');
INSERT INTO `uservisit_inf` VALUES (6, '2020-04-17 14:14:25', '2020-04-17 14:17:55', '0:0:0:0:0:0:0:1', NULL, 'PC端', 'Chrome', 'Windows', '71.0.3578.98', 'admin', 'Windows NT 10.0; Win64');
INSERT INTO `uservisit_inf` VALUES (7, '2020-04-17 14:18:59', '2020-04-17 14:19:30', '0:0:0:0:0:0:0:1', NULL, 'PC端', 'Chrome', 'Windows', '71.0.3578.98', 'admin', 'Windows NT 10.0; Win64');
INSERT INTO `uservisit_inf` VALUES (8, '2020-04-17 14:19:54', '2020-04-17 14:20:27', '0:0:0:0:0:0:0:1', NULL, 'PC端', 'Chrome', 'Windows', '71.0.3578.98', 'admin', 'Windows NT 10.0; Win64');
INSERT INTO `uservisit_inf` VALUES (30, '2021-03-31 08:50:25', NULL, '0:0:0:0:0:0:0:1', '', 'pc端', 'Chrome 63', 'Windows 10', '63.0.3239.26', 'sunwukong', 'Windows NT 10.0');
INSERT INTO `uservisit_inf` VALUES (31, '2021-03-31 08:50:27', NULL, '0:0:0:0:0:0:0:1', '', 'pc端', 'Chrome 63', 'Windows 10', '63.0.3239.26', 'sunwukong', 'Windows NT 10.0');
INSERT INTO `uservisit_inf` VALUES (32, '2021-03-31 08:50:30', NULL, '0:0:0:0:0:0:0:1', '', 'pc端', 'Chrome 63', 'Windows 10', '63.0.3239.26', 'sunwukong', 'Windows NT 10.0');
INSERT INTO `uservisit_inf` VALUES (33, '2021-03-31 08:50:33', NULL, '0:0:0:0:0:0:0:1', '', 'pc端', 'Chrome 63', 'Windows 10', '63.0.3239.26', 'sunwukong', 'Windows NT 10.0');
INSERT INTO `uservisit_inf` VALUES (34, '2021-03-31 08:50:50', NULL, '0:0:0:0:0:0:0:1', '', 'pc端', 'Chrome 63', 'Windows 10', '63.0.3239.26', 'sunwukong', 'Windows NT 10.0');
INSERT INTO `uservisit_inf` VALUES (35, '2021-03-31 16:30:26', NULL, '0:0:0:0:0:0:0:1', '', 'pc端', 'Chrome 63', 'Windows 10', '63.0.3239.26', 'sunwukong', 'Windows NT 10.0');

SET FOREIGN_KEY_CHECKS = 1;
