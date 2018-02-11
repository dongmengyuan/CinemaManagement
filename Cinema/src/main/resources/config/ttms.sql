
-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` varchar(20) NOT NULL,
  `emp_pass` varchar(20) NOT NULL COMMENT '密码',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户类型：0为普通用户，1是管理员',
  `emp_name` varchar(100) NOT NULL,
  `emp_tel_num` varchar(20) DEFAULT NULL,
  `emp_addr` varchar(200) DEFAULT NULL,
  `emp_email` varchar(100) DEFAULT NULL,
  `emp_sex` varchar(5) DEFAULT NULL ,
  `emp_birth` varchar(20) DEFAULT NULL ,
  `emp_native` varchar(60) DEFAULT NULL,
   PRIMARY KEY (`emp_id`),
  UNIQUE KEY `emp_no` (`emp_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '001', '张三', '11111', '长安南路563号', '111@163.com');
INSERT INTO `employee` VALUES ('2', '002', '李四', '22222', '莲湖路22号', '222@21cn.com');
INSERT INTO `employee` VALUES ('3', '003', '王五', '33333', '东五路33号', '333@yeah.net');
INSERT INTO `employee` VALUES ('4', '004', '刘六', '44444', '西一路44号', '444@sina.com.cn');
INSERT INTO `employee` VALUES ('5', '005', '郑七', '55555', '南稍门55号', '555@tom.com');
INSERT INTO `employee` VALUES ('6', '006', '李念', '66666', '大溪地66号', '666@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('7', '007', '凌霜华', '77777', '大溪地77号', '777@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('8', '008', '景茵梦', '88888', '大溪地88号', '888@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('9', '009', '任水寒', '99999', '大溪地99号', '999@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('10', '010', '丁玲珑', '10101', '大溪地10号', '100@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('11', '011', '柳兰歌', '11111', '大溪地11号', '111@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('12', '012', '燕七', '12121', '大溪地12号', '121@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('13', '013', '丁典', '13131', '大溪地13号', '131@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('14', '014', '袁冠南', '14141', '大溪地14号', '141@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('15', 'guest04', '老胡', '17812345678', '吉祥村004号', 'laohu@tom.com');
INSERT INTO `employee` VALUES ('16', 'guest05', '老钱', '15612345678', '西斜七路005号', 'laoqian@yahoo.com.cn');
INSERT INTO `employee` VALUES ('17', 'guest06', '老章', '18710905922', '西长安街121号', 'laozhang@sohu.com');
-- ----------------------------
-- Table structure for play
-- ----------------------------
DROP TABLE IF EXISTS `play`; 
CREATE TABLE `play` (
  `play_id` int(11) NOT NULL AUTO_INCREMENT,
  `play_type` varchar(100) DEFAULT NULL,
  `play_lang` varchar(20) DEFAULT NULL,
  `play_name` varchar(200) DEFAULT NULL,
  `play_introduction` varchar(2000) DEFAULT NULL,
  `play_image` varchar(200),
  `play_length` int(11) DEFAULT NULL,
  `play_ticket_price` decimal(10,2) DEFAULT NULL,
  `play_status` smallint(6) DEFAULT NULL COMMENT '取值含义：\r\n            0：待安排演出\r\n            1：已安排演出\r\n            -1：下线',
  PRIMARY KEY (`play_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of play
-- ----------------------------

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale` (
  `sale_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `sale_time` datetime DEFAULT NULL,
  `sale_payment` decimal(10,2) DEFAULT NULL,
  `sale_change` decimal(10,2) DEFAULT NULL,
  `sale_type` smallint(6) DEFAULT NULL COMMENT '类别取值含义：\r\n            1：销售单\r\n            -1：退款单',
  `sale_status` smallint(6) DEFAULT NULL COMMENT '销售单状态如下：\r\n            0：代付款\r\n            1：已付款',
  PRIMARY KEY (`sale_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale
-- ----------------------------

-- ----------------------------
-- Table structure for sale_item
-- ----------------------------
DROP TABLE IF EXISTS `sale_item`;
CREATE TABLE `sale_item` (
  `sale_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) DEFAULT NULL,
  `sale_ID` bigint(20) DEFAULT NULL,
  `sale_item_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sale_item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_item
-- ----------------------------

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `sched_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) NOT  NULL DEFAULT NULL,
  `play_id` int(11) NOT NULL DEFAULT NULL,
  `sched_time` datetime NOT NULL,
  `sched_ticket_price` decimal(10,2) NOT NULL DEFAULT NULL,
  PRIMARY KEY (`sched_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule
-- ----------------------------

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) DEFAULT NULL,
  `seat_row` int(11) DEFAULT NULL,
  `seat_column` int(11) DEFAULT NULL,
  `seat_status` smallint(6) DEFAULT NULL COMMENT '取值含义：\r\n                       0：此处是空位，没有安排座椅\r\n                       1：完好的座位，可以使用\r\n                       -1：座位损坏，不能安排座位',
  PRIMARY KEY (`seat_id`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seat
-- ----------------------------

-- ----------------------------
-- Table structure for studio
-- ----------------------------
DROP TABLE IF EXISTS `studio`; 
CREATE TABLE `studio` (
  `studio_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_name` varchar(100) NOT NULL,
  `studio_row_count` int(11) DEFAULT NULL,
  `studio_col_count` int(11) DEFAULT NULL,
  `studio_introduction` varchar(2000) DEFAULT NULL,
  `studio_flag` smallint(6) DEFAULT NULL COMMENT '取值含义：\r\n                        0：尚未生成座位，可以根据行列信息生成座位\r\n                        1：已经根据影厅的座位信息安排了座位，不能再安排座位；\r\n                        -1：影厅损坏或者废弃，不能使用',
  PRIMARY KEY (`studio_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studio
-- ----------------------------

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `ticket_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seat_id` int(11) DEFAULT NULL,
  `sched_id` int(11) DEFAULT NULL,
  `ticket_price` decimal(10,2) DEFAULT NULL,
  `ticket_status` smallint(6) DEFAULT NULL COMMENT '含义如下：\r\n            0：待销售\r\n            1：锁定\r\n            9：卖出',
  `ticket_locked_time` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ticket
-- ----------------------------



-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`(
  `notice_id` int NOT NULL COMMENT '公告号',
  `notice_time` datetime DEFAULT NULL COMMENT '公告时间',
  `notice_title` varchar(60) DEFAULT NULL COMMENT '公告题目',
  `notice_content` text DEFAULT NULL COMMENT '公告内容',
  PRIMARY KEY(`notice_id`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8;