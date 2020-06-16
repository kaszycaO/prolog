% Algorytm szukania hetmanow

zla(X) :-
    append(_, [Wi | L1], X),
    append(L2, [Wj | _], L1),
    length(L2, K),
    abs(Wi - Wj) =:= K + 1.

dobra(X) :-
    \+ zla(X).

hetmany(N, P) :-
    numlist(1, N, L),
    permutation(L, P),
    dobra(P).


% Drukowanie poziomej krawedzi odzielajacej pola
print(0).
print(Length) :-
    Length > 0,
    write("-----+"),
    New is Length - 1,
    print(New).

printBorder(Length) :-
    write("+"),
    print(Length),
    write("\n").



% tworzenie czarnych pol
blackFields(_, _, 0).
blackFields(Index, Positions, Size) :-
    Size > 0,
    write("|"),
    printFieldBlack(Index, Positions),
    write("\n"),
    New is Size - 1,
    blackFields(Index, Positions, New).

printFieldBlack(_, []).

% gdy nie ma hetmana
printFieldBlack(Index, [H|T]) :-
    Index =\= H,
    write(":::::|"),
    printFieldWhite(Index, T).

% gdy jest hetman
printFieldBlack(Index, [H|T]) :-
    Index =:= H,
    write(":###:|"),
    printFieldWhite(Index, T).


% tworzenie bialych pol
whiteFields(_, _, 0).
whiteFields(Index, Positions, Size) :-
    Size > 0,
    write("|"),
    printFieldWhite(Index, Positions),
    write("\n"),
    New is Size - 1,
    whiteFields(Index, Positions, New).
    
    
printFieldWhite(_, []).

% gdy nie ma hetmana
printFieldWhite(Index, [H|T]) :-
    Index =\= H,
    write("     |"),
    printFieldBlack(Index, T).

% gdy jest hetman
printFieldWhite(Index, [H|T]) :-
    Index =:= H,
    write(" ### |"),
    printFieldBlack(Index, T).



% drukowanie pol na zmiane 
printRow(0, _, _, _).

% pola czarne
printRow(Coords, Width, Positions, Size) :-
    Coords > 0,
    Coords mod 2 =:= 0,
    printBorder(Width),
    whiteFields(Coords, Positions, Size),
    New is Coords - 1,
    printRow(New, Width, Positions, Size).

% pola biale
printRow(Coords, Width, Positions, Size) :-
    Coords > 0,
    Coords mod 2 =:= 1,
    printBorder(Width),
    blackFields(Coords, Positions, Size),
    New is Coords - 1,
    printRow(New, Width, Positions, Size).



board(Positions) :-
    length(Positions, Length),
    printRow(Length, Length, Positions, 2),
    printBorder(Length).
