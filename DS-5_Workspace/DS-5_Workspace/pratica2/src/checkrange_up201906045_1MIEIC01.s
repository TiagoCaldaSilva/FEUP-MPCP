.text
.global CheckRange
.type CheckRange, "function"


CheckRange:	mov w3, w0		//w3 tem o valor de lim
			mov x0, 0		//mover o counter a 0
			neg w5, w3		//w5 tem o valor de -lim
LOOP:		cbz x1, FIM		//quando x1 = 0, chegou ao fim da sequência
			ldrsw x4, [x2]	//load do valor da sequência
			cmp w4, w3		//se w4 > w3, está fora do limite
			b.gt SUP		//se está fora do limite vamos ter de alterar o seu valor
			cmp w5, w4		//se w4 < w5, também está fora do limite
			b.gt Neg
			b Sub			//se chegou aqui, w4 está entre os limites e, portanto, podemos passar para o próximo elemento
SUP:		str w3, [x2]	//se w4 > w3, susbtituimos este elemento pelo mais próximo (neste caso lim)
			b Ad
Neg:		str w5, [x2]	//se w4 < w5, substituimos este elemento pelo mais próximo (neste caso -lim)
Ad:			add x0, x0, 1	//aumentar o counter
Sub:		sub x1, x1, 1	//diminuir o contador de elementos da sequência
			add x2, x2, 4	//passar para o próximo elemento
			b LOOP
FIM:		ret
