# Somatório de K de 1 -> 20 = (4*k + 2)

# $s1 Soma
# $s2 K

# $s1 - começa em 0 
# $s2 - começa em 1
# $s3 - começa em 21

.data
	frase: .asciiz "Resultado do somatório: "

.text
 	Main:
 		addi $s2,$s2,1   #Armazena 1 em s2 = k
 		addi,$s3,$s3,21  #Armazena 21 em s3 = contador
  	
	While: 
		beq  $s2,$s3,Exit #Sai do Loop quando k se iguala ao contador
		add  $s1,$s1,$s2  #S1 é o armazendor 
		add  $s1,$s1,$s2
		add  $s1,$s1,$s2  #Essa 4 linhas iguais fazem 4*k 
		add  $s1,$s1,$s2
		addi $s1,$s1,2    #Essa linha faz (4*k) + 2
		addi $s2,$s2,1    #Incrementa o K em +1
		j    While        #Volta para o início do Loop
	Exit: 
		li   $v0,4        #Chama a função de printar strings
		la   $a0,frase    #Armazena "frase" em a0
		syscall
		
		li   $v0,1	     #Chama a função de printar inteiros
		add  $a0,$s1,$zero   #Armazena o inteiro em a0
		syscall		     #Printa na tela
		
 	
 	
 	
 	
 	
 	
 	
			
	
