
FROM python:3.10-slim
WORKDIR /usr/src/app

# 安装依赖
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# 配置持久化目录
RUN mkdir -p /app/data && \
    chmod -R 755 /app && \
    ln -s /app/data ./har_and_cookies

# 安装Python依赖
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt markitdown

# 非root用户配置
RUN useradd -m -u 10001 appuser && \
    chown -R appuser:appuser /usr/src/app /app
USER 10001

EXPOSE 8080
CMD ["sh", "-c", "python -m g4f --port ${PORT:-8080} --debug"]
