program([]) --> [].
program([I | P]) --> instrukcja(I), [sep(;)], program(P).

instrukcja(assign(ID, W)) --> [id(ID)], [sep(':=')], wyrazenie(W).
instrukcja(read(ID)) --> [key('read')], [id(ID)].
instrukcja(write(W)) --> [key('write')], wyrazenie(W).
instrukcja(if(W,P)) --> [key('if')], warunek(W), [key('then')], program(P), [key('fi')].
instrukcja(if(W,P1,P2)) --> [key('if')], warunek(W), [key('then')], program(P1), [key('else')], program(P2), [key('fi')].
instrukcja(while(W,P)) --> [key('while')], warunek(W), [key('do')], program(P), [key('od')].

wyrazenie(A+B) --> skladnik(A), [sep(+)], wyrazenie(B).
wyrazenie(A-B) --> skladnik(A), [sep(-)], wyrazenie(B).
wyrazenie(A) --> skladnik(A).

skladnik(A*B) --> czynnik(A), [sep(*)], skladnik(B).
skladnik(A/B) --> czynnik(A), [sep(/)], skladnik(B).
skladnik(A mod B) --> czynnik(A), [key('mod')], skladnik(B).
skladnik(A) --> czynnik(A).

czynnik(id(A)) --> [id(A)].
czynnik(int(A)) --> [int(A)].
czynnik(A) --> [sep('(')], wyrazenie(A), [sep(')')].

warunek(A ; B) --> koniunkcja(A), [key('or')], warunek(B).
warunek(A) --> koniunkcja(A).

koniunkcja(A ',' B) --> prosty(A), [key('and')], koniunkcja(B).
koniunkcja(A) --> prosty(A).

prosty(A=:=B) --> wyrazenie(A), [sep(=)], wyrazenie(B).
prosty(A=\=B) --> wyrazenie(A), [sep('/=')], wyrazenie(B).
prosty(A<B) --> wyrazenie(A), [sep(<)], wyrazenie(B).
prosty(A>B) --> wyrazenie(A), [sep(>)], wyrazenie(B).
prosty(A>=B) --> wyrazenie(A), [sep(>=)], wyrazenie(B).
prosty(A=<B) --> wyrazenie(A), [sep(=<)], wyrazenie(B).
prosty(A) --> [sep('(')], warunek(A), [sep(')')].

test(PROGRAM):-
    open('ex1.prog', read, X), 
    scanner(X, Y), close(X), 
    phrase(program(PROGRAM), Y).

