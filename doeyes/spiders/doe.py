import scrapy

from urllib.parse import urlparse, parse_qs


class DoeSpider(scrapy.Spider):
    name = 'doe'
    allowed_domains = ['www.schools.nyc.gov']
    start_urls = ["https://www.schools.nyc.gov/calendar/?mpp=12&pg=%d" % i for i in range(1, 5)]

    def parse(self, response):
        urls = response.css("a.btn::attr(href)").getall()
        print(urls)

        for url in urls:
            yield response.follow(url, callback=self.save)

    def save(self, response):
        eventID = parse_qs(urlparse(response.url).query)['eventID'][0]
        filename = f'doe-{eventID}.ics'
        with open(filename, 'wb') as f:
            f.write(response.body)
