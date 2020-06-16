:- use_module(library(clpfd)).

plecak(Wartosci, Wielkosci, Pojemnosc, Zmienne) :-
    length(Wartosci, N),
    length(Zmienne, N),
    Zmienne ins 0..1,
    % poszukiwanie kombinacji przedmiotow z odpowiednia wielkoscia
    scalar_product(Wielkosci, Zmienne, #=<, Pojemnosc),
    % liczenie wartosci wybranych przedmiotow
    scalar_product(Wartosci, Zmienne, #=, Rozwiazania),
    once(labeling([max(Rozwiazania)], Zmienne)).
