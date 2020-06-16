:- include('zad1.pl').

split(IN, OUT1, OUT2) :-
    split(IN, OUT1, 0, OUT2, 0).

split(IN, OUT1, Len1, OUT2, Len2) :-
    freeze(IN, (
        IN = [H | T]
        -> (
            %sprawdz do ktorej listy wlozyc element
            (Len1 > Len2)
            ->  New_Len is Len2 + 1,
                OUT2 = [H | Rest],
                split(T, OUT1, Len1, Rest, New_Len)
            ;   New_Len is Len1 + 1,
                OUT1 = [H | Rest],
                split(T, Rest, New_Len, OUT2, Len2)
            )
          % jezeli IN jest pusta, domknij listy wynikowe
        ; (OUT1 = [], OUT2 = [])
    )).


merge_sort(IN, OUT) :-
    split(IN, P1, P2),
    freeze(P2, (
        P2 = [_]
        ->  freeze(P1, (merge_sort(P1, Sort1)))
        ,   merge_sort(P2, Sort2)
        ; OUT = P1 )),
    merge(Sort1, Sort2, OUT).
