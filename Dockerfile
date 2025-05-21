FROM python:3.10-slim

WORKDIR /home/choreouser

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./

RUN pip install --upgrade pip && pip install -r requirements.txt

RUN mkdir -p /tmp/har_and_cookies && \
    chmod -R 777 /tmp/har_and_cookies && \
    touch /tmp/har_and_cookies/.gui_cache && \
    ln -s /tmp/har_and_cookies /home/choreouser/har_and_cookies

EXPOSE 8080

CMD ["sh", "-c", "python -m g4f --port ${PORT:-8080} --debug"]
