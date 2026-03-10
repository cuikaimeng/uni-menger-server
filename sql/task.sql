CREATE TABLE `task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_date` varchar(45) DEFAULT NULL,
  `task_index` int DEFAULT NULL,
  `task_title` varchar(45) DEFAULT NULL,
  `task_content` varchar(45) DEFAULT NULL,
  `task_status` int DEFAULT NULL,
  `task_color` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

-- 查询某天的任务列表
SELECT * FROM task 
WHERE task_date = ? 
ORDER BY task_index ASC;

-- 新增任务
INSERT INTO task (task_date, task_index, task_title, task_content, task_status, task_color)
VALUES (?,?,?,?,?,?);

-- 修改任务
UPDATE task 
SET task_title = ?, 
		task_content = ?,
		task_color = ?
WHERE id = ?

-- 批量修改任务状态
UPDATE task
SET status = CASE 
    WHEN id IN (?,?,?) THEN 0
    WHEN id IN (?,?) THEN 1
    ELSE status  -- 保持其他记录不变
END
WHERE id IN (?,?,?,?,?);

-- 删除
DELETE FROM task WHERE id = ?;

-- 测试数据
INSERT INTO task (task_date, task_index, task_title, task_content, task_status, task_color)
VALUES ('20250914',1,'学习','萌二之家今日任务功能开发',0,'#d4e4ff');
INSERT INTO task (task_date, task_index, task_title, task_content, task_status, task_color)
VALUES ('20250914',2,'去超市买菜','白菜、粉条、胡萝卜、黄瓜、猪肉、蒜、大葱',1,'#d4e4ff');
INSERT INTO task (task_date, task_index, task_title, task_content, task_status, task_color)
VALUES ('20250914',3,'打扫卫生','换床单、洗衣服、扫地、拖地',0,'#d4e4ff');