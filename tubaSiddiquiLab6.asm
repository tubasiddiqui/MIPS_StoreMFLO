# Tuba Siddiqui
# Lab 6 CS10
# Program to compute sum of multiplied terms and using mflo
# to store 32 bit product
# Development Environment: MARS MIPS Simulator
# Solution File: tubaSiddiquiLab6.asm
# Date: 11/11/18
# MAC OSX
# Registers Used:
# a0 - address of string
# v0 - syscall parameter
# t1 - sum of multiplied terms
# t2,t3 - initial terms
# t4 - max term
# t5 - save low 32 bits

.data

name:         .asciiz "My family name is Siddiqui\n"
id:           .asciiz "My student ID is 20262796\n"
total:        .asciiz     "The sum is: "

           .text
main:

li $v0, 4                     #4 is the print_string syscall
la $a0, name                  #load addr of name into $a0
syscall                       #do the syscall

li $v0, 4                     #4 is the print_string syscall
la $a0, id                    #load addr of id into $a0
syscall                       #do the syscall

li $v0, 4                     #4 is the print_string syscall
la $a0, total                 #load addr of total sum into $a0
syscall                       #do the syscall

li $t1, 0                     #initialize
li $t2, 1                     #initial num1
li $t3, 2                     #initial num2
li $t4, 4                    #maximum term

continue:                     #sum loop
mult $t2, $t3                 #multiply num1 and num2
mflo $t5                      #32 bit product result
add $t1, $t5, $t1             #$t1 to hold sum
add $t2, $t2, 1               #add one to num1
add $t3, $t3, 1               #add one to num2
blt  $t2, $t4, continue       #continue add/mult until reach max term

li $v0, 1
move $a0, $t1                 #store & print value of $t1
syscall                       #do the syscall

li $v0, 10                    #10 is the exit syscall
syscall                       #do the syscall
