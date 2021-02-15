.text
.global VALUE
.type VALUE, "function"
.type LARGEST, "function"
.type DETERMINA, "function"
.type ABSOLUTO, "function"
.type SOMAS, "function"

VALUE: 	LDR X0, [X10] //1.a)
		sub X0, X0, 1
		STUR X0, [X10]
		ret


LARGEST:	cmp X10, X11 // 1.b)
			B.GT Maior
			MOV X9, x11
			B Finish

Maior: MOV X9, X10
Finish: ret


ABSOLUTO:	cmp XZR, X15 //1.c)
			b.ls TROCAR
			B FINAL
TROCAR: sub X15, XZR, X15
FINAL: ret


DETERMINA:	mov X7, 1 //1.d)
			mov W1,W0
			lsr x0, x0, 32
			cmp W0,W1
			b.eq FIM
			mov X7, 0
FIM: ret


/*SOMAS: 	mov X0, 0 //3.a)
		mov X1, 11
		mov x2, 0
LOOP:	add X2, X1
		add X0, 1
		add X1, 10
		b*/

