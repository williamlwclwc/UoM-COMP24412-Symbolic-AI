% 2018 nba playoffs

east(raptors).
east(wizards).
east(cavaliers).
east(pacers).
east(celtics).
east(bucks).
east(seventysixers).
east(heat).

west(rockets).
west(timberwolves).
west(thunder).
west(jazz).
west(worriors).
west(spurs).
west(blazers).
west(pelicans).

team(X) :- east(X).
team(X) :- west(X).

defeat(raptors, wizards).
defeat(cavaliers, pacers).
defeat(celtics, bucks).
defeat(seventysixers, heat).
defeat(cavaliers, raptors).
defeat(celtics, seventysixers).
defeat(cavaliers, celtics).
defeat(rockets, timberwolves).
defeat(jazz, thunder).
defeat(worriors, spurs).
defeat(pelicans, blazers).
defeat(rockets, jazz).
defeat(worriors, pelicans).
defeat(worriors, rockets).
defeat(worriors, cavaliers).

% posRankHigher
posRankHigher(rockets, raptors).
posRankHigher(raptors, worriors).
posRankHigher(worriors, celtics).
posRankHigher(celtics, seventysixers).
posRankHigher(seventysixers, cavaliers).
posRankHigher(cavaliers, blazers).
posRankHigher(blazers, pacers).
posRankHigher(pacers, thunder).
posRankHigher(thunder, jazz).
posRankHigher(jazz, pelicans).
posRankHigher(pelicans, spurs).
posRankHigher(spurs, timberwolves).
posRankHigher(timberwolves, heat).
posRankHigher(heat, bucks).
posRankHigher(bucks, wizards).

% recursive
posHigher(X, Y) :- posRankHigher(X, Y).
posHigher(X, Y) :-
    team(X), team(Y), team(Z),
    posRankHigher(Z, Y),
    posHigher(X, Z).

% offRankHigher
offRankHigher(worriors, rockets).
offRankHigher(rockets, pelicans).
offRankHigher(pelicans, raptors).
offRankHigher(raptors, cavaliers).
offRankHigher(cavaliers, seventysixers).
offRankHigher(seventysixers, timberwolves).
offRankHigher(timberwolves, thunder).
offRankHigher(thunder, wizards).
offRankHigher(wizards, bucks).
offRankHigher(bucks, blazers).
offRankHigher(blazers, pacers).
offRankHigher(pacers, jazz).
offRankHigher(jazz, celtics).
offRankHigher(celtics, heat).
offRankHigher(heat, spurs).

% recursive
offBetter(X, Y) :- offRankHigher(X, Y).
offBetter(X, Y) :-
    team(X), team(Y), 
    offRankHigher(Z, Y), offBetter(X, Z).

% defRankHigher
defRankHigher(jazz, spurs).
defRankHigher(spurs, celtics).
defRankHigher(celtics, heat).
defRankHigher(heat, blazers).
defRankHigher(blazers, raptors).
defRankHigher(raptors, rockets).
defRankHigher(rockets, pacers).
defRankHigher(pacers, thunder).
defRankHigher(thunder, seventysixers).
defRankHigher(seventysixers, wizards).
defRankHigher(wizards, bucks).
defRankHigher(bucks, timberwolves).
defRankHigher(timberwolves, worriors).
defRankHigher(worriors, cavaliers).
defRankHigher(cavaliers, pelicans).

% recursive
defBetter(X, Y) :- defRankHigher(X, Y).
defBetter(X, Y) :-
    team(X), team(Y), 
    defRankHigher(Z, Y), defBetter(X, Z).

firstRoundWinner(X) :-
    team(X), team(Y),
    defeat(X, Y).

semiWinner(X) :-
    firstRoundWinner(X), firstRoundWinner(Y),
    defeat(X, Y).

conferenceWinner(X) :-
    semiWinner(X), semiWinner(Y),
    defeat(X, Y).

finalWinner(X) :-
    conferenceWinner(X), conferenceWinner(Y),
    defeat(X, Y).

homeAdvantage(X, Y) :-
    posHigher(X, Y).

conferenceFinal(X, Y) :-
    east(X), east(Y), dif(X, Y),
    semiWinner(X), semiWinner(Y).

conferenceFinal(X, Y) :-
    west(X), west(Y), dif(X, Y),
    semiWinner(X), semiWinner(Y).

nbaFinal(X, Y) :-
    dif(X, Y),
    conferenceWinner(X), conferenceWinner(Y).

westChampion(X) :- west(X), conferenceWinner(X).

eastChampion(X) :- east(X), conferenceWinner(X).

nbaChampion(X) :- finalWinner(X).
