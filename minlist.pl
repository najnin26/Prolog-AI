list:-
    write("Enter the list : "),
    read(List),
    min(List,Min),
    format("Minimum is ~w",[Min]).

min([X],X).
min([H|T],Min):-
    min(T,MinTail),
    Min is min(H,MinTail).
