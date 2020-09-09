permutations([], []).
permutations(Xs, [X|Ys]) :-
    select(X, Xs, Rest),
    permutations(Rest, Ys).