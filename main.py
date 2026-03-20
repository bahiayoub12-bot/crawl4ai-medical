from fastapi import FastAPI
import httpx
from bs4 import BeautifulSoup

app = FastAPI()

@app.get("/")
def root():
    return {"status": "Medical API is running!"}

@app.get("/crawl")
async def crawl(url: str):
    headers = {"User-Agent": "Mozilla/5.0"}
    async with httpx.AsyncClient() as client:
        r = await client.get(url, headers=headers, timeout=30)
        soup = BeautifulSoup(r.text, "html.parser")
        text = soup.get_text()[:3000]
        return {"content": text}
