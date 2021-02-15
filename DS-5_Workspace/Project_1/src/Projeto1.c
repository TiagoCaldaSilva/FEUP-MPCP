/*
 ============================================================================
 Name        : Projeto1.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

extern int SOMA(int aa, int bb);

int main(void) {
	int a = 5;
	int b = 10;
	int ca = 0;
    ca =  SOMA( a, b);
    printf("A soma é %d\n", ca);
	return EXIT_SUCCESS;
}
