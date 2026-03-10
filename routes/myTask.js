import {
	Router
} from "express";
import {
	pool
} from "../mysql.js";
import {
	authenticateToken
} from '../utils/token.js'

const router = Router();
router.use(authenticateToken); // 开发阶段先注释，跳过token验证

const sql = {
	task_list: `
		SELECT * FROM task
		WHERE task_date = ? 
		ORDER BY task_index ASC;
	`,
	task_add: `
		INSERT INTO task (task_date, task_index, task_title, task_content, task_status, task_color)
		VALUES (?,?,?,?,?,?);
	`,
	task_update: `
		UPDATE task
		SET task_title = ?, 
				task_content = ?,
				task_color = ?
		WHERE id = ?
	`,
	task_delete: `
		DELETE FROM task 
		WHERE id = ?;
	`,
}

/**
 * 获取指定日期的任务列表
 * @param date 日期
 *  */
router.get("/list", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.task_list, [req.query.task_date]);
		res.json({
			success: true,
			message: "查询成功",
			data: rows,
		});
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

/**
 * 批量更新任务状态
 *  */
router.post("/update/status", async (req, res) => {
	try {
		let pendingTaskStr = req.body.pendingTasks.toString()
		let completeTaskStr = req.body.completeTasks.toString()
		let totalTaskArr = req.body.pendingTasks.concat(req.body.completeTasks)
		let totalTaskStr = totalTaskArr.toString()
		let pendingCase = pendingTaskStr === '' ? '' : 'WHEN id IN (' + pendingTaskStr + ') THEN 0'
		let completeCase = completeTaskStr === '' ? '' : 'WHEN id IN (' + completeTaskStr + ') THEN 1'
		const sql = `
			UPDATE task
			SET task_status = CASE 
			    ${pendingCase}
			    ${completeCase}
			    ELSE task_status
			END
			WHERE id IN (${totalTaskStr});
		`
		const [rows] = await pool.query(sql);
		res.json({
			success: true,
			message: "更新成功",
			data: [],
		});
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

/**
 * 新增任务
 *  */
router.post("/add", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.task_add, [
			req.body.task_date,
			req.body.task_index,
			req.body.task_title,
			req.body.task_content,
			req.body.task_status,
			req.body.task_color
		]);
		res.json({
			success: true,
			message: "新增成功",
			data: [],
		});
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

/**
 * 修改任务
 *  */
router.post("/update/:id", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.task_update, [
			req.body.task_title,
			req.body.task_content,
			req.body.task_color,
			req.params.id,
		]);
		res.json({
			success: true,
			message: "修改成功",
			data: [],
		});
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

/**
 * 删除任务
 *  */
router.delete("/delete/:id", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.task_delete, [req.params.id]);
		res.json({
			success: true,
			message: "删除成功",
			data: [],
		});
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});



export default router;