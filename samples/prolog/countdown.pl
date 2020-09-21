solve(Ns, Goal) :- member(Goal, Ns).
solve(Ns, Goal) :-
    select(X, Ns, R),
    select(Y, R, R2),
    (
    	Z is X + Y
    ;   Z is X - Y
    ;   Z is X * Y
    ;   Y =\= 0, 0 is mod(X, Y), Z is div(X, Y)
    ),
    solve([Z|R2], Goal).


evaluate(+, X, Y, R) :- R is X + Y.
evaluate(-, X, Y, R) :- R is X - Y.
evaluate(*, X, Y, R) :- R is X * Y.
evaluate(/, X, Y, R) :- Y =\= 0, 0 is mod(X, Y), R is div(X, Y).

value(X, X) :- number(X).
value((Op, X, Y), R) :-
    value(X, XV),
    value(Y, YV),
    evaluate(Op, XV, YV, R).

solve2(Ns, Goal, N) :-
    member(N, Ns),
    value(N, Goal).
solve2(Ns, Goal, Solution) :-
    select(X, Ns, R),
    select(Y, R, R2),
    member(Op, [+, -, *, /]),
    solve2([(Op, X, Y) | R2], Goal, Solution).
