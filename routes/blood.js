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
	blood_current: 'SELECT id, blood_date, blood_high_p, blood_low_p, blood_heart FROM blood ORDER BY id DESC LIMIT 1;',
	blood_pressure: 'SELECT id, blood_date, blood_high_p, blood_low_p FROM blood ORDER BY id DESC LIMIT 7;',
	blood_heart: 'SELECT id, blood_date, blood_heart FROM blood ORDER BY id DESC LIMIT 7;',
	blood_add: 'INSERT INTO blood (blood_date, blood_high_p, blood_low_p, blood_heart, blood_update_time) VALUES ($1,$2,$3,$4,$5);',
	blood_update: 'UPDATE blood SET blood_date = $1, blood_high_p = $2, blood_low_p = $3, blood_heart = $4, blood_update_time = $5 WHERE id = $6',
	blood_delete: 'DELETE FROM blood WHERE id = $1;',
	blood_list: 'SELECT * FROM blood ORDER BY id DESC LIMIT $1 OFFSET $2;',
	blood_total: 'SELECT COUNT(*) AS total FROM blood;'
}

router.get("/current", async (req, res) => {
	try {
		const result = await pool.query(sql.blood_current);
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

router.get("/pressure", async (req, res) => {
	try {
		const result = await pool.query(sql.blood_pressure);
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

router.get("/heart", async (req, res) => {
	try {
		const result = await pool.query(sql.blood_heart);
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

router.post("/add", async (req, res) => {
	try {
		await pool.query(sql.blood_add, [
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

router.post("/update/:id", async (req, res) => {
	try {
		await pool.query(sql.blood_update, [
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

router.delete("/delete/:id", async (req, res) => {
	try {
		await pool.query(sql.blood_delete, [req.params.id]);
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

router.post("/list", async (req, res) => {
	try {
		const result = await pool.query(sql.blood_list, [req.body.limit, req.body.offset]);
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

router.get("/total", async (req, res) => {
	try {
		const result = await pool.query(sql.blood_total);
		res.json({
			success: true,
			message: "查询成功",
			data: result.rows[0],
		});
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

export default router;