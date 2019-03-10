p([],X,X). 
p([X|Xs],Ys,[X|Zs]) :-
    p(Xs,Ys,Zs).

tasklist([]). 
tasklist([X|Xs]) :- 
    tasklist(Xs). 

tasklist2([X|Xs]) :- 
    tasklist2(Xs). 
tasklist2([]).

even(X) :- X = [_|T1], T1 = [_|T2], even(T2).
%even([_,_|Tail]) :- even(Tail).
even([]).
