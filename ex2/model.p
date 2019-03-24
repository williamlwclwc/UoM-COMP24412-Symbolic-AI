% first order logic version of model.pl

fof(1, axiom, east(raptors)).
fof(2, axiom, east(wizards)).
fof(3, axiom, east(cavaliers)).
fof(4, axiom, east(pacers)).
fof(5, axiom, east(celtics)).
fof(6, axiom, east(bucks)).
fof(7, axiom, east(seventysixers)).
fof(8, axiom, east(heat)).

fof(9, axiom, west(rockets)).
fof(10, axiom, west(timberwolves)).
fof(11, axiom, west(thunder)).
fof(12, axiom, west(jazz)).
fof(13, axiom, west(worriors)).
fof(14, axiom, west(spurs)).
fof(15, axiom, west(blazers)).
fof(16, axiom, west(pelicans)).

fof(17, axiom, ![X]:(team(X) <=> (east(X) | west(X)))).
fof(distinct, axiom, ![X]:(~(east(X) & west(X)))).
fof(distinct, axiom, $distinct(raptors, wizards, cavaliers, pacers, celtics, bucks, seventysixers, heat, rockets, timberwolves, thunder, jazz, worriors, spurs, blazers, pelicans)).

fof(18, axiom, defeat(raptors, wizards)).
fof(19, axiom, defeat(cavaliers, pacers)).
fof(20, axiom, defeat(celtics, bucks)).
fof(21, axiom, defeat(seventysixers, heat)).
fof(22, axiom, defeat(cavaliers, raptors)).
fof(23, axiom, defeat(celtics, seventysixers)).
fof(24, axiom, defeat(cavaliers, celtics)).
fof(25, axiom, defeat(rockets, timberwolves)).
fof(26, axiom, defeat(jazz, thunder)).
fof(27, axiom, defeat(worriors, spurs)).
fof(28, axiom, defeat(pelicans, blazers)).
fof(29, axiom, defeat(rockets, jazz)).
fof(30, axiom, defeat(worriors, pelicans)).
fof(31, axiom, defeat(worriors, rockets)).
fof(32, axiom, defeat(worriors, cavaliers)).

% posRankHigher
fof(33, axiom, posRankHigher(rockets, raptors)).
fof(34, axiom, posRankHigher(raptors, worriors)).
fof(35, axiom, posRankHigher(worriors, celtics)).
fof(36, axiom, posRankHigher(celtics, seventysixers)).
fof(37, axiom, posRankHigher(seventysixers, cavaliers)).
fof(38, axiom, posRankHigher(cavaliers, blazers)).
fof(39, axiom, posRankHigher(blazers, pacers)).
fof(40, axiom, posRankHigher(pacers, thunder)).
fof(41, axiom, posRankHigher(thunder, jazz)).
fof(42, axiom, posRankHigher(jazz, pelicans)).
fof(43, axiom, posRankHigher(pelicans, spurs)).
fof(44, axiom, posRankHigher(spurs, timberwolves)).
fof(45, axiom, posRankHigher(timberwolves, heat)).
fof(46, axiom, posRankHigher(heat, bucks)).
fof(47, axiom, posRankHigher(bucks, wizards)).

% recursive
fof(48, axiom, ![X, Y]:((posRankHigher(X, Y) | ?[Z]:(posRankHigher(Z, Y) & posHigher(X, Z))) => posHigher(X, Y))). 

% offRankHigher
fof(49, axiom, offRankHigher(worriors, rockets)).
fof(50, axiom, offRankHigher(rockets, pelicans)).
fof(51, axiom, offRankHigher(pelicans, raptors)).
fof(52, axiom, offRankHigher(raptors, cavaliers)).
fof(53, axiom, offRankHigher(cavaliers, seventysixers)).
fof(54, axiom, offRankHigher(seventysixers, timberwolves)).
fof(55, axiom, offRankHigher(timberwolves, thunder)).
fof(56, axiom, offRankHigher(thunder, wizards)).
fof(57, axiom, offRankHigher(wizards, bucks)).
fof(58, axiom, offRankHigher(bucks, blazers)).
fof(59, axiom, offRankHigher(blazers, pacers)).
fof(60, axiom, offRankHigher(pacers, jazz)).
fof(61, axiom, offRankHigher(jazz, celtics)).
fof(62, axiom, offRankHigher(celtics, heat)).
fof(63, axiom, offRankHigher(heat, spurs)).

% recursive
fof(64, axiom, ![X, Y]:((offRankHigher(X, Y) | ?[Z]:(offRankHigher(Z, Y) & offBetter(X, Z))) => offBetter(X, Y))). 

% defRankHigher
fof(65, axiom, defRankHigher(jazz, spurs)).
fof(66, axiom, defRankHigher(spurs, celtics)).
fof(67, axiom, defRankHigher(celtics, heat)).
fof(68, axiom, defRankHigher(heat, blazers)).
fof(69, axiom, defRankHigher(blazers, raptors)).
fof(70, axiom, defRankHigher(raptors, rockets)).
fof(71, axiom, defRankHigher(rockets, pacers)).
fof(72, axiom, defRankHigher(pacers, thunder)).
fof(73, axiom, defRankHigher(thunder, seventysixers)).
fof(74, axiom, defRankHigher(seventysixers, wizards)).
fof(75, axiom, defRankHigher(wizards, bucks)).
fof(76, axiom, defRankHigher(bucks, timberwolves)).
fof(77, axiom, defRankHigher(timberwolves, worriors)).
fof(78, axiom, defRankHigher(worriors, cavaliers)).
fof(79, axiom, defRankHigher(cavaliers, pelicans)).

% recursive
fof(80, axiom, ![X, Y]:((defRankHigher(X, Y) | ?[Z]:(defRankHigher(Z, Y) & defBetter(X, Z))) => defBetter(X, Y))). 

% intensional relations(rules)
fof(81, axiom, ![X]:(?[Y]:(team(X) & team(Y) & defeat(X, Y)) => firstRoundWinner(X))).

fof(82, axiom, ![X]:(?[Y]:(firstRoundWinner(X) & firstRoundWinner(Y) & defeat(X, Y)) => semiWinner(X))).

fof(83, axiom, ![X]:(?[Y]:(semiWinner(X) & semiWinner(Y) & defeat(X, Y)) => conferenceWinner(X))).

fof(84, axiom, ![X]:(?[Y]:(conferenceWinner(X) & conferenceWinner(Y) & defeat(X, Y)) => finalWinner(X))).

fof(85, axiom, ![X, Y]:(posHigher(X, Y) => homeAdvantage(X, Y))).

fof(86, axiom, ![X, Y]:(((east(X) & east(Y)) | (west(X) & west(Y))) & X!=Y & semiWinner(X) & semiWinner (Y) => conferenceFinal(X, Y))).

fof(87, axiom, ![X, Y]:(X!=Y & conferenceWinner(X) & conferenceWinner(Y) => nbaFinal(X, Y))).

fof(88, axiom, ![X]:(west(X) & conferenceWinner(X) => westChampion(X))).

fof(89, axiom, ![X]:(east(X) & conferenceWinner(X) => eastChampion(X))).

fof(90, axiom, ![X]:(finalWinner(X) => nbaChampion(X))).

