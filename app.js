import createError from "http-errors";
import express, {
	json,
	urlencoded
} from "express";
import expressStatic from "express";
import {
	join
} from "path";
import cookieParser from "cookie-parser";
import logger from "morgan";
import {
	fileURLToPath
} from "url";
import path from "path";

import testRouter from './routes/test.js';
import verifyRouter from './routes/verify.js';
import indexRouter from "./routes/index.js";
import userRouter from "./routes/user.js";
import bloodRouter from "./routes/blood.js";
import myTaskRouter from "./routes/myTask.js";
import travelRouter from "./routes/travel.js";
import cors from "cors";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

var app = express();

// 允许指定域进行跨域请求
app.use(
	cors()
);

// view engine setup
app.set("views", join(__dirname, "views"));
app.set("view engine", "ejs");

app.use(logger("dev"));
app.use(json());
app.use(
	urlencoded({
		extended: false,
	})
);
app.use(expressStatic.static(join(__dirname, "public")));

app.use("/api", indexRouter);
app.use("/api", verifyRouter); // 验证token
app.use("/api/user", userRouter);
app.use("/api/blood", bloodRouter);
app.use("/api/myTask", myTaskRouter);
app.use("/api/travel", travelRouter);
app.use("/api/test", testRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
	next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
	// set locals, only providing error in development
	res.locals.message = err.message;
	res.locals.error = req.app.get("env") === "development" ? err : {};

	// render the error page
	res.status(err.status || 500);
	res.render("error");
});

export default app;