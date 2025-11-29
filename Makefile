

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Wextra -std=c11

# Source files (assuming they're in the current directory based on your repo)
FORK_SRC = Fork.c
FILE1_SRC = File1.c
FILE2_SRC = file2.c
SIMPLE_PROGRAM_SRC = simple_program.c
PAUSE_RESUME_SRC = pause_resume.c

# Executable names
FORK_EXE = Fork
LINKER_EXAMPLE_EXE = output_program
LOADER_EXAMPLE_EXE = simple_program
PAUSE_RESUME_EXE = pause_resume

# Default target - build all programs
.PHONY: all
all: fork linker_example loader_example pause_resume
	@echo "================================"
	@echo "All programs compiled successfully!"
	@echo "================================"
	@echo "Available executables:"
	@echo "  - Fork (Exercise 1)"
	@echo "  - output_program (Exercise 5)"
	@echo "  - simple_program (Exercise 6)"
	@echo "  - pause_resume (Exercise 4)"
	@echo ""
	@echo "Run 'make run' to execute all programs"
	@echo "Run 'make clean' to remove all executables"

# Exercise 1: Fork - Process Creation
.PHONY: fork
fork: $(FORK_SRC)
	@echo "Compiling Exercise 1: Fork (Process Creation)..."
	$(CC) $(CFLAGS) $(FORK_SRC) -o $(FORK_EXE)
	@echo "✓ Fork compiled successfully"
	@echo ""

# Exercise 5: Linker Example (combining File1.c and file2.c)
.PHONY: linker_example
linker_example: $(FILE1_SRC) $(FILE2_SRC)
	@echo "Compiling Exercise 5: Linker Example..."
	@echo "Linking File1.c and file2.c together..."
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

# Exercise 4: Pause and Resume Process
.PHONY: pause_resume
pause_resume: $(PAUSE_RESUME_SRC)
	@echo "Compiling Exercise 4: Pause/Resume..."
	$(CC) $(CFLAGS) $(PAUSE_RESUME_SRC) -o $(PAUSE_RESUME_EXE)
	@echo "✓ pause_resume compiled successfully"
	@echo ""

# Run all programs
.PHONY: run
run: all
	@echo "================================"
	@echo "Running Exercise 1: Fork"
	@echo "================================"
	./$(FORK_EXE)
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
.PHONY: run-fork
run-fork: fork
	@echo "Running Fork example..."
	./$(FORK_EXE)

.PHONY: run-linker
run-linker: linker_example
	@echo "Running Linker example..."
	./$(LINKER_EXAMPLE_EXE)

.PHONY: run-loader
run-loader: loader_example
	@echo "Running Loader example..."
	./$(LOADER_EXAMPLE_EXE)
	@echo ""
	@echo "Dynamic libraries:"
	ldd ./$(LOADER_EXAMPLE_EXE)

# Clean up compiled files
.PHONY: clean
clean:
	@echo "Cleaning up..."
	rm -f $(FORK_EXE) $(LINKER_EXAMPLE_EXE) $(LOADER_EXAMPLE_EXE) $(PAUSE_RESUME_EXE)
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
	@echo "  make fork         - Build Exercise 1 (Fork)"
	@echo "  make linker_example - Build Exercise 5 (Linker)"
	@echo "  make loader_example - Build Exercise 6 (Loader)"
	@echo "  make pause_resume   - Build Exercise 4 (Pause/Resume)"
	@echo "  make run          - Build and run all programs"
	@echo "  make run-fork     - Run Exercise 1"
	@echo "  make run-linker   - Run Exercise 5"
	@echo "  make run-loader   - Run Exercise 6"
	@echo "  make clean        - Remove all compiled files"
	@echo "  make help         - Show this help message"
