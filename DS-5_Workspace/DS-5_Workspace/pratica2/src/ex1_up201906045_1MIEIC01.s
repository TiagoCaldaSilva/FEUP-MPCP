/*
 *
 *
 *  Created on: 24/03/2020
 *      Author: tiago
 */
.text
.global EX1
.type EX1, "function"

EX1:	mov x4, x0		//x4 é agora o endereço do registo que contém os valores
		mov x0, 0		//a resposta vai ser apresentada em x0, logo começamos o counter a 0
LOOP:	cbz x1, FIM		//se x1 (número de valores) for 0, então já chegamos ao fim do vetor, significa que temos de terminar o programa
		ldrsh w5, [x4]	//dar load do primeiro valor (signed half word)
		sub x1, x1, 1	//diminuir 1 no número de valores pois acabamos de dar load a um valor
		add x4, x4, 2	//adicionar 2 a x4 para quando formos dar load outra vez, estar no valor a seguir (half word = 2 Bytes)
		cmp w5, w2		//comparar valor com o menor valor do intervalo
		b.lt LOOP		//se o valor presente em w5 for menor do que 'a' então não está no intervalo [a; b] logo passamos para o próximo elemento
		cmp w5, w3 		//comparar com o maior valor do intervalo
		b.gt LOOP		//se for maior que este, não pertence ao intervalo, logo passamos para o próoximo
		and w5, w5, 1	//se o número chegou aqui então está entre o intervalo, logo temos de verificar se é par ou ímpar
		cmp w5, 1		//se o resultado da operação anterior for 1 então o último bit do número representado por w5 era 1, logo este era ímpar
		b.ne LOOP		//se não for ímpar então este número não verifica a condição logo, temos de passar para o próximo número
		add x0, x0, 1	//se o número chegou aqui então passou em todos os testes logo, incrementamos o counter
		b LOOP
FIM:	ret
