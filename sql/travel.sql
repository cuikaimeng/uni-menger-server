CREATE TABLE `travel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `travel_title` varchar(50) DEFAULT NULL, -- 标题
  `travel_content` varchar(2000) DEFAULT NULL, -- 内容（文字）
  `travel_start_date` varchar(45) DEFAULT NULL, -- 开始日期
  `travel_end_date` varchar(45) DEFAULT NULL, -- 结束日期
  `travel_province_code` varchar(10) DEFAULT NULL, -- 省份编码
  `travel_province_name` varchar(45) DEFAULT NULL, -- 省份名称
  `travel_city_code` varchar(10) DEFAULT NULL, -- 市级编码
  `travel_city_name` varchar(45) DEFAULT NULL, -- 市级名称
  `travel_attraction` varchar(45) DEFAULT NULL, -- 景点名称
  `travel_image` varchar(1000) DEFAULT NULL, -- 封面图片（首张图片）
  `travel_update_time` varchar(45) DEFAULT NULL, -- 更新时间
  `travel_update_user` int DEFAULT NULL, -- 发布人（id）
	`travel_user_avatar` varchar(45) DEFAULT NULL, -- 发布人头像
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

-- 查询所属家庭下的所有数据（只能查到自己所属家庭的路书记录）
SELECT id, travel_title, travel_city_name, travel_attraction, travel_image, travel_user_avatar 
FROM travel
ORDER BY travel_update_time DESC


-- 新增数据
INSERT INTO travel (
	travel_title,
	travel_content,
	travel_start_date,
	travel_end_date,
	travel_province_code,
	travel_province_name,
	travel_city_code,
	travel_city_name,
	travel_attraction,
	travel_image,
	travel_update_time,
	travel_update_user,
	travel_user_avatar,
) 
VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);

-- 修改数据
UPDATE travel
SET travel_title = ?, 
		travel_content = ?,
		travel_start_date = ?,
		travel_end_date = ?,
		travel_province_code = ?,
		travel_province_name = ?,
		travel_city_code = ?,
		travel_city_name = ?,
		travel_attraction = ?,
		travel_image = ?,
		travel_update_time = ?
WHERE id = ?

-- 删除数据
DELETE FROM travel WHERE id = ?;

-- 测试数据
INSERT INTO travel (travel_title,travel_content,travel_start_date,travel_end_date,travel_province_code,travel_province_name,travel_city_code,travel_city_name,travel_attraction,travel_image,travel_update_time,travel_update_user)
VALUES (
	'逃离寒冬，我在海南的暖阳与海风里，开启人生第一场热带越冬之旅！', 
	'第一次在海南过冬，才真正明白“四季如春”的惬意。没有北风呼啸，只有暖阳洒满肩头，海风轻拂脸庞。漫步沙滩，看晚霞浸染海面，感受着与北方截然不同的生机与活力。这趟温暖的旅程，让身心都得到了治愈。海南，你好！这个冬天，注定难忘。',
	'2025-12-29',
	'2026-03-04',
	'460000',
	'海南省',
	'460200',
	'三亚市',
	'陵水清水湾',
	'travel1.jpg',  
	'2025-01-10 15:54:32',
	1
);
INSERT INTO travel (travel_title,travel_content,travel_start_date,travel_end_date,travel_province_code,travel_province_name,travel_city_code,travel_city_name,travel_attraction,travel_image,travel_update_time,travel_update_user)
VALUES (
	'寻梦延安，红色之旅', 
	'巍巍宝塔，滔滔延河，延安，一座镌刻着光荣与梦想的城市，静候您的到来。这里，是革命的圣地，每一孔窑洞都诉说着峥嵘岁月的不朽传奇；这里，是精神的高地，枣园的灯光、杨家岭的会场，激励着一代又一代人奋勇前行。漫步延安，您不仅能触摸到厚重的红色记忆，更能领略黄土高原独特的风土人情与壮丽风光。来吧，踏上这片热土，聆听历史的回响，汲取前行的力量，让心灵在红色之旅中得到洗礼与升华！',
	'2025-05-01',
	'2025-05-01',
	'610000',
	'陕西省',
	'610600',
	'延安市',
	'枣园，宝塔山',
	'travel2.jpg',
	'2025-01-10 15:54:32',
	1
);
INSERT INTO travel (travel_title,travel_content,travel_start_date,travel_end_date,travel_province_code,travel_province_name,travel_city_code,travel_city_name,travel_attraction,travel_image,travel_update_time,travel_update_user)
VALUES (
	'赴一场太行之约，梦回石板岩的慢时光', 
	'隐匿于太行山深处的石板岩小镇，是一幅流动的水墨画卷。这里，石板为瓦，石屋为家，时光仿佛在此停驻。漫步在被岁月打磨的石板路上，触摸斑驳的石墙，感受山风拂面的清新。清晨，在露水河畔邂逅云雾缭绕的仙境；午后，于崖边咖啡馆静享山野闲情；傍晚，登上观景台捕捉夕阳为群山披上的金纱。这里是“中国画谷”，也是远离喧嚣的避世桃源。来石板岩，住进风景里，让心灵在石头的怀抱中彻底放松。',
	'2025-05-02',
	'2025-05-02',
	'410000',
	'河南省',
	'411200',
	'三门峡市',
	'陕州地坑院',
	'travel3.jpg',
	'2025-01-10 15:54:32',
	1
);
INSERT INTO travel (travel_title,travel_content,travel_start_date,travel_end_date,travel_province_code,travel_province_name,travel_city_code,travel_city_name,travel_attraction,travel_image,travel_update_time,travel_update_user)
VALUES (
	'赴一场太行之约，梦回石板岩的慢时光', 
	'隐匿于太行山深处的石板岩小镇，是一幅流动的水墨画卷。这里，石板为瓦，石屋为家，时光仿佛在此停驻。漫步在被岁月打磨的石板路上，触摸斑驳的石墙，感受山风拂面的清新。清晨，在露水河畔邂逅云雾缭绕的仙境；午后，于崖边咖啡馆静享山野闲情；傍晚，登上观景台捕捉夕阳为群山披上的金纱。这里是“中国画谷”，也是远离喧嚣的避世桃源。来石板岩，住进风景里，让心灵在石头的怀抱中彻底放松。',
	'2025-05-03',
	'2025-05-04',
	'410000',
	'河南省',
	'410500',
	'安阳市',
	'林州石板岩',
	'travel4.jpg',
	'2025-01-10 15:54:32',
	1
);