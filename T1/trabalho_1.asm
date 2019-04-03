.data
	.align 0
	menu0: .asciiz "Menu:\n"
	menu1: .asciiz "1 - Soma de 2 números\n"
	menu2: .asciiz "2 - Subtracao de 2 números\n"
	menu3: .asciiz "3 - Multiplicacao de 2 números\n"
	menu4: .asciiz "4 - Divisao de 2 números\n"
	menu5: .asciiz "5 - Potencia de um numero\n"
	menu6: .asciiz "6 - Raiz Quadrada\n"
	menu7: .asciiz "7 - Tabuada de um número\n"
	menu8: .asciiz "8 - Cálculo IMC\n"
	menu9: .asciiz "9 - Fatorial de um número\n"
	menu10: .asciiz "10 - Cálculo de sequencia de Fibonacci dado um intervalo\n"
	menu11: .asciiz "11- Sair\n"
	
	continuar: .asciiz "Aperte Enter para continuar\n"
	
	digitenumero1: .asciiz "Digite o primeiro numero\n"
	digitenumero2: .asciiz "Digite o segundo numero\n"
	
	digitenumero: .asciiz "Digite o numero\n"
	
	sub: .asciiz " - " #mensagem utilizada na subtracao
	igual: .asciiz " = "	
	
	virgula: .asciiz ","
	
	fibonacci1: .asciiz "Fibonacci de [a,b]\n"
	fibonacci2: .asciiz "Digite o valor a\n"
	fibonacci3: .asciiz "Digite o valor b\n"
	
	
	
	fibonacci_erro: .asciiz "'b' deve ser maior ou igual a 'a'"
	
.text
	
comeco:
	jal imprime_menu
opcao_lida:
	li $v0,5 #leitura da opcao escolhida
	syscall
	
	add $t1, $zero, $v0 # t1 = $v0, opcao lida
	
	addi $t0, $zero, 1 #$t0 = 1
	bne $t0,$t1, caso_2 #if ($t1 == 1) continua aqui, se nao testa caso_2


caso_2:	
	addi $t0, $zero, 2 #$t0 = 2
	bne $t0,$t1, caso_3 #if ($t1 == 2) continua aqui, se nao testa caso_3
	
	li $v0, 4
	la $a0, digitenumero1 #mensagem de leitura do primeiro numero
	syscall
	
	li $v0,5 #leitura do primeiro numero
	syscall
	
	add $t2,$zero,$v0 #$t2 = primeiro numero lido
	
	li $v0, 4
	la $a0, digitenumero2 #mensagem de leitura do segundo numero
	syscall
	
	li $v0,5 #leitura do primeiro numero
	syscall
	
	add $t3,$zero,$v0 #$t3 = segundo numero lido
	
	sub $t4, $t2, $t3 #$v0 = $t2 - $t3
	
	
	add $a0, $zero,$t2 #a0 = $t2 (primeiro valor lido)
	
	li $v0,1 # imprime primeiro valor lido
	syscall
	
	li $v0, 4
	la $a0, sub #imprime -
	syscall
	
	add $a0, $zero,$t3 #a0 = $t3 (segundo valor lido)
	
	li $v0,1 # imprime segundo valor lido
	syscall
	
	li $v0, 4
	la $a0, igual #imprime =
	syscall
	
	add $a0, $zero, $t4 #$a0 = $t2(resultado)
	
	li $v0,1 #imprime o resultado
	syscall
	
	
	li $v0, 4
	la $a0, continuar #mensagem para apentar ENter para continuar
	syscall
	
	
caso_3:
	addi $t0, $zero, 3 #$t0 = 3
	bne $t0,$t1, caso_4 #if ($t1 == 3) continua aqui, se nao testa caso_4
	
	

caso_4: 
	addi $t0, $zero, 4 #$t0 = 4
	bne $t0,$t1, caso_5 #if ($t1 == 4) continua aqui, se nao testa caso_5
	
caso_5:
	addi $t0, $zero, 5 #$t0 = 5
	bne $t0,$t1, caso_6 #if ($t1 == 5) continua aqui, se nao testa caso_6
	
caso_6:
	addi $t0, $zero, 6 #$to = 6
	bne $t0,$t1, caso_7 #if ($t1 == 6) continua aqui, se nao testa caso_7
	
caso_7:
	addi $t0, $zero, 7 #$t0 = 7
	bne $t0,$t1, caso_8 #if ($t1 == 7) continua aqui, se nao testa caso_8
	
caso_8:
	addi $t0, $zero, 8 #$t0 = 8 
	bne $t0,$t1, caso_9 #if ($t1 == 8) continua aqui, se nao testa caso_9

#Fatorial
caso_9:
	addi $t0, $zero, 9 #$$t0 = 9
	bne $t0,$t1, caso_10 #if ($t1 == 9) continua aqui, se nao testa caso_10

#Fibonacci
caso_10:
	addi $t0, $zero, 10 #$t0 = 10
	bne $t0,$t1, caso_11 #if ($t1 == 9) continua aqui, se nao testa caso_10
	
	li $v0, 4
	la $a0, fibonacci1 #mensagem de fibonacci
	syscall
	
	
leituras:
	li $v0, 4
	la $a0, fibonacci2 #mensagem inserir 'a'
	syscall
	
	li $v0,5 #leitura do 'a'
	syscall
	
	add $t0, $zero,$v0 #$t0  = $a0(valor lido)
	
	li $v0, 4
	la $a0, fibonacci3 #mensagem inserir 'b'
	syscall
	
	li $v0,5 #leitura do 'b'
	syscall


	
	add $a1, $zero, $v0 #$a1  = $v0(valor lido)
	
	#se b > a continua, se nao imprime a mensagem de erro e volta para a leitura
	bge $a0, $t0, continue
		li $v0, 4
		la $a0, fibonacci_erro #mensagem inserir 'b'
		syscall
		
		j leituras
continue:
	add $a0, $zero, $t0 #$a0 = $t0 (valor de 'a')
	
	jal fibonacci
	
caso_11:
	addi $t0, $zero, 10 #$t0 = 11
	bne $t0,$t1, opcao_lida
	j exit
	
	
exit:
	li $v0,10 #encerra o programa
	syscall

#imprime o menu
imprime_menu:
	
	addi $sp,$sp, -4 #coloca na pilha por pratica de programacao
	sw $ra, 0($sp)
	
	li $v0, 4
	la $a0, menu0 #imprime a primeira linha da mensagem do menu
	syscall
	
	li $v0, 4
	la $a0, menu1 #imprime a segunda linha da mensagem do menu
	syscall
	
	li $v0, 4
	la $a0, menu2 #imprime a terceira linha da mensagem do menu
	syscall
	
	li $v0, 4
	la $a0, menu3 #imprime a quarta linha da mensagem do menu
	syscall
	
	li $v0, 4
	la $a0, menu4 #imprime a quinta linha da mensagem do menu
	syscall
	
	li $v0, 4
	la $a0, menu5 #imprime a sexta linha da mensagem do menu
	syscall
	
	li $v0, 4
	la $a0, menu6 #imprime a sétima linha da mensagem do menu
	syscall
	
	li $v0, 4
	la $a0, menu7 #imprime a oitava linha da mensagem do menu
	syscall
	
	li $v0, 4
	la $a0, menu8 #imprime a nona linha da mensagem do menu
	syscall
	
	li $v0, 4
	la $a0, menu9 #imprime a decima linha da mensagem do menu
	syscall
	
	li $v0, 4
	la $a0, menu10 #imprime a decima primeira linha da mensagem do menu
	syscall
	
	li $v0, 4
	la $a0, menu11 #imprime a decima segunda e ultima linha da mensagem do menu
	syscall
	
	lw $ra, 0($sp)
	addi $sp,$sp, 4
	
	jr $ra

#sequencia de fibonacci do interval [a,b]
#recebe em $a0(parametro 1) o valor 'a',recebe em $a1(parametro 2) o valor 'b', a < b
fibonacci:
	addi $sp,$sp,-12
	sw $a0,0($sp)
	sw $a1, 4($sp)
	sw $ra, 8($sp)
	
	
	
	#o $t0 comeca em 1 e $t1 comeca em 0 para a sequencia ficar 1,0,1,1,2
	#assim meio que pensando que os valores iniciais de $t0 e $t1 sao fibonacci(-1) e fibonacci(0), 
	#so para sair o resultado correto de fibonacci(1) e fibonacci(2)
	
	addi $t0, $zero, 1 #primeiro elemento do fibonaci
	
	#Se o primeiro elemento pertencer a sequencia, o imprime
	
	addi $t1, $zero, 0 #segundo elemento do fibonaci
	
	#t0 e t1 vao guardar, respectivamente, sempre o f(N - 2), f(N - 1) do F(N) que estou calculando, 
	#sendo f(N) o enesimo valor da sequencia de fibonacci
	
	addi $t3,$zero, 1 #contador de qual elemento da sequencia, comeca maior que 3
	
	add $t4, $zero, $a0 # $t4 = $a0(valor a do intervalor)
	
	
	
loop:	bgt $t3, $a1, fim_loop #se o contador passar de b para o fibonacci
		
		
		# $t2 =  fibonacci($t3)
		add $t2,$t0,$t1
		
		#se $t3 for menor que a nao eh para imprimir
		blt $t3, $t4, troca
			
			li $v0, 1 #imprime o valor de fibonacci($t3)
			add $a0,$zero,$t2
			syscall
			
			#se nao for o ultimo elemento, imprime a virgula ','
			beq $t3,$a1,troca
				li $v0,4
				la $a0,virgula
				syscall
		
troca:

		add $t0,$zero,$t1 #em como vamo incrementar o contador
		add $t1,$zero,$t2
		
		addi $t3,$t3,1 #incrementa o contador
		
		j loop
		
fim_loop:

	lw $ra,8($sp)
	lw $a1,4($sp)
	lw $a0, 0($sp)
	addi $sp, $sp, 12
	
	jr $ra
#fim Fibonacci