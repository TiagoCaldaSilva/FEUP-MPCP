.text
.global CountCommon
.type CountCommon, "function"

CountCommon:	mov x4, x0
				mov x12, x2				//guardar a quantidade de elementos da sequência que vai ser vista várias vezes (B)
				mov x13, x3				//para poder voltar a ter o x3 no seu valor inicial posteriormente
				mov x0, 0				//counter


LOOP1:			cbz x4, FIM				//x4 = 0 quando chegarmos à última posição da sequência A
				ldrsw x5, [x1]			//elemento a comparar na outra sequência


LOOP2:			cbz x2, Wait			//quando já não houver mas elementos para analisar passa-se para o próximo elemento de A
				ldrsw x6, [x3]			//x6 é o elemento de B a comparar com o elemento de A
				cmp w5, w6
				b.ne SubAdd				//se não forem iguais não se incrementa o counter
				add x0, x0, 1			//se forem iguais incrementa-se o counter
				b Wait


SubAdd:			add x3, x3, 4			//passar para o próximo elemento
				sub x2, x2, 1			//decrementar porque x2 indica quando já não há mais elementos para analisar
				b LOOP2


Wait:			mov x2, x12				//x2 volta a ter a quantidade de elementos da sequência
				mov x3, x13				//x3 volta à posição inicial
				add x1, x1, 4			//x1 passa para o valor seguinte
				sub x4, x4, 1			//decrementa-se porque viu-se um elemento
				b LOOP1

FIM:			ret
