isa_list([]).
isa_list([_X|Xs]) :-
    isa_list(Xs).

nonmember_of(_, []).
nonmember_of(X,[Y|Ys]) :-
    dif(X,Y),
    nonmember_of(X,Ys).

% sides of the river
is_pos(south).
is_pos(north).

% opposite sides
side_opposite(X, Y) :-
   is_pos(X),
   is_pos(Y),
   dif(X, Y).

% same sides
side_same(X, Y) :-
    is_pos(X),
    is_pos(Y),
    X = Y.

% track positon
wfgc(_, _, _, _).

% check state
is_state(wfgc(A, B, C, D)) :- 
    is_pos(A),
    is_pos(B),
    is_pos(C),
    is_pos(D).

% safe state: wolf not with goat & goat not with cabbage
safestate(wfgc(Farmer, Wolf, Goat, Cabbage)) :-
    is_state(wfgc(Farmer, Wolf, Goat, Cabbage)),
    (side_opposite(Wolf, Goat); side_same(Wolf, Farmer)),
    (side_opposite(Goat, Cabbage); side_same(Goat, Farmer)).

% kinds of moves
m(alone).
m(goat).
m(cabbage).
m(wolf).

% move: from old state to new state
move(wfgc(Farmer, Wolf, Goat, Cabbage), M, wfgc(NewF, NewW, NewG, NewC)) :-
    m(M),
    ((M = alone, dif(Farmer, NewF), Wolf = NewW, Goat = NewG, Cabbage = NewC);
    (M = goat, dif(Farmer, NewF), dif(Goat, NewG), Wolf = NewW, Cabbage = NewC);
    (M = cabbage, dif(Farmer, NewF), dif(Cabbage, NewC), Wolf = NewW, Goat = NewG);
    (M = wolf, dif(Farmer, NewF), dif(Wolf, NewW), Goat = NewG, Cabbage = NewC)).

% get move results
puzzlestate_moves(wfgc(south, south, south, south), []).
puzzlestate_moves(wfgc(Farmer, Wolf, Goat, Cabbage), [M|Ms]) :-
    % Move: old state -> new state
    safestate(wfgc(Farmer, Wolf, Goat, Cabbage)),
    safestate(wfgc(OldF, OldW, OldG, OldC)),
    move(wfgc(OldF, OldW, OldG, OldC), M, wfgc(Farmer, Wolf, Goat, Cabbage)),
    puzzlestate_moves(wfgc(OldF, OldW, OldG, OldC), Ms).

% modify puzzlestate_move
puzzlestate_moves_without(wfgc(south, south, south, south), [], Visited) :-
    nonmember_of(wfgc(south,south,south,south), Visited).
puzzlestate_moves_without(wfgc(Farmer, Wolf, Goat, Cabbage), [M|Ms], Visited) :-
    % Move: old state -> new state
    safestate(wfgc(Farmer, Wolf, Goat, Cabbage)),
    safestate(wfgc(OldF, OldW, OldG, OldC)),
    move(wfgc(OldF, OldW, OldG, OldC), M, wfgc(Farmer, Wolf, Goat, Cabbage)),
    nonmember_of(wfgc(Farmer, Wolf, Goat, Cabbage), Visited),
    puzzlestate_moves_without(wfgc(OldF, OldW, OldG, OldC), Ms, [wfgc(Farmer, Wolf, Goat, Cabbage)|Visited]).


