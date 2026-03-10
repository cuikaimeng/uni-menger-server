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
	user_info: 'SELECT id, role, name, phone, weixin, email, sex, avatar, compa, compb, theme FROM user_info WHERE id = ?;',
	user_list: 'SELECT * FROM user',
}

// 查询用户数据
router.post("/info", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.user_info, req.body.id);
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

// 查询用户列表
router.get("/list", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.user_list);
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

export default router;