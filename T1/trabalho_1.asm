#UNIVERSIDADE DE SAO PAULO - INSTITUTO DE CIENCIAS MATEMATICAS E DE COMPUTACAO
#1º Trabalho Prático de Organizacao e Arquitetura de Computadores
#Alunos: Guilherme Alves Lindo, Guilherme Targon Marques Barcellos, Luan Icaro Pinto Arcanjo e Mateus Ferreira Gomes

.data
	.align 0
	menu0: .asciiz "\nMenu:\n"
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
	
	continuar: .asciiz "\nAperte Enter para continuar\n"
	
	digitenumero1: .asciiz "Digite o primeiro numero\n"
	digitenumero2: .asciiz "Digite o segundo numero\n"
	
	
	digitenumero: .asciiz "Digite o numero\n"
	
	sub: .asciiz " - " #mensagem utilizada na subtracao
	igual: .asciiz " = "
	soma: .asciiz " + " # Mensagem usada na soma	
	barra_n: .asciiz "\n"
	vezes: .asciiz " x "
	
	virgula: .asciiz ","
	
	str_IMC: .asciiz "Calculo do IMC\n"
	digitenumero_kg: .asciiz "Digite peso em kg:\n"
	digitenumero_m: .asciiz "Digite altura em metros:\n"
	fatorial_qto: .asciiz "Fatorial de quanto?\n"
	raiz_qto: .asciiz "Raiz de quanto? (Digite um valor decimal ou inteiro maior ou igual a zero)\n"
	fibonacci1: .asciiz "Fibonacci de [a,b]\n"
	fibonacci2: .asciiz "Digite o valor a\n"
	fibonacci3: .asciiz "Digite o valor b\n"
	multiplicacao: .asciiz "Multiplicacao\n"
	digite1numero_m_d: .asciiz "Digite primeiro numero(ate 16 bits):\n"
	digite2numero_m_d: .asciiz "Digite segundo numero(ate 16 bits):\n"
	divisao: .asciiz "Divisao\n"
	potencia: .asciiz "Potencia:\n"
	digite_base: .asciiz "Digite a base\n"
	digite_expoente: .asciiz "Digite o expoente\n"
	digite_tabuada: .asciiz "Digite um numero para exibir tabuada\n"
	string_tabuada: .asciiz "Tabuada:\n"
	
	fibonacci_erro: .asciiz "'b' deve ser maior ou igual a 'a'"
	
.text
.globl press_enter

press_enter:
	
	li $v0, 4
	la $a0, continuar
	syscall
	
	li $v0, 8
	syscall

	jal imprime_menu

opcao_lida:
	li $v0,5 #leitura da opcao escolhida
	syscall
	
	add $t1, $zero, $v0 # t1 = $v0, opcao lida
	
	addi $t0, $zero, 1 #$t0 = 1
	bne $t0,$t1, caso_2 #if ($t1 == 1) continua aqui, se nao testa caso_2
	
	li $v0, 4
	la $a0, digitenumero1 #mensagem de leitura do primeiro numero
	syscall
	
	li $v0,5 #leitura do primeiro numero
	syscall
	
	add $t2,$zero,$v0 #$t2 = primeiro numero lido
	
	li $v0, 4
	la $a0, digitenumero2 #mensagem de leitura do segundo numero
	syscall
	
	li $v0,5 #leitura do segundo numero
	syscall
	
	add $t3,$zero,$v0 #$t3 = segundo numero lido
	
	add $t4, $t2, $t3 #$v0 = $t2 + $t3
	
	
	add $a0, $zero,$t2 #a0 = $t2 (primeiro valor lido)
	
	li $v0,1 # imprime primeiro valor lido
	syscall
	
	li $v0, 4
	la $a0, soma #imprime +
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
	
	
	j press_enter

#Subtracao
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
	
	j press_enter
	
	
#Multiplicacao	
caso_3:
	addi $t0, $zero, 3 #$t0 = 3
	bne $t0,$t1, caso_4 #if ($t1 == 3) continua aqui, se nao testa caso_4
	
	multip:
		li $v0, 4                   #Carrega codigo imprimir string
		la $a0, multiplicacao	    #Move a string "multiplicacao"
		syscall		            #Chama o SO para realizar operacao
	
	

		li $v0, 4		   #Carrega codigo imprimir string
		la $a0, digite1numero_m_d      #Move a string "digite1numero_m_d"
		syscall			   #Chama o SO para realizar operacao
	
		
		addi $t3, $zero, 32767     #Adiconando valor "32767"(raiz de (2^15-1)) ao registrador $t3
	

		li $v0, 5		   #Carrega codigo ler inteiro
		syscall			   #Chama o SO para realizar operacao
		move $t0, $v0              #Move inteiro lido para $t0	
	
		bgt $t0, $t3, multip       #Verificando se utrapassa multiplicando maximo.
	
		li $v0, 4		   #Carrega codigo imprimir string
		la $a0, digite2numero_m_d      #Move a string "digite2numero"
		syscall			   #Chama o SO para realizar operacao
	
	
		li $v0, 5	           #Carrega codigo ler inteiro
		syscall			   #Chama o SO para realizar operacao
		move $t1, $v0		   #Move inteiro lido para $t1
	
		bgt $t1, $t3, multip       #Verificando se utrapassa multiplicando maximo.
	
		mul $t2, $t0, $t1        #Multiplica conteudo de $t0 com $t1 e armazena em $t2
	
	
		li $v0, 1		   #Carrega codigo imprimir inteiro
		move $a0, $t2		   #Move $t2(resultado multiplicacao) para $a0
		syscall			   #Chama o SO para realizar operacao
	
		j press_enter
	
	
#Divisao
caso_4: 
	addi $t0, $zero, 4 #$t0 = 4
	bne $t0,$t1, caso_5 #if ($t1 == 4) continua aqui, se nao testa caso_5
	
	li $v0, 4                   #Carrega codigo imprimir string
	la $a0, divisao	    	    #Move a string "divisao"
	syscall		            #Chama o SO para realizar operacao
	
	
	
	li $v0, 4		   #Carrega codigo imprimir string
	la $a0, digite1numero_m_d      #Move a string "digite1numero_m_d"
	syscall			   #Chama o SO para realizar operacao
	
	
	
	

	li $v0, 7		   #Carrega codigo ler double
	syscall			   #Chama o SO para realizar operacao
	mov.d $f2, $f0             #Move double lido para $f2	
	
	
	
	li $v0, 4		   #Carrega codigo imprimir string
	la $a0, digite2numero_m_d     #Move a string "digite2numero_m_d"
	syscall			   #Chama o SO para realizar operacao
	
	
	li $v0, 7	           #Carrega codigo ler double
	syscall			   #Chama o SO para realizar operacao
	mov.d $f4, $f0		   #Move double lido para $f4
	
	
	
	div.d $f6, $f2, $f4        #Divide conteudo de $f2 por $f4 e armazena em $f6
	
	
	li $v0, 3		   #Carrega codigo imprimir double
	mov.d $f12, $f6		   #Move $f6(resultado divisao) para $f12
	syscall			   #Chama o SO para realizar operacao
	
	j press_enter
	
#Potencia	
caso_5:
	addi $t0, $zero, 5 #$t0 = 5
	bne $t0,$t1, caso_6 #if ($t1 == 5) continua aqui, se nao testa caso_6
	
	
	li $v0, 4                   #Carrega codigo imprimir string
	la $a0, potencia	    #Move a string "potencia"
	syscall		            #Chama o SO para realizar operacao
	
	
	
	li $v0, 4		   #Carrega codigo imprimir string
	la $a0, digite_base	   #Move a string "digite_base"
	syscall			   #Chama o SO para realizar operacao
	

	li $v0, 5		   #Carrega codigo ler inteiro
	syscall			   #Chama o SO para realizar operacao
	move $t2, $v0              #Move inteiro lido para $t2	
	
	
	li $v0, 4		   #Carrega codigo imprimir string
	la $a0, digite_expoente    #Move a string "digite_expoente"
	syscall			   #Chama o SO para realizar operacao
	
	
	li $v0, 5	           #Carrega codigo ler inteiro
	syscall			   #Chama o SO para realizar operacao
	move $t3, $v0		   #Move inteiro lido para $t3
	
	addi $s0, $zero, 1         #Seta $s0 = 1 (Onde serao armazenadas as sucessivas multiplicacoes)
	
	loop_pot:
		beq $t3, $zero, end_loop_pot     #Caso $t3 igual a zero, potencia ja foi calculada(a cada multiuplicacao decresce 1 na potencia)
		mul $s0, $s0, $t2		 #Faz a multiplicacao da base com $s0(inicialmente $s0 = 1)
		addi $t3, $t3, -1	         #Decresce potencia em 1
		j loop_pot			 #Volta comeco loop da potencia	
		
		
	end_loop_pot:
	
	
	
	li $v0, 1		   	#Printa resposta
	move $a0, $s0		   
	syscall			  
	
	j press_enter

#Raiz
caso_6:
	addi $t0, $zero, 6 #$to = 6
	bne $t0,$t1, caso_7 #if ($t1 == 6) continua aqui, se nao testa caso_7
	
		#LENDO OS VALORES
	leitura_raiz:
	
		li $v0, 4			# Carrega a funcao de printar uma string
		la $a0, raiz_qto	# Posiciona no registrador
		syscall			# Printa
	
		li $v0, 7			# Carrega a funcao de ler um double
		syscall			# Le o double (sobre o qual a raiz sera tirada)
	
		mov.d $f2, $f0		# Movendo o double lido para o registrador $f2
		
		li $t2, 0 				# Carregando 0 em $t2 para converter em double
		mtc1.d $t2, $f4			# Movendo 0 de $t2 para $f4
 		cvt.d.w $f4, $f4			# Convertendo o conteudo de $f4 para double
									
		c.eq.d $f4, $f2
		bc1t raiz_zero 
		
		c.lt.d $f2, $f4		#Caso numero seja menor que zero volta para leitura_raiz.
		bc1t leitura_raiz 
	
		jal raiz			# Jump and link para realizar o procedimento
	
		li $v0, 3			# Printa a resposta
		mov.d $f12, $f0	
		syscall
		
	raiz_zero:
	
		li $v0, 3			# Printa 0
		mov.d $f12, $f4	
		syscall
		
		
		
		j press_enter
#Tabuada	
caso_7:
	addi $t0, $zero, 7 #$t0 = 7
	bne $t0,$t1, caso_8 #if ($t1 == 7) continua aqui, se nao testa caso_8
	
	
	
	
	li $v0, 4                   #Carrega codigo imprimir string
	la $a0, string_tabuada	    #Move a string "string_tabuada"
	syscall		            #Chama o SO para realizar operacao
	
	
	
	li $v0, 4		   #Carrega codigo imprimir string
	la $a0, digite_tabuada      #Move a string "digite_tabuada"
	syscall			   #Chama o SO para realizar operacao
	

	li $v0, 5		   #Carrega codigo ler inteiro
	syscall			   #Chama o SO para realizar operacao
	move $t4, $v0              #Move inteiro lido para $t4
	
	addi $t2, $zero, 11        #Variavel controle final loop
	addi $t3, $zero, 1
	
	loop_tabuada:
		beq $t3, $t2, end_loop_tabuada
		mul $t5, $t3, $t4
		
		li $v0, 1		   #Carrega codigo imprimir inteiro
		move $a0, $t3		   #Move $t3(contador tabuada) para $a0
		syscall
		
		li $v0, 4		   #Carrega codigo imprimir string
		la $a0, vezes 		   #Move a string "vezes"
		syscall			  			   
		
		li $v0, 1		   #Carrega codigo imprimir inteiro
		move $a0, $t4		   #Move $t4(numero) para $a0
		syscall
		
		li $v0, 4		   #Carrega codigo imprimir string
		la $a0, igual       	   #Move a string "igual"
		syscall	
		
		li $v0, 1		   #Carrega codigo imprimir inteiro
		move $a0, $t5		   #Move $t5(valor tabuada atual) para $a0
		syscall
		
		li $v0, 4		   #Carrega codigo imprimir string
		la $a0, barra_n            #Move a string "barra_n"
		syscall		
		
		addi $t3, $t3, 1
		j loop_tabuada
	
	
	end_loop_tabuada:
	
	j press_enter

#IMC
caso_8:
	addi $t0, $zero, 8 #$t0 = 8 
	bne $t0,$t1, caso_9 #if ($t1 == 8) continua aqui, se nao testa caso_9
	
	li $v0, 4                   #Carrega codigo imprimir string
	la $a0, str_IMC	    	    #Move a string "str_IMC"
	syscall		            #Chama o SO para realizar operacao
	
	leitura_IMC:
	
		li $v0, 4		   #Carrega codigo imprimir string
		la $a0, digitenumero_kg      #Move a string "digitenumero_kg"
		syscall			   #Chama o SO para realizar operacao
	
	

		li $v0, 7		   #Carrega codigo ler double
		syscall			   #Chama o SO para realizar operacao
		mov.d $f2, $f0             #Move double lido para $f2(peso)	
	
	
	
		li $t2, 0 				# Carregando 0 em $t2 para converter em double
		mtc1.d $t2, $f4			# Movendo 0 de $t2 para $f4
 		cvt.d.w $f4, $f4			# Convertendo o conteudo de $f4 para double
									
											
		c.le.d $f2, $f4		#Caso numero seja menor que zero volta para leitura_IMC.
		bc1t leitura_IMC 
		
	
	
	leitura_altura:
	
		li $v0, 4		   #Carrega codigo imprimir string
		la $a0, digitenumero_m      #Move a string "digitenumero_m"
		syscall			   #Chama o SO para realizar operacao
	
	
		li $v0, 7	           #Carrega codigo ler double
		syscall			   #Chama o SO para realizar operacao
		mov.d $f4, $f0		   #Move double lido para $f4(altura)
		
		
		li $t2, 0 				# Carregando 0 em $t2 para converter em double
		mtc1.d $t2, $f6			# Movendo 0 de $t2 para $f6
 		cvt.d.w $f6, $f6			# Convertendo o conteudo de $f6 para double
									
											
		c.le.d $f4, $f6		#Caso numero seja menor que zero volta para leitura_IMC.
		bc1t leitura_altura 
	
	
	
		mul.d  $f4, $f4, $f4        #Multiplica conteudo de $f4 por $f4 e armazena em $f4
		
		div.d $f6, $f2, $f4
	
	
		li $v0, 3		   #Carrega codigo imprimir double
		mov.d $f12, $f6		   #Move $f6(resultado divisao) para $f12
		syscall			   #Chama o SO para realizar operacao
	
		j press_enter

#Fatorial
caso_9:
	addi $t0, $zero, 9 #$$t0 = 9
	bne $t0,$t1, caso_10 #if ($t1 == 9) continua aqui, se nao testa caso_10
	
	li $v0, 4			# Carrega a funcao de printar uma string
	la $a0, fatorial_qto# Posiciona no registrador
	syscall			# Printa
	
	li $v0, 5			# Carrega a funcao de ler um int
	syscall			# Le o int
	
	move $a0, $v0		# Move o numero lido (ate onde fazer o fatorial) para o registrador $t0
	jal fatorial	# Chama o fatorial, colocando o $ra na proxima instrucao
	
	move $t1, $v0	# Colocando o resultado do fatorial em $t1 para printar
	
	li $v0, 1		# Carrega a funcao de printar o numero resultado do fatorial
	move $a0, $t1	# Coloca o resultado em $a0
	syscall		# Printa o resultado
	
	j press_enter

#Fibonacci
caso_10:
	addi $t0, $zero, 10 #$t0 = 10
	bne $t0,$t1, caso_11 #if ($t1 == 10) continua aqui, se nao testa caso_11
	
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
	
	j press_enter

#Encerrar Programa	
caso_11:
	addi $t0, $zero, 11 #$t0 = 11
	bne $t0,$t1, opcao_lida
	
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
#Fim Fibonacci

#Inicio Raiz

raiz:

		addi $sp, $sp, -8 				# Alocando espaco na pilha para armazenar o numero digitado
		s.d $f2, 4($sp)   				# e o conteudo de $ra para quando finalizar a funcao
		sw $ra, 0($sp)   				# a0 esta' 4 posicoes distantes de $sp e $ra a 0

		
		encontrar_a:
			
			li $t1, 1 				# Carregando 1 em $t1 para converter em um double
			mtc1.d $t1, $f0 			# Movendo o conteudo de $t1 para $f0
 			cvt.d.w $f0, $f0 			# Convertendo o conteudo de $f0, ou seja, 1, para double e armazenando em $f0
									# $f0 funcionara' como uma especie de auxiliar para o contador,
									# isto e', possuira' o valor 1 somente para incrementar $f4 (contador)
							
			li $t0, 1 				# Carregando 1 em $t0 para converter em double
			mtc1.d $t0, $f4			# Movendo 1 de $t0 para $f4
 			cvt.d.w $f4, $f4			# Convertendo o conteudo de $f4 para double
									# $f4 sera' o contador para encontrar o quadrado perfeito inferior
							
							
			

			loop_a:
				
				mul.d $f6, $f4, $f4		# $f6 = $f4^2
				c.le.d $f6, $f2		# Enquanto $f6 nao passar do numero dado, vai multiplicando
				bc1f a_encontrado		# Se passou, vai para a_encontrado
				
				c.eq.d $f6, $f2		# Se deu exatamente o numero digitado, entao temos um caso de raiz perfeita
				bc1t exit_raiz_exata	# Dessa forma, saimos e retornaremos o contador
				
				add.d $f4, $f4, $f0		# Caso contrario, vai incrementando o contador para multiplicar
				j loop_a				
				
			a_encontrado:
			
				li $t1, -1 			# Carregando -1 em $t1 pois agora temos o contador com um numero acima,
									# isto e', o quadrado perfeito superior ao que queremos
				mtc1.d $t1, $f0		# Movendo -1 de $t1 para $f0
 				cvt.d.w $f0, $f0 		# Convertendo $f0 para double	
				
				add.d $f4, $f4, $f0		# Subtrai 1 de $f4 (contador), pronto, agora temos a raiz do quadrado
									# perfeito inferior em $f4
				mov.d $f6, $f4			# Salva A em $f6
			
									# Encontrando B
				
									# Para encontrar B, basta dividir o numero digitado
									# por A
				div.d $f8, $f2, $f6 	# B e' salvo em $f8
				
									# Encontrando C

									# Para encontrar C, temos que somar A e B e dividir
									# por 2; C = (A + B)/2.0				
				
				li $t1, 2				# Armazenando 2 em $t1 para ser o denominador dessa 
									# divisao
				mtc1.d $t1, $f0		# Movendo 2 para $f0 ($f0 = 2)
 				cvt.d.w $f0, $f0 		# Convertendo o conteudo de $f0 para double
				
				
				add.d $f10, $f6, $f8	# A + B = C
				div.d $f10, $f10, $f0 	# C = C/2.0 ($f10 = C)
				
									# Encontrando D
									# Para encontrar D, temos que dividir o numero
									# dado ($f2) por C
								
				div.d $f14, $f2, $f10 	# D = $f2/C (Armazenado em $f14) 
				
									# Encontrando a raiz
									# Para finalmente encontrar a raiz, somamos C
									# e D e dividimos por 2
				add.d $f16, $f14, $f10 	# Raiz = C + D
				div.d $f16, $f16, $f0  	# Raiz = Raiz / 2
				j exit_raiz_n_exata
				
			exit_raiz_exata:
				
				mov.d $f0, $f4			# Utilizando $f0 para retornar a raiz exata		
				l.d $f2, 4($sp)		# Recarregando $f2 com o valor digitado
				lw $ra, 0($sp)			# Recarregando $ra
				addi $sp, $sp, 8		# Movendo de volta o stack pointer 
				jr $ra
			
			exit_raiz_n_exata:
				
				mov.d $f0, $f16		# Utilizando $f0 para retornar a raiz calculada
				l.d $f2, 4($sp)		# Recarregando $f2 com o valor digitado
				lw $ra, 0($sp)			# Recarregando $ra
				addi $sp, $sp, 8		# Movendo de volta o stack pointer
				jr $ra

#Fim Raiz

#Fatorial
fatorial:
		
		addi $sp, $sp, -8 # Alocando espaco na pilha para armazenar o numero digitado
		sw $a0, 4($sp)    # e o conteudo de $ra para quando finalizar a funcao
		sw $ra, 0($sp)    # a0 esta' 4 posicoes distantes de $sp e $ra a 0
		addi $v0, $zero, 1	# Armazenando 1 em v0 para realizar o calculo de multiplicacao
		
		
		loop_fat:

			mul $v0, $v0, $a0			# $v0 = $v0*$a0
			addi $a0, $a0, -1			# $a0--
			beq $a0, $zero, fim_loop_fat	# Enquanto $a0 nao chegar a zero
			j loop_fat				# realiza o loop
	
		fim_loop_fat:
			
			lw $a0, 4($sp)			# Carregando de volta os valores nos
			lw $ra, 0($sp)			# registradores para retornar a posicao
			addi $sp, $sp, 8		# salva em $ra
			jr $ra
#Fim Fatorial
