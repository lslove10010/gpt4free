FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8080

USER 10014

CMD ["sh", "-c", "python -m g4f --port ${PORT:-8080} --debug"]
