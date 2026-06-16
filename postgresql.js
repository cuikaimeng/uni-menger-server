import pkg from 'pg';
const { Pool } = pkg;

const dbConfig = {
	host: process.env.DB_HOST || 'localhost',
	user: process.env.DB_USER || 'cuikaimeng',
	password: process.env.DB_PASSWORD || '',
	database: 'menger',
	port: process.env.DB_PORT || 5432,
};

export const pool = new Pool(dbConfig);