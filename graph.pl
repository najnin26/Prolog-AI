% Define the graph
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(c, e).
edge(d, e).

% Define the path predicate
path(Start, End, Path) :-
    dfs(Start, End, [Start], Path).

% Define the depth-first search predicate
dfs(Node, End, Visited, Path) :-
    Node == End,
    reverse(Visited, Path).
dfs(Node, End, Visited, Path) :-
    edge(Node, Next),
    not(member(Next, Visited)),
    dfs(Next, End, [Next|Visited], Path).
