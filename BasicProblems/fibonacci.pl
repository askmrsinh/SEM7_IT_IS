fibonacci(0, 0) :- !.
fibonacci(1, 1) :- !.
fibonacci(N, Value) :-
  A is N - 1, fibonacci(A, A1),
  B is N - 2, fibonacci(B, B1),
  Value is A1 + B1.
