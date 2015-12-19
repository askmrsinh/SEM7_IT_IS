factorial(0,1).
  factorial(X,Y) :-
    X1 is X - 1,
    factorial(X1,Z),
    Y is Z*X,!.
