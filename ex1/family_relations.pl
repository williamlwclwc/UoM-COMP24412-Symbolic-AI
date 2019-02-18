% X is a parent of Y
parent(X, Y) :-
    (parents(X, _, Y);
    parents(_, X, Y)).

% X is the father (a parent who is a man) of Y
father(X, Y) :-
    parent(X, Y),
    man(X).

%  X is the mother (a parent who is a woman) of Y
mother(X, Y) :- 
    parent(X, Y),
    woman(X).

% X and Y have at least one parent the same but are different people.
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    dif(X, Y).

% X is a man and a sibling of Y
brother(X, Y) :-
    man(X),
    sibling(X, Y).

%  X is a woman and a sibling of Y
sister(X, Y) :-
    woman(X),
    sibling(X, Y).

% A parent of X is a sibling of the parent of Y and X and Y are different people.
first_cousin(X, Y) :-
    parent(A, X),
    parent(B, Y),
    sibling(A, B),
    dif(X, Y).

% X is an ancestor of Y if X is Y’s parent or an ancestor of one of Y’s parents. A person should not be their own ancestor.
ancestor(X, Y) :-
    parent(X, Y);
    (parent(Z, Y), ancestor(X, Z)).

%  X is a cousin of Y if X and Y share a common ancestor. A person should not be their own cousin.
cousin(X, Y) :-
    ancestor(Z, X),
    ancestor(Z, Y),
    dif(X, Y).
