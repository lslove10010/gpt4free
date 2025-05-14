FROM python:3.13
WORKDIR /app
COPY . .
RUN apt-get update &&\
    pip install -r requirements.txt &&\
    chmod 777 generated_media har_and_cookies
EXPOSE 8080
CMD ["python", "-m", "g4f", "--port", "8080", "--debug"]
USER 10001
