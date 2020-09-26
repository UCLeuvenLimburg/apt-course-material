operation(X, Y, R) :- R is X + Y.
operation(X, Y, R) :- X > Y, R is X - Y.
operation(X, Y, R) :- X =\= 0, Y =\= 0, R is X * Y.
operation(X, Y, R) :- Y =\= 0, 0 is mod(X, Y), R is div(X, Y).

reachable(Ns, Goal) :- member(Goal, Ns).
reachable(Ns, Goal) :-
    select(X, Ns, R),
    select(Y, R, R2),
    operation(X, Y, Z),
    reachable([Z|R2], Goal).

reachables(Ns, Goals) :-
    setof(Goal, reachable(Ns, Goal), Goals).

evaluate(+, X, Y, R) :- R is X + Y.
evaluate(-, X, Y, R) :- R is X - Y.
evaluate(*, X, Y, R) :- R is X * Y.
evaluate(/, X, Y, R) :- Y =\= 0, 0 is mod(X, Y), R is div(X, Y).

value(X, X) :- number(X).
value((Op, X, Y), R) :-
    value(X, XV),
    value(Y, YV),
    evaluate(Op, XV, YV, R).

solve(Ns, Goal, N) :-
    member(N, Ns),
    value(N, Goal).
solve(Ns, Goal, Solution) :-
    select(X, Ns, R),
    select(Y, R, R2),
    member(Op, [+, -, *, /]),
    solve([(Op, X, Y) | R2], Goal, Solution).
