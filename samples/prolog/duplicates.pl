duplicated([X|Xs], X) :- member(X, Xs).
duplicated([_|Xs], X) :- duplicated(Xs, X).
