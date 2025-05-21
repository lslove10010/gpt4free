
FROM python:3.10-slim

# 设置工作目录和权限
WORKDIR /usr/src/app
RUN mkdir -p /app/har_and_cookies && \
    chmod -R 755 /app/har_and_cookies && \
    ln -s /app/har_and_cookies ./har_and_cookies

# 安装系统依赖（带清理）
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 安装Python依赖
COPY requirements-slim.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements-slim.txt

# 配置非root用户
RUN useradd -m -u 10014 appuser && \
    chown -R appuser:appuser /usr/src/app /app
USER 10014

EXPOSE 8080
CMD ["sh", "-c", "python -m g4f --port ${PORT:-8080} --debug"]
