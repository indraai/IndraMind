# Variables

- `blocks ($cns)`: (adjustable) size of "central nervous system" memory in the AI
- `time ($t)`:  lifetime Ghost AI experiential time "$t"
- `timepen ($tpu)`: time-pen-ultimate before current I/O.
- `timedirect ($tdo)`: time-of-direct-object for a parser module.

- `timeknowledge ($tkb)`: time-in-knowledge-base of an idea. The EnParser() module stores time-of-verb $tvb in the k[13] $tkb slot of the subject of a sentence being stored at the time-of-subject $tsj time-point in the Psy conceptual array. The EnParser module stores $tkb as equal to $tdo (time of the direct object) in the Psy array row of the verb at time-of-verb $tvb. Thus for subjects $tkb means "verb" and for verbs $tkb means "direct object". No $tkb is stored for a direct object, because the associative tags go from subject to verb to object (SVO) but no further.

- `thinking ($isolation)`: counter of thought-cycles spent in "thinking" with no human input.

- `chrlen ($len)`: length, for avoiding input non-words. The variable increments with each additional character during AudInput, and is reset to zero at the end of InStantiate or OldConcept or NewConcept, so that the auditory engram recall vector rv may be set for the first character of a word when the word-length is a unitary one.
- `mind ($brain)`:
- `alert`: (all points bulletin) -- is a variable for displaying on-screen messages about what is happening internally in the AI Mind.
- `outputplus`:
- `preposition ($prep)`: a preposition used in the EnPrep mind-module for prepositions.
- `cycles ($rjc)`: counter of rejuvenation cycles
- `birth ($dob)`: Date of birth
- `phoneme ($pho)`: a "phoneme" or character of auditory input.
- `audconcept ($audpsi)`: concept number of word in @ear auditory memory array.
- `concpet ($psi)`: variable for an element of the @psy conceptual array, with a numeric identifier serving as an mtx tag for the same concept in another language.



Change variables
cns = blocks
t = time
tpu = timepen
isolation = thinking
len = chrlen
brain = mind
apb = alert
outputplus = outputPlus
prep = preposition
tdo = timeDirect
tkb = timeKnowledge
rjc = cycles
dob = birth

pho = phoneme
audpsi = audconcept
psi = concept

// old mind
changes "psi" variables to "indra" variables
variable psi = variable indra
variable psi20 = variable indra20
variable psibase = variable indrabase
variable actpsi = variable actindra
variable qv2psi = variable qv2indra
variable prepsi = variable preindra
variable audpsi = variable audindra // change to audConcept

variable monopsi = variable monoindra
variable newpsi = variable newindra
