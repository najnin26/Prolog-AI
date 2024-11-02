/* Facts */
male(john).
male(peter).
male(mike).
female(mary).
female(susan).
female(linda).

parent(john, peter).
parent(john, mary).
parent(mary, susan).
parent(peter, mike).
parent(linda, mike).

/* Rules */
father_of(X,Y):-
    male(X),
    parent(X,Y).

mother_of(X,Y):-
    female(X),
    parent(X,Y).

grandfather_of(X,Y):-
    male(X),
    parent(X,Z),
    parent(Z,Y).

grandmother_of(X,Y):-
    female(X),
    parent(X,Z),
    parent(Z,Y).

sister_of(X,Y):- %(X,Y or Y,X)%
    female(X),
    father_of(F, Y),
    father_of(F,X),
    X \= Y.

sister_of(X,Y):-
    female(X),
    mother_of(M, Y),
    mother_of(M,X),
    X \= Y.

aunt_of(X,Y):-
    female(X),
    parent(Z,Y),
    sister_of(Z,X),!.

brother_of(X,Y):- %(X,Y or Y,X)%
    male(X),
    father_of(F, Y),
    father_of(F,X),
    X \= Y.

brother_of(X,Y):-
    male(X),
    mother_of(M, Y),
    mother_of(M,X),X \= Y.

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

uncle_of(X,Y):-
    parent(Z,Y),
    brother_of(Z,X).

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2),
    X \= Y.

sibling_in_law(X, Y) :-
    sibling(X, S),
    parent(_, Y),
    parent(_, S),
    S \= Y.

% Mother-in-law relationship: Similar logic for mother-in-law, based on female parents of siblings
mother_in_law(MIL, C) :-
    female(MIL),
    parent(MIL, S),
    sibling(S, C).

% Father-in-law relationship: Similar logic for father-in-law, based on male parents of siblings
father_in_law(FIL, C) :-
    male(FIL),
    parent(FIL, S),
    sibling(S, C).

ancestor_of(X,Y):-
    parent(X,Y).
ancestor_of(X,Y):-
    parent(X,Z),
    ancestor_of(Z,Y).
