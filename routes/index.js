import {
	Router
} from "express";
import {
	pool
} from "../postgresql.js";
import {
	generateToken
} from '../utils/token.js'

const router = Router();

const sql = {
	login: 'SELECT id, role, name, phone, weixin, email, sex, avatar, compa, compb, theme FROM user_info WHERE phone = $1 AND password = $2;',
	register: 'INSERT INTO user_info (role, name, phone, weixin, password, email, sex, avatar, compa, compb, theme) VALUES ( $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11 );',
	user_info_check: 'SELECT id FROM user_info WHERE phone = $1;',
}

router.post("/login", async (req, res) => {
	try {
		const result = await pool.query(sql.login, [req.body.phone, req.body.password]);
		if (result.rows.length === 0) {
			res.json({
				success: false,
				message: "手机号或密码错误",
			});
		} else {
			const token = generateToken(result.rows[0].id)
			res.json({
				success: true,
				message: "登录成功",
				data: result.rows[0],
				token: token
			});
		}
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

router.post("/register", async (req, res) => {
	try {
		const checkResult = await pool.query(sql.user_info_check, [req.body.phone])
		if (checkResult.rows.length === 0) {
			await pool.query(sql.register, [
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