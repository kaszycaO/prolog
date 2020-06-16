% dziala troche jak funkcja roznowartosciowa
% numlist -> permutacja

przypisz([], [], []).
przypisz([E1|R1],[E2|R2], [E1,E2|Tail]) :-
    przypisz(R1, R2, Tail).

lista(N, L) :-
    numlist(1, N, X),
    permutation(Y, X),
    przypisz(X, Y, L).
