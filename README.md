

### 1.安装依赖

```javascript
	pnpm install or pnpm i
```

### 2.启动运行
```javascript
	pnpm run start
```

### docker更新部署
 - 注意：开启VPN可能影像docker容器DNS解析结果，导致pnpm安装失败，执行前关闭VPN
docker-compose up -d --build