FROM python:3.11-slim
RUN apt-get update && apt-get install -y chromium chromium-driver wget
WORKDIR /app
COPY . .
RUN pip install crawl4ai fastapi uvicorn nest_asyncio
RUN python3 -m playwright install chromium --with-deps
EXPOSE 8080
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
