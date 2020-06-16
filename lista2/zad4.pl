regula(X,+,Y,Y):-
    number(X),
    X=:=0,
    !.

regula(X,+,Y,X):-
    number(Y),
    Y=:=0,
    !.

regula(X,-,X,0).


regula(X,-,Y,X):-
    number(Y),
    Y =:= 0,
    !.

regula(X,*,Y,0):-
    number(X),
    X=:=0,
    !.

regula(X,*,Y,0):-
    number(Y),
    Y=:=0,
    !.

regula(X,*,Y,Y):-
    X = 1,
    !.

regula(X,*,Y,X):-
    Y = 1,
    !.

regula(X,/,Y,1):-
    Y = X.

regula(X,/,1,X).

% jezeli uprosci sie jeden element z mianownika, to drugi bedzie wynikiem
regula(X,/,Y,Z):-
    X =.. [*, A, B],
    B = Y.

regula(X,/,Y,Z):-
     X =.. [*, A, B],
     B = Z.

% jesli istnieje formula uprosc
uprosc_podzial(A, Znak, B, X):-
    regula(A, Znak, B, X).

% jesli nie istnieje zwroc w bazowej postaci
uprosc_podzial(A, Znak, B, X):-
    \+regula(A, Znak, B, _),
    X =.. [Znak, A, B].

uprosc(X, Wynik):-
    X =.. [Znak, L1, L2],
    uprosc(L1, El1),
    uprosc(L2, El2),
    uprosc_podzial(El1, Znak, El2, Wynik),
    !.
uprosc(X, Wynik):-
    Wynik = X.


