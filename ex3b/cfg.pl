s(X, Z) :- nn(X, Y), vp(Y, Z).
np(X, Z) :- nn(X, Z).
np(X, Z) :- dt(X, Y), nn(Y, Z).
vp(X, Z) :- vbz(X, Y), np(Y, Z).

nn([steel|W], W).
nn([alloy|W], W).
nn([carbon|W], W).
vbz([is|W], W).
vbz([contains|W], W).
dt([an|W], W).