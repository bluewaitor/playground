from douban150.items import Douban150Item
from scrapy import Request
import scrapy


class DoubanSpider(scrapy.Spider):
    name = 'douban'
    headers = {
        'user-Agent': ''
    }
    allowed_domains = ['douban.com']
    start_urls = ['https://movie.douban.com/top250']

    def parse(self, response):
        movies = response.xpath('//*[@id="content"]/div/div/ol/li')
        
        for movie in movies:
            item = Douban150Item()
            item['rank'] = movie.xpath('.//div[@class="pic"]/em/text()').get()
            item['name'] = movie.xpath('.//div[@class="hd"]/a/span[1]/text()').get()
            item['score'] = movie.xpath('.//div[@class="star"]/span[@class="rating_num"]/text()').get()
            item['score_num'] = movie.xpath('.//div[@class="star"]/span/text()').re(r'(\d+)人评价')[0]
            item['poster'] = movie.xpath('.//img/@src').get()
            url = movie.xpath('.//div[@class="pic"]/a/@href').get()
            item['douban_url'] = url

            yield Request(url=url, callback=self.parse_detail, cb_kwargs=dict(item=item))
        next_url = response.xpath('//*[@id="content"]/div/div[1]/div[2]/span[3]/a/@href').get()
        if next_url:
            url = self.start_urls[0] + next_url
            yield Request(url=url)

    def parse_detail(self, response, item):
        item['year'] = response.xpath('//*[@id="content"]/h1/span[2]/text()').re('(\d+)')[0]
        yield item

