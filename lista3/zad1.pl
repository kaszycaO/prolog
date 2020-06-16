suma([], 0).
suma([H|T], Y) :-
    number(H),
    suma(T, X),
    Y is X + H.
    

elementy([], 0).
elementy([_|T], X) :-
    elementy(T, Y),
    X is Y + 1.


srednia(S, E, R) :-
    R is S / E.
  

obliczenia([], 0, 0).
% rozwiazanie jest rowne Mem
obliczenia([], _, M, M).
obliczenia([H|T], A, Mem, Res) :-
    number(H),
    NMem is (Mem + ((H - A) * (H - A))),
    obliczenia(T, A, NMem, Res).

wariancja(L, D) :-
    elementy(L, E),
    suma(L, S),
    srednia(S, E, A),
    obliczenia(L, A, 0, R),
    D is (R / E).
