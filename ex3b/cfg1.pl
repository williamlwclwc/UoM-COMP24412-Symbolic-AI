% s(Z) :-  append(X, Y, Z), np(X), vp(Y).
% np(Z) :- nn(Z).
% np(Z) :- append(X, Y, Z), dt(X), nn(Y).
% vp(Z) :- append(X, Y, Z), vbz(X), np(Y).
% nn([steel]).
% nn([alloy]).
% vbz([is]).
% dt([an]).

s(X, Z) :- np(X, Y), vp(Y, Z).
np(X, Z) :- nn(X, Z).
np(X, Z) :- dt(X, Y), nn(Y, Z).
vp(X, Z) :- vbz(X, Y), np(Y, Z).

nn([steel|W], W).
nn([alloy|W], W).
vbz([is|W], W).
dt([an|W], W).