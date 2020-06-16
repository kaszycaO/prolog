repeat.
repeat :- true.


ostatni(L, [L]).
ostatni(X, [_ | L ]) :-
        ostatni(X, L).
