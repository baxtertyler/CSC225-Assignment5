#Jack Herberger and Tyler Baxter
	.global main
	.text

main:
	la	a0, strEnterWord		# prints out the enter word prompt as well as gets the input string
	jal 	printString			# from the user and holds it into the amount of memory saved by arr (20b).
	
	la	a1, arr
	la 	s7, arr
	jal	readString
	
	li	t5, 0				# t5 gets set to the address of arr in order to check for the empty string.
	add	t5, t5, a1

checkEmpty:					# check if the input string is empty, which means that the user wants to
	li	t2, 0				# end the program. If is empty, then branch to "end".
	lb	t1, 0(t5)	
	beq	t1, t2, end
	
	la	a0, strOriginalWord		# the origional word prompt is printed out and the array is loaded into t0 in
	jal 	printString			# order to start actually printed the word.
	
	la	t0, arr
	
	li	s0, 0
	

		
	
printOG:
	lb	a0, 0(t0)			# the origional word is printed by accessing each location in memory and the
	beqz	a0, printAlphHead		# loop ends once it reaches 0, which represents the end of the array. This is
	jal	printChar			# done by adding t0 each loop and keeping the offset as 0. On top of this, s0
	addi	t0, t0, 1			# is increased each time to use as a max count var for the sorted string.
	addi	s0, s0, 1
	b 	printOG
	
printAlphHead:
	jal	printNewLine			# the prompt for the new word is printed in this section, and a variable in s1
	la	a0, strOrderedWord		# is initialized to check how many repitiions this loop has completed.
	jal	printString
	
	li	s1, 0
sort:						# sorting algorithm: loop through the array as many times as there are values
	la	t0, arr				# present. If the current value is less than the current min, the min turns into
	li	t5, 126				# the current value. At the end of the loop, this location in memory is replaced
	start:					# by a '~' and val is printed so that it will not be used in the next loop. At the 
						# end of the loop all of the values in the array will be '~' and the new string 
		lb	a0, 0(t0)		# will be printed.
		beqz	a0, next
		bgt	a0, t5, notless
		mv	t5, a0
		mv	t6, t0	
	notless:
		addi	t0, t0, 1
		b 	start
	next:
		mv	a0, t5
		jal 	printChar
		li	t3, 126
		sb	t3, 0(t6)
		addi	s1, s1, 1
		

		beq	s1, s0, repeat		# comparison between counter in s1 (counter used for new word loop) and in s2 (counter
		b 	sort			# used in printing old word) and if they are equal, the array has been traversed
						# and therefore we can print the smallest val and repeat.
repeat:	
	la	s7, arr				# reset registers being used for variables.
	li	s8, 0
	li	s9, 0
	while:
	beq	s0, s8, endwhile
	sb	s9, 0(s7)
	addi 	s7, s7, 1
	addi	s8, s8, 1
	b 	while
	
	endwhile:
	
	la	a0, newLine
	jal	printString
	b 	main

end:						# called if enter is empty. Prints out "Exiting" and exits the program.
	li	a0, 0
	la	a0, strEnd
	jal 	printString	
	jal 	sysExit


	.data
arr:		.space 20
test:		.byte 'a'
strEnterWord: .string "Enter word: "
strOriginalWord: .string "Original word: "
strOrderedWord: .string "Alphabetized word: "
strEnd: 	.string "\nExiting"
newLine:	.string "\n"
