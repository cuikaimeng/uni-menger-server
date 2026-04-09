CREATE TABLE `sys_dict_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dict_name` varchar(100) DEFAULT NULL COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT NULL COMMENT '字典类型（编码）',
  `status` int DEFAULT NULL COMMENT '0: 正常 1: 停用',
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


