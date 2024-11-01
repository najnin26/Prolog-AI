% Define the available artists
artist(beatles).
artist(beyonce).
artist(johnny_cash).
artist(taylor_swift).
artist(ed_sheeran).
artist(rihanna).

% Define the available genres
genre(rock).
genre(pop).
genre(country).
genre(rap).

% Define the user preferences
like(john, beatles, rock).
like(john, ed_sheeran, pop).
like(john, taylor_swift, pop).
like(jane, beyonce, pop).
like(jane, rihanna, pop).
like(jane, johnny_cash, country).
like(jim, johnny_cash, country).
like(jim, ed_sheeran, pop).
like(sara, rihanna, pop).
like(sara, beyonce, pop).
like(sara, ed_sheeran, pop).

% Define the recommend predicate
recommend(User, Artist) :-
    like(User, _, Genre),
    artist(Artist),
    genre(Genre),
    like(User, Artist, Genre).

% Define the recommend report predicate
recommend_report(User) :-
    like(User, _, _),
    write('--- Recommendations for '), write(User), writeln(' ---'),
    recommend(User, Artist),
    write(Artist), writeln(' - recommended'),
    fail.

recommend_report(_).
