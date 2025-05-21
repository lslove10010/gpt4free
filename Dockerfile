# 选择更小、更安全的基础镜像
FROM python:3.13

WORKDIR /app

# 使用 apk 添加 git 并清理缓存
RUN apk add --no-cache git

COPY requirements.txt .

# 使用单个 RUN 语句减少镜像层
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

EXPOSE 8080
USER 10014
CMD ["sh", "-c", "python -m g4f --port ${PORT:-8080} --debug"]
