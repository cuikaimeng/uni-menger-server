import {
	Router
} from "express";
import {
	authenticateToken
} from '../utils/token.js'

const router = Router();
router.use(authenticateToken);

router.post("/verify", async (req, res) => {
	res.json({
		success: true,
		message: "Token有效",
	});
});

export default router;