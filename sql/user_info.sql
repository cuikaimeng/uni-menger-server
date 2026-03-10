CREATE TABLE `user_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `weixin` varchar(45) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `sex` int DEFAULT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  `compa` varchar(500) DEFAULT NULL,
  `compb` varchar(500) DEFAULT NULL,
  `theme` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3

-- 查询用户列表
SELECT * FROM user_info;
-- 根据phone查询用户
SELECT * FROM user_info WHERE phone = '15735104241';

-- 新增用户
INSERT INTO user_info (role, name, phone, weixin, password, email, sex, avatar, compa, compb, theme)
VALUES ('admin', '萌先生', '15735104241', 'ckm15735104241', 'ckm15735104241', 'm15735104241@163.com', 1, 'avatar_15735104241', 'clock,eventReminder', 'photo,bloodPressure,heartRate', 'light');
INSERT INTO user_info (role, name, phone, weixin, password, email, sex, avatar, compa, compb, theme)
VALUES ('normal', '萌二', '18892288536', 'lyl1782070827', '123456', 'lvyanlin510@163.com', 2, 'avatar_18892288536', 'clock,eventReminder', 'photo,bloodPressure,heartRate', 'light');

-- 用户登录
SELECT * FROM user_info WHERE phone = '15735104241' AND password = 'ckm15735104241';