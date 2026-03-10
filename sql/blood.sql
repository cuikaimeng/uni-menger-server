CREATE TABLE `blood` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blood_high_p` int DEFAULT NULL,
  `blood_low_p` int DEFAULT NULL,
  `blood_heart` int DEFAULT NULL,
  `blood_date` varchar(45) DEFAULT NULL,
  `blood_update_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb3

-- 查询血压记录数据
SELECT * FROM blood;

-- 根据id排序，查询最后7条血压数据（未删除的数据）
SELECT id, blood_high_p, blood_low_p, blood_date FROM blood
ORDER BY id DESC
LIMIT 7;

-- 根据id排序，查询最后7条心率数据（未删除的数据）
SELECT id, blood_heart, blood_date FROM blood
ORDER BY id DESC
LIMIT 7;

-- 新增数据
INSERT INTO blood (blood_date, blood_high_p, blood_low_p, blood_heart, blood_update_time) VALUES (?,?,?,?,?);

-- 修改数据
UPDATE blood
SET blood_date = ?, 
		blood_high_p = ?,
		blood_low_p = ?,
		blood_heart = ?,
		blood_update_time = ?
WHERE id = ?

-- 删除数据
DELETE FROM blood WHERE id = ?;

-- 测试数据
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (110, 69, 62, '2024-01-01', '2024-01-01 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (101, 80, 60, '2024-01-04', '2024-01-04 18:53:11');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (143, 96, 67, '2024-01-07', '2024-01-07 04:26:51');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (135, 88, 69, '2024-01-08', '2024-01-08 01:55:09');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (125, 69, 96, '2024-01-11', '2024-01-11 06:59:58');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (136, 86, 82, '2024-01-14', '2024-01-14 10:16:28');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (127, 88, 75, '2024-01-16', '2024-01-16 06:33:33');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (120, 68, 63, '2024-01-17', '2024-01-17 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (135, 89, 73, '2024-01-18', '2024-01-18 14:36:56');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (131, 87, 111, '2024-01-20', '2024-01-20 06:36:16');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (118, 69, 69, '2024-01-21', '2024-01-21 03:06:21');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (106, 78, 84, '2024-01-22', '2024-01-22 23:31:50');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (122, 80, 84, '2024-01-24', '2024-01-24 21:49:37');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (122, 84, 71, '2024-01-26', '2024-01-26 09:13:00');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (103, 74, 71, '2024-01-27', '2024-01-27 15:29:03');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (108, 74, 73, '2024-01-30', '2024-01-30 23:08:36');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (140, 92, 71, '2024-02-02', '2024-02-02 14:51:34');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (139, 90, 72, '2024-02-24', '2024-02-04 06:23:31');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (112, 73, 83, '2024-02-27', '2024-02-07 21:19:09');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (101, 70, 76, '2024-02-10', '2024-02-10 20:14:11');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (107, 78, 80, '2024-02-11', '2024-02-11 07:32:01');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (112, 80, 81, '2024-02-14', '2024-02-14 19:37:33');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (144, 96, 79, '2024-02-17', '2024-02-17 00:46:21');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (145, 91, 77, '2024-02-18', '2024-02-18 05:58:21');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (131, 82, 79, '2024-02-21', '2024-02-21 01:00:51');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (130, 95, 95, '2024-02-23', '2024-02-23 09:39:48');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (100, 65, 62, '2024-02-25', '2024-02-25 06:41:39');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (105, 80, 60, '2024-02-27', '2024-02-27 20:45:31');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (130, 87, 69, '2024-02-29', '2024-02-29 19:36:30');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (101, 72, 67, '2024-03-02', '2024-03-02 05:49:54');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (126, 84, 96, '2024-03-03', '2024-03-03 16:59:12');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (108, 74, 82, '2024-03-05', '2024-03-05 22:53:12');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (109, 75, 75, '2024-03-07', '2024-03-07 01:07:33');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (112, 82, 63, '2024-03-09', '2024-03-09 17:52:22');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (116, 80, 73, '2024-03-12', '2024-03-12 21:29:16');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (119, 82, 84, '2024-03-15', '2024-03-15 07:51:34');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (109, 75, 73, '2024-03-17', '2024-03-17 22:19:53');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (126, 88, 76, '2024-03-16', '2024-03-19 04:42:38');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (128, 86, 68, '2024-03-22', '2024-03-22 07:08:09');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (124, 81, 73, '2024-03-23', '2024-03-23 18:17:59');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (119, 80, 69, '2024-03-24', '2024-03-24 00:53:12');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (124, 86, 85, '2024-03-25', '2024-03-25 18:09:48');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (114, 75, 84, '2024-03-27', '2024-03-27 22:38:13');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (119, 77, 71, '2024-03-28', '2024-03-28 18:32:51');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (127, 82, 71, '2024-03-29', '2024-03-30 20:57:07');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (124, 81, 73, '2024-04-02', '2024-04-02 23:35:10');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (114, 77, 71, '2024-04-03', '2024-04-03 13:17:19');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (119, 74, 72, '2024-04-05', '2024-04-05 04:53:37');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (109, 75, 83, '2024-04-06', '2024-04-06 15:54:08');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (111, 80, 76, '2024-04-07', '2024-04-07 18:46:05');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (128, 84, 80, '2024-04-08', '2024-04-08 12:31:54');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (131, 88, 80, '2024-04-09', '2024-04-09 03:07:16');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (137, 84, 76, '2024-04-11', '2024-04-11 10:46:13');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (134, 86, 81, '2024-04-13', '2024-04-13 16:29:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (128, 84, 79, '2024-04-16', '2024-04-16 21:23:16');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (124, 88, 77, '2024-04-17', '2024-04-17 15:29:26');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (143, 90, 78, '2024-04-18', '2024-04-18 04:17:31');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (143, 91, 78, '2024-04-19', '2024-04-19 18:52:45');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (134, 90, 79, '2024-04-20', '2024-04-20 06:03:03');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (135, 88, 95, '2024-04-23', '2024-04-23 23:00:06');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (124, 74, 82, '2024-04-25', '2024-04-25 05:14:22');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (125, 75, 73, '2024-04-26', '2024-04-26 04:01:58');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (123, 74, 82, '2024-04-29', '2024-04-29 16:10:30');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (119, 77, 86, '2024-04-30', '2024-04-30 00:07:11');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (114, 77, 78, '2024-05-02', '2024-05-02 12:55:16');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (140, 85, 78, '2024-05-03', '2024-05-03 10:32:57');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (134, 86, 63, '2024-05-04', '2024-05-04 13:12:30');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (124, 80, 62, '2024-05-06', '2024-05-06 03:04:00');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (125, 80, 60, '2024-05-07', '2024-05-07 20:16:57');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (116, 71, 69, '2024-05-10', '2024-05-10 10:08:06');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (118, 72, 67, '2024-05-11', '2024-05-11 22:08:27');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (119, 73, 96, '2024-05-14', '2024-05-14 09:09:54');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (108, 70, 82, '2024-05-15', '2024-05-15 08:35:39');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (115, 74, 75, '2024-05-16', '2024-05-16 21:22:40');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (116, 76, 63, '2024-05-19', '2024-05-19 18:33:41');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (124, 86, 66, '2024-05-20', '2024-05-20 03:00:13');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (124, 85, 73, '2024-05-21', '2024-05-21 01:55:31');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (130, 80, 84, '2024-05-24', '2024-05-24 14:34:38');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (130, 84, 88, '2024-05-25', '2024-05-25 00:19:04');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (128, 78, 81, '2024-05-28', '2024-05-28 15:45:29');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (115, 74, 73, '2024-05-31', '2024-05-31 18:38:02');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (118, 70, 76, '2024-06-03', '2024-06-03 21:33:59');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (112, 75, 68, '2024-06-04', '2024-06-04 16:20:23');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (124, 86, 73, '2024-06-06', '2024-06-06 20:34:23');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (124, 81, 110, '2024-06-07', '2024-06-07 12:16:07');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (112, 74, 69, '2024-06-08', '2024-06-08 05:36:18');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (118, 80, 84, '2024-06-09', '2024-06-09 11:56:32');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (108, 74, 72, '2024-06-12', '2024-06-12 08:12:39');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (113, 78, 72, '2024-06-14', '2024-06-14 15:04:17');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (134, 85, 71, '2024-06-15', '2024-06-15 03:28:26');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (115, 74, 73, '2024-06-16', '2024-06-16 18:56:54');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (101, 69, 77, '2024-06-17', '2024-06-17 06:30:22');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (122, 70, 78, '2024-06-20', '2024-06-20 09:45:32');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (114, 70, 81, '2024-06-21', '2024-06-21 03:54:39');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (110, 72, 78, '2024-06-24', '2024-06-24 14:19:11');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (113, 72, 82, '2024-06-26', '2024-06-26 08:30:16');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (139, 87, 91, '2024-06-27', '2024-06-27 04:07:51');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (119, 76, 83, '2024-06-29', '2024-06-29 09:46:28');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (102, 69, 76, '2024-06-30', '2024-06-30 01:37:42');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (133, 87, 80, '2024-07-01', '2024-07-01 00:45:08');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (120, 80, 81, '2024-07-02', '2024-07-02 04:19:47');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (139, 88, 79, '2024-07-05', '2024-07-05 21:08:09');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (127, 85, 77, '2024-07-07', '2024-07-07 01:28:52');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (118, 74, 79, '2024-07-08', '2024-07-08 10:16:24');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (109, 70, 95, '2024-07-11', '2024-07-11 10:26:57');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (111, 69, 92, '2024-07-15', '2024-07-15 18:44:10');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (102, 67, 70, '2024-07-18', '2024-07-18 18:58:57');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (113, 69, 71, '2024-07-19', '2024-07-19 17:41:59');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (127, 73, 62, '2024-07-21', '2024-07-21 23:54:09');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (118, 70, 66, '2024-07-22', '2024-07-22 05:53:01');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (123, 78, 62, '2024-07-23', '2024-07-23 00:36:22');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (105, 70, 78, '2024-07-24', '2024-07-24 19:33:59');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (119, 81, 96, '2024-07-25', '2024-07-25 04:05:08');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (117, 83, 94, '2024-07-27', '2024-07-27 03:27:02');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (118, 81, 75, '2024-07-29', '2024-07-29 04:50:10');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (120, 82, 86, '2024-07-30', '2024-07-30 02:50:19');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (113, 74, 71, '2024-08-02', '2024-08-02 02:51:35');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (113, 79, 71, '2024-08-03', '2024-08-03 07:47:19');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (126, 79, 72, '2024-08-06', '2024-08-06 00:17:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (114, 75, 73, '2024-08-08', '2024-08-08 08:27:38');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (133, 85, 71, '2024-08-10', '2024-08-10 17:01:06');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (132, 86, 72, '2024-08-11', '2024-08-11 20:47:07');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (125, 85, 83, '2024-08-12', '2024-08-12 01:52:27');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (124, 82, 76, '2024-08-13', '2024-08-13 17:57:51');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (129, 88, 80, '2024-08-14', '2024-08-14 17:04:44');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (115, 80, 77, '2024-08-16', '2024-08-16 23:16:07');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (110, 86, 73, '2024-08-18', '2024-08-18 02:33:23');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (101, 88, 68, '2024-08-19', '2024-08-19 20:15:17');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (123, 80, 69, '2024-08-20', '2024-08-20 06:42:13');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (138, 88, 75, '2024-08-21', '2024-08-21 06:23:59');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (130, 88, 79, '2024-08-23', '2024-08-23 20:34:58');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (114, 74, 91, '2024-08-25', '2024-08-25 00:02:10');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (123, 80, 90, '2024-08-28', '2024-08-28 06:24:01');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (125, 79, 75, '2024-08-29', '2024-08-29 00:45:38');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (130, 79, 77, '2024-08-31', '2024-08-31 01:55:41');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (113, 74, 60, '2024-09-01', '2024-09-01 09:03:09');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (123, 75, 84, '2024-09-02', '2024-09-02 03:24:38');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (124, 78, 63, '2024-09-04', '2024-09-04 19:47:30');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (132, 78, 86, '2024-09-06', '2024-09-06 16:01:28');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (115, 74, 65, '2024-09-09', '2024-09-09 05:46:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (117, 71, 67, '2024-09-14', '2024-09-14 20:24:33');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (127, 82, 94, '2024-09-14', '2024-09-14 19:14:28');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (121, 81, 82, '2024-09-15', '2024-09-15 18:37:48');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (129, 83, 75, '2024-09-16', '2024-09-16 12:56:13');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (120, 76, 77, '2024-09-19', '2024-09-19 15:45:18');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (123, 78, 63, '2024-09-20', '2024-09-20 15:34:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (131, 82, 84, '2024-09-23', '2024-09-23 06:36:56');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (118, 70, 73, '2024-09-24', '2024-09-24 06:32:02');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (116, 79, 73, '2024-09-27', '2024-09-27 02:23:11');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (119, 73, 76, '2024-10-13', '2024-10-13 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (113, 72, 68, '2024-10-23', '2024-10-23 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (107, 69, 77, '2024-10-30', '2024-10-30 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (131, 91, 79, '2024-11-25', '2024-11-25 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (121, 82, 71, '2024-11-27', '2024-11-27 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (127, 80, 71, '2024-12-01', '2024-12-01 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (116, 71, 75, '2024-12-24', '2024-12-24 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (114, 72, 68, '2025-02-01', '2025-02-01 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (120, 70, 69, '2025-02-12', '2025-02-12 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (132, 88, 69, '2025-02-17', '2025-02-17 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (111, 73, 62, '2025-02-21', '2025-02-21 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (135, 98, 63, '2025-03-24', '2025-03-24 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (143, 95, 65, '2025-04-01', '2025-04-01 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (129, 91, 62, '2025-04-05', '2025-04-05 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (137, 90, 74, '2025-05-24', '2025-05-24 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (101, 69, 71, '2025-05-30', '2025-05-30 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (103, 68, 71, '2025-06-15', '2025-06-15 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (142, 95, 72, '2025-06-17', '2025-06-17 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (109, 95, 73, '2025-06-28', '2025-06-28 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (131, 91, 71, '2025-07-01', '2025-07-01 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (125, 89, 68, '2025-07-03', '2025-07-03 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (127, 93, 82, '2025-07-06', '2025-07-06 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (129, 89, 81, '2025-07-10', '2025-07-10 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (122, 90, 83, '2025-07-11', '2025-07-11 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (124, 79, 87, '2025-07-24', '2025-07-24 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (122, 81, 78, '2025-07-25', '2025-07-25 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (115, 83, 77, '2025-07-26', '2025-07-26 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (131, 99, 62, '2025-07-31', '2025-07-31 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (125, 89, 63, '2025-08-13', '2025-08-13 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (133, 95, 68, '2025-08-21', '2025-08-21 22:54:55');
INSERT INTO blood (blood_high_p, blood_low_p, blood_heart, blood_date, blood_update_time)
VALUES (127, 79, 69, '2025-08-25', '2025-08-25 22:54:55');