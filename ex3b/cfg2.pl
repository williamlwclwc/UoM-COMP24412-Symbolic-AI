% s(Z) :- append(X, Y, Z), np(X), vp(Y).
% np(Z) :- nn(Z).
% vp(Z) :- append(X, Y, Z), vbz(X), np(Y).
% nn([steel]).
% nn([carbon]).
% vbz([contains]).

s(X, Z) :- np(X, Y), vp(Y, Z).
np(X, Z) :- nn(X, Z).
vp(X, Z) :- vbz(X, Y), np(Y, Z).

nn([steel|W], W).
nn([carbon|W], W).
vbz([contains|W], W).