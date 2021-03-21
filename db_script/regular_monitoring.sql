/*
Navicat MySQL Data Transfer

Source Server         : mysql8
Source Server Version : 80023
Source Host           : 127.0.0.1:3306
Source Database       : regular_monitoring

Target Server Type    : MYSQL
Target Server Version : 80023
File Encoding         : 65001

Date: 2021-03-07 21:10:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_procedurelog
-- ----------------------------
DROP TABLE IF EXISTS `sys_procedurelog`;
CREATE TABLE `sys_procedurelog` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ISSUCCESS` tinyint(1) DEFAULT '1' COMMENT '是否成功:0 否;1 是',
  `LOGGER` varchar(50) DEFAULT NULL COMMENT '服务名',
  `PROCEDURENAME` varchar(50) DEFAULT NULL COMMENT '过程名',
  `TIMESPAN` int DEFAULT NULL COMMENT '耗时时长(秒)',
  `ERRCODE` varchar(5) DEFAULT NULL COMMENT '错误代码',
  `ERRMESSAGE` varchar(200) DEFAULT NULL COMMENT '错误详细信息',
  `LOGTIME` datetime DEFAULT NULL COMMENT '日志记录时间',
  PRIMARY KEY (`ID`),
  KEY `NON-PROCEDURENAME` (`PROCEDURENAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日志_过程执行日志';

-- ----------------------------
-- Table structure for t00_gl_acct_tree
-- ----------------------------
DROP TABLE IF EXISTS `t00_gl_acct_tree`;
CREATE TABLE `t00_gl_acct_tree` (
  `GL_ACCT3` varchar(20) DEFAULT NULL,
  `GL_ACCT_NAME3` varchar(128) DEFAULT NULL,
  `GL_ACCT2` varchar(20) DEFAULT NULL,
  `GL_ACCT_NAME2` varchar(128) DEFAULT NULL,
  `GL_ACCT1` varchar(20) DEFAULT NULL,
  `GL_ACCT_NAME1` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t00_gl_ms_acct
-- ----------------------------
DROP TABLE IF EXISTS `t00_gl_ms_acct`;
CREATE TABLE `t00_gl_ms_acct` (
  `GL_ACCT` varchar(20) DEFAULT NULL,
  `GL_ACCT_LEVEL` varchar(2) DEFAULT NULL,
  `MAGT_GL_ACCT` varchar(20) DEFAULT NULL,
  `GL_ACCT_NAME` varchar(128) DEFAULT NULL,
  `GL_ACCT_STATUS` varchar(1) DEFAULT NULL,
  `GL_TYPE_CD` varchar(2) DEFAULT NULL,
  `BALANCE_CAT` varchar(1) DEFAULT NULL,
  `TLINE` varchar(255) DEFAULT NULL,
  `DATA_DT` varchar(10) DEFAULT NULL,
  `ETL_DATE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t00_gl_ms_org_hier
-- ----------------------------
DROP TABLE IF EXISTS `t00_gl_ms_org_hier`;
CREATE TABLE `t00_gl_ms_org_hier` (
  `OP_ORG_NUM` varchar(20) DEFAULT NULL,
  `ORG_LEVEL` varchar(2) DEFAULT NULL,
  `MAGT_ORG_NUM` varchar(20) DEFAULT NULL,
  `ORG_NAME` varchar(128) DEFAULT NULL,
  `DATA_DT` varchar(10) DEFAULT NULL,
  `ETL_DATE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t00_gl_org_tree
-- ----------------------------
DROP TABLE IF EXISTS `t00_gl_org_tree`;
CREATE TABLE `t00_gl_org_tree` (
  `ORG_NUM` varchar(20) DEFAULT NULL,
  `ORG_NAME` varchar(128) DEFAULT NULL,
  `ORG_LEVEL` varchar(2) DEFAULT NULL,
  `ORG_NUM2` varchar(20) DEFAULT NULL,
  `ORG_NAME2` varchar(128) DEFAULT NULL,
  `ORG_LEVEL2` varchar(2) DEFAULT NULL,
  `ORG_NUM3` varchar(20) DEFAULT NULL,
  `ORG_NAME3` varchar(128) DEFAULT NULL,
  `ORG_LEVEL3` varchar(2) DEFAULT NULL,
  `ORG_NUM4` varchar(20) DEFAULT NULL,
  `ORG_NAME4` varchar(128) DEFAULT NULL,
  `ORG_LEVEL4` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t00_indic_list
-- ----------------------------
DROP TABLE IF EXISTS `t00_indic_list`;
CREATE TABLE `t00_indic_list` (
  `TB` varchar(32) DEFAULT NULL,
  `TYPE` varchar(16) DEFAULT NULL,
  `NBR` varchar(8) DEFAULT NULL,
  `INDIC_NAME` varchar(256) DEFAULT NULL,
  `INDIC_LEVEL` int DEFAULT NULL,
  `IS_VALID` varchar(1) DEFAULT NULL,
  `BAL_TYPE_CD` varchar(1) DEFAULT NULL,
  `FORMULA` varchar(255) DEFAULT NULL,
  `FORMAT` varchar(8) DEFAULT NULL,
  `IS_DISPLAY` varchar(8) DEFAULT NULL,
  `DISPLAY_SEQ` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t00_indic_map
-- ----------------------------
DROP TABLE IF EXISTS `t00_indic_map`;
CREATE TABLE `t00_indic_map` (
  `TB` varchar(32) DEFAULT NULL,
  `TYPE` varchar(16) DEFAULT NULL,
  `NBR` varchar(8) DEFAULT NULL,
  `INDIC_KEY` varchar(128) DEFAULT NULL,
  `SIGN` int DEFAULT NULL,
  `IS_VALID` varchar(1) DEFAULT NULL,
  `GL_BAL_TYPE_CD` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t09_gl_subj_avg_month
-- ----------------------------
DROP TABLE IF EXISTS `t09_gl_subj_avg_month`;
CREATE TABLE `t09_gl_subj_avg_month` (
  `STAT_DT` date NOT NULL DEFAULT '9999-12-31',
  `OP_ORG_NUM` varchar(20) NOT NULL,
  `CURR_CD` varchar(8) NOT NULL,
  `GL_ACCT` varchar(20) NOT NULL,
  `GL_BAL_TYPE_CD` varchar(2) DEFAULT NULL,
  `LAST_D_BAL` decimal(31,9) DEFAULT '0.000000000',
  `LAST_C_BAL` decimal(31,9) DEFAULT '0.000000000',
  `DR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `CR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `DR_BAL` decimal(31,9) DEFAULT '0.000000000',
  `CR_BAL` decimal(31,9) DEFAULT '0.000000000',
  `NBR` int DEFAULT NULL,
  PRIMARY KEY (`STAT_DT`,`OP_ORG_NUM`,`CURR_CD`,`GL_ACCT`),
  KEY `I_STAT_DT` (`STAT_DT`) USING BTREE,
  KEY `I_OP_ORG_NUM` (`OP_ORG_NUM`) USING BTREE,
  KEY `I_CURR_CD` (`CURR_CD`) USING BTREE,
  KEY `I_GL_ACCT` (`GL_ACCT`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (year(`STAT_DT`))
(PARTITION p_gl_s_a_m_2020 VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION p_gl_s_a_m_2021 VALUES LESS THAN (2021) ENGINE = InnoDB,
 PARTITION p_gl_s_a_m_2022 VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION p_gl_s_a_m_2023 VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION p_gl_s_a_m_max VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for t09_gl_subj_avg_quarter
-- ----------------------------
DROP TABLE IF EXISTS `t09_gl_subj_avg_quarter`;
CREATE TABLE `t09_gl_subj_avg_quarter` (
  `STAT_DT` date NOT NULL DEFAULT '9999-12-31',
  `OP_ORG_NUM` varchar(20) NOT NULL,
  `CURR_CD` varchar(8) NOT NULL,
  `GL_ACCT` varchar(20) NOT NULL,
  `GL_BAL_TYPE_CD` varchar(2) DEFAULT NULL,
  `LAST_D_BAL` decimal(31,9) DEFAULT '0.000000000',
  `LAST_C_BAL` decimal(31,9) DEFAULT '0.000000000',
  `DR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `CR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `DR_BAL` decimal(31,9) DEFAULT '0.000000000',
  `CR_BAL` decimal(31,9) DEFAULT '0.000000000',
  PRIMARY KEY (`STAT_DT`,`OP_ORG_NUM`,`CURR_CD`,`GL_ACCT`),
  KEY `I_STAT_DT` (`STAT_DT`) USING BTREE,
  KEY `I_OP_ORG_NUM` (`OP_ORG_NUM`) USING BTREE,
  KEY `I_CURR_CD` (`CURR_CD`) USING BTREE,
  KEY `I_GL_ACCT` (`GL_ACCT`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (year(`STAT_DT`))
(PARTITION p_gl_s_a_q_2020 VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION p_gl_s_a_q_2021 VALUES LESS THAN (2021) ENGINE = InnoDB,
 PARTITION p_gl_s_a_q_2022 VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION p_gl_s_a_q_2023 VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION p_gl_s_a_q_max VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for t09_gl_subj_avg_year
-- ----------------------------
DROP TABLE IF EXISTS `t09_gl_subj_avg_year`;
CREATE TABLE `t09_gl_subj_avg_year` (
  `STAT_DT` date NOT NULL DEFAULT '9999-12-31',
  `OP_ORG_NUM` varchar(20) NOT NULL,
  `CURR_CD` varchar(8) NOT NULL,
  `GL_ACCT` varchar(20) NOT NULL,
  `GL_BAL_TYPE_CD` varchar(2) DEFAULT NULL,
  `LAST_D_BAL` decimal(31,9) DEFAULT '0.000000000',
  `LAST_C_BAL` decimal(31,9) DEFAULT '0.000000000',
  `DR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `CR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `DR_BAL` decimal(31,9) DEFAULT '0.000000000',
  `CR_BAL` decimal(31,9) DEFAULT '0.000000000',
  PRIMARY KEY (`STAT_DT`,`OP_ORG_NUM`,`CURR_CD`,`GL_ACCT`),
  KEY `I_STAT_DT` (`STAT_DT`) USING BTREE,
  KEY `I_OP_ORG_NUM` (`OP_ORG_NUM`) USING BTREE,
  KEY `I_CURR_CD` (`CURR_CD`) USING BTREE,
  KEY `I_GL_ACCT` (`GL_ACCT`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (year(`STAT_DT`))
(PARTITION p_gl_s_a_y_2020 VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION p_gl_s_a_y_2021 VALUES LESS THAN (2021) ENGINE = InnoDB,
 PARTITION p_gl_s_a_y_2022 VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION p_gl_s_a_y_2023 VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION p_gl_s_a_y_max VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for t09_gl_subj_month
-- ----------------------------
DROP TABLE IF EXISTS `t09_gl_subj_month`;
CREATE TABLE `t09_gl_subj_month` (
  `STAT_DT` date NOT NULL DEFAULT '9999-12-31',
  `OP_ORG_NUM` varchar(20) NOT NULL,
  `CURR_CD` varchar(8) NOT NULL,
  `GL_ACCT` varchar(20) NOT NULL,
  `GL_BAL_TYPE_CD` varchar(2) DEFAULT NULL,
  `LAST_D_BAL` decimal(31,9) DEFAULT '0.000000000',
  `LAST_C_BAL` decimal(31,9) DEFAULT '0.000000000',
  `DR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `CR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `DR_BAL` decimal(31,9) DEFAULT '0.000000000',
  `CR_BAL` decimal(31,9) DEFAULT '0.000000000',
  PRIMARY KEY (`STAT_DT`,`OP_ORG_NUM`,`CURR_CD`,`GL_ACCT`),
  KEY `I_STAT_DT` (`STAT_DT`) USING BTREE,
  KEY `I_OP_ORG_NUM` (`OP_ORG_NUM`) USING BTREE,
  KEY `I_CURR_CD` (`CURR_CD`) USING BTREE,
  KEY `I_GL_ACCT` (`GL_ACCT`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (year(`STAT_DT`))
(PARTITION p_gl_s_m_2020 VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION p_gl_s_m_2021 VALUES LESS THAN (2021) ENGINE = InnoDB,
 PARTITION p_gl_s_m_2022 VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION p_gl_s_m_2023 VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION p_gl_s_m_max VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for t09_gl_subj_quarter
-- ----------------------------
DROP TABLE IF EXISTS `t09_gl_subj_quarter`;
CREATE TABLE `t09_gl_subj_quarter` (
  `STAT_DT` date NOT NULL DEFAULT '9999-12-31',
  `OP_ORG_NUM` varchar(20) NOT NULL,
  `CURR_CD` varchar(8) NOT NULL,
  `GL_ACCT` varchar(20) NOT NULL,
  `GL_BAL_TYPE_CD` varchar(2) DEFAULT NULL,
  `LAST_D_BAL` decimal(31,9) DEFAULT '0.000000000',
  `LAST_C_BAL` decimal(31,9) DEFAULT '0.000000000',
  `DR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `CR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `DR_BAL` decimal(31,9) DEFAULT '0.000000000',
  `CR_BAL` decimal(31,9) DEFAULT '0.000000000',
  PRIMARY KEY (`STAT_DT`,`OP_ORG_NUM`,`CURR_CD`,`GL_ACCT`),
  KEY `I_STAT_DT` (`STAT_DT`) USING BTREE,
  KEY `I_OP_ORG_NUM` (`OP_ORG_NUM`) USING BTREE,
  KEY `I_CURR_CD` (`CURR_CD`) USING BTREE,
  KEY `I_GL_ACCT` (`GL_ACCT`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (year(`STAT_DT`))
(PARTITION p_gl_s_q_2020 VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION p_gl_s_q_2021 VALUES LESS THAN (2021) ENGINE = InnoDB,
 PARTITION p_gl_s_q_2022 VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION p_gl_s_q_2023 VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION p_gl_s_q_max VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for t09_gl_subj_year
-- ----------------------------
DROP TABLE IF EXISTS `t09_gl_subj_year`;
CREATE TABLE `t09_gl_subj_year` (
  `STAT_DT` date NOT NULL DEFAULT '9999-12-31',
  `OP_ORG_NUM` varchar(32) NOT NULL,
  `CURR_CD` varchar(8) NOT NULL,
  `GL_ACCT` varchar(32) NOT NULL,
  `GL_BAL_TYPE_CD` varchar(2) DEFAULT NULL,
  `LAST_D_BAL` decimal(31,9) DEFAULT '0.000000000',
  `LAST_C_BAL` decimal(31,9) DEFAULT '0.000000000',
  `DR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `CR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `DR_BAL` decimal(31,9) DEFAULT '0.000000000',
  `CR_BAL` decimal(31,9) DEFAULT '0.000000000',
  PRIMARY KEY (`STAT_DT`,`OP_ORG_NUM`,`CURR_CD`,`GL_ACCT`),
  KEY `I_STAT_DT` (`STAT_DT`) USING BTREE,
  KEY `I_OP_ORG_NUM` (`OP_ORG_NUM`) USING BTREE,
  KEY `I_CURR_CD` (`CURR_CD`) USING BTREE,
  KEY `I_GL_ACCT` (`GL_ACCT`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (year(`STAT_DT`))
(PARTITION p_gl_s_y_2020 VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION p_gl_s_y_2021 VALUES LESS THAN (2021) ENGINE = InnoDB,
 PARTITION p_gl_s_y_2022 VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION p_gl_s_y_2023 VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION p_gl_s_y_max VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for t09_mid_rm_avg_indic
-- ----------------------------
DROP TABLE IF EXISTS `t09_mid_rm_avg_indic`;
CREATE TABLE `t09_mid_rm_avg_indic` (
  `INDIC_KEY` varchar(128) NOT NULL,
  `INDIC_NAME` varchar(128) NOT NULL,
  `INDIC_TYPE` varchar(8) NOT NULL,
  `STAT_DT` date NOT NULL,
  `ORG_NUM` varchar(64) NOT NULL,
  `ORG_LEVEL` varchar(1) NOT NULL,
  `CURR_CD` varchar(8) NOT NULL,
  `PERIOD` varchar(8) NOT NULL,
  `IND_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_AVG` decimal(31,9) DEFAULT '0.000000000',
  `IND_LAST_Y_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_LAST_P_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_BEGIN_Y_VAL` decimal(31,9) DEFAULT '0.000000000',
  `SCORE` double DEFAULT NULL,
  `SETCODE` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t09_mid_rm_avg_indic_adjust
-- ----------------------------
DROP TABLE IF EXISTS `t09_mid_rm_avg_indic_adjust`;
CREATE TABLE `t09_mid_rm_avg_indic_adjust` (
  `STAT_DT` date DEFAULT NULL,
  `INDIC_KEY` varchar(128) DEFAULT NULL,
  `OP_ORG_NUM` varchar(20) DEFAULT NULL,
  `ORG_LEVEL` varchar(1) DEFAULT NULL,
  `CURR_CD` varchar(8) DEFAULT NULL,
  `PERIOD` varchar(1) DEFAULT NULL,
  `IND_VAL` decimal(31,9) DEFAULT '0.000000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t09_mid_rm_avg_indic_lr
-- ----------------------------
DROP TABLE IF EXISTS `t09_mid_rm_avg_indic_lr`;
CREATE TABLE `t09_mid_rm_avg_indic_lr` (
  `INDIC_KEY` varchar(128) NOT NULL,
  `INDIC_NAME` varchar(128) NOT NULL,
  `INDIC_TYPE` varchar(8) NOT NULL,
  `STAT_DT` date NOT NULL,
  `ORG_NUM` varchar(20) NOT NULL,
  `ORG_LEVEL` varchar(1) NOT NULL,
  `CURR_CD` varchar(8) NOT NULL,
  `PERIOD` varchar(8) NOT NULL,
  `IND_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_AVG` decimal(31,9) DEFAULT '0.000000000',
  `IND_LAST_Y_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_LAST_P_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_BEGIN_Y_VAL` decimal(31,9) DEFAULT '0.000000000',
  `SCORE` decimal(31,9) DEFAULT '0.000000000',
  `SETCODE` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t09_mid_rm_indic
-- ----------------------------
DROP TABLE IF EXISTS `t09_mid_rm_indic`;
CREATE TABLE `t09_mid_rm_indic` (
  `INDIC_KEY` varchar(128) NOT NULL,
  `INDIC_NAME` varchar(128) NOT NULL,
  `INDIC_TYPE` varchar(8) NOT NULL,
  `STAT_DT` date NOT NULL,
  `ORG_NUM` varchar(64) NOT NULL,
  `ORG_LEVEL` varchar(1) NOT NULL,
  `CURR_CD` varchar(8) NOT NULL,
  `PERIOD` varchar(8) NOT NULL,
  `IND_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_AVG` decimal(31,9) DEFAULT '0.000000000',
  `IND_LAST_Y_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_LAST_P_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_BEGIN_Y_VAL` decimal(31,9) DEFAULT '0.000000000',
  `SCORE` double DEFAULT NULL,
  `SETCODE` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t09_mid_rm_indic_adjust
-- ----------------------------
DROP TABLE IF EXISTS `t09_mid_rm_indic_adjust`;
CREATE TABLE `t09_mid_rm_indic_adjust` (
  `STAT_DT` date DEFAULT NULL,
  `INDIC_KEY` varchar(64) DEFAULT NULL,
  `OP_ORG_NUM` varchar(20) DEFAULT NULL,
  `ORG_LEVEL` varchar(1) DEFAULT NULL,
  `CURR_CD` varchar(8) DEFAULT NULL,
  `PERIOD` varchar(1) DEFAULT NULL,
  `IND_VAL` decimal(31,9) DEFAULT '0.000000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t09_mid_rm_indic_lr
-- ----------------------------
DROP TABLE IF EXISTS `t09_mid_rm_indic_lr`;
CREATE TABLE `t09_mid_rm_indic_lr` (
  `INDIC_KEY` varchar(128) NOT NULL,
  `INDIC_NAME` varchar(128) NOT NULL,
  `INDIC_TYPE` varchar(8) NOT NULL,
  `STAT_DT` date NOT NULL,
  `ORG_NUM` varchar(20) NOT NULL,
  `ORG_LEVEL` varchar(1) NOT NULL,
  `CURR_CD` varchar(8) NOT NULL,
  `PERIOD` varchar(8) NOT NULL,
  `IND_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_AVG` decimal(31,9) DEFAULT '0.000000000',
  `IND_LAST_Y_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_LAST_P_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_BEGIN_Y_VAL` decimal(31,9) DEFAULT '0.000000000',
  `SCORE` decimal(31,9) DEFAULT '0.000000000',
  `SETCODE` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t09_mid_rm_indic_ys
-- ----------------------------
DROP TABLE IF EXISTS `t09_mid_rm_indic_ys`;
CREATE TABLE `t09_mid_rm_indic_ys` (
  `INDIC_KEY` varchar(128) NOT NULL,
  `INDIC_NAME` varchar(128) NOT NULL,
  `INDIC_TYPE` varchar(8) NOT NULL,
  `STAT_DT` date NOT NULL,
  `ORG_NUM` varchar(64) NOT NULL,
  `ORG_LEVEL` varchar(1) NOT NULL,
  `CURR_CD` varchar(8) NOT NULL,
  `PERIOD` varchar(8) NOT NULL,
  `IND_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_AVG` decimal(31,9) DEFAULT '0.000000000',
  `IND_LAST_Y_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_LAST_P_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_BEGIN_Y_VAL` decimal(31,9) DEFAULT '0.000000000',
  `SCORE` decimal(31,9) DEFAULT '0.000000000',
  `SETCODE` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t09_mid_ywzk_avg_l4
-- ----------------------------
DROP TABLE IF EXISTS `t09_mid_ywzk_avg_l4`;
CREATE TABLE `t09_mid_ywzk_avg_l4` (
  `STAT_DT` date NOT NULL,
  `OP_ORG_NUM` varchar(20) DEFAULT NULL,
  `CURR_CD` varchar(8) DEFAULT NULL,
  `GL_ACCT` varchar(20) DEFAULT NULL,
  `GL_ACCT_LEVEL` varchar(1) DEFAULT NULL,
  `GL_BAL_TYPE_CD` varchar(2) DEFAULT NULL,
  `LAST_D_BAL` decimal(31,9) DEFAULT '0.000000000',
  `LAST_C_BAL` decimal(31,9) DEFAULT '0.000000000',
  `DR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `CR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `DR_BAL` decimal(31,9) DEFAULT '0.000000000',
  `CR_BAL` decimal(31,9) DEFAULT '0.000000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t09_mid_ywzk_l4
-- ----------------------------
DROP TABLE IF EXISTS `t09_mid_ywzk_l4`;
CREATE TABLE `t09_mid_ywzk_l4` (
  `STAT_DT` date NOT NULL,
  `OP_ORG_NUM` varchar(20) DEFAULT NULL,
  `CURR_CD` varchar(8) DEFAULT NULL,
  `GL_ACCT` varchar(20) DEFAULT NULL,
  `GL_ACCT_LEVEL` varchar(1) DEFAULT NULL,
  `GL_BAL_TYPE_CD` varchar(2) DEFAULT NULL,
  `LAST_D_BAL` decimal(31,9) DEFAULT '0.000000000',
  `LAST_C_BAL` decimal(31,9) DEFAULT '0.000000000',
  `DR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `CR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `DR_BAL` decimal(31,9) DEFAULT '0.000000000',
  `CR_BAL` decimal(31,9) DEFAULT '0.000000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t09_rm_avg_indic
-- ----------------------------
DROP TABLE IF EXISTS `t09_rm_avg_indic`;
CREATE TABLE `t09_rm_avg_indic` (
  `INDIC_KEY` varchar(128) NOT NULL,
  `INDIC_NAME` varchar(128) NOT NULL,
  `INDIC_TYPE` varchar(8) NOT NULL,
  `STAT_DT` date NOT NULL,
  `ORG_NUM` varchar(64) NOT NULL,
  `ORG_LEVEL` varchar(1) NOT NULL,
  `CURR_CD` varchar(8) NOT NULL,
  `PERIOD` varchar(8) NOT NULL,
  `IND_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_AVG` decimal(31,9) DEFAULT '0.000000000',
  `IND_LAST_Y_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_LAST_P_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_BEGIN_Y_VAL` decimal(31,9) DEFAULT '0.000000000',
  `SCORE` double DEFAULT NULL,
  `SETCODE` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`INDIC_KEY`,`STAT_DT`,`ORG_NUM`,`CURR_CD`,`PERIOD`),
  KEY `I_STAT_DT` (`STAT_DT`) USING BTREE,
  KEY `I_ORG_NUM` (`ORG_NUM`) USING BTREE,
  KEY `I_CURR_CD` (`CURR_CD`) USING BTREE,
  KEY `I_PERIOD` (`PERIOD`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (year(`STAT_DT`))
(PARTITION p_rm_a_i_2020 VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION p_rm_a_i_2021 VALUES LESS THAN (2021) ENGINE = InnoDB,
 PARTITION p_rm_a_i_2022 VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION p_rm_a_i_2023 VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION p_rm_a_i_max VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for t09_rm_indic
-- ----------------------------
DROP TABLE IF EXISTS `t09_rm_indic`;
CREATE TABLE `t09_rm_indic` (
  `INDIC_KEY` varchar(128) NOT NULL,
  `INDIC_NAME` varchar(128) NOT NULL,
  `INDIC_TYPE` varchar(8) NOT NULL,
  `STAT_DT` date NOT NULL,
  `ORG_NUM` varchar(20) NOT NULL,
  `ORG_LEVEL` varchar(1) NOT NULL,
  `CURR_CD` varchar(8) NOT NULL,
  `PERIOD` varchar(8) NOT NULL,
  `IND_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_AVG` decimal(31,9) DEFAULT '0.000000000',
  `IND_LAST_Y_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_LAST_P_VAL` decimal(31,9) DEFAULT '0.000000000',
  `IND_BEGIN_Y_VAL` decimal(31,9) DEFAULT '0.000000000',
  `SCORE` double DEFAULT NULL,
  `SETCODE` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`INDIC_KEY`,`STAT_DT`,`ORG_NUM`,`CURR_CD`,`PERIOD`),
  KEY `I_STAT_DT` (`STAT_DT`) USING BTREE,
  KEY `I_ORG_NUM` (`ORG_NUM`) USING BTREE,
  KEY `I_CURR_CD` (`CURR_CD`) USING BTREE,
  KEY `I_PERIOD` (`PERIOD`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (year(`STAT_DT`))
(PARTITION p_rm_i_2020 VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION p_rm_i_2021 VALUES LESS THAN (2021) ENGINE = InnoDB,
 PARTITION p_rm_i_2022 VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION p_rm_i_2023 VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION p_rm_i_max VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for t09_ywzk_avg_summary
-- ----------------------------
DROP TABLE IF EXISTS `t09_ywzk_avg_summary`;
CREATE TABLE `t09_ywzk_avg_summary` (
  `STAT_DT` date DEFAULT NULL,
  `OP_ORG_NUM` varchar(20) DEFAULT NULL,
  `ORG_LEVEL` varchar(1) DEFAULT NULL,
  `CURR_CD` varchar(8) DEFAULT NULL,
  `PERIOD` varchar(1) DEFAULT NULL,
  `GL_ACCT` varchar(20) DEFAULT NULL,
  `GL_ACCT_LEVEL` varchar(1) DEFAULT NULL,
  `GL_BAL_TYPE_CD` varchar(2) DEFAULT NULL,
  `LAST_D_BAL` decimal(31,9) DEFAULT '0.000000000',
  `LAST_C_BAL` decimal(31,9) DEFAULT '0.000000000',
  `DR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `CR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `DR_BAL` decimal(31,9) DEFAULT '0.000000000',
  `CR_BAL` decimal(31,9) DEFAULT '0.000000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (year(`STAT_DT`))
(PARTITION p_ywzk_a_s_2020 VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION p_ywzk_a_s_2021 VALUES LESS THAN (2021) ENGINE = InnoDB,
 PARTITION p_ywzk_a_s_2022 VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION p_ywzk_a_s_2023 VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION p_ywzk_a_s_max VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for t09_ywzk_summary
-- ----------------------------
DROP TABLE IF EXISTS `t09_ywzk_summary`;
CREATE TABLE `t09_ywzk_summary` (
  `STAT_DT` date DEFAULT NULL,
  `OP_ORG_NUM` varchar(20) DEFAULT NULL,
  `ORG_LEVEL` varchar(1) DEFAULT NULL,
  `CURR_CD` varchar(8) DEFAULT NULL,
  `PERIOD` varchar(1) DEFAULT NULL,
  `GL_ACCT` varchar(20) DEFAULT NULL,
  `GL_ACCT_LEVEL` varchar(1) DEFAULT NULL,
  `GL_BAL_TYPE_CD` varchar(2) DEFAULT NULL,
  `LAST_D_BAL` decimal(31,9) DEFAULT '0.000000000',
  `LAST_C_BAL` decimal(31,9) DEFAULT '0.000000000',
  `DR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `CR_AMT` decimal(31,9) DEFAULT '0.000000000',
  `DR_BAL` decimal(31,9) DEFAULT '0.000000000',
  `CR_BAL` decimal(31,9) DEFAULT '0.000000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (year(`STAT_DT`))
(PARTITION p_ywzk_s_2020 VALUES LESS THAN (2020) ENGINE = InnoDB,
 PARTITION p_ywzk_s_2021 VALUES LESS THAN (2021) ENGINE = InnoDB,
 PARTITION p_ywzk_s_2022 VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION p_ywzk_s_2023 VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION p_ywzk_s_max VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- View structure for v09_indic_map
-- ----------------------------
DROP VIEW IF EXISTS `v09_indic_map`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v09_indic_map` AS select `l`.`TB` AS `TB`,`l`.`TYPE` AS `TYPE`,`l`.`NBR` AS `NBR`,`l`.`INDIC_NAME` AS `INDIC_NAME`,`l`.`INDIC_LEVEL` AS `INDIC_LEVEL`,`m`.`INDIC_KEY` AS `INDIC_KEY`,`l`.`IS_VALID` AS `IS_VALID`,`m`.`SIGN` AS `SIGN`,`m`.`GL_BAL_TYPE_CD` AS `GL_BAL_TYPE_CD` from (`t00_indic_list` `l` join `t00_indic_map` `m`) where ((1 = 1) and (`l`.`TB` = `m`.`TB`) and (`l`.`TYPE` = `m`.`TYPE`) and (`l`.`NBR` = `m`.`NBR`)) ;

-- ----------------------------
-- View structure for v_org_fh
-- ----------------------------
DROP VIEW IF EXISTS `v_org_fh`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_org_fh` AS select `g`.`OP_ORG_NUM` AS `ORG_NUM`,replace(`g`.`ORG_NAME`,'汇总','') AS `ORG_NAME` from `t00_gl_ms_org_hier` `g` where ((1 = 1) and (`g`.`MAGT_ORG_NUM` = 'BSBK99AA') and (`g`.`OP_ORG_NUM` not in ('BSBK9917','BSBK9X01','BSBK9X02','BSBK9X03','BSBK9X04'))) union select `g`.`OP_ORG_NUM` AS `ORG_NUM`,`g`.`ORG_NAME` AS `ORG_NAME` from `t00_gl_ms_org_hier` `g` where ((1 = 1) and (`g`.`OP_ORG_NUM` = 'BSBK0002')) ;

-- ----------------------------
-- View structure for v_ywzk_tmp
-- ----------------------------
DROP VIEW IF EXISTS `v_ywzk_tmp`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_ywzk_tmp` AS select `t`.`STAT_DT` AS `STAT_DT`,`t`.`GL_ACCT` AS `GL_ACCT`,`g`.`GL_ACCT_NAME` AS `GL_ACCT_NAME`,`g`.`GL_ACCT_LEVEL` AS `GL_ACCT_LEVEL`,`t`.`CURR_CD` AS `CURR_CD`,`t`.`PERIOD` AS `PERIOD`,`t`.`OP_ORG_NUM` AS `ORG_NUM`,round(`t`.`LAST_D_BAL`,2) AS `LAST_D_BAL`,(case when (`t`.`LAST_C_BAL` <= 0) then abs(round(`t`.`LAST_C_BAL`,2)) else (-(1) * round(`t`.`LAST_C_BAL`,2)) end) AS `LAST_C_BAL`,round(`t`.`DR_AMT`,2) AS `DR_AMT`,(case when (`t`.`CR_AMT` <= 0) then abs(round(`t`.`CR_AMT`,2)) else (-(1) * round(`t`.`CR_AMT`,2)) end) AS `CR_AMT`,round(`t`.`DR_BAL`,2) AS `DR_BAL`,(case when (`t`.`CR_BAL` <= 0) then abs(round(`t`.`CR_BAL`,2)) else (-(1) * round(`t`.`CR_BAL`,2)) end) AS `CR_BAL` from (`t09_ywzk_summary` `t` join `t00_gl_ms_acct` `g`) where ((1 = 1) and (`t`.`GL_ACCT` = `g`.`GL_ACCT`)) ;

-- ----------------------------
-- Procedure structure for P09_AVG_GL_TO_MODLE
-- ----------------------------
DROP PROCEDURE IF EXISTS `P09_AVG_GL_TO_MODLE`;
DELIMITER ;;
CREATE PROCEDURE `P09_AVG_GL_TO_MODLE`(STAT_DT date,
	PERIOD VARCHAR (8))
BEGIN
	/*   
		#Author: ql
		#Create: 2021-01-19
		#存储过程示例
		#按分行、支行汇总 总账科目余额
	  */
	DECLARE
		p_sd date;

DECLARE
	p_period VARCHAR (8);

DECLARE
	sys_StartTime datetime;

DECLARE
	sys_ErrCode VARCHAR (5) DEFAULT '00000';

DECLARE
	sys_ErrMessage VARCHAR (200);

DECLARE
	IsSuc TINYINT (1);

DECLARE
	CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
	GET DIAGNOSTICS CONDITION 1 sys_ErrCode = RETURNED_SQLSTATE,
	sys_ErrMessage = MESSAGE_TEXT;


END;


SET sys_StartTime = NOW();


SET p_sd = STAT_DT;


SET p_period = PERIOD;

-- 清空中间表 
TRUNCATE TABLE T09_MID_YWZK_AVG_L4;

COMMIT;

-- 开启事务 START TRANSACTION;
-- 修改隔离级别,防止对业务表过长的共享锁占用 SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
#处理数据
INSERT INTO T09_MID_YWZK_AVG_L4 (
	STAT_DT,
	OP_ORG_NUM,
	CURR_CD,
	GL_ACCT,
	GL_ACCT_LEVEL,
	GL_BAL_TYPE_CD,
	LAST_D_BAL,
	LAST_C_BAL,
	DR_AMT,
	CR_AMT,
	DR_BAL,
	CR_BAL
) SELECT
	T.STAT_DT,
	T.OP_ORG_NUM,
	T.CURR_CD,
	T.GL_ACCT,
	'3' AS GL_ACCT_LEVEL,
	T.GL_BAL_TYPE_CD,
	T.LAST_D_BAL,
	T.LAST_C_BAL,
	T.DR_AMT,
	T.CR_AMT,
	T.DR_BAL,
	T.CR_BAL
FROM
	T09_GL_SUBJ_AVG_MONTH T
WHERE 1 = 1
AND T.STAT_DT = p_sd 
UNION
	SELECT
		T.STAT_DT,
		T.OP_ORG_NUM,
		T.CURR_CD,
		C.GL_ACCT2 AS GL_ACCT,
		'2' AS GL_ACCT_LEVEL,
		T.GL_BAL_TYPE_CD,
		SUM(T.LAST_D_BAL) AS LAST_D_BAL,
		SUM(T.LAST_C_BAL) AS LAST_C_BAL,
		SUM(T.DR_AMT) AS DR_AMT,
		SUM(T.CR_AMT) AS CR_AMT,
		SUM(T.DR_BAL) AS DR_BAL,
		SUM(T.CR_BAL) AS CR_BAL
	FROM
		T09_GL_SUBJ_AVG_MONTH T,
		T00_GL_ACCT_TREE C
	WHERE
		1 = 1
	AND T.STAT_DT = p_sd
	AND T.GL_ACCT = C.GL_ACCT3
	GROUP BY
		T.STAT_DT,
		T.OP_ORG_NUM,
		T.CURR_CD,
		C.GL_ACCT2,
		T.GL_BAL_TYPE_CD
	UNION
		SELECT
			T.STAT_DT,
			T.OP_ORG_NUM,
			T.CURR_CD,
			C.GL_ACCT1 AS GL_ACCT,
			'1' AS GL_ACCT_LEVEL,
			T.GL_BAL_TYPE_CD,
			SUM(T.LAST_D_BAL) AS LAST_D_BAL,
			SUM(T.LAST_C_BAL) AS LAST_C_BAL,
			SUM(T.DR_AMT) AS DR_AMT,
			SUM(T.CR_AMT) AS CR_AMT,
			SUM(T.DR_BAL) AS DR_BAL,
			SUM(T.CR_BAL) AS CR_BAL
		FROM
			T09_GL_SUBJ_AVG_MONTH T,
			T00_GL_ACCT_TREE C
		WHERE
			1 = 1
		AND T.STAT_DT = p_sd
		AND T.GL_ACCT = C.GL_ACCT3
		GROUP BY
			T.STAT_DT,
			T.OP_ORG_NUM,
			T.CURR_CD,
			C.GL_ACCT1,
			T.GL_BAL_TYPE_CD;

INSERT INTO T09_YWZK_AVG_SUMMARY (
	STAT_DT,
	OP_ORG_NUM,
	ORG_LEVEL,
	CURR_CD,
	PERIOD,
	GL_ACCT,
	GL_ACCT_LEVEL,
	GL_BAL_TYPE_CD,
	LAST_D_BAL,
	LAST_C_BAL,
	DR_AMT,
	CR_AMT,
	DR_BAL,
	CR_BAL
) SELECT
	T.STAT_DT,
	T.OP_ORG_NUM,
	'4' AS ORG_LEVEL,
	T.CURR_CD,
	p_period,
	T.GL_ACCT,
	T.GL_ACCT_LEVEL,
	T.GL_BAL_TYPE_CD,
	T.LAST_D_BAL,
	T.LAST_C_BAL,
	T.DR_AMT,
	T.CR_AMT,
	T.DR_BAL,
	T.CR_BAL
FROM
	T09_MID_YWZK_AVG_L4 T
WHERE
	1 = 1
AND T.STAT_DT = p_sd
UNION
	SELECT
		T.STAT_DT,
		G.MAGT_ORG_NUM AS OP_ORG_NUM,
		'3' AS ORG_LEVEL,
		T.CURR_CD,
		p_period,
		T.GL_ACCT,
		T.GL_ACCT_LEVEL,
		T.GL_BAL_TYPE_CD,
		SUM(T.LAST_D_BAL) AS LAST_D_BAL,
		SUM(T.LAST_C_BAL) AS LAST_C_BAL,
		SUM(T.DR_AMT) AS DR_AMT,
		SUM(T.CR_AMT) AS CR_AMT,
		SUM(T.DR_BAL) AS DR_BAL,
		SUM(T.CR_BAL) AS CR_BAL
	FROM
		T09_MID_YWZK_AVG_L4 T,
		T00_GL_MS_ORG_HIER G
	WHERE
		1 = 1
	AND T.STAT_DT = p_sd
	AND T.OP_ORG_NUM = G.OP_ORG_NUM
	AND G.ORG_LEVEL = '4'
	GROUP BY
		T.STAT_DT,
		G.MAGT_ORG_NUM,
		T.CURR_CD,
		T.GL_ACCT,
		T.GL_ACCT_LEVEL,
		T.GL_BAL_TYPE_CD;

-- 恢复隔离级别 SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- 事务提交/回滚模块
IF sys_ErrCode <> '00000' THEN

SET IsSuc = 0;

ROLLBACK;


ELSE

SET IsSuc = 1;

COMMIT;


END
IF;

-- 日志记录生成模块
INSERT INTO sys_procedurelog (
	IsSuccess,
	Logger,
	ProcedureName,
	TimeSpan,
	ErrCode,
	ErrMessage,
	LogTime
) SELECT
	IsSuc AS IsSuccess,
	'RCJC_INDIC_AVG' AS Logger,
	'P09_AVG_GL_TO_MODLE' AS ProcedureName,
	TIMESTAMPDIFF(SECOND, sys_StartTime, NOW()) AS TimeSpan,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrCode
) AS ErrCode,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrMessage
) AS ErrMessage,
 NOW() AS LogTime;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for P09_AVG_MODLE_TO_INDIC
-- ----------------------------
DROP PROCEDURE IF EXISTS `P09_AVG_MODLE_TO_INDIC`;
DELIMITER ;;
CREATE PROCEDURE `P09_AVG_MODLE_TO_INDIC`(
	STAT_DT date,
	PERIOD VARCHAR (8)
)
BEGIN
	/*   
		#Author: ql
		#Create: 2021-01-19
		#存储过程示例
		#按公式计算指标
	  */
	DECLARE
		p_sd date;

DECLARE
	p_period VARCHAR (1);


SET p_sd = STAT_DT;


SET p_period = PERIOD;

-- 清理中间表
TRUNCATE TABLE T09_MID_RM_AVG_INDIC;

CALL P09_AVG_MODLE_TO_INDIC_1 (p_sd, p_period);

CALL P09_AVG_MODLE_TO_INDIC_2 (p_sd, p_period);

CALL P09_AVG_MODLE_TO_INDIC_3 (p_sd, p_period);

INSERT INTO T09_RM_AVG_INDIC (
  INDIC_KEY ,
  INDIC_NAME ,
  INDIC_TYPE ,
  STAT_DT ,
  ORG_NUM ,
  ORG_LEVEL ,
  CURR_CD ,
  PERIOD,
  IND_VAL,
  IND_AVG,
  IND_LAST_Y_VAL,
  IND_LAST_P_VAL ,
  IND_BEGIN_Y_VAL,
  SCORE ,
  SETCODE  
) SELECT
	T.INDIC_KEY,
	T.INDIC_NAME,
	T.INDIC_TYPE,
	T.STAT_DT,
	T.ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD,
	GET_REPORT_VALUE(L.BAL_TYPE_CD, T.IND_VAL) AS IND_VAL ,
	T.IND_AVG,
	T.IND_LAST_Y_VAL,
  T.IND_LAST_P_VAL ,
  T.IND_BEGIN_Y_VAL,
	T.SCORE,
	T.SETCODE
FROM
	T09_MID_RM_AVG_INDIC T,
	T00_INDIC_LIST L 
WHERE
	1 = 1
AND T.INDIC_KEY = CONCAT(L.TB, '_', L.TYPE, '_', L.NBR);

COMMIT;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for P09_AVG_MODLE_TO_INDIC_1
-- ----------------------------
DROP PROCEDURE IF EXISTS `P09_AVG_MODLE_TO_INDIC_1`;
DELIMITER ;;
CREATE PROCEDURE `P09_AVG_MODLE_TO_INDIC_1`(STAT_DT date,
	PERIOD VARCHAR (8))
BEGIN
	/*   
		#Author: ql
		#Create: 2021-01-19
		#存储过程示例
		#按公式计算指标
	  */
	DECLARE
		p_sd date;

DECLARE
	p_period VARCHAR (1);

DECLARE
	P_max_level INT (11);

DECLARE
	i INT DEFAULT 1;

DECLARE
	sys_StartTime datetime;

DECLARE
	sys_ErrCode VARCHAR (5) DEFAULT '00000';

DECLARE
	sys_ErrMessage VARCHAR (200);

DECLARE
	IsSuc TINYINT (1);

DECLARE
	CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
	GET DIAGNOSTICS CONDITION 1 sys_ErrCode = RETURNED_SQLSTATE,
	sys_ErrMessage = MESSAGE_TEXT;


END;


SET sys_StartTime = NOW();


SET p_sd = STAT_DT;


SET p_period = PERIOD;

SELECT
	MAX(INDIC_LEVEL) INTO p_max_level
FROM
	V09_INDIC_MAP
WHERE
	TB = 'ZCFZ'
AND IS_VALID = '1';

-- 处理数据 1.资产负债入库
INSERT INTO T09_MID_RM_AVG_INDIC (
  INDIC_KEY ,
  INDIC_NAME ,
  INDIC_TYPE ,
  STAT_DT ,
  ORG_NUM ,
  ORG_LEVEL ,
  CURR_CD ,
  PERIOD,
  IND_VAL 
) SELECT
	CONCAT(M.TB, '_', M.TYPE, '_', M.NBR) AS INDIC_KEY,
	M.INDIC_NAME,
	'1' AS INDIC_TYPE,
	T.STAT_DT,
	T.OP_ORG_NUM AS ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD,
	SUM(
		GEN_OFFSET_VAL (
			M.GL_BAL_TYPE_CD,
			T.DR_BAL,
			T.CR_BAL
		)
	) AS IND_VAL

FROM
	T09_YWZK_AVG_SUMMARY T,
	V09_INDIC_MAP M
WHERE
	1 = 1
AND T.GL_ACCT = M.INDIC_KEY
AND M.TB = 'ZCFZ'
AND M.IS_VALID = '1'
AND M.INDIC_LEVEL = 0
AND T.STAT_DT = p_sd
AND T.PERIOD = p_period
GROUP BY
	M.TB,
	M.TYPE,
	M.NBR,
	M.INDIC_NAME,
	T.STAT_DT,
	T.OP_ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD;

-- 事务提交/回滚模块
IF sys_ErrCode <> '00000' THEN

SET IsSuc = 0;

ROLLBACK;


ELSE

SET IsSuc = 1;

COMMIT;


END
IF;

-- 日志记录生成模块
INSERT INTO sys_procedurelog (
	IsSuccess,
	Logger,
	ProcedureName,
	TimeSpan,
	ErrCode,
	ErrMessage,
	LogTime
) SELECT
	IsSuc AS IsSuccess,
	'RCJC_INDIC' AS Logger,
	'P09_AVG_MODLE_TO_INDIC_1_1' AS ProcedureName,
	TIMESTAMPDIFF(SECOND, sys_StartTime, NOW()) AS TimeSpan,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrCode
) AS ErrCode,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrMessage
) AS ErrMessage,
 NOW() AS LogTime;


WHILE i <= P_max_level DO
 INSERT INTO T09_MID_RM_AVG_INDIC (
  INDIC_KEY ,
  INDIC_NAME ,
  INDIC_TYPE ,
  STAT_DT ,
  ORG_NUM ,
  ORG_LEVEL ,
  CURR_CD ,
  PERIOD,
  IND_VAL 
 ) SELECT
		CONCAT(M.TB, '_', M.TYPE, '_', M.NBR) AS INDIC_KEY,
		M.INDIC_NAME,
		'1' AS INDIC_TYPE,
		I.STAT_DT,
		I.ORG_NUM,
		I.ORG_LEVEL,
		I.CURR_CD,
		I.PERIOD,
		SUM(I.IND_VAL) AS IND_VAL
 FROM
		V09_INDIC_MAP M,
		T09_MID_RM_AVG_INDIC I
	WHERE
		1 = 1
	AND M.INDIC_KEY = I.INDIC_KEY
	AND M.INDIC_LEVEL = i
	AND I.STAT_DT = p_sd
	AND I.PERIOD = p_period
	AND M.TB = 'ZCFZ'
	GROUP BY
		M.TB,
		M.TYPE,
		M.NBR,
		M.INDIC_NAME,
		I.STAT_DT,
		I.ORG_NUM,
		I.ORG_LEVEL,
		I.CURR_CD,
		I.PERIOD;

-- SELECT i; 
COMMIT;


SET i = i + 1;


END
WHILE;

-- 事务提交/回滚模块
IF sys_ErrCode <> '00000' THEN

SET IsSuc = 0;

ROLLBACK;


ELSE

SET IsSuc = 1;

COMMIT;


END
IF;

-- 日志记录生成模块
INSERT INTO sys_procedurelog (
	IsSuccess,
	Logger,
	ProcedureName,
	TimeSpan,
	ErrCode,
	ErrMessage,
	LogTime
) SELECT
	IsSuc AS IsSuccess,
	'RCJC_INDIC_AVG' AS Logger,
	'P09_AVG_MODLE_TO_INDIC_1_2' AS ProcedureName,
	TIMESTAMPDIFF(SECOND, sys_StartTime, NOW()) AS TimeSpan,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrCode
) AS ErrCode,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrMessage
) AS ErrMessage,
 NOW() AS LogTime;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for P09_AVG_MODLE_TO_INDIC_2
-- ----------------------------
DROP PROCEDURE IF EXISTS `P09_AVG_MODLE_TO_INDIC_2`;
DELIMITER ;;
CREATE PROCEDURE `P09_AVG_MODLE_TO_INDIC_2`(STAT_DT date, PERIOD varchar(8))
BEGIN
	  /*   
		#Author: ql
		#Create: 2021-01-19
		#存储过程示例
		#按公式计算指标
	  */
	  DECLARE p_sd date ; 
	  DECLARE p_period varchar(1) ; 
		DECLARE P_max_level int(11);  
		DECLARE i INT DEFAULT 1 ;
	  DECLARE sys_StartTime datetime;
	  DECLARE sys_ErrCode varchar(5) DEFAULT '00000';
	  DECLARE sys_ErrMessage varchar(200);
	  DECLARE IsSuc tinyint(1);
	  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	  BEGIN
		GET DIAGNOSTICS CONDITION 1
		sys_ErrCode = RETURNED_SQLSTATE, sys_ErrMessage = MESSAGE_TEXT;
	  END;
	  SET sys_StartTime = NOW();
	  SET p_sd = STAT_DT;
	  SET p_period = PERIOD;
		SELECT MAX(INDIC_LEVEL) INTO p_max_level FROM V09_INDIC_MAP WHERE TB = 'LR' AND IS_VALID = '1';

TRUNCATE TABLE T09_MID_RM_AVG_INDIC_ADJUST;
TRUNCATE TABLE T09_MID_RM_AVG_INDIC_LR;

INSERT INTO T09_MID_RM_AVG_INDIC_ADJUST 
SELECT 
  T.STAT_DT,
	CASE WHEN SUM(T.DR_AMT + T.CR_AMT) <= 0 THEN 'LR_A_103' ELSE 'LR_A_104' END INDIC_KEY, 
	T.OP_ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD,
	SUM(T.DR_AMT + T.CR_AMT ) IND_VAL  
FROM T09_YWZK_AVG_SUMMARY T 
	WHERE 1=1 
	AND T.GL_ACCT IN ('5003000000','5203000000') 
	AND T.STAT_DT = p_sd
	AND T.PERIOD = p_period
	GROUP BY T.STAT_DT, T.OP_ORG_NUM, T.ORG_LEVEL, T.CURR_CD, T.PERIOD 
UNION 
SELECT 
  T.STAT_DT,
	CASE WHEN SUM(T.DR_AMT + T.CR_AMT) <= 0 THEN 'LR_A_113' ELSE 'LR_B_118' END INDIC_KEY, 
	T.OP_ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD,
	SUM(T.DR_AMT + T.CR_AMT ) IND_VAL 
FROM T09_YWZK_AVG_SUMMARY T 
	WHERE 1=1 
	AND T.GL_ACCT IN ('5004210000','5204210000') 
	AND T.STAT_DT = p_sd
	AND T.PERIOD = p_period
	GROUP BY T.STAT_DT, T.OP_ORG_NUM, T.ORG_LEVEL, T.CURR_CD, T.PERIOD 
;

COMMIT;

		-- 处理数据 2.利润表入库		
	INSERT INTO T09_MID_RM_AVG_INDIC_LR
	(
	INDIC_KEY,
	INDIC_NAME,
	INDIC_TYPE,
	STAT_DT,
	ORG_NUM,
	ORG_LEVEL ,
	CURR_CD,
	PERIOD,
	IND_VAL 
	)
		SELECT 
			CONCAT(M.TB,'_',M.TYPE,'_',M.NBR) AS INDIC_KEY,
			M.INDIC_NAME,
			'2' AS INDIC_TYPE,
			T.STAT_DT,
			T.OP_ORG_NUM AS ORG_NUM,
			T.ORG_LEVEL ,
			T.CURR_CD,
			T.PERIOD,
			SUM(GEN_OFFSET_VAL(M.GL_BAL_TYPE_CD, T.DR_AMT, T.CR_AMT)) AS IND_VAL 
		FROM T09_YWZK_AVG_SUMMARY T ,V09_INDIC_MAP M  
		WHERE 1=1   
		AND T.GL_ACCT = M.INDIC_KEY  
	  AND M.TB ='LR' 
		AND M.IS_VALID = '1'   
		AND M.INDIC_LEVEL = 0 
		AND T.STAT_DT = p_sd    
	  AND T.PERIOD = p_period  
	GROUP BY M.TB,M.TYPE,M.NBR,M.INDIC_NAME,T.STAT_DT,T.OP_ORG_NUM,T.ORG_LEVEL,T.CURR_CD,T.PERIOD;
COMMIT;

INSERT INTO T09_MID_RM_AVG_INDIC (
  INDIC_KEY ,
  INDIC_NAME ,
  INDIC_TYPE ,
  STAT_DT ,
  ORG_NUM ,
  ORG_LEVEL ,
  CURR_CD ,
  PERIOD,
  IND_VAL 
)
	SELECT
		T.INDIC_KEY,
		T.INDIC_NAME,
		T.INDIC_TYPE,
		T.STAT_DT,
		T.ORG_NUM,
		T.ORG_LEVEL ,
		T.CURR_CD,
		T.PERIOD,
		T.IND_VAL + IFNULL(J.IND_VAL,0) AS IND_VAL
FROM T09_MID_RM_AVG_INDIC_LR T LEFT JOIN T09_MID_RM_AVG_INDIC_ADJUST J 
	ON T.INDIC_KEY = J.INDIC_KEY 
	AND T.ORG_NUM = J.OP_ORG_NUM
	AND T.STAT_DT = J.STAT_DT 
	AND T.PERIOD = J.PERIOD 
	AND T.CURR_CD = J.CURR_CD
	;
COMMIT;
		-- 事务提交/回滚模块
		IF sys_ErrCode <> '00000' THEN
		  SET IsSuc = 0;
		  ROLLBACK;
		ELSE
		  SET IsSuc = 1;
		COMMIT;
	  END IF;

	  -- 日志记录生成模块
	  INSERT INTO sys_procedurelog (IsSuccess, Logger, ProcedureName, TimeSpan, ErrCode, ErrMessage, LogTime)
		SELECT
		  IsSuc AS IsSuccess,
		  'RCJC_INDIC_AVG' AS Logger,
		  'P09_AVG_MODLE_TO_INDIC_2_1' AS ProcedureName,
		  TIMESTAMPDIFF(SECOND, sys_StartTime, NOW()) AS TimeSpan,
		  IF(sys_ErrCode = '00000', NULL, sys_ErrCode) AS ErrCode,
			IF(sys_ErrCode = '00000', NULL, sys_ErrMessage) AS ErrMessage,
		  NOW() AS LogTime;
	

	WHILE i <= P_max_level DO 
INSERT INTO T09_MID_RM_AVG_INDIC (
  INDIC_KEY ,
  INDIC_NAME ,
  INDIC_TYPE ,
  STAT_DT ,
  ORG_NUM ,
  ORG_LEVEL ,
  CURR_CD ,
  PERIOD,
  IND_VAL 
)
		SELECT 
			CONCAT(M.TB,'_',M.TYPE,'_',M.NBR) AS INDIC_KEY,
			M.INDIC_NAME,
			'2' AS INDIC_TYPE,
			I.STAT_DT,
			I.ORG_NUM,
			I.ORG_LEVEL,
			I.CURR_CD,
			I.PERIOD,
			SUM(I.IND_VAL)  AS IND_VAL
		FROM V09_INDIC_MAP M, T09_MID_RM_AVG_INDIC I  
		WHERE 1=1 
		AND M.INDIC_KEY = I.INDIC_KEY  
		AND M.INDIC_LEVEL = i   
		AND I.STAT_DT = p_sd   
		AND I.PERIOD = p_period   
		AND M.TB = 'LR'  
		GROUP BY M.TB,M.TYPE,M.NBR,
			M.INDIC_NAME,
			I.STAT_DT,
			I.ORG_NUM,
			I.ORG_LEVEL,
			I.CURR_CD,
			I.PERIOD
;
-- SELECT i;
COMMIT;
		set i = i + 1;
		################# 代码结束
	END WHILE;

		-- 事务提交/回滚模块
		IF sys_ErrCode <> '00000' THEN
		  SET IsSuc = 0;
		  ROLLBACK;
		ELSE
		  SET IsSuc = 1;
		COMMIT;
	  END IF;

	  -- 日志记录生成模块
	  INSERT INTO sys_procedurelog (IsSuccess, Logger, ProcedureName, TimeSpan, ErrCode, ErrMessage, LogTime)
		SELECT
		  IsSuc AS IsSuccess,
		  'RCJC_INDIC_AVG' AS Logger,
		  'P09_AVG_MODLE_TO_INDIC_2_2' AS ProcedureName,
		  TIMESTAMPDIFF(SECOND, sys_StartTime, NOW()) AS TimeSpan,
		  IF(sys_ErrCode = '00000', NULL, sys_ErrCode) AS ErrCode,
			IF(sys_ErrCode = '00000', NULL, sys_ErrMessage) AS ErrMessage,
		  NOW() AS LogTime;

	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for P09_AVG_MODLE_TO_INDIC_3
-- ----------------------------
DROP PROCEDURE IF EXISTS `P09_AVG_MODLE_TO_INDIC_3`;
DELIMITER ;;
CREATE PROCEDURE `P09_AVG_MODLE_TO_INDIC_3`(STAT_DT date,
	PERIOD VARCHAR (8))
BEGIN
	/*   
		#Author: ql
		#Create: 2021-01-19
		#存储过程示例
		#按公式计算指标
	  */
	DECLARE
		p_sd date;

DECLARE
	p_period VARCHAR (1);

DECLARE
	P_max_level INT (11);

DECLARE
	i INT DEFAULT 0;

DECLARE
	sys_StartTime datetime;

DECLARE
	sys_ErrCode VARCHAR (5) DEFAULT '00000';

DECLARE
	sys_ErrMessage VARCHAR (200);

DECLARE
	IsSuc TINYINT (1);

DECLARE
	CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
	GET DIAGNOSTICS CONDITION 1 sys_ErrCode = RETURNED_SQLSTATE,
	sys_ErrMessage = MESSAGE_TEXT;


END;


SET sys_StartTime = NOW();


SET p_sd = STAT_DT;


SET p_period = PERIOD;

SELECT
	MAX(INDIC_LEVEL) INTO p_max_level
FROM
	V09_INDIC_MAP
WHERE
	TB = 'YS'
AND TYPE = 'AVG'
AND IS_VALID = '1';

-- 处理数据 3.衍生基础指标入库
INSERT INTO T09_MID_RM_AVG_INDIC (
	INDIC_KEY,
	INDIC_NAME,
	INDIC_TYPE,
	STAT_DT,
	ORG_NUM,
	ORG_LEVEL,
	CURR_CD,
	PERIOD,
	IND_VAL 
) SELECT
	CONCAT(M.TB, '_', M.TYPE, '_', M.NBR) AS INDIC_KEY,
	M.INDIC_NAME,
	'3' AS INDIC_TYPE,
	T.STAT_DT,
	T.OP_ORG_NUM AS ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD,
	SUM(
		GEN_OFFSET_VAL (
			M.GL_BAL_TYPE_CD,
			T.DR_BAL,
			T.CR_BAL
		)
	) AS IND_VAL 
FROM
	T09_YWZK_AVG_SUMMARY T,
	V09_INDIC_MAP M
WHERE
	1 = 1
AND T.GL_ACCT = M.INDIC_KEY
AND M.TB = 'YS'
AND M.TYPE = 'AVG'
AND M.IS_VALID = '1'
AND M.INDIC_LEVEL = 0
AND T.STAT_DT = p_sd
AND T.PERIOD = p_period
GROUP BY
	M.TB,
	M.TYPE,
	M.NBR,
	M.INDIC_NAME,
	T.STAT_DT,
	T.OP_ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD;

-- 事务提交/回滚模块
IF sys_ErrCode <> '00000' THEN

SET IsSuc = 0;

ROLLBACK;


ELSE

SET IsSuc = 1;

COMMIT;


END
IF;

-- 日志记录生成模块
INSERT INTO sys_procedurelog (
	IsSuccess,
	Logger,
	ProcedureName,
	TimeSpan,
	ErrCode,
	ErrMessage,
	LogTime
) SELECT
	IsSuc AS IsSuccess,
	'RCJC_INDIC_AVG' AS Logger,
	'P09_AVG_MODLE_TO_INDIC_3_1' AS ProcedureName,
	TIMESTAMPDIFF(SECOND, sys_StartTime, NOW()) AS TimeSpan,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrCode
) AS ErrCode,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrMessage
) AS ErrMessage,
 NOW() AS LogTime;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for P09_GL_TO_MODLE
-- ----------------------------
DROP PROCEDURE IF EXISTS `P09_GL_TO_MODLE`;
DELIMITER ;;
CREATE PROCEDURE `P09_GL_TO_MODLE`(STAT_DT date,
	PERIOD VARCHAR (8))
BEGIN
	/*   
		#Author: ql
		#Create: 2021-01-19
		#存储过程示例
		#按分行、支行汇总 总账科目余额
	  */
	DECLARE
		p_sd date ; DECLARE
		p_period VARCHAR (8) ; 
		DECLARE sys_StartTime datetime ; 
		DECLARE
					sys_ErrCode VARCHAR (5) DEFAULT '00000' ; 
		DECLARE
						sys_ErrMessage VARCHAR (200) ; 
		DECLARE
							IsSuc TINYINT (1) ; 
		DECLARE
		
		CONTINUE HANDLER FOR SQLEXCEPTION 
		BEGIN
			GET DIAGNOSTICS CONDITION 1 sys_ErrCode = RETURNED_SQLSTATE,
			sys_ErrMessage = MESSAGE_TEXT ;
	 END ;
							
		SET sys_StartTime = NOW() ;
		SET p_sd = STAT_DT ;
		SET p_period = PERIOD ; -- 清空中间表 
		TRUNCATE TABLE T09_MID_YWZK_L4 ; 
		-- DELETE FROM TMP_YWZK_SUMMARY WHERE STAT_DT = p_sd ;
							
		COMMIT ; -- 开启事务 START TRANSACTION;
		-- 修改隔离级别,防止对业务表过长的共享锁占用 SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		#处理数据
		
		INSERT INTO T09_MID_YWZK_L4 (
			STAT_DT,
			OP_ORG_NUM,
			CURR_CD,
			GL_ACCT,
			GL_ACCT_LEVEL,
			GL_BAL_TYPE_CD,
			LAST_D_BAL,
			LAST_C_BAL,
			DR_AMT,
			CR_AMT,
			DR_BAL,
			CR_BAL
		) SELECT
			T.STAT_DT,
			T.OP_ORG_NUM,
			T.CURR_CD,
			T.GL_ACCT,
			'3' AS GL_ACCT_LEVEL,
			T.GL_BAL_TYPE_CD,
			T.LAST_D_BAL,
			T.LAST_C_BAL,
			T.DR_AMT,
			T.CR_AMT,
			T.DR_BAL,
			T.CR_BAL
	 FROM
			T09_GL_SUBJ_MONTH T
  WHERE 1 = 1
	 AND T.STAT_DT = p_sd
 UNION
  SELECT
   T.STAT_DT,
   T.OP_ORG_NUM,
   T.CURR_CD,
   C.GL_ACCT2 AS GL_ACCT,
   '2' AS GL_ACCT_LEVEL,
   T.GL_BAL_TYPE_CD,
   SUM(T.LAST_D_BAL) AS LAST_D_BAL,
   SUM(T.LAST_C_BAL) AS LAST_C_BAL,
   SUM(T.DR_AMT) AS DR_AMT,
   SUM(T.CR_AMT) AS CR_AMT,
   SUM(T.DR_BAL) AS DR_BAL,
   SUM(T.CR_BAL) AS CR_BAL
  FROM T09_GL_SUBJ_MONTH T,
			 T00_GL_ACCT_TREE C
  WHERE 1 = 1
   AND T.STAT_DT = p_sd
   AND T.GL_ACCT = C.GL_ACCT3
  GROUP BY T.STAT_DT,T.OP_ORG_NUM,T.CURR_CD,C.GL_ACCT2,T.GL_BAL_TYPE_CD
UNION
 SELECT
 	T.STAT_DT,
 	T.OP_ORG_NUM,
 	T.CURR_CD,
 	C.GL_ACCT1 AS GL_ACCT,
 	'1' AS GL_ACCT_LEVEL,
 	T.GL_BAL_TYPE_CD,
 	SUM(T.LAST_D_BAL) AS LAST_D_BAL,
 	SUM(T.LAST_C_BAL) AS LAST_C_BAL,
 	SUM(T.DR_AMT) AS DR_AMT,
 	SUM(T.CR_AMT) AS CR_AMT,
 	SUM(T.DR_BAL) AS DR_BAL,
 	SUM(T.CR_BAL) AS CR_BAL
 FROM
 	T09_GL_SUBJ_MONTH T,
 	T00_GL_ACCT_TREE C 
 WHERE 1 = 1
  AND T.STAT_DT = p_sd
  AND T.GL_ACCT = C.GL_ACCT3
 GROUP BY T.STAT_DT, 	T.OP_ORG_NUM, 	T.CURR_CD, 	C.GL_ACCT1, 	T.GL_BAL_TYPE_CD 
 
 ; 
 INSERT INTO T09_YWZK_SUMMARY 
 (
  STAT_DT,
  OP_ORG_NUM,
  ORG_LEVEL,
  CURR_CD,
  PERIOD,
  GL_ACCT,
  GL_ACCT_LEVEL,
  GL_BAL_TYPE_CD,
  LAST_D_BAL,
  LAST_C_BAL,
  DR_AMT,
  CR_AMT,
  DR_BAL,
  CR_BAL
 ) SELECT
  T.STAT_DT,
  T.OP_ORG_NUM,
  '4' AS ORG_LEVEL,
  T.CURR_CD,
  p_period,
  T.GL_ACCT,
  T.GL_ACCT_LEVEL,
  T.GL_BAL_TYPE_CD,
  T.LAST_D_BAL,
  T.LAST_C_BAL,
  T.DR_AMT,
  T.CR_AMT,
  T.DR_BAL,
  T.CR_BAL
 FROM
  T09_MID_YWZK_L4 T
 WHERE 1 = 1
  AND T.STAT_DT = p_sd
 UNION
  SELECT
  	T.STAT_DT,
  	G.MAGT_ORG_NUM AS OP_ORG_NUM,
  	'3' AS ORG_LEVEL,
  	T.CURR_CD,
  	p_period,
  	T.GL_ACCT,
  	T.GL_ACCT_LEVEL,
  	T.GL_BAL_TYPE_CD,
  	SUM(T.LAST_D_BAL) AS LAST_D_BAL,
  	SUM(T.LAST_C_BAL) AS LAST_C_BAL,
  	SUM(T.DR_AMT) AS DR_AMT,
  	SUM(T.CR_AMT) AS CR_AMT,
  	SUM(T.DR_BAL) AS DR_BAL,
  	SUM(T.CR_BAL) AS CR_BAL
  FROM
  	T09_MID_YWZK_L4 T,
  	T00_GL_MS_ORG_HIER G 
  WHERE 1 = 1
  AND T.STAT_DT = p_sd
  AND T.OP_ORG_NUM = G.OP_ORG_NUM
  AND G.ORG_LEVEL = '4'
  GROUP BY   	T.STAT_DT,  	G.MAGT_ORG_NUM,  	T.CURR_CD,  	T.GL_ACCT,  	T.GL_ACCT_LEVEL,  	T.GL_BAL_TYPE_CD 
  
  ; 
  -- 恢复隔离级别 SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
												-- 事务提交/回滚模块
		IF sys_ErrCode <> '00000' THEN

		SET IsSuc = 0 ; ROLLBACK ;
		ELSE

		SET IsSuc = 1 ; COMMIT ;
		END
		IF ; -- 日志记录生成模块
		INSERT INTO sys_procedurelog (
			IsSuccess,
			Logger,
			ProcedureName,
			TimeSpan,
			ErrCode,
			ErrMessage,
			LogTime
		) SELECT
			IsSuc AS IsSuccess,
			'RCJC_INDIC' AS Logger,
			'P09_GL_TO_MODLE' AS ProcedureName,
			TIMESTAMPDIFF(SECOND, sys_StartTime, NOW()) AS TimeSpan,

		IF (
			sys_ErrCode = '00000',
			NULL,
			sys_ErrCode
		) AS ErrCode,

	IF (
		sys_ErrCode = '00000',
		NULL,
		sys_ErrMessage
	) AS ErrMessage,
	NOW() AS LogTime ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for P09_MODLE_TO_INDIC
-- ----------------------------
DROP PROCEDURE IF EXISTS `P09_MODLE_TO_INDIC`;
DELIMITER ;;
CREATE PROCEDURE `P09_MODLE_TO_INDIC`(STAT_DT date,
	PERIOD VARCHAR (8))
BEGIN
	/*   
		#Author: ql
		#Create: 2021-01-19
		#存储过程示例
		#按公式计算指标
	  */

	-- 当期
	DECLARE
		p_sd date;
	-- 上期
	DECLARE
		p_last_prior date;
	-- 去年同期
	DECLARE
		p_last_year date; 

	DECLARE
		p_period VARCHAR (1);

	SET p_sd = STAT_DT;
	SET p_period = PERIOD;


	# 设置上期日期
	IF p_period = 'M' THEN 

		SELECT DATE_SUB(DATE_SUB( p_sd ,INTERVAL EXTRACT(DAY FROM p_sd) DAY),INTERVAL 0 MONTH) INTO p_last_prior   ;  -- 月

	ELSEIF p_period = 'Q' THEN
   
		SELECT DATE_SUB( p_sd ,interval 1 QUARTER) INTO p_last_prior ;  -- 季 

	ELSEIF p_period = 'Y' THEN
   
		SELECT DATE_SUB( p_sd ,INTERVAL 1 YEAR) INTO p_last_prior ;  -- 年 

	ELSE
		SET p_last_prior = 'D'  ;-- 日 

	END IF
;
	

	# 设置去年同期
	SELECT DATE_SUB( p_sd ,INTERVAL 1 YEAR) INTO p_last_year ;  
	

-- 清理中间表
TRUNCATE TABLE T09_MID_RM_INDIC;

CALL P09_MODLE_TO_INDIC_1 (p_sd, p_period);

CALL P09_MODLE_TO_INDIC_2 (p_sd, p_period);

CALL P09_MODLE_TO_INDIC_3 (p_sd, p_period);

CALL P09_MODLE_TO_INDIC_4 (p_sd, p_period); 

INSERT INTO T09_RM_INDIC (
	INDIC_KEY,
	INDIC_NAME,
	INDIC_TYPE,
	STAT_DT,
	ORG_NUM,
	ORG_LEVEL,
	CURR_CD,
	PERIOD,
  IND_VAL,
  IND_AVG,
  IND_LAST_Y_VAL,
  IND_LAST_P_VAL ,
  IND_BEGIN_Y_VAL,
	SCORE,
	SETCODE
) SELECT
	T.INDIC_KEY,
	T.INDIC_NAME,
	T.INDIC_TYPE,
	T.STAT_DT,
	T.ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD,
	GET_REPORT_VALUE (L.BAL_TYPE_CD, T.IND_VAL) AS IND_VAL,
  T.IND_AVG,
  R2.IND_VAL AS IND_LAST_Y_VAL,
  R1.IND_VAL AS IND_LAST_P_VAL ,
  T.IND_BEGIN_Y_VAL,
	T.SCORE,
	T.SETCODE
FROM
	T09_MID_RM_INDIC T 
		INNER JOIN T00_INDIC_LIST L ON T.INDIC_KEY = CONCAT(L.TB, '_', L.TYPE, '_', L.NBR) 
		LEFT JOIN T09_MID_RM_INDIC R1 ON T.INDIC_KEY = R1.INDIC_KEY AND T.ORG_NUM = R1.ORG_NUM AND T.CURR_CD = R1.CURR_CD AND T.PERIOD = R1.PERIOD AND R1.STAT_DT = p_last_prior   
		LEFT JOIN T09_MID_RM_INDIC R2 ON T.INDIC_KEY = R2.INDIC_KEY AND T.ORG_NUM = R2.ORG_NUM AND T.CURR_CD = R2.CURR_CD AND T.PERIOD = R2.PERIOD AND R2.STAT_DT = p_last_year   
WHERE 1 = 1 
	AND T.STAT_DT = p_sd  
;

COMMIT;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for P09_MODLE_TO_INDIC_1
-- ----------------------------
DROP PROCEDURE IF EXISTS `P09_MODLE_TO_INDIC_1`;
DELIMITER ;;
CREATE PROCEDURE `P09_MODLE_TO_INDIC_1`(STAT_DT date,
	PERIOD VARCHAR (8))
BEGIN
	/*   
		#Author: ql
		#Create: 2021-01-19
		#存储过程示例
		#按公式计算指标
	  */
	DECLARE
		p_sd date;

DECLARE
	p_period VARCHAR (1);

DECLARE
	P_max_level INT (11);

DECLARE
	i INT DEFAULT 1;

DECLARE
	sys_StartTime datetime;

DECLARE
	sys_ErrCode VARCHAR (5) DEFAULT '00000';

DECLARE
	sys_ErrMessage VARCHAR (200);

DECLARE
	IsSuc TINYINT (1);

DECLARE
	CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
	GET DIAGNOSTICS CONDITION 1 sys_ErrCode = RETURNED_SQLSTATE,
	sys_ErrMessage = MESSAGE_TEXT;

END;

SET sys_StartTime = NOW();

SET p_sd = STAT_DT;

SET p_period = PERIOD;

SELECT
	MAX(INDIC_LEVEL) INTO p_max_level
FROM
	V09_INDIC_MAP
WHERE
	TB = 'ZCFZ'
AND IS_VALID = '1'
;

-- 处理数据 1.资产负债入库
INSERT INTO T09_MID_RM_INDIC (
	INDIC_KEY,
	INDIC_NAME,
	INDIC_TYPE,
	STAT_DT,
	ORG_NUM,
	ORG_LEVEL,
	CURR_CD,
	PERIOD,
	IND_VAL 
) SELECT
	CONCAT(M.TB, '_', M.TYPE, '_', M.NBR) AS INDIC_KEY,
	M.INDIC_NAME,
	'1' AS INDIC_TYPE,
	T.STAT_DT,
	T.OP_ORG_NUM AS ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD,
	SUM(
		GEN_OFFSET_VAL (
			M.GL_BAL_TYPE_CD,
			T.DR_BAL,
			T.CR_BAL
		)
	) AS IND_VAL 
FROM
	T09_YWZK_SUMMARY T,
	V09_INDIC_MAP M 
WHERE
	1 = 1
AND T.GL_ACCT = M.INDIC_KEY
AND M.TB = 'ZCFZ'
AND M.IS_VALID = '1'
AND M.INDIC_LEVEL = 0
AND T.STAT_DT = p_sd
AND T.PERIOD = p_period
GROUP BY
	M.TB,
	M.TYPE,
	M.NBR,
	M.INDIC_NAME,
	T.STAT_DT,
	T.OP_ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD;

-- 事务提交/回滚模块
IF sys_ErrCode <> '00000' THEN

SET IsSuc = 0;

ROLLBACK;


ELSE

SET IsSuc = 1;

COMMIT;


END
IF;

-- 日志记录生成模块
INSERT INTO sys_procedurelog (
	IsSuccess,
	Logger,
	ProcedureName,
	TimeSpan,
	ErrCode,
	ErrMessage,
	LogTime
) SELECT
	IsSuc AS IsSuccess,
	'RCJC_INDIC' AS Logger,
	'P09_MODLE_TO_INDIC_1_1' AS ProcedureName,
	TIMESTAMPDIFF(SECOND, sys_StartTime, NOW()) AS TimeSpan,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrCode
) AS ErrCode,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrMessage
) AS ErrMessage,
 NOW() AS LogTime;


WHILE i <= P_max_level DO
	INSERT INTO T09_MID_RM_INDIC (
		INDIC_KEY,
		INDIC_NAME,
		INDIC_TYPE,
		STAT_DT,
		ORG_NUM,
		ORG_LEVEL,
		CURR_CD,
		PERIOD,
	  IND_VAL 
	) SELECT
		CONCAT(M.TB, '_', M.TYPE, '_', M.NBR) AS INDIC_KEY,
		M.INDIC_NAME,
		'1' AS INDIC_TYPE,
		I.STAT_DT,
		I.ORG_NUM,
		I.ORG_LEVEL,
		I.CURR_CD,
		I.PERIOD,
		SUM(I.IND_VAL) AS IND_VAL 
 FROM
		V09_INDIC_MAP M,
		T09_MID_RM_INDIC I 
 WHERE
		1 = 1
	AND M.INDIC_KEY = I.INDIC_KEY
	AND M.INDIC_LEVEL = i
	AND I.STAT_DT = p_sd
	AND I.PERIOD = p_period
	AND M.TB = 'ZCFZ'
	GROUP BY
		M.TB,
		M.TYPE,
		M.NBR,
		M.INDIC_NAME,
		I.STAT_DT,
		I.ORG_NUM,
		I.ORG_LEVEL,
		I.CURR_CD,
		I.PERIOD;

-- SELECT i; 
COMMIT;


SET i = i + 1;


END
WHILE;

-- 事务提交/回滚模块
IF sys_ErrCode <> '00000' THEN

SET IsSuc = 0;

ROLLBACK;


ELSE

SET IsSuc = 1;

COMMIT;


END
IF;

-- 日志记录生成模块
INSERT INTO sys_procedurelog (
	IsSuccess,
	Logger,
	ProcedureName,
	TimeSpan,
	ErrCode,
	ErrMessage,
	LogTime
) SELECT
	IsSuc AS IsSuccess,
	'RCJC_INDIC' AS Logger,
	'P09_MODLE_TO_INDIC_1_2' AS ProcedureName,
	TIMESTAMPDIFF(SECOND, sys_StartTime, NOW()) AS TimeSpan,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrCode
) AS ErrCode,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrMessage
) AS ErrMessage,
 NOW() AS LogTime;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for P09_MODLE_TO_INDIC_2
-- ----------------------------
DROP PROCEDURE IF EXISTS `P09_MODLE_TO_INDIC_2`;
DELIMITER ;;
CREATE PROCEDURE `P09_MODLE_TO_INDIC_2`(STAT_DT date,
	PERIOD VARCHAR (8))
BEGIN
	/*   
		#Author: ql
		#Create: 2021-01-19
		#存储过程示例
		#按公式计算指标
	  */
	DECLARE
		p_sd date;

DECLARE
	p_period VARCHAR (1);

DECLARE
	P_max_level INT (11);

DECLARE
	i INT DEFAULT 0;

DECLARE
	sys_StartTime datetime;

DECLARE
	sys_ErrCode VARCHAR (5) DEFAULT '00000';

DECLARE
	sys_ErrMessage VARCHAR (200);

DECLARE
	IsSuc TINYINT (1);

DECLARE
	CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
	GET DIAGNOSTICS CONDITION 1 sys_ErrCode = RETURNED_SQLSTATE,
	sys_ErrMessage = MESSAGE_TEXT;


END;


SET sys_StartTime = NOW();


SET p_sd = STAT_DT;


SET p_period = PERIOD;

SELECT
	MAX(INDIC_LEVEL) INTO p_max_level
FROM
	V09_INDIC_MAP
WHERE
	TB = 'LR'
AND IS_VALID = '1';

TRUNCATE TABLE T09_MID_RM_INDIC_ADJUST;
TRUNCATE TABLE T09_MID_RM_INDIC_LR;

INSERT INTO T09_MID_RM_INDIC_ADJUST 
 SELECT
	T.STAT_DT,
	CASE WHEN SUM(T.DR_AMT + T.CR_AMT) <= 0 THEN 'LR_A_103' ELSE 'LR_A_104' END INDIC_KEY,
	T.OP_ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD,
 SUM(T.DR_AMT + T.CR_AMT) IND_VAL 
FROM
	T09_YWZK_SUMMARY T 
WHERE 1 = 1
AND T.GL_ACCT IN ('5003000000', '5203000000')
AND T.STAT_DT = date('2020-11-30')
AND T.PERIOD = 'M'
GROUP BY 	T.STAT_DT,	T.OP_ORG_NUM,	T.ORG_LEVEL,	T.CURR_CD,	T.PERIOD
UNION
	SELECT
		T.STAT_DT,
		T.OP_ORG_NUM,
		T.ORG_LEVEL,
		T.CURR_CD,
		T.PERIOD,
	CASE WHEN SUM(T.DR_AMT + T.CR_AMT) <= 0 THEN 'LR_A_113' ELSE 'LR_B_118' END INDIC_KEY,
	SUM(T.DR_AMT + T.CR_AMT) IND_VAL 
FROM
	T09_YWZK_SUMMARY T
WHERE
	1 = 1
AND T.GL_ACCT IN ('5004210000', '5204210000')
AND T.STAT_DT = date('2020-11-30')
AND T.PERIOD = 'M'
GROUP BY 	T.STAT_DT,	T.OP_ORG_NUM,	T.ORG_LEVEL,	T.CURR_CD,	T.PERIOD 


;

 COMMIT; 

-- 处理数据 2.利润表入库		
INSERT INTO T09_MID_RM_INDIC_LR (
	INDIC_KEY,
	INDIC_NAME,
	INDIC_TYPE,
	STAT_DT,
	ORG_NUM,
	ORG_LEVEL,
	CURR_CD,
	PERIOD,
	IND_VAL 
) SELECT
	CONCAT(M.TB, '_', M.TYPE, '_', M.NBR) AS INDIC_KEY,
	M.INDIC_NAME,
	'2' AS INDIC_TYPE,
	T.STAT_DT,
	T.OP_ORG_NUM AS ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD,
	SUM(
		GEN_OFFSET_VAL (
			M.GL_BAL_TYPE_CD,
			T.DR_AMT,
			T.CR_AMT
		)
	) AS IND_VAL 
FROM
	T09_YWZK_SUMMARY T,
	V09_INDIC_MAP M 
WHERE 1 = 1 
AND T.GL_ACCT = M.INDIC_KEY
AND M.TB = 'LR'
AND M.IS_VALID = '1'
AND M.INDIC_LEVEL = 0
AND T.STAT_DT = p_sd
AND T.PERIOD = p_period
GROUP BY 	M.TB,	M.TYPE,	M.NBR,	M.INDIC_NAME,	T.STAT_DT,	T.OP_ORG_NUM,	T.ORG_LEVEL,	T.CURR_CD,	T.PERIOD

;

COMMIT;

INSERT INTO T09_MID_RM_INDIC (
	INDIC_KEY,
	INDIC_NAME,
	INDIC_TYPE,
	STAT_DT,
	ORG_NUM,
	ORG_LEVEL,
	CURR_CD,
	PERIOD,
	IND_VAL 
) SELECT
	T.INDIC_KEY,
	T.INDIC_NAME,
	T.INDIC_TYPE,
	T.STAT_DT,
	T.ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD,
	T.IND_VAL + IFNULL(J.IND_VAL, 0) AS IND_VAL 
FROM
	T09_MID_RM_INDIC_LR T
LEFT JOIN T09_MID_RM_INDIC_ADJUST J ON T.INDIC_KEY = J.INDIC_KEY
AND T.ORG_NUM = J.OP_ORG_NUM
AND T.STAT_DT = J.STAT_DT
AND T.PERIOD = J.PERIOD
AND T.CURR_CD = J.CURR_CD;

COMMIT;

-- 事务提交/回滚模块
IF sys_ErrCode <> '00000' THEN

SET IsSuc = 0;

ROLLBACK;


ELSE

SET IsSuc = 1;

COMMIT;


END
IF;

-- 日志记录生成模块
INSERT INTO sys_procedurelog (
	IsSuccess,
	Logger,
	ProcedureName,
	TimeSpan,
	ErrCode,
	ErrMessage,
	LogTime
) SELECT
	IsSuc AS IsSuccess,
	'RCJC_INDIC' AS Logger,
	'P09_MODLE_TO_INDIC_2_1' AS ProcedureName,
	TIMESTAMPDIFF(SECOND, sys_StartTime, NOW()) AS TimeSpan,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrCode
) AS ErrCode,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrMessage
) AS ErrMessage,
 NOW() AS LogTime;


WHILE i <= P_max_level DO
	INSERT INTO T09_MID_RM_INDIC (
		INDIC_KEY,
		INDIC_NAME,
		INDIC_TYPE,
		STAT_DT,
		ORG_NUM,
		ORG_LEVEL,
		CURR_CD,
		PERIOD,
	  IND_VAL
	) SELECT
		CONCAT(M.TB, '_', M.TYPE, '_', M.NBR) AS INDIC_KEY,
		M.INDIC_NAME,
		'2' AS INDIC_TYPE,
		I.STAT_DT,
		I.ORG_NUM,
		I.ORG_LEVEL,
		I.CURR_CD,
		I.PERIOD,
		SUM(I.IND_VAL) AS IND_VAL
 FROM 
		V09_INDIC_MAP M,
		T09_MID_RM_INDIC I 
	WHERE 1 = 1
	AND M.INDIC_KEY = I.INDIC_KEY
	AND M.INDIC_LEVEL = i
	AND I.STAT_DT = p_sd
	AND I.PERIOD = p_period
	AND M.TB = 'LR'
	GROUP BY 		M.TB,		M.TYPE,		M.NBR,		M.INDIC_NAME,		I.STAT_DT,		I.ORG_NUM,		I.ORG_LEVEL,		I.CURR_CD,		I.PERIOD
	
	;
-- SELECT i;
COMMIT;


SET i = i + 1;

################# 代码结束
END
WHILE;

-- 事务提交/回滚模块
IF sys_ErrCode <> '00000' THEN

SET IsSuc = 0;

ROLLBACK;


ELSE

SET IsSuc = 1;

COMMIT;


END
IF;

-- 日志记录生成模块
INSERT INTO sys_procedurelog (
	IsSuccess,
	Logger,
	ProcedureName,
	TimeSpan,
	ErrCode,
	ErrMessage,
	LogTime
) SELECT
	IsSuc AS IsSuccess,
	'RCJC_INDIC' AS Logger,
	'P09_MODLE_TO_INDIC_2_2' AS ProcedureName,
	TIMESTAMPDIFF(SECOND, sys_StartTime, NOW()) AS TimeSpan,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrCode
) AS ErrCode,

IF (
	sys_ErrCode = '00000',
	NULL,
	sys_ErrMessage
) AS ErrMessage,
 NOW() AS LogTime;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for P09_MODLE_TO_INDIC_3
-- ----------------------------
DROP PROCEDURE IF EXISTS `P09_MODLE_TO_INDIC_3`;
DELIMITER ;;
CREATE PROCEDURE `P09_MODLE_TO_INDIC_3`(STAT_DT date, PERIOD varchar(8))
BEGIN
	  /*   
		#Author: ql
		#Create: 2021-01-19
		#存储过程示例
		#按公式计算指标
	  */
	  DECLARE p_sd date ; 
	  DECLARE p_period varchar(1) ; 
		DECLARE P_max_level int(11);  
		DECLARE i INT DEFAULT 0 ;
	  DECLARE IsSuc tinyint(1);

	  SET p_sd = STAT_DT;
	  SET p_period = PERIOD;

		-- 处理数据 3.衍生基础指标入库
		
	INSERT INTO T09_MID_RM_INDIC
	(
	INDIC_KEY,
	INDIC_NAME,
	INDIC_TYPE,
	STAT_DT,
	ORG_NUM,
	ORG_LEVEL ,
	CURR_CD,
	PERIOD,
	IND_VAL
	)
		SELECT 
			CONCAT(M.TB,'_',M.TYPE,'_',M.NBR) AS INDIC_KEY, 
			M.INDIC_NAME, 
			'3' AS INDIC_TYPE, 
			T.STAT_DT,  
			T.OP_ORG_NUM AS ORG_NUM,  
			T.ORG_LEVEL , 
			T.CURR_CD, 
			T.PERIOD, 
			SUM(GEN_OFFSET_VAL(M.GL_BAL_TYPE_CD,T.DR_BAL,T.CR_BAL)) AS IND_VAL  
		FROM T09_YWZK_SUMMARY T ,V09_INDIC_MAP M   
		WHERE 1=1   
		AND T.GL_ACCT = M.INDIC_KEY   
		AND M.TB = 'YS' 
		AND M.TYPE = 'BASE' 
		AND M.IS_VALID = '1'   
		AND M.INDIC_LEVEL = 0 
		AND T.STAT_DT = p_sd 
		AND	T.PERIOD = p_period 
	GROUP BY M.TB,M.TYPE,M.NBR,M.INDIC_NAME,T.STAT_DT,T.OP_ORG_NUM,T.ORG_LEVEL,T.CURR_CD,T.PERIOD;



	
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for P09_MODLE_TO_INDIC_4
-- ----------------------------
DROP PROCEDURE IF EXISTS `P09_MODLE_TO_INDIC_4`;
DELIMITER ;;
CREATE PROCEDURE `P09_MODLE_TO_INDIC_4`(STAT_DT date,
	PERIOD VARCHAR (8))
BEGIN
	/*   
		#Author: ql
		#Create: 2021-01-19
		#存储过程示例
		#按公式计算指标
	  */
	DECLARE
			p_sd date ; 
	DECLARE
			p_period VARCHAR (1) ; 
	DECLARE
				P_max_level INT (11) ; 
	DECLARE
				i INT DEFAULT 0 ; 
									
	SET p_sd = STAT_DT ;
									
	SET p_period = PERIOD ; 

-- 处理数据 3.衍生基础指标入库
TRUNCATE TABLE T09_MID_RM_INDIC_YS;



INSERT INTO T09_MID_RM_INDIC_YS (
	INDIC_KEY,
	INDIC_NAME,
	INDIC_TYPE,
	STAT_DT,
	ORG_NUM,
	ORG_LEVEL,
	CURR_CD,
	PERIOD,
	IND_VAL ) 
SELECT
	'YS_JG_101' AS INDIC_KEY,
	'生息资产占比' AS INDIC_NAME,
	'3' AS INDIC_TYPE,
	T.STAT_DT,
	T.ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD,
	ROUND(abs(T.IND_VAL / T2.IND_VAL),2)  AS  IND_VAL
	FROM T09_MID_RM_INDIC T, T09_MID_RM_INDIC T2
WHERE 1 = 1  
 AND T.STAT_DT = T2.STAT_DT 
 AND T.ORG_NUM = T2.ORG_NUM
 AND T.ORG_LEVEL = T2.ORG_LEVEL
 AND T.CURR_CD = T2.CURR_CD
 AND T.PERIOD = T2.PERIOD
 AND T.STAT_DT =  p_sd 
 AND T.PERIOD =  p_period  
 AND T.INDIC_KEY = 'YS_BASE_127' /**   生息资产余额 **/  
 AND T2.INDIC_KEY = 'ZCFZ_A_127' /** 资产总计 **/   -- 440
 AND T2.IND_VAL <> 0
 UNION  
SELECT
 'YS_JG_102' AS INDIC_KEY,
 '活期存款占比' AS INDIC_NAME,
 '3' AS INDIC_TYPE,
 T1.STAT_DT,
 T1.ORG_NUM,
 T1.ORG_LEVEL,
 T1.CURR_CD,
 T1.PERIOD,
 ROUND(1 - abs(T1.IND_VAL / T2.IND_VAL),2 ) AS IND_VAL
FROM
	(SELECT
		T.STAT_DT,
		T.ORG_NUM,
		T.ORG_LEVEL,
		T.CURR_CD,
		T.PERIOD,
		SUM(T.IND_VAL) AS IND_VAL
	 FROM T09_MID_RM_INDIC T
	 WHERE 1 = 1
    AND T.STAT_DT =  p_sd 
    AND T.PERIOD =  p_period 
    AND T.INDIC_KEY IN ('YS_BASE_125','YS_BASE_126') /**   单位、个人定期存款 **/
  GROUP BY T.STAT_DT,T.ORG_NUM,T.ORG_LEVEL,T.CURR_CD,T.PERIOD) T1,
   T09_MID_RM_INDIC T2
  WHERE 1 = 1
   AND T1.STAT_DT = T2.STAT_DT
   AND T1.ORG_NUM = T2.ORG_NUM
   AND T1.ORG_LEVEL = T2.ORG_LEVEL
   AND T1.CURR_CD = T2.CURR_CD
   AND T1.PERIOD = T2.PERIOD
   AND T2.INDIC_KEY = 'ZCFZ_B_208' /** 吸收存款 **/    -- 348
   AND T2.IND_VAL <> 0
 UNION  
SELECT
	'YS_JG_103' AS INDIC_KEY,
	'净利息收入占比' AS INDIC_NAME,
	'3' AS INDIC_TYPE,
	T.STAT_DT,
	T.ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD,
	ROUND(abs(T.IND_VAL / T2.IND_VAL),2) AS IND_VAL
FROM T09_MID_RM_INDIC T, T09_MID_RM_INDIC T2
WHERE 1 = 1
  AND T.STAT_DT = T2.STAT_DT
  AND T.ORG_NUM = T2.ORG_NUM
  AND T.ORG_LEVEL = T2.ORG_LEVEL
  AND T.CURR_CD = T2.CURR_CD
  AND T.PERIOD = T2.PERIOD
  AND T.STAT_DT =  p_sd 
  AND T.PERIOD =  p_period 
  AND T.INDIC_KEY = 'LR_A_102' /**   	 (一)利息净收入 **/
  AND T2.INDIC_KEY = 'LR_A_101' /** 一 营业收入 **/
   AND T2.IND_VAL <> 0
UNION  
SELECT
  'YS_JG_104' AS INDIC_KEY,
  '中间业务收入占比' AS INDIC_NAME,
  '3' AS INDIC_TYPE,
  T.STAT_DT,
  T.ORG_NUM,
  T.ORG_LEVEL,
  T.CURR_CD,
  T.PERIOD,
  ROUND(ABS(T.IND_VAL / T2.IND_VAL),2) AS IND_VAL
FROM T09_MID_RM_INDIC T, T09_MID_RM_INDIC T2
WHERE 1 = 1
 AND T.STAT_DT = T2.STAT_DT
 AND T.ORG_NUM = T2.ORG_NUM
 AND T.ORG_LEVEL = T2.ORG_LEVEL
 AND T.CURR_CD = T2.CURR_CD
 AND T.PERIOD = T2.PERIOD
 AND T.STAT_DT =  p_sd 
 AND T.PERIOD =  p_period 
 AND T.INDIC_KEY = 'LR_A_105' /**  (二)手续费及佣金净收入 **/
 AND T2.INDIC_KEY = 'LR_A_101' /** 一 营业收入   **/
   AND T2.IND_VAL <> 0
 UNION  
SELECT
  'YS_JG_106' AS INDIC_KEY,
  '成本收入比' AS INDIC_NAME,
  '3' AS INDIC_TYPE,
  T.STAT_DT,
  T.ORG_NUM,
  T.ORG_LEVEL,
  T.CURR_CD,
  T.PERIOD,
  ROUND(abs(T.IND_VAL / T2.IND_VAL),2) AS IND_VAL
FROM T09_MID_RM_INDIC T, T09_MID_RM_INDIC T2
WHERE 1 = 1
  AND T.STAT_DT = T2.STAT_DT
  AND T.ORG_NUM = T2.ORG_NUM
  AND T.ORG_LEVEL = T2.ORG_LEVEL
  AND T.CURR_CD = T2.CURR_CD
  AND T.PERIOD = T2.PERIOD
  AND T.STAT_DT =  p_sd 
  AND T.PERIOD =  p_period 
  AND T.INDIC_KEY = 'LR_B_114' /**   二 营业支出 **/
  AND T2.INDIC_KEY = 'LR_A_101' /** 一 营业收入 404**/
   AND T2.IND_VAL <> 0
UNION  
SELECT
  'YS_AQ_112' AS INDIC_KEY,
  '存贷比' AS INDIC_NAME,
  '3' AS INDIC_TYPE,
  T.STAT_DT,
  T.ORG_NUM,
  T.ORG_LEVEL,
  T.CURR_CD,
  T.PERIOD,
  ROUND(ABS(T.IND_VAL / T2.IND_VAL),2) AS IND_VAL
FROM T09_MID_RM_INDIC T, T09_MID_RM_INDIC T2
 WHERE 1 = 1
 AND T.STAT_DT = T2.STAT_DT
 AND T.ORG_NUM = T2.ORG_NUM
 AND T.ORG_LEVEL = T2.ORG_LEVEL
 AND T.CURR_CD = T2.CURR_CD
 AND T.PERIOD = T2.PERIOD
 AND T.STAT_DT =  p_sd 
 AND T.PERIOD =  p_period 
 AND T.INDIC_KEY = 'ZCFZ_A_113' /** 存款总额 **/
 AND T2.INDIC_KEY = 'ZCFZ_B_208' /** 贷款总额 **/
   AND T2.IND_VAL <> 0
UNION  
SELECT
  'YS_AQ_113' AS INDIC_KEY,
  '不良率(非应计)' AS INDIC_NAME,
  '3' AS INDIC_TYPE,
  T1.STAT_DT,
  T1.ORG_NUM,
  T1.ORG_LEVEL,
  T1.CURR_CD,
  T1.PERIOD,
  ROUND(abs(T1.IND_VAL / T2.IND_VAL),2) AS IND_VAL
FROM
(SELECT
   T.STAT_DT,
   T.ORG_NUM,
   T.ORG_LEVEL,
   T.CURR_CD,
   T.PERIOD,
   SUM(T.IND_VAL) AS IND_VAL
   FROM  T09_MID_RM_INDIC T
   WHERE 1 = 1
   AND T.STAT_DT =  p_sd 
   AND T.PERIOD =  p_period 
   AND T.INDIC_KEY IN ('YS_BASE_144',   'YS_BASE_145',   'YS_BASE_146',   'YS_BASE_147',
   										'YS_BASE_148',   'YS_BASE_149',   'YS_BASE_150',   'YS_BASE_151',
   										'YS_BASE_152',   'YS_BASE_153',   'YS_BASE_154',   'YS_BASE_155',
   										'YS_BASE_156',   'YS_BASE_157',   'YS_BASE_158',   'YS_BASE_159')   /**   非应计 **/
   GROUP BY T.STAT_DT,T.ORG_NUM,T.ORG_LEVEL,T.CURR_CD,T.PERIOD) T1, T09_MID_RM_INDIC T2
   WHERE 1 = 1
   AND T1.STAT_DT = T2.STAT_DT
   AND T1.ORG_NUM = T2.ORG_NUM
   AND T1.ORG_LEVEL = T2.ORG_LEVEL
   AND T1.CURR_CD = T2.CURR_CD
   AND T1.PERIOD = T2.PERIOD
   AND T2.INDIC_KEY = 'ZCFZ_A_113'  /** 贷款总额  296 **/
   AND T2.IND_VAL <> 0
 UNION  
SELECT
  'YS_AQ_123' AS INDIC_KEY,
  ' 不良率(逾期+非应计)' AS INDIC_NAME,
  '3' AS INDIC_TYPE,
  T1.STAT_DT,
  T1.ORG_NUM,
  T1.ORG_LEVEL,
  T1.CURR_CD,
  T1.PERIOD,
  ROUND(abs(T1.IND_VAL / T2.IND_VAL),2) AS IND_VAL 
FROM
(SELECT
   T.STAT_DT,
   T.ORG_NUM,
   T.ORG_LEVEL,
   T.CURR_CD,
   T.PERIOD,
   SUM(T.IND_VAL) AS IND_VAL
 FROM T09_MID_RM_INDIC T 
 WHERE 1 = 1
  AND T.STAT_DT =  p_sd 
  AND T.PERIOD =  p_period 
  AND T.INDIC_KEY IN ('YS_BASE_144',			'YS_BASE_145',			'YS_BASE_146',			'YS_BASE_147',			'YS_BASE_148',
											'YS_BASE_149',			'YS_BASE_150',			'YS_BASE_151',			'YS_BASE_152',			'YS_BASE_153',
											'YS_BASE_154',			'YS_BASE_155',			'YS_BASE_156',			'YS_BASE_157',			'YS_BASE_158',
											'YS_BASE_159',			'YS_BASE_128',			'YS_BASE_129',			'YS_BASE_130',			'YS_BASE_131',
											'YS_BASE_132',			'YS_BASE_133',			'YS_BASE_134',			'YS_BASE_135',			'YS_BASE_136',
											'YS_BASE_137',			'YS_BASE_138',			'YS_BASE_139',			'YS_BASE_140',			'YS_BASE_141',
											'YS_BASE_142',			'YS_BASE_143')    /**   逾期+非应计 **/
  GROUP BY T.STAT_DT,			T.ORG_NUM,			T.ORG_LEVEL,			T.CURR_CD,			T.PERIOD	
  ) T1, T09_MID_RM_INDIC T2 
WHERE 1 = 1
  AND T1.STAT_DT = T2.STAT_DT
  AND T1.ORG_NUM = T2.ORG_NUM
  AND T1.ORG_LEVEL = T2.ORG_LEVEL
  AND T1.CURR_CD = T2.CURR_CD
  AND T1.PERIOD = T2.PERIOD
  AND T2.INDIC_KEY = 'ZCFZ_A_113' /** 贷款总额  320 **/
   AND T2.IND_VAL <> 0
 UNION  
SELECT
	'YS_XL_115' AS INDIC_KEY,
	'资产利润率' AS INDIC_NAME,
	'3' AS INDIC_TYPE,
	T.STAT_DT,
	T.ORG_NUM,
	T.ORG_LEVEL,
	T.CURR_CD,
	T.PERIOD,
	ROUND(abs(T.IND_VAL / T2.IND_VAL),2) AS IND_VAL
FROM
	T09_MID_RM_INDIC T, T09_MID_RM_AVG_INDIC T2 
WHERE 1 = 1
  AND T.STAT_DT = T2.STAT_DT
  AND T.ORG_NUM = T2.ORG_NUM
  AND T.ORG_LEVEL = T2.ORG_LEVEL
  AND T.CURR_CD = T2.CURR_CD
  AND T.PERIOD = T2.PERIOD
  AND T.STAT_DT =  p_sd 
  AND T.PERIOD =  p_period 
  AND T.INDIC_KEY = 'LR_C_119' /**   三 营业利润 **/
  AND T2.INDIC_KEY = 'ZCFZ_A_127' /** 资产总计(月平均数)  **/
   AND T2.IND_VAL <> 0
UNION  
SELECT
  'YS_XL_117' AS INDIC_KEY,
  '净利息收益率' AS INDIC_NAME,
  '3' AS INDIC_TYPE,
  T.STAT_DT,
  T.ORG_NUM,
  T.ORG_LEVEL,
  T.CURR_CD,
  T.PERIOD,
  ROUND(abs(T.IND_VAL / T2.IND_VAL),2  ) AS IND_VAL
FROM
	T09_MID_RM_INDIC T, 
	T09_MID_RM_AVG_INDIC T2 
WHERE 1 = 1
  AND T.STAT_DT = T2.STAT_DT
  AND T.ORG_NUM = T2.ORG_NUM
  AND T.ORG_LEVEL = T2.ORG_LEVEL
  AND T.CURR_CD = T2.CURR_CD
  AND T.PERIOD = T2.PERIOD
  AND T.STAT_DT =  p_sd 
  AND T.PERIOD =  p_period 
  AND T.INDIC_KEY = 'LR_A_102' /**   (一)利息净收入 **/
  AND T2.INDIC_KEY = 'YS_AVG_101' /** 资产总计(月平均数) **/
   AND T2.IND_VAL <> 0
UNION  
SELECT
 'YS_XL_118' AS INDIC_KEY,
 '贷款平均利率' AS INDIC_NAME,
 '3' AS INDIC_TYPE,
 T.STAT_DT,
 T.ORG_NUM,
 T.ORG_LEVEL,
 T.CURR_CD,
 T.PERIOD,
 ROUND( abs(T.IND_VAL / T2.IND_VAL),2 ) AS IND_VAL
FROM
	T09_MID_RM_INDIC T, T09_MID_RM_AVG_INDIC T2 
WHERE 1 = 1
  AND T.STAT_DT = T2.STAT_DT
  AND T.ORG_NUM = T2.ORG_NUM
  AND T.ORG_LEVEL = T2.ORG_LEVEL
  AND T.CURR_CD = T2.CURR_CD
  AND T.PERIOD = T2.PERIOD
  AND T.STAT_DT =  p_sd 
  AND T.PERIOD =  p_period 
  AND T.INDIC_KEY = 'YS_BASE_160' /**   贷款利息收入 **/
  AND T2.INDIC_KEY = 'ZCFZ_A_113' /** 	  发放贷款和垫款(月平均数) **/
   AND T2.IND_VAL <> 0
UNION  
SELECT
  'YS_XL_119' AS INDIC_KEY,
  '生息资产平均利率' AS INDIC_NAME,
  '3' AS INDIC_TYPE,
  T.STAT_DT,
  T.ORG_NUM,
  T.ORG_LEVEL,
  T.CURR_CD,
  T.PERIOD,
  ROUND(abs(T.IND_VAL / T2.IND_VAL),2) AS IND_VAL 
FROM
	 T09_MID_RM_INDIC T, T09_MID_RM_AVG_INDIC T2 
WHERE 1 = 1
  AND T.STAT_DT = T2.STAT_DT
  AND T.ORG_NUM = T2.ORG_NUM
  AND T.ORG_LEVEL = T2.ORG_LEVEL
  AND T.CURR_CD = T2.CURR_CD
  AND T.PERIOD = T2.PERIOD
  AND T.STAT_DT =  p_sd 
  AND T.PERIOD =  p_period 
  AND T.INDIC_KEY = 'LR_A_103' /**  利息收入  **/
  AND T2.INDIC_KEY = 'YS_AVG_101' /** 	  生息资产余额（月平均） **/
   AND T2.IND_VAL <> 0
UNION    
SELECT
  'YS_XL_120' AS INDIC_KEY,
  '存款平均利率' AS INDIC_NAME,
  '3' AS INDIC_TYPE,
  T.STAT_DT,
  T.ORG_NUM,
  T.ORG_LEVEL,
  T.CURR_CD,
  T.PERIOD,
  ROUND(abs(T.IND_VAL / T2.IND_VAL),2) AS IND_VAL
FROM T09_MID_RM_INDIC T, T09_MID_RM_AVG_INDIC T2 
WHERE 1 = 1
 AND T.STAT_DT = T2.STAT_DT
 AND T.ORG_NUM = T2.ORG_NUM
 AND T.ORG_LEVEL = T2.ORG_LEVEL
 AND T.CURR_CD = T2.CURR_CD
 AND T.PERIOD = T2.PERIOD
 AND T.STAT_DT =  p_sd 
 AND T.PERIOD =  p_period 
 AND T.INDIC_KEY = 'YS_BASE_161' /**  存款利息支出  **/
 AND T2.INDIC_KEY = 'ZCFZ_B_208' /** 	  吸收存款（月平均） **/
   AND T2.IND_VAL <> 0

;
COMMIT;

INSERT INTO T09_MID_RM_INDIC(
	INDIC_KEY,
	INDIC_NAME,
	INDIC_TYPE,
	STAT_DT,
	ORG_NUM,
	ORG_LEVEL,
	CURR_CD,
	PERIOD,
	IND_VAL ) 
SELECT 
	INDIC_KEY,
	INDIC_NAME,
	INDIC_TYPE,
	STAT_DT,
	ORG_NUM,
	ORG_LEVEL,
	CURR_CD,
	PERIOD,
	IND_VAL  
FROM T09_MID_RM_INDIC_YS
;

COMMIT ;



								
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for GEN_ACCT_VAL
-- ----------------------------
DROP FUNCTION IF EXISTS `GEN_ACCT_VAL`;
DELIMITER ;;
CREATE FUNCTION `GEN_ACCT_VAL`(P_TP varchar(2),P_DV decimal(31,9),P_CV decimal(31,9)) RETURNS decimal(31,9)
    DETERMINISTIC
BEGIN
  DECLARE str1 VARCHAR(2) DEFAULT '';
  DECLARE res1 decimal(31,9) DEFAULT 0 ;
  SET str1 = P_TP;

	IF str1 = '0' THEN 
		SET res1 = P_DV ;
  ELSEIF str1 = '1' THEN 
		SET res1 = P_CV ;
	ELSE 
		SET res1 = P_DV+P_CV ;
	END IF;
 RETURN(res1);
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for GEN_OFFSET_VAL
-- ----------------------------
DROP FUNCTION IF EXISTS `GEN_OFFSET_VAL`;
DELIMITER ;;
CREATE FUNCTION `GEN_OFFSET_VAL`(P_TP varchar(2),P_DV decimal(31,9),P_CV decimal(31,9)) RETURNS decimal(31,9)
    DETERMINISTIC
BEGIN
  DECLARE str1 VARCHAR(2) DEFAULT '';
  DECLARE res1 decimal(31,9) DEFAULT 0 ;
  SET str1 = P_TP;

  IF ( str1 = 'S' ) THEN 
		SET res1 = P_DV+P_CV ;
	ELSEIF (str1 = 'D' and (P_DV+P_CV) > 0) THEN 
		SET res1 = P_DV+P_CV ;
  ELSEIF (str1 = 'D' and (P_DV+P_CV) < 0) THEN 
		SET res1 = 0 ;
  ELSEIF (str1 = 'C' and (P_DV+P_CV) > 0) THEN 
		SET res1 = 0 ;
  ELSEIF (str1 = 'C' and (P_DV+P_CV) < 0) THEN 
		SET res1 = P_DV+P_CV ;
	ELSE 
		SET res1 = NULL ;
	END IF;
 RETURN(res1);
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for GEN_YWZK_ACCT_VAL
-- ----------------------------
DROP FUNCTION IF EXISTS `GEN_YWZK_ACCT_VAL`;
DELIMITER ;;
CREATE FUNCTION `GEN_YWZK_ACCT_VAL`(P_TP varchar(2),P_DV decimal(31,9),P_CV decimal(31,9)) RETURNS decimal(31,9)
    DETERMINISTIC
BEGIN
  DECLARE str1 VARCHAR(2) DEFAULT '';
  DECLARE res1 decimal(31,9) DEFAULT 0 ;
  SET str1 = P_TP;

	IF str1 = '0' THEN 
		SET res1 = P_DV ;
  ELSEIF str1 = '1' THEN 
		SET res1 = P_CV ;
	ELSE 
		SET res1 = P_DV+P_CV ;
	END IF;
 RETURN(res1);
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for GET_REPORT_VALUE
-- ----------------------------
DROP FUNCTION IF EXISTS `GET_REPORT_VALUE`;
DELIMITER ;;
CREATE FUNCTION `GET_REPORT_VALUE`(P_TP varchar(1),P_V decimal(31,9)) RETURNS decimal(31,9)
    DETERMINISTIC
BEGIN
  DECLARE str1 VARCHAR(1);
  DECLARE res1 decimal(31,9) ;
  SET str1 = P_TP;

	IF (str1 = 'D' AND P_V > 0) THEN 
		SET res1 = P_V ;
	ELSEIF (str1 = 'D' AND P_V < 0) THEN 
		SET res1 = -1*P_V ;
	ELSEIF (str1 = 'C' AND P_V > 0) THEN 
		SET res1 = -1*P_V ;
	ELSEIF (str1 = 'C' AND P_V < 0) THEN 
		SET res1 = abs(P_V) ;
	ELSE 
		SET res1 = 0 ;
	END IF;
 RETURN(res1);
END
;;
DELIMITER ;
