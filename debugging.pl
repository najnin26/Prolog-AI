% Debugging Exercise
greater_than_ten(X) :-
    X > 10,
    write('Greater than 10').
greater_than_ten(X) :-
    X =< 10,
    write('Not greater than 10').
