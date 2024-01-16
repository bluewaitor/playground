import scrapy


class AnnouncementSpider(scrapy.Spider):
    name = 'announcement'
    allowed_domains = ['www.sse.com.cn', 'static-app.97kid.com']
    start_urls = ['https://gate.97kid.com/a/schools?page=1&pageSize=1005']

    def parse(self, response):
        print(response.json())
