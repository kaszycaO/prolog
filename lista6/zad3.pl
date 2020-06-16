% podpunkt a


gram1 --> ``.
gram1 --> `a`, gram1, `b`.


% podpunkt b
gram2 --> a(Count), b(Count), c(Count).

a(0) --> ``.
a(succ(Count)) --> `a`, a(Count).

b(0) --> ``.
b(succ(Count)) --> `b`, b(Count).

c(0) --> ``.
c(succ(Count)) --> `c`, c(Count).

% podpunkt c

gram3 --> a(Count), fib(Count).

fib(0) --> ``.
fib(succ(0)) --> `b`.
fib(succ(succ(Count))) --> fib(succ(Count)), fib(Count).

% podpunkt d
% phrase(p(L1), L2, L3)) -> L2 = L1 + L3 
% Czyli append(L1, L3, L2)
p([]) --> [].
p([X | Xs]) --> [X], p(Xs).

