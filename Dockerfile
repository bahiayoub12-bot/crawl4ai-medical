FROM mcr.microsoft.com/playwright/python:v1.58.0-jammy
WORKDIR /app
COPY . .
RUN pip install crawl4ai fastapi uvicorn nest_asyncio
EXPOSE 8080
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
