ojciec(janusz,ola).
ojciec(janusz,ala).
ojciec(janusz,brajan).
ojciec(zbigniew, janusz).
ojciec(stasiu, zosia).
matka(zosia,ola).
matka(zosia,ala).
matka(zosia,brajan).
mezczyzna(janusz).
mezczyzna(brajan).
kobieta(zosia).
kobieta(ola).
kobieta(ala).
rodzic(janusz,ola).
rodzic(janusz,ala).
rodzic(janusz,brajan).
rodzic(zosia,ola).
rodzic(zosia,ala).
rodzic(zosia,brajan).

siostra(X,Y) :-
	kobieta(X),
	rodzic(R, X),
	rodzic(R, Y),
	X \= Y.

jest_matka(X) :-
    kobieta(X),
	matka(X,_).
	


jest_ojcem(X) :-
    mezczyzna(X),
	ojciec(X,Y),
	Y \= X.

jest_synem(X) :-
	mezczyzna(X),
	rodzic(R, X),
	X \= R.

dziadek(X,Y) :-
	(ojciec(X, O);
	ojciec(X, M)),
	(matka(M, Y);
	ojciec(O, Y)),
	O \= M.

rodzenstwo(X,Y) :-
	rodzic(R, X),
	rodzic(R, Y),
	X \= Y.


