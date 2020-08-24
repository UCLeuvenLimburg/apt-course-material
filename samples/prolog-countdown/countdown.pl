pick(Xs, X, Rest) :-
    member(X, Xs),
    delete(Xs, X, Rest).

solve(Ns, Goal) :- member(Goal, Ns).
solve(Ns, Goal) :-
    pick(Ns, X, R),
    pick(R, Y, R2),
    (
    	Z is X + Y
    ;   Z is X - Y
    ;   Z is X * Y
    ;   Y =\= 0, 0 is mod(X, Y), Z is div(X, Y)
    ),
    solve([Z|R2], Goal).

solve(Ns, Goal, []) :- member(Goal, Ns).
solve(Ns, Goal, [Step|History]) :-
    pick(Ns, X, R),
    pick(R, Y, R2),
    (
    	Z is X + Y, Step = add(X,Y)
    ;   Z is X - Y, Step = sub(X,Y)
    ;   Z is X * Y, Step = mul(X,Y)
    ;   Y =\= 0, 0 is mod(X, Y), Z is div(X, Y), Step=div(X,Y)
    ),
    solve([Z|R2], Goal, History).
