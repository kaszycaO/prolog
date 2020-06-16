
% jesli X jest glowa to nie moze znajdowac sie w ogonie
jednokrotnie(X, [X | L]) :- 
        \+ member(X, L).
jednokrotnie(X, [Y | L]) :-
        jednokrotnie(X, L),
         X \= Y.
               

% jesli X jest glowa to pojawi sie tylko raz w ogonie      
dwukrotnie(X, [X | L]) :- 
        jednokrotnie(X, L).

dwukrotnie(X, [Y | L]) :-
       dwukrotnie(X, L),
       X \= Y.          
