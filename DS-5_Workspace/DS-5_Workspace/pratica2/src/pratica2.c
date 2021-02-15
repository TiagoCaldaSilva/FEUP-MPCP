/*
 ============================================================================
 Name        : pratica2.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

/*
==========================================================
1.
extern int SOMA_V(int v[], int n);

int main(void)
{
	int dim = 5;
	int v[] = {3, -1, 8, 0, -3}; // Para testar
	int res;
	res = SOMA_V(v, dim);
	printf("A Soma dos elementos = %d\n", res);

	return 0;
}

2.a)
extern int Maxword(int v[], int n);
int main(void)
{
	int v[] = {1,2,3,4,5,6,7,6,5,4,5,19};
	int res;
	int dim = 12;
	res = Maxword(v, dim);
	printf("O maior número é = %d\n", res);
	return 0;
}

2.b)
extern Maxdword(long int v[], int n);

int main()
{
	long int v[] = {56,57,45,32,88,1,99};
	int n = 7;
	long int res;
	res = Maxdword(v, n);
	printf("O valor mínimo do vetor é = %ld\n", res);
	return 0;
}

2.c
extern Maxhword(int v[], int n);

int main()
{
	int v[] = {2,3,4,5,3,2};
	int n = 6;
	int res;
	res = Maxhword(v, n);
	printf("Máximo = %d\n", res);
	return 0;
}

2,.d
extern Media(long int v[], int n);

int main()
{
	long int v[] = {1,2,3,4,5,6,8};
	int n = 7;
	long int res;
	res = Media(v,n);
	printf("Media: %ld\n", res);
	return 0;
}


2.e
extern int Inter(int v[],int a, int b, int c);

int main()
{
	int a = 4;
	int b = 8;
	int c = 10;
	int v[] = {1,2,3,4,5,6,7,8,9,10};
	int res;
	res = Inter(v, a, b, c);
	printf("Existem %d valores.\n", res);
	return 0;
}


3.a
extern counter(char v[]);


int main()
{
	char v[] = {'a','b','c','d','\0'};
	int res;
	res = counter(v);
	printf("A cadeia de caracteres tem %d valores.\n", res);
	return 0;
}


3.b
extern caracter(char v[], char a);


int main()
{
	char v[] = {"amareaa0"};
	char a = 'a';
	int res;
	res = caracter(v, a);
	printf("A cadeia de caracteres tem %d valores.\n", res);
	return 0;
}

3.c
extern vogais(char v[]);

int main()
{
	char v[] = "amareloo0";
	int res;
	res = vogais(v);
	printf("Existem %d vogais na palavra %s", res, v);
	return 0;
}

3.d
extern maiuscula(char v[]);

int main()
{
	char v[] = "QuAnTaS TeM0";
	int res;
	res = maiuscula(v);
	printf("Existem %d letras maiusculas em %s", res, v);
	return 0;
}


3.e
extern palyndrome(char v[]);

int main()
{
	char v[] = "ANOtaram A data DA MAraTona";
	int res;
	res = palyndrome(v);
	printf("amarelo %d", res);
	if(res == 1)
	{
		printf("A palavra é um palindromo.\n");
	}
	else
	{
		printf("A palavra não é um palíndromo.\n");
	}
	return 0;
}

3.f
extern npalavras(char v[]);

int main()
{
	char v[] = "Amanhã são cinco   palavras eheh";
	int res;
	res = npalavras(v);
	printf("A string tem %d palavras.", res);
	return 0;
}

4.a)
extern byte_to_double(char v[], long int a[], int n);

int main()
{
	char v[] = "olaaa";
	long int a[] = {0,0,0,0,0};
	word_to_double(v,a,5);
	printf("Novo vetor:");
	for(int i = 0; i < 5; i++)
	{
		printf(a[i]);
	}
	return 0;


4.b)

extern word_to_double(int v[], long int a[], int n);

int main()
{
	int v[] = {1,2,3,4,4};
	long int a[] = {0,0,0,0,0};
	word_to_double(v,a,5);
	printf("Novo vetor:");
	for(int i = 0; i < 5; i++)
	{
		printf(a[i]);
	}
	return 0;
}


5.a)

extern int POS1msb(long int n);

int main()
{
	long int e= 351843726598742310;
	long int x = 1;
	int res;
	res = POS1msb(e);
	int res1;
	res1 = POS1msb(x);
	printf("O primeiro 1 encontra-se na posição %ld.\n", res);
	printf("O primeiro 1 encontra-se na posição %ld.\n", res1);
	return 0;
}


5.b)

extern PAL8(char s[]);

int main()
{
	char s[] = "xBapnaBx";
	int res;
	res = PAL8(s);
	if(res == 1)
		printf("A palavra é um palindromo.\n");
	else if(res == 0)
		printf("A palavra nao e um palindromo.\n");
		return 0;
}


5.c)

extern int NCAP(int n);

int main()
{
	int n = 6;
	int res;
	res = NCAP(n);
	if(res == 1)
		printf("O número é uma capicua.\n");
	else if(res == 0)
		printf("O número  nao é uma capicua.\n");
		return 0;
}


6.a)

extern void myleftshift(int n);

int main()
{
	int n = 31;
	myleftshift(n);
	return 0;
}


6.b)

extern void asr(int n);

int main()
{
	int n = -31231;
	myasr(n);
	return 0;
}



6.c)

extern void myror(int n);

int main()
{
	int n = 31231;
	myror(n);
	return 0;
}



7.a)

extern void VecAdic(int v[], int x[], int n);

int main()
{
	int v[] = {1 ,2, 3};
	int x[] = {5, 6, 7};
	int n = 3;
	VecAdic(v,x,n);
	for (int i = 0; i < 3; i++)
	{
		printf("%ld\n", v[i]);
	}
}



7.b)
extern int VecAdicOver(int x[], int y[], int n);

int main()
{
	int x[] = {20, -2};
	int y[] = {10, -1};
	VecAdicOver(x, y, 2);
	return 0;
}


7.c)

extern void VecMult(int x[], int y, int n);

int main()
{
	int x[] = {20, -2};
	int y = 2;
	VecMult(x, y, 2);
	return 0;
}


7.d)

extern int ProdutoInterno(int v[], int x[], int n);

int main()
{
	int v[] = {1,2,3,4};
	int x[] = {4,5,6,7};
	int n = 4;
	ProdutoInterno(v, x, 4);
	for(int i= 0; i < 4; i++)
	{
		printf("%d", v[i]);
	}
}


extern int Produtointerno(int v[], int x[], int n);


int main()
{
	int v[] = {-1,2,3,58};
	int x[] = {5,6,7,8};
	int n = 4;
	int res = Produtointerno(v, x, n);
	printf("%d", res);
	return 0;
}


11.

extern int countbit(int n);

int main()
{
	int n = 8;
	int res;
	res = countbit(n);
	printf("Sao necessarios %d bits para escrever o número %d.\n", res, n);
	return 0;
}


EX1
extern int EX1(short int *v, long N, int a, int b);

int main()
{
	short int c[] = {1,2,3,4};
	short int *v;
	v = c;
	long n = 4;
	int a = 2;
	int b = 5;
	int res;
	res = EX1(v, n, a, b);
	printf("Existem %d numeros que verificam as condicoes.\n", res);
	return 0;
}



(EXERCÍCIO PARA ENTREGAR 2)
extern int CheckRange( int lim, int tam, int *seq);

int main(void)
{
 int limiar = 20;
 int tamanho = 8;
 int ve[] = {7, -8, -23, 56, 20, -10, 0, 40};
 int res;

 res = CheckRange(limiar, tamanho, ve);
 printf("Foram modificados %d elementos da sequencia ve[]\n", res);
for(int i = 0; i < tamanho; i++)
{
	printf("%d\n", ve[i]);
}
// para o exemplo fornecido o output deve indicar que foram alterados 3 elementos

// no final da execuçao a sequencia ve[] = {7, -8, -20, 20, 20, -10, 0, 20} (podem verificar

//o seu conteúdo durante a execução em modo debug)

return 0;
}


========================================================================================================
FICHA 3
4.a) INVENTADO
extern void iv(int v[], int x);

int main()
{
	int v[] = {1,2,3,4,5,6,7};
	int x = 7;
	iv(v, x);
	for(int i = 0; i < x; i++)
	{
		printf("%d\n", v[i]);
	}
	return 1;
}


4.a) EXERCÍCIO
extern void iv(char *c);

int main()
{
	char c[] = "Frase a ser invertida";
	iv(c);
	printf("%s", c);
	return 1;
}


4.b)
extern int Ver(char *c);

int main()
{
	char c[] = "([nao entendo])";
	int res = Ver(c);
	printf("%d", res);
	return 0;
}


5.b)
extern int Media(int v[], int n);

int main()
{
	int v[] = {1,-3,5,8,47};
	int n = 5;
	int res;
	res = Media(v, n);
	printf("%d\n", res);
	return 1;
}


5.c)
extern int MEDIAMAX(int v[], int n, int x[], int n1);

int main()
{
	int v[] = {1,-3,5,8,47};
	int n = 5;
	int x[] = {100, 50};
	int n1 = 2;
	int res;
	res = MEDIAMAX(v, n, x, n1);
	printf("%d\n", res);
	return 1;
}
============================================================
*/
/*
extern unsigned int CountCommon(unsigned int N, int *seq_A , unsigned int M, int *seq_B);

int main(void)
{
	unsigned int tamA= 10, tamB=8;
	int vectA[] = {3,5,7,2,1,99,1,-1,0,-44};
	int vectB[] = {-44,-2,3, 99, 2, 0, -100, 10};
	unsigned int res;

	res = CountCommon(tamA, vectA, tamB, vectB);
	printf("Número de elementos de vectA[] em vectB[]: %u\n", res);

	// para o exemplo fornecido, o número de elementos indicado na mensagem é 4.

	return 0;
}

*/
extern int Ver(char *c);

int main()
{
	char c[] = "(\"nao entendo\")";
	int res = Ver(c);
	printf("%d", res);
	return 0;
}
