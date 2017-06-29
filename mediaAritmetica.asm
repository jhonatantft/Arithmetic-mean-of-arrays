# Disciplina: 4189 � Arquitetura e Organiza��o de Computadores
# Atividade: Avalia��o 01 � Programa��o em Linguagem de Montagem
# Programa 01
# Aluno: - Jhonatan T. Fernandes Tomimatsu


# Enunciado:
# Implemente um programa que leia dois vetores via console e, ap�s a leitura dos vetores, produza um
# terceiro vetor em que cada elemento seja a m�dia aritm�tica dos elementos de mesmo �ndice dos
# outros dois vetores. Por fim, o programa deve imprimir esse novo vetor na tela.


		.data 			#Declara��es

Msg1: .asciiz "Entre com o tamanho dos vetores (m�x.= 8): "
Msg2: .asciiz "Vetor_A["
Msg3: .asciiz "Vetor_B["
Msg4: .asciiz "Vetor_C["
Msg5: .asciiz "] = "
Msg6: .asciiz "\n"
Msg7: .asciiz "Valor inv�lido!\n"

Vetor_A: .float 0,0,0,0,0,0,0,0 # Declara��o do Vetor_A
Vetor_B: .float 0,0,0,0,0,0,0,0 # Declara��o do Vetor_B
Vetor_C: .float 0,0,0,0,0,0,0,0 # Declara��o do Vetor_C

Div2: .float 2.0 #Declara��o da constante de divis�o

	.text #C�digo

main:

read: # Leitura do tamanho dos vetores

	li $v0, 4 		# Carrega o servi�o 4, que � o de impress�o de strings
	la $a0, Msg1 		# Carrega a mensagem em $a0
	syscall 		# Chama o servi�o

	li $v0, 5 		# Carrega servi�o 5, o servi�o de leitura de inteiros
	syscall 		# Chama o servi�o

	add $s0, $0, $v0 	# Carrega retorno $s0, $s0 cont�m o tamanho dos vetores
	ble $s0, 1, error 	# Se o tam. dos vet. forem �=< 1� desvia para o label read
	bge $s0, 9, error 	# Se o tam. dos vet. forem �=> 9� desvia para o label read
	la $s1, Vetor_A 	# Carrega em $s1 primeiro elemento do Vetor_A
	add $t0, $0, $s0 	# Adiciona a $t0 o n�mero m�ximo de voltas do loop
	li $t1, 0 		# Carrega em $t1 o valor 0, $t1 � o index (i)

loop:

	beq $t1, $t0, end 	# Se t1 for igual ao n�mero de voltas ($t0) finalizamos o loop
	li $v0, 4 		# Carrega o servi�o 4, que � o de impress�o de strings
	la $a0, Msg2 		# Carrega a mensagem em $a0
	syscall 		# Chama o servi�o
	
	li $v0, 1 		# Carrega o servi�o 1, que � o de impress�o de inteiros
	add $a0, $0, $t1 	# Adiciona a $a0 o valor do index
	syscall 		# Chama o servi�o

	li $v0, 4 		# Carrega o servi�o 4, que � o de impress�o de strings
	la $a0, Msg5 		# Carrega a mensagem em $a0
	syscall 		# Chama o servi�o

	li $v0, 6 		# Carrega servi�o 6, que � o servi�o de leitura de floats
	syscall 		# Chama o servi�o

	s.s $f0, ($s1) 		# Salva retorno $f0 do servi�o 6 no atual elemento do Vetor_A ($s1)
	addi $s1, $s1, 4 	# Pula pro pr�ximo elemento do array (4 em 4 bytes)
	addi $t1, $t1, 1 	# Adiciona 1 ao meu index (i++)
	j loop 			# Volta para o Loop (goto)

end: nop 			# Finaliza o loop

	la $s2, Vetor_B 	# Carrega em $s2 primeiro elemento do Vetor_B
	add $t0, $0, $s0 	# Adiciona a $t0 o n�mero m�ximo de voltas do loop
	li $t1, 0 		# Carrega em $t1 o valor 0, $t1 � o index (i)

loop1:

	beq $t1, $t0, end1 	# Se t1 for igual ao n�mero de voltas ($t0) finalizamos o loop
	li $v0, 4 		# Carrega o servi�o 4, que � o de impress�o de strings
	la $a0, Msg3 		# Carrega a mensagem em $a0
	syscall 		# Chama o servi�o

	li $v0, 1 		# Carrega o servi�o 1, que � o de impress�o de inteiros
	add $a0, $0, $t1 	# Adiciona a $a0 o valor do index
	syscall 		# Chama o servi�o

	li $v0, 4 		# Carrega o servi�o 4, que � o de impress�o de strings
	la $a0, Msg5 		# Carrega a mensagem em $a0
	syscall 		# Chama o servi�o

	li $v0, 6 		# Carrega servi�o 6, que � o servi�o de leitura de floats
	syscall 		# Chama o servi�o

	s.s $f0, ($s2) 		# Salva retorno($f0) do servi�o 6 no atual elemento do Vetor_B ($s2)
	addi $s2, $s2, 4 	# Pula pro pr�ximo elemento do array (4 em 4 bytes)
	addi $t1, $t1, 1 	# Adiciona 1 ao meu index (i++)

	j loop1 		# Volta para o Loop (goto)

end1: nop 			# Finaliza o loop

	la $s1, Vetor_A 	# Carrega em $s1 primeiro elemento do Vetor_A
	la $s2, Vetor_B 	# Carrega em $s2 primeiro elemento do Vetor_B
	la $s3, Vetor_C 	# Carrega em $s2 primeiro elemento do Vetor_C
	add $t0, $0, $s0 	# Adiciona a $t0 o n�mero m�ximo de voltas do loop
	li $t1, 0 		# Carrega em $t1 o valor 0, $t1 � o meu index (i)

loop2:

	beq $t1, $t0, end2 	# Se t1 for igual ao n�mero de voltas ($t0) finalizamos o loop
	li $v0, 4 		# Carrega o servi�o 4, que � o de impress�o de strings
	la $a0, Msg4 		# Carrega a mensagem em $a0
	syscall 		# Chama o servi�o
	
	li $v0, 1 		# Carrega o servi�o 1, que � o de impress�o de inteiros
	add $a0, $0, $t1 	# Adiciona a $a0 o valor do index
	syscall 		# Chama o servi�o

	li $v0, 4 		# Carrega o servi�o 4, que � o de impress�o de strings
	la $a0, Msg5 		# Carrega a mensagem em $a0
	syscall 		# Chama o servi�o

	l.s $f1, ($s1)		# Carrega o atual elemento do Vetor_A em $f1
	l.s $f2, ($s2) 		# Carrega o atual elemento do Vetor_B em $f2
	l.s $f4, Div2 		# Carrega 2 em $f4
	add.s $f3, $f1, $f2 	# Soma o valor dos atuais elementos e joga em $f3
	div.s $f3, $f3, $f4 	# Divide o valor de $f3 por dois($f4), obtendo a m�dia e jogam em $f3
	s.s $f3, ($s3) 		# Atribui a m�dia ao atual elemento do Vetor_C ($s3)
	li $v0, 2 		# Carrega o servi�o 2, que � o de impress�o de floats
	l.s $f12, ($s3) 	# Adiciona a $f12 o valor da m�dia
	syscall 		# Chama o servi�o

	li $v0, 4 		# Carrega o servi�o 4, que � o de impress�o de strings
	la $a0, Msg6 		# Carrega a mensagem em $a0
	syscall 		# Chama o servi�o

	addi $s1, $s1, 4 	# Pula pro pr�ximo elemento do Vetor_A (4 em 4 bytes)
	addi $s2, $s2, 4 	# Pula pro pr�ximo elemento do Vetor_B (4 em 4 bytes)
	addi $s3, $s3, 4 	# Pula pro pr�ximo elemento do Vetor_C (4 em 4 bytes)
	addi $t1, $t1, 1 	# Adiciona 1 ao meu index (i++)

	j loop2 		# Volta para o Loop (goto)

end2: nop 			# Finaliza o loop

	li $v0, 10 		# Carrega o servi�o 10, que � o de sa�da
	syscall 		# Chama o servi�o

error:

	li $v0, 4 		# Carrega o servi�o 4, que � o de impress�o de strings
	la $a0, Msg7 		# Carrega a mensagem em $a0
	syscall 		# Chama o servi�o

	j read 			# Pula para o label de leitura para ler novamente o valor
