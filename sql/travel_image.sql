CREATE TABLE `travel_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `travel_id` int DEFAULT NULL,
  `travel_image` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3