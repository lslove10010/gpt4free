FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

# 确保 har_and_cookies 目录存在并有写权限
RUN mkdir -p /tmp/har_and_cookies && chmod -R 777 /tmp/har_and_cookies && ln -s /tmp/har_and_cookies /app/har_and_cookies

USER 10014

EXPOSE 8080

CMD ["sh", "-c", "python -m g4f --port ${PORT:-8080} --debug"]
