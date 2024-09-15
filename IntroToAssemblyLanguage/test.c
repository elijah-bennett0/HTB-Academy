#include <stdio.h>
#include <unistd.h>

int main() {
	char *args[] = {"/bin/cat", "flag.txt", (char*) NULL};
	execve(args[0], args, NULL);
	return 0;
};
