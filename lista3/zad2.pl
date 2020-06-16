max_sum([], _, Max , Max).
max_sum([H | T], Curr, Max, X) :-
    % jezeli suma bedzie ujemna to zaczynamy liczyc od nowa
    New is max(Curr + H, 0),
    M is max(New, Max),
    max_sum(T, New, M, X).



max_sum(L, X) :-
    max_sum(L, 0, 0, X).
        
