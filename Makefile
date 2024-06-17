CXX = g++
SRC = src/main.cpp
OUT = ./build/
EXEC = $(OUT)PHPC

.PHONY: all build run clean release snapshot test beta alpha

all: build

build:
	$(CXX) -o $(EXEC) $(SRC)

run:
ifeq ($(OS),Windows_NT)
	cd tests && $(EXEC).exe test.php && cd ../
else
	cd tests && ./$(EXEC) test.php && cd ../
endif

clean:
ifeq ($(OS),Windows_NT)
	del /S /Q "$(EXEC).exe"
	del /S /Q "$(EXEC)"
else
	rm -f $(EXEC)
endif

release: 
	$(CXX) -O3 -m32 -o $(EXEC)_x32 $(SRC)
	$(CXX) -O3 -m64 -o $(EXEC)_x64 $(SRC)

snapshot: 
	$(CXX) -O2 -m32 -o $(EXEC)_snapshot_x32 $(SRC)
	$(CXX) -O2 -m64 -o $(EXEC)_snapshot_x64 $(SRC)

test: 
	$(CXX) -O1 -m32 -o $(EXEC)_test_x32 $(SRC)
	$(CXX) -O1 -m64 -o $(EXEC)_test_x64 $(SRC)

beta: 
	$(CXX) -O0 -m32 -o $(EXEC)_beta_x32 $(SRC)
	$(CXX) -O0 -m64 -o $(EXEC)_beta_x64 $(SRC)

alpha: 
	$(CXX) -O0 -m32 -o $(EXEC)_alpha_x32 $(SRC)
	$(CXX) -O0 -m64 -o $(EXEC)_alpha_x64 $(SRC)