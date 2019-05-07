from nltk.ccg import chart, lexicon

lex = lexicon.fromstring('''
    :- S, N, NP
    Does => S/(S\\NP)/NP {\\P Q x.(P(x) & Q(x))}
    Ferrite => NP {Ferrite}
    have => (S\\NP)/N {\\x y.has(y, x)}
    high => N/N {\\x.high(x)}
    hardness => N {hardness}
    Which => S/(S\\NP)/N {\\P Q x.(P(x) & Q(x))}
    material => N {\\x.material(x)}
    has => (S\\NP)/NP {\\x y.has(y, x)}
    the-lowest => NP/N/N {\\x y.argmin(x, y)}
    tensile => N  {tensile}
    strength => N {strength}
    ''', 
    True)

parser = chart.CCGChartParser(lex, chart.DefaultRuleSet)

for parse in parser.parse(
    "Does Ferrite have high hardness".split()):
    chart.printCCGDerivation(parse)
    break

for parse in parser.parse(
    "Which material has the-lowest tensile strength".split()):
    chart.printCCGDerivation(parse)
    break