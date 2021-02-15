.text
.global CountCommon
.type CountCommon, "function"

CountCommon:	mov x4, x0
				mov x12, x2				//guardar a quantidade de elementos da sequ�ncia que vai ser vista v�rias vezes (B)
				mov x13, x3				//para poder voltar a ter o x3 no seu valor inicial posteriormente
				mov x0, 0				//counter


LOOP1:			cbz x4, FIM				//x4 = 0 quando chegarmos � �ltima posi��o da sequ�ncia A
				ldrsw x5, [x1]			//elemento a comparar na outra sequ�ncia


LOOP2:			cbz x2, Wait			//quando j� n�o houver mas elementos para analisar passa-se para o pr�ximo elemento de A
				ldrsw x6, [x3]			//x6 � o elemento de B a comparar com o elemento de A
				cmp w5, w6
				b.ne SubAdd				//se n�o forem iguais n�o se incrementa o counter
				add x0, x0, 1			//se forem iguais incrementa-se o counter
				b Wait


SubAdd:			add x3, x3, 4			//passar para o pr�ximo elemento
				sub x2, x2, 1			//decrementar porque x2 indica quando j� n�o h� mais elementos para analisar
				b LOOP2


Wait:			mov x2, x12				//x2 volta a ter a quantidade de elementos da sequ�ncia
				mov x3, x13				//x3 volta � posi��o inicial
				add x1, x1, 4			//x1 passa para o valor seguinte
				sub x4, x4, 1			//decrementa-se porque viu-se um elemento
				b LOOP1

FIM:			ret
