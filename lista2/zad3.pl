arc(a, b).
arc(b, a).
arc(b, c).
arc(c, b).
arc(e, d).

droga(X, Y, L) :-
        arc(X, Y).

% do listy sa zapisywane odwiedzone punkty, dane nie powtorza sie
droga(X, Y, L) :-
        arc(X, Z),
        \+ (member(Z, L)),
        droga(Z, Y, [Z | L]).
     

osiagalny(X, X).
osiagalny(X, Y) :-
        droga(X, Y, [X]).


