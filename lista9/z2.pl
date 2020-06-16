:- use_module(library(clpfd)).

kwadrat([Wysokosc, Szerokosc], Wymiar, [X, Y], f(X,Wymiar,Y,Wymiar)) :-
    X #>= 0,
    X #=< Wysokosc-Wymiar,
    Y #>= 0,
    Y #=< Szerokosc-Wymiar.

kwadraty(Rozmiar, Wysokosc, Szerokosc, Wspolrzedne) :-
    maplist(kwadrat([Wysokosc, Szerokosc]), Rozmiar, Helper, Obiekty),
    % funkcja sprawdzajaca czy kwadraty nie nachodza na siebie
    % obiekty (kwadraty) musza byc postaci F(X, Szerokosc, Y, Wysokosc) 
    disjoint2(Obiekty),
    pozycje(Helper, Wspolrzedne),
    labeling([], Wspolrzedne).

% odtworzenie pozycji rozwiazan
pozycje([],[]).
pozycje([[X,Y]|XYs],[X,Y|Zs]) :-
    pozycje(XYs,Zs).

% test dla odpowiedzi podanej na stronie
test :-
    kwadraty([1,1,1,1,2,2,2,2,3,3], 7, 6, [3,2,0,5,1,5,2,5,3,0,5,0,0,3,2,3,0,0,4,2]).

