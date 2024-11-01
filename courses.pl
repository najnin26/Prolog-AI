% Define the available courses
course(cs101).
course(cs102).
course(math101).
course(math102).
course(eng101).
course(eng102).

% Define the available time slots
time_slot(monday, 9).
time_slot(monday, 11).
time_slot(tuesday, 9).
time_slot(tuesday, 11).
time_slot(wednesday, 9).
time_slot(wednesday, 11).
time_slot(thursday, 9).
time_slot(thursday, 11).
time_slot(friday, 9).
time_slot(friday, 11).

% Define the available instructors
instructor(john).
instructor(jane).
instructor(bob).

% Define the course schedule predicate
schedule(Course, Instructor, Day, Time) :-
    course(Course),
    instructor(Instructor),
    time_slot(Day, Time).

%schedule(cs101, Instructor, Day, Time).
