/*  Mind26NOV94B  -  Amiga AI Work-in-Progress based on Fish disk #411.   */
SAY "   The program Mind.rexx is loading up the mind of Andru, the cyborg."
version = "Mind26NOV94B"
/*     In this version Mind.rexx for the first time shows a correct       */
/*  response to a query of its mundane knowledge-base ("KB").  That       */
/*  response is shown in the accompanying file "audlog26NOV94".           */
/*  However, it is not yet clear just why the correct response was        */
/*  obtained, because there may have been some residual activation        */
/*  which predisposed the Mind.rexx to select a particular response.      */
/*  In upcoming tests, it will be simple enough to remove such residual   */
/*  activations through a damping function, and then it may be clear      */
/*  whether Mind.rexx is actually thinking when it talks about its        */
/*  knowledge-base.                                                       */
/*     The "audlog26NOV94" is a direct record of the very first run in    */
/*  which Mind.rexx displayed what SEEMS to be intelligent behavior,      */
/*  that is, the retrieval of knowledge not from a database, but from     */
/*  the conceptualization of words as symbols of information.             */
/*     This first "working" version of Mind.rexx shows all the hodgepodge */
/*  code-insertions that brought the successful algorithm up and running. */
/*  Some of the search functions, while they work, make Mind.rexx slow.   */
/*  These slow functions will next be enhanced, and some pesky flaws      */
/*  remaining in the "Comparator()" function will be addressed yet again. */
/*     If Mind.rexx is truly thinking on the basis of a knowledge-base,   */
/*  then the next steps will involve coding our newly available design    */
/*  for conceptualizing negation (by inserting a negation-marker into     */
/*  the "logic" flag of verbs) and will involve the use of the            */
/*  interrogative pronoun "what?" in knowledge-base queries.  Use of the  */
/*  word "why?" will take some further work.                              */
/*     In October of 1994 we have drastically altered Mind.rexx by        */
/*  increasing from two to three its levels of internal processing:       */
/*        3.  Surface level:  The auditory memory channel;                */
/*        2.  Middle level:  Linguistic structures for language(s!);      */
/*        1.  Mindcore:  Up to 64 primitive concepts, plus learned ones.  */
/*  We optimize Mind.rexx for 64-bit 300 MHz DEC Alpha 21164 CPU chips,   */
/*  or for 64-bit machine-coding on chips of ANY manufacturer.            */
/*     In June of 1994 we have programmed Edelmanian "re-entry" into      */
/*  Mind.rexx, so that the products of thought now re-enter the rexxmind  */
/*  as food for more thought.                                             */
/*     This version discourages hardcopy printouts, but saves the state   */
/*  of the rexxmind to a set of three RAM files, which may then be        */
/*  printed out or stored on permanent media (diskette, CD-ROM, etc.).    */
/*     This version works with a companion program, "AudInPut11OCT94A",   */
/*  to find and speak an active subject, verb and direct object.          */
/*     This latest version of Mind.rexx is in the public domain and is    */
/*  being uploaded to Gramma's BBS at 206-744-1254 and to other Amiga     */
/*  bulletin board systems in the area of Seattle, Washington, USA.       */
/*     Mind.rexx may be included on any CD-ROM for any purpose.           */
/*     Internet messages about Mind.rexx may go to "mentifex@scn.org".    */
cata = 0         /*  25JUN1994:  A flag to show when catamnesis is "on".  */
dex = 0  /*  26JUN1994:  "dex" points to concepts activated for re-entry. */
dirobj = 0  /* 9NOV1994:  Initialize for use under "Language()" function. */
dsequ = 0           /*  24NOV1994:  Initialize for use in "Spreadact()".  */
dupflag = 0        /*  20JUN1994:  A dup(licate-)flag for "Sensorium()".  */
offset = "          "  /*  18APR1994:  Margin for hardcopy Field Reports. */
hvt = 0          /*  21NOV1994:  "highest valence time" for diagnostics.  */
indent = "   "          /*  18APR1994:  Indent for nested announcements.  */
inpos = 1        /*  10MAY1994:  In(put-word) pos(ition) for print-outs.  */
locdup = 0               /*  20JUN1994:  A loc(al) dup(licate) variable.  */
moval = 0     /*  18.OCT.1994:  For transfer of valences monad-to-fiber.  */
outpos = 1      /*  10MAY1994:  Out(put-word) pos(ition) for print-outs.  */
prev = 1       /*  3NOV1994:  Init a default for use in "Instantiate()".  */
skip = 0              /*  18.OCT.1994:  A trick to reduplicate "verbal".  */
tprequel = 1         /*  3NOV1994:  Initiate for use in "Instantiate()".  */
wordpos = 1   /*  4MAY1994:  Variable for word-pos(ition) in print-outs.  */
sv = 3        /*  11.OCT1994:  To prevent "arithmetic conversion error".  */
wg = ""                 /*  29JUN1994:  Initialize "wg" as not a number.  */
ydyn = 0            /*  24NOV1994:  Initialize for use in "Spreadact()".  */
SAY ""
SAY "Note:  A separate Auditory Input program should be also be running."
SAY "Do you wish to print out hardcopy diagnostics to an on-line printer?"
SAY "[y/N/] "; PULL hardcopy
IF hardcopy = "Y" | hardcopy = "R" THEN DO
  print = Open(labnote, "PRT:", 'w')
  WRITELN(labnote, offset||"Amiga system date:  "||Date())
  WRITELN(labnote, 'A'x)              /*  One linefeed (LF) for spacing.  */
  END
augend = 0     /*  5APR1994:  A value "to be increased" during a search.  */
catagram = ""  /*  28APR1994:  The engram moving down in "Catamnesis()."  */
CR = 'D'x                                 /*  Hex for a carriage-return.  */
ESC = '1B'x          /*  For use as a safe way to EXIT from the program.  */
SP = '20'x  /*      "SP(ace)"-bar to detect end of an input word-string.  */
loaf = ""     /*  We will build up auditory engram slices into a "loaf".  */
metron = 1      /*  10MAY1994:  Initialize for safety in "Catamnesis()".  */
mind = "OPEN"   /*  8APR1994:  A flag for use in "Sensorium()" function.  */
mu = 0  /*  18JUN1994:  Initialize for use in "Catamnesis()" & "Retro()". */
ok = ""     /*  18APR1994:  An okay-to-LEAVE variable for "Spreadact()".  */
onset = 1      /*  11MAR1994:  Initialize a variable to find NON-onsets.  */
os = 0             /*  26APR1994:  Initialize a variable for onset-tags.  */
p = 0; q = 0     /*  16APR1994:  Flags in fiber-node from "LCC29MAR94A".  */
panel = ""        /*  28MAR1994:  New name to replace "echo" and "ping."  */
series = ""           /*  For use in building up a recognition "series."  */
sonus = ""            /*  A sound-engram in the auditory memory channel.  */
sub = 0                         /*  2APR1994:  For use in "Selective()".  */
t = 1                  /*  Lest t = 0.  */
top = 0                 /*  7APR1994:  For use in "Predicate() function.  */
trove = ""           /*  To be the word "found" when a "series" is full.  */
pattern = ""  /*  The "pattern" resulting from a complete input "series." */
/*  Here we initialize "panel" variables as numbers or letters.           */
s="~"; a=0; b="^"; c="^"; u=0; t=0; ov=0; v=0          /*  15NOV1994rev.  */
zt = 0    /*  "zeit" (time) "zt" must be zero as a base for "onsettime".  */
SETCLIP('control', "STARTING") /*  13APR1994:  Overruling QUIT messages.  */
SETCLIP('response', "READY")  /*  31MAR1994:  Ready for AudInPut program. */

/*     11.OCT1994:  A deep-structure bootstrap sequence follows now.      */
/*  The areas of "deep structure" contain the most crucial programming    */
/*  of Mind.rexx that has yet occurred since coding began on 27JUL1993,   */
/*  because this work on deep structure involves the empirical discovery  */
/*  of extensions to the theory of mind upon which Mind.rexx is based.    */
/*  If successful, these deep-structure areas will lead to a sense of     */
/*  self on the part of the rexxmind and to the ability of Mind.rexx to   */
/*  think multi-lingually, thus attaining a skill in machine translation. */
/*     12.OCT1994:  Now it is time to write an area of code which will    */
/*  attach associative tags (within a REXX compound stem tag-panel) to    */
/*  the various deep concepts in the "monad.f" array.  After a pause for  */
/*  thought, we suggest that maybe we can get away with calling this      */
/*  area of code the "Instantiate()" function, because the attachment of  */
/*  associative tags will serve to "instantiate" various instances of     */
/*  the function of each concept as a concept.  Later on, we will hope    */
/*  that the rexxmind learns to instantiate its concepts automatically,   */
/*  but right now we must hand-code some basic concepts in order to get   */
/*  the Mind.rexx program running in the first place.                     */
/*     13.OCT1994:  Here we both initialize and explain variables to be   */
/*  used in the "Instantiate()" function.  We do not initially need so    */
/*  many tag-nodes on the "neuroblast" panel, but this "Monadic" array    */
/*  is the most powerful and crucial area of Mind.rexx, so therefore we   */
/*  choose to err on the side of over-engineering the core of the mind,   */
/*  rather than risking the absence or oblivion of an essential feature.  */
/*  The "motor" tag-node portends the intelligent control of a robot.     */
/*  The "logic" node may govern noun plurals, negation, etc.              */
/*     3NOV1994:  Throughout pertinent areas of Mind.rexx, we are setting */
/*  up a monad flag-sequence of prev-verbal-sequ so that programmers may  */
/*  more easily see the relationship of prev(ious) and (sub)sequ(ent)     */
/*  monads to the "verbal" fiber.n activated up in the "fiber-shell"  -   */
/*  the rexxmind area between the lower mindcore and the upper surface.   */
/*  We are counting on these relationships of near simultaneity to let    */
/*  knowledge bases (KB's) of mundane experience arise within Mind.rexx.  */
/*     8NOV1994:  We add linguistic "func(tion)" to the monad flag-panel  */
/*  so that the concept of self can semi-activate fiber.n nodes for both  */
/*  "I" and "me", "we" and "us", "they" and "them", etc.  Because most    */
/*  English words will not need separate forms for subject and object,    */
/*  we set the default "func(tion)" as "FREE", meaning that the given     */
/*  form of the word in the auditory memory channel is "free" to serve    */
/*  as either subject or direct object of a verb.  We anticipate possible */
/*  use of a "func(tion)" flag to indicate CONJunctions or PREPositions.  */
/*     14NOV1994:  Today we are systematically transposing "t" and "dyn"  */
/*  as flags within the "neuroblast" panel of the "monad.f.t" array, so   */
/*  that the "dyn(amism)" flag, being the first item in the flag-panel,   */
/*  can easily be changed (or "damped") while the entire remainder of     */
/*  the flag-panel is not even parsed into separate flag-values.  This    */
/*  change is meant to help create a maximum speed of Mind.rexx thinking. */

monad. = ""  /*  27.OCT.1994:  Initialize in order to test for null set.  */

neuroblast = ""/*  Tag-panel by which a concept projects associatively.   */
dyn = 0       /*  Momentary dyn(amic) valence of the "monad.f" concept.   */
super = "^"   /*  Superior concept to which an inferior concept relates.  */
equiv = "^"   /*  Equivalent concept by level or logic.                   */
lower = "^"   /*  Lower concept which a given concept can semi-activate.  */
motor = "^"   /*  Motor sequence which a monad may propose or initiate.   */
attn = "^"    /*  Attention function to focus a given sensory channel.    */
sensor = "^"  /*  A tag to activate a particular sensory memory engram.   */
logic = "^"   /*  The very seat of logic in the logicoconceptual cable.   */
prev = "^"    /*  2NOV1994:  Associativity to prev(ious) word/concept.    */
verbal = "^"  /*  Essential node contains a numeric "fiber.n" pointer.    */
sequ = "^"    /*  2NOV1994:  Flag for (sub)sequ(ent) word/concept.        */
func = "FREE" /*  8NOV1994:  Flag for linguistic grammar "func(tion)".    */

t = 1  /* 16.OCT1994:  SOME value of "t" may be needed for Instantiate(). */
f=1; monad.f. = "self"     /*  13.OCT1994:  "I" outgoing; "me" incoming.  */
dyn = 1  /* 16NOV1994:  Let the self-concept have some built-in dynamism. */
verbal = 65         /*  27.OCT1994:  Specific tie-in to fiber.n for "I".  */
sequ = 10   /*  2NOV1994:  Hardcode association of "I" (self) with "am".  */
CALL Instantiate()

f=2; monad.f. = "Andru"
verbal = 67     /*  13.OCT1994:  Specific tie-in to fiber.n for "Andru".  */
CALL Instantiate()

f=3; monad.f. = "we"  /*  This mixed concept may prove difficult to use.  */
verbal = 71        /*  13.OCT1994:  Specific tie-in to fiber.n for "we".  */
CALL Instantiate()

f=9; monad.f. = "be"  /*  27.OCT.1994:  New octave for 64-bit Alpha CPU.  */

f=10; monad.f. = "am" /*  27.OCT.1994:  Part of second of eight octaves.  */
prev = 1     /*  4NOV1994:  Typical prev(ious) subject "I" of verb "am".  */
verbal = 66        /*  13.OCT1994:  Specific tie-in to fiber.n for "am".  */
sequ = 2  /*  4NOV1994:  As in, "I (1) am (66) Andru" (2).  */
CALL Instantiate()

f=17; monad.f. = "think"  /*  27.OCT.1994:  Octave "action - think/will". */

f=18; monad.f. = "know"
verbal = 69      /*  13.OCT1994:  Specific tie-in to fiber.n for "know".  */
CALL Instantiate()

f=19; monad.f. = "understand"

f=20; monad.f. = "grok"  /*  27.OCT.1994:  Heinlein's "Stranger..." term. */

f=25; monad.f. = "do"
f=26; monad.f. = "smell"
f=27; monad.f. = "taste"
f=28; monad.f. = "feel"

f=29; monad.f. = "hear"
verbal = 72      /*  13.OCT1994:  Specific tie-in to fiber.n for "hear".  */
CALL Instantiate()

f=30; monad.f. = "see"

f=33; monad.f. = "other"
f=34; monad.f. = "person"

f=35; monad.f. = "you"  /* 15.OCT1994:  That is, "other" being addressed. */
verbal = 68       /*  13.OCT1994:  Specific tie-in to fiber.n for "you".  */
sequ = 18       /*  4NOV1994:  Bootstrap "you" leads to "know" (f = 18).  */
CALL Instantiate()

f=40; monad.f. = "something"
verbal = 73  /*  27.OCT1994:  Specific tie-in to fiber.n for "something". */
CALL Instantiate()

f=41; monad.f. = "what"    /*  24NOV1994:  For query of knowledge-bases.  */
verbal = 74       /*  24NOV1994:  Specific tie-in to fiber.n for "what".  */
func = "MODE"      /*  24NOV1994:  "what" may change "mode" of sentence.  */
CALL Instantiate()

f=45; monad.f. = "space"
f=46; monad.f. = "where"   /*  24NOV1994.  */
f=47; monad.f. = "time"
f=48; monad.f. = "when"    /*  24NOV1994.  */
f=49; monad.f. = "logic"

f=57; monad.f. = "idea"

f=64; monad.f. = "why"    /*  24NOV1994:  Ultimate idea; fittingly last.  */

/*     27.OCT1994:  Verbal concept-fiber bootstrap sequence begins here.  */
/*  We are now having the "fiber.n" array start at "n = 65" in order to   */
/*  reserve the values below sixty-five for special non-verbal, perhaps   */
/*  even ineffable concepts in the deep structure of the "vault" of the   */
/*  mind.  In the array "monad.f", the letter "f" adumbrates the stem of  */
/*  the gradually converging "fiber.n" array of verbal concepts.          */
/*     The idea here is that above an arbitrary level (27.OCT.1994:  64)  */
/*  we will let the range of general concepts be co-extensive with their  */
/*  names in natural language, basing our decision on the assumption      */
/*  that only a central core of utterly fundamental concepts in the deep  */
/*  structure of the mind must be held inviolate and sequestered from     */
/*  one-to-one mappings between "idea-concepts" and their various verbal  */
/*  concepts in the natural languages spoken by the mental organism.      */

n=65; fiber.n. = "I"
v = 0     /*  15.OCT1994:  Await activation before valence exceeds zero.  */
g = "NOUN"    /*  4JUL1994:  Category valid until we introduce pronouns.  */
fin = 35    /*  27.OCT1994:  monad.35 is "you" in the octave of "other".  */
fex = 1      /*  15.OCT1994:  monad.1 is "self" during outgoing thought.  */
rv = 1   /*  6APR1994:  The r(ecall-)v(ector) within the time-bootstrap.  */
t = 1  /*  15NOV1994:  Transposed with "v" for ease of PARSE remainders.  */
prevg = ""   /*  6APR1994:  A precaution against override in "Attach()".  */
CALL Attach()

n=66; fiber.n. = "am"    /*  10.OCT1994:  A drastic change begins today.  */
v = 0
g = "PRED"      /*  10.OCT1994:  Set the g(rammar) category as "PRED".    */
fin = 9        /*  27.OCT1994:  monad.9 is "be", the infinitive of "am".  */
fex = 10     /*  27.OCT1994:  monad.10 is "am", but "9" may belong here.  */
rv = 3 /*  10.OCT1994:  The r(ecall-)v(ector) within the time-bootstrap.  */
t = 3    /*  10.OCT1994:  The new time-point where the word "am" begins.  */
prevg = ""   /*  6APR1994:  A precaution against override in "Attach()".  */
CALL Attach()

n=67; fiber.n. = "Andru"      /*  10.OCT1994:  The name of this AI mind.  */
v = 0
g = "NOUN"
fin = 1      /*  15.OCT1994:  Here we risk hardcoding "Andru" to "self".  */
fex = 2  /* 15.OCT1994:  monad.2 is specifically "Andru", not "self".     */
rv = 6
t = 6
prevg = ""              /*  A precaution against override in "Attach()".  */
CALL Attach()

n=68; fiber.n. = "you"  /*  10.OCT1994:  For polarity of self and other.  */
v = 0
g = "NOUN"
fin = 1     /*  15.OCT1994:  monad.1 is "self", even addressed as "you".  */
fex = 35  /*  27.OCT1994:  Difficult decision, .35 "you" or .33 "other"?  */
rv = 12
t = 12
prevg = ""
CALL Attach()

n=69; fiber.n. = "know"   /*  10.OCT1994:  A primitive function of mind.  */
v = 0
g = "PRED" /*  10.OCT1994:  Set the g(rammar) category as "PRED(ICATE)".  */
fin = 18  /*  27.OCT1994:  monad.18 is "know".  */
fex = 18  /*  27.OCT1994:  Let fin and fex both be monad.18 for now.  */
rv = 16  /* 10.OCT1994:  The r(ecall-)v(ector) within the time-bootstrap. */
t = 16
prevg = ""   /*  6APR1994:  A precaution against override in "Attach()".  */
CALL Attach()

n=70; fiber.n. = "me"  /* 10.OCT1994:  Important form of the pronoun "I". */
v = 0
g = "NOUN"
fin = 35  /*  15.OCT1994:  Incoming "me" activates "you" in the mindcore. */
/*     8NOV1994:  Here is a radical change to the Mind.rexx source code.  */
/*  If these linguistic calls to "Instantiate()" work as planned, they    */
/*  may warrant being adopted directly within the "Attach()" function,    */
/*  and being discontinued within "Newconcept()" and "Oldconcept()".      */
/*     8NOV1994:  For now, we instantiate only the outgoing "fex" monad.  */
fex = 1  /*  3NOV1994:  Outgoing "fex" should refer to "self" or to "me". */
f = fex  /*  8NOV1994:  Outgoing "me" refers to the concept of self.      */
rv = 21
t = 21
prev = 18        /*  8NOV1994:  Prev(ious) concept is ("f = 18") "know".  */
verbal = n  /*  8NOV1994:  Link the "self" monad to outgoing "me" fiber.  */
func = "DOBJ"    /*  8NOV1994:  Major changes elsewhere serve this line.  */
CALL Instantiate()
prevg = ""
CALL Attach()

n=71; fiber.n. = "we"   /* 10.OCT1994:  Combines monads "self" & "other". */
v = 0
g = "NOUN"
fin = 35  /*  15.OCT1994:  Perhaps two "you"'s, or a "you" and "self".    */
fex = 1   /*  15.OCT1994:  monad.1 "self" plus some concomitance.         */
rv = 24
t = 24
prevg = ""
CALL Attach()

n=72; fiber.n. = "hear"   /* 10.OCT1994:  Andru "hears" through keyboard. */
v = 0
g = "PRED"
fin = 29  /*  27.OCT1994:  monad.29 is the verb "hear".  */
fex = 29
rv = 27
t = 27
prevg = ""
CALL Attach()

n=73; fiber.n. = "something"  /* 10.OCT1994:  Catch-all element: "other". */
v = 0
g = "NOUN"
fin = 40  /*  27.OCT1994:  monad.40 is "something".  */
fex = 40
rv = 32
t = 32
prevg = ""
CALL Attach()

n=74; fiber.n. = "what"  /*  24NOV1994:  Needed for knowledge-base query. */
v = 0
g = "NOUN"
fin = 41  /*  24NOV1994:  monad.41 is "what".  */
fex = 41
rv = 42
t = 42
prevg = ""
CALL Attach()

n=75    /* 10.OCT1994:  Prepare for new concept "fiber.n" to be assigned. */
mt = n      /*  4.OCT.1994:  A safeguard against undeclared "move-tags".  */
nmax = n  /*  25JUN1994:  A record of the maximum value attained by "n",  */
/*  to be assigned in "Newconcept()" and to be used in "Minddump()".      */
prevg = "PRED"  /*  10.OCT1994:  Here we set "previous grammar category"  */
/*  as "predicate" in order to favor the initial input of a NOUN-class    */
/*  word from a human user during the "Audition()" function.  */

/*     An auditory-memory alphabet-positional quasi-phoneme needs a panel */
/*  of flags attached to it, that is, a sequence of associative tag-ends. */
/*  Therefore in "ph || panel", the "panel" portion contains such things  */
/*  as "a" the activation level;                                          */
/*     "b" the "beginning" or onset-tag;  [new designation on 8MAR1994]   */
/*     "c" the continuation-marker;                                       */
/*     "u" the concept-fiber "u(ltimate-tag)" at the end of stored words; */
/*     "s" the s(ource) flag ("@" for external; "+" for internal).        */

/*  time bootstrap  */

/*     If anywhere, this time-bootstrap is the area where we Amiga REXX   */
/*  programmers "play God" with the artificial mind, because we are       */
/*  leading the rexxmind to believe that it has a past history of mental  */
/*  experience.  Such a pseudo-past is necessary so that rabid REXXists   */
/*  may run the AI program and observe its internal workings.  However,   */
/*  it will be easy to code a procedure that stores the mental data of    */
/*  a Mind.rexx session (mental life-span, if you will) and permits the   */
/*  pre-loading of a prior mindset, as when a human awakens from sleep.   */
/*     If you have the facilities for mastering Amiga (or ISO 9660) CD-   */
/*  ROMs, please consider the possibility of a "Mind on CD-ROM."          */
/*     If you offer a Mosaic home page on the World Wide Web, please      */
/*  consider providing information about Mind.rexx in the public domain.  */

t = 1; audmem = "I"    /*  24NOV1994:  "audmem" here may be superfluous.  */
ph = "I"
a = 0  /*  15NOV1994:  For the sake of "Audpanel()".  */
b = "Y"
c = "N"
u = 65      /*  27.OCT.1994:  New ultimate-tag for new numbering scheme.  */
s = "~"   /*  28JUN1994:  Set once here; then a default in "Audpanel()".  */
CALL Audpanel()
ph.t = ph || panel  /*  24NOV1994:  Belongs perhaps WITHIN "Audpanel()".  */

t = 2; audmem = " "
ph = '20'x
CALL Audpanel
ph.t = ph || panel

t = 3; audmem = "A"   /*  10.OCT1994:  Drastic change in time-bootstrap.  */
ph = "A"
b = "Y"
c = "Y"         /*  10.OCT1994:  Set the c(ontinuation-flag) to "Y"(es).  */
CALL Audpanel()
ph.t = ph || panel

t = 4; audmem = "M"
ph = "M"
b = "N"
c = "N"  /*  10.OCT1994:  "N"(o) "c"(ontinuation); end of the word "am".  */
u = 66  /*  10.OCT1994:  Ultimate-tag points to concept #2, "am".        */
CALL Audpanel()
ph.t = ph || panel

t = 5; audmem = ""
ph = '20'x
CALL Audpanel()
ph.t = ph || panel

t = 6; audmem = "A"
ph = "A"
b = "Y"     /*  "Y"(es), the "b"(eginning) of a word in auditory memory.  */
c = "Y"     /*  "Y"(es), "c"(ontinuation) beyond this initial letter.     */
CALL Audpanel()
ph.t = ph || panel

t = 7; audmem = "N"
ph = "N"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 8; audmem = "D"
ph = "D"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 9; audmem = "R"
ph = "R"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 10; audmem = "U"
ph = "U"
b = "N"
c = "N"
u = 67 /* 10.OCT1994:  The ultimate-tag points to concept #67, "Andru".  */
CALL Audpanel()
ph.t = ph || panel

t = 11; audmem = " "
ph = '20'x
CALL Audpanel()
ph.t = ph || panel

t = 12; audmem = "Y"
ph = "Y"
b = "Y"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 13; audmem = "O"
ph = "O"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 14; audmem = "U"
ph = "U"
b = "N"
c = "N"
u = 68   /* 10.OCT1994:  The ultimate-tag points to concept #68, "you".  */
CALL Audpanel()
ph.t = ph || panel

t = 15; audmem = " "
ph = '20'x
CALL Audpanel()
ph.t = ph || panel

t = 16; audmem = "K"
ph = "K"
b = "Y"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 17; audmem = "N"
ph = "N"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 18; audmem = "O"
ph = "O"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 19; audmem = "W"
ph = "W"
b = "N"
c = "N"
u = 69  /* 27.OCT1994:  The ultimate-tag points to concept #69, "know".  */
CALL Audpanel()
ph.t = ph || panel

t = 20; audmem = " "
ph = '20'x
CALL Audpanel()
ph.t = ph || panel

t = 21; audmem = "M"
ph = "M"
b = "Y"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 22; audmem = "E"
ph = "E"
b = "N"
c = "N"
u = 70   /*  10.OCT1994:  The ultimate-tag points to concept #70, "me".  */
CALL Audpanel()
ph.t = ph || panel

t = 23; audmem = " "
ph = '20'x
CALL Audpanel()
ph.t = ph || panel

t = 24; audmem = "W"
ph = "W"
b = "Y"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 25; audmem = "E"
ph = "E"
b = "N"
c = "N"
u = 71   /*  10.OCT1994:  The ultimate-tag points to concept #71, "we".  */
CALL Audpanel()
ph.t = ph || panel

t = 26; audmem = " "
ph = '20'x
CALL Audpanel()
ph.t = ph || panel

t = 27; audmem = "H"
ph = "H"
b = "Y"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 28; audmem = "E"
ph = "E"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 29; audmem = "A"
ph = "A"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 30; audmem = "R"
ph = "R"
b = "N"
c = "N"
u = 72  /*  27.OCT1994:  The ultimate-tag points to concept #72, "hear".  */
CALL Audpanel()
ph.t = ph || panel

t = 31; audmem = " "
ph = '20'x
CALL Audpanel()
ph.t = ph || panel

t = 32; audmem = "S"
ph = "S"
b = "Y"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 33; audmem = "O"
ph = "O"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 34; audmem = "M"
ph = "M"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 35; audmem = "E"
ph = "E"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 36; audmem = "T"
ph = "T"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 37; audmem = "H"
ph = "H"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 38; audmem = "I"
ph = "I"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 39; audmem = "N"
ph = "N"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 40; audmem = "G"
ph = "G"
b = "N"
c = "N"
u = 73 /*  27.OCT1994:  Ultimate-tag points to concept #73, "something".  */
CALL Audpanel()
ph.t = ph || panel

t = 41; audmem = " "
ph = '20'x
CALL Audpanel
ph.t = ph || panel

t = 42; audmem = "W"
ph = "W"
b = "Y"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 43; audmem = "H"
ph = "H"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 44; audmem = "A"
ph = "A"
b = "N"
c = "Y"
CALL Audpanel()
ph.t = ph || panel

t = 45; audmem = "T"
ph = "T"
b = "N"
c = "N"
u = 74  /*  24NOV1994:  Ultimate-tag points to lexicon item #74, "what".  */
CALL Audpanel()
ph.t = ph || panel

t = 46; audmem = " "
ph = '20'x
CALL Audpanel()
ph.t = ph || panel

blankt = 46
t = 47   /*  21NOV1994:  So that "blankt" will be BEFORE any onset-time.  */

DO tbs = 1 TO 41      /*  21NOV1994:  t(ime of )b(oot)s(trap) = 1 to 41.  */
  SAY "ph.tbs =" ph.tbs
  END
SAY ""
SAY "Project Mentifex presents Mind.rexx for artificial intelligence."
SAY ""

/*     9NOV1994:  Today we are using a temporary flag "parse" to prime    */
/*  Mind.rexx to expect the input of a noun as the subject of a sentence. */
/*  Soon we must code within Mind.rexx a proper ability truly to parse    */
/*  incoming sentences, whereas since 27JUL1993 we have concentrated on   */
/*  creating the arrays of concepts to be controlled and manipulated by   */
/*  the overarching linguistic structures.                                */

parse = "ready"   /*  9NOV1994:  "Language()" expects a noun as subject.  */

/*  Main Body - the "Mindgrid" corresponding to the neuronal sheet.       */
DO FOREVER
/*     4.OCT.1994:  We now establish a time variable "shorttermt" to      */
/*  preserve the value of time "t" before new auditory input comes in     */
/*  and causes high valence levels on simultaneously active concepts.     */
/*  The new variable "shorttermt" will be used within the "Fiberdamp()"   */
/*  function to wipe out valence levels previous to current thought.      */

shorttermt = t

IF GETCLIP('control') ~= "THINKING" THEN CALL Sensorium()
/*     8APR1994:  The next few lines of executable code assume that       */
/*  a "COGITATE" command has been sent via Clip List to Mind.rexx,        */
/*  which has responded by setting the "control" clip to "THINKING".      */
/*  During the "THINKING" period, Mind.rexx will spend one moment "t"     */
/*  of time in identifying the most active concept, letting concept-      */
/*  activation spread, and invoking a syntactic language-structure.       */
/*     24NOV1994:  Here we are removing a call to "Associative()",        */
/*  because we want "Language()" to have a tighter control over the       */
/*  spreading activation among concepts in a knowledge-base ("KB").       */
IF GETCLIP('control') = "THINKING" THEN CALL Language()
IF GETCLIP('control') = "THINKING" THEN CALL Emotion()
IF GETCLIP('control') = "THINKING" THEN CALL Volition()
IF GETCLIP('control') = "THINKING" THEN CALL Motorium()
SAY "Now at bottom of Main Body."     /*  16JUN1994:  Lest program hang.  */
t = t + 1    /*  29JUN1994:  For a gap between re-entry and human input.  */
END
EXIT

/*  Audpanel() strings together "panel", then blanks values.              */
Audpanel:
panel = "."|| a ||"."|| b ||"."|| c ||"."|| u ||"."|| s
a = 0; b = " "; c = " "; u = 0; s = "~"
RETURN                         /*  ...to the area of the time-bootstrap.  */

Sensorium:
DO WHILE mind = "OPEN"         /*  8APR1994:  A flag paired with "SHUT".  */
  SAY ""
  cand = ""            /*  8MAR1994:  A clean slate as a safety measure.  */
  IF GETCLIP('control') ~= "RE-ENTRY" THEN SETCLIP('response', "READY")
  IF GETCLIP('control') ~= "RE-ENTRY" THEN CALL Audition()
  /*  25MAY1994:  During "re-entry", we will send in a fetched word as    */
  /*  one letter (audmem) at a time, coming from "Catamnesis()".          */
  cand = audmem   /*  25MAY1994:  today we drop the "t" from "audmem.t".  */
  audmem = ""  /*  25MAY1994:  A re-set attempting to locate a bug.  */
  /*  15JUN1994:  Below we are insisting on only MIXED datadatype.        */
  IF cand ~= "" & DataType(cand, mixed) THEN series = series || cand
  SAY "  Sensorium():  Input series =" series "of length" Length(series)"."
  /*  31MAR1994:  Next executable line saves onset-tags of new patterns.  */
  /*  23JUN1994:  "seriest" turns into "rv" in "Newconcept()".            */
  /*  25JUN1994:  Use DataType to reject space "SP" as a series.          */
  IF Length(series) = 1 & DataType(series, Mixed) THEN seriest = t
  ov = seriest  /*  24JUN1994:  Here we declare the onset-vector "ov"     */
  /*  which will be needed in "Newconcept()" and in "Oldconcept()".       */
  /*     25JUN1994:  A trap for multiple single units of series.          */
  IF Length(series) = 1 & seriest > ovhold THEN ov = ovhold
  /*  26JUN1994:  "ovhold" can also be set in re-entry, "Catamnesis()".   */
  ovhold = ov  /*  25JUN1994:  Hold the onset-vector in reserve.  */
  IF cata = 1 THEN ov = ovnew   /*  28JUN1994:  Re-entry forces this ov.  */
  pattern = series
  SAY "  Sensorium():  Pattern =" pattern
  /*  11MAY1994:  The next line of executable code is a way to obtain     */
  /*  an imp(rimend) that won't turn to nothing before the print-out.     */
  IF pattern ~= "" THEN imp = pattern
  IF cand = "" THEN series = ""
  IF cand = "" THEN trove = loaf
  IF cand = SP & cata = 1 THEN trove = loaf  /*  28JUN1994:  A test.  */
  IF cand = "" THEN loaf = ""
  /*  25MAR1994:  "Retro()" in turn will call a "Newconcept()" function.  */
  IF cand = SP | cand = "SP"  THEN CALL Retro() /*  To set ultimate tag.  */
  IF trove = pattern & trove ~= "" THEN DO                 /*  5MAY1994.  */
    SAY "    Sensorium():  Pattern = "pattern" (matches) trove = "trove"."
    END
  IF trove = pattern & trove ~= "" THEN CALL Wordend() /* Overaa p. 188.  */
  IF cand ~= SP THEN CALL Comparator()
  IF series = loaf & loaf > "" THEN SAY "    Sensorium(): ",
   "Match of" series "and" loaf"; waiting for next key-press."
  t = t + 1      /*  21NOV1994:  Today we remove "savet" from this line.  */
  SETCLIP('synch', t)  /*  1APR1994:  Transmit time to companion program. */
  /*  25MAY1994:  The next line is in coordination with "Catamnesis()".   */
  IF GETCLIP('control') = "RE-ENTRY" THEN mind = "SHUT"
  END
RETURN     /*  8APR1994:  Return to the newly designated Main Body area.  */

Audition:
  IF prevg = "NOUN" THEN otherg = "verb"
  IF prevg = "PRED" THEN otherg = "noun"
  SAY "    Audition():  Time =" t".  After" prevg", now seeking a" otherg"."
  audmem = GETCLIP('message')
  s = "<"   /*  22NOV1994:  For external input; ">" for internal recall.  */
  spark = 0       /*  23NOV1994:  "spark" boosts ego in "Associative()".  */
  answer = SETCLIP('response', "WAIT")   /*  Pair this message w. other.  */
  /*  2APR1994:  The next two lines introduce a Clip List "control" item. */
  IF GETCLIP('control') = "QUIT" | audmem = ESC THEN DO
      SETCLIP('control',"RESET")  /* So as not to leave "QUIT" operative. */
      SETCLIP('response', "STOP")    /*  1NOV1994:  Stops "AudInPut...".  */
      SETCLIP('control', "ALLCLEAR")    /*  1NOV1994:  Rempoves "RESET".  */
      SAY "Do you wish to store mindlog files in RAM before shutdown?"
      SAY "(y/N) "; PULL logdisp  /* 20APR1994:  log-disposition. */
      IF logdisp = "Y" THEN CALL Minddump()
      SAY "Shutting down Mind.rexx program."
      SAY "Enter  if you wish to Halt-Interrupt any other REXX program."
      EXIT
      END
  IF GETCLIP('control') = "COGITATE" THEN DO
      SAY "    Audition():  Switching to THINKING mode...."
      mind = "SHUT"  /*  8APR1994:  Shift attention to internal thought.  */
      SETCLIP('control', "THINKING")
      END
  IF audmem = ESC THEN SAY "Obeying escape message...."
  IF audmem = ESC THEN SETCLIP('response', "READY")       /*  1APR1994.  */
  IF audmem = ESC THEN DO
     SAY "Terminating Mind.rexx program."
     EXIT
     END
  /*  Below, if entry was below "A", convert the entry to a space bar.    */
  IF audmem < '41'x THEN audmem = '20'x
  IF audmem > '7A'x THEN audmem = '20'x               /*  Space bar.  */
  UPPER audmem
  /*  29APR1994:  We now introduce some tests of auditory input in order  */
  /*  to detect a long sequence of unaltered (or lacking) input from a    */
  /*  human user.  After an arbitrary sequence of duplicates ("dup"),     */
  /*  this test will permit Mind.rexx to divert its attention away from   */
  /*  the human user and to concentrate instead on internal thought.      */
  IF flip = audmem THEN dup = dup + 1
  IF flip ~= audmem THEN dup = 0
  IF dup > 3 THEN DO
     SAY "      Audition():  No new human input for" dup "times in a row."
     END
  IF dup > 6 THEN DO       /*  Feel free to change this arbitrary value.  */
     SETCLIP('control', "THINKING")  /*  "ATTENTIVE" after "Language()".  */
     mind = "SHUT"    /*  To be set "OPEN" again at end of "Language()".  */
     END
  IF dup > 30 THEN DO
     SAY "      Audition():  Now boosting the ego-concept to assert itself."
     spark = 1    /*  23NOV1994:  Impetus for egoism in "Associative()".  */
     END
  flip = audmem    /*  29APR1994:  So that we can test on next iteration. */
  RETURN  /*  8APR1994:  to the newly designated "Sensorium()" function.  */

/*     20APR1994:  Minddump() will open files in RAM to save the state    */
/*  of the artificial mind for various purposes, such as:                 */
/*        - resumption of an interrupted Mind.rexx session;               */
/*        - telecommunication of mindsets as loadable files;              */
/*        - diagnostic study of the internal function of Mind.rexx;       */
/*        - creation of special mindsets:                                 */
/*             - expert systems;                                          */
/*             - foreign-language versions of Mind.rexx;                  */
/*        - storage of mindsets on CD-ROM or other media;                 */
/*        - linkage of Mind.rexx to "Cyc" or other knowledge bases.       */
/*     21APR1994:  For purposes of reloading mindsets, we will perhaps    */
/*  use a special delimiting character to indicate the end of the         */
/*  mindlog header and the beginning of the actual mindlog data.          */
/*     18OCT1994:  Today we are switching to "thinklog" as the name of    */
/*  the file which records the contents of the "fiber.n" array, because   */
/*  the name "mindlog" should now refer to the contents of the mindcore.  */
Minddump:
  SAY "Minddump():  Storing file of mindlog in RAM...."
  psisave = Open(psilog, "RAM:mindlog", 'w')
  WRITELN(psilog, "mindlog file made by "||version)
  WRITELN(psilog, "f.monad.dyn.super.equiv.lower.motor.attn.")
  WRITELN(psilog, "sensor.logic.prev.verbal.sequ.func.time")
  WRITELN(psilog, "---------------------------------")
  WRITELN(psilog, "f.monad.d.s.e.l.m.a.s.l.p.v.s.f.t")
  WRITELN(psilog, "---------------------------------")
  ffinal = n    /*  18.OCT.1994:  Assume equality of "f" and "n".  */
  articulo = t
    DO f = 1 TO ffinal
    IF monad.f.1 == "" & f < 65 THEN ITERATE   /*  27.OCT.1994.  */
      DO mdt = 1 TO articulo
    IF monad.f.mdt ~= "" THEN WRITELN(psilog, f||'.'||monad.f.mdt)
      END
    END
  f = ffinal + 1
  SAY "Minddump():  Creating file of thinklog in RAM...."
  memoir = Open(nouslog, "RAM:thinklog", 'w')
  WRITELN(nouslog, "thinklog file made by "||version)
  WRITELN(nouslog, "n = number of the concept as fiber.n;")
  WRITELN(nouslog, "$ - hidden string of the concept name;")
  WRITELN(nouslog, "v = momentary valence of the concept;")
  WRITELN(nouslog, "g = grammar category ruled by syntax;")
  WRITELN(nouslog, "i = inbound association to mindcore;")
  WRITELN(nouslog, "e = exiting association from mindcore;")
  WRITELN(nouslog, "r = recall-vector to auditory engram;")
  WRITELN(nouslog, "t = time point of node on the fiber.n.")
  WRITELN(nouslog, "--------------------------------------")
  WRITELN(nouslog, "n.$.v.gcat.i.e.r.t = template of flags")
  WRITELN(nouslog, "--------------------------------------")
  nfinal = n     /*  Preserve n, in case rexxmind resumption is allowed.  */
  /*  11OCT1994:  It may not matter whether "n" starts at "1" or "101".   */
  /*  25JUN1994:  "nmax" is a precautionary value from "Newconcept()".    */
  IF n < 1 THEN nfinal = nmax
  articulo = t  /*  "In articulo mortis" (Latin) "on the point of death". */
 /*14.OCT.1994:  For now, the following is a clumsy way to extract data.  */
    DO n = 65 TO nfinal    /*  25JUN1994:  Zero, in case an error lurks.  */
      DO fdt = 1 TO articulo
    IF Left(fiber.n.fdt,6) ~= "FIBER." THEN SAY "fiber.n.fdt =" fiber.n.fdt
IF Left(fiber.n.fdt,6) ~= "FIBER." THEN WRITELN(nouslog, n||'.'||fiber.n.fdt)
      END
    END
  n = nfinal + 1  /*  18.OCT.1994:  An attempt at a true restore of "n".  */
  SAY ""
  SAY "Minddump():  Creating file of audlog in RAM...."
  phonolog = Open(otolog, "RAM:audlog", 'w')
  WRITELN(otolog, "audlog file of "||version)
  WRITELN(otolog, "f = the quasi-phoneme ph.t;")
  WRITELN(otolog, "a = a(ctivation) level;")
  WRITELN(otolog, "b = b(eginning) or onset-tag;")
  WRITELN(otolog, "c = c(ontinuation)-marker;")
  WRITELN(otolog, "u = u(ltimate-tag);")
  WRITELN(otolog, "s = source:  @ external, + internal.")
  WRITELN(otolog, "----------------------")
  WRITELN(otolog, "f.a.b.c.u.s = template")
  WRITELN(otolog, "----------------------")
    olt = 1
    DO UNTIL olt = articulo
    SAY "ph.olt = " ph.olt
    IF ph.olt > "" THEN WRITELN(otolog, ph.olt)
    IF ph.olt = "" THEN SAY " ."olt
    IF ph.olt = "" THEN WRITELN(otolog, " ."||olt)
    olt = olt + 1
    END
RETURN                              /*  ...to the "Audition()" function.  */


/*     16NOV1994:  Here we plan to write code for a function that will    */
/*  load up the previously saved state of a mind, so that that mind may   */
/*  resume thinking and acting from the point at which its previous       */
/*  operation was halted.  Because this process permits a mind to be      */
/*  loaded into a different computer far away in space or time, and       */
/*  since what was saved as a single mind can be loaded into many hosts,  */
/*  this process deserves the deeply philosophic nomenclature used here.  */
Metempsychosis:
RETURN   /*  16NOV1994:  to normal program flow after loading a mindset.  */

/*  Retro() will go back and change the "c(ontinuation)" flag at t-1.     */
/*     21MAR1994:  When an old word is recognized, "Retro()" moves the    */
/*  old ultimate-tag forwards and re-affirms it in the present engram.    */
/*  If a new word is not recognized, "Retro()" assigns to it a new        */
/*  ultimate-tag referring to a new concept-fiber in abstract memory.     */
/*     25MAR1994:  "Retro()" now calls a "Newconcept()" function,         */
/*  because a group of things must happen when a new concept is formed.   */
/*  The onset-tag (recall-vector) of the new word must be transmitted to  */
/*  the flag-panel of the new concept-fiber, and the flag of the          */
/*  ultimate-tag of the new word must be set to refer to the new concept. */
Retro:        /*  Called from "Sensorium()" when (incoming) "cand = SP".  */
onsettime = 0
blankt = t  /*  21NOV1994:  Keep t(ime) of a space-bar (pre-word) input.  */
/*  13NOV1994:  We are changing variables for "t(ime)" so that time goes  */
/*  only forward in Mind.rexx, and never backwards, as advised by S.B.R.  */
/*     "blankt" is declared initially at the end of the time-bootstrap,   */
/*  and it is used in "Comparator()" to identify non-onsets of words.     */
tult = t - 1  /*  13NOV1994:  t(ime-)ult(imate) before the present.  */
PARSE VAR ph.tult ph "." penult
PARSE VAR penult a '.' b '.' c '.' nf '.' s '.' usw
newpenult = "."||a||"."||b||"."||"N"||"."||mt||"."||s
/*  25JUN1994:  move-tag "mt" comes from either "Newconcept()" or from    */
/*  the "Comparator()" function.  */
mu = 0  /*  18JUN1994:  Immediately reset "mu" to zero, for safety.       */
u = 0
IF ~DataType(ph, Mixed) THEN ph = ""
/*  17JUN1994:  Then next line of executable code has an IF-condition     */
/*  meant to eliminate spurious auditory engrams engendered by Retro().   */
IF DataType(ph, Mixed) THEN ph.tult = ph||newpenult /* Paul Overaa p. 69. */
IF ph = "PH" THEN ph.tult = ""   /*  17JUN1994:  Anti spurious phonemes.  */
IF trove ~= pattern THEN CALL Newconcept()
ph = ""
RETURN   /*  To the "Sensorium()" function.  */

/*     21MAY1994:  "Audiodamp()" plays a critical role in the recognition */
/*  algorithm used in the "Comparator()" function, where a chain of       */
/*  momentarily elevated a(ctivation) levels enables Mind.rexx to         */
/*  recognize an incoming word.  Here, at the end of each word, we        */
/*  reduce the activation levels to zero to avoid interference in the     */
/*  process of recognizing additional words, and also to smoothen the     */
/*  "re-entry" (Cf. Gerald Edelman's TNGS theory of the mind.) of engrams */
/*  activated during recall, brought forward during "Reentry()",          */
/*  and re-deposited at the advancing front of mental consciousness       */
/*  in a mechanism of such dynamic "re-entry" that the mind goes to work  */
/*  trying to analyze, categorize, and recognize the products of its own  */
/*  internal associative processes.  (Please see also "re-entry" and      */
/*  "brainstorm" in Amiga Library "Fish" Disk #411:Mind/NTJ.21.NOV.1979.) */
Audiodamp:    /*  ... is called from "Attach()".  */
  told = t       /*  13NOV1994:  We will move back through "t(ime-)old".  */
  /*  26.OCT.1994:  We limit dampings so as to speed up the Mind.rexx AI. */
  tcent = told - 100     /*  26.OCT.1994:  Latin "centum" = one hundred.  */
  IF tcent < 1 THEN tcent = 1            /*  Avoid negative time-points.  */
  DO told = t TO tcent BY -1  /*  26.OCT.1994:  Perhaps too brief a span? */
  PARSE VAR ph.told ph '.' a '.' bcus   /*  15NOV1994:  A consolidation.  */
  ph.told = ph||"."||"0"||"."||bcus   /* 15NOV1994: Direct damp to zero.  */
  /*  17JUN1994:  The test for "PH" seems to remove spurious engrams.     */
  IF ph = "" | ph = "PH" THEN ph.told = "" /* Remove spurious flag-panels.*/
  END
  bcus = ""  /*  16NOV1994:  A reset for safety.  */
RETURN  /*  ...to the "Attach()" function.  */

/*     25MAR1994:  "Newconcept()" is a way of determining what            */
/*  "onset-tag" "recall-vector" (rv) is to be passed into abstract        */
/*  memory to serve as a flag in the flag-panel of a new concept.         */
Newconcept:
  SAY "      Newconcept():  Word" pattern "not recognized but now stored."
  rv = seriest  /*  31MAR1994:  A time-value retained from "Sensorium()." */
  seriest = 0    /*  31MAR1994:  After use, reset series-t(ime) to zero.  */
  /*  13NOV1994:  In the next line of executable code, we are switching   */
  /*  from "t" to "tult" (coming still from the "Retro" function), as we  */
  /*  try to have time in Mind.rexx move only forwards, never backwards.  */
  SAY "      Newconcept():  t(ult) of ultimate-tag =" tult"."
  SAY "      Newconcept():  t of onset-tag (= recall vector) =" rv"."
  /*  21MAR1994:  Use "mt" to include both new and old ultimate-tags.     */
  mt = n  /*  18MAR1994:  Create a new concept.  */
  SAY "      Newconcept():  Pattern = "pattern"."
  IF pattern ~= "" THEN DO
    fiber.n. = pattern
    v = 0  /*  17.OCT.1994:  Henceforth valences come from the mindcore.  */
    /*  6APR1994:  In the "Attach()" function we will have a way to       */
    /*  override the default assignment of "NOUN" to incoming words.      */
    /*  Note (insight):  Some words (prepositions, conjunctions) may be   */
    /*  sequestered as automatic overrides of the chain of defaults.      */
    g = "NOUN"  /* 4JUL1994:  By default, let any new concept be "NOUN".  */
    IF wg = "NOUN" THEN g = "PRED"
    /*  7APR1994:  The next line is a rough beginning of classification.  */
    IF prevg = "NOUN" THEN g = "PRED"  /*  Alternate NOUN & PRED.  */
    prevg = ""  /*  7APR1994:  A (perhaps unnecessary) reset to nothing.  */
    /*  13NOV1994:  Next line disregards noun at end of previous thought. */
    IF parse = "ready" THEN g = "NOUN"    /*  13NOV1994:  Expect a noun.  */
    /*  13NOV1994:  Above flag "parse" will be set to "busy" right below. */
    fin = n     /*  16.OCT1994:  f(in) and out are the "n" of "fiber.n".  */
    fex = n
    /*  16.OCT1994 Note:  There must perhaps be a way to bring forward    */
    /*  the apppropriate "fin" and "fex" values for primitive concepts.   */
    /*  18.OCT1994:  "fin" is now brought forward during "Oldconcept()".  */
    /*  13.NOV1994:  The "Attach()" function will now create a concept-   */
    /*  node not at some spurious value of "t(ime)", but at the present.  */
    /*  It does not seem to matter what value of "t" "Attach()" uses.     */
    CALL Attach()  /*  29MAR1994:  to insert tags at "node" of concept.   */
    SAY "        Newconcept():  "fiber.n. "at n =" n "."
    /*  13OCT1994:  Here is a MAJOR change in the Mind.rexx source code.  */
    /*  We are going to map new "fiber.n" verbal-control concepts down    */
    /*  one level deeper to the "monad.f" array of the "deep structure".  */
    /*  The very primitive concepts at the core of the artificial mind    */
    /*  are protected from unplanned interference or disturbance because  */
    /*  they occupy the first sixty-four "f" numbers of the "monad.f"     */
    /*  array.  Since we see no need to protect adventitious concepts,    */
    /*  we will pass them from the external world of linguistic discourse */
    /*  down through the intermediate "fiber.n" level of verbal control   */
    /*  and into the nethermost domain of the conceptual monads, by the   */
    /*  simple trick of re-using the "n" of "fiber.n" to be the "f" of    */
    /*  the "monad.f" array - for values of "f" only above sixty-four.    */
    /*     This methodology is crucially important for the comprehension  */
    /*  of natural language and for projects in machine translation,      */
    /*  because now there will be one unified core of the mind down at    */
    /*  the third level of abstraction, while several natural languages   */
    /*  may co-exist on the upper (middle) level where the various        */
    /*  linguistic structures of the various languages transform ideas    */
    /*  from the core of the mind into sentences at the surface level,    */
    /*  or convert external sentences into understood ideas at the core.  */
    f = n  /*  28.OCT1994:  Above f = 64, merge "monad.f" and "fiber.n".  */
    monad.f. = pattern  /*  13.OCT1994:  Solely for ease of programming.  */
    dyn = 30  /* 23NOV1994:  Use 30, not 10, to be above threshold of 20. */
    IF g = "PRED" THEN func = "PRED"     /*  23NOV1994:  Identify verbs.  */
    verbal = n  /*  The monad concept associates to the fiber.n concept.  */
    /*  9NOV1994:  The next DO-block is a temporary mechanism to find     */
    /*  and lock onto incoming nouns as subjects of sentences.            */
    IF parse = "ready" THEN DO
      func = "SUBJ"  /*  9NOV1994: Or "FREE" to be "SUBJ" or "DOBJ".  */
      dyn = 30   /*  9NOV1994:  A high value to lock onto subject-nouns.  */
      parse = "busy"
      END
    CALL Instantiate()  /*  13.OCT1994:  Create three-deep abstractions.  */
    rv = 0
    n = n + 1  /*  Prepare for the next new concept.  */
    nmax = n      /*  14OCT1994:  "n" itself should be the truest value.  */
  END
RETURN                                 /*  ...to the "Retro()" function.  */

/*  12.OCT1994:  The "Instantiate()" function is a means of letting the   */
/*  deepest concepts of the artificial mind establish associative tags    */
/*  both among themselves and out to "instances" of each concept in use.  */
/*  In a real brain-mind, the associative tags would be synapses on       */
/*  nerve-fibers, but in Mind.rexx the tags must be reference numbers     */
/*  which relate one concept to another or to sensorimotor data.          */
/*     3NOV1994:  The first five lines of code below "Instantiate" are    */
/*  a scheme to force insertion of subsequent-tags into previous monads.  */
Instantiate:
IF t > 1 THEN DO     /*  4NOV1994:  Bypass monad bootstrap when "t = 1".  */
PARSE VAR monad.prev.tprequel monad.prev. '.' i1'.'i2'.'i3'.'i4'.'i5'.'i6,
  '.'i7'.'i8'.'i9'.'i10'.'i11'.'i12'.'i13
  /*  3NOV1994:  In the old monad put a reference to the new monad "f".   */
  i11 = f
  /*  23NOV1994:  By identifying a "SUBJ(ECT)" use at a particular node,  */
  /*  we can try to prevent associative spread at sentence boundaries.    */
  IF g = "PRED" THEN i12 = "SUBJ"  /*  23NOV1994:  SUBJ came before PRED. */
  monad.prev.tprequel = monad.prev.||'.'||i1||'.'||i2||'.'||i3||'.'||i4||,
    '.'||i5||'.'||i6||'.'||i7||'.'||i8||,
    '.'||i9||'.'||i10||'.'||i11||'.'||i12||'.'||i13
  END
SAY "Instantiate():  Into "monad.prev." inserting sequ-pointer,
  to "monad.sequ." at time " tprequel
  neuroblast = dyn||'.'||super ||'.'||equiv ||'.'||lower||,
        '.'||motor||'.'|| attn ||'.'||sensor||'.'||logic||,
        '.'||prev ||'.'||verbal||'.'|| sequ ||'.'||func ||'.'||t
monad.f.t = monad.f. || '.' || neuroblast
SAY "  Instantiate():  monad.f.t =" monad.f.t
SAY "     Into "monad.prev." was put pointer to "monad.i11." at t="tprequel
/*  Now reset all values so that none will carry over during bootstrap.   */
dyn = 0     /*  14NOV1994:  Moved from last to first place in the panel.  */
super = "^"
equiv = "^"
lower = "^"
motor = "^"
attn  = "^"
sensor = "^"
logic = "^"
/*  2NOV1994:  In the next line of executable code, we take the current   */
/*  value of "f" for "monad.f" and we assume that it will have been the   */
/*  previously active monad as soon as a new monad is instantiated.       */
/*  The "prev" flag will be used during the "Sequential()" function.      */
prev = f    /*  2NOV1994:  New flag associates to "prev(ious)" concepts.  */
tprequel = t  /*  3NOV1994:  For use in assigning subsequent-tags.  */
verbal = "^"
sequ = "^"  /*  2NOV1994:  Flag associates to "(sub)sequ(ent)" concepts.  */
func = "FREE"  /*  8NOV1994:  "FREE" is the default linguistic function.  */

RETURN  /*  to the deep-structure bootstrap area.  */


/*  29MAR1994:  The "Attach()" function is called from the concept-fiber  */
/*  bootstrap sequence, and was developed in a separate, temporary        */
/*  program "LCC29MAR94A", dealing with the logicoconceptual cable (LCC). */
/*  This function creates a "node" of associative tags at those sparse    */
/*  points along the length of a concept-fiber where the concept has      */
/*  been active.  (For theory see Fish disk #411:Mind/NTJ.02.MAY.1979.)   */
Attach:
  /*  4JUL1994:  We adopt temporarily a default value of "NOUN" for the   */
  /*  g(rammar) flag, as needed during transit through "Language()".      */
  /*  6APR1994:  Today we discontinue the use of a default value for "g"  */
  /*  in the "Attach()" function, and instead in "Oldconcept()" we let    */
  /*  previous values for "g" be brought forward so as to conflict with   */
  /*  any default setting of the value.  Today in "Newconcept" we are     */
  /*  setting a default "g" of "NOUN" which we are here immediately       */
  /*  overriding if the previous word was already of the class "NOUN".    */
  /*  This arrangement can be tested with simple sentences such as:       */
  /*  "Birds fly;" "Fish swim"; "Amigas think", and then the Mind.rexx    */
  /*  code will be refined to discriminate additional parts of speech.    */
  /*     7APR1994:  "Newconcept()" will tend by default to classify an    */
  /*  incoming word as "NOUN", unless the previously "attached" class     */
  /*  was already "NOUN", in which case Newconcept() will switch to the   */
  /*  classification "PRED(icate)" - a rough discrimination for now.      */
  /*  But the classifications laid down among "old concepts" and          */
  /*  detected in the "Oldconcept()" function will, for now, override     */
  /*  other considerations by means of the next two lines.                */
  IF rg = "PRED" THEN g = "PRED"  /*  7APR1994:  "Oldconcept()" override. */
  IF rg = "NOUN" THEN g = "NOUN"  /*  7APR1994:  "r(emembered)g(rammar)". */
  /*  14.OCT.1994:  Today we are removing "p" and "q" from "node" below,  */
  /*  substituting "oldf" and "newf" to refer to deep "monad.f" concepts. */
  /*  15.OCT.1994:  Today we discard "oldf" and "newf" as unsuitable and  */
  /*  instead we adopt "fin" and "fex", for monad.f tags that will refer  */
  /*  to a concept coming in ("fin") and a concept going out ("fex").     */
  /*  16APR1994:  We adapt "p" and "q" from our program "LCC29MAR94A".    */
  node = v||'.'||g||'.'||fin||'.'||fex||'.'||rv||'.'||t
  fin = ""      /*  18.OCT.1994:  A reset, lest false values carry over.  */
  fex = ""      /*  18.OCT.1994:  A reset, lest false values carry over.  */
  /*  23JUN1994:  Now follows a search for faulty ultimate-tags.          */
  /*  "rv" can also come from o(nset) v(ector) "ov" in "Oldconcept()".    */
  fiber.n.t = fiber.n. || '.' || node    /*  6APR1994:  Discrete parts.   */
  pq = n    /*  Save "n" of now previous word for use in "Newconcept()".  */
  prevg = g     /*  6APR1994:  Hold "prev(ious) g" to override defaults.  */
  q = 0  /*  16APR1994:  A safety reset of "q" referring to other fibers. */
  SAY "        Attach():  fiber.n.t =" fiber.n.t
/*  27JUN1994:  Damper CALL has been moved to Subject() and Predicate().  */
/*  28JUN1994:  No, Damper CALL does not belong in Language functions,    */
/*  which are not always invoked, but in recognition functions (Attach).  */
  CALL Audiodamp()  /*  16NOV1994:  Does this CALL belong here?  */
RETURN   /*  to concept-bootstrap, or "Oldconcept()", or "Newconcept()".  */

/*     Wordend() is a buffer area that operates when the rexxmind finds   */
/*  in permanent memory a wordstring "trove" which matches an incoming    */
/*  wordstring "pattern".                                                 */
Wordend:                      /*  24JUN1994:  Called from "Sensorium()".  */
  SAY "    Wordend():  trove =" trove "and onset-vector ov =" ov"."
  inpos = 1    /*  23JUN1994:  At end of word, reset in(put) pos(ition).  */
  sender = "Wordend"  /*  24JUN1994:  To trace what calls "Oldconcept()". */
  CALL Oldconcept()
  sender = ""
  /*     Reset values for now; later implement code to deal with them.    */
  cand  = ""; series = ""; pattern = ""    /*  Input of "auditory" data.  */
  sonus = ""; loaf   = ""; trove   = ""  /*  Engrams of auditory memory.  */
RETURN    /*  8APR1994:  To the newly designated "Sensorium()" function.  */

/*     25MAR1994:  "Oldconcept()" is a separate function for the purpose  */
/*  of updating concept-fibers by passing over to them the appropriate    */
/*  value for a new "recall-vector" leading to the "onset-tag" of a new   */
/*  instance of storage of the conceptualized word in auditory memory.    */
/*  Today we have only created that value "rv" below, and later we will   */
/*  use "rv" as we elaborate the flag-panels of concept-fibers.           */
Oldconcept:                /*  24JUN1994:  Called only from "Wordend()".  */
/*  24JUN1994:  The next line of executable code is a transfer of         */
/*  the conceptual utlimate-tag (move-tag) from "fiber.dex" in the        */
/*  "Catamnesis()" (re-entry) function.  Because re-entry always deals    */
/*  with a reactivated (re-entering) concept, there is always a           */
/*  "fiber.dex" number ("dex") to be passed forward in "Oldconcept()".    */
IF cata = 1 THEN mt = dex  /*  24JUN1994.  */
IF cata = 0 THEN dex = 0   /*  26JUN1994:  A cautious re-set of "dex".    */
/*  IF "cata" is not on, then move-tag "mt" comes from "Comparator()".    */
SAY "      Oldconcept():  Called from " sender"."
SAY "      Oldconcept():  Word" trove "recognized; ultimate-tag =" mt"."
SAY "      Oldconcept():  Ultimate-tag" mt "has been re-affirmed."
/*     24JUN1994:  "ov" for human input will have been declared in        */
/*  "Wordend()" ?, and for re-entered engrams in "Catamnesis()".          */
rv = ov  /*  28MAR1994:  Let the "recall-vector" = the "onset-vector."    */
ov = 0   /*  28MAR1994:  Immediately reset the onset-vector to zero.      */
keepn = n  /*  Do not disturb prevailing value of "n" for "fiber.n".      */
keepf = f  /*  14.OCT1994:  Do not disturb prevailing "monad.f".          */
n = mt           /*  Temporarily address the associated concept-fiber.    */
IF cata = 1 THEN n = dex  /* 23JUN1994:  An override from "Re-entry()".   */
/*     18.OCT.1994:  Here we need to find the previous "fin" value of     */
/*  the old "fiber.n" in order to carry it forward unchanged as the       */
/*  "monad.f-in(coming)" reference tag of the new time-node about to      */
/*  be created as "fiber.n.t".  It is necessary that new "fiber.n"        */
/*  nodes retain their access to their original "monad.f" concepts.       */
/*  Since the nested loops a few lines down from here parse fiber.n.t,    */
/*  we will use that opportunity to find "oldfin" for use in "Attach".    */
fiber.n. = trove       /*  29JUN1994:  Anti interpretation as "FIBER".    */
f = n       /*  14.OCT1994:  Middle level updates deep mindcore level.    */
SAY "    Oldconcept():  Fiber.n. =" fiber.n."; recall-vector will be" rv"."
monad.f. = trove         /*  14.OCT.1994:  Not necessary, but helpful.    */
SAY "    Oldconcept():  monad.f. =" monad.f.  /*  14.OCT.1994  */
verbal = n    /*  14.OCT1994:  Tag that refers "monad.f" to "fiber.n".    */
holdfiber = fiber.n.
/*  23NOV1994:  Out! "abeyt = t" 6APR1994: Hold "t" (time) in abeyance.   */
/*  Instead, we use "o(ld)c(oncept)t(ime)" with sep(tember) as "oct-1".   */
sep = t - 1               /*  6APR1994:  To avoid undefined "fiber.n.t".  */
/*     26.OCT.1994:  We limit searches to a maximum of 200 points.        */
toka = t - 200  /*  26.OCT.1994:   t-swift, Greek "oka".  */
IF toka < 1 THEN toka = 1  /*  Avoid negative "toka".  */
DO oct = sep TO toka BY -1    /*  26.OCT.1994:  Go back only 200 points.  */
  PARSE VAR fiber.n.oct fiber.n. '.' node
  PARSE VAR node wv '.' wg '.' wfin '.' wfex '.' wr '.' wt
    SELECT        /*  Callaway, Merrill, "The ARexx Cookbook", page 3-3.  */
      WHEN wg = "NOUN" THEN DO
        /*  7APR1994:  "r(emembered)g" as an override in Attach().        */
        rg = "NOUN"   /*  For use in "Attach()".  */
        tsparse = oct           /*  A key to this particular fiber.n.oct  */
        oldfin = wfin       /*  18.OCT.1994:  Carry "fin" value forward.  */
        oldfex = wfex       /*  18.OCT.1994:  Perhaps not necessary.      */
        END
      WHEN wg = "PRED" THEN DO
        /*  7APR1994:  "r(emembered)g" as an override in Attach().   */
        rg = "PRED"   /*  For use in "Attach()".  */
        tsparse = oct  /*  A key to this particular fiber.n.oct  */
        oldfin = wfin       /*  18.OCT.1994:  Carry "fin" value forward.  */
        oldfex = wfex       /*  18.OCT.1994:  Perhaps not necessary.      */
        END
      OTHERWISE DO
        IF oct = toka THEN SAY,
          "        Oldconcept():  Search stopped at toka = " toka
        IF oct = 1 THEN SAY "        Oldconcept():  End of search."
        END
    END
  END
wg = rg  /*  29JUN1994:  An attempt to force "wg" to be non-numeric.  */
SAY "      Oldconcept():  Grammar category of" fiber.n.tsparse "=" wg"."
/*  23NOV1994:  From this line we remove "t = abeyt".                     */
fiber.n. = holdfiber
/*     18.OCT.1994:  The next line of executable code ensures that        */
/*  access to primitive "monad.f" concepts is brought forward when the    */
/*  rexxmind establishes a new node in the "fiber.n.t" array.             */
fin = oldfin
fex = oldfex   /*  18OCT1994:  Should perhaps come from a newer value.    */
/*     The function called in the next line of executable code will       */
/*  transfer the value of "rv" into the node-panel of the concept.        */
CALL Attach()  /*  29MAR1994:  ...to insert tags at "node" of concept.    */
fin = ""
rv = 0
/*     18.OCT.1994:  The next few lines of executable code are an         */
/*  attempt to pass activity from a recognized, incoming word (via the    */
/*  incoming-monad.f "fin" tag) to the very "monad.f" deep concept        */
/*  which ought to be activated during comprehension of the word.         */
/*  Thus Mind.rexx attempts natural-language comprehension.               */
IF mind = "OPEN" THEN DO
  f = oldfin
  IF cata = 0 THEN flow = "IN"
  IF cata = 1 THEN flow = "OUT"
  IF flow = "IN" & f < 65 THEN DO
    SAY "Flow of communication is INTO the rexxmind."
    PARSE VAR monad.oldfin.1 monad.oldfin. '.' zd '.' zs '.' ze '.' zl,
    '.' zm '.' za '.' zn '.' zg '.' zp '.' verbal '.' zq '.' zf '.' zt
    SAY "  Old  from outgoing monad.f =" verbal
    END
  IF flow = "OUT" & f < 65 THEN DO
    f = oldfex       /*  27.OCT1994:  A switch for the sake of re-entry.  */
    SAY "Flow of communication is OUTWARDS from the rexxmind."
    PARSE VAR monad.oldfex.1 monad.oldfex. '.' zd '.' zs '.' ze '.' zl,
    '.' zm '.' za '.' zn '.' zg '.' zp '.' verbal '.' zq '.' zf '.' zt
    SAY "  Old  from incoming monad.f =" verbal
    END
  /*     4NOV1994:  The next two lines of executable code are an          */
  /*  attempt to convey a hidden marker that will let verb monads         */
  /*  pass a higher "spreading activation" to their customary subjects    */
  /*  and objects within the monad mindcore during "Associative()".       */
  /*     7NOV1994:  We are hot on the trail of intelligent associations   */
  /*  and we need to achieve a natural "settling" of activation-levels    */
  /*  down to values which reflect an equilibrium based on the true       */
  /*  interplay of concepts in a mind.  Therefore we now insert some      */
  /*  test values for "dyn(amism)" in an attempt to have incoming         */
  /*  comprehended concepts be more active than residual concepts.        */
  /*     23NOV1994:  We are trying to ensure that associations will       */
  /*  spread VALIDLY within a Mind.rexx knowledge-base ("KB"), so here    */
  /*  we are establishing some standard dyn(amisms) of 30, which will     */
  /*  get a word past any threshold of only 20.                           */
  dyn = 30  /*  23NOV1994:  A level high enough to pass liminal 20.       */
  IF rg = "PRED" THEN dyn = 40  /*  23NOV1994:  Verbs are important.      */
  IF rg = "NOUN" & parse = "object" THEN DO
    dyn = 30  /*  23NOV1994:  No reason to discriminate.... */
    func = "DOBJ"  /*  9NOV1994:  A serendipitous idea here.  */
    parse = "busy"  /*  9NOV1994:  Until "ready" at end of Language().    */
    END
  IF rg = "NOUN" & parse = "ready" THEN DO
    dyn = 30  /*  9NOV1994:  High value to lock onto a subject.  */
    func = "SUBJ"  /*  9NOV1994:  A sudden test of an idea....  */
    parse = "object"  /*  9NOV1994:  Next search is for object.  */
    END
  unidyn = dyn     /*  24NOV1994:  A uniform dyn to spread to all nodes.  */
  SAY "The mind (variable) is " mind"; calling Instantiate()..."
  CALL Instantiate()
  CALL Holodyne()  /*  24NOV1994:  To spread "unidyn" down the "monad.f". */
  verbal = 0  /*  26.OCT.1994:  Safety measure.  */
  unidyn = 0  /*  24.NOV.1994:  Reset for safety.  */
  END
rg = ""  /*  9NOV1994:  Reset for safety.  */
n = keepn            /*  Restore "n" to its value from before this loop.  */
RETURN                                               /*  To "Wordend()".  */

/*     24NOV1994:  "Holodyne()" is a special function to ensure that an   */
/*  incoming recognized word uniformly activates (with "unidyn") all the  */
/*  recent nodes on its quasi-fibrous extension, as if a concept fiber    */
/*  gang were now totally energized.  The rationale behind "Holodyne()"   */
/*  is that in a knowledge-base ("KB") all the nodes of a newly activated */
/*  concept must at first be uniformly active, so that activation of a    */
/*  juxtaposed concept at any temporal node will heighten the activation  */
/*  of a particular node enough to spill over onto an inveniend concept.  */
Holodyne:
cool = t - 200
IF cool < 1 THEN cool = 1    /*  24NOV1994:  Avoid negative time-points.  */
/*     25NOV1994:  Although "unidyn = dyn" in "Oldconcept()", here we are */
/*  trying a fixed value of 30 to leave no room for ambiguity.            */
/*     25NOV1994:  Now we revert to the "Oldconcept()" value, because we  */
/*  want values to "snake" through the chain of subject-verb-object in    */
/*  such a way that specific time-nodes of words become highly active.    */
DO hot = t TO cool BY -1     /*  "hot" = holodyne-time.  */
  IF monad.f.hot ~= "" THEN DO
    PARSE VAR monad.f.hot monad.f. '.' hdyn '.' allo
    SAY "Holodyne():  At time "hot", setting "monad.f." to unidyn "unidyn
    monad.f.hot = monad.f. ||"."||unidyn||"."||allo
    END
  END
RETURN   /*  to "Oldconcept()"  */

/*  Comparator() will match an incoming letter against stored phonemes.   */
/*     23JUN1994:  This comparator process cries out for the              */
/*  implementation of massive parallelism.  When a slice of either        */
/*  entering or re-entering perception pervades a sensory memory channel, */
/*  all points of positive comparison (recognition) ought to be           */
/*  activated simultaneously, resulting in the massively parallel         */
/*  activation of associative tags leading to particular fibers ganged    */
/*  massively together to constitute the physical embodiment of the       */
/*  concept being activated within the mind.  Note the unbroken           */
/*  sequence of three "mass-par" phenomena:  massive recognition;         */
/*  massive association; and massive activation of the ganged fibers      */
/*  holding a concept.  (See Amiga Fish Disk #411:Mind/NTJ.11.APR.1979.)  */
Comparator:
  holdf = ""     /*  19MAY1994:  For "ph.t", nothing (rather than zero).  */
  ut = 0
  sonus = ""
    favorite = cand
    holdf = cand  /*  For the sake of "Retro()".  */
    b = "Y"
    c = "Y"
    /*  10.OCT1994:  Whenever changed, "n" is also restored safely.       */
    mt = n  /*  10.OCT1994:  move-tag for new words, before "Retro()".    */
    onset = blankt + 1 /* 13NOV1994: "blankt" of bootstrap or "Retro()".  */
    IF t > onset THEN b = "N"         /*  Set non-initial "b" to "N(o)".  */
  IF cand ~= SP THEN SAY "    Comparator():  "cand "goes to ShortTermMem()."
    IF cand ~= SP THEN CALL ShortTermMem()
    IF cand = SP THEN ph.t = ""
  /*     20JUN1994:  In future we may stop below far short of "t = 1".    */
  /*     26OCT1994:  Today we introduce "tdavno" as a cut-off point to    */
  /*  limit the backwards time-sweep of searches for recognition of words */
  /*  to the previous one thousand time-points in the auditory memory     */
  /*  channel.  (Any REXX programmer may change this value ad libitum.)   */
  /*  There are some unobvious considerations at play here.  We start     */
  /*  with this large value of 1000 because we do not really want to miss */
  /*  any known words in current sessions of running Mind.rexx, but we    */
  /*  do indeed want there to be SOME cut-off point in case we start to   */
  /*  let an installation (not an incarnation but perhaps an inmentation) */
  /*  of Mind.rexx run for days and days, or even indefinitely.  In fact, */
  /*  we may invite AI avant-gardists to vie for the distinction of       */
  /*  hosting the longest uninterrrupted run of Mind.rexx in all REXXdom. */
  /*  An unobvious point is that failure to recognize previously known    */
  /*  words may lead to duplication, and thus ganging, of concept-fibers. */
  tdavno = t - 1000      /*  26.OCT.1994:  Russian, (t) "long time ago".  */
  IF tdavno < 1 THEN tdavno = 1   /*  26.OCT.1994:  Avoid negative time.  */
  /*  21NOV1994:  Search starts at "blankt" to pass over current input.   */
  DO tc = blankt TO tdavno BY -1  /*  21NOV1994:  "blankt" from "Retro()".*/
    hall = ""  /*  A safety measure against latent halls.  */
    /*  19MAY1994:  We are cycling down through time, not the alphabet.   */
    PARSE VAR ph.tc ph '.' hall
    IF cand = ph & cand ~= SP THEN DO
      PARSE VAR hall a '.' b '.' c '.' ut '.' s
      IF b = "Y" & Length(series) < 2 THEN DO
        SAY "      Onset-tag of" ph "found at tc =" tc"."
        /*     24JUN1994:  Previously, an onset-vector "ov" was declared  */
        /*  here, but that method was establishing OLD onset-vectors.     */
        /*  Onset-vectors for both newly entering and re-entering words   */
        /*  should probably be declared from "seriest" in "Sensorium()".  */
        /*     23JUN1994:  The next line of executable code is a test for */
        /*  re-entry (or "catamnesis"), during which the onset-vector of  */
        /*  the re-entry into auditory memory must be transfered during   */
        /*  the "Oldconcept()" function to become the recall-vector "rv"  */
        /*  embedded within the flag-panel of the new concept-node.       */
        IF cata = 1 THEN ov = ovnew  /*  28JUN1994  */
        onsettime = tc
        a = a + 8
        hall = "."||a||"."||b||"."||c||"."||ut||"."||s
        ph.tc = ph || hall
      END
      b = "N"  /*  22NOV1994:  Reset for safety.  */
      IF a > 0 THEN DO          /*  28.OCT.1994:  To speed up Mind.rexx.  */
        sonus = cand
        IF c = "N" THEN mt = ut    /* mt for "Oldconcept()". */
        IF c = "N" & cata = 1 THEN mt = dex
        SAY "        Comparator():  Possible match of <",
          cand "> with letter <" ph "> at tc" tc"."
        CALL String_effect()
        END
      a = 0  /*  22NOV1994:  Reset for safety.  */
    END
  END
  loaf = loaf || sonus
  SAY "    Comparator():  loaf =" loaf
RETURN  /*  ...to "Sensorium()".  */

ShortTermMem:                            /*  Called from "Comparator()".  */
  a = 0
  s = "@"
  IF cata = 1 THEN s = "+"    /*  24JUN1994:  An internal re-entry flag.  */
  IF GETCLIP('control') = "RE-ENTRY" THEN s = "+"         /*  24MAY1994.  */
  panel = "."|| a ||"."|| b ||"."|| c ||"."|| u ||"."|| s
  a = 0; b = 0; c = 0; u = 0; s = " "
  ph = cand  /*  20MAY1994:  Since we are now recording "cand".  */
  /*  16JUN1994:  Today we are conditionalizing the next line.  */
  IF cand ~= "" THEN ph.t = ph || panel
  IF ph = "PH" THEN ph.t = ""    /*  17JUN1994:  Anti spurious phonemes.  */
  IF ph = "" | ph = SP THEN ph.t = ""
  SAY "      ShortTermMem():  Saving character" ph" at time" t"."
  SAY "      ShortTermMem():  ph || panel = " ph.t
  ph = ""  /*  20MAY1994:  An attempt to isolate a problem.  */
RETURN                            /*  ...to the "Comparator()" function.  */

/*     The idea of a "string effect" in the auditory memory channel lets  */
/*  us assume that if we activate the onset-tag of a word, then the rest  */
/*  of the word will also tend to be activated.  Right now we use the     */
/*  string effect to recognize incoming words; later, when the Mind.rexx  */
/*  "quickens," we will use it in the generation of sentences of thought. */
/*  (For theory, please see Amiga Fish disk # 411:Mind/NTJ.16.MAR.1978.)  */
String_effect:
  phoneme = ph
  tse = tc + 1  /*  13NOV1994:  tse = "time (in) String_effect().  */
  /*  15NOV1994:  For speed-up, here a PARSE+remainder is in order.       */
  PARSE VAR ph.tse ph '.' panel
  PARSE VAR panel a '.' b '.' c '.' u '.' s
  /*  In the next line, a non-letter would be longer than one.  */
  IF Length(ph) = 1 & ph ~= SP THEN a = a + 8
  panel = "."||a||"."||b||"."||c||"."||u||"."||s
  a = 0
  u = 0  /*  28.OCT.1994:  A reset to combat ShortTermMem() interference. */
  IF Length(ph) = 1 & ph ~= SP THEN ph.tse = ph || panel
  IF Length(ph) = 1 & ph ~= SP THEN SAY,
 "      String_effect():  Increasing (a)ctivation of" ph" by 8 at t = " tse
  ph = phoneme  /*  Restore ph for use in ShortTermMem().  */
RETURN  /*  ...to the "Comparator()" function.  */


/*     4NOV1994:  Today we re-fashion "Associative()" to make it into     */
/*  an area where monads of the mindcore undergo "spreading activation."  */
/*     8NOV1994:  "Associative()" now spreads activation-levels not only  */
/*  to related concepts but also to previous nodes of an active monad.    */
/*  This blanketing of multiple nodes of the same monad is necessary if   */
/*  the self concept is to be capable of linguistic expression as either  */
/*  "I" or "me" in accordance with grammatical requirements.              */
/*     If necessary, bring a found "dyn(amism)" also forward in time.     */
Associative:
SAY ""   /*  A blank line for the screen.  */
SAY "Associative:  f and n = "  f " and " n
statim = t  /*  Latin "statim" for the immediate moment.  */
prius = t - 100  /*  Latin "earlier" by an arbitrary period.  */
upperdyn = 0  /*  8NOV1994:  Init a carrier of dyn down nodes of a monad. */
IF prius < 1 THEN prius = 1  /*  Avoid negative time-points.  */
/*  4NOV1994:  Examine (Alpha-CPU-ready) 64 core concepts plus others.    */
DO psi = 1 TO n  /*  Use  f? for monad.f instead of "n".  */
  /*  The next line of executable code skips undefined primitive monads,  */
  /*  but the test works only for monads below "psi = 65".                */
  IF monad.psi.1 == "" & psi < 65 THEN ITERATE
    DO z = statim TO prius BY -1  /*  Step backwards through time.  */
    IF monad.psi.z ~= "" THEN DO
       SAY "At t "z "monad.psi.z = " monad.psi.z
       /*  23NOV1994:  We are now requiring a "spark" signal from         */
       /*  "Audition()" to give a go-ahead for ego-boosting only when     */
       /*  there has long been no external input, because, if another     */
       /*  mind is in dialogue with Mind.rexx as a knowledge-base ("KB"), */
       /*  we do not want the ego-boost mecahnism to disrupt the KB.      */
       /*  16NOV1994:  Enhance self to ensure availability of a subject.  */
       IF psi = 1 & spark = 1 THEN DO
         SAY "    Associative():  Enhancing dynamism of concept of self."
         PARSE VAR monad.psi.z monad.psi. '.' boost '.' selfpanel
         boost = boost + 1   /*  16NOV1994:  Enhance dyn(amism) of self.  */
         monad.psi.z = monad.psi. ||'.'||boost||'.'||selfpanel
         SAY "        monad.psi.z =" monad.psi.z
         END
       /*  23NOV1994:  For speed-up, PARSE only to "assoc(iative-)rest".  */
       PARSE VAR monad.psi.z monad.psi '.' pdyn '.' assocrest
       /*  8NOV1994:  Move a high "dyn" to lower nodes of the same monad. */
       IF upperdyn > pdyn THEN DO
       SAY "  Associative():  Moving dyn-level to lower node of" monad.psi.
         monad.psi.z = monad.psi.||"."||upperdyn||"."assocrest
         END
       IF pdyn > 0 THEN CALL Spreadact()
       upperdyn = pdyn  /*  8NOV1994:  Transfer "dyn" to lower nodes.  */
       pdyn = 0  /*  8NOV1994:  Reset for safety.  */
       END
    END
  END
RETURN             /*  7NOV1994:  ...to the Main Body "DO FOREVER" loop.  */

/*     4NOV1994:  In "Spreadact()" we will let the prev(ious) tag and the */
/*  (sub)sequ(ent) tag of a monad (especially and preferably a verb-idea) */
/*  pass some "dyn(amic)" activation to the previous and subsequent       */
/*  monad-concepts, without singling out any particular concepts as being */
/*  dominant, so that diffuse association may occur in the mindcore.      */
/*     We thereby test the proposition that such diffuse association may  */
/*  be part of LANGUAGE COMPREHENSION, and may enable the rexxmind to     */
/*  build up a knowledge base ("KB") from mundane experience.             */
Spreadact:
SAY "  Diffusing associations from: " monad.psi.z
PARSE VAR monad.psi.z monad.psi. '.' pdyn '.' pu '.' pe '.' po,
  '.' pm '.' pa '.' ps '.' pl '.' pp '.' pv '.' pq '.' pf '.' pt
SAY "    Prev(ious) monad.pp. & func. = " monad.pp. pf
/*     23NOV1994:  If we can identify a "PRED" verb, then the next ("pq") */
/*  word will be its direct object at the particular temporal node, and   */
/*  we can boost the activation of the direct object through "dsequ = 20".*/
IF pf = "PRED" THEN dsequ = 20  /*  23NOV1994:  Enough to pass threshold. */
IF pf = "PRED" THEN dprev = 20  /*  We might as well boost subjects, too. */
ictus = 0        /*  23NOV1994:  Right now we do not even use "ictus".    */
IF DataType(pp, numeric) & pp > 0 THEN DO y = statim TO prius BY -1
    IF monad.pp.y ~= "" THEN DO
    PARSE VAR monad.pp.y monad.pp. '.' ydyn '.' yu '.' ye '.' yo,
      '.' ym '.' ya '.' ys '.' yl '.' yp '.' yv '.' yq '.' yf '.' yt
    /*  Now we increase the dyn(amism) of this prev(ious) "monad.pp.y".   */
    /*  If necessary, do IF ~DataType(ydyn, numeric) THEN ydyn = 0        */
    ydyn = ydyn + 1   /*  16NOV1994:  Letting dynamism grow only by one.  */
    /*  Now we also make sure that the monad has a (sub)sequ(ent)-flag.   */
    IF ~DataType(yq, numeric) THEN DO
      SAY "    Replacing yq flag " yq " with new flag psi: " psi
      yq = psi    /*  Since pp was prev to psi, psi is subsequent to pp.  */
      END
    /*     4NOV1994: Next few lines of executable code are a risky trick. */
    /*  We should perhaps use the original time-value of "yt", but right  */
    /*  now we are serendipitously switching the time-point of this node  */
    /*  into the immediate present of "t = statim" so that other search   */
    /*  areas - especially "Deep_structure()" - may easily find this node */
    /*  while conducting only a shallow, and therefore speedy, search.    */
    /*     8NOV1994: Today we switch back to using the original time "yt" */
    /*  and not "statim", because in our plan to build a knowledge base   */
    /*  we will need "proximity" associations at all valid time-points.   */
    monad.pp.y = monad.pp.||'.'||ydyn||'.'||yu||'.'||ye||'.'||yo||,
      '.'||ym||'.'||ya||'.'||ys||'.'||yl||,
      '.'||yp||'.'||yv||'.'||yq||'.'||yf||'.'||yt
    SAY "    Now monad.pp.y = " monad.pp.y
    ydyn = 0  /*  Reset for safety.  */
    /*     8NOV1994:  Today we are removing a LEAVE instruction, which    */
    /*  would have limited the alteration of dyn(amism) levels to only    */
    /*  the one most recent node of a given monadic concept.  In order    */
    /*  to build up a queryable knowledge base ("KB"), we must let all    */
    /*  the nodes of a concept be subject to shifts in activation-level.  */
    END
  END
SAY "    Subsequent monad.pq. = " monad.pq
ictus = 0  /*  23NOV1994:  Rignt now we do not even use "ictus".   */
IF DataType(pq, numeric) & pq > 0 THEN DO y = statim TO prius BY -1
  IF monad.pq.y ~= "" THEN DO
    PARSE VAR monad.pq.y monad.pq. '.' ydyn '.' yu '.' ye '.' yo,
     '.' ym '.' ya '.' ys '.' yl '.' yp '.' yv '.' yq '.' yf '.' yt
    ydyn = ydyn + 1     /*  16NOV1994:  Letting dynamism grow by one....  */
    /*  23NOV1994:  If the "psi" word was a verb, the next line of code   */
    /*  will add 20 more points ("dsequ") to its nodal activation, so     */
    /*  that a valid direct object will likely be flushed out in a query  */
    /*  of a KB, unless there is a concept already active at 30 or higher.*/
    ydyn = ydyn + dsequ       /*  23NOV1994:  "dsequ" is declared above.  */
    /*  Since pq was (sub)sequ(ent) to psi, psi is prev(ious) to pq.      */
    IF ~DataType(yp, numeric) THEN yp = psi
    monad.pq.y = monad.pq.||'.'||ydyn||'.'||yu||'.'||ye||'.'||yo||,
      '.'||ym||'.'||ya||'.'||ys||'.'||yl||,
      '.'||yp||'.'||yv||'.'||yq||'.'||yf||'.'||yt
    SAY "    Now monad.pq.y = " monad.pq.y
    ydyn = 0
    dsequ = 0  /*  23NOV1994:  Reset for safety, until new CALL to here.  */
    /*  14NOV1994:  Today we remove a "LEAVE" which we neglected earlier. */
    END
  END
RETURN                             /*  7NOV1994:  ...to "Associative()".  */

/*     24NOV1994:  "TransferAct()" will be a function for the highly      */
/*  guided transfer of activation levels from ALL (recent) nodes of a     */
/*  word used in a sentence (such as the subject noun) to be added to     */
/*  the various "subsequent" concepts associated with the word,           */
/*  including (it is hoped) the valid and correct node of the next major  */
/*  word in the sentence, so that activation is passed during a "temporal */
/*  cloud" surrounding a verb-node within a knowledge-base.               */
TransferAct:
PARSE VAR fiber.dex.hvt fiber.dex. '.' xfv '.' xfg '.' xfin '.' xfex,
  '.' xfrv '.' xft
SAY "  TransferAct():  Word "fiber.dex." refers to monad "monad.xfex.
/*  24NOV1994:  Here we must parse the monad.xfex. completely to extract  */
/*  all the "subsequent" references and their times.  Then, at THOSE      */
/*  TIMES ONLY (for "guided" spread) we must add about 10 points of       */
/*  dynamism to the monad (or to the fiber.n???) so that a particular     */
/*  node on the main verb timeline will be somewhat more activated than   */
/*  all the rest, causing that temporal node on the verb in turn to       */
/*  pass exceptionally high activation to its correct direct object,      */
/*  that is, a noun in in the path of this guided re-activation.          */

ancien = t-200
IF ancien < 1 THEN ancien = 1  /*  25NOV1994:  Avoid negative timepoints. */
DO txf = t TO ancien BY -1
  PARSE VAR monad.xfex.txf monad.xfex. '.' x1 '.' x2 '.' x3 '.' x4,
    '.' x5 '.' x6 '.' x7 '.' x8 '.' x9 '.' x10 '.' xsequ '.' x12 '.' x13
  IF xsequ = xfex THEN ITERATE  /*  Skip references back to self.  */
  SAY monad.xfex." at time " txf " leads to " monad.xsequ.

    ubi = txf     /*  25NOV1994:  Search begins "where" current time is.  */
    SAY "  Now trying to enhance activation of "monad.xsequ.
      DO vic = 1 TO 12 BY 1  /*  25NOV1994:  "vic(inity)" of time-search. */
      ubi = ubi + 1    /*  25NOV1994:  Search up to 12 nearby verb-nodes. */
IF monad.xsequ.ubi ~== "" THEN SAY "    monad.xsequ.ubi = " monad.xsequ.ubi
      PARSE VAR monad.xsequ.ubi monad.xsequ. '.' xfdyn '.' dross
        IF DataType(xfdyn, numeric) THEN DO
          SAY "    "monad.xsequ." has "xfdyn" points; adding 15 more...."
          newdyn = xfdyn + 15  /*  26NOV1994:  More discrimination.  */
          PARSE VAR dross dr2 '.' dr3 '.' dr4 '.' dr5 '.' dr6 '.' dr7,
            '.' dr8 '.' drprev '.' dr10 '.' dr11 '.' dr12 '.' dr13
         SAY "        xfex / drprev = " xfex " / " drprev
            IF drprev = xfex THEN DO
             SAY "  "monad.xsequ." contains association back to "monad.xfex.
              newdyn = newdyn + 10
       SAY "   ten points for bi-directional association make newdyn" newdyn
              END
          monad.xsequ.ubi = monad.xsequ.||"."||newdyn||"."||dross
          newdyn = 0  /*  25NOV1994:  Reset for safety.  */
          END
      END
  END
RETURN   /*  24NOV1994:  To "NounPhrase()".  */


/*     10.OCT1994:  Deep_structure() is a central core of the artificial  */
/*  mind where nonverbal concepts will interact in such ways as to pass   */
/*  valences out to the "fiber.n" array governing words in language, or   */
/*  where the nonverbal concepts will be activated during comprehension   */
/*  of natural language.                                                  */
Deep_structure:
  SAY "  Now in Deep_structure() for mindcore to drive Language()...."
  fconst = f
  tconst = t
  SAY "  Searching the mindcore; patience, please...."
  stop = n  /*  Prepare to stop at the last "monad.f".  */
  freeze = t
  gain = 0  /*  18.OCT.1994:  A summing up of "dyn" values.  */
  /*     18.OCT.1994:  We now try a massive transfer of activation from   */
  /*  the "monad.f.t" mindcore up to the linguistic "fiber.n.t" array.    */
  SAY "  Deep_structure():  Counting from f = 1 to f = " stop
  DO f = 1 TO stop
      IF monad.f.1 == "" & f < 65 THEN ITERATE  /*  27.OCT.1994.  */
      tmelt = freeze - 200    /*  26OCT1994:  A search-span of only 200.  */
      IF tmelt < 1 THEN tmelt = 1  /*  A safety against negative t-time.  */
      DO tf = freeze TO tmelt by -1   /*  Count backwards for longevity.  */
      PARSE VAR monad.f.tf monad.f. '.' dyn '.' super '.' equiv '.' lower,
        '.' motor '.' attn '.' sensor '.' logic,
        '.' prev '.' verbal '.' sequ '.' func '.' zt
        IF dyn > 19 & func = "MODE" THEN SAY "Attention:  Word ",
          monad.f. "at tf "tf" may invoke a new "func" of sentence."
        IF dyn > 0 & IF verbal > 0 THEN DO tf = freeze to tmelt BY -1
          IF Left(fiber.verbal.tf, 6) ~= "FIBER." THEN DO
            PARSE VAR fiber.verbal.tf fiber.verbal '.' transfer
            PARSE VAR transfer val '.' grac '.' inb '.' oub '.' rcv '.' zeit
            moval = dyn  /* 25NOV1994:  So that monads will guide fibers. */
            /*  8NOV1994:  If Language() is looking for a direct object,  */
            /*  we augment the activation of any special direct object.   */
            /*  9NOV1994:  By using "moval = moval + 20", we are trying   */
            /*  to let basic associativity percolate through, while we    */
            /*  elevate all potential direct objects as a class.          */
            SAY "  Deep_structure():  dirobj & func = " dirobj "/" func
SAY "    Changing valence "val" of "fiber.verbal.tf" to "dyn" from monad."
            IF func = "SUBJ" | func = "FREE" & IF subject = 1 THEN DO
              SAY "      Adding one valence point for subject."
              moval = moval + 1
              END
            IF func = "DOBJ" | func = "FREE" & IF dirobj = 1 THEN DO
              SAY "      Adding NO valence point for direct object."

              END
        transfer = moval||'.'||grac||'.'||inb||'.'||oub||'.'||rcv||'.'||zeit
            fiber.verbal.tf = fiber.verbal.||'.'||transfer
            /*  8NOV1994:  From this line we remove a LEAVE.  */
            END  /*  27.OCT.1994.  */
        END
      dyn = 0
      END
    END
  f = fconst  /*  Reinstate "f" as f-constant.  */
  t = tconst  /*  Reinstate "t" as t-constant.  */
  SAY "  At end of Deep_structure()...."
RETURN  /*  4NOV1994:  ...to the "Language()" function.  */


/*     Persons (especially linguists or psychologists) wishing to work    */
/*  on the conscious "quickening" of their own rexxmind may read:         */
/*  Dell, Gary S., 1986, "A spreading activation theory of retrieval in   */
/*  sentence production," published in Psychological Review, 93, 283-321. */
/*     5APR1994:  When the "Selective()" function has declared the        */
/*  momentarily dominant (most active) concept, we will feed that concept */
/*  to the "Language()" function as the impetus for a sentence.           */
/*     25APR1994:  The "Selective()" function is no longer the direct     */
/*  source of the focal concept for sentence-generation, but serves       */
/*  instead to initiate the spread of conceptual activation, after which  */
/*  the "Language()" function "flushes out" its own word-candidates.      */
Language:
  SAY ""
  SAY "Language():  Mind.rexx is composing a sentence...."
  SETCLIP('control', "RE-ENTRY")  /*  24MAY1994:  A 3rd state and a flag. */
  parse = "busy" /* 9NOV1994: Becomes "ready" again at end of Language(). */
  outpos = 1    /*  4MAY1994:  For safety; should already be set to one.  */
  /*     4NOV1994:  Today we are rearranging Mind.rexx program-flow in    */
  /*  order to let the "mindcore" and the "fiber-shell" cooperate during  */
  /*  the generation of sentences of linguistic thought.                  */
  SAY "  Language():  Calling Deep_structure() to fetch concept-valences."
  subject = 1  /*  9NOV1994: A flag to find subjects in Deep_structure(). */
  CALL Deep_structure()     /*  4NOV1994:  A radical change in sequence.  */
  CALL Subject()      /*  5APR1994:  Chomsky, "Aspects" (1965), page 65.  */
  subject = 0
  t = t + 1    /*  25MAY1994:  Trying to insert space during "re-entry".  */
  CALL Predicate()  /*  Chomsky, Noam, "Aspects of the Theory of Syntax"  */
  t = t + 1     /*  24JUN1994:  For separation from any new human input.  */
  SAY "    Language():  Now done with Predicate()."
  SETCLIP('control', "ATTENTIVE")   /*  8APR1994:  No longer "THINKING".  */
  SETCLIP('response', "READY")  /*  7MAY1994:  Offer control to AudInPut. */
  mind = "OPEN"  /*  8APR1994:  A flag to permit calling of Sensorium().  */
  dex = 0  /*  26JUN1994:  Reset "dex" before it is used again.           */
  dup = 0   /*  7MAY1994:  Reset dup(licate) to test for external input.  */
  inpos = 1   /*  04MAY1994:  Prepare for initial word of input printout. */
  outpos = 1  /*  10MAY1994:  Prepare for initial word of output printout.*/
  /*  9NOV1994:  The upcoming "parse" flag is a kludge, a very temporary  */
  /*  mechanism to help Mind.rexx grasp firmly a subject noun-phrase to   */
  /*  be the subject of discourse during the generation of a sentence.    */
  parse = "ready"  /* 9NOV1994:  Rexxmind is "ready" to parse a sentence. */
RETURN             /*  (5APR1994) ...to the Main Body "DO FOREVER" loop.  */


Subject:
  SAY "Language():  Now selecting a concept to be subject...."
  subsearch = 1     /*  25NOV1994:  A flag for "NounPhrase()".  */
  CALL NounPhrase()
  subsearch = 0   /*  25NOV1994:  subject-search is completed.  */
RETURN                              /*  ...to the "Language()" function.  */


/*     4JUL1994:  Today we are taking the sequence of REXX code that was  */
/*  previously called "Subject()" and we are renaming it as "NounPhrase"  */
/*  so that the array of nouns may be called either from a newly declared */
/*  "Subject()" function or from a newly enlarged "Predicate()" function. */
/*     This seemingly slight change is actually a major development in    */
/*  the emergence of Mind.rexx, for several reasons.                      */
/*     Firstly, the full sequence of "Subject - Verb - Direct Object" is  */
/*  at the very core of human language, and everything else is merely     */
/*  enhancement and refinement.  Therefore Mind.rexx is now addressing    */
/*  the central issues of natural language.                               */
/*     Secondly, Mind.rexx is based on a theory of mind which claims      */
/*  that language-structures in the human brain flush out both subjects   */
/*  and direct objects from the same lexicon of nouns, and that momentary */
/*  differences in activation-levels cause different results to emerge.   */
/*     Thirdly, the full sequence of "noun - verb - noun" allows a        */
/*  knowledge base to develop amid the rich interconnections mediated     */
/*  (by verbs) among noun-concepts.  The stage is set for Mind.rexx to    */
/*  acquire knowledge and to display that knowledge in the performance    */
/*  of psychological experiments.                                         */
/*     16NOV1994:  Since we are now trying to establish a queryable       */
/*  knowledge-base ("KB") within the rexxmind, we need assurance that     */
/*  the "Language()" function will make only valid, logical, truthful     */
/*  utterances.  Today we pursue that goal by introducing a threshold     */
/*  activation level ("IF...augend < 10") below which Mind.rexx will not  */
/*  select a concept for inclusion within a sentence, but will instead    */
/*  re-invoke the "Associative()" and "Deep_structure()" functions in     */
/*  order to flush out a sufficiently active (dominant) concept, about    */
/*  which the rexxmind can make a valid statement based on knowledge      */
/*  rather than on random associations.  We expect "temporal proximity"   */
/*  to activate engrams of factual knowledge, and we expect restrictive   */
/*  thresholds to prevent the generation of nonsense-thoughts.            */
NounPhrase:         /*  Called from either "Subject()" or "Predicate()."  */
  augend = 0      /*  18APR1994:  Disengage "augend" from "Selective()".  */
  fibercount = n - 1
  now = t
  /*     11.OCT1994:  Today we begin limiting our searches backwards in   */
  /*  time by introducing the variable "nuper" (Latin for "recently"),    */
  /*  which will prevent Mind.rexx from wasting time in searching.        */
  nuper = 1  /*  11.OCT1994:  A default value for "nuper".  */
  IF t > 100 THEN nuper = t-100
  IF t > 1000 THEN nuper = t-300
  DO qn = fibercount TO 65 BY -1  /*  16.NOV1994:  qn for "query" n.      */
    DO npt = now TO nuper BY -1   /*  16.NOV1994:  n(oun)p(phrase)t(ime). */
      ng = ""
      /*  Next we try to weed out non-words and e.g. "FIBER.N.999".  */
      /*  16NOV1994:  There must be a better test than the length test.   */
      /*  21NOV1994:  Switching "np" and "nq" to "nfin" and "nfex".       */
      IF Length(fiber.qn.npt) > 11 THEN PARSE VAR fiber.qn.npt,
          fiber.qn. '.' nv '.' ng '.' nfin '.' nfex '.' rv '.' nt
      /*  26APR1994:  Identify the onset-tag "os" of an engram to be      */
      /*  activated and moved down through the auditory memory channel    */
      /*  for redeposition at the advancing front of consciousness.       */
      IF ng = "NOUN" & nv > augend THEN DO   /*  16NOV1994:  A speed-up.  */
        os = rv        /*  21NOV1994:  o(n)s(et) for use in "Reentry()".  */
        /*  28APR1994:  For "Oldconcept()", we latch onto fiber.n.        */
        dex = qn         /*  A pointer.  */
        /*  21NOV1994:  Because in "Fiberdamp()" we no longer break down  */
        /*  fiber.dex.z beyond its valence, he we must extract "nfex" as  */
        /*  the monadic "idea" which we will damp in "Ideadamp()".        */
        idea = nfex     /*  21NOV1994:  For use in calling "Ideadamp()".  */
        /*  21NOV1994:  We need the following diagnostic "hvt".           */
        hvt = npt /* 21NOV1994:  Highest valence time = noun phrase time. */
        /*  5APR1994:  A found high value becomes the new "augend".       */
        augend = nv
        END
    END
  IF fiber.qn. ~== "" THEN SAY "    NounPhrase():  At t = "hvt,
     ", highest valence of" fiber.qn. "= "nv"."
  IF qn = 65 & augend < 10 THEN DO
  SAY "     Augend value of" augend "is not high enough to be meaningful."
    qn = fibercount  /* 16NOV1994:  Prepare to restart the entire search. */
    augend = 0  /*  16NOV1994:  Reset.  */
    hvt = 0  /*  21NOV1994:  Reset.  */
    SAY  "   Calling Deep_structure() in search of a prevailing concept...."
    CALL Deep_structure()    /*  16NOV1994:  Necessary for dyn ---> val.  */
    END
  END
  CALL Reentry()  /*  26NOV1994:  Seems to belong before "TransferAct()". */
  IF subsearch = 1 THEN CALL TransferAct()  /* 25NOV1994:  Subjects only. */
  CALL Fiberdamp()  /*  21NOV1994:  Must also damp the "Reentry()" noun.  */
  bonmot = theta   /*  28APR1994:  The word currently flooding audition.  */
  SAY "           NounPhrase():  bonmot = " bonmot  /*  26NOV1994 diagnos */
  t = now + metron    /*  Advance "t" by length of the re-stored engram.  */
  metron = 0  /*  A reset for safety.  */
  SAY bonmot   /*  For the sake of non-Amiga REXX & non-speaking Amigas.  */
  voice = Open(mouth, "SPEAK:", 'w')    /*  8APR1994:  Prepare to speak.  */
  WRITELN(mouth, bonmot)                /*  8APR1994:  Speak word aloud.  */
  /*  13NOV1994:  The call to "Ideadamp()" has had to wait until after    */
  /*  the call to "Reentry()", a function which reactivates concepts,     */
  /*  but which now will still establish associative tags.                */
  IF idea ~= "" THEN CALL Ideadamp()  /*  21NOV1994:  "idea" from "nfex". */
  idea = ""  /*  13NOV1994:  Reset for safety.  */
  /*     5APR1994:  As Mind.rexx is more and more isolated from humans,   */
  /*  we use the following lines for printed hardcopy diagnostics.        */
  /*     4MAY1994:  Format to show "Human:" and "Robot:" utterances.      */
  IF hardcopy = "Y" THEN DO
     print = Open(labnote, "PRT:", 'w')
     /*  See Zamara and Sullivan, "Using ARexx on the Amiga", page 138.   */
     IF outpos = 1 THEN WRITECH(labnote, 'A'x)  /*  11MAY1994:  Linefeed. */
     IF outpos = 1 THEN WRITECH(labnote, offset || "Robot:  "|| bonmot)
     IF outpos ~= 1 THEN WRITECH(labnote, " "|| bonmot)
     outpos = outpos + 1
     END
bonmot = ""   /*  26NOV1994:  A reset lest "bonmot" interfere elsewhere.  */
RETURN   /*  To a "Subject()" or "Predicate()" function of "Language()".  */

/*     7APR1994:  Today in the following "Predicate()" function we have   */
/*  merged elements of Mind.rexx17NOV93A (posted to AmiNet on 3DEC1993)   */
/*  with the most current Mind.rexx work.                                 */
Predicate:
SAY " "  /*  24NOV1994:  A blank line for the screen.  */
SAY "Predicate():  Now calling Deep_structure()...."      /*  25NOV1994.  */
/*     25NOV1994:  Today we are dropping a call to "Associative()", where */
/*  too many random associations were occurring and were undermining our  */
/*  incipient knowledge-base ("KB").  Instead, we now call the function   */
/*  "Deep_structure()", where we expect time-bound activation-levels      */
/*  from "TransferAct()", having been added cumulatively to activation-   */
/*  levels already (uniformly) high on temproal nodes of a verb, to be    */
/*  transferred now en masse to the valence-flags of "fiber.n.t" verbs,   */
/*  so that not just any node of the verb, but a (nearly) particular      */
/*  time-node of the verb will receive enough activation to win           */
/*  selection as the verb to be spoken.  However, that outcome is a       */
/*  foregone conclusion, because the activation levels were set jointly   */
/*  by the choice of verb used in a query ("Horses eat what?") and by     */
/*  the lesser (but discriminating) activation sent forward during the    */
/*  "TransferAct()" function.                                             */
CALL Deep_structure() /* 25NOV1994: Switching from "Associative()" call.  */
top = 0           /*  28APR1994:  Start safely with "top" reset to zero.  */
stown = n         /*  7APR1994:  Stow "n" now so as to retrieve it soon.  */
fibercount = n - 1
nuper = 1
IF t > 100 THEN nuper = t-100
IF t > 1000 THEN nuper = t-300
SAY "    Predicate():  Searching lexicon for a verb."
/*  28.OCT.1994:  First 64 concepts reserved (for 64-bit Alpha CPU).      */
DO n = fibercount TO 65 BY -1  /*  28.OCT.1994:  New minimum of today.    */
    DO tpr = t TO nuper BY -1  /*  11.OCT1994:  Using "nuper" as cut-off. */
      IF Length(fiber.n.tpr) > 11 THEN PARSE VAR fiber.n.tpr,
        fiber.n. '.' pv '.' pg '.' pfin '.' pfex '.' rv '.' pt
      IF pg = "PRED" & pv > top THEN DO      /*  28.OCT.1994:  Speed up.  */
        top = pv   /*  21NOV1994:  Until even higher v(alence) is found.  */
        idea = pfex     /*  21NOV1994:  For use in calling "Ideadamp()".  */
        os = rv        /*  For use in "Reentry()".  */
        dex = n      /*  As in "Subject()".  */
        hvt = tpr  /*  25NOV1994:  For use in "TransferAct()".  */
        END
    END   /*  ...of loop that finds the (momentarily!) most active verb.  */
END    /*  ...of loop that examines concepts in search of all "PRED"s.    */
/*  21NOV1994:  From this line we are removing a "t(ime) = now" reset.    */
CALL Reentry()  /*  26NOV1994:  Seems to belong before TransferAct call.  */
/*     25NOV1994:  Here we call "TransferAct()" so that the verb-node     */
/*  can transfer some activation to a logically valid direct object       */
/*  before all recent nodes of the verb are deactivated in "Fiberdamp()". */
CALL TransferAct()  /*  25NOV1994:  Should this precede call to Reentry?  */
CALL Fiberdamp()    /*  21NOV1994:  Now AFTER "Reentry()", not before.    */
motjuste = theta  /*  28APR1994:  The word currently flooding audition.   */
t = t + metron  /*  21NOV1994:  Advance by length of re-stored engram.    */
metron = 0  /*  A reset for safety.  */
SAY motjuste  /*  For the sake of non-Amiga REXX & non-speaking Amigas.   */
voice = Open(mouth, "SPEAK:", 'w')  /*  As found on most older Amigas.    */
WRITELN(mouth, motjuste)   /*  The Amiga speaks the chosen verb aloud.    */
/*  13NOV1994:  "Ideadamp()" is called from "NounPhrase()" and from       */
/*  "Predicate()", to reduce to zero the dyn(amism) of any "monad.f.t"    */
/*  that has just found expression in a sentence of thought, thus         */
/*  letting other mindcore concepts rise in dyn(amism) until they also    */
/*  break into the syntactic line-up and coalesce into a thought.         */
IF idea ~= "" THEN CALL Ideadamp()   /*  21NOV1994:  "fdex" from above.   */
idea = ""  /*  13NOV1994:  Reset for safety.  */
/* The following lines will print output if "hardcopy" has been chosen.   */
IF hardcopy = "Y" THEN DO
  print = Open(labnote, "PRT:", 'w')
  WRITECH(labnote, 'D'x||'A'x)        /*  24JUN1994:  CR and linefeed.    */
  WRITELN(labnote, offset || "Robot:  "|| motjuste)
  WRITECH(labnote, 'D'x || 'A'x)  /*  24JUN1994:  Carriage-return, LF.    */
  outpos = outpos + 1    /*  24JUN1994:  Temporarily unnecessary line.    */
  END
n = stown  /*  Reset concept number "n" after cycling through concepts.   */
t = t + 1  /*  4JUL1994:  For time-gap between verb and direct object.    */
SAY " "            /*  24NOV1994:  A cosmetic blank line for the screen.  */
SAY "Predicate():  Now selecting a concept to be direct object."
dirobj = 1          /*  8NOV1994:  A flag to help find direct objects.    */
/*     8NOV1994:  We now call "Deep_structure()" in order to flush out    */
/*  either a normal direct object or one with a special form, as "me".    */
CALL Deep_structure() /* 8NOV1994: A fresh flush to find direct object.   */
CALL NounPhrase()  /*  4JUL1994:  Think the direct object of the verb.    */
dirobj = 0  /* 8NOV1994:  Turn off flag that flushed out direct object.   */
RETURN /* ...having found (& spoken +/- printed) the verb, to Language(). */

Reentry:
cata = 1  /*  23JUN1994:  A flag to show that "catamnesis" is"on".        */
remnesis = 1  /*  20JUN1994:  A test to monitor Sensorium() process.      */
SAY "      Reentry():  The recall-vector (onset-tag os) = " os
SAY "      t and grabt are at " t
SAY "      Reentry():  fiber.dex. from NOUN/PRED =" fiber.dex.
SAY "      REENTRY():  bonmot = " bonmot
utcata = dex  /*  23JUN1994:  An ultimate-tag for "Oldconcept()".         */
tre = os     /*  21OV1994:  t(ime of )r(e)e(ntry) = os from old trace.    */
SAY "      Re_entry():  audmem   = " audmem
SAY "      Re_entry():   Ph.os =" ph.os
cm = ""     /*  27APR1994:  c(ontinuation-)m(arker) starts as nothing.    */
eject = 0    /*  9MAY1994:  Initialize a value to escape from a loop.     */
mu = 0    /*  18JUN1994:  Initialize a m(oveable) u(ltimate-tag).         */
theta = "" /*  A word being fetched IAW Fish#411:Mind/NTJ.30.SEP.1977.    */
DO UNTIL cm = "N"      /*  Stop catamnesis at end of word being moved.    */
  SAY "        Re_entry():  Engram found, ph.t =" ph.t
  PARSE VAR ph.tre ph '.' panel  /*  Must PRECEDE "catagram" line.  */
  catagram = ph  /* The engram moving down to be a new engram. */
  PARSE VAR panel a '.' b '.' c '.' u '.' s '.' usw
  s = "+"
  SAY "        Re_entry():  ph.t =" ph.t
  tre = tre + 1            /*  Move down one moment within the engram.    */
  cm = c      /*  let any "N" pass to "cm" so as to escape loop.  */
  IF cm = "N" THEN series = ""    /*  25JUN1994, from 16JUN1994.  */
  IF cm = "N" THEN loaf = ""  /*  25JUN1994:  Anti-word-bunching. */
  IF cm = "N" THEN mu = u  /*  18JUN1994:  Moveable ultimate-tag. */
  metron = tre - os      /*  Measure the engram-length for safety.  */
  IF metron = 30 THEN LEAVE      /*  Loop-escape safety feature.  */
  theta = theta || catagram   /*  28APR1994:  String theta together.  */
  catagram = ""
  /*  29JUN1994:  The next line of executable code is an attempt to       */
  /*  prevent re-entry of "PHI" (PH + I) when a module of "Language()"    */
  /*  has flushed out no concept with a high valence and is therefore     */
  /*  trying to declare re-entry of a spurious "fiber.0" (dex = 0).       */
  IF dex = 0 THEN theta = "BLANK"
  SAY "      Reentry():  Final theta =" theta
  eject = eject + 1        /*  9MAY1994:  A way to escape from a loop.    */
  SAY "      Reentry():  eject =" eject,
    " (Looping stops if eject-value exceeds 10.)"
  IF eject > 10 THEN LEAVE
  END
/*  21NOV1994:  Now regular "t(ime)" is valid, not "tre" from above.      */
mind = "OPEN"      /*  26JUN1994:  So as to send in one "audmem = SP".    */
audmem = SP    /*  26JUN1994:  A space to precede each re-entered word.   */
CALL Sensorium()    /*  26JUN1994:  Send one blank space to Sensorium.    */
/*     26JUN1994:  The next line of executable code is an attempt         */
/*  to establish, within "Sensorium()", a firm onset-vector ("ov")        */
/*  for the word (metagram) about to be sent into "Sensorium()".          */
ovhold = t       /*  27JUN1994:  Dropping "+ 1" from "ovhold = t + 1".    */
/*  25MAY1994:  Manipulate, but do not destroy theta.                     */
metagram = theta                /*  Re-established on FRI.24.JUN.1994.    */
ovnew = t     /*  28JUN1994:  For forcing a correct onset-vector "ov".    */
DO WHILE metagram ~= ""  /*  Z. & S. page 155.  */
  mind = "OPEN"    /*  For the sake of test at start of "Sensorium()".    */
  letter = SUBSTR(metagram, 1, 1)    /*  21JUN1994:  Help from S.B.R.     */
  metagram = SUBSTR(metagram, 2)     /*  Hawes, ARexx manual, page 65.    */
  audmem = letter
  SAY "  In reentry, about to call Sensorium(), audmem = letter =" audmem
  /*  21JUN1994:  Next sequence is a hunt for the dup-letter bug.         */
  CALL Sensorium()    /*  To cause  "reentry" of each quasi-phoneme.      */
  SAY "        Reentry():  audmem =" audmem "; metagram = " metagram
  audmem = ""
  END
/*  25MAY1994:  The following routine is designed to send a SPACE         */
/*  (SP) break into "Sensorium()" during re-entry, at the end of          */
/*  each word being fetched by the "Language()" system, so that           */
/*  "Comparator()" and "Retro()" will automatically end the word.         */
audmem = SP
mind = "OPEN"
CALL Sensorium()
mind = "SHUT"  /*  25MAY1994.  */
audmem = ""
os = 0  /*  Reset for safety now at end of loop.  */
cata = 0          /*  23JUN1994:  A flag that "catamnesis" is now "off".  */
RETURN             /*  ...to a syntax function vectoring towards recall.  */

/*     7NOV1994:  "Fiberdamp()" lowers (damps) the activation-level of a  */
/*  concept that has just found expression  the "Language()" function.    */
/*  Otherwise, Mind.rexx might repeat the same word over and over.        */
/*  Today we are gearing up to fine-tune an associative matrix of         */
/*  monad.f and fiber.n concepts firing out mmessages in a delicate       */
/*  equilibrium.  Over time, the matrix of concepts constitutes a         */
/*  knowledge base ("KB"), about which Mind.rexx should eventually be     */
/*  able to answer questions.                                             */
/*     7NOV1994:  Let's try starting from t, not from shorttermt.  */
Fiberdamp:
  dv = 0           /*  4JUL1994:  Start with d(amper-)v(alence) at zero.  */
  yester = t - 100   /*  7NOV1994:  An arbitrary range of "yester-time".  */
  IF yester < 1 THEN yester = 1          /*  Avoid negative-time points.  */
  /*  4.OCT.1994:  "shorttermt" has been introduced in the "Main Body".   */
  DO z = t TO yester BY -1
  PARSE VAR fiber.dex.z fiber.dex. '.' node
    IF Length(node) > 5 THEN DO
    PARSE VAR node v '.' dreg  /*  15NOV1994:  Consolidated for speed-up. */
    SAY "Fiberdamp():  Reducing valence "v" of "fiber.dex." to zero",
      " at time = " z"."
    node = "0"||"."||dreg  /* 15NOV1994:  1 parse, 1 cat for more speed?  */
    fiber.dex.z = fiber.dex. || "." || node
    END
  END
RETURN             /*  7NOV1994:  To "NounPhrase()" or to "Predicate()".  */

/*     12NOV1994:  "Ideadamp()" is meant to seize any deep concept being  */
/*  expressed verbally and to reduce the dyn(amism) of that "monad.f.t"   */
/*  concept to zero, so that other concepts may surface in the rexxmind   */
/*  as the momentarily dominant concept.                                  */
Ideadamp:
tsoon = t + 1     /*  13NOV1994:  Make sure search includes the present.  */
palai = t - 60  /*  12NOV1994:  Change this value ad libitum utile.  */
  DO chr = tsoon TO palai BY -1    /*  12NOV1994:  chr(onos) for "time".  */
  PARSE VAR monad.idea.chr monad.idea. '.' xdyn '.' etc
  IF xdyn > 0 THEN DO
    SAY "  Ideadamp:  Changing dyn of "monad.idea." at t="chr,
      "from "xdyn" to zero."
    monad.idea.chr = monad.idea.||'.'||"0"||'.'||etc
    END
  END
  etc = ""  /*  14NOV1994:  Reset for safety.  */
RETURN            /*  13NOV1994:  To "NounPhrase()" or to "Predicate()".  */

/*     21APR1994:  "Emotion()" is not yet implemented, but is shown here  */
/*  for various obvious reasons:  challenge to mindmakers; indication of  */
/*  where emotion might fit; claim that our theory accommodates emotion.  */
Emotion:
RETURN  /*  To the Main Body "Mindgrid" that calls each function of mind. */

/*     21APR1994:  "Volition()" is placed here very carefully after       */
/*  "Language()" and "Emotion()", but before "Motorium()", to indicate    */
/*  that although emotion may influence and color the will, language, by  */
/*  mediating the logical tension among concepts, declares not absolute   */
/*  truth but the best available verisimilitude  -  which the mind then   */
/*  interprets as volition, or propositions of the will.  (For theory,    */
/*  please see Amiga Library "Fish" Disk No. 411:Mind/NTJ.02.OCT.1977.)   */
/*     We have not yet implemented "Volition()", but our will to do so    */
/*  is strong and our theory of mind is also a theory of the will.        */
Volition:
RETURN  /*  To the Mindgrid mimicking functions of the cerebral cortex.   */

/*     21APR1994:  "Motorium()" is a grand challenge for roboticists.     */
/*  If you attach a robot with sensors to Mind.rexx, please be sure to    */
/*  code within "Sensorium()" a separate memory channel for each sense.   */
/*  (See Fish #411:Mind/NTJ.04.APR.1979 on automata with exotic senses.)  */
/*     26OCT1994:  The three-level Mind.rexx has "monad.f" motor tags.    */
Motorium:
RETURN  /*  To the Mindgrid serving as the brains of any attached robot.  */
/*     Current tasks in the Mind.rexx programming:                        */
/*            [ ] 28MAR1994:  Ensure recognition only w. ultimate-tags.   */
/*  31MAR1994 [x] 28MAR1994:  Switch to input via the Clip List.          */
/*  21MAY1994 [x] 28MAR1994:  Code a "damper" of activation levels.       */
/*            [ ] 28MAR1994:  Make Mind.rexx non-deterministic.           */
/*  27APR1994 [x] 28MAR1994:  Code activation of words by concept-fiber.  */
/*  20APR1994 [x] 05APR1994:  Code saving of session as a mindset-file.   */
/*            [ ] 20APR1994:  Code re-loading of saved Mind.rexx files.   */
/*  29APR1994 [x] 21APR1994:  Achieve the "quickening" of Mind.rexx AI.   */
/*            [ ] 24APR1994:  Implement the Vulcan mindmeld.              */
/*  21JUN1994 [x] 24MAY1994:  Demonstrate Gerald Edelman's "re-entry".    */
/*  04JUL1994 [x] 04JUL1994:  Insert code for direct objects of verbs.    */
/*  26NOV1994 [x] 09NOV1994:  Create a queryable knowledge base ("KB").   */
/*  14NOV1994 [x] 12NOV1994:  Shift activation-flags forward for damping. */
/*  26NOV1994 [x] 14NOV1994:  Achieve conformance of statements with KB.  */
/*            [ ] 26NOV1994:  Introduce "what?" in KB query-sentences.    */
/*            [ ] 26NOV1994:  Code choice of Chomskyan transformations.   */
/*            [ ] 26NOV1994:  Implement the ("not") concept of negation.  */
/*            [ ] 26NOV1994:  Make pronouns carry antecedent-tags.        */
/*            [ ] 26NOV1994:  Devise implementation of concept of "why?". */
/*            [ ] 26NOV1994:  See Mind.rexx ported to a non-Amiga REXX.   */
