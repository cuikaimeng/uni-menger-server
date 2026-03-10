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
	test_add: `INSERT INTO test (name) VALUES (?)`,
}

/**
 * 新增任务
 *  */
router.post("/add", async (req, res) => {
	try {
		const result = await pool.query(sql.test_add, [
			req.body.name,
		]);
		res.json({
			success: true,
			message: "新增成功",
			data: {
				insertId: result[0].insertId
			},
		});
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

export default router;