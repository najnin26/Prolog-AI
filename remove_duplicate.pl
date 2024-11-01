remove_duplicate:-
    write("Enter the list: "),
    read(List),
    remove_duplicate(List, Result),
    format("The list is ~w.", [Result]).

remove_duplicate([],[]).

remove_duplicate([H|T],Result):-
    member(H,T),
    remove_duplicate(T,Result).

remove_duplicate([H|T],[H|Result]):-
    \+ member(H,T),
    remove_duplicate(T,Result).
