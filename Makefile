CXX = g++
SRC = src/main.cpp
OUT = ./build/
VERSION = 1.0.0

build-test:
	$(CXX) -o $(OUT)tests/test-$(VERSION) $(SRC)

build-release:
	$(CXX) -o $(OUT)releases/release-$(VERSION) $(SRC)

run-test: build-test
	cd $(OUT)tests && test-$(VERSION)

run-release: build-release
	cd $(OUT)releases && release-$(VERSION)

clean:
	del /S /Q "$(OUT)tests\*"