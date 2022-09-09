PERIOD=2022-2023

output/$(PERIOD).ics:
	mkdir $(PERIOD)
	scrapy crawl doe
	mv *.ics $(PERIOD)
	bin/merge-ics.sh $(PERIOD)
