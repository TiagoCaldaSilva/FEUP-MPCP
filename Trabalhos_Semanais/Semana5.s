.data
Z: .float 0.0
C: .float 100.0

.text
.global freqchars
.type freqchars, "function"

/*
*x0 = n�mero de caracteres do texto
*x1 = endere�o base da sequ�ncia de carateres que constitui o texto
*x2 = n�mero de letras a pesquisar
*x3 = endere�o base da sequ�ncia de letras a pesquisar
*x4 = endere�o base da sequ�ncia de frequ�ncias relativas das letras
*/

freqchars:	stp x0, x1, [SP, #-16]!			//guardar os valores de x0 e 1x para poder renov�-los no inicio de cada loop
			ldr s0, Z						//valor utilizado para comparar frqu�ncias
			ldr s1, C						//valor 100 para tornar percentagem
			mov w10, #32					//valor utilizado para avaliar as letras mai�sculas
			dup v15.16b, w10				//guardar valor em vetor para comparar entre vetores
			mov w11, #0
			scvtf s2, x0					//s5 � o float correspondente ao tamanho da frase

LOOP1:		ldp x0, x1, [SP]				//renovar os valores de x0 e x1 para os valores iniciais guardados na stack
			cbz x2, FIM
			sub x2, x2, #1
			ldrb w12, [x3], #1				//w12 � o char a pesquisar
			dup v3.16b, w12					//o vetor v3 tem 16 bytes com o valor de w12
			ldr s4, Z						//s4 vai ser o counter, s4 = 0

LOOP:		cbz x0, FIM_LOOP
			sub x0, x0, #16
			ldr q5, [x1], #16
			cmeq v6.16b, v5.16b, v3.16b		//todos os valores iguais a w12 passam a -1
			neg v6.16b, v6.16b				//os valores de -1 passam a 1
			addv b7, v6.16b					//em b7 est� o total de apar�ncias de w12 nestes 128 bits (16 chars)
			scvtf s7, s7					//passagem do n�mero para float
			fadd s4, s4, s7					//adi��o ao counter
			add v5.16b, v5.16b, v15.16b		//passagem das poss�veis letras mai�sculas a min�sculas
			cmeq v6.16b, v5.16b, v3.16b
			neg v6.16b, v6.16b
			addv b7, v6.16b
			scvtf s7, s7
			fadd s4, s4, s7
			b LOOP

FIM_LOOP:	fdiv s4, s4, s2					//frqu�ncia relativa, s2 = float(tamanho da frase)
			fmul s4, s4, s1					//precentagem, s1 = 100.0
			str s4, [x4], #4
			fcmp s0, s4						//verificar se o valor obtigo � maior que o valor guardado
			b.ge LOOP1
			fmov s0, s4						//se for, atualiza o valor
			mov w11, w12					//e atualiza o char
			b LOOP1

FIM:		mov w0, w11
			add SP, SP, #16
			ret
