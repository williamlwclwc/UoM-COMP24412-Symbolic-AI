% fact: students
student(student1).
student(student2).
student(student3).
student(student4).
student(student5).
student(student6).

nonmember_of(_, []).
nonmember_of(X,[Y|Ys]) :-
    dif(X,Y),
    nonmember_of(X,Ys).

alldifferent([_]).
alldifferent([X|Y]) :-
    nonmember_of(X, Y),
    alldifferent(Y).

must_in(Student, A-B) :-
    Student = A;
    Student = B.

same_slot(Sa, Sb, [X, Y|Z]) :-
    (Sa = X, Sb = Y);
    (Sa = Y, Sb = X);
    same_slot(Sa, Sb, Z).

not_same(Sa, Sb, [X, Y]) :-
    (Sa = X, dif(Sb, Y)); 
    (Sa = Y, dif(Sb, X));
    (dif(Sa, X), dif(Sa, Y)).
not_same(Sa, Sb, [X, Y|Z]) :-
    ((Sa = X, dif(Sb, Y)); (Sa = Y, dif(Sb, X)); (dif(Sa, X), dif(Sa, Y))),
    not_same(Sa, Sb, Z).

cannot_in(Student, A-B) :-
    dif(Student, A),
    dif(Student, B).

meetings_one_two_three(A-B,C-D,E-F) :-
    % A-F are students
    student(A), student(B), student(C), 
    student(D), student(E), student(F),
    % A-F are different
    alldifferent([A, B, C, D, E, F]),
    % constraint 1
    must_in(student1, A-B),
    % constraint 2
    same_slot(student2, student3, [A, B, C, D, E, F]),
    % constraint 3
    not_same(student1, student4, [A, B, C, D, E, F]),
    % constraint 4
    cannot_in(student6, A-B),
    cannot_in(student6, E-F),
    % (optional, pairs are arbitrarily ordered to prevent multiple equivalent solutions)
    A @> B, C @> D, E @> F.

