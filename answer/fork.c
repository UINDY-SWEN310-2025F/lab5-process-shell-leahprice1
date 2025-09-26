#include <stdio.h>
#include <sys/types.h>
#include<unistd.h>
#include <sys/wait.h>

int main(void)
{
    pid_t fork_return = fork();

    if(fork_return < 0){

        perror("Fork Failed");
        return 1;
        
    } else if (fork_return == 0){

        execlp("ls", "ls", "-lt", (char *)NULL);

    } else {
        wait(NULL);
        printf("Child process is done\n");
    }
 
    return 0;
}