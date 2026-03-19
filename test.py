import nest_asyncio
nest_asyncio.apply()
import asyncio
from crawl4ai import AsyncWebCrawler

async def main():
    async with AsyncWebCrawler(headless=True) as crawler:
        result = await crawler.arun("https://www.who.int")
        print(result.markdown[:300])

asyncio.run(main())
