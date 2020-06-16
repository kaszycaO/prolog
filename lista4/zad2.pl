%Norweg zamieszkuje pierwszy dom
%Anglik mieszka w czerwonym domu.
%Zielony dom znajduje się bezpośrednio po lewej stronie domu białego.
%Duńczyk pija herbatkę.
%Palacz papierosów light mieszka obok hodowcy kotów.
%Mieszkaniec żółtego domu pali cygara.
%Niemiec pali fajkę.
%Mieszkaniec środkowego domu pija mleko.
%Palacz papierosów light ma sąsiada, który pija wodę.
%Palacz papierosów bez filtra hoduje ptaki.
%Szwed hoduje psy.
%Norweg mieszka obok niebieskiego domu.
%Hodowca koni mieszka obok żółtego domu.
%Palacz mentolowych pija piwo.
%W zielonym domu pija się kawę.
 



%narodowosc, kolor domu, napoje, papierosy, zwierze

wskazowka1(Info) :- znajdz(1, Info, (norweg,_,_,_,_)).

wskazowka2([(anglik,czerwony,_, _, _)|_]).
wskazowka2([_|T]) :- wskazowka2(T).

wskazowka3([(_,zielony,_,_,_),(_,bialy,_,_,_)|_]).
wskazowka3([_|T]) :- wskazowka3(T).

wskazowka4([(dunczyk,_,herbata,_,_)|_]).
wskazowka4([_|T]) :- wskazowka4(T).

wskazowka5([(_,_,_,light,_),(_,_,_,_,koty)|_]).
wskazowka5([(_,_,_,_,koty),(_,_,_,light,_)|_]).
wskazowka5([_|T]) :- wskazowka5(T).

wskazowka6([(_,zolty,_,cygaro,_)|_]).
wskazowka6([_|T]) :- wskazowka6(T).

wskazowka7([(niemiec,_,_,fajka,_)|_]).
wskazowka7([_|T]) :- wskazowka7(T).

wskazowka8(Info) :- znajdz(3, Info, (_,_,mleko,_,_)).

wskazowka9([(_,_,_,light,_),(_,_,woda,_,_)|_]).
wskazowka9([(_,_,woda,_,_),(_,_,_,light,_)|_]).
wskazowka9([_|T]) :- wskazowka9(T).

wskazowka10([(_,_,_,bezfiltra, ptaki)|_]).
wskazowka10([_|T]) :- wskazowka10(T).

wskazowka11([(szwed,_,_,_,psy)|_]).
wskazowka11([_|T]) :- wskazowka11(T).

wskazowka12([(norweg,_,_,_,_),(_,niebieski,_,_,_)|_]).
wskazowka12([(_,niebieski,_,_,_),(norweg,_,_,_,_)|_]).
wskazowka12([_|T]) :- wskazowka12(T).

wskazowka13([(_,zolty,_,_,_),(_,_,_,_,konie)|_]).
wskazowka13([(_,_,_,_,konie),(_,zolty,_,_,_)|_]).
wskazowka13([_|T]) :- wskazowka13(T).

wskazowka14([(_,_,piwo,mentolowe,_)|_]).
wskazowka14([_|T]) :- wskazowka14(T).

wskazowka15([(_,zielony,kawa,_,_)|_]).
wskazowka15([_|T]) :- wskazowka15(T).



pytanie([(_,_,_,_,rybki)|_]).
pytanie([_|T]) :- pytanie(T).


% informacje o ludziach
info(0, []) :- !.
info(N,[(_Kto,_Kolor,_Napoj,_Papierosy,_Zwierze)|T]) :-
    NewN is N-1, 
    info(NewN,T).

% lista z odpowiedziami slozaca do znalezienia poszukiwanej osoby
znajdz(1, [H|_], H) :- !.
znajdz(N, [_|T], R) :- 
    znajdz(N1, T, R), 
    N is N1+1.

% przypisanie danych do kazdego domu, na podstawie wskazowek
rozwiazanie(Kto) :-
  info(5, Kto),
  wskazowka1(Kto),
  wskazowka2(Kto),
  wskazowka3(Kto),
  wskazowka4(Kto),
  wskazowka5(Kto),
  wskazowka6(Kto),
  wskazowka7(Kto),
  wskazowka8(Kto),
  wskazowka9(Kto),
  wskazowka10(Kto),
  wskazowka11(Kto),
  wskazowka12(Kto),
  wskazowka13(Kto),
  wskazowka14(Kto),
  wskazowka15(Kto),
  pytanie(Kto).


% rozwiazanie zagadki (przydzielenie do kazdego domu warosci), znalezienie odpowiedzi
rybki(Kto) :- 
    rozwiazanie(List),
    znajdz(_, List, (Kto, _, _, _, rybki)).



