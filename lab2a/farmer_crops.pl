:- use_module(library(clpfd)).

crops_eqs(Fields) :-
    Fields = [A, B, C, D, E, F],
    A #\= B,
    A #\= C,
    A #\= D,
    A #\= F,
    B #\= C,
    B #\= D,
    C #\= D,
    C #\= E,
    D #\= F.

crops3(Fields) :-
    Fields = [_A, _B, _C, _D, _E, _F],
    crops_eqs(Fields),
    Fields ins 0..2,
    label(Fields).

crops4(Fields) :-
    Fields = [_A, _B, _C, _D, _E, _F],
    crops_eqs(Fields),
    Fields ins 0..3,
    label(Fields).