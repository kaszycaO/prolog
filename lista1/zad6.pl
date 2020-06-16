

if_prime(X) :-
	X > 1,
	Y is integer(sqrt(X)),
	\+ (between(2, Y, Z),
		X mod Z =:= 0 ).
	

prime(LO, HI, N) :-
	between(LO, HI, N),
	if_prime(N).
