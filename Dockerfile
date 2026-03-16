FROM python:3.11-slim

WORKDIR /app

# 安装系统依赖（Chrome 可选，部分 provider 需要）
RUN apt-get update && apt-get install -y \
    git gcc python3-dev \
    chromium chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# 克隆项目
RUN git clone --depth 1 https://github.com/xtekky/gpt4free.git .

# 安装依赖（按文档顺序）
RUN pip install -r requirements.txt
RUN pip install -e .

# 设置环境
ENV PYTHONUNBUFFERED=1
ENV PORT=8080
ENV G4F_DEBUG=1

EXPOSE 8080

# 按文档方式启动 GUI
CMD ["python", "-m", "g4f.cli", "gui", "--port", "8080", "--debug"]
