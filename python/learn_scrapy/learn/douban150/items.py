# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class Douban150Item(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    rank = scrapy.Field()
    name = scrapy.Field()
    year = scrapy.Field()
    score = scrapy.Field()
    score_num = scrapy.Field()
    poster = scrapy.Field()
    douban_url = scrapy.Field()