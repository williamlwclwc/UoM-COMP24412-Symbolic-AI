from nltk.ccg import chart, lexicon

lex = lexicon.fromstring('''
    :- S, N, NP
    Steel => N
    is => (S\\N)/NP
    an => NP/N
    alloy => N
    contains => (S\\N)/N
    carbon => N
    Does => NP/NP
    Ferrite => NP
    have => (S\\NP)/N
    high => N/N
    hardness => N
    Which => S/(S\\NP)/N
    material => N
    has => (S\\NP)/NP
    the => NP/N
    lowest => N/N
    tensile => N/N
    strength => N
    ''', 
    False)

parser = chart.CCGChartParser(lex, chart.DefaultRuleSet)
for parse in parser.parse("Steel is an alloy".split()):
    chart.printCCGDerivation(parse)
    break

for parse in parser.parse("Steel contains carbon".split()):
    chart.printCCGDerivation(parse)
    break

for parse in parser.parse(
    "Does Ferrite have high hardness".split()):
    chart.printCCGDerivation(parse)
    break

for parse in parser.parse(
    "Which material has the lowest tensile strength".split()):
    chart.printCCGDerivation(parse)
    break