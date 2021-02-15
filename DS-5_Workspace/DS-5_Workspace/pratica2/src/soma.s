/*.text
.global SOMA_V
.type SOMA_V,"function"

SOMA_V:	mov X2, X0
		mov X0, 0
LOOP:	cbz X1, FIM 	//termina se X1 = 0
		ldrsw X3, [X2]
		add X2, X2, 4 	// endereço do elemento seguinte
		add X0, X0, X3 	// somar
		sub X1, X1, 1
		b 	LOOP
FIM: 	ret
*/
