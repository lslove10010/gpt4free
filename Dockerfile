
FROM python:3.10-slim

# 使用Choreo推荐的工作目录
WORKDIR /usr/src/app

# 安装系统依赖
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# 拷贝依赖文件
COPY requirements.txt .

# 安装Python依赖
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements-slim.txt

# 创建可写目录（Choreo推荐使用/app目录）
RUN mkdir -p /app/har_and_cookies && \
    chmod -R 777 /app/har_and_cookies && \
    ln -s /app/har_and_cookies /usr/src/app/har_and_cookies

# 使用非root用户（Choreo安全要求）
RUN useradd -m -u 1001 appuser && \
    chown -R appuser:appuser /usr/src/app /app
USER 1001

# 暴露端口（Choreo会自动映射）
EXPOSE 8080

# 启动命令（使用环境变量PORT）
CMD ["sh", "-c", "python -m g4f --port ${PORT:-8080} --debug"]
