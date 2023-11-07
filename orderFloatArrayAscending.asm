ordenarVet:
	move $s7, $ra
	move $t0, $s0		# N
	addi $t1, $zero, 1	# contador i = 1
	addi $t2, $t1, 1	# contador j = i + 1
	move $t3, $a1		# end first
	addi $t4, $a1, 4	# end move

loopOrdenar:
	l.s $f4, ($t3)		
	l.s $f5, ($t4)
	c.lt.s 1, $f5, $f4		# se o num da frente eh menor que o num de tras, 1compressor = true
	bc1t 1, mudarPosic
hackLoopOrd:
	addi $t4, $t4, 4		# mudando pont p prox posic
	addi $t2, $t2, 1		# j++
	ble $t2, $s0, loopOrdenar	# se j <= N, continuar comparacao
	addi $t3, $t3, 4		# mudando pont fixo p prox posic
	addi $t1, $t1, 1		# i++
	addi $t2, $t1, 1		# j = i + 1
	addi $t4, $t3, 4
	bne $t1, $t0, loopOrdenar	# se i != N, continuar comparacao
	move $ra, $s7
	jr $ra
	
		
mudarPosic:
	s.s $f4, ($t4)
	s.s $f5, ($t3)
	j hackLoopOrd
