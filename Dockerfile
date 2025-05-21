FROM python:3.10-slim

WORKDIR /home/choreouser

# 安装依赖
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# 拷贝依赖文件
COPY requirements.txt ./

# 安装 Python 依赖
RUN pip install --upgrade pip && pip install -r requirements.txt

# 处理缓存目录
RUN mkdir -p /tmp/har_and_cookies && \
    chmod -R 777 /tmp/har_and_cookies && \
    ln -s /tmp/har_and_cookies /home/choreouser/har_and_cookies

EXPOSE 8080
USER 10001
CMD ["sh", "-c", "python -m g4f --port ${PORT:-8080} --debug"]
