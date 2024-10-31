even(X):-
    0 is X mod 2,
    writef("Even number").
even(X):-
    1 is X mod 2,
    writef("Odd number").

greater(X,Y):-
    X>Y,
    writef("%w is greater then %w",[X,Y]).
greater(X,Y):-
    X=<Y,
    writef("%w is not grater then %w",[X,Y]).
