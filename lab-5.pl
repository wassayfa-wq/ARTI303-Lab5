% Lab 5 - Simpsons Family Tree

% facts male and female
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% facts parent(Parent, Child)
parent(abraham, herb).
parent(abraham, homer).
parent(mona, herb).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).


% rules

father(X, Y) :- parent(X, Y), male(X).

mother(X, Y) :- parent(X, Y), female(X).

son(X, Y) :- parent(Y, X), male(X).

daughter(X, Y) :- parent(Y, X), female(X).

grandfather(X, Z) :- parent(X, Y), parent(Y, Z), male(X).

brother(X, Y) :- parent(P, X), parent(P, Y), male(X), X \= Y.

sister(X, Y) :- parent(P, X), parent(P, Y), female(X), X \= Y.

aunt(X, Y) :- parent(P, Y), sister(X, P).

uncle(X, Y) :- parent(P, Y), brother(X, P).

cousin(X, Y) :- parent(P1, X), parent(P2, Y), brother(P1, P2), X \= Y.
cousin(X, Y) :- parent(P1, X), parent(P2, Y), sister(P1, P2), X \= Y.

% ancestor recursive rule
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).


/*
% queries and outputs

?- father(homer, bart).
true.
?- father(X, lisa).
X = homer.

?- mother(marge, bart).
true.
?- mother(selma, ling).
true.

?- son(bart, homer).
true.
?- son(herb, abraham).
true.

?- daughter(lisa, marge).
true.
?- daughter(ling, selma).
true.

?- brother(herb, homer).
true.
?- brother(bart, lisa).
true.

?- sister(patty, selma).
true.
?- sister(lisa, bart).
true.

?- grandfather(abraham, bart).
true.
?- grandfather(clancy, ling).
true.

?- aunt(patty, bart).
true.
?- aunt(selma, lisa).
true.

?- uncle(herb, bart).
true.
?- uncle(herb, maggie).
true.

?- cousin(bart, ling).
true.
?- cousin(ling, bart).
true.

?- ancestor(abraham, bart).
true.
?- ancestor(jackie, ling).
true.
*/
