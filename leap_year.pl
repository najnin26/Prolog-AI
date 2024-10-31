check_leap_year :-
    write('Enter a year: '),
    read(Year),
    is_leap_year(Year).

is_leap_year(Year) :-
    (Year mod 4 =:= 0, Year mod 100 =\= 0 ; Year mod 400 =:= 0) ->
    writef('%w is a leap year.', [Year]);
    writef('%w is not a leap year.', [Year]).






