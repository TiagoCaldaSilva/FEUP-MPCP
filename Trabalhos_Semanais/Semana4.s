.text
.global eStep
.type eStep, "function"

eStep:	stp x3, x2, [SP, #-16]!
		mov w12, w2
eStep1:	cbz x0, FIM
		sub x0, x0, #1
		ldr s10, [x1], #4
		ldr s11, [x1], #4
		fcvt d10, s10
		fcvt d11, s11

LOOP:	cbz w2, ENDL
		ldr d12, [x3], #8
		ldr d13, [x3], #8
		fsub d12, d12, d10
		fmul d12, d12, d12
		fsub d13, d13, d11
		fmadd d12, d13, d13, d12
		fsqrt d12, d12
		cmp w2, w12
		b.eq Save
		fcmp d12, d14
		b.lt Save
		sub w2, w2, #1
		b LOOP

Save:	fmov d14, d12
		sub w13, w12, w2
		sub w2, w2, #1
		b LOOP

ENDL:	str w13, [x4], #4
		ldp x3, x2, [SP]
		b eStep1

FIM:	add SP, SP, #16
		ret

