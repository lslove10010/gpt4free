FROM hlohaus789/g4f:latest

# 设置环境变量
ENV PORT=8080
ENV G4F_API_KEY=""

# 暴露端口
EXPOSE 8080

# 启动 GUI 模式（同时提供 API）
CMD ["python", "-m", "g4f.cli", "gui", "--host", "0.0.0.0", "--port", "8080"]
