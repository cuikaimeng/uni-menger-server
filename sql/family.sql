CREATE TABLE `family` (
  `id` int NOT NULL AUTO_INCREMENT,
  `family_name` varchar(45) DEFAULT NULL, -- 家庭名称
  `family_slogan` varchar(100) DEFAULT NULL, -- 家庭标语
  `family_create_time` varchar(45) DEFAULT NULL, -- 创建时间（YYYY-MM-DD HH:mm:ss）
	`family_create_user` varchar(45) DEFAULT NULL, -- 创建人（id）
  `family_update_time` varchar(45) DEFAULT NULL, -- 更新时间
  `family_update_user` varchar(45) DEFAULT NULL, -- 更新人（id）
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3