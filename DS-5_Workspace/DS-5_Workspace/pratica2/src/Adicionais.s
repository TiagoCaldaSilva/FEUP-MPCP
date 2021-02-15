.text
.global Ver
.type Ver, "function"
/*
====================================================================================================
.global SOMA_V
.type SOMA_V,"function"
1.a)
SOMA_V:	mov x2, x0
		mov x0, 0
LOOP:	cbz x1, FIM
		ldrsw x3, [x2]
		add x0, x0, x3
		add x2, x2, 4
		sub x1, x1, 1
		b LOOP
FIM: 	ret
----- em vez de usar ldrsw teria de usar ldr, pois iriamo pegar em elementos com 64 bits em vez de 32 bits.

__________________________________
2.a)
.global Maxword
.type Maxword, "function"
Maxword:	mov x5, x0
			mov x2, 0
LOOP:		cbz x1, FIM
			ldrsw x3, [x5]
			cmp x3, x2
			b.lt nop
			mov x2, x3
nop:		add x5,x5,4
			sub x1,x1,1
			b LOOP
FIM: 		mov x0, x2
			ret

__________________________________
2.b)
.global Maxdword
.type Maxdword, "function"
Maxdword:	mov x2, x0
			cbz x1, FIM
			ldr x0, [x2]
			b SubAd
LOOP:		cbz x1, FIM
			ldr x3, [x2]
			cmp x0, x3
			b.lt SubAd
			mov x0, x3
SubAd:		sub x1, x1, 1
			add x2, x2, 8
			b LOOP
FIM:		ret

__________________________________
2.c)
.global Maxhword
.type Maxhword, "function"
Maxhword: 	mov x2, x0
			cbz x1, FIM
			ldrsh x0, [x2]
			b SubAd
LOOP:		cbz x1, FIM
			ldrsh x3, [x2]
			cmp x3, x0
			b.le SubAd
			mov x0, x3
SubAd:		sub x1, x1, 1
			add x2, x2, 2
			b LOOP
FIM:		ret

__________________________________
2.d
.global Media
.type Media, "function"
Media: 	mov x2, x0
		mov x0, 0
		mov x5, x1
LOOP:	cbz x1, FIM
		ldr x3, [x2]
		add x0, x0, x3
		sub x1,x1, 1
		add x2, x2, 8
		b LOOP
FIM:	udiv x0, x0, x5
		ret

__________________________________
2.e
.global Inter
.type Inter, "function"
Inter:	mov x4, x0
		mov x0, 0
LOOP:	cbz x3, FIM
		ldrsw x5, [x4]
		cmp x5, x2
		b.gt SubAd
		cmp x1, x5
		b.gt SubAd
		add x0, x0, 1
SubAd:	sub x3, x3, 1
		add x4, x4, 4
		b LOOP
FIM:	ret

__________________________________
3.a)
.global counter
.type counter, "function"
counter:	mov x1, x0
			mov x0, 0
	LOOP:	ldrb w2, [x1]
			cbz w2, FIM
			add x0, x0, 1
			add x1, x1, 1
			b LOOP
	FIM:	ret



__________________________________
3.b
.global caracter
.type caracter, "function"
caracter:	mov x2, x0
			mov x0, 0
LOOP:		ldrb w3, [x2]
			cbz w3, FIM
			cmp w3, w1
			b.ne SubAd
			add x0, x0, 1
SubAd:		add x2, x2, 1
			b LOOP
FIM:		ret

__________________________________
3.c
.global vogais
.type vogais, "function"
vogais:	mov x1, x0
		mov x0, 0
		mov w3, 'a'
		mov w4, 'e'
		mov w5, 'i'
		mov w6, 'o'
		mov w7, 'u'
LOOP:	ldrb w2, [x1]
		add x1, x1, 1
		cbz w2, FIM
		cmp w2, w3
		b.eq S
		cmp w2, w4
		b.eq S
		cmp w2, w5
		b.eq S
		cmp w2, w6
		b.eq S
		cmp w2, w7
		b.eq S
		b LOOP
S:		add x0, x0, 1
		b LOOP
FIM:	ret

__________________________________
3.d
.global maiuscula
.type maiuscula, "function"
maiuscula:	mov x1, x0
			mov x0, 0
			mov w2, 'A'
			mov w3, 'Z'
LOOP:		ldrb w4, [x1]
			cbz w4, FIM
			cmp w2, w4
			b.gt SubAd
			cmp w4, w3
			b.gt SubAd
			add x0, x0, 1
SubAd:		add x1, x1, 1
			b LOOP
FIM:		ret

__________________________________
3.e --> melhor maneira para reverter a cadeia de caracteres??
.global palyndrome
.type palyndrome, "function"
palyndrome:	mov x1, x0
			rev x2, x1
			add x2, x2, 1
			mov x0, 0
			mov w6, 'a'
			mov w7, 'z'
LOOP:		ldrb w3, [x1] //desde o inicio da frase
			cbz w3, EQ
LOOP1:		ldrb w4, [x2] //desde o final da frase

//Sabe-se que a: 0110 0001 e A: 0100 0001 (só muda o 6º bit)
LOOP2:		orr w5, w3, 32 //verificar qual o valor do 6º bit do primeiro numero
			cbz w5, prim_min
			and w3, w3, 31 // passar a 0 se este for 1
prim_min:	orr w5, w4, 32 //verificar qual o valor do 6º bit do segundo numero
			cbz w5, seg_min
			and w4, w4, 31
seg_min:	cmp w3, w6 //compara com 'a'
			b.lt nop //se for menor do que a é preciso passar ao elemento seguinte
			cmp w3, w7 //compara com 'z'
			b.gt nop //se for maior que z é preciso passar ao elemento seguinte
			cmp w4, w6
			b.lt nop2 //igual ao de cima
			cmp w4, w7
			b.gt nop2 //igual ao de cima
			cmp w3, w4 //verificar se as letras são as mesmas
			b.ne FIM //se não forem as mesmas não vai ser palindromo
			add x1, x1, 1
			add x2, x2, 1
			b LOOP
EQ:			mov x0, 1
FIM:		ret
nop:		add x1, x1, 1
			ldrb w3, [x1]
			cbz w3, EQ
			b LOOP2
nop2:		add x2, x2, 1
			ldrb w4, [x2]
			b prim_min

__________________________________
3.f)

.global npalavras
.type npalavras, "function"

npalavras: 	mov x1, x0
			mov x0, 0
			mov x4, 0 //variavel que vai ser utilizada para a primeira vez que o codigo roda
			mov w2, ' ' //para ter algo para comparar com ' '
			mov x5, 0
LOOP:		ldrb w3, [x1]
			cbz w3, FIM //termina quando w3 foi \0
			cbz x4, first //se x4 for a primeira então vai ter um tratamento especial
			cmp w3, w2
			b.ne nesp	//não é espaço, passa para outro
			cbz x5, equal //se x5 == 0 então o caracter antes é ' ', ou seja, não conta como palavra pois existem dois ' ' seguidos
			mov x5, 0	//passa este registo a 0 para que no proximo se saiba que o anterior foi um espaço
			add x1, x1, 1
			b LOOP
nesp: 		add x1, x1, 1
			cbz x5, pontua //pontua apenas se o caracter anterior for um espaço e o próprio for diferente de um espaço
			b LOOP
first:		add x1, x1, 1
			cmp w3, w2 //ver se o primeiro é um espaço
			b.eq LOOP // se for um espaço não vai contar
			mov x4, 1 // se não for um espaço conta
			b LOOP
equal:		add x1, x1, 1 //adiciona pois um anterior tambem era um espaço e este também é
			b LOOP
pontua:		mov x5, 1	//o caracter não é um espaço
			add x0, x0, 1	//ao entrar aqui, pontua pois o caracter anterior é um espaço e este não é
			b LOOP
FIM:		ret

__________________________________
4.a)

.global byte_to_double
.type byte_to_double , "function"
byte_to_double:	cbz x2, FIM
				ldrb w3, [x0]
				strb w3, [x1]
				add x0, x0, 1
				add x1, x1, 8
				sub x2, x2, 1
				b byte_to_double
FIM:			ret

__________________________________
4.b)

.global word_to_double
.type word_to_double , "function"
word_to_double:	cbz x2, FIM	//x2 = 0, termina
				ldrsw x3, [x0] //ir buscar a word ao registo
				str x3, [x1] //escrever no registo das doublewords
				add x1, x1, 8 //adicionar ao registo das double
				add x0, x0, 4 //adiciono ao registo das words
				sub x2, x2, 1	//subtrair o número de words que faltam copiar
				b word_to_double
FIM:			ret

__________________________________
5.a)

.global POS1msb
.type POS1msb , "function"
POS1msb:	clz x0, x0
			mov x1, 63
			sub x0, x1, x0
			ret

__________________________________
5.b)

.global PAL8
.type PAL8 , "function"
PAL8:	mov x1, x0
		mov x0, 0
LOOP:	cbz x7, PAL
		ldr x5, [x1]
		rev x4,x5
		cmp x4, x5
		b.ne FIM
PAL:	mov x0, 1
FIM:	ret

__________________________________
5.c)
.global NCAP
.type NCAP, "function"
NCAP:	mov x1, x0
		mov x0, 0
		mov x3, 4
		clz x4, x1 //contar número de digitos que são "significatvos"
		rbit x2, x1 //inverter a ordem para posteriormente verificar se é capicua
LOOP:	udiv x7, x4, x3 //divisão inteira
		mul x6, x7, x3	//multiplicar o resultado por 4
		sub x5, x4, x6	//substrair para ver o resto
		cbnz x5, NOTYET	//e o resto for zero continua
		lsr x2, x2, x4
		cmp x1, x2
		b.ne FIM
		mov x0, 1
FIM: 	ret
NOTYET:	sub x4, x4, 1 //se o resto não for 0 acrescentamosuma casa
		b LOOP

(outra resolução)

NCAP:	mov x1, x0
		mov x0, 0
		rbit x2, x1
		cmp x2, x1
		b.ne FIM
		mov x0, 1
FIM: 	ret

__________________________________
6.a)
.global myleftshift
.type myleftshift, "function"
myleftshift:	mov x1, 0	//passar x1 a 0
				bfi x1, x0, #8, #56 //pegar em 56 bits de x0 e colocá-los a partir da posição 8 no registo x1
				ret

__________________________________
6.b)
.global myasr
.type myasr, "function"
myasr:	asr x1, x0, #8 //para verificar se está correto
		sbfx x0, x0, #8, #56 //pegar em 56 bits a partir da posição 8 e colocá-los no registo x0, na posição 0, com extensão de sinal
		ret

__________________________________
6.c)
.global myror
.type myror, "function"
myror:	ror x3, x0, #8 //para verificar se está correto
		ubfx x1, x0, #8, #56 //pegar em 56 bits a partir da posição 8 de x0, e passar para x1 havendo uma extensão de 0's
		bfi x1, x0, #56, #8 //pegar nos primeiros 8 bits de x0 e colocá-los a partir da posição 56 em x1
		ret


__________________________________
7.a)

.global VecAdic
.type VecAdic, "function"
VecAdic:	mov x3, x0
LOOP:		cbz x2, FIM
			ldrsw x4, [x3]
			ldrsw x5, [x1]
			add x6, x4, x5
			stur w6, [x0]
			add x0, x0, 4
			add x1, x1, 4
			add x3, x3, 4
			sub x2, x2, 1
			b VecAdic
FIM:		ret


__________________________________
7.b)
VecAdicOver:	mov x3, x0
				mov x10, 64
LOOP:			cbz x2, FIM
				ldrsw x4, [x3]
				ldrsw x5, [x1]
				b counter
CONTINUE:		add x6, x4, x5
				clz x8, x6
				sub x8, x10, x8
				cmp x7, x8
				b.ne OVER
				b SUB


OVER:			cmp x6, 0
				b.lt NEG
				mov x9, #0xFFFFFFFFFFFFFFFF
				sub x7, x10, x7
				lsr x6, x9, x7
				b SUB


NEG:			mov x9, #0xFFFFFFFFFFFFFFFF
				lsl x6, x9, x7
				b SUB



counter:		cmp x7, 0
				b.gt positivo
				cls x7, x4
				sub x7, x10, x7
NEXT:			cmp x8, 0
				b.gt positivo2
				cls x8, x5
				sub x8, x10, x8
FINALY:         cmp x7, x8
				b.gt CONTINUE
				mov x7, x8
				b CONTINUE

positivo:		clz x7, x4
				sub x7, x10, x7
				b NEXT

positivo2:		clz x8, x5
				sub x8, x10, x8
				b FINALY

SUB:			str w6, [x0]
				add x0, x0, 4
				add x1,x1, 4
				add x3, x3, 4
				sub x2, x2, 1
				b LOOP


FIM:			ret


__________________________________
7.c)
VecMult:	cbz x2, FIM
			ldrsw x3, [x0]
			smull x3, w3, w1
			str w3, [x0]
			add x0, x0, 4
			sub x2, x2, 1
			b VecMult
FIM: 		ret

__________________________________
7.d)
.global ProdutoInterno
.type ProdutoIntero, "function"
ProdutoInterno:	mov x3, x0
LOOP:			cbz x2, FIM
				ldrsw x4, [x3]
				ldrsw x5, [x1]
				smull x6, w4, w5
				str w6, [x0]
				add x0, x0, 4
				add x3, x3, 4
				add x1, x1, 4
				sub x2, x2, 1
				b LOOP
FIM:			ret

__________________________________
7.e)
.global Produtointerno
.type Produtointero, "function"
Produtointerno: mov x3, x0
				mov x0, 0
LOOP:			cbz x2, Before
				ldrsw x4, [x1]
				ldrsw x5, [x3]
				smull x6, w4, w5
				add x0, x0, x6
				add x1, x1, 4
				add x3, x3, 4
				sub x2, x2, 1
				b LOOP

Before:			clz x2, x0
				cmp x2, 32
				b.ge FIM
				mov w0, -1
				lsr w0, w0, 1

FIM:			ret


__________________________________
8.
a) 0xF666666F
b) 0x00020000 - Alteram as flags?

__________________________________
9.
a)AB120000
b)00045678
c) qual o valor de x1???


__________________________________
10.
a)se x0 for negativo mantém o valor, se não x0 fica com o simétrico do seu valor
b)Fica com o maior valor dos três registos (X1,X2,X3)
c)Qual o valor de X1?

__________________________________
11.

.global countbit
.type countbit, "function"
countbit:	mov x1, x0
			clz x2, x1
			mov x3, 64
			sub x0, x3, x2
			ret


=====================================================================================================================
FICHA 3

4.a)
.text
.global iv
.type iv, "function"
iv:				stp x29, x30, [SP, #-16]!	//guardar LR e FP
				mov x6, x1					//para ter a quantidade de elementos em dois registos diferentes(push & pop)
				mov x5, 0					//registo que vai servir para verificar se o número de elementos é par ou não
				mov w9, #16
				mov w10, #-8
				smull x3, w1, w10			//para verificar depois se o espaço reservado é multiplo de 16, quantidade de espaço que vão ocupar os elementos
				mov x4, x3
				sdiv x4, x4, x9
				smull x4, w4, w9			//para verificar x3 % 16
				cmp x4, x3
				b.ne ADD 					//se forem iguais então X3 % 16 = 0, se forem diferentes X3 % 16 = 8
T:				mov x29, SP					//localizar FP
				add SP, SP, x3				//Stack Pointer está a reservar espaço para todo o vetor, sendo que x3 é múltiplo de 16
				neg x3, x3					//módulo de x3
				mov x4, x3
				cbz x5, LOOP				//se houver um número par de elementos pode passar para o LOOP pois todo o espaço reservado vai ser utilizado
				sub x3, x3, #8				//se houver um número ímpar não vai escrever na posição mais alta da pilha (posição imediatamente a seguir x29)
				mov x4, x3					//atualizar a quantidade de bits que os elementos vão ocupar

LOOP:			cbz x1, WAIT
				ldrsw x2, [x0]				//x2 tem o inteiro presente em x0
				str x2, [SP, x3]			//guardar na pilhao o valor
				sub x3, x3, 8				//para posteriormente dar push na posição do topo
				add x0, x0, 4				//avançar posição de x0
				sub x1, x1, 1				//diminuir o numero de elementos que ainda se tem de guardar
				b LOOP


ADD:			add x3, x3, #-8 			//stack pointer tem de ser múltiplo de 16, se veio para aqui é porque lhe faltam 8 para o ser
				mov x5, 1					//x5 = 1 se tem numero impar de elementos
				b T


WAIT:			add x3, x3, #8			//após correr os valores todos de x0, x3 ficou a 0 sendo que o último valor em que escreveu foi em x3 = 8
				mov x12, 2
				sdiv x4, x4, x12
				sub x0, x0, x4			//voltar à posição inicial de x0 para escrever lá os valores


LOOP1:			cbz x6, FIM				//quando x6 (numero total de elementos) = 0, chegamos ao final
				ldrsw x7, [SP, x3]		//load do valor guardado em memória, na última posição escrita x3 = 8
				str w7, [x0]			//store em x0
				add x0, x0, 4			//passar para a posição seguinte
				add x3, x3, 8			//passar para a posição anterior para dar pop
				sub x6, x6, 1
				b LOOP1


TTT:			sub x3, x3, #8
				b R
FIM: 			cbz x5, TTT				//se x5 = 0, x3 tem mais 8 valores do que devia de ter;antes de se alocar espaço para os elementos do vetor, x3 = -x, lgo agora tem de se adicionar a SP x
R:				add SP, SP, x3			//se x5 = 1, x3 = 8+(numero de elementos * 8), sendo que tem mais uma posição que foi acrescentada para que SP % 16 = 0
				ldp x29, x30, [SP], #16
				ret

__________________________________
4.a) exercício
iv:		mov x12, 0
		str x12, [SP, #-16]!
PUSH:	ldrb w1, [x0]
		cbz w1, POP
		str w1, [SP, #-16]!
		add x0, x0, 1
		add x12, x12, 1
		b PUSH

POP:	sub x0, x0, x12
		mov x12, 0
LOOP:	ldr w1, [SP], #16
		cbz w1, FIM
		strb w1, [x0]
		add x0, x0, 1
		b LOOP
FIM:	str x12, [x0, 1]!
		ret

__________________________________
4.b)
.global Ver
.type Ver "function"
Ver:		mov w9,  #40	//int('(')
			mov w10, #41	//int(')')
			mov w11, #34	//int('"')
			mov w12, #91	//int('[')
			mov w13, #93	//int(']')
			mov w14, 0		//Verificar as aspas
			mov x15, SP

LOOP:		ldrb w1, [x0]
			cbz w1, VALID
			cmp w1, w9
			b.eq CurvEsq
			cmp w1, w10
			b.eq CurvDir
			cmp w1, w11
			b.eq Aspas
			cmp w1, w12
			b.eq RetEsq
			cmp w1, w13
			b.eq RetDir
			b Add

CurvEsq:	str w1, [SP, #-16]!
			b Add

CurvDir:	ldr w3, [SP], #16
			cmp w3, w9
			b.ne ERROR
			b Add

Aspas:		cbz w14, STR
			mov w14, #0
			ldr w3, [SP]
			cmp w3, w11
			b.ne ERROR
			add SP, SP, #16
			b Add

STR:		str w1, [SP, #-16]!
			mov w14, #1
			b Add

RetEsq:		str w1, [SP, #-16]!
			b Add

RetDir:		ldr w3, [SP], #16
			cmp w3, w12
			b.ne ERROR
			b Add

Add:		add x0, x0, 1
			b LOOP

ERROR:		mov x0, 0
			mov SP, x15
			b FIM

VALID:		ldr w3, [SP]
			cmp w3, w9
			b.eq ERROR
			cmp w1, w11
			b.eq ERROR
			cmp w1, w12
			b.eq ERROR
			mov x0, 1
FIM:		ret

__________________________________
5.a)
.global F3EX05
.type F3EX05, "function"
F3EX05:	mov x2, x0
		mov x0, 0
LOOP:	cbz x1, FIM
		ldrsw x3, [x2]
		add x0, x0, x3
		sub x1, x1, 1
		add x2, x2, 4
		b LOOP
FIM:	ret

__________________________________
5.b)
.global Media
.type Media, "function"
Media:	stp x29, x30, [SP, #-16]!
		mov x29, SP
		mov x5, x1
		bl F3EX05
		sdiv x0, x0, x5
		ldp x29, x30, [SP], #16
		ret

__________________________________
5.c)
.global MEDIAMAX
.type MEDIAMAX, "function"
F3EX05:	mov x13, x0
		mov x0, 0
LOOP:	cbz x1, FIM
		ldrsw x12, [x13]
		add x0, x0, x12
		sub x1, x1, 1
		add x13, x13, 4
		b LOOP
FIM:	ret


Media:	stp x29, x30, [SP, #-16]!
		mov x29, SP
		mov x5, x1
		bl F3EX05
		sdiv x0, x0, x5
		ldp x29, x30, [SP], #16
		ret


MEDIAMAX:	stp X29, X30, [SP, #-16]!
			mov X29, SP
			bl Media
			mov x6, x0
			mov X0, X2
			mov X1, X3
			bl Media
			cmp X0, X6
			b.gt fim
			mov x0, x6

fim: 		ldp X29, X30, [SP], #16
			ret
============================================================
*/

Ver:		mov w9,  #40	//int('(')
			mov w10, #41	//int(')')
			mov w11, #34	//int('"')
			mov w12, #91	//int('[')
			mov w13, #93	//int(']')
			mov w14, 0		//Verificar as aspas
			mov x15, SP

LOOP:		ldrb w1, [x0]
			cbz w1, VALID
			cmp w1, w9
			b.eq CurvEsq
			cmp w1, w10
			b.eq CurvDir
			cmp w1, w11
			b.eq Aspas
			cmp w1, w12
			b.eq RetEsq
			cmp w1, w13
			b.eq RetDir
			b Add

CurvEsq:	str w1, [SP, #-16]!
			b Add

CurvDir:	ldr w3, [SP], #16
			cmp w3, w9
			b.ne ERROR
			b Add

Aspas:		cbz w14, STR
			mov w14, #0
			ldr w3, [SP]
			cmp w3, w11
			b.ne ERROR
			add SP, SP, #16
			b Add

STR:		str w1, [SP, #-16]!
			mov w14, #1
			b Add

RetEsq:		str w1, [SP, #-16]!
			b Add

RetDir:		ldr w3, [SP], #16
			cmp w3, w12
			b.ne ERROR
			b Add

Add:		add x0, x0, 1
			b LOOP

ERROR:		mov x0, 0
			mov SP, x15
			b FIM

VALID:		ldr w3, [SP]
			cmp w3, w9
			b.eq ERROR
			cmp w1, w11
			b.eq ERROR
			cmp w1, w12
			b.eq ERROR
			mov x0, 1
FIM:		ret

