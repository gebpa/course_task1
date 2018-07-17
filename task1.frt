( check whether a number is even or odd )
: isEven 2 % if ." the number is odd" else ." the number is even" then cr ;
( check whether a number is prime or not )
: isPrime 
	dup 3 < if ." the number is prime"
		else dup 2 
			do dup r@  % 0 =
					if 1 - r> drop >r ." the number is not prime" 
					else dup r@ 1 + =
							    if ." the number is prime"
							    else
							    then 
					then 
		loop
		then cr ;
( write a value from stack to memory, push adress of value )
: new 1 allot dup rot swap ! ; 
