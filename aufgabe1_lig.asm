	#+ BITTE NICHT MODIFIZIEREN: Vorgabeabschnitt
	#+ ------------------------------------------

.data

str_Eingabe: .asciiz "Eingabe: "
str_Rueckgabewert: .asciiz "\nRueckgabewert: "
str_Ausgabe: .asciiz "\nAusgabedaten: "

.text

.eqv SYS_PUTSTR 4
.eqv SYS_PUTCHAR 11
.eqv SYS_PUTINT 1
.eqv SYS_EXIT 10

.globl main
main:

	# Eingabezeichenfolge anzeigen:
	li $v0, SYS_PUTSTR
	la $a0, str_Eingabe
	syscall
	la $a0, str_test_input
	syscall
	
	# Aufruf der zu testenden Funktion rle:
	la $a0, str_test_input
	jal lig

	# Rueckgabewert anzeigen:
	move $t0, $v0
	li $v0, SYS_PUTSTR
	la $a0, str_Rueckgabewert
	syscall
	li $v0, SYS_PUTINT
	move $a0, $t0
	syscall

	# Ausgabedaten anzeigen:
	li $v0, SYS_PUTSTR
	la $a0, str_Ausgabe
	syscall
	la $a0, str_test_input
	syscall
	
	# Programmende
	li $v0, SYS_EXIT
	syscall
	
	#+ BITTE VERVOLLSTAENDIGEN: Persoenliche Angaben zur Hausaufgabe 
	#+ -------------------------------------------------------------

	# Vorname:Xhon
	# Nachname:Taraj
	# Matrikelnummer:
	
	#+ Loesungsabschnitt
	#+ -----------------

.data

str_test_input: .asciiz "Goldfische empfinden Hoffnung."

.text


lig:

	li	$t1, 0					#int j=0
	li 	$t0, 0					#int i=0
	li	$t4, 'f'
	li	$t5, 'i'
	li	$t3, 0					#load byte placeholder
	li	$t6,'F'
	li	$t7,'I'
	li	$t8,0					#rückgabewert-placeholder
	
general_loop_for:
	
	add 	$t2, $a0, $t0				#$t2 = &s[i]
	lb	$t3, 0($t2)				#$t3=s[i]
	beq	$t3, $zero, end_for			# if (s[i]==0) go to end_for

erste_if:	
	beq	$t3, $t4, zweite_if			#if $t3==F go to zweite if 
	j 	end_if
zweite_if:# shto edhe rastin qe seshte 0
	addi	$t1, $t0, 1				#j=i+1
	add 	$t2, $a0, $t1				#$t2=&s[j] 	wo j=i+1 Nachfolger von i
	lb	$t3, 0($t2)				#$t3=s[j]
	beq	$t3, $zero, end_if			# if $t3== "\0" go to end_for	
	bne	$t3, $t4, dritte_if			# if $t3!==f=($t4) go to dritte_if							
	sb	$t6, 0($t2)				# store $t6=f in s[j]
	add 	$t2, $a0, $t0				# $t2= &s[i]
	sb	$t6, 0($t2)				#store $t6=f in a[i]
	addi	$t8,$t8,1				#increment $t8 ++1	
	j	end_if					# go to end_if
dritte_if:	
	add 	$t2, $a0, $t1				# $t2=&s[j]
	lb	$t3, 0($t2)				#$t3=s[j]
	bne	$t3, $t5, end_if			#if ($t3=s[j])!=="i" go to end_if
	sb	$t7, 0($t2)				# store "I" in s[j]	
	add 	$t2, $a0, $t0				#$t2=&s[i] geh züruck zu vorherige Bustabe
	sb	$t6, 0($t2)				#store "F" in s[i]	
	addi	$t8,$t8,1

end_if:
	add 	$t2, $a0, $t0				#$t2=&s[i]
	addi 	$t0, $t0, 1				#i++
	j 	general_loop_for			#loop and go to general_loop_for
	

end_for:
	add 	$t2, $a0, $t0				#$t2= &s[i]
	sb 	$zero, 0($t2)				#s[i]= "\0"
	move	$v0,$t8					#nimm die inkrementierte Wert von placeholder t8 und gibt die zu v0 -> register für rückgabewert)
	
	jr $ra
	
	
	
