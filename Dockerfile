FROM hlohaus789/g4f:latest
EXPOSE 8080
CMD ["python", "-m", "g4f.cli", "gui", "--host", "0.0.0.0", "--port", "8080"]
