FROM python:3.10

WORKDIR /app

COPY . .

# 安装依赖
RUN pip install -r requirements.txt

# 创建写入目录并赋权
RUN mkdir -p /app/har_and_cookies /app/generated_media && \
    chown -R 10014:10014 /app/har_and_cookies /app/generated_media

EXPOSE 8080

# 切换到非root用户
USER 10014

CMD ["python", "-m", "g4f", "--port", "8080", "--debug"]
