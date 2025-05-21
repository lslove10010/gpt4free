FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

# 解决 har_and_cookies 目录问题
RUN mkdir -p /tmp/har_and_cookies && \
    touch /tmp/har_and_cookies/.gui_cache && \
    chmod -R 777 /tmp/har_and_cookies && \
    ln -s /tmp/har_and_cookies /app/har_and_cookies

USER 10014

EXPOSE 8080

CMD ["sh", "-c", "python -m g4f --port ${PORT:-8080} --debug"]
