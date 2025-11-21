#include <stdio.h>
#include <unistd.h>

int main() {
    pid_t pid = fork();
    
    if (pid == 0) {
        // Child process
        printf("This is the child process. PID: %d\n", getpid());
    } else if (pid > 0) {
        // Parent process
        printf("This is the parent process. PID: %d\n", getpid());
    } else {
        // Fork failed
        printf("Fork failed!\n");
    }
    
    return 0;
}