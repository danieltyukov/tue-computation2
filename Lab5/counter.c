//////////////////////////////////////////////////////////////////////////////////
// Company: Eindhoven University of Technology
// Author: Wouter Schoenmakers
// 
// Create Date: 22/02/2019
// Module Name: counter.c
// Description: 5EIB0 lab 5 counter application program
// 
// Version: 1.0
//////////////////////////////////////////////////////////////////////////////////


#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include <stdint.h>
#include <string.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(void){
	int fd_counter = open("/dev/tue-counter", O_RDWR);
	
        //Write your code here.

	return 0;
}
