FROM python:3.10
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
EXPOSE 8080
CMD ["python", "-m", "g4f", "--port", "8080", "--debug"]
USER 10014
