import { Router } from "express";
import { pool } from "../postgresql.js";
import { authenticateToken } from "../utils/token.js";

const router = Router();
router.use(authenticateToken);

const sql = {
  dict_type_list: `
	SELECT * FROM sys_dict_type
	WHERE status = 0 
	ORDER BY update_time DESC;
	`,
  dict_type_check: `
	SELECT EXISTS(
    	SELECT 1 FROM sys_dict_type WHERE dict_type = $1
	) AS is_exist;
	`,
  dict_type_add: `
	INSERT INTO sys_dict_type (dict_name, dict_type, status, remark, update_time)
	VALUES ($1,$2,$3,$4,$5);
	`,
  dict_type_update: `
	UPDATE sys_dict_type
	SET dict_name = $1, 
		dict_type = $2,
		status = $3,
		remark = $4,
		update_time = $5
	WHERE id = $6
	`,
  dict_type_delete: `
	DELETE FROM sys_dict_type 
	WHERE id = $1;
	`,
  dict_data_list: `
	SELECT * FROM sys_dict_data
	WHERE dict_type = $1 
	AND status = 0 
	ORDER BY sort ASC;
	`,
  dict_data_add: `
	INSERT INTO sys_dict_data (dict_type, label, value, sort, color, status, remark)
	VALUES ($1,$2,$3,$4,$5,$6,$7);
	`,
  dict_data_update: `
	UPDATE sys_dict_data
	SET label = $1, 
		value = $2,
		sort = $3,
		color = $4,
		status = $5,
		remark = $6
	WHERE id = $7
	`,
  dict_data_delete: `
	DELETE FROM sys_dict_data 
	WHERE id = $1;
	`,
};

router.get("/type/list", async (req, res) => {
  try {
    const result = await pool.query(sql.dict_type_list);
    res.json({
      success: true,
      message: "查询成功",
      data: result.rows,
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

router.post("/type/check", async (req, res) => {
  try {
    const result = await pool.query(sql.dict_type_check, [req.body.dict_type]);
    res.json({
      success: true,
      message: "查询成功",
      data: result.rows,
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

router.post("/type/add", async (req, res) => {
  try {
    await pool.query(sql.dict_type_add, [
      req.body.dict_name,
      req.body.dict_type,
      req.body.status,
      req.body.remark,
      req.body.update_time
    ]);
    res.json({
      success: true,
      message: "新增成功",
      data: [],
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

router.post("/type/update/:id", async (req, res) => {
  try {
    await pool.query(sql.dict_type_update, [
      req.body.dict_name,
      req.body.dict_type,
      req.body.status,
      req.body.remark,
      req.body.update_time,
      req.params.id,
    ]);
    res.json({
      success: true,
      message: "修改成功",
      data: [],
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

router.delete("/type/delete/:id", async (req, res) => {
  try {
    await pool.query(sql.dict_type_delete, [req.params.id]);
    res.json({
      success: true,
      message: "删除成功",
      data: [],
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

router.post("/data/list", async (req, res) => {
  try {
    const result = await pool.query(sql.dict_data_list, [req.body.dict_type]);
    res.json({
      success: true,
      message: "查询成功",
      data: result.rows,
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

router.post("/data/add", async (req, res) => {
  try {
    await pool.query(sql.dict_data_add, [
      req.body.dict_type,
      req.body.label,
      req.body.value,
      req.body.sort,
      req.body.color,
	  req.body.status,
	  req.body.remark
    ]);
    res.json({
      success: true,
      message: "新增成功",
      data: [],
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

router.post("/data/update/:id", async (req, res) => {
  try {
    await pool.query(sql.dict_data_update, [
      req.body.label,
      req.body.value,
      req.body.sort,
      req.body.color,
      req.body.status,
      req.body.remark,
      req.params.id,
    ]);
    res.json({
      success: true,
      message: "修改成功",
      data: [],
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

router.delete("/data/delete/:id", async (req, res) => {
  try {
    await pool.query(sql.dict_data_delete, [req.params.id]);
    res.json({
      success: true,
      message: "删除成功",
      data: [],
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

export default router;