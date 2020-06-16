% append obcina ostatni element, a wywolanie srodkowy obcina pierwszy
% rekurencja dla elementow znajdujacych sie w srodku

srodkowy([L], L).
srodkowy([_ | L1], X) :-
        append(L2, [_], L1),
        srodkowy(L2, X).
 
      
    
