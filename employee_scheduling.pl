% Define employees
employee(john).
employee(jane).
employee(bob).
employee(sara).

% Define shifts
shift(morning).
shift(afternoon).
shift(evening).

% Define days
day(monday).
day(tuesday).
day(wednesday).
day(thursday).
day(friday).

% Define employee availability
available(john, monday, morning).
available(john, tuesday, afternoon).
available(john, wednesday, evening).
available(john, thursday, morning).
available(john, friday, afternoon).
available(jane, monday, morning).
available(jane, tuesday, morning).
available(jane, wednesday, afternoon).
available(jane, thursday, evening).
available(jane, friday, morning).
available(bob, monday, afternoon).
available(bob, tuesday, evening).
available(bob, wednesday, morning).
available(bob, thursday, afternoon).
available(bob, friday, evening).
available(sara, monday, evening).
available(sara, tuesday, morning).
available(sara, wednesday, afternoon).
available(sara, thursday, evening).
available(sara, friday, morning).

% Define work requirements per shift
work(morning, 2).
work(afternoon, 3).
work(evening, 2).

% Schedule predicate to assign employees to shifts based on availability and work requirements
schedule(Employee, Day, Shift) :-
    employee(Employee),
    day(Day),
    shift(Shift),
    available(Employee, Day, Shift).

% Helper predicate to count the number of scheduled employees for a specific day and shift
count_employees(Day, Shift, Count) :-
    findall(Employee, schedule(Employee, Day, Shift), Employees),
    length(Employees, Count).

% Predicate to generate schedule based on requirements
generate_schedule :-
    day(Day),
    shift(Shift),
    work(Shift, RequiredCount),
    findall(Employee, (available(Employee, Day, Shift), schedule(Employee, Day, Shift)), AvailableEmployees),
    length(AvailableEmployees, AvailableCount),
    AvailableCount >= RequiredCount,
    assign_employees(Day, Shift, AvailableEmployees, RequiredCount),
    fail.

assign_employees(_, _, [], 0).
assign_employees(Day, Shift, [Employee | Rest], Count) :-
    Count > 0,
    assert(schedule(Employee, Day, Shift)),
    NewCount is Count - 1,
    assign_employees(Day, Shift, Rest, NewCount).

% Schedule report to display the scheduled employees for each day
schedule_report(Day) :-
    day(Day),
    write('--- Schedule for '), write(Day), writeln(' ---'),
    shift(Shift),
    findall(Employee, schedule(Employee, Day, Shift), Employees),
    list_employees(Employees, Shift),
    fail.
schedule_report(_).

list_employees([], _).
list_employees([Employee | Rest], Shift) :-
    write(Employee), write(' - '), write(Shift), writeln(' shift'),
    list_employees(Rest, Shift).

