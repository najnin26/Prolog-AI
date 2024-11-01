%facts
male(john).
male(peter).
male(mike).
female(mary).
female(susan).
female(linda).

parent(john,peter).
parent(john,mary).
parent(mary,susan).
parent(pater,mike).
parent(linda,mike).

spouse(john, elizabeth).
spouse(elizabeth, john).
spouse(mary, michael).
spouse(michael, mary).
spouse(peter, linda).
spouse(linda, peter).

%rules
father(F,C):-
    male(F),
    parent(F,C).

mother(M,C):-
    female(M),
    parent(M,C).

sibling(X,Y):-
    parent(Z,X),
    parent(Z,Y),
    X\=Y.

grandparent(GP,C):-
    parent(GP,P),
    parent(P,C).

aunt(A,C):-
    female(A),
    sibling(A,P),
    parent(P,C).

uncle(U,C):-
    male(U),
    sibling(U,P),
    parent(P,C).

children(P,CList):-
    findall(C,parent(P,C),CList).

great_gradparent(GGP,C):-
    parent(GGP,GP),
    parent(GP,P),
    parent(P,C).

cousin(X,Y):-
    parent(P1,X),
    parent(P2,Y),
    sibling(P1,P2),
    X\=Y.

% Define a marriage relationship
married(X, Y) :-
    spouse(X, Y).

% Parent-in-law relationship
parent_in_law(X, Y) :-
    spouse(S, Y),
    parent(X, S).

% Sibling-in-law relationship (brother-in-law or sister-in-law)
sibling_in_law(X, Y) :-
    spouse(X, S),
    sibling(S, Y).

% Mother-in-law relationship
mother_in_law(MIL, C) :-
    mother(MIL, P),
    spouse(P, C).

% Father-in-law relationship
father_in_law(FIL, C) :-
    father(FIL, P),
    spouse(P, C).

