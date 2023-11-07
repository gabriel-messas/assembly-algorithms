ordenarMatriz:
	move $s7, $ra
	move $t0, $a1		# end base	esse move apenas no loopOrd1
	addi $t1, $a1, 4	# end base + 4 	esse move em cada iteracao do loopOrd2
	move $t2, $zero		# contador do i
	addi $t3, $zero, 0	# contador do j
	mul $t4, $s0, $s1	# total de num na matriz
	subi $t8, $t4, 1	# total de num na matriz - 1	

loopOrd1:			# for do i
	lw $t5, ($t0)		# verificar se $t5 eh maior que $t6, se sim, trocar
loopOrd2:			# for do j
	lw $t6, ($t1)		
	bgt $t5, $t6, trocarPosicOrd

hack:	addi $t3, $t3, 1	# j++
	addi $t1, $t1, 4	# pegando prox end
	bne $t3, $t4, loopOrd2	
	addi $t2, $t2, 1	# i++
	addi $t3, $t2, 1	# j = i + 1
	addi $t0, $t0, 4	# pegando prox end 
	addi $t1, $t0, 4	# end de j eh prox end do end de i
	bne $t2, $t8, loopOrd1	# se i = qntd de num - 1, acabou a ordenacao
	move $ra, $s7
	jr $ra
	
trocarPosicOrd:
	lw $t5, ($t0)
	lw $t6, ($t1)
	sw $t6, ($t0)		# colocando num[j] no num[i]
	sw $t5, ($t1)
	lw $t5, ($t0)
	j hack
