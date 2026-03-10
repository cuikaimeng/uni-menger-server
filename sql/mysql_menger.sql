CREATE TABLE `blood` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blood_high_p` int DEFAULT NULL,
  `blood_low_p` int DEFAULT NULL,
  `blood_heart` int DEFAULT NULL,
  `blood_date` varchar(45) DEFAULT NULL,
  `blood_update_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4

CREATE TABLE `family` (
  `id` int NOT NULL AUTO_INCREMENT,
  `family_name` varchar(45) DEFAULT NULL,
  `family_slogan` varchar(100) DEFAULT NULL,
  `family_create_time` varchar(45) DEFAULT NULL,
  `family_create_user` varchar(45) DEFAULT NULL,
  `family_update_time` varchar(45) DEFAULT NULL,
  `family_update_user` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4

CREATE TABLE `task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_date` varchar(45) DEFAULT NULL,
  `task_index` int DEFAULT NULL,
  `task_title` varchar(45) DEFAULT NULL,
  `task_content` varchar(45) DEFAULT NULL,
  `task_status` int DEFAULT NULL,
  `task_color` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4

CREATE TABLE `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4

CREATE TABLE `travel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `travel_title` varchar(50) DEFAULT NULL,
  `travel_content` varchar(2000) DEFAULT NULL,
  `travel_start_date` varchar(45) DEFAULT NULL,
  `travel_end_date` varchar(45) DEFAULT NULL,
  `travel_province_code` varchar(10) DEFAULT NULL,
  `travel_province_name` varchar(45) DEFAULT NULL,
  `travel_city_code` varchar(10) DEFAULT NULL,
  `travel_city_name` varchar(45) DEFAULT NULL,
  `travel_attraction` varchar(45) DEFAULT NULL,
  `travel_image` varchar(1000) DEFAULT NULL,
  `travel_update_time` varchar(45) DEFAULT NULL,
  `travel_update_user` int DEFAULT NULL,
  `travel_user_avatar` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4

CREATE TABLE `travel_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `travel_id` int DEFAULT NULL,
  `travel_image` varchar(1000) DEFAULT NULL,
  `travel_image_sort` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

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
  `列_name` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4

CREATE TABLE `user_login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `login_time` varchar(45) DEFAULT NULL,
  `login_type` varchar(45) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `login_device` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

CREATE TABLE `user_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `comp_a` varchar(1000) DEFAULT NULL,
  `comp_b` varchar(1000) DEFAULT NULL,
  `theme` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4