import {
	Router
} from "express";
import {
	pool
} from "../mysql.js";
import {
	generateToken
} from '../utils/token.js'

const router = Router();

const sql = {
	login: 'SELECT id, role, name, phone, weixin, email, sex, avatar, compa, compb, theme FROM user_info WHERE phone = ? AND password = ?;',
	register: 'INSERT INTO user_info (role, name, phone, weixin, password, email, sex, avatar, compa, compb, theme) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? );',
	user_info_check: 'SELECT id FROM user_info WHERE phone = ?;',
}

/* 登录 */
router.post("/login", async (req, res) => {
	try {
		const [rows] = await pool.query(sql.login, [req.body.phone,
			req.body.password
		]);
		if (rows.length === 0) {
			res.json({
				success: false,
				message: "手机号或密码错误",
			});
		} else {
			const token = generateToken(rows[0].id)
			res.json({
				success: true,
				message: "登录成功",
				data: rows[0],
				token: token
			});
		}
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

/* 注册 */
router.post("/register", async (req, res) => {
	try {
		const [checkRows] = await pool.query(sql.user_info_check, [req.body.phone])
		if (checkRows.length === 0) {
			const [rows] = await pool.query(sql.register, [
				req.body.role,
				req.body.name,
				req.body.phone,
				req.body.weixin,
				req.body.password,
				req.body.email,
				req.body.sex,
				req.body.avatar,
				req.body.compa,
				req.body.compb,
				req.body.theme,
			]);
			res.json({
				success: true,
				message: "注册成功",
				data: [],
			});
		} else {
			res.json({
				success: false,
				message: "该手机号已注册",
				data: [],
			});
		}
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

export default router;