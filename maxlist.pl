list:-
    write("Enter thr list : "),
    read(List),
    max(List,Max),
    format("The maximum in list is ~w ",[Max]).

max([X],X).
max([H|T],Max):-
    max(T,MaxTail),
    Max is max(H,MaxTail).

