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
	travel_list: `
		SELECT id, travel_title, travel_city_name, travel_attraction, travel_image, travel_user_avatar
		FROM travel
		ORDER BY travel_update_time DESC
		LIMIT $1 OFFSET $2;
	`,
	travel_detail: `
		SELECT 
			travel_title,
			travel_content,
			travel_start_date,
			travel_end_date,
			travel_province_code,
			travel_province_name,
			travel_city_code,
			travel_city_name,
			travel_attraction,
			travel_image,
			travel_update_time,
			travel_update_user
		FROM travel
		WHERE id = $1;
	`,
	travel_add: `
		INSERT INTO travel (
			travel_title,
			travel_content,
			travel_start_date,
			travel_end_date,
			travel_province_code,
			travel_province_name,
			travel_city_code,
			travel_city_name,
			travel_attraction,
			travel_image,
			travel_update_time
		) 
		VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11);
	`,
	travel_update: `
		UPDATE travel
		SET travel_title = $1, 
			travel_content = $2,
			travel_start_date = $3,
			travel_end_date = $4,
			travel_province_code = $5,
			travel_province_name = $6,
			travel_city_code = $7,
			travel_city_name = $8,
			travel_attraction = $9,
			travel_image = $10,
			travel_update_time = $11
		WHERE id = $12
	`,
	travel_delete: `
		DELETE FROM travel 
		WHERE id = $1;
	`,
	travel_map_province: `
		SELECT DISTINCT 
	        travel_province_code, 
			travel_province_name 
	    FROM travel
	`,
	travel_map_city: `
		SELECT DISTINCT 
	        travel_city_code, 
			travel_city_name 
	    FROM travel 
		WHERE travel_province_code = $1
	`
}

router.post("/list", async (req, res) => {
	try {
		const result = await pool.query(sql.travel_list,[req.body.limit, req.body.offset]);
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

router.post("/detail/:id", async (req, res) => {
	try {
		const result = await pool.query(sql.travel_detail, [req.params.id]);
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
		const result = await pool.query(sql.travel_add, [
			req.body.travel_title,
			req.body.travel_content,
			req.body.travel_start_date,
			req.body.travel_end_date,
			req.body.travel_province_code,
			req.body.travel_province_name,
			req.body.travel_city_code,
			req.body.travel_city_name,
			req.body.travel_attraction,
			req.body.travel_image,
			req.body.travel_update_time,
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

router.post("/update/:id", async (req, res) => {
	try {
		await pool.query(sql.travel_update, [
			req.body.travel_title,
			req.body.travel_content,
			req.body.travel_start_date,
			req.body.travel_end_date,
			req.body.travel_province_code,
			req.body.travel_province_name,
			req.body.travel_city_code,
			req.body.travel_city_name,
			req.body.travel_attraction,
			req.body.travel_image,
			req.body.travel_update_time,
			req.params.id
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
		await pool.query(sql.travel_delete, [req.params.id]);
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

router.post("/map", async (req, res) => {
	const { code } = req.body; 
	try {
		let mapSql = "";
		let params = [];
		if (code === 'china') {
			mapSql = sql.travel_map_province;
		} else if (code) {
			mapSql = sql.travel_map_city;
			params = [code];
		} else {
			return res.status(400).json({ code: 400, msg: "参数 code 不能为空" });
		}
		const result = await pool.query(mapSql, params);
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