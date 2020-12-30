/*
 Navicat Premium Data Transfer

 Source Server         : Kirito
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : stu_course_selection

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 30/12/2020 12:38:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course_all
-- ----------------------------
DROP TABLE IF EXISTS `course_all`;
CREATE TABLE `course_all`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL COMMENT '课程编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `credit` float(255, 0) NULL DEFAULT NULL COMMENT '学分',
  `class_hours` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学时',
  PRIMARY KEY (`id`, `num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_all
-- ----------------------------
INSERT INTO `course_all` VALUES (1, 11, '大学英语', 'test1', 2, '36');
INSERT INTO `course_all` VALUES (2, 12, '高等数学', 'test2', 4, '72');
INSERT INTO `course_all` VALUES (3, 13, '线代', '无', 4, '72');
INSERT INTO `course_all` VALUES (4, 14, 'UML建模', '23333', 4, '72');
INSERT INTO `course_all` VALUES (5, 15, '算法设计', '算法', 2, '36');

-- ----------------------------
-- Table structure for course_open
-- ----------------------------
DROP TABLE IF EXISTS `course_open`;
CREATE TABLE `course_open`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL COMMENT '课程编号',
  `teacher_num` int(11) NULL DEFAULT NULL COMMENT '教师编号',
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '上课时间',
  `classroom` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地点',
  `max_members` int(11) NULL DEFAULT NULL COMMENT '最大人数',
  `select_members` int(11) NULL DEFAULT NULL COMMENT '已选人数',
  PRIMARY KEY (`id`, `num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_open
-- ----------------------------
INSERT INTO `course_open` VALUES (1, 11, 101, '周三第2节', '#1-101', 50, 0);
INSERT INTO `course_open` VALUES (2, 12, 102, '周三第5节', '#2-201', 50, 0);
INSERT INTO `course_open` VALUES (3, 13, 103, '周四第1节', '#4-411', 50, 1);
INSERT INTO `course_open` VALUES (4, 14, 104, '周一第6节', '#5-110', 50, 0);
INSERT INTO `course_open` VALUES (5, 15, 104, '周四第2节', '#4-110', 100, 1);

-- ----------------------------
-- Table structure for course_selection
-- ----------------------------
DROP TABLE IF EXISTS `course_selection`;
CREATE TABLE `course_selection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_num` int(11) NULL DEFAULT NULL COMMENT '学生编号',
  `course_num` int(11) NULL DEFAULT NULL COMMENT '课程编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_selection
-- ----------------------------
INSERT INTO `course_selection` VALUES (30, 1001, 15);
INSERT INTO `course_selection` VALUES (31, 1001, 13);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL COMMENT '学生编号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学生姓名',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话',
  `sign_in_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '入学时间',
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专业',
  PRIMARY KEY (`id`, `num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 1001, '000000', '张伟', '男', '123456', '2020/9', '计算机科学与技术');
INSERT INTO `student` VALUES (2, 1002, '000000', '楚云飞', '男', '123', '2020/9', '计算机科学与技术');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL COMMENT '教师编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '教师姓名',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`, `num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 101, '张11', '男', '123456');
INSERT INTO `teacher` VALUES (2, 102, '李22', '女', '13500000000');
INSERT INTO `teacher` VALUES (3, 103, '王33', '男', '123');
INSERT INTO `teacher` VALUES (4, 104, '张22', '女', '123456');

SET FOREIGN_KEY_CHECKS = 1;
