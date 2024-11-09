BINARY_NAME=hardship

build:
	GOARCH=amd64 GOOS=darwin go build -o $(BINARY_NAME)-darwin cmd/main.go
	GOARCH=amd64 GOOS=linux go build -o $(BINARY_NAME)-linux cmd/main.go
	GOARCH=amd64 GOOS=windows go build -o $(BINARY_NAME)-windows cmd/main.go

run: build
	./$(BINARY_NAME)-darwin

clean:
	go clean
	rm -f $(BINARY_NAME)-darwin
	rm -f $(BINARY_NAME)-linux
	rm -f $(BINARY_NAME)-windows

test:
	go test ./...

test_coverage:
	go test ./... -coverprofile=coverage.out

dep:
	go mod download

vet:
	go vet

lint:
	golangci-lint run --enable-all
