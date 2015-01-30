#include <stdio.h>
#include <stdlib.h>

extern void init(char* tab, unsigned int n)__asm__("_init_tab");
extern void crible(char* tab, unsigned int n)__asm__("_crible");

void print_tab(char *tab, unsigned int n) {
	unsigned int i;
	for(i=0; i<n; i++) {
		printf("%d ", tab[i]);
		if(i%10 == 9)
			printf("\n");
	}
	printf("\n");
}

int main(int argc, char** argv) {
	unsigned int n;
	char* tab;
	n = atoi(argv[1]);
	tab = (char*) malloc(sizeof(char)*n);
	init(tab, n);
	print_tab(tab, n);
	crible(tab, n);
	print_tab(tab, n);
	return 0;		
}
