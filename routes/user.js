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
	user_info: 'SELECT id, role, name, phone, weixin, email, sex, avatar, compa, compb, theme FROM user_info WHERE id = $1;',
	user_list: 'SELECT * FROM user',
}

router.post("/info", async (req, res) => {
	try {
		const result = await pool.query(sql.user_info, [req.body.id]);
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

router.get("/list", async (req, res) => {
	try {
		const result = await pool.query(sql.user_list);
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

export default router;