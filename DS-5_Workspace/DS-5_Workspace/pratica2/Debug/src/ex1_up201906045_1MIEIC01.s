/*
 *
 *
 *  Created on: 24/03/2020
 *      Author: tiago
 */
.text
.global EX1
.type EX1, "function"

EX1:	mov x4, x0		//x4 � agora o endere�o do registo que cont�m os valores
		mov x0, 0		//a resposta vai ser apresentada em x0, logo come�amos o counter a 0
LOOP:	cbz x1, FIM		//se x1 (n�mero de valores) for 0, ent�o j� chegamos ao fim do vetor, significa que temos de terminar o programa
		ldrsh w5, [x4]	//dar load do primeiro valor (signed half word)
		sub x1, x1, 1	//diminuir 1 no n�mero de valores pois acabamos de dar load a um valor
		add x4, x4, 2	//adicionar 2 a x4 para quando formos dar load outra vez, estar no valor a seguir (half word = 2 Bytes)
		cmp w5, w2		//comparar valor com o menor valor do intervalo
		b.lt LOOP		//se o valor presente em w5 for menor do que 'a' ent�o n�o est� no intervalo [a; b] logo passamos para o pr�ximo elemento
		cmp w5, w3 		//comparar com o maior valor do intervalo
		b.gt LOOP		//se for maior que este, n�o pertence ao intervalo, logo passamos para o pr�oximo
		and w5, w5, 1	//se o n�mero chegou aqui ent�o est� entre o intervalo, logo temos de verificar se � par ou �mpar
		cmp w5, 1		//se o resultado da opera��o anterior for 1 ent�o o �ltimo bit do n�mero representado por w5 era 1, logo este era �mpar
		b.ne LOOP		//se n�o for �mpar ent�o este n�mero n�o verifica a condi��o logo, temos de passar para o pr�ximo n�mero
		add x0, x0, 1	//se o n�mero chegou aqui ent�o passou em todos os testes logo, incrementamos o counter
		b LOOP
FIM:	ret
