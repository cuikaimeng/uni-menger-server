import mysql from "mysql2/promise";

// 数据库连接配置
const dbConfig = {
	host: process.env.DB_HOST || 'localhost',
	user: "root",
	password: "123456",
	database: "menger",
};

//数据库连接池
export const pool = mysql.createPool(dbConfig);