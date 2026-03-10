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
	blood_current: 'SELECT id, blood_date, blood_high_p, blood_low_p, blood_heart FROM blood ORDER BY id DESC LIMIT 1;',
	blood_pressure: 'SELECT id, blood_date, blood_high_p, blood_low_p FROM blood ORDER BY id DESC LIMIT 7;',
	blood_heart: 'SELECT id, blood_date, blood_heart FROM blood ORDER BY id DESC LIMIT 7;',
	blood_add: 'INSERT INTO blood (blood_date, blood_high_p, blood_low_p, blood_heart, blood_update_time) VALUES (?,?,?,?,?);',
	blood_update: 'UPDATE blood SET blood_date = ?, blood_high_p = ?, blood_low_p = ?, blood_heart = ?, blood_update_time = ? WHERE id = ?',
	blood_delete: 'DELETE FROM blood WHERE id = ?;',
	blood_list: 'SELECT * FROM blood ORDER BY id DESC LIMIT ? OFFSET ?;',
	blood_total: 'SELECT COUNT(*) AS total FROM blood;'
}

/**
 * 获取最近1条血压数据
 *  */
router.get("/current", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.blood_current);
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
 * 获取最近7条血压数据（高压、低压）
 * 将血压和心率分成两个接口，是因为前端对相同接口做了防抖处理。
 *  */
router.get("/pressure", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.blood_pressure);
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
 * 获取最近7条血压数据（心率）
 * 将血压和心率分成两个接口，是因为前端对相同接口做了防抖处理。
 *  */
router.get("/heart", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.blood_heart);
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
 * 新增记录
 *  */
router.post("/add", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.blood_add, [
			req.body.blood_date,
			req.body.blood_high_p,
			req.body.blood_low_p,
			req.body.blood_heart,
			req.body.blood_update_time
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
 * 修改记录
 *  */
router.post("/update/:id", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.blood_update, [
			req.body.blood_date,
			req.body.blood_high_p,
			req.body.blood_low_p,
			req.body.blood_heart,
			req.body.blood_update_time,
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
 * 删除记录
 *  */
router.delete("/delete/:id", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.blood_delete, [req.params.id]);
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

/**
 * 分页查询
 *  */
router.post("/list", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.blood_list, [req.body.limit, req.body.offset]);
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
 * 查询总数
 *  */
router.get("/total", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.blood_total);
		res.json({
			success: true,
			message: "查询成功",
			data: rows[0],
		});
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

export default router;