:- use_module(library(clpfd)).

tasks([
    %D R1 R2
    [2, 1, 3],
    [3, 2, 1],
    [4, 2, 2],
    [3, 3, 2],
    [3, 1, 1],
    [3, 4, 2],
    [5, 2, 1]]).

%         R1 R2
resources(5, 5).

get_tasks([], T1, T2) :- 
    T1 = [],
    T2 = [].
get_tasks([[D, R1, R2 | _] | Tasks], [[D, R1] | T1], [[D, R2] | T2]) :-
    get_tasks(Tasks, T1, T2). 

schedule(Horizon, Starts, MakeSpan) :-
    tasks(L),
    get_tasks(L, L1, L2),
    resources(R1, R2),
    MakeSpan in 0..Horizon,
    mt(L1, Horizon, T1, Starts, MakeSpan),
    mt(L2, Horizon, T2, Starts, MakeSpan),
    cumulative(T1, [limit(R1)]), 
    cumulative(T2, [limit(R2)]),
    once(labeling([min(MakeSpan), ff], [MakeSpan | Starts])).

% budowanie danych dla cumulative(+Tasks, +Options)
% struktura Tasks: task(Start_time, Positive_duration, End_time, Resource_consumption, Task_id)
mt([], _, [], [], _).
mt([[D, R] | L1], Horizon, [task(S, D, E, R, _) | L2],
   [S | L3], MakeSpan) :-
    S in 0..Horizon,
    E #= S + D, MakeSpan #>= E,
    mt(L1, Horizon, L2, L3, MakeSpan).


