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
	travel_list: `
		SELECT id, travel_title, travel_city_name, travel_attraction, travel_image, travel_user_avatar
		FROM travel
		ORDER BY travel_update_time DESC
		LIMIT ? OFFSET ?;
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
			travel_update_user,
		FROM travel
		WHERE id = ?
		ORDER BY travel_update_time DESC;
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
		VALUES (?,?,?,?,?,?,?,?,?,?,?);
	`,
	travel_update: `
		UPDATE travel
		SET travel_title = ?, 
			travel_content = ?,
			travel_start_date = ?,
			travel_end_date = ?,
			travel_province_code = ?,
			travel_province_name = ?,
			travel_city_code = ?,
			travel_city_name = ?,
			travel_attraction = ?,
			travel_image = ?,
			travel_update_time = ?
		WHERE id = ?
	`,
	travel_delete: `
		DELETE FROM travel 
		WHERE id = ?;
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
		WHERE travel_province_code = ?
	`
}

/**
 * 查询路书列表
 * @param date 日期
 *  */
router.post("/list", async (req, res) => {
	try {
		const [result] = await pool.query(sql.travel_list,[req.body.limit, req.body.offset]);
		res.json({
			success: true,
			message: "查询成功",
			data: result,
		});
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

/**
 * 查询路书详细数据
 *  */
router.get("/detail", async (req, res) => {
	try {
		const [result] = await pool.query(sql.travel_detail);
		res.json({
			success: true,
			message: "查询成功",
			data: result,
		});
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

/**
 * 新增路书
 *  */
router.post("/add", async (req, res) => {
	try {
		const [result] = await pool.query(sql.travel_add, [
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
			req.body.travel_update_user,
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

/**
 * 修改路书
 *  */
router.post("/update/:id", async (req, res) => {
	try {
		const [result] = await pool.query(sql.travel_update, [
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
			req.body.travel_update_user,
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

/**
 * 删除路书
 *  */
router.delete("/delete/:id", async (req, res) => {
	try {
		const [result] = await pool.query(sql.travel_delete, [req.params.id]);
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
 * 路数地图数据
 */
router.get("/map", async (req, res) => {
	// 从请求体 body 中获取参数
	const { code } = req.body; 
	try {
		let sql = "";
		let params = [];

		if (code === 'china') {
			// 1. 当参数为 'china' 时，查询所有省份编码和名称（去重）
			sql = sql.travel_map_province;
		} else if (code) {
			// 2. 当参数为具体的省份编码时，查询该省份下的所有城市（去重）
			sql = sql.travel_map_city;
			params = [code];
		} else {
			return res.status(400).json({ code: 400, msg: "参数 code 不能为空" });
		}
		
		const [result] = await pool.query(sql, params);
		res.json({
			success: true,
			message: "查询成功",
			data: result,
		});
	} catch (error) {
		res.status(500).json({
			error: error.message
		});
	}
});

export default router;