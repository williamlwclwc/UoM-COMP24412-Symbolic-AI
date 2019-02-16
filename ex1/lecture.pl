% the three list predicates mentioned in the slides

isa_list([]).
isa_list([_X|Xs]) :-
    isa_list(Xs).

member_of(X,[X|_]).
member_of(X,[_|Xs]) :-
    member_of(X,Xs).

nonmember_of(_, []).
nonmember_of(X,[Y|Ys]) :-
    dif(X,Y),
    nonmember_of(X,Ys).

% part0

bigger_than_two([_,_|_]).

same_head([X|_],[X|_]).

same_second([_,X|_],[_,X|_]).

isa_prefix([], _).
isa_prefix([X|Y], [X|Z]) :-
    isa_prefix(Y, Z).

isa_sublist([], _).
isa_sublist([X|Y], [X|Z]) :-
    isa_sublist(Y, Z).
isa_sublist([X|Y], [_|Z]) :-
    isa_sublist([X|Y], Z).

reverse([],X,X).
reverse([X|Y],Z,W) :- 
    reverse(Y,[X|Z],W).
reverse(L,R) :-
	reverse(L,[],R).

alldifferent([X|Y]) :-
    bigger_than_two([X|Y]),
    nonmember_of(X, Y).
