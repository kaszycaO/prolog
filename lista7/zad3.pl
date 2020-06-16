filozofowie :-
    mutex_create(T1),
    mutex_create(T2),
    mutex_create(T3),
    mutex_create(T4),
    mutex_create(T5),
    
    thread_create(filozof(1, T1, T2), _),
    thread_create(filozof(2, T2, T3), _),
    thread_create(filozof(3, T3, T4), _),
    thread_create(filozof(4, T4, T5), _),
    thread_create(filozof(5, T5, T1), _).
    

filozof(X, L, R) :-
    text(X, Text),
    format('~w mysli~n', Text),
    format('~w stara się podnieść prawy widelec~n', Text),
    mutex_lock(R),
    format('~w stara się podnieść lewy widelec~n', Text),
    mutex_lock(L),
    format('~w je~n', Text),
    mutex_unlock(R),
    format('~w odkłada prawy widelec~n', Text),
    mutex_unlock(L),
    format('~w odkłada lewy widelec~n', Text),   
    filozof(X, L, R).

text(Number, Wynik) :-
    text(Number, 0, "", Wynik).

text(Number, Number, Tekst, Wynik) :-
    concat(Tekst, "[", Res1),
    concat(Res1, Number, Res2),
    concat(Res2, "]  ", Wynik),
    !.

text(Number, Counter, Tekst, Wynik) :-
    concat("  ", Tekst, Result),
    New_Counter is Counter + 1,
    text(Number, New_Counter, Result, Wynik).

