	#+ BITTE NICHT MODIFIZIEREN: Vorgabeabschnitt
	#+ ------------------------------------------

.data

str_ergebnisse: .asciiz "Ergebnisse von bst_get_weight:\n"
str_dots: .asciiz "................... "
str_ergebnis2: .asciiz "\nSchwerstes Tier (Ergebnis von bst_heaviest): "
str_gramm: .asciiz " g\n"
str_unknown: .asciiz "????????\n"

str_1: .asciiz "Katze"
str_2: .asciiz "Elefant"
str_3: .asciiz "Nachtfalter"
str_4: .asciiz "Amsel"
str_5: .asciiz "Goldfisch"
str_6: .asciiz "Maus"
str_7: .asciiz "Regenwurm"
str_8: .asciiz "Blauwal"
str_9: .asciiz "Frosch"
str_10: .asciiz "Hund"
str_11: .asciiz "Pferd"
str_12: .asciiz "Schneeeule"

.align 2
tree_root:
node_1: .word str_1, 4000, node_2, node_3
node_2: .word str_2, 6000000, node_4, node_5
node_3: .word str_3, 5, node_6, node_7
node_4: .word str_4, 100, 0, node_8
node_5: .word str_5, 180, node_9, node_10
node_6: .word str_6, 19, 0, 0
node_7: .word str_7, 50, node_11, node_12
node_8: .word str_8, 100000000, 0, 0
node_9: .word str_9, 20, 0, 0
node_10: .word str_10, 30000, 0, 0
node_11: .word str_11, 500000, 0, 0
node_12: .word str_12, 2000, 0, 0

.text

.eqv SYS_PUTSTR 4
.eqv SYS_PUTCHAR 11
.eqv SYS_PUTINT 1
.eqv SYS_EXIT 10

.globl main
main:
	# Test von bst_get_weight:
	li $v0, SYS_PUTSTR
	la $a0, str_ergebnisse
	syscall

	la $s0, test_words
_main_test_loop:
	lb $t0, 0($s0)
	beqz $t0, _main_test_endloop
	
	move $a0, $s0
	li $v0, SYS_PUTSTR
	syscall
	
	la $a0, tree_root
	move $a1, $s0
	jal bst_get_weight
	move $t2, $v0
	
	la $a0, str_dots
_main_next_str_loop:
	lb $t0, 0($s0)
	addi $s0, $s0, 1
	addi $a0, $a0, 1
	beqz $t0, _main_next_str_endloop
	j _main_next_str_loop
_main_next_str_endloop:

	li $v0, SYS_PUTSTR
	syscall
	
	li $v0, SYS_PUTINT
	move $a0, $t2
	
	syscall

	li $v0, SYS_PUTSTR
	la $a0, str_gramm
	syscall
			
	j _main_test_loop
_main_test_endloop:

	# Test von bst_heaviest:
	li $v0, SYS_PUTSTR
	la $a0, str_ergebnis2
	syscall
	
	la $a0, tree_root
	la $v0, str_unknown
	jal bst_heaviest
	
	move $a0, $v0
	li $v0, SYS_PUTSTR
	syscall
	
	li $v0, SYS_PUTCHAR
	li $a0, '\n'
	syscall

	# Programmende
	li $v0, SYS_EXIT
	syscall
	
strcmp:
	# int strcmp (char *a, char *b);
_strcmp_loop:

	lb $t0, 0($a0)
	lb $t1, 0($a1)

	addiu $a0, $a0, 1
	addiu $a1, $a1, 1
	
	sub $t2, $t0, $t1
	bgtz $t2, _strcmp_greater
	bltz $t2, _strcmp_less
	
	bnez $t0, _strcmp_loop
	
	move $v0, $zero
	jr $ra
	
_strcmp_greater:
	addi $v0, $zero, 1
	jr $ra
	
_strcmp_less:
	addi $v0, $zero, -1
	jr $ra
		
	#+ BITTE VERVOLLSTAENDIGEN: Persoenliche Angaben zur Hausaufgabe 
	#+ -------------------------------------------------------------

	# Vorname:
	# Nachname:
	# Matrikelnummer:
	
	#+ Loesungsabschnitt
	#+ -----------------

.data

test_words:
	.asciiz "Katze"
	.asciiz "Elefant"
	.asciiz "Frosch"
	.asciiz "Maus"
	.asciiz "Blauwal"
	.asciiz "Dinosaurier"
	.asciiz "Schneeeule"
	.byte 0x00
	
.text


bst_get_weight:
#####################IMPLEMENT HERE######################################
	jr $ra

bst_heaviest:
#####################IMPLEMENT HERE##################################
	jr $ra
