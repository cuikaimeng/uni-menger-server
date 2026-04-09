CREATE TABLE `sys_dict_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dict_type` varchar(100) DEFAULT NULL,
  `dict_label` varchar(100) DEFAULT NULL,
  `dict_value` varchar(100) DEFAULT NULL,
  `dict_sort` int DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 新增数据（证件类型字典数据)
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, color, status, remark) VALUES ('IDCARD_TYPE', '身份证', 'ID_CARD', 1, NULL, 0, '');
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, color, status, remark) VALUES ('IDCARD_TYPE', '户口本', 'HOUSEHOLD_REG', 2, NULL, 0, '');
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, color, status, remark) VALUES ('IDCARD_TYPE', '护照', 'PASSPORT', 3, NULL, 0, '');
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, color, status, remark) VALUES ('IDCARD_TYPE', '出生证明', 'BIRTH_CERT', 4, NULL, 0, '');
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, color, status, remark) VALUES ('IDCARD_TYPE', '驾驶证', 'DRIVING_CERT', 5, NULL, 0, '');
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, color, status, remark) VALUES ('IDCARD_TYPE', '行车证', 'VEHICLE_CERT', 6, NULL, 0, '');
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, color, status, remark) VALUES ('IDCARD_TYPE', '银行卡', 'BANK_CARD', 7, NULL, 0, '');
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, color, status, remark) VALUES ('IDCARD_TYPE', '信用卡', 'CREDIT_CARD', 8, NULL, 0, '');
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, color, status, remark) VALUES ('IDCARD_TYPE', '结婚证', 'MARRIAGE_CERT', 9, NULL, 0, '');
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, color, status, remark) VALUES ('IDCARD_TYPE', '房产证', 'PROPERTY_CERT', 10, NULL, 0, '');
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, color, status, remark) VALUES ('IDCARD_TYPE', '毕业证', 'DIPLOMA', 11, NULL, 0, '');
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, color, status, remark) VALUES ('IDCARD_TYPE', '学位证', 'DEGREE_CERT', 12, NULL, 0, '');
INSERT INTO sys_dict_data (dict_type, dict_label, dict_value, dict_sort, color, status, remark) VALUES ('IDCARD_TYPE', '其他', 'OTHER', 99, NULL, 0, '');

