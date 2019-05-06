from nltk.corpus import verbnet as vn
from nltk.corpus import framenet as fn
from nltk.corpus import propbank as pb

word1 = "melt"
word2 = "oxidize"

input = word1

vn_results = vn.classids(lemma=input)

if not vn_results:
    print (input + ' not in verbnet.')
else:
    print ('verbnet:')
    for ele in vn_results:
        print (ele)
    print("")

fn_results = fn.frames_by_lemma(input)

if not fn_results:
    print (input + ' not in framenet.')
else:
    print ('framenet:')
    for ele in fn_results:
        print (ele)
    print("")

pb_results = []
try:
    pb_results = pb.rolesets(input)
except ValueError:
    print (input + ' not in propbank.')

if pb_results:
    print ('propbank:')
    for ele in pb_results:
        print(ele)
    print("")
