:- use_module(library(clpfd)).

cows_chicken_eqs(Cows,Chicken) :-
    Cows + Chicken #= 65,
    Cows * 4 + Chicken * 2 #= 226.

cows_chicken(Cows, Chicken) :-
    cows_chicken_eqs(Cows, Chicken),
    [Cows, Chicken] ins 0..sup,
    label([Cows, Chicken]).
