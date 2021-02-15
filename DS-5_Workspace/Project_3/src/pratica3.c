/*
 ============================================================================
 Name        : pratica3.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 1.A
 extern double F4EX1A(double b, double m, double n);
 int main(void) {
	double b = 7.8;
	double m = 3.6;
	double n = 7.1;
	double p = conta(b, m, n);
	printf("%f\n", p);
	return 0;
}
 */


/*
 * 1.B
 extern double F4EX1B(int w, double x);
 int main(){
 	double x = 7.1;
	int w = 7;
	double y = F4EX1B(w, x);
	printf("%f\n", y);
 	 return 0;
 }
 */


/*
 * 2.A
 extern float F4EX2A(float a, float b, float c, float d);
 int main(){
 	float a = 2.2;
	float b = 3.3;
	float c = 0.2;
	float d = 9.3;
	float res = F4EX2A(a, b, c, d);
	print("%d\n", res);
	return 0;
}
*/


/*
 * 2.B
 extern double F4EX2B(double raio);
 int main(){
 	double raio = 3.2;
	double res = F4EX2B(raio);
	printf("%lf", res);
	return 0;
}
*/


/*
 * 2.C
 extern double F4EX2C(double x1, double y1, double x2, double y2);
 int main(){
 	double x1 = 2;
	double x2 = 3.4;
	double y1 = 5.3;
	double y2 = 7.7;
	double d;
	d = F4EX2C(x1, y1, x2, y2);
	printf("lf\n", res);
	return 0;
}
*/


/*
 * 3
 extern double F4EX3(float *tab);
 int main(){
	float tab[101];
	F4EX3(tab);
	printf("%f\n", tab[1]);
	printf("%f\n", tab[100]);
}
 */


/*
 * 4
extern double F4EX4(double x, double *coefs, int n);

int main(){
	double x = 7;
	double coefs[] = {3, 5, 6, 8};
	int n = 4;
	double res = F4EX4(x, coefs, n);
	printf("%lf\n", res);
	return 0;
}
*/


/*
 * 5
 extern double F4EX5(float *X, float *Y, int n);
 int main(){
 	 float x[] = {0.1,2,3,4};
 	 float y[] = {5, 6, 7, 2.8};
 	 int n = 4;
 	 double res = F4EX5(x, y, n);
 	 printf("%lf\n", res);
 	 return 0;
}
*/

/*
 * 6
 extern long int F4EX6(float *X, long int n, float a, float b);
 int main(){
 	 float x[] = {0.1,2.6,35.4,-3.2, -3.4};
 	 float a = -3.3;
 	 float b = 35.4;
 	 long int n = 5;
 	 long int res = F4EX6(x, n, a, b);
 	 printf("%ld\n", res);
 	 return 0;
}
*/

/*
 * 7
 extern double F4EX7(double x);
 int main(){
	double x = 8.3;
	double y = -3;
	x = F4EX7(x);
	y = F4EX7(y);
	printf("%lf\n", x);
	printf("%lf\n", y);
	return 0;
}
*/

/*
 * 8A
 extern double F4EX8A(double x);
 int main(){
	double x = 2.354;
	double res;
	res = F4EX8A(x);
	printf("%lf\n", res);
	return 0;
}
*/

/*
 * 8B
 extern double F4EX8A(double x);
 extern double F4EX8B(double x);
 int main(){
	double x = 2.354;
	double res1 = F4EX8A(x);
	double res2 = F4EX8B(-x);
	printf("Diferentes? %lf , %lf\n", res1, res2);
	return 0;
}
 */

/*
 * 9A
 extern double F4EX9A(double x);
 int main(){
	double x = 0.785;
	double res;
	res = F4EX9A(x);
	printf("%lf\n", res);
	return 0;
}
 */

/*
 * 9B
 extern double F4EX9B(double x);
 int main(){
	double x = 3.14;
	double res;
	res = F4EX9B(x);
	printf("%lf\n", res);
	return 0;
}
*/

/*
 * 9C
 extern double F4EX9C(double x);
 int main(){
	printf("X\t\t\t\tY\n");
	for(double i = 0; i < 91; i++)
	{
		printf("%lf\t%lf\n", i, F4EX9C(i));
	}
	return 0;
}
*/

/*
extern int Calculator (unsigned int N, char *seq_OP, int *seq_B, int *seq_A);

int main(void)
{
unsigned int size =6;
int vectA[] = {-13,347, -80000000, -80000000, -5, -25};
//int vectB[] = {9, 2, 3, 0, 1, -25}; // com overflow : exemplo (a)
int vectB[] = {2, -2,-3, 3, -1, -25}; // sem overflow  : exemplo (b);
char vectOP[] = {'P', '+', '*', '*', '-', '+'};
int execucao = Calculator(size, vectOP, vectB, vectA);
int i;
if (execucao){
    printf("Overflow na opera��o %d\n", execucao);
    for (i = 1; i < execucao; i++)
        printf("elemento %d resultado = %d\n", i, vectA[i-1]);}
else
    for (i = 1; i <= size; i++)
        printf("elemento %d resultado = %d\n", i , vectA[i-1]);
 return 0;
}
*/

/*
extern void TESTAR( long int n, int x);

int main(){
	long int n = 2315076489089952683;
	int x = 2684354561;
	TESTAR(n, x);
	return 0;
}
*/

/*
 * 1A
 extern void F5EX1A(float *p, float *q, float *r, int n);
 int main()
{
	float p[] = {2.2, 3.3, 1.5, 2.9};
	float q[] = {0.8,0.7,0.5,0.99};
	float r[] = {1, 2, 3, 4};
	int n = 4;
	F5EX1A(p, q, r, n);
	for(int i = 0; i < 4; i++)
	{
		printf("%f\n", r[i]);
	}
	return 0;
}
*/

/*
 * 1B
 extern void F5EX1B(float *p, int n, float k);
 int main()
{
	float p[] = {2.3, 3.4, 1, 4.8};
	int n = 4;
	float k = 0.33;
	F5EX1B(p, n, k);
	for(int i = 0; i < 4; i++)
	{
		printf("%f\n", p[i]);
	}
	return 0;
}
*/

/*
 * 1C
 extern void F5EX1C(float *P, float *Q, float *R, int n, float k);
 int main()
{
	float p[] = {1.1, 2.2, 3.3, 4.4};
	float q[] = {2.3, 3.4, 4.5, 5.6};
	float r[4];
	float k = 3.3;
	int x = 4;
	F5EX1C(p, q, r, x, k);
	for(int i = 0; i < 4; i++)
	{
		printf("%f\n", r[i]);
	}
	return 0;
}
*/

/*
 * 2
 extern long int F5EX2(int *R, int *S, int n);
 int main()
{
	int r[] = {1,2,3,4,5,6,7,8};
	int s[] = {-2147483648, 10, 11, 12, 13, 14, 15, 16};
	int n = 8;
	long int res;
	res = F5EX2(r, s, n);
	printf("%ld\n", res);
	return 0;
}
*/

/*
 * 3
 extern long int F5EX3(char *V, long int n, char val);
 int main()
{
	char v[] = "aa toda a gente\0";
	char val = 'a';
	long int n = 16;
	long int res = F5EX3(v, n, val);
	printf("%ld\n", res);
	return 0;
}
 */

/*
 * 4
 extern void F5EX4(int *Z, int n, int x);
 int main()
{
	int z[] = {1,2,3,99, 1432, 213427184,2147483647,-10};
	int n = 8;
	int x = 10;
	F5EX4(z, n, x);
	for(int i = 0; i < 8; i++)
	{
		printf("%d\n", z[i]);
	}
	return 0;
}

 */

/*
 * 5
 extern void F5EX5(float *pt, int n);
 int main()
{
	float pt[] = {1.2, 3.2, 4.5, 7.2, 0.1, 3.4, 9.3, 2.9};
	int n = 4;
	F5EX5(pt, n);
	for(int i = 0; i < n; i += 2)
	{
		printf("%f,%f\n", pt[i], pt[i+1]);
	}
	return 0;
}
*/

/*
 * 6
 extern double F5EX6(double *ptV, long int n);
 int main()
 {
	 double ptV[] = {1,2,3,4,5,6};
	 long int n = 6;
	 double res = F5EX6(ptV, n);
	 printf("%lf\n", res);
	 return 0;
 }
*/

/*
 *
 * 7
 extern long int F5EX7(float *V, long int n, float lim);
 int main()
{
	float V[] = {1.2, 3.4, -4.2, -90, 0, 90, 77, -2};
	long int n = 8;
	float lim = 3.3;
	long int res = F5EX7(V, n, lim);
	printf("%ld\n", res);
	return 0;
}
*/

/*
 * EXERC�CIO SEMANAL*/
 extern void eStep(unsigned int N, float *seq_P , unsigned int M, double *seq_C, unsigned int *seq_Out);
 int main(void)
{
	 unsigned int N = 5, M = 3;
	 	float seq_P[] = {-3.1, 0, 2.5, -2, 3, 2, 0.5, 1, -5, -1};
	 	double seq_C[] = {-2, -2, 0, 0, 2, 2};
	 	unsigned int seq_Out[N];

	 	eStep(N, seq_P, M, seq_C, seq_Out);

	 	for(int i = 0; i < N; i++){
	 		printf("O ponto %d da seq_P (%f, %f) tem como ponto da seq_C mais pr�ximo o ponto de �ndice %d (%f, %f)\n",
	 				i, seq_P[i*2], seq_P[i*2 + 1], seq_Out[i], seq_C[seq_Out[i]*2], seq_C[seq_Out[i]*2 + 1]);
	 	}

	// Neste exemplo a sequ�ncia seq_Out deveria passar a conter {0, 1, 2, 1, 0} ap�s a execu��o da sub-rotina

 	return 0;
}
/**/

/*
 * 8
 extern void F5EX8(float *X, float *Y, int n, float da);
 int main()
{
	float x[] = {1.3, 2.5, 2.9, 10.2, 47.2, -0.1, 6.65, 23.23};
	float y[] = {2.3, 1.5, 2.9, 9.02, 10.1, 100.2, 7.33, 4.2};
	int n = 8;
	float da = 2.3;
	F5EX8(x, y, n, da);
	for(int i = 0; i < n; i++)
	{
		printf("%f\n", y[i]);
	}
	return 0;
}
*/

/*
 * 9
extern void F5EX9(float *Z1, float *Z2, float *Z, long int n);
int main()
{
	float z1[] = {1,2,3,4,5,6,7,8};
	float z2[] = {9,10,11,12,13,14,15,16};
	long int n = 4;
	float z[8];
	F5EX9(z1, z2, z, n);
	for(int i = 0; i < 2*n; i += 2)
	{
		printf("%f + %fi\n", z[i], z[i+1]);
	}
}
*/



/*
*TRABALHO SEMANAL 5

extern char freqchars(unsigned int N, char *text, char nl, char *lett, float *freq);

int main()
{
    unsigned int N = 48;
    char text[] = "A funcao retorna a frequencia absoluta da letra ppPpppppp";
    char nl = 4;
    char lett[] = {'a', 'a', 'u', 'r'};
    //char lett[] = {'y', 'k', 'x', 'z'};
    float freq[nl];
    char buf[10];

    char res = freqchars(N, text, nl, lett, freq);

    if (nl)
        for(int i = 0; i < nl; i++) {
            gcvt(freq[i], 3, buf);       // para contornar o bug do printf ao imprimir floats
            printf("A letra '%c' ocorre em %s%% do texto.\n", lett[i], buf);
        }
    if (res)
        printf("Das letras pesquisadas no texto, '%c' � a mais frequente.\n", res);

        // Neste exemplo, 'freq' dever� conter {0, 18.8, 6.25, 8.33} ap�s a execu��o da sub-rotina
        // e 'a' � o carater mais frequente.
    return 0;
}
*/

/*
extern int TESTE(int a, int b, long int c);

int main()
{
	int a = 5;
	int  b= 2;
	long int c = 288989512212349685;
	int res = TESTE(a,b,c);
	printf("%d\n", res);
	return 0;
}
*/
