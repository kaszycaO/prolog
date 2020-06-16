% wstawia element na nieparzyste miejsca wejsciowej listy (indeksowanie od 1)
place_odd(X, L, [X|L]).
place_odd(X, [Y,Z|T1], [Y,Z|T2]) :-
    place_odd(X, T1, T2).

% wstawia element na parzyste miejsca wejsciowej listy (indeksowanie od 1)
place_even(X, [Y|L], [Y,X|L]).
place_even(X, [Y,Z|T1], [Y,Z|T2]) :-
    place_even( X, T1, T2 ).

% parzysta permutacja to parzysta permutacja podzbiorow z elementami na nieparzystych pozycjach
% oraz nieparzysta permutacja podzbiorow z elementami na parzystych pozycjach
even_permutation([], []).
even_permutation([X|T], Ys) :-
    even_permutation(T, Y),
    place_odd(X, Y, Ys).

even_permutation([X|T], Ys) :-
    odd_permutation(T, Y),
    place_even(X, Y, Ys).

% parzysta permutacja to nieparzysta permutacja podzbiorow z elementami na parzystych pozycjach
% oraz parzysta permutacja podzbiorow z elementami na nieparzystych pozycjach
odd_permutation([X|T], Ys) :-
    odd_permutation(T, Y),
    place_odd(X, Y, Ys).

odd_permutation([X|T], Ys) :-
    even_permutation(T, Y),
    place_even(X, Y, Ys).



