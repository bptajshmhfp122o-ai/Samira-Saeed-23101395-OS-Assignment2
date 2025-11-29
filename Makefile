# Makefile for CSE233 Lab 5 - Process Management
# Author: Samira Saeed - 23101395
# Course: CSE233 - Operating Systems

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Wextra -std=c11

# Source files (matching YOUR actual files in the repo)
PROCESS_CREATION_SRC = process_creation.c
FILE1_SRC = file1.c
FILE2_SRC = file2.c
SIMPLE_PROGRAM_SRC = simple_program.c

# Executable names
PROCESS_CREATION_EXE = process_creation
LINKER_EXAMPLE_EXE = output_program
LOADER_EXAMPLE_EXE = simple_program

# Default target - build all programs
.PHONY: all
all: process_creation linker_example loader_example
	@echo "================================"
	@echo "All programs compiled successfully!"
	@echo "================================"
	@echo "Available executables:"
	@echo "  - process_creation (Exercise 1: Fork)"
	@echo "  - output_program (Exercise 5: Linker)"
	@echo "  - simple_program (Exercise 6: Loader)"
	@echo ""
	@echo "Run 'make run' to execute all programs"
	@echo "Run 'make clean' to remove all executables"

# Exercise 1: Process Creation with fork()
.PHONY: process_creation
process_creation: $(PROCESS_CREATION_SRC)
	@echo "Compiling Exercise 1: Process Creation (fork)..."
	$(CC) $(CFLAGS) $(PROCESS_CREATION_SRC) -o $(PROCESS_CREATION_EXE)
	@echo "✓ process_creation compiled successfully"
	@echo ""

# Exercise 5: Linker Example (combining file1.c and file2.c)
.PHONY: linker_example
linker_example: $(FILE1_SRC) $(FILE2_SRC)
	@echo "Compiling Exercise 5: Linker Example..."
	@echo "Linking file1.c and file2.c together..."
	$(CC) $(CFLAGS) $(FILE1_SRC) $(FILE2_SRC) -o $(LINKER_EXAMPLE_EXE)
	@echo "✓ output_program compiled and linked successfully"
	@echo ""

# Exercise 6: Loader Example
.PHONY: loader_example
loader_example: $(SIMPLE_PROGRAM_SRC)
	@echo "Compiling Exercise 6: Loader Example..."
	$(CC) $(CFLAGS) $(SIMPLE_PROGRAM_SRC) -o $(LOADER_EXAMPLE_EXE)
	@echo "✓ simple_program compiled successfully"
	@echo ""

# Run all programs
.PHONY: run
run: all
	@echo "================================"
	@echo "Running Exercise 1: Process Creation"
	@echo "================================"
	./$(PROCESS_CREATION_EXE)
	@echo ""
	@echo "================================"
	@echo "Running Exercise 5: Linker Example"
	@echo "================================"
	./$(LINKER_EXAMPLE_EXE)
	@echo ""
	@echo "================================"
	@echo "Running Exercise 6: Loader Example"
	@echo "================================"
	./$(LOADER_EXAMPLE_EXE)
	@echo ""
	@echo "================================"
	@echo "Inspecting dynamic libraries with ldd:"
	@echo "================================"
	ldd ./$(LOADER_EXAMPLE_EXE)
	@echo ""

# Run individual exercises
.PHONY: run-ex1
run-ex1: process_creation
	@echo "Running Exercise 1 (fork)..."
	./$(PROCESS_CREATION_EXE)

.PHONY: run-ex5
run-ex5: linker_example
	@echo "Running Exercise 5 (linker)..."
	./$(LINKER_EXAMPLE_EXE)

.PHONY: run-ex6
run-ex6: loader_example
	@echo "Running Exercise 6 (loader)..."
	./$(LOADER_EXAMPLE_EXE)
	@echo ""
	@echo "Dynamic libraries:"
	ldd ./$(LOADER_EXAMPLE_EXE)

# Clean up compiled files
.PHONY: clean
clean:
	@echo "Cleaning up..."
	rm -f $(PROCESS_CREATION_EXE) $(LINKER_EXAMPLE_EXE) $(LOADER_EXAMPLE_EXE)
	rm -f *.o
	@echo "✓ Clean complete"

# Help target
.PHONY: help
help:
	@echo "CSE233 Lab 5 - Process Management Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  make              - Build all programs (default)"
	@echo "  make all          - Build all programs"
	@echo "  make process_creation - Build Exercise 1 (fork)"
	@echo "  make linker_example   - Build Exercise 5 (linker)"
	@echo "  make loader_example   - Build Exercise 6 (loader)"
	@echo "  make run          - Build and run all programs"
	@echo "  make run-ex1      - Run Exercise 1"
	@echo "  make run-ex5      - Run Exercise 5"
	@echo "  make run-ex6      - Run Exercise 6"
	@echo "  make clean        - Remove all compiled files"
	@echo "  make help         - Show this help message"
