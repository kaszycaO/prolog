/*le(X,Y) <=> X <= Y*/

le(1, 6).
le(6, 7).
le(6, 8).


w_zbiorze(X) :- 
	le(X,_);
	le(_,X).

maksymalny(X) :- 
	w_zbiorze(X),
	\+(( w_zbiorze(Y),
		 le(X,Y), 
		 X \= Y )).

minimalny(X) :-
	w_zbiorze(X),
	\+(( w_zbiorze(Y),
		le(Y,X),
		X \= Y )).

najwiekszy(X) :-
	maksymalny(X), 
	\+ (maksymalny(Y), X \= Y).

najmniejszy(X) :-
	minimalny(X),
	\+ (minimalny(Y), X \= Y).	
	
		


	
	
