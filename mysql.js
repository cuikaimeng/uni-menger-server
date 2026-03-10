import mysql from "mysql2/promise";

// 数据库连接配置
const dbConfig = {
	host: "127.0.0.1",
	user: "root",
	password: "123456",
	database: "menger",
};

//数据库连接池
export const pool = mysql.createPool(dbConfig);