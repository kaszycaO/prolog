left_of(klepsydra, olowek).
left_of(motyl, klepsydra).
left_of(ryba, motyl).
left_of(aparat, rower).
left_of(klepsydra, rower).
left_of(ryba, aparat).
above(olowek, rower).
above(motyl, aparat).

above(aparat, wiadro).


right_of(Object1, Object2) :-
	left_of(Object2, Object1).


below(Object1, Object2) :-
	above(Object2, Object1).	

on_left(X,Y) :- left_of(X,Y).
on_left(X,Z) :-
	left_of(X,Y),
	on_left(Y,Z).

on_right(X,Y) :- on_left(Y,X).

is_above(X, Y) :- above(X, Y).
is_above(X, Z) :-
	above(X, Y),
	is_above(Y, Z).

	
higher(X, Y):- is_above(Y, X).
higher(X, Z):-
	(on_right(Z, Y);
	on_left(Z, Y)),
	is_above(Y, X).
