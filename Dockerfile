# 1. 指定 Node.js 22.22.0 版本
FROM node:22.22.0-alpine

# 2. 设置容器内的工作目录
WORKDIR /app

# 3. 安装 pnpm 并复制依赖文件
# 你的 package.json 中列出了 pnpm，建议在构建阶段安装它
RUN npm install -g pnpm

COPY package.json pnpm-lock.yaml* ./
RUN pnpm install

# 4. 复制项目所有源码
COPY . .

# 5. 声明程序运行端口
EXPOSE 3000

# 6. 运行启动命令
CMD ["pnpm", "start"]
