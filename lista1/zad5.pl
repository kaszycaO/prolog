le(a,a).
le(b,b).
le(c,c).
le(a,b).
le(a,c).
le(d,d).
le(c,d).
le(a,d).



zwrotny() :-
	\+ (le(X,_),
           le(_,X),
           \+le(X,X)).


antysym() :-
	\+(X \= Y; \+le(X,Y); \+le(Y,X)).

przechodni() :-
	\+(\+le(X,Y); \+le(Y,Z); \+le(X,Z)).

porzadek() :-
	zwrotny(),
	przechodni(),
	antysym().

