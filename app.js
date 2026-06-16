import createError from "http-errors";
import express, { json, urlencoded } from "express";
import expressStatic from "express";
import { join } from "path";
import cookieParser from "cookie-parser";
import logger from "morgan";
import { fileURLToPath } from "url";
import path from "path";

import testRouter from "./routes/test.js"; // 测试使用
import verifyRouter from "./routes/verify.js"; // token验证接口
import indexRouter from "./routes/index.js"; // 用户登录接口
import userRouter from "./routes/user.js"; // 用户信息接口
import bloodRouter from "./routes/blood.js"; // 血压记录接口
import myTaskRouter from "./routes/myTask.js"; // 我的任务接口
import travelRouter from "./routes/travel.js"; // 旅游路书接口
import dictRouter from "./routes/dict.js"; // 数据字典接口
import cors from "cors";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

var app = express();

// 允许指定域进行跨域请求
app.use(cors());

// view engine setup
app.set("views", join(__dirname, "views"));
app.set("view engine", "ejs");

app.use(logger("dev"));
app.use(json());
app.use(
  urlencoded({
    extended: false,
  }),
);
app.use(expressStatic.static(join(__dirname, "public")));

app.use("/api", indexRouter);
app.use("/api", verifyRouter); // 验证token
app.use("/api/user", userRouter);
app.use("/api/blood", bloodRouter);
app.use("/api/myTask", myTaskRouter);
app.use("/api/travel", travelRouter);
app.use("/api/test", testRouter);
app.use("/api/dict", dictRouter);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

export default app;
