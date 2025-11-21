# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra

# Targets
TARGETS = process_creation output_program simple_program

# Default target: build all programs
all: $(TARGETS)

# Exercise 1: Process creation using fork()
process_creation: process_creation.c
	$(CC) $(CFLAGS) process_creation.c -o process_creation

# Exercise 5: Linking multiple files
output_program: file1.c file2.c
	$(CC) $(CFLAGS) file1.c file2.c -o output_program

# Exercise 6: Simple program for loader inspection
simple_program: simple_program.c
	$(CC) $(CFLAGS) simple_program.c -o simple_program

# Run all programs
run: all
	@echo "=== Running process_creation ==="
	./process_creation
	@echo ""
	@echo "=== Running output_program ==="
	./output_program
	@echo ""
	@echo "=== Running simple_program ==="
	./simple_program
	@echo ""
	@echo "=== Checking dynamic libraries for simple_program ==="
	ldd simple_program

# Clean compiled files
clean:
	rm -f $(TARGETS)

# Phony targets
.PHONY: all run clean