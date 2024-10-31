pos_neg(X):-
    X>0,
    writef("%w is a positive number",[X]).

pos_neg(X):-
    X<0,
    writef("%w is a negative number",[X]).

pos_neg(X):-
    X=0,
    writef("%w is zero",[X]).
