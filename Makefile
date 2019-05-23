.PHONY: build test lint clean prepare update

PKGS := $(shell go list ./... | grep -v /vendor)

GO=CGO_ENABLED=0 GO111MODULE=on go
GOFLAGS=-ldflags

BIN_DIR := $(GOPATH)/bin
GOMETALINTER := $(BIN_DIR)/gometalinter

MICROSERVICES=./device-camera-go
.PHONY: $(MICROSERVICES)

build: $(MICROSERVICES)
	$(GO) build

test: lint
	$(GO) test ./... -cover

$(GOMETALINTER):
	$(GO) get -u github.com/alecthomas/gometalinter
	gometalinter --install &> /dev/null

lint: $(GOMETALINTER)
	gometalinter ./... --skip vendor --checkstyle --json --disable gotype --disable gotypex --disable maligned --deadline=200s

clean:
	rm -f $(MICROSERVICES)

update:
	$(GO) mod tidy
