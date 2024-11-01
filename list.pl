check_list_length :-
    write('Enter a list (end with a period): '),
    read(List),
    list_length(List, Len),
    format('The length of the list is ~w.', [Len]).

list_length([], 0). % Base case: An empty list has length 0.
list_length([_|T], Len) :-
    list_length(T, Len1), % Recursive step: Find the length of the tail.
    Len is Len1 + 1. % Length of the list is 1 (head) + length of the tail.

check_if_positive :-
    write('Enter a number: '),
    read(X),
    ( X > 0 -> % Directly check if X is positive
        format('~w is positive.', [X])
    ;
        format('~w is not positive.', [X])
    ).


