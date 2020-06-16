merge(IN1, IN2, OUT) :-
    % dopoki IN1 oraz IN2 sa listami otwartymi
    when((nonvar(IN1), nonvar(IN2)), (
        (IN1 = [H1 | T1], IN2 = [H2 | T2])
        ->  (   (H1 < H2)
                 % przypadek gdy glowa H1 < H2
                ->  (OUT = [H1 | NEW], 
                     merge(T1, IN2, NEW))
                 % przypadek gdy glowa H1 > H2
                ;   (OUT = [H2 | NEW], 
                     merge(IN1, T2, NEW)))
        % przypadek gdy lista druga jest pusta
        ;   (   IN1 = [H1 | T1], 
                IN2 = [])
            ->  (OUT = [H1 | NEW], 
                 merge(T1, IN2, NEW))
         % przypadek gdy lista pierwsza jest pusta
        ;   (   IN1 = [], 
                IN2 = [H2 | T2])
            ->  (OUT = [H2 | NEW],
                 merge(IN1, T2, NEW))
        % domknij listy jezeli obie sa puste
        ;   OUT = [])).

