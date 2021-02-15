.data
F2A: 	.float 3
PI:		.double 3.141592653
F3a0: 	.float 0
F3a1:	.float 0.1
F3a2: 	.float 1.5
F3a3:	.float 12.5
F3a4: 	.float 7
F4: 	.int 8
F8a1:	.double 0.278393
F8a2:	.double 0.230389
F8a3:	.double 0.000972
F8a4:	.double 0.078108
testar: .double 0.123, 0.234, 0.345, 0.456
zeros:	.double 0
Z: .float 0.0
C: .float 100.0

.text
.global F4EX1A
.type F4EX1A, "function"
.global F4EX1B
.type F4EX1B, "function"
.global F4EX2A
.type F4EX2A, "function"
.global F4EX2B
.type F4EX2B, "function"
.global F4EX2C
.type F4EX2C, "function"
.global Ver
.type Ver, "function"
.global F4EX3
.type F4EX3, "function"
.global F4EX4
.type F4EX4, "function"
.global F4EX5
.type F4EX5, "function"
.global F4EX6
.type F4EX6, "function"
.global F4EX7
.type F4EX7, "function"
.global F4EX8A
.type F4EX8A, "function"
.global F4EX8B
.type F4EX8B, "function"
.global F4EX9A
.type F4EX9A, "function"
.global F4EX9B
.type F4EX9B, "function"
.global F4EX9C
.type F4EX9C, "function"
.global power
.type power, "function"
.global TESTAR
.type TESTAR, "function"
.global F5EX1A
.type F5EX1A, "function"
.global F5EX1B
.type F5EX1B, "function"
.global F5EX1C
.type F5EX1C, "function"
.global F5EX2
.type F5EX2, "function"
.global F5EX3
.type F5EX3, "function"
.global F5EX4
.type F5EX4, "function"
.global F5EX5
.type F5EX5, "function"
.global F5EX6
.type F5EX6, "function"
.global F5EX7
.type F5EX7, "function"
.global F5EX8
.type F5EX8, "function"
.global F5EX9
.type F5EX9, "function"
.global TESTE
.type TESTE, "function"

/*==========================================================================*/

F4EX1A:	fadd d0, d0, d2
		fnmul d0, d0, d1
		fneg d0, d0
		ret

/*==========================================================================*/

F4EX1B:	fsqrt d0, d0
		scvtf d1, w0
		fadd d0, d0, d1
		ret

/*==========================================================================*/

F4EX2A:	fsub s1, s0, s1
		fmul s1, s1, s2
		fadd s0, s3, s0
		ldr s2, F2A
		fsub s0, s0, s2
		fdiv s0, s1, s0
		ret

/*==========================================================================*/

F4EX2B:	fmul d0, d0, d0
		ldr d2, PI
		fmul d0, d0, d2
		ret

/*==========================================================================*/

F4EX2C:	fsub d0, d2, d0
		fsub d1, d3, d1
		fmul d0, d0, d0
		fmul d1, d1, d1
		fadd d0, d0, d1
		fsqrt d0, d0
		ret

/*==========================================================================*/

F4EX3:	mov x1, #101
		ldr s3, F3a0	//valor de x
		ldr s4, F3a1	//valor de 0.1
		ldr s5, F3a2	//valor de 1.5
		ldr s6, F3a3	//valor de 12.5
		ldr s7, F3a4	//valor de 7

LOOP3:	cbz x1, END
		ldr s16, F3a0
		fmul s2, s3, s3
		fmul s2, s2, s3
		fmul s2, s5, s2 //valor de 1.5*x^3
		fadd s16, s16, s2
		fmul s2, s6, s3	//valor de 12.5*x
		fsub s16, s16, s2
		fadd s16, s16, s7
		str s16, [x0], #4
		fadd s3, s3, s4
		sub x1, x1, 1
		b LOOP3

END:	ret

/*==========================================================================*/

F4EX4:	sub x2, x1, #1
		ldr x3, F4
		mul x3, x2, x3
		add x0, x0, x3
		ldr d1, [x0], #-8
LOOP4:	cbz x2, FIM4
		ldr d2, [x0], #-8
		fmul d1, d1, d0
		fadd d1, d1, d2
		sub x2, x2, 1
		b LOOP4

FIM4: 	fmov d0, d1
		ret

/*==========================================================================*/

F4EX5:	ldr d0, F3a0
LOOP5:	cbz x2, FIM5
		ldr s2, [x0], #4
		ldr s1, [x1], #4
		fmul s2, s1, s2
		fcvt d1, s2
		fadd d0, d0, d1
		sub x2, x2, #1
		b LOOP5

FIM5:	ret

/*==========================================================================*/

F4EX6:	mov x2, x0
 		mov x0, 0
LOOP6:	cbz x1, FIM6
		ldr s2, [x2], #4
		fcmp s2, s1			//comparar com o maior elemento do intervalo
		b.gt Sub6			//se maior, está fora
		fcmp s2, s0			//comparar com o menor elemento
		b.lt Sub6			//se menor, está fora
		add x0, x0, 1		//está dentro

Sub6:	sub x1, x1, 1
		b LOOP6

FIM6:	ret

/*==========================================================================*/

F4EX7:		fcmp d0, #0.0
			b.ge LessThan
			mov x0, #4
			mov x1, #1
			ucvtf d1, x0
			ucvtf d2, x1
			fsub d0, d1, d0
			fsqrt d0, d0
			fdiv d0, d2, d0
			b FIM7

LessThan:	ldr d1, PI
			fadd d1, d0, d1
			fmul d0, d1, d1
			fmul d0, d0, d1
			fsqrt d0, d0

FIM7:		ret

/*==========================================================================*/

F4EX8A:	stp x29, x30, [SP, #-16]!
		mov  x29, SP
		mov x0, #0
		mov x1, #1
		ucvtf d1, x0
		ucvtf d2, x1

		mov x15, #3
		ldr d4, F8a4
		bl QUAD

		mov x15, #2
		ldr d4, F8a3
		bl QUAD

		mov x15, #1
		ldr d4, F8a2
		bl QUAD

		mov x15, #0
		ldr d4, F8a1
		bl QUAD

		fadd d0, d1, d2
		add x0, x0, 1
		mov x15, #3
		bl QUAD
		fdiv d0, d2, d3
		ldp x29, x30, [SP], #16
		ret


QUAD:	fmov d3, d0
LOOPQ:	cbz x15, THEN
		fmul d3, d3, d0
		sub x15, x15, 1
		b LOOPQ
THEN:	cbnz x0, ENDQ
		fmul d4, d4, d3
		fadd d1, d1, d4
ENDQ:	ret

/*==========================================================================*/

F4EX8B:	fneg d0, d0
		stp x29, x30, [SP, #-16]!
		mov x29, SP
		bl F4EX8A
		fneg d0, d0
		ldp x29, x30, [SP], #16
		ret

/*==========================================================================*/

F4EX9A:	stp x29, x30, [SP, #-16]!
		mov x29, SP
		mov x2, #1
		ucvtf d7, x2
		mov x0, #10			//valor para calcular o fatorial guardado em x0
		fmul d2, d0, d0		//valor de x^2
		ldr d0, F3a0
LOOP9A:	cbz x0, END9A
		mov x15, x0
		bl FATORIAL
		ucvtf d1, x14
		fdiv d1, d7, d1
		fsub d0, d1, d0
		fmul d0, d0, d2
		b LOOP9A

END9A:	fsub d0, d7, d0
		ldp x29, x30, [SP], #16
		ret

FATORIAL:	mov x14, #1
LOOPFAT:	cbz x15, ENDFAT
			mul x14, x14, x15
			sub x15, x15, #1
			b LOOPFAT

ENDFAT:		sub x0, x0, 2
			ret

//podia ser definida uma variável .data Vconst: .double 0.2131, 0.21321321, 0.432534543 (com os valores de 1/10!...) e depois era utilizado como:
// ldr x0, =Vconst, ldr d0, [x0], #8

/*==========================================================================*/

F4EX9B:		stp x29, x30, [SP, #-16]!
			mov x29, SP
			ldr d2, PI
			fmul d0, d0, d2
			mov x9, #180
			ucvtf d2, x9
			fdiv d0, d0, d2
			bl F4EX9A
			mov x0, #100
			mov x1, #50
			ucvtf d1, x0
			ucvtf d2, x1
			fmadd d0, d0, d2, d1
			ldp x29, x30, [SP], #16
			ret

/*==========================================================================*/

F4EX9C:	stp x29, x30, [SP, #-16]!
		mov x29, SP
		bl F4EX9B
		ldp x29, x30, [SP], #16
		ret

/*==========================================================================*/
/*
Calculator:	stp x29, x30, [SP, #-16]!
			mov x29, SP		//atualizar FP
			stp x19, x20, [SP, #-16]!
			stp x21, x22, [SP, #-16]!
			str x23, [SP, #-16]!
			mov w19, #42	//*
			mov w20, #43 	//+
			mov w21, #45	//-
			mov w22, #80	//P
			mov x23, x0		//para tratar do index final em caso de overflow

LOOPC:		cbz x0, ENDC
			ldrsb w9, [x1], #1	//w4 é a operação
			ldrsw x10, [x2], #4	//w5 é o elemento da sequência B
			ldrsw x11, [x3]		//w6 é o elemento da sequência A, não se faz pós-indexação para o caso de escrever na seq A
			cmp w9, w19
			b.eq MUL			//w4 = '*'
			cmp w9, w20
			b.eq ADD			//w4 = '+'
			cmp w9, w21
			b.eq SUB			//w4 = '-'
			cmp w9, w22
			b POTENCIA			//w4 = 'P'

ADD:		adds w14, w10, w11		//adição entre valores de A e B
			b.vs END_OV				//para verificar overflow nas flags
			b SUBANDADD

SUB:		subs w14, w11, w10		//subtração entre vallores de A e B
			b.vs END_OV				//para verificar overflow nas flags
			b SUBANDADD

MUL:		smull x14, w10, w11		//multiplicação entre valores de A e B
			b OVERFLOW

POTENCIA:	stp x0, x1, [SP, #-16]!	//guardar os valores de x0 e x1 que vão ser alterados pela sub-rotina
			stp x2, x3, [SP, #-16]!	//guardar os valores de x0 e x1 que podem ser alterados pela sub-rotina
			mov x0, x11				//x0 passa a conter o valor do endereçço base
			mov x1, x10
			bl power
			mov x14, x0
			ldp x2, x3, [SP], #16
			ldp x0, x1, [SP], #16
			cbz x14, END_OV			//se x14 = 0, então ocorreu overflow e então termina-se o programa
			b SUBANDADD				//se x14 != 0 não ocorreu overflow

OVERFLOW:	asr x15, x14, #31	//para verificar se ocorre overflow
			cmp x14, #0			//verificar se x14 >= 0 ou x14 < 0
			b.lt NEG
			cmp x15, #0			//valor é positivo
			b.eq SUBANDADD		//não ocorreu overflow
			b END_OV			//ocorreu

NEG:		cmp x15, #-1		//valor é negativo
			b.eq SUBANDADD		//não ocorreu overflow
			b END_OV			//ocorreu

END_OV:		sub x23, x23, x0	//para determinar o index do valor onde ocorreu overflow
			add x0, x23, #1
			b ENDC

SUBANDADD:	sub x0, x0, 1		//decrementar o counter
			str w14, [x3], #4	//escrever na sequência A o resultado e passar para a próxima posição
			b LOOPC

ENDC:		ldr x23, [SP], #16
			ldp x21, x22, [SP], #16
			ldp x19, x20, [SP], #16
			ldp x29, x30, [SP], #16
			ret
*/

/*----------------------------------------SUB-ROTINA----------------------------------------*/

power:		mov x6, #1
powerl:		cbz x1, ENDSB		//determina a quantidade de vezes que se vai repetir
			mul x6, x0, x6		//multiplação de resultado * base
			sub x1, x1, #1
			b powerl

ENDSB:		asr x1, x6, #31		//para verificar se ocorre overflow
			cmp x14, #0			//verificar se x14 >= 0 ou x14 < 0
			b.lt NEGP
			cmp x1, #0			//valor é positivo
			b.eq WR				//não ocorreu overflow
			mov x0, #0
			b RET				//ocorreu

WR:			mov x0, x6

RET:		ret

NEGP:		cmp x1, #-1		//valor é negativo
			b.eq WR
			mov x0, #0
			b RET

/*==========================================================================*/

TESTAR: str x0, [x1]
		ldrh w0, [x1]
		ret
/*==========================================================================*/

F5EX1A: 	cbz x3, FIM_1A
			ldr q0, [x0], #16
			ldr q1, [x1], #16
			fadd v2.4S, v1.4S, v0.4S
			str q2, [x2], #16
			sub x3, x3, #4
			b F5EX1A
FIM_1A:		ret

/*==========================================================================*/

F5EX1B:		dup v0.4s, v0.s[0]
LOOP5_1A:	cbz x1, FIM5_1B
			sub x1, x1, #4
			ldr q1, [x0]
			fmul v1.4s, v1.4s, v0.4s
			str q1, [x0], #16
			b F5EX1B
FIM5_1B:	ret

/*==========================================================================*/

F5EX1C:		dup v0.4s, v0.s[0]
LOOP5_1C:	cbz x3, FIM5_1C
			sub x3, x3, #4
			ldr q1, [x0], #16
			ldr q2, [x1], #16
			fmul v2.4s, v2.4s, v0.4s
			fsub v1.4s, v1.4s, v2.4s
			str q1, [x2], #16
			b LOOP5_1C
FIM5_1C:	ret

/*==========================================================================*/

F5EX2:		mov x3, x2
			mov x2, x0
			mov x0, #0
LOOP5_2:	cbz x3, FIM5_2
			sub x3, x3, #2
			ldr d0, [x1], #8
			ldr d1, [x2], #8
			smull v0.2d, v1.2s, v0.2s
			addp d0, v0.2d
			fmov x4, d0
			add x0, x0, x4
			b LOOP5_2
FIM5_2:		ret

/*==========================================================================*/

F5EX3:		dup v0.16b, w2
			mov x3, x0
			mov x0, #0
LOOP5_3:	cbz x1, FIM5_3
			sub x1, x1, #16
			ldr q2, [x3], #16
			cmeq v2.16b, v2.16b, v0.16b
			saddlv h2, v2.16b
			smov x4, v2.h[0]
			sub x0, x0, x4
			b LOOP5_3
FIM5_3:		ret

/*==========================================================================*/

F5EX4:		dup v0.4s, w2
LOOP5_4:	cbz x1, FIM5_4
			sub x1, x1, #4
			ldr q1, [x0], #16
			sqadd v1.4s, v1.4s, v0.4s
			str q1, [x0, #-16]
			b LOOP5_4
FIM5_4:		ret

/*==========================================================================*/

F5EX5:		cbz x1, FIM5_5
			sub x1, x1, #2
			ldr q0, [x0], #16
			rev64 v0.4s, v0.4s
			str q0, [x0, #-16]
			b F5EX5
FIM5_5:		ret

/*==========================================================================*/

F5EX6:		ldr d0, zeros
LOOP5_6:	cbz x1, FIM5_6
			sub x1, x1, #2
			ldr q1, [x0], #16
			fmul v1.2d, v1.2d, v1.2d
			faddp d4, v1.2d
			fadd d0, d0, d4
			b LOOP5_6
FIM5_6:		fsqrt d0, d0
			ret

/*==========================================================================*/

F5EX7:		mov x2, x0
			mov x0, #0
			dup v2.4s, v0.s[0]
LOOP5_7:	cbz x1, FIM5_7
			sub x1, x1, #4
			ldr q1, [x2], #16
			fcmgt v1.4s, v2.4s, v1.4s
			addv s1, v1.4s
			smov x3, v1.s[0]
			sub x0, x0, x3
			b LOOP5_7
FIM5_7:		ret

/*==========================================================================*/

F5EX8:		dup v0.4s, v0.s[0]
LOOP5_8:	cbz x2, FIM5_8
			ldr q1, [x0], #16
			ldr q2, [x1]
			fabs v1.4s, v1.4s
			fmul v1.4s, v1.4s, v0.4s
			fsub v2.4s, v2.4s, v1.4s
			str q2, [x1], #16
			sub x2, x2, 4
			b LOOP5_8
FIM5_8:		ret

/*==========================================================================*/

F5EX9:		cbz x3, FIM5_9
			sub x3, x3, #1
			ldr d0, [x0], #8
			ldr d1, [x1], #8

			fmul v2.2s, v0.2s, v1.2s		//multiplica a*c e b*d
			fneg v3.2s, v2.2s				//nega os valores
			ins v2.s[1], v3.s[1]			//insere o valor negado de b*d em v2
		    faddp s2, v2.2s					//soma a*c com -b*d e guarda em v2.s[0]

			rev64 v1.2s, v1.2s				//troca a ordem dos valores para fazer a*d e b*c
			fmul v1.2s, v0.2s, v1.2s		//multiplica os valores
			faddp s1, v1.2s					//soma os dois valores
			ins v2.s[1], v1.s[0]			//insere no vetor final que vai ser guardado no registo x3

			str d2, [x2], #8
			b F5EX9
FIM5_9:		ret

/*==========================================================================*/
