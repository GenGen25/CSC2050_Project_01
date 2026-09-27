#include<stdio.h>
#include<stdlib.h>

int factorial(int input){
	//checks if input is 0 or 1 is being used
	if(input == 0 || input == 1){
		return 1;
	}
	else{
		return input * factorial(input - 1);
	}
}

int main(int argc, char *argv[]){
	
	//variable char declaration for pointer s
	char *s;

	//variable char declartion for endptr
	char *endptr;

	//variable long declartion for num
	long num;

	//check command line argrument
	
		for(int i=0; i< argc; i++){

		//converting string into interger
			num = strtol(argv[i], &endptr, 10);
		}


	//produce an input storage
	int input;
	
	//Make a simple factorial function

	int a = factorial(num);	
	printf("%d\n",a);

	/* USE FACORTORIAL FUNCTION TO */
	//int *argc = input;
}
