 Description
This repository contains implementations and explanations for Lab 5 of the Operating Systems course (CSE233) at Alamein University. The lab focuses on process management in Linux, including process creation using fork(), process control, and understanding the roles of linker and loader.
Objectives

Understand process creation using the fork() system call
Learn how to manage processes (start, stop, pause, resume)
Explore the role of the linker in combining object files
Understand the loader's function in executing programs
Practice using makefiles for compilation automation

 Repository Structure
.
├── process_creation.c    # Exercise 1: fork() demonstration
├── file1.c              # Exercise 5: Linker example (part 1)
├── file2.c              # Exercise 5: Linker example (part 2)
├── simple_program.c     # Exercise 6: Loader inspection
├── Makefile             # Automated compilation script
├── answers.txt          # Detailed explanations of all exercises
├── README.md            # This file
└── LICENSE              # MIT License
 Prerequisites

GCC (GNU Compiler Collection)
Make utility
Linux/Unix operating system
Basic knowledge of C programming

Installation (Ubuntu/Debian)
bashsudo apt update
sudo apt install gcc make
 Getting Started
Clone the Repository
bashgit clone https://github.com/yourusername/cse233-lab5-process-management.git
cd cse233-lab5-process-management
Compile All Programs
bashmake all
Run All Programs
bashmake run
Clean Compiled Files
bashmake clean
 Exercises
Exercise 1: Process Creation with fork()
File: process_creation.c
Demonstrates the fork() system call which creates a new child process.
Compile and Run:
bashgcc process_creation.c -o process_creation
./process_creation
Expected Output:
This is the parent process. PID: XXXX
This is the child process. PID: YYYY

Exercise 2 & 3: Process Control
Commands for starting and stopping processes:
bash# Start a background process
sleep 300 &

# List background jobs
jobs

# Find process ID
ps aux | grep sleep

# Stop the process
kill <PID>

# Verify termination
ps aux | grep sleep

Exercise 4: Pause and Resume
bash# Pause a process
kill -STOP <PID>

# Resume the process
kill -CONT <PID>

Exercise 5: The Linker
Files: file1.c, file2.c
Demonstrates how the linker combines multiple object files into a single executable.
Compile and Run:
bashgcc file1.c file2.c -o output_program
./output_program
Expected Output:
Hello from file1!

Exercise 6: The Loader
File: simple_program.c
Inspect dynamic libraries loaded at runtime.
Compile and Inspect:
bashgcc simple_program.c -o simple_program
./simple_program
ldd simple_program
🔧 Makefile Targets
TargetDescriptionmake allCompile all programsmake runCompile and execute all programsmake cleanRemove all compiled executablesmake process_creationCompile only Exercise 1make output_programCompile only Exercise 5make simple_programCompile only Exercise 6
📖 Key Concepts
The Linker

Combines multiple object files into a single executable
Resolves external symbol references
Works at compile-time
Performs static linking

The Loader

Loads executable into memory
Handles dynamic library dependencies
Works at runtime
Sets up the execution environment

fork() System Call

Creates a new process by duplicating the parent
Returns 0 to child, child's PID to parent
Both processes execute independently after fork

 Documentation
For detailed explanations of each exercise, refer to answers.txt in this repository.
 Contributing
This is an academic project. If you're a student, please complete the lab independently to maximize learning.
 License
This project is licensed under the MIT License - see the LICENSE file for details.

Samira Saeed

Course: CSE233 - Operating Systems
University: Alamein University
Faculty: Computer Science & Engineering

 Acknowledgments

Alamein University Faculty of Computer Science & Engineering
Operating Systems Course Instructors
Lab 5 Assignment Guidelines

 Contact
For questions or feedback regarding this lab:

Create an issue in this repository
Contact via university email
