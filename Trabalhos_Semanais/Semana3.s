.text
.global Calculator
.type Calculator, "function"

Calculator:	stp x29, x30, [SP, #-16]!
			stp x19, x20, [SP, #-16]!
			stp x21, x22, [SP, #-16]!
			str x23, [SP, #-16]!
			mov x29, SP		//atualizar FP
			mov w19, #42	//*
			mov w20, #43 	//+
			mov w21, #45	//-
			mov w22, #80	//P
			mov x23, x0		//para tratar do index final em caso de overflow

LOOPC:		cbz x0, ENDC
			ldrsb w9, [x1], #1	//w4 � a opera��o
			ldrsw x10, [x2], #4	//w5 � o elemento da sequ�ncia B
			ldrsw x11, [x3]		//w6 � o elemento da sequ�ncia A, n�o se faz p�s-indexa��o para o caso de escrever na seq A
			cmp w9, w19
			b.eq MUL			//w4 = '*'
			cmp w9, w20
			b.eq ADD			//w4 = '+'
			cmp w9, w21
			b.eq SUB			//w4 = '-'
			cmp w9, w22
			b POTENCIA			//w4 = 'P'

ADD:		adds w14, w10, w11		//adi��o entre valores de A e B
			b.vs END_OV				//para verificar overflow nas flags
			b SUBANDADD

SUB:		subs w14, w11, w10		//subtra��o entre vallores de A e B
			b.vs END_OV				//para verificar overflow nas flags
			b SUBANDADD

MUL:		smull x14, w10, w11		//multiplica��o entre valores de A e B
			b OVERFLOW

POTENCIA:	stp x0, x1, [SP, #-16]!	//guardar os valores de x0 e x1 que v�o ser alterados pela sub-rotina
			stp x2, x3, [SP, #-16]!	//guardar os valores de x0 e x1 que podem ser alterados pela sub-rotina
			mov x0, x11				//x0 passa a conter o valor do endere��o base
			mov x1, x10
			bl power
			mov x14, x0
			ldp x2, x3, [SP], #16
			ldp x0, x1, [SP], #16
			cbz x14, END_OV			//se x14 = 0, ent�o ocorreu overflow e ent�o termina-se o programa
			b SUBANDADD				//se x14 != 0 n�o ocorreu overflow

OVERFLOW:	asr x15, x14, #31	//para verificar se ocorre overflow
			cmp x14, #0			//verificar se x14 >= 0 ou x14 < 0
			b.lt NEG
			cmp x15, #0			//valor � positivo
			b.eq SUBANDADD		//n�o ocorreu overflow
			b END_OV			//ocorreu

NEG:		cmp x15, #-1		//valor � negativo
			b.eq SUBANDADD		//n�o ocorreu overflow
			b END_OV			//ocorreu

END_OV:		sub x23, x23, x0	//para determinar o index do valor onde ocorreu overflow
			add x0, x23, #1
			b ENDC

SUBANDADD:	sub x0, x0, 1		//decrementar o counter
			str w14, [x3], #4	//escrever na sequ�ncia A o resultado e passar para a pr�xima posi��o
			b LOOPC

ENDC:		ldr x23, [SP], #16
			ldp x21, x22, [SP], #16
			ldp x19, x20, [SP], #16
			ldp x29, x30, [SP], #16
			ret
