
get_rules:
	curl -o ./files/unblock/crx_url_list.txt http://pac.uku.im/regex

containers: build
	@echo "Did not have docker hub repo yet."

build: get_rules
	docker build -t unblock-squid .

clean:
	@rm -f files/unblock/crx_url_list.txt
