( check whether a number is even or odd, if it is Odd, push 1 to data stack, else push 0 )
: isEven 2 % if 1 else 1 then ;

( check whether a number is prime or not, if it is prime, push 1 to datastack, else push 0 )
: isPrime 
	dup 3 < if drop 1
		else dup 2 
			do dup r@  % 0 =
					if 1 - r> drop >r 0 
					else dup r@ 1 + =
							    if drop 1
							    else
							    then 
					then 
		loop
		then ;

( write a value from stack to memory, push adress of value )
: writeResultToMemory 8 allot dup rot swap ! ;

( implementation of writeResultToMemory )
: impl isPrime writeResultToMemory ;

( find num of symbols in two strings and allocate memory for their concatation )
( pointer1 pointer2 -- pointer2 pointer1 pointerToConcat )
: allocForConcat dup rot dup rot count swap  count 1 + +  heap-alloc ;

( read char from string, and shift pointer to next char )
( char[i]Pointer -- char[i+1]Pointer char ) 
: readChar dup 1 + swap c@ ;

( write char to address, and shift address by 1 )
( pointer[i] char -- pointer[i+1] )
: writeChar swap dup 1 + swap rot swap c! ;

( copy char from pointer1 to pointer2 )
( pointer2[i] pointer1[i] -- pointer2[i+1] pointer1[i+1]  )   
: copyChar readChar rot swap writeChar swap ;

( concat two strings, print result, push to stack pointer to result )
( pointerToStr1 pointerToStr2 -- pointerToResult )
: concat allocForConcat dup rot dup count 0 do copyChar loop drop rot dup count 1 + 0 do copyChar loop drop drop dup prints ;

( check whether a number can be written as a product of prime numbers, where every factor is unique, if number is prime, print "number is prime", if every factor is unique push to data stack 1, else 0 )
: isPrimarn dup 1 swap rot isPrime 
			if drop m" number is prime" prints cr drop
			else dup 2 / 1 + 2 
								do dup r@ % 0 = 
										if dup r@ / r@ % 0 = 
												    if r> r@ 1 - >r drop drop drop 0 
												    then 
										then  
								loop dup 0 = 
									if else drop
									then
			then ;
