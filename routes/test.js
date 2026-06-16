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
	test_add: `INSERT INTO test (name) VALUES ($1)`
}

router.post("/add", async (req, res) => {
	try {
		const result = await pool.query(sql.test_add, [
			req.body.name,
		]);
		res.json({
			success: true,
			message: "新增成功",
			data: {
				insertId: result.rows[0]?.insertId || result.rowCount
			},
		});
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

export default router;