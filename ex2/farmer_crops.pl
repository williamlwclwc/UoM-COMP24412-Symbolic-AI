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
    D #\= E,
    D #\= F,
    E #\= F.

crops3(Fields) :-
    Fields = [_A, _B, _C, _D, _E, _F],
    crops_eqs(Fields),
    Fields ins 0..2,
    label(Fields).

crops4(Fields) :-
    Fields = [A, B, C, D, _E, _F],
    crops_eqs(Fields),
    A #< B, B #< C, C #< D,
    Fields ins 0..3,
    label(Fields).