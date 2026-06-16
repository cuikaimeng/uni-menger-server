import {
	Router
} from "express";
import {
	pool
} from "../postgresql.js";
import {
	authenticateToken
} from '../utils/token.js'

const router = Router();
router.use(authenticateToken);

const sql = {
	task_list: `
		SELECT * FROM task
		WHERE task_date = $1 
		ORDER BY task_index ASC;
	`,
	task_add: `
		INSERT INTO task (task_date, task_index, task_title, task_content, task_status, task_color)
		VALUES ($1,$2,$3,$4,$5,$6);
	`,
	task_update: `
		UPDATE task
		SET task_title = $1, 
				task_content = $2,
				task_color = $3
		WHERE id = $4
	`,
	task_delete: `
		DELETE FROM task 
		WHERE id = $1;
	`,
}

router.get("/list", async (req, res) => {
	try {
		const result = await pool.query(sql.task_list, [req.query.task_date]);
		res.json({
			success: true,
			message: "查询成功",
			data: result.rows,
		});
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

router.post("/update/status", async (req, res) => {
	try {
		let pendingTaskStr = req.body.pendingTasks.toString()
		let completeTaskStr = req.body.completeTasks.toString()
		let totalTaskArr = req.body.pendingTasks.concat(req.body.completeTasks)
		let totalTaskStr = totalTaskArr.toString()
		let pendingCase = pendingTaskStr === '' ? '' : 'WHEN id IN (' + pendingTaskStr + ') THEN 0'
		let completeCase = completeTaskStr === '' ? '' : 'WHEN id IN (' + completeTaskStr + ') THEN 1'
		const sqlQuery = `
			UPDATE task
			SET task_status = CASE 
			    ${pendingCase}
			    ${completeCase}
			    ELSE task_status
			END
			WHERE id IN (${totalTaskStr});
		`
		await pool.query(sqlQuery);
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

router.post("/add", async (req, res) => {
	try {
		await pool.query(sql.task_add, [
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

router.post("/update/:id", async (req, res) => {
	try {
		await pool.query(sql.task_update, [
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

router.delete("/delete/:id", async (req, res) => {
	try {
		await pool.query(sql.task_delete, [req.params.id]);
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