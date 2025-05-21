FROM python:3.10-slim

WORKDIR /app

# 安装 Git
RUN apt-get update && apt-get install -y git

# 安装依赖
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8080

CMD ["sh", "-c", "python -m g4f --port ${PORT:-8080} --debug"]
