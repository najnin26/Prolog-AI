hello_world :-
    write('Hello, World!').

greet :-
    write('What is your name? '),
    read(Name),
    write('How old are you? '),
    read(Age),
    writef('Hello, %w! You are %w years old.', [Name, Age]).



