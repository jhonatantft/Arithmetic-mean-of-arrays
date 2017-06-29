# Disciplina: 4189 – Arquitetura e Organização de Computadores
# Atividade: Avaliação 01 – Programação em Linguagem de Montagem
# Programa 01
# Aluno: - Jhonatan T. Fernandes Tomimatsu


# Enunciado:
# Implemente um programa que leia dois vetores via console e, após a leitura dos vetores, produza um
# terceiro vetor em que cada elemento seja a média aritmética dos elementos de mesmo índice dos
# outros dois vetores. Por fim, o programa deve imprimir esse novo vetor na tela.


		.data 			#Declarações

Msg1: .asciiz "Entre com o tamanho dos vetores (máx.= 8): "
Msg2: .asciiz "Vetor_A["
Msg3: .asciiz "Vetor_B["
Msg4: .asciiz "Vetor_C["
Msg5: .asciiz "] = "
Msg6: .asciiz "\n"
Msg7: .asciiz "Valor inválido!\n"

Vetor_A: .float 0,0,0,0,0,0,0,0 # Declaração do Vetor_A
Vetor_B: .float 0,0,0,0,0,0,0,0 # Declaração do Vetor_B
Vetor_C: .float 0,0,0,0,0,0,0,0 # Declaração do Vetor_C

Div2: .float 2.0 #Declaração da constante de divisão

	.text #Código

main:

read: # Leitura do tamanho dos vetores

	li $v0, 4 		# Carrega o serviço 4, que é o de impressão de strings
	la $a0, Msg1 		# Carrega a mensagem em $a0
	syscall 		# Chama o serviço

	li $v0, 5 		# Carrega serviço 5, o serviço de leitura de inteiros
	syscall 		# Chama o serviço

	add $s0, $0, $v0 	# Carrega retorno $s0, $s0 contém o tamanho dos vetores
	ble $s0, 1, error 	# Se o tam. dos vet. forem “=< 1” desvia para o label read
	bge $s0, 9, error 	# Se o tam. dos vet. forem “=> 9” desvia para o label read
	la $s1, Vetor_A 	# Carrega em $s1 primeiro elemento do Vetor_A
	add $t0, $0, $s0 	# Adiciona a $t0 o número máximo de voltas do loop
	li $t1, 0 		# Carrega em $t1 o valor 0, $t1 é o index (i)

loop:

	beq $t1, $t0, end 	# Se t1 for igual ao número de voltas ($t0) finalizamos o loop
	li $v0, 4 		# Carrega o serviço 4, que é o de impressão de strings
	la $a0, Msg2 		# Carrega a mensagem em $a0
	syscall 		# Chama o serviço
	
	li $v0, 1 		# Carrega o serviço 1, que é o de impressão de inteiros
	add $a0, $0, $t1 	# Adiciona a $a0 o valor do index
	syscall 		# Chama o serviço

	li $v0, 4 		# Carrega o serviço 4, que é o de impressão de strings
	la $a0, Msg5 		# Carrega a mensagem em $a0
	syscall 		# Chama o serviço

	li $v0, 6 		# Carrega serviço 6, que é o serviço de leitura de floats
	syscall 		# Chama o serviço

	s.s $f0, ($s1) 		# Salva retorno $f0 do serviço 6 no atual elemento do Vetor_A ($s1)
	addi $s1, $s1, 4 	# Pula pro próximo elemento do array (4 em 4 bytes)
	addi $t1, $t1, 1 	# Adiciona 1 ao meu index (i++)
	j loop 			# Volta para o Loop (goto)

end: nop 			# Finaliza o loop

	la $s2, Vetor_B 	# Carrega em $s2 primeiro elemento do Vetor_B
	add $t0, $0, $s0 	# Adiciona a $t0 o número máximo de voltas do loop
	li $t1, 0 		# Carrega em $t1 o valor 0, $t1 é o index (i)

loop1:

	beq $t1, $t0, end1 	# Se t1 for igual ao número de voltas ($t0) finalizamos o loop
	li $v0, 4 		# Carrega o serviço 4, que é o de impressão de strings
	la $a0, Msg3 		# Carrega a mensagem em $a0
	syscall 		# Chama o serviço

	li $v0, 1 		# Carrega o serviço 1, que é o de impressão de inteiros
	add $a0, $0, $t1 	# Adiciona a $a0 o valor do index
	syscall 		# Chama o serviço

	li $v0, 4 		# Carrega o serviço 4, que é o de impressão de strings
	la $a0, Msg5 		# Carrega a mensagem em $a0
	syscall 		# Chama o serviço

	li $v0, 6 		# Carrega serviço 6, que é o serviço de leitura de floats
	syscall 		# Chama o serviço

	s.s $f0, ($s2) 		# Salva retorno($f0) do serviço 6 no atual elemento do Vetor_B ($s2)
	addi $s2, $s2, 4 	# Pula pro próximo elemento do array (4 em 4 bytes)
	addi $t1, $t1, 1 	# Adiciona 1 ao meu index (i++)

	j loop1 		# Volta para o Loop (goto)

end1: nop 			# Finaliza o loop

	la $s1, Vetor_A 	# Carrega em $s1 primeiro elemento do Vetor_A
	la $s2, Vetor_B 	# Carrega em $s2 primeiro elemento do Vetor_B
	la $s3, Vetor_C 	# Carrega em $s2 primeiro elemento do Vetor_C
	add $t0, $0, $s0 	# Adiciona a $t0 o número máximo de voltas do loop
	li $t1, 0 		# Carrega em $t1 o valor 0, $t1 é o meu index (i)

loop2:

	beq $t1, $t0, end2 	# Se t1 for igual ao número de voltas ($t0) finalizamos o loop
	li $v0, 4 		# Carrega o serviço 4, que é o de impressão de strings
	la $a0, Msg4 		# Carrega a mensagem em $a0
	syscall 		# Chama o serviço
	
	li $v0, 1 		# Carrega o serviço 1, que é o de impressão de inteiros
	add $a0, $0, $t1 	# Adiciona a $a0 o valor do index
	syscall 		# Chama o serviço

	li $v0, 4 		# Carrega o serviço 4, que é o de impressão de strings
	la $a0, Msg5 		# Carrega a mensagem em $a0
	syscall 		# Chama o serviço

	l.s $f1, ($s1)		# Carrega o atual elemento do Vetor_A em $f1
	l.s $f2, ($s2) 		# Carrega o atual elemento do Vetor_B em $f2
	l.s $f4, Div2 		# Carrega 2 em $f4
	add.s $f3, $f1, $f2 	# Soma o valor dos atuais elementos e joga em $f3
	div.s $f3, $f3, $f4 	# Divide o valor de $f3 por dois($f4), obtendo a média e jogam em $f3
	s.s $f3, ($s3) 		# Atribui a média ao atual elemento do Vetor_C ($s3)
	li $v0, 2 		# Carrega o serviço 2, que é o de impressão de floats
	l.s $f12, ($s3) 	# Adiciona a $f12 o valor da média
	syscall 		# Chama o serviço

	li $v0, 4 		# Carrega o serviço 4, que é o de impressão de strings
	la $a0, Msg6 		# Carrega a mensagem em $a0
	syscall 		# Chama o serviço

	addi $s1, $s1, 4 	# Pula pro próximo elemento do Vetor_A (4 em 4 bytes)
	addi $s2, $s2, 4 	# Pula pro próximo elemento do Vetor_B (4 em 4 bytes)
	addi $s3, $s3, 4 	# Pula pro próximo elemento do Vetor_C (4 em 4 bytes)
	addi $t1, $t1, 1 	# Adiciona 1 ao meu index (i++)

	j loop2 		# Volta para o Loop (goto)

end2: nop 			# Finaliza o loop

	li $v0, 10 		# Carrega o serviço 10, que é o de saída
	syscall 		# Chama o serviço

error:

	li $v0, 4 		# Carrega o serviço 4, que é o de impressão de strings
	la $a0, Msg7 		# Carrega a mensagem em $a0
	syscall 		# Chama o serviço

	j read 			# Pula para o label de leitura para ler novamente o valor
