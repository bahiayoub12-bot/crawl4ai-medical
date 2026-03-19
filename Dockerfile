FROM python:3.11-slim
RUN apt-get update && apt-get install -y chromium chromium-driver wget
RUN pip install crawl4ai nest_asyncio
RUN python3 -m playwright install chromium --with-deps
WORKDIR /app
COPY . .
CMD ["python3", "test.py"]
