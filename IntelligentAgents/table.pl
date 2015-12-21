%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%                             Truth Table                                     %
%                                                                             %
% Define a predicate table(+Vs, +E) that writes the truth table               %
% of the expression E and where Vs is the list of variables of E.             %
%                                                                             %
% Define the operators :                                                      %
%                                                                             %
%	~/1, ^/2, v/2, =>/2, <=/2, <=>/2 et <~>/2                             %
%                                                                             %
% which are logical operators                                                 %
%                                                                             %
%	not, and, or, implication, inv implication, equivalence and xor       %
%                                                                             %
% respectively.                                                               %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- op(900, fy, ~).
:- op(910, yfx, ^).
:- op(920, yfx, v).
:- op(930, yfx, =>).
:- op(930, yfx, <=).
:- op(930, yfx, <=>).
:- op(930, yfx, <~>).

% not
~(A) :- not(A).

% and
^(A, B) :- A, B.

% or
v(A, B) :- A ; B.

% implication
=>(A, B) :- ~A v B.

% implication inv
<=(A, B) :- A v ~B.

% equivalence
<=>(A, B) :- (A ^ B) v (~A ^ ~B).

% xor
<~>(A, B) :- ~(A <=> B).



table(VarList, Expr) :- nl, bindList(VarList), do(VarList, Expr), fail.
table(_, _) :- nl.

bind(fail).
bind(true).

bindList([]).
bindList([V|Vs]) :- bind(V), bindList(Vs).

do(VarList, Expr) :- write('  '), writeVarList(VarList),
                     write('|  '), writeExpr(Expr), nl.

writeVarList([]).
writeVarList([V|Vs]) :- write2(V), write('  '), writeVarList(Vs).

writeExpr(Expr) :- Expr, !, write2(true).
writeExpr(_) :- write2(fail).

write2(true) :- write('T').
write2(fail) :- write('F').


