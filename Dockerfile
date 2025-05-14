# 使用官方的 Python 轻量级基础镜像
FROM python:3.10-slim

# 创建应用目录并设置权限
WORKDIR /app
RUN apt update && \
    mkdir -p /app/har_and_cookies /app/generated_media /tmp && \
    chown -R 10014:10014 /app /tmp

# 切换到非 root 用户 10014
USER 10014

# 安装必要的 Python 依赖
RUN pip install --upgrade pip && pip install g4f[slim]

# 暴露端口（适用于 Choreo 自动分配的服务端口）
EXPOSE 1337

# 默认执行命令，启动 FreeGPT4
CMD ["python", "-m", "g4f", "--debug", "--port", "1337"]
