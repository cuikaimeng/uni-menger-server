import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';

dotenv.config(); // 加载.env文件

const securityKey = new TextEncoder().encode(process.env.JWT_SECRET_KEY)

// 生成token函数
export function generateToken(userId) {
	return jwt.sign({
		userId
	}, securityKey, {
		expiresIn: '1h'
	});
}

// 验证token中间件
export function authenticateToken(req, res, next) {
	const token = req.header('Authorization')?.split(' ')[1];
	if (!token) return res.status(401).json({
		success: false,
		message: "请重新登录",
	});

	jwt.verify(token, securityKey, (err, decoded) => {
		if (err) return res.status(401).json({
			success: false,
			message: "请重新登录",
		});
		req.user = decoded;
		next();
	});
}