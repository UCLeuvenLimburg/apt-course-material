duplicates([X|Xs], X) :- member(X, Xs).
duplicates([_|Xs], X) :- duplicates(Xs, X).
