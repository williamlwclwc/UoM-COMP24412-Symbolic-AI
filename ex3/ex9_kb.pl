% exercise 9 prolog knowledge base
highTemperature(1535).
mediumTemperature(1000).
mediumTemperature(900).
lowTemperature(700).
highCarbon(2.0).
mediumCarbon(0.78).
lowCarbon(0.4).

liquid(X) :- highTemperature(X).
solid(X) :- mediumTemperature(X).
solid(X) :- lowTemperature(X).

ferrite(X, Y) :- mediumTemperature(X), lowCarbon(Y).
pearlite(X, Y) :- lowTemperature(X), mediumCarbon(Y).
austenite(X, Y) :- mediumTemperature(X), mediumCarbon(Y).
cementite(X, Y) :- mediumTemperature(X), highCarbon(Y).

highHardness(X) :- highCarbon(X).
mediumHardness(X) :- mediumCarbon(X).
lowHardness(X) :- lowCarbon(X).
highDuctility(X) :- lowCarbon(X).
mediumDuctility(X) :- mediumCarbon(X).
lowDuctility(X) :- highCarbon(X).
highTensileStrength(X) :- mediumCarbon(X).
mediumTensileStrength(X) :- highCarbon(X).
lowTensileStrength(X) :- lowCarbon(X).