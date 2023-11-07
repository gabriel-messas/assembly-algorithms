.data
string: .asciiz "\nIt is a prime!"

.text
move $s1, $a0
addi $s2, $s2, 0
move $s2, $s1
addi $s3, $s3, 0
addi $s3, $s3, 0
addi $s4, $s4, 0
addi $s5, $s5, 0

li $v0, 5
syscall
move $s1, $v0

loop:
move $s2, $s1	
addi $s3, $s3, 1
div $s2, $s2, $s3
mfhi $s5
beqz $s5, divzero
j loop

divzero:
addi $s4, $s4, 1
move $s2, $s1
sub $s2, $s2, $s3
bgtz $s2, loop
addi $s4, $s4, -2
beqz $s4, prime
j exit

prime: 

#la $a0, ($s1)
#li $v0, 1
#syscall
la $a0, string
li $v0, 4
syscall

addi $v0, $v0, 0
addi $v0, $v0, 1

j exit

exit:

