dzialanie(X, Y, Z) :- 
    X = Y + Z.
dzialanie(X, Y, Z) :- 
    X = Y - Z.
dzialanie(X, Y, Z) :- 
    X = Y * Z.
dzialanie(X, Y, Z) :- 
    \+ (Z =:= 0), 
    X = Y / Z.


% tworzenie wszystkich kombinacji dzialan dla niezerowych podlist LISTY
stworz([X], X).
stworz(L, X):-
    append(L1, L2, L),
    \+ length(L1, 0),
    \+ length(L2, 0),
    stworz(L1, W1),
    stworz(L2, W2),
    dzialanie(X, W1, W2).


% stworz wszystkie mozliwe kombinacje dzialan z wykozystaniem kazdego elementu LISTY
% sprawdz czy sumuja sie do WARTOSCI
wyrazenie(LISTA, WARTOSC, WYRAZENIE):-
    stworz(LISTA, X),
    WARTOSC is X,
    WYRAZENIE = X.
    
