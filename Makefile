PERIOD=2023-2024

output/$(PERIOD).ics:
	mkdir $(PERIOD)
	scrapy crawl doe
	mv *.ics $(PERIOD)
	bin/merge-ics.sh $(PERIOD)

clean:
	rm output/$(PERIOD).ics
	rm -rf $(PERIOD)
