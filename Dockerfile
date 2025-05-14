FROM python:3.13
WORKDIR /app
COPY . .
RUN pip install -r requirements-slim.txt
EXPOSE 8080
CMD ["python", "-m", "g4f", "--port", "8080", "--debug"]
USER 10014
