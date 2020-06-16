% ignorowanie znakow bialych podczas badania listy ze znakami
ignore(' ').
ignore('\n').



token(read,  key(read)).
token(write, key(write)).
token(if,    key(if)).
token(then,  key(then)).
token(else,  key(else)).
token(fi,    key(fi)).
token(while, key(while)).
token(do,    key(do)).
token(od,    key(od)).
token(and,   key(and)).
token(or,    key(or)).
token(mod,   key(mod)).

token(';',  sep(';')).
token('+',  sep('+')).
token('-',  sep('-')).
token('*',  sep('*')).
token('/',  sep('/')).
token('(',  sep('(')).
token(')',  sep(')')).
token('<',  sep('<')).
token('>',  sep('>')).
token('=<', sep('=<')).
token('>=', sep('>=')).
token(':=', sep(':=')).
token('=',  sep('=')).
token('/=', sep('/=')).

% sprawdzenie czy liczba jest naturalna
token(TokenString, int(Token)) :-
  atom_number(TokenString, Token),
  integer(Token), !.


% sprawdzenie czy litera jest duza za pomoca tablicy ASCII
check_uppercase(Atom) :-
    char_code(Atom, Code),
    Code >= 65,
    Code =< 90,
    !.

token_id(Token, id(Token)).

% szukanie tokenow niebedacych id
get_tokens([], '', []).

% dodaj token do rozwiazania
get_tokens([Symbol|RestOfSymbols], Memory, [Token|RestOfTokens]) :-
  \+ check_uppercase(Symbol),
  \+ ignore(Memory),
  atom_concat(Memory, Symbol, Word),
  token(Word, Token),
  get_tokens(RestOfSymbols, '', RestOfTokens), !.

% zapisz ciag znakow, az do wystapienia znaku bialego
get_tokens([Symbol|RestOfSymbols], Memory, AllTokens) :-
  \+ check_uppercase(Symbol),
  \+ ignore(Memory),  
  atom_concat(Memory, Symbol, Word),
  get_tokens(RestOfSymbols, Word, AllTokens), !.

% jezeli znak jest znakiem bialym, pomin
get_tokens([Whitespace|RestOfSymbols], Memory, AllTokens) :-
  ignore(Whitespace),
  get_tokens(RestOfSymbols, Memory, AllTokens).

% jezeli litera jest duza zacznij sprawdzac token id
get_tokens([Letter|RestOfSymbols], '', AllTokens) :-
  check_uppercase(Letter),
  atom_concat('', Letter, Word),
  id_tokens(RestOfSymbols, Word, AllTokens), !.

% szukaj id dopoki wystepuje duza litera
% Memory : zapisywanie liter skladajacych sie na slowo
id_tokens([Letter|RestOfSymbols], Memory, AllTokens) :-
  check_uppercase(Letter),
  atom_concat(Memory, Letter, Word),
  id_tokens(RestOfSymbols, Word, AllTokens), !.
% zapisz token id do listy
id_tokens([Letter|RestOfSymbols], Memory, [Token|RestOfTokens]) :-
  \+ check_uppercase(Letter),
  token_id(Memory, Token),
  get_tokens([Letter|RestOfSymbols], '', RestOfTokens), !.

scanner(Stream, Tokens) :-
  input(Stream, CharList),
  get_tokens(CharList, '', Tokens),
  !.

% wczytanie danych z pliku
input(File, []) :- 
    at_end_of_stream(File).
 
% get_code -> nastepny znak z inputu, w kodzie ASCII
% atom_codes -> zamiana kodow ASCII na poszczegolne znaki
input(File, [H|Rest]) :-
  \+ at_end_of_stream(File),
  get_code(File, CharsCode),
  atom_codes(H, [CharsCode]),
  input(File, Rest). 
