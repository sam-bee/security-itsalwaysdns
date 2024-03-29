.PHONY: build test

build: --build-dnsexfiltool --build-dnsreceiver

test: --test-shared --test-dnsexfiltool --test-dnsreceiver

--build-dnsexfiltool:
	if [ ! -f "./dns_exfil_tool/config/config.toml" ]; then exit 1; fi
	echo "Building DNS receiver..."
	cd dns_exfil_tool; \
	go build -o ./bin/det ./main.go; \
	echo "Built to ./dns_exfil_tool/bin/det"; \
	echo "\n\n";

--build-dnsreceiver:
	echo "Building DNS receiver..."
	cd dns_receiver; \
	go build -o ./bin/dnsreceiver ./main.go; \
	echo "Built to ./dns_receiver/bin/dnsreceiver"; \
	echo "\n\n";

--test-shared:
	cd ./shared; \
	go fmt ./...; \
	go build ./...; \
	go test -v ./...; \
	echo "\n\n";

--test-dnsexfiltool:
	cd ./dns_exfil_tool; \
	go fmt ./...; \
	go build ./...; \
	go test -v ./...; \
	echo "\n\n";

--test-dnsreceiver:
	cd ./dns_receiver; \
	go fmt ./...; \
	go build ./...; \
	go test -v ./...; \
	echo "\n\n";
