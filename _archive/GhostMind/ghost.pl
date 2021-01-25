#!/usr/bin/perl
use strict;    # PERL by Example (2015) p. 77
use warnings;  # PERL by Example (2015) p. 85
use Term::ReadKey;    # 2017-03-24: Pearl Black Book, page 543
# use Encode; # 2016feb16: http://perldoc.perl.org/perlunitut.html
# use utf8;   # 2016feb16: for Cyrillic Russian characters
# use feature "unicode_strings"; # 2016feb16: Perl_Programming/Unicode_UTF-8
# binmode STDIN, ":encoding(UTF-8)";  # 2016feb16
# ghost327.pl being coded on 2019-11-04 or later.
# http://ai.neocities.org/ghost.txt includes diagnostic messages for mind-maintainers.
# http://ai.neocities.org/perlmind.txt is commented code without diagnostics.
# Please host the Ghost Perl AGI and install it for other persons.
# http://doc.perl6.org/language/variables
# http://ai.neocities.org/var.html -- Table of Variables in Perl AGI
our $. = 0;          # 2016jan14: line counter variable; PbyX 299
our $_ = " ";        # 2016jan10: hidden variable; P_by_Ex p. 301
our $abc = "";       # AudBuffer() transfer character;
our $act = 0;        # 2016jan16: quasi-neuronal activation-level
our $actpsi = 0;     # 2016apr11: psi from which activation is to be spread
# our $adjcon = 0;     # 2019-03-02: insert-adjective condition-flag
our $adverbact = 0;  # 2019-03-02: highest level of activation on any adverb.
our $age = 0;        # 2015apr26: Temporary age for loop-counting.
our $anset = 0;      # 2017-12-12: Set "an" before a vowel at start of noun.
our $atcd = 0;       # 2019-03-02: "antecedent" for EnPronoun()
our $attn = 0;       # 2017mar23: AudInput inner loop counter.
our $aud = " ";      # 2016jan28: explicit package from @ear array
our $audbase = 0;    # 2016jan27: recall-vector for VerbGen()
our $audbeg = 0;     # 2016jan17: auditory-beginning tag for start of word.
our $audjuste = 0;   # 2016feb12: NounPhrase motjuste aud to Speech() module
our $audnew = 0;     # 2016jan17: holds onset-tag while rest of word comes in.
our $audnum = 0;     # 2018-06-26: de-globalizing the "num" variable;
our $audpsi = 0;     # 2016feb12: concept number of word in @ear array
our $audrec = 0;     # 2016jan23: auditory recognition concept-number
our $audstop = 0;    # 2017-03-31: flag to stop Speech() after one word
our $audrv = 0;      # 2016feb12: auditory recall-vector for Speech()
our $audrun = 1;     # 2016jan26: counter of loops through AudRecog()
our $auxverb = 0;    # 2018-12-10: such as 800=BE; 818=DO; or modal verb;
our $b1 = "";        # 2019-06-10: for OutBuffer();
our $b2 = "";        # 2019-06-10: for OutBuffer();
our $b3 = "";        # 2019-06-10: for OutBuffer();
our $b4 = "";        # 2019-06-10: for OutBuffer();
our $b5 = "";        # 2019-06-10: for OutBuffer();
our $b6 = "";        # 2019-06-10: for OutBuffer();
our $b7 = "";        # 2019-06-10: for OutBuffer();
our $b8 = "";        # 2019-06-10: for OutBuffer();
our $b9 = "";        # 2019-06-10: for OutBuffer();
our $b10 = "";       # 2016apr02: for OutBuffer();
our $b11 = "";       # 2016apr02: for OutBuffer();
our $b12 = "";       # 2016apr02: for OutBuffer();
our $b13 = "";       # 2016apr02: for OutBuffer();
our $b14 = "";       # 2016apr02: for OutBuffer();
our $b15 = "";       # 2016apr02: for OutBuffer();
our $b16 = "";       # 2016may21: http://ai.neocities.org/var.html#b16
our $becon = 0;      # 2018-06-26: detect be-verb for InFerence()
our $beep = 0;       # 2016apr29: flag for Motorium() to create a beep.
our $bias = 5;       # 2016feb10: EnParser; NewConcept: expected POS
our $birth = localtime($^T);  #2016apr21: PERL Black Book p. 444
our $c1 = "";        # 2019-06-10: http://ai.neocities.org/var.html#c1
our $c2 = "";        # 2019-06-10: for AudBuffer();
our $c3 = "";        # 2019-06-10: for AudBuffer();
our $c4 = "";        # 2019-06-10: for AudBuffer();
our $c5 = "";        # 2019-06-10: for AudBuffer();
our $c6 = "";        # 2019-06-10: for AudBuffer();
our $c7 = "";        # 2019-06-10: for AudBuffer();
our $c8 = "";        # 2019-06-10: for AudBuffer();
our $c9 = "";        # 2019-06-10: for AudBuffer();
our $c10 = "";       # 2016apr02: for AudBuffer();
our $c11 = "";       # 2016apr02: for AudBuffer();
our $c12 = "";       # 2016apr02: for AudBuffer();
our $c13 = "";       # 2016apr02: for AudBuffer();
our $c14 = "";       # 2016apr02: for AudBuffer();
our $c15 = "";       # 2016apr02: for AudBuffer();
our $c16 = "";       # 2016apr02: for AudBuffer();
our $c17 = "";       # 2016apr03: for AudBuffer() space
our $catiobj = 0;    # 2019-01-28: concat-indirect-object for ConJoin() "AND".
our $catdobj = 0;    # 2019-01-28: concat-direct-object for ConJoin() "AND".
our $catsubj = 0;    # 2019-01-28: concat-subject for ConJoin() "AND".
our $catverb = 0;    # 2019-01-28: concat-verb for ConJoin() "AND".
our $chaincon = 0;   # 2016apr15: chain-of-thought condition-flag
our $char = " ";     # 2016jan12: For use with getc in FileInput()
# our $cns = 4096;     # 2016apr19: size of central nervous syste
our $cns = 5120;     # 2018-12-11: expanded size of central nervous system
our $coda = 128;     # 2017nov27: memory recycled in ReJuvenate()
our $conj = 0;       # 2017-11-28: conjunction for use in ConJoin() module
our $dba = 0;        # 2016jan16: doing-business-as noun-case or verb-person
our $defact = 0;     # 2015apr06: default activation for NounPhrase()
our $defcon = 5;     # 2016jan21: defense condition
our $dft = 0;        # 2019-11-03: a "default" in connection with TacRecog()
our $dirobj = 0;     # 2016mar29: flag indicates seeking for a direct object
our $doa = 0;        # 2017mar25: flag for exiting from AudInput loop
our $dob = 0;        # 2017mar30: date-of-birth to remain fixed over each run.
our $dobseq = 0;     # 2018-06-26:  for transfer within InFerence()
our $dunnocon = 0;   # 2017-11-25: condition of "I-don't-know" for queries.
our $endpho = 0;     # 2017-04-30: to track final character of word for $num
our $engov = 0;      # 2018-09-19: ENglish GOverning flag for human language code.
our $eot = 0;        # 2016feb01: end-of-transmission for end of input
our $etc = 0;        # 2019-03-02: number of simultaneously active ideas for ConJoin()
our $eureka = 0;     # 2018-11-04: initialized value for use in until-loop
our $finlen = 0;     # 2017-12-26: fin(al) len(gth) or end-of-word for AudRecog
our $finpsi = 0;     # 2017-06-28: carry-over end-psi during 32-SPACE or 13-CR
our $foom = 0;       # 2018-09-03: arbitrary trigger for invoking the Spawn() moduleu
our $fyi = 0;        # 2019-11-04: 1 Normal; 2 Transcript; 3 Tutorial; 4 Diagnostic
# our $fyi = 4;        # 2019-10-30: 1 Normal; 2 Transcript; 3 Tutorial; 4 Diagnostic
# our $gapcon = 0;   # 2017mar29: for AudInput() to count gaps of no input.
our $gapcon = 30;    # 2017-04-10: for AudInput() to count down gaps of no input.
# our $gapcon = 90;  # 2017-06-18: slow down input while coding for Russian,
our $gencon = 0;     # 2016apr02: status-con flag when calling VerbGen()
our $hap = 0;        # 2019-11-02: a "haptic" sensation of touch for TacRecog()
our $haptac = 0;     # 2019-11-03: for transfer from TacRecog() to EnVerbPhrase()
our $hear = 0;       # 2017mar23: AudInput outer loop counter.
# our $hlc = 3;        # 2019-06-05: TEST 3=ru -- start with Ru at end of MindBoot
our $hlc = 1;        # 2018-09-28: English; to be set at end of MindBoot()
our $holdnum = 0;    # 2018-06-26: transfer from subject to verb;
our $homo = "";      # 2017mar25: for HCI what the Homo Sapiens has input.
our $ictus = 0;      # 2017-11-29: testable activation-level for sake of ConJoin
our $idea = " ";     # 2016apr09: for re-entry of AI thought back into the AI.
our $impetus = 0;    # 2017sep20: tentatively a level of curiosity and a trigger
our $infincon = 0;   # 2018-06-26: infinitive condition flag;
our $inft = 0;       # 2018-06-26: inference-time for AskUser()
our $inhibcon = 0;   # 2016apr17: flag for neural inhibition
our $iob = 0;        # 2016mar26: indirect-object tag for @psy concept array
our $isolation = 0;  # 2018-10-08: counter to trigger "TEACH ME SOMETHING"
our $jrt = 0;        # 2016apr18: ReJuvenate() "junior time" for memories moved
our $jux = 0;        # 2016jan20: jux(taposed) concept in @psy array.
our $k = 0;          # 2016mar15: k(knowledge) element from @psy concept array
our $kbcon = 0;      # 2018-06-26: flag for awaiting a yes-or-no answer.
our $kbzap = 0;      # 2018-06-26: hold 432=YES or 404=NO for KbRetro()
our $krt = 0;        # 2017-03-29: knowledge representation time before thinking.
our $lastpho = "";   # 2017-03-31: to avoid extra "S" on verbs
our $len = 0;        # 2016jan27: length, for avoiding input non-words
our $line = 0;   # 2017-03-18 TEST; REMOVE
our $mfn = 0;        # 2016jan16: masculine-feminine-neuter gender flag.
our $midway = 0;     # 2016jan23: limit for searching backwards in memory
our $mjact = 0;      # 2016jun18: motjuste-activation for defaulting to 701=I
our $monopsi = 0;    # 2016jan27: For use in AudRecog() module
our $moot = 0;       # 2017sep18: flag to prevent associations during input queries.
our $morphpsi = 0;   # 2016jan27: "for audRecog recognition of morphemes"
our $motjuste = 0;   # 2016feb12: "best word for inclusion in a thought"
our $mri = 0;        # 2019-08-10: time of most-recent-instantiation - for back-tagging.
our $msg = "";       # 2017mar23: $msg is for "message" of input.
our $mtx = 0;        # 2017mar21: machine-translation xfer tag for flag-panel.
our $negjux = 0;     # 2017-06-30: global for English and Russian.
# our $num = 0;        # 2016jan16: number-flag for grammatical number.
our $node = 0;       # 2016jan27: "split" @psy array row into nodes
our $nounlock = 0;   # 2016apr07: for a verb to lock onto a seq-noun
our $nphrnum = 0;    # 2016apr02: grammatical number of noun-phrase
our $nphrpos = 0;    # 2016apr07: for testing during EnThink() process
our $nucon = 0;      # 2017sep22: flag to indicate a new concept for SpreadAct()
our $num = 0;        # 2016jan16: number-flag for grammatical number.
our $numsubj = 0;    # 2018-06-26: for number of subject;
our $nxr = " ";      # 2016jan26: for AudRecog dealing with next memory row
our $nxt = 0;        # 2016feb03: number incremented for each new concept
our $objprep = 0;    # 2018-11-01: object of a preposition; for EnPrep()
our $oldpsi = 0;     # 2016jan30: used in OldConcept to de-globalize "psi"
our $onset = 0;      # 2016jan16: onset-tag for use as recall-vector.
our $output = " ";   # 2016feb17: output string as in JavaScript AiMind.html
our $PAL = 1;        # 2019-10-28: Permissive Action Link for AudBuffer and OutBuffer
our $pho = "";       # 2017-03-29: $pho is for a "phoneme" or character of input.
our $phodex = 0;     # 2016apr02: pho-index for AudBuffer()
our $pos = 5;  #10jun2017: 1=adj 2=adv 3=conj 4=interj 5=noun 6=prep 7=pron 8=verb
our $pov = 2;        # 2017-03-30: point-of-view: 1=self; 2=dual; 3=alien.
our $prc = 0;        # 2016jan26: provisional recognition in AudRecog()
our $prclen = 0;     # 2016JUL01: lenth of stem when $prc is declared.
our $pre = 0;        # 2016jan20: pre(vious) associated @psy concept.
our $prednom = 0;    # 2018-06-26: predicate nominative for InFerence.
our $prejux = 0;     # 2016jun17: previous $jux to carry NOT to verb
our $prep = 0;       # 2018-11-01: preposition identifier for EnPrep()
our $prepcon = 0;    # 2016mar19: prepositional condition-flag for parsing.
our $prepgen = 0;    # 2016mar30: urgency to generate a prepositional phrase.
our $prepsi = 0;     # 2019-03-30: identifier of "pre" concept for activation to spread to.
our $prevpsi = 0;    # 2017sep10: for InStantiate to cancel imputed Russian BeVerb
our $prevtag = 0;    # 2016jun18: may need to be global for InStantiate()?
our $prsn = 0;       # 2016apr02: 1st, 2nd, 3rd person of verb-forms.
our $psi = 1;        # 2016jan19: variable for elements of @psy array
our $psibase = 0;    # 2016jan27: "winning psibase with winning actbase"
our $putnum = 0;     # 2018-06-26: putative num(ber) for subj-verb agreement;
our $px1 = 0;        # 2019-08-11: preposition-transfer carrier for NLP generation.
our $px2 = 0;        # 2019-08-11: preposition-transfer carrier for NLP generation.
our $px3 = 0;        # 2019-08-11: preposition-transfer carrier for NLP generation.
our $quapsi = 0;     # 2016jun19: last input concept by which call to SpreadAct()
our $qucon = 0;      # 2017sep17: query-condition for dealing with query-words.
our $quobj = 0;      # 2018-06-26: query-object for yes-or-no AskUser() questions.
our $quobjaud = 0;   # 2018-06-26: auditory recall-tag for AskUser();
our $qusnum = 0;     # 2018-06-26: query-subject-number for AskUser()
our $qusub = 0;      # 2017sep22: internal provisional query-subject
our $quverb = 0;     # 2018-06-26: query-verb for yes-or-no AskUser() questions.
our $qv1psi = 0;     # 2017sep03: concept for SpreadAct to seek as a subject
our $qv2num = 0;     # 2017oct22: num(ber) of a verb in a who+verb+dir.obj response.
our $qv2psi = 0;     # 2017sep03: concept for SpreadAct to seek as a verb
our $qv3psi = 0;     # 2017sep03: concept for SpreadAct to seek as ind. obj.
our $qv4psi = 0;     # 2017sep03: concept for SpreadAct to seek as dir. obj.
our $qvdocon = 0;    # 2017sep26: query-condition for who+verb+direct-object.
our $qviocon = 0;    # 2017sep26: query-condition for who+verb+indirect-object.
our $recnum = 0;     # 2016jan27: "recognized number of a recognized word"
our $recon = 0;      # AI4U: newConceptl English; Ask(): incentive to question.
our $reentcon = 0;   # 2017mar26: reentrant condition flag; TEST
our $rjc = 0;        # 2016apr18: counter of rejuvenation cycles
our $rsvp = 0;       # 2017mar24: TEMPORARY TEST of AudListen()
our $rsvplock = 0;   # 2017oct24: special verblock for query-responses.
our $rugov = 0;      # 2018-09-19: RUssian GOverning flag for human language code.
our $rv = 0;         # 2016jan22: recall-vector for auditory memory.
our $seq = 0;        # 2016jan20: subSEQuent @psy concept in an idea.
our $seqdob = 0;     # 2018-06-26: for direct object transfer within InFerence()
our $seqneed = 0;    # 2016mar03: noun/pronoun or verb needed as a "seq"; 2016mar03
our $seqpsi = 0;     # 2016apr11: concept to which activation should be spread.
our $seqrvx = 0;     # 2018-06-26: for $rvx transfer within InFerence()
our $seqtkb = 0;     # 2018-06-26: for transfer during InFerence;
our $seqverb = 0;    # 2018-06-26: interstitial carrier for InFerence().
our $snu = 0;        # 2016apr02: subject-number as parameter for verb-selection.
our $spacegap = 0;   # 2017-03-31: to add gap of one space in Speech
our $spt = 0;        # 2016jan23: blank space time before start of a word
our $stemgap = 0;    # 2016jan27: "for avoiding false audRecog stems"
our $subject = 0;    # 2016mar18: subject for parser module
our $subjectflag = 0; # 2016mar29: initial default for NounPhrase
our $subjnom = 0;    # 2018-06-26: subject-nominative for InFerence()
our $subjnum = 0;    # 2016apr07: for agreement with predicate nominative;
our $subjpre = 0;    # 2016mar19: subject-$pre to be held for verb in parsing.
our $subjpsi = 0;    # 2016apr02: parameter to govern person of verb-forms
our $sublen = 0;     # 2016jan27: "length of audRecog subpsi word-stem"
our $subpsi = 0;     # 2016jan27: "for AudRecog of sub-component wordstems"
our $subrec1 = 0;    # 2017oct20: for morphemes like "un" in "undisclosed".
our $subrec2 = 0;    # 2017oct20: for morphemes like "dis" in "disbelief".
our $svo1 = 0;       # 2017-04-11: subject -- item #1 in subject-verb-object
our $svo2 = 0;       # 2017-04-11: verb -- item #2 in subject-verb-object
our $svo3 = 0;       # 2017-04-11: indir. obj. -- item #3 in subject-verb-object
our $svo4 = 0;       # 2017-04-11: dir. obj. -- item #4 in subject-verb-object
our $t = 0;          # 2015may02: Lifetime experiential time "$t"
our $t2s = 0;        # 2015apr26: auditory text-to-speech index
our $taccon = 0;     # 2019-11-02: condition-flag for tactile sensation in TacRecog()
our $tai = 0;        # 2016apr14: time of artificial intelligence diagnostics
our $tbev = 0;       # 2017may29: time of be-verb for use with negation
our $tcj = 0;        # 2019-08-01: conceptual flag-panel time-of-conjunction.
our $tdj = 0;        # 2019-08-01: conceptual flag-panel time-of-adjective.
our $tdo = 0;        # 2016mar21: time-of-direct-object for a parser module.
our $tdt = 0;        # 2019-08-01: time-of-dative conceptual flag-panel indirect-object.
our $tdv = 0;        # 2019-08-01: conceptual flag-panel time-of-adverb.
our $text = "";      # 2017-12-21: input text to be concatenated with $pho
our $tgn = 0;        # 2019-08-01: time-of-genitive for use in RuParser() module.
our $tia = 0;        # 2019-08-01: conceptual flag-panel time-of-instrumental/ablative.
our $tio = 0;        # 2016mar21: time-of-indirect-object for parser module.
our $tkb = 0;        # 2016jan20: time-in-knowledge-base of an idea.
our $tkbo = 0;       # 2018-06-26: time of retroactive KB direct-object adjustment.
our $tkbprep = 0;    # 2019-10-28: time of object of preposition for EnPrep()
our $tkbv = 0;       # 2018-06-26: time of retroactive KB verb adjustment.
our $tkbn = 0;       # 2018-06-26: time of retroactive KB noun adjustment.
our $tnpr = 0;       # 2019-10-17: time-of-noun-preposition for retrieval
our $topic = 0;      # 2016apr07: @psy topic for a question to be asked
our $tpp = 0;        # 2016mar19: time-of-preposition for parsing.
our $tpr = 0;        # 2019-08-01: conceptual flag-panel time-of-preposition.
our $tpu = 0;        # 2018-06-26: time-pen-ultimate before current I/O
our $trigger = 0;    # 2016apr29: a trigger for Volition() to call Motorium()
our $tru = 0;        # 2017mar21: tru(th)-value tag for conceptual flag-panel
our $tsj = 0;        # 2016mar18: time-of-subject for parsing.
our $tseln = 0;      # 2016mar29: time of selection of noun.
our $tselo = 0;      # 2018-11-04: time of selection of object
our $tselp = 0;      # 2018-11-01: time of selection of preposiiton; for EnPrep()
our $tsels = 0;      # 2019-06-05: t-sel-subj must be global for English and Russian
our $tselv = 0;      # 2016apr13: time of selection of verb (for neural inhibition)
our $tsn = 0;        # 2016mar15: time of input as $seqneed time for InStantiate()
our $tult = 0;       # 2016jan18: t penultimate, or time-minus-one
our $tvb = 0;        # 2016mar21: time-of-verb for parsing
our $tvpr = 0;       # 2019-10-17: time-of-verb-preposition for retrieval
our $unk = " ";      # 2016feb20: all-putpose $unk for troubeshooting
our $upc = 0;        # 2019-01-22: universal product code for recognition by barcode
our $us1 = 0;        # 2017dec12: http://ai.neocities.org/var.html#us1
our $us2 = 0;        # 2017dec12: "us2" for THE UpStream noun number two.
our $us3 = 0;        # 2017dec12: "us3" for THE UpStream noun number three.
our $us4 = 0;        # 2017dec12: for $psi # of THE noun mentioned upstream.
our $us5 = 0;        # 2017dec12: for $psi # of THE noun during EnArticle().
our $us6 = 0;        # 2017dec12: for $psi # of THE noun on a rotating basis.
our $us7 = 0;        # 2017dec12: for $psi of an AI keeping seven items in mind.
our $usn = 0;        # 2018-09-03: rotation-number for us1-us7 EnArticle() concepts.
our $usx = 0;        # 2018-09-03: transfer-variable for us1-us7 upstream variables.
our $utf8char = " "; # 2016feb16: wiki/Perl_Programming/Unicode_UTF-8
our $vault = 4138;   # 2019-11-04: size of MindBoot as revealed by diagnostic code.
our $verbcon = 0;    # 2016mar21: verb-condition for seeking (in)direct objects.
our $verblock = 0;   # 2016apr07: for subject-noun to lock onto seq-verb;
our $verbprsn = 0;   # 2018-06-26: reverting to zero for infinitive forms;
our $verbpsi = 0;    # 2016apr07: $psi concept-number of verb in the @psy array
our $vphraud = 0;    # 2016apr02: holds aud-fetch of verb-form for Speech() module
our $vrsn="ghost327"; # 2019-11-04: version identifier for sake of minddata.txt log.
our $wasvcon = 0;    # 2019-03-02: query-condition for what-AUXILIARY-SUBJECT-VERB
our $whatcon = 0;    # 2017-11-27: flag for condition of answering a what-query
our $wherecon = 0;   # 2018-11-01: flag for condition of answering a where-query
our $whocon = 0;     # 2018-09-29: flag for condition of answering a who-query
our $yncon = 0;      # 2018-06-26: a statuscon to trigger a yes-or-no query.
our $ynverb = 0;     # 2018-06-26:  yes-or-no verb for AskUser.
our $zhdi = 0;       # 2017mar25: Russian word "wait" for use in delay-loop.
our @ear = " ";      # 2016jan28: new name for auditory memory array.
our @psy = " ";      # 2016jan19: conceptual array renamed as @psy
sub AudBuffer;   # 2016mar26: for transfer of words to OutBuffer().
sub AudInput;    # 2016mar26: auditory input module for keyboard input.
sub AudMem;      # 2016mar26: auditory memory module for storing engrams.
sub AudRecog;    # 2016jan23 auditory recognition module.
sub Emotion;     # 2016mar26: for stub of physiological emotion.
sub EnNounPhrase;  # 2016feb18: for thinking with nouns and pronouns.
sub EnThink;     # 2016jan24: Selected dynamically by $hlc flag.
sub EnVerbPhrase;  # 2016feb17: for verbs to be used in a thought.
sub FileInput;   # 2016jan10 PbEx5e p. 351: Forward declaration.
sub InStantiate; # 2016jan19 PbEx5e p. 351: Forward declaration.
sub KbLoad;      # 2016jan22 PbEx5e p. 351: Forward declaration.
sub MindBoot;    # 2016jan23 PbEx5e p. 351: Forward declaration.
sub motorium;    # 2015apr25 PbEx5e p. 351: Forward declaration.
sub NewConcept;  # 2015may28 PbEx5e p. 351: Forward declaration.
sub NounPhrase;  # 2016feb11: for nouns and pronouns in a thought.
sub OldConcept;  # 2016jan14 PbEx5e p. 351: Forward declaration.
sub RuAudMem;    # 2017jun17: auditory memory module for storing engrams.
sub RuThink;     # 2016jan24: Selected dynamically by $hlc flag.
sub Sensorium;   # 2016mar26: sensory input module
sub TabulaRasa;  # 2016jan25: Called from MainLoop as in MindForth
sub VisRecog;    # 2015apr26 PbEx5e p. 351: Forward declaration.
sub volition;    # 2015apr24 PbEx5e p. 351: Forward declaration.

sub TabulaRasa() {  # 2016jan25: Establish size and emptiness of CNS.
  print "Size of AI memory is $cns human language code = $hlc \n"; #2016feb16
  my $trc = 0;  # 2015apr2015 $trc is "tabula rasa counter".
  until ($trc == $cns) {  # 2015apr26 PbEx5e p. 193 "Loops".
    $psy[$trc] = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"; # 2019-08-01
    $ear[$trc] = " ,0,0";  # 2016jan28: initialize three columns.
    $trc++;  # 2015apr26: Increment tabula-rasa-counter $trc.
  }  # End of loop filling auditory memory with blank engrams.
}  # 2016feb11: End of TabulaRasa "clean slate" sequence.


sub PsiDecay() {  # http://ai.neocities.org/PsiDecay.html
  for (my $i=$t; $i>$midway; $i--) {  # 2016apr13: move backwards in time.
    my @k=split(',',$psy[$i]);  # 2016apr13: inspect @psy flag-panel
    if ($k[3] > 3) { # 2019-09-27: leave room between status quo and zero.
      $k[3] = ($k[3] - 3);   # 2019-09-27: approach zero
    } # 2017-06-24: end of test
    if ($k[3] < 0) {  # 2017-06-24:
      $k[3] = ($k[3] + 2);   # 2017-06-24: rapid recovery.
    }  # 2017-06-24: end of test
    $psy[$i]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"  # 2018-07-01: insertion.
    . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
    . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01: expanded panel.
  }  # 2016apr13: End of (for loop) moving backwards in time
}  # 2019-09-27: PsiDecay() returns to EnThink() etc.


sub AudDamp() {  # 2016feb03: "deactivate auditory engrams"
  for (my $i=$midway; $i<$cns; $i++) {  # 2016feb03:
    my @aud=split(',',$ear[$i]);  # 2016feb03: Examine the @ear array.
     $ear[$i] = "$aud[0],0,$aud[2]";  # 2016feb03: Reset act to zero.
  }  # 2016feb03: end of forwards sweep through auditory memory.
}  # 2016feb03: End of AudDamp(); return to input module.


sub KbLoad() {  # 2016jan23: load MindBoot knowledge-base bootstrap.
  $psy[$t] = "$tru,$psi,$hlc,$act,$mtx,$jux,$pos,"
  . "$dba,$num,$mfn,$pre,$seq,$tgn,$tdt,"
  . "$tkb,$tia,$tcj,$tdj,$tdv,$tpr,$rv";  # 2019-08-01: expanding conceptual flag-panel.
  $tru=0; $psi=0; $hlc=0; $act=0; $mtx=0; $jux=0; $pos=0;  # 2018-09-27: safety reset;
  $dba=0; $num=0; $mfn=0; $pre=0; $seq=0; $tgn=0; $tdt=0;  # 2019-08-01: safety reset.
  $tkb=0; $tia=0; $tcj=0; $tdj=0; $tdv=0; $tpr=0; $rv=0;   # 2019-08-01: safety reset.
}  # 2019-08-01: End of KbLoad; return to MindBoot knowledge bootstrap.


sub OutBuffer() {  # http://ai.neocities.org/OutBuffer.html
  $b1=""; $b2=""; $b3=""; $b4=""; $b5=""; $b6="";  # 2019-10-22
  $b7=""; $b8=""; $b9=""; $b10=""; $b11=""; $b12="";  # 2019-06-10
  $b13=""; $b14=""; $b15=""; $b16="";  # 2016apr02: clear tabula rasa;
  if ($c16 ne "") {  # 2019-06-10: if the AudBuffer is full;
  $b1=$c16; $b2=$c15; $b3=$c14; $b4=$c13;  # 2019-10-22
  $b5=$c12; $b6=$c11; $b7=$c10; $b8=$c9;  # 2019-06-10
  $b9=$c8; $b10=$c7; $b11=$c6; $b12=$c5;  # 2019-06-10
  $b13=$c4; $b14=$c3; $b15=$c2; $b16=$c1;  # 2019-06-10
  return;    # 2019-06-10: abandon remainder of function;
  }  # 2019-06-10: end of transfer of a 16-character word;
  if ($c15 ne "") {  # 2019-06-10: if the word is only 15 characters
    $b1=$c15; $b2=$c14; $b3=$c13; $b4=$c12; $b5=$c11; $b6=$c10;
    $b7=$c9; $b8=$c8; $b9=$c7; $b10=$c6; $b11=$c5; $b12=$c4;
    $b13=$c3; $b14=$c2; $b15=$c1; $b16="";  # 2019-06-10
    return;  # 2019-06-10: abandon remainder of function;
  }  # 2016apr02:  end of transfer of a 15-character word;
  if ($c14 ne "") {  # 2016apr03: if the word is only 14 characters
    $b1=$c14; $b2=$c13; $b3=$c12; $b4=$c11; $b5=$c10; $b6=$c9;
    $b7=$c8; $b8=$c7; $b9=$c6; $b10=$c5; $b11=$c4; $b12=$c3;
    $b13=$c2; $b14=$c1; $b15="";  $b16="";  # 2019-06-10
    return;  # 2019-06-10: abandon remainder of function;
  }  # 2019-06-10: end of transfer of a 14-character word;
  if ($c13 ne "") {  # 2019-06-10: if the word is only 13 characters
    $b1=$c13; $b2=$c12; $b2=$c11; $b4=$c10; $b5=$c9; $b6=$c8;
    $b7=$c7; $b8=$c6; $b9=$c5; $b10=$c4; $b11=$c3; $b15=$c2;
    $b12=$c1; $b14="";  $b15="";  $b16="";  # 2019-06-01
    return;  # 2019-06-10: abandon remainder of function;
  }  # 2019-06-10: end of transfer of a 13-character word;
  if ($c12 ne "") {  # 2019-06-10: if the word is only 12 characters
    $b1=$c12; $b2=$c11; $b3=$c10; $b4=$c9; $b5=$c8; $b6=$c7;
    $b7=$c6; $b8=$c5; $b9=$c4; $b10=$c3; $b11=$c2; $b12=$c1;
    $b13="";  $b14="";  $b15="";  $b16="";  # 2019-06-10
    return;  # 2019-06-10:  abandon remainder of function;
  }  # 2019-06-10:  end of transfer of a 12-character word;
  if ($c11 ne "") {  # 2019-06-10: if the word is only 11 characters
    $b1=$c11; $b2=$c10; $b3=$c9; $b4=$c8; $b5=$c7; $b6=$c6;
    $b7=$c5; $b8=$c4; $b9=$c3; $b10=$c2; $b11=$c1; $b12="";
    $b13="";  $b14="";  $b15="";  $b16="";  # 2019-06-10
    return;  # 2019-06-10: abandon remainder of function;
  }  # 2019-06-10: end of transfer of an 11-character word;
  if ($c10 ne "") {  # 2019-06-10: if the word is only 10 characters
    $b1=$c10; $b2=$c9; $b3=$c8; $b4=$c7; $b5=$c6; $b6=$c5;
    $b7=$c4; $b8=$c3; $b9=$c2; $b10=$c1; $b11=""; $b12="";
    $b13="";  $b14="";  $b15="";  $b16="";  # 2019-06-10
    return;  # 2019-06-10: abandon remainder of function;
  }  # 2019-06-10: end of transfer of a 10-character word;
  if ($c9 ne "") {  # 2019-06-10: if the word is only 9 characters
    $b1=$c9; $b2=$c8; $b3=$c7; $b4=$c6; $b5=$c5; $b6=$c4;
    $b7=$c3; $b8=$c2; $b9=$c1; $b10="";  $b11="";  $b12="";
    $b13="";  $b14="";  $b15="";  $b16="";  # 2019-06-10
    return;  # 2019-06-10: abandon remainder of function;
  }  # 2019-06-10: end of transfer of a 9-character word;
  if ($c8 ne "") {  # 2019-06-10: if the word is only 8 characters
    $b1=$c8; $b2=$c7; $b3=$c6; $b4=$c5; $b5=$c4; $b6=$c3;
    $b7=$c2; $b8=$c1; $b9="";  $b10="";  $b11="";  $b12="";
    $b13="";  $b14="";  $b15="";  $b16="";  # 2019-06-10
    return;  # 2019-06-10:  abandon remainder of function;
  }  # 2019-06-10: end of transfer of an 8-character word;
  if ($c7 ne "") {  # 2019-06-10: if the word is only 7 characters
    $b1=$c7; $b2=$c6; $b3=$c5; $b4=$c4; $b5=$c3; $b6=$c2;
    $b7=$c1; $b8="";  $b9="";  $b10="";  $b11="";  $b12="";
    $b13="";  $b14="";  $b15="";  $b16="";  # 2019-06-10
    return;  # 2019-06-10: abandon remainder of function;
  }  # 2019-06-10: end of transfer of a 7-character word;
  if ($c6 ne "") {  # 2019-06-10: if the word is only 6 characters
    $b1=$c6; $b2=$c5; $b3=$c4; $b4=$c3; $b5=$c2; $b6=$c1;
    $b7="";  $b8="";  $b9="";  $b10="";  $b11="";  $b12="";
    $b13="";  $b14="";  $b15="";  $b16="";  # 2019-06-10
    return;  # 2019-06-10: abandon remainder of function;
  }  # 2019-06-10: end of transfer of a 6-character word;
  if ($c5 ne "") {  # 2019-06-10: if the word is only 5 characters
    $b1=$c5; $b2=$c4; $b3=$c3; $b4=$c2; $b5=$c1; $b6="";
    $b7="";  $b8="";  $b9="";  $b10="";  $b11="";  $b12="";
    $b13="";  $b14="";  $b15="";  $b16="";  # 2019-06-10
    return;  # 2019-06-10: abandon remainder of function;
  }  # 2016apr02: end of transfer of a 5-character word;
  if ($c4 ne "") {  # 2019-06-10: if the word is only 4 characters
    $b1=$c4; $b2=$c3; $b3=$c2; $b4=$c1; $b5="";  $b6="";
    $b7="";  $b8="";  $b9="";  $b10="";  $b11="";  $b12="";
    $b13="";  $b14="";  $b15="";  $b16="";  # 2019-06-10
    return;  # 2019-06-10: abandon remainder of function;
  }  # 2019-06-10: end of transfer of a 4-character word;
  if ($c3 ne "") {  # 2019-06-10: if the word is only 3 characters
    $b1=$c3; $b2=$c2; $b3=$c1; $b4=""; $b5="";  $b6="";
    $b7="";  $b8="";  $b9="";  $b10="";  $b11="";  $b12="";
    $b13="";  $b14="";  $b15="";  $b16="";  # 2019-06-10
    return;  # 2019-06-10: abandon remainder of function;
  }  # 2019-06-10: end of transfer of a 3-character word;
  if ($c2 ne "") {  # 2019-06-10: if the word is only 2 characters
    $b1=$c2; $b2=$c1; $b3="";  $b4=""; $b5="";  $b6="";
    $b7="";  $b8="";  $b9="";  $b10="";  $b11="";  $b12="";
    $b13="";  $b14="";  $b15="";  $b16="";  # 2019-06-10
    return;  # 2019-06-10: abandon remainder of function;
  }  # 2019-06-10: end of transfer of a 2-character word;
  if ($c1 ne " ") {  # 2019-06-10: if the word is only 1 character
     $b1=$c1; $b2=""; $b3="";  $b4=""; $b5="";  $b6="";
    $b7="";  $b8="";  $b9="";  $b10=""; $b11="";  $b12="";
    $b13="";  $b14="";  $b15="";  $b16="";  # 2019-06-10
    return;  # 2019-06-10: abandon remainder of function;
  }  # 2019-06-10: end of transfer of a 1-character word;
}  # 2019-06-10: OutBuffer() returns to AudBuffer or VerbGen()


sub AudBuffer() {  # http://ai.neocities.org/AudBuffer.html
  if ($abc ne " ") { $phodex++ }  # 2019-06-10: avoid blank space; skip SPACE-bar
  if ($phodex == 1 && $abc ne "") {  # 2019-06-10: Erase any left-over old data;
    $c1 = $abc; $c2=""; $c3 = ""; $c4 = "";      # 2019-06-10
    $c5 = ""; $c6 = ""; $c7 = ""; $c8 = "";      # 2019-06-10
    $c9 = ""; $c10 = ""; $c11 = ""; $c12 = "";   # 2019-06-10
    $c13 = ""; $c14 = ""; $c15 = ""; $c16 = "";  # 2016apr02
  }  # 2016apr02: end of using $phodex=1 to blank out the AudBuffer()
  if ($phodex == 2)  { $c2 = $abc }   # 2019-06-10: AudBuffer Characer
  if ($phodex == 3)  { $c3 = $abc }   # 2019-06-10: AudBuffer Character
  if ($phodex == 4)  { $c4 = $abc }   # 2019-06-10: AudBuffer Character
  if ($phodex == 5)  { $c5 = $abc }   # 2019-06-10: AudBuffer Character
  if ($phodex == 6)  { $c6 = $abc }   # 2019-06-10: AudBuffer Character
  if ($phodex == 7)  { $c7 = $abc }   # 2019-06-10: AudBuffer Character
  if ($phodex == 8)  { $c8 = $abc }   # 2019-06-10: AudBuffer Character
  if ($phodex == 9)  { $c9 = $abc }   # 2019-06-10: AudBuffer Character
  if ($phodex == 10) { $c10 = $abc }  # 2016apr02: AudBuffer Character
  if ($phodex == 11) { $c11 = $abc }  # 2016apr02: AudBuffer Character
  if ($phodex == 12) { $c12 = $abc }  # 2016apr02: AudBuffer Character
  if ($phodex == 13) { $c13 = $abc }  # 2016apr02: AudBuffer Character
  if ($phodex == 14) { $c14 = $abc }  # 2016apr02: AudBuffer Character
  if ($phodex == 15) { $c15 = $abc }  # 2016apr02: AudBuffer Character
  # if ($phodex == 16) { $c16 = $abc }  # 2016apr02: AudBuffer Character
  if ($phodex == 16) { $c16 = $abc }  # 2019-10-21: AudBuffer Character
# OutBuffer();  # 2019-06-10: right-justify each input word.
 #  OutBuffer();  # 2019-10-21: right-justify each input word.
# if ($abc ne "") { OutBuffer(); } # 2019-06-10: right-justify each input word.
# if ($phodex < 17) { OutBuffer(); } # 2019-06-10: right-justify each input word.
  if ($phodex < 17) { OutBuffer(); } # 2019-10-12: right-justify each input word.
# if ($abc ne " ") { OutBuffer(); } # 2019-06-10: right-justify each input word.
# if ($abc ne " ") { OutBuffer(); } # 2019-10-21: right-justify each input word.
  $abc = 0;  # 2019-06-10: reset for non-persistence.
}  # 2019-10-21: AudBuffer()) returns to AudInput or FileInput or EnVerbGen or RuVerbGen.


sub InStantiate() {  # http://ai.neocities.org/InStantiate.html
  if ($pre == 0) { $pre = $prevtag }  # 2017-09-25: still needed.
  $prevtag = 0;  # 2016mar12: Reset for safety.
  if ($pov == 2) {  # 2017-09-17: only during external input, not re-entry
    if ($psi == 781)  {  # 2017-11-27: upon input of 781=WHAT
      if ($whatcon == 0)  {  # 2017-11-27: to set only once per input idea
        $whatcon = 1;  # 2017-11-27: set positive to process rest of input.
      }  # 2017-11-27: end of test for $whatcon at zero.
    }  # 2019-01-25: end of test for input of query-word 781=WHAT.
    if ($psi == 791)  {  # 2018-09-30: upon input of 791=WHO
      $whocon = 1;  # 2018-09-30: set positive for use in SpreadAct()
    }  # 2019-01-25: end of test for input of query-word 791=WHO.
    if ($psi==781 || $psi==791)  {  # 2018-09-29: upon 781=WHAT or 791=WHO
        $qucon = 1;  # 2017-09-17: set positive to process rest of input.
    }  # 2019-01-25: end of test for input of query-words 781=WHAT or 791=WHO.
  } # 2017-11-27: end of test for point-of-view to be 2=pov external for input.
  if ($qucon > 0 || $whatcon > 0) {  # 2018-09-29: deal with more than "who is" queries...
    if ($psi == 800)  {  # 2017-09-17: if 800=Be-Verb...
      $qv2psi = 800;  # 2017-09-17: for transfer to SpreadAct.
    }  # 2017-09-17: end of test for 800=BE.
    if ($pos==8 && $psi != 800 && $psi != 818) { # 2018-12-10: not 800=BE or 818=DO
      $qvdocon = 1;    # 2017-09-26: set flag for query who+verb+direct-object.
      $qv2psi = $psi;  # 2017-10-24: for transfer to SpreadAct.
    }  # 2017-09-26: end of test for verb other than 800=BE.
    if ($qvdocon > 0 && $pos == 5) { # 2017-09-26: if 5=noun comes in...
      $qv4psi = $psi;  # 2017-09-26: to send direct object into SpreadAct()
    } # 2017-09-26: end of test for noun during who-verb-dirobj query.
    if ($pos==5 && $dba==4) {  # 2018-09-30: if noun and direct object...
      $qv4psi = $psi;  # 2018-09-30: to send direct object into SpreadAct()
    } # 2018-09-30: end of test for noun with query involving direct object.
  }  # 2017-09-26: end of test for positive query-condition $qucon.
  if ($whatcon > 0) {  # 2017-11-27: deal with what-queries...
    if ($psi == 800)  {  # 2017-11-27: if 800=Be-Verb...
      $qv2psi = 800;  # 2017-11-27: for transfer to SpreadAct.
    }  # 2017-11-27: end of test for 800=BE.
    if ($pos==5 || $pos==7) { # 2017-11-27: if 5=noun or 7=pronoun...
      $qv1psi = $psi;  # 2017-11-27: for transfer as query-subject to SpreadAct.
    }  # 2017-11-27: end of test for 5=noun or 7=pronoun
    if ($pos==8 && $psi != 800 && $psi != 818) { # 2018-12-10: if verb but not 818=DO
      $qv2psi = $psi;  # 2017-11-27: for transfer as query-verb to SpreadAct.
    }  # 2018-12-10: end of test for verb other than auxiliary 818=DO.
  }  # 2017-11-27: end of test for positive query-condition $whatcon.
  if ($oldpsi == 701) { $pos = 7 }  # 2016jun19: 7 = pronoun.
  $act = 0;   # 2016jun26: preparing to activate only older nodes of concepts.
  if ($moot == 0) {  # 2017-09-18: if no query is being input...
    my @k=split(',',$psy[$tvb]);  # 2017-06-30: inspect @psy flag-panel at time of verb
    if ($qucon==1 && $k[11]==701) { $k[7] = 2 } #2019-08-02: 2nd person 800=ARE
    if ($whatcon==1 && $k[1]==800) { $k[7] = 0 } #2017-11-28: skip $dba person.
    if ($whatcon==1 && $k[1]==781) { $k[3] = 0 } # 2018-09-11: deactivate 781=WHAT
    if ($whatcon > 0) {  # 2018-09-12: deal with what-queries...
      if ($pos==8 && $psi != 800 && $psi != 818) {  # 2018-12-10: if not BE or DO
        $qv2psi = $psi;  # 2018-09-12: for transfer as query-verb to SpreadAct()
      }  # 2018-09-12: end of test for verb other than auxiliary BE or DO.
    }  # 2018-09-12: end of test for positive query-condition $ whatcon.
    $psy[$tvb]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
    . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
    . "$tkb,$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01: insert $tkb
  }  # 2017-09-18: end of test for no suppression of associative tag $tkb
  if ($pov == 2) {  # 2019-01-25: only during external input, not re-entry
    for (my $i=$tpu; $i>$midway; $i--) {  # 2018-06-28: search backwards in time.
      my @k=split(',',$psy[$i]);  # 2016jun26: inspect @psy flag-panel
      if ($k[1] == $psi) {  # 2019-01-19: increment activation on matching concepts
        if ($k[0] < 1) { $k[0] = 0 };  # 2018-09-26: BUGFIX: initialize.
        $k[3] = ($k[3] + 16);  # 2019-09-26: activate enough to spark a thought
        if ($psi == 781) { $k[3] = 0 } # 2017-11-27: upon input of 781=WHAT
        $psy[$i]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
        . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
        . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01
        if ($k[10] > 0) {  # 2019-03-31: if there is a "pre" concept...
          $prepsi = $k[10];  # 2019-03-31: grab hold of the "pre" as $prepsi
          for (my $j=$tpu; $j>$midway; $j--) {  # 2019-03-31: search within a search.
            my @p=split(',',$psy[$j]);  # 2019-03-31: inspect @psy flag-panel
            if ($p[1] == $prepsi)  {  # 2019-03-31: if first inner loop finds $prepsi...
              for (my $x=$tpu; $x>$midway; $x--) {  # 2019-03-31: search within a search.
                my @q=split(',',$psy[$x]);  # 2019-03-31: inspect @psy flag-panel
                if ($q[1] > 0 && $q[11] == $prepsi) {  # 2019-08-01: if subject of $prepsi
                  $psy[$x]="$k[0],$q[1],$q[2],24,$q[4],$q[5],$q[6],"  # 2019-09-27: sufficient
                  . "$q[7],$q[8],$q[9],$q[10],$q[11],$q[12],$q[13],"
                  . "$q[14],$q[15],$q[16],$q[17],$q[18],$q[19],$q[20]";
                }  # 2019-03-31: end of test for subject of $prepsi.
              }  # 2019-03-31: end of second inner loop spreading activation sideways.
            }  # 2019-03-31: end of test for $prepsi.
          }  # 2019-03-31: end of first inner loop with its own index.
        }  # 2019-03-31: end of test for existence of a "pre" concept.
      } # 2016-06-24: end of test for matching concept.
    }  # 2016jun26: end of (for loop) searching backwards in time.
  } # 2019-01-25: end of test for point-of-view to be 2=pov external for input.
  $tult = ($t - 1);  # 2017-06-25: penultimate time
  $act = -48;  # 2016JUL06: for a "trough" of recent-most inhibition.
  if ($qv2num > 0) { $num = $qv2num }  # 2017-10-22: for who+verb+dir.obj. query-response
  my @k=split(',',$psy[$tult]);  # 2018-07-03: expose flag-panel at tult;
  $psy[$tult]="$k[0],$k[1],$k[2],$act,404,$k[5],$k[6],"  # 2019-10-23: negative activation
  . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
  . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]"; # 2019-08-01: expanded panel.
  @k=split(',',$psy[$tvb]);  # 2019-06-13: expose flag-panel at $tvb
  if ($b2 eq "Ш" && $b1 eq "Ь") { $k[7] = 2; } # 2019-06-13: 2nd person Russian verb.
# if ($moot == 0) {  # 2019-10-21: TEST; TRUNCATE
#  $psy[$tvb]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
#  . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
#  . "$tdo,$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]"; # 2019-08-01: tdo as tkb
# }  # 2019-10-21: end of test for $moot TEST; TRUNCATE
#  if ($tkb == $tdo) { $tkb = 0 }  # 2017-09-19: prevent direct-object $tkb
 if ($moot == 0) {  # 2019-10-23: in normal circustances...
  if ($pos == 8) { $dba = $prsn; }  # 2019-10-19: for verbs, use "$prsn" as "$dba".
  # 2019-10-23 Next code is the main instantiation of English words.
  $psy[$tult] = "$tru,$psi,$hlc,$act,$mtx,$jux,$pos,"
  . "$dba,$num,$mfn,$pre,$seq,$tgn,$tdt,"
  . "$tkb,$tia,$tcj,$tdj,$tdv,$tpr,$rv";  # 2019-08-01: expanded conceptual flag-panel.
  if ($pos == 5 || $pos == 7) {  # 2019-10-19: test for noun or pronoun
    if ($dba == 1) {  # 2019-10-19: test for nominative-case subject
      if ($tsj == 0) {  # 2019-10-19: if not already declared...
        $tsj = $tult;  # 2019-10-19: declare time-of-subject.
      }  # 2019-10-19: end of test for valid previous declaration of $tsj.
    }  # 2019-10-19: end of test for nominative-case "dba".
  }  # 2019-10-19: end of test of "pos" part of speech.
 }  # 2019-10-23: end of test of $moot flag.
  if ($pos == 5 || $pos == 8) {  # 2019-08-11: for a noun or a verb...
    $mri = $tult;  # 2019-08-10: time-of-most-recent-instantiation, for back-tagging.
  }  # 2019-08-11: end of restriction by part-of-speech.
  $tult = 0;  # 2017-06y-23: reset for safety
  if ($jux == 250) { $jux = 0 }  # 2016jun17: Reset after use.
  if ($prejux == 250) {  # 2016jun17: 250=NOT from OldConcept()
    $jux = 250;  # 2016jun17: set $jux for next instantiand;
    $prejux = 0;  # 2016jun17: Reset for safety.
  }  # 2016jun17: end of post-instantiation test;
  if ($hlc == 3) {     # 2018-09-27: only for Russian input
    if ($seqneed == 8 && (ord $pho) == 32) {
      if ($pov > 1) {   # 2017-09-10: only during input
        $tvb = ($t - 1);  # 2019-06-09: TEST; REMOVE
        $t++;  # 2017-09-10: increment internal AI time "t"
        $audpsi = 1800;  # 2017-09-10: by default assume provisional 1800=BE verb.
        $ear[$t] = "$pho,0,$audpsi";     # 2017-09-10: store verb 800=BE
        $psi = 1800;  # 2017-09-10: set the concept to 800=BE.
        $prevpsi = 1800;  # 2017-09-10: to enable cancellation of be-verb
        $pos = 8;    # 2017-09-10: set the part-of-speech $pos to 8=verb.
      # 2019-10-23 Next code is the main instantiation of Russian words.
        $psy[$t] = "$tru,$psi,$hlc,$act,$mtx,$jux,$pos,"
        . "$dba,$num,$mfn,$pre,$seq,$tgn,$iob,"
        . "$tkb,$tia,$tcj,$tdj,$tdv,$tpr,$rv";  # 2019-08-01: expanded flag-panel.
        $t++;  # 2017-09-10: increment internal AI time "t"
      }  # 2017-09-10: end of test for input-mode only.
    }  # 2017-09-10: test for 32=SPACE
    if ($prevpsi == 1800 && $seqneed == 5) {  # 2017-09-10: if noun is expected...
      if ($pos == 8)  {  # 2017-09-10: if real verb follows pseudo-be-verb
        $seqneed = 8;  # 2017-09-10: the seq to the real verb is needed
        $prevpsi = 0;  # 2017-09-10: reset after using.
      }  # 2017-09-10: end of test for a real verb
    }  # 2017-09-10: end of test
  }  # 2017-09-10: end of test for Russian human-language-code $hlc
  if ($pos == 5) { $usx = $psi };  # 2018-09-03: for transfer to EnArticle()
  if ($pos != 5) { $usx = 0 };  # 2018-09-03: transfer only noun-concepts.
  if ($pos == 5 || $pos == 7) { $prevtag = $psi };  # 2016mar12: after subject
  if ($pos == 8) { $prevtag = $psi };  # 2016mar12: after a verb.
  if ($pos == 8 && $seqneed == 0) { $seq = $psi };  # 2016mar15: for the $seq of a subject
  if ($pos == 5 || $pos == 7) {  # 2016mar15: if noun or pronoun...
    $seq = 0;  # 2016mar15: until set by the $seqneed mechanism...
    if ($seqneed == 0) { $seqneed = 8 } # 2016mar15: if start of input sentence...
    if ($seqneed == 5) { $seqneed = 0 } # 2016mar15: for subject only
  }  # 2016mar15:
  if ($pos == 5 || $pos == 7) { $actpsi = $psi }  # 2016JUL10: for ReEntry() & SpreadAct()
  if ($pos == 5 || $pos == 7) {$qv1psi = $psi}   # 2017-11-24: SUCCEEDS AS A BUGFIX
  if ($qucon == 0) { # 2017-11-24: not during who-queries:
    if ($pos == 5 || $pos == 7) { $qv1psi = $psi }  # 2017-09-17: subj. for SpreadAct
    if ($pos == 5 || $pos == 7) {  # 2019-06-08: TEST; REMOVE
      if ($tsj > 1 && $verbcon == 1 && $tdo == 0) { $tdo = ($t - 1) }  # 2019-06-08: TEst
    }  # 2019-06-08: End of TEST; REMOVE
  }  # 2017-09-26: end of test to prevent interference with who-queries.
  if ($pos == 8) { $qv2psi = $psi }  # 2017-09-17: verb for SpreadAct
  if ($pos == 8) { $seqneed = 5 };  # 2016mar15: if verb, need direct object.
  $act = 0;  # 2016apr27: reset to prevent carry-over
  $finlen = 0;  # 2017-12-26: reset to prevent carry-over.
  $prc = 0;  # 2017-12-26: reset to prevent carry-over.
  $pre = 0;  # 2016mar12: Reset to prevent carry-over.
}  # 2019-10-23: InStantiate() returns to EnParser() or RuParser().


# 2017-09-03: Requirements of English Parser module:
# 2017-09-13: EnParser shall at first assume that a new word is a noun.
sub EnParser() {  # http://ai.neocities.org/EnParser.html
  if ($pos == 5 || $pos == 7) {  # 2019-10-19: if noun or pronoun...
    if ($tsj == 0) { $dba = 1; }  # 2019-10-19: if not subject has been declared...
    if ($tult == $tdo) { $dba = 4; }  # 2019-10-19: acc. dir. obj.
  }  # 2019-10-19: end of test for noun or pronoun.
  $act = 48;  # 2016apr27: an arbitrary activation for InStantiate()
  $bias = 5;  # 2015jun04: Expect a noun until overruled.
  $tkb = 0;   # 2019-10-22: BUGFIX
  if ($fyi > 2) {  # 2016feb08: if mode is Diagnostic
    # 2018-07-01: Diagnostic or tutorial message.
  }  # 2016feb07: end of test for Diagnostic or Tutorial mode.
  InStantiate(); # 2019-08-08: first instantiation during parsing Stage One
  if ($pos == 5) { $bias = 8 }  # 2016feb10: after noun, expect verb.
  if ($pos == 7) { $bias = 8 }  # 2016feb10: after pronoun, expect verb.
  if ($pos == 8) { $bias = 5 }  # 2016feb10: after verb, expect noun
  if ($prepcon == 0) {  # 2017-09-13: if not handling a preposition...
    if ($pos == 5 || $pos == 7) {  # 2016mar21: expanding then-clause
#     $tsj = ($t - 1);     # 2017-09-13: subject?
#     $tsj = ($t - 1);  # 2019-10-19: declare subject-time elsewhere?
      if ($verbcon == 1) {  # 2017-09-13: if a verb has come in...
        if ($tvb > 0) { $tdo = $tult; }  # 2019-10-19: a default value.
        if ($tio == 0) {$tdo = $tult}  # 2017-09-13: set once or twice
        if ($tio == 0) {$tio = $tult}  # 2017-09-13: set only once
        if ($tio > 0)  {  # 2017-09-13: if $tio previously set...
          $tdo = $tult;  # 2017-09-13: second noun sets time of dir.obj.
        }  # 2017-09-13: end of test to make 2nd noun the direct object.
        $tkb = $tdo;  # 2019-10-18: let verb have a "nounlock" to direct object.
        my @k=split(',',$psy[$tvb]);  # 2017-09-13: expose flag-panel of verb
        $pre = $k[1];  # 2017-09-13: verb psi will be $pre of direct object
        @k=split(',',$psy[$tio]);  # 2017-09-13: expose flag-panel of indir.obj.
        $iob = $k[1];  # 2019-08-01: excerpt indirect-object concept for k[13]
        $psy[$tio]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
        . "3,$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
        . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01: panel
        # 2017-09-13: Above lines insert k7 dba=3 for dative-case indirect object.
        @k=split(',',$psy[$tdo]);  # 2017-09-13: expose flag-panel of dir.obj.
        $psy[$tdo]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
        . "4,$k[8],$k[9],$k[10],0,$k[12],$k[13],"
        . "0,$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]"; # 2019-08-02: no $tkb for dir.obj.
        # 2017-09-13: Above lines insert verb-$psi as k10 $pre of direct object.
        @k=split(',',$psy[$tvb]);  # 2017-09-13: expose flag-panel of main verb.
        if ($k[5]==250) { $k[7]=0;$k[8]=0; }  # 2019-10-23: negated verb is dba=0 infinitive.
        $tdo = $t - 1;  # 2017-09-13: insert time-of-direct-object for nounlock;
        $tkb = $tdo;  # 2017-09-13: TEST
        # 2017-09-13: Next two lines create psy-array row for a verb.
        $psy[$tvb]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
        . "$k[7],$k[8],$k[9],$k[10],$psi,$k[12],$iob,"
        . "$tkb,$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01: panel.
        @k=split(',',$psy[$tdo]);  # 2019-10-19: expose flag-panel of direct object
        $psy[$tdo]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
        . "4,$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"   # 2019-10-19: acc. dba=4 dir.obj.
        . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-10-19: tdo-panel
      }  # 2017-09-13: end of test for a condition following a verb.
    }  # 2017-09-13: end of test for noun not object of a preposition.
  }  # 2017-09-13: end of test for a non-prepositional condition.
  if ($pos == 6) { $prepcon = 1 }  # 2019-09-24: prepare for noun.
  if ($pos == 5 || $pos == 7) {  # 2017-09-13:
    if ($prepcon == 1) {  # 2017-09-13:
      my @k=split(',',$psy[$tpr]);  # 2019-08-06: expose flag-panel of preposition;
      $pre = $k[1];  # 2017-09-13: Let $pre briefly be the preposition.
      $prep = $k[1];  # 2018-11-08: identify prep. to be the $seq of the verb.
      $k[14] = $tult;  # 2019-08-01: establish $tkb between preposition and its object.
      @k=split(',',$psy[$tult]);  # 2017-09-13: expose flag-panel of obj of prep.
      $psy[$tult]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
      . "4,$k[8],$k[9],$pre,0,$k[12],$k[13],"
      . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01: panel.
      $prep = 0;  # 2018-11-08: Reset to prevent carry-over.
      $prepcon = 0;  # 2017-09-13: Reset to prevent carry-over.
    }  # 2017-09-13: end of test for a positive $prepcon.
  }  # 2017-09-13: end of test for a noun or pronoun.
  if ($pos == 8 && $psi != 800 && $psi != 818) {  # 2019-08-06: not "BE" or "DO"
    $tvb = ($t - 1);  # 2017-09-13: hold onto time-of-verb for flag-insertions.
    $verbcon = 1;  # 2017-09-13: verb-condition is "on" for ind. & dir. objects.
    my @k=split(',',$psy[$tsj]);  # 2017-09-13: expose flag-panel of subject noun
    $subjpre = $k[1];  # 2017-09-13: Hold onto $subjpre for the pos=8 verb
    $psy[$tsj]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
   . "1,$k[8],$k[9],$k[10],$psi,$k[12],$k[13],"
   . "$tvb,$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01
    @k=split(',',$psy[$tult]);  # 2017-09-13: expose flag-panel of verb.
    $psy[$tult]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
    . "$k[7],$k[8],$k[9],$subjpre,0,$k[12],$k[13],"
    . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01
    $subjpre = 0;  # 2017-09-13: Reset for safety.
  }  # 2017-09-13: end of test for a pos=8 verb.
# if ($pos == 8 && $psi == 800) {  # 2019-10-18: if 800=BE verb...
  if ($pos == 8) {  # 2019-10-19: any verb...
    $tvb = ($t - 1);  # 2019-10-18: hold onto time-of-verb for flag-insertions.
    my @k=split(',',$psy[$tsj]);  # 2019-10-18: expose flag-panel of subject noun
    $psy[$tsj]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
   . "$k[7],$k[8],$k[9],$k[10],$psi,$k[12],$k[13],"  # 2019-10-18: verb is "seq" of noun.
   . "$tvb,$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-10-18: verb "tkb" of noun.
  }  # 2019-10-18: end of test for 800=BE verb.
# if ($tpr > 0 && $pos == 5) {  # 2019-08-11: if a noun follows a preposition...
  if ($tpr > $vault && $pos == 5) {  # 2019-10-22: if a noun follows a preposition...
    my @k=split(',',$psy[$tpr]);  # 2019-08-10: expose flag-panel at time-of-prep.
    $tkb = ($t-1);  # 2019-08-11: time of object of preposition
    $psy[$tpr]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
    . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
    . "$tkb,$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-11
  }  # 2019-08-11: end of test for a noun after a preposition.
  if ($pos == 6 && $mri > 0) {  # 2019-09-24: removing restriction to input-only.
    $tpr = ($t - 1);  # 2019-08-11: time-of-preposition for back-tag insertion.
    my @k=split(',',$psy[$mri]);  # 2019-08-10: expose flag-panel of most-recent word
    $psy[$mri]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
    . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
    . "$k[14],$k[15],$k[16],$k[17],$k[18],$tpr,$k[20]";  # 2019-08-11
    $etc = 0;  # 2019-09-26: thwart compounding of thought at first after a preposition.
    $tpr = 0;  # 2019-10-22: prevent carry-over.  TEST; TRUNCATE
  }  # 2019-09-24: end of test for preposition part-of-speech and positive $mri value.
  if ($pos == 8) {  # 2019-10-19: if part-of-speech is 8=verb...
    if ($psi != 818) {  # 2019-10-19: if verb other than auxiliary 818=DO...
      $verbcon = 1;  # 2019-10-19: verb condition is "on" for indir. and dir. objects.
    }  # 2019-10-19: end of test for not auxiliary 818=DO.
    my @k=split(',',$psy[$tsj]);  # 2019-10-19: expose flag-panel at time-of-subject
    $psy[$tsj]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
    . "$k[7],$k[8],$k[9],$k[10],$psi,$k[12],$k[13],"  # 2019-10-19: seq = verb.
    . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-10-20
  }  # 2019-10-19: end of test for a pos=8 verb.
  if ($pos == 5 || $pos == 7) {  # 2019-10-22: noun or pronoun as direct object
    my @k=split(',',$psy[$tdo]);  # 2019-10-19: expose flag-panel of direct object
    $psy[$tdo]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
    . "4,$k[8],$k[9],$svo2,0,$k[12],$k[13],"   # 2019-10-22: dba=4 pre=verb seq=0
    . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-10-22: tdo-panel
  }  # 2019-10-22: end of test for a noun or pronoun.
  if ($pos == 1) {  # 2019-10-22: if adjective
    $tult = ($t -1);  # 2019-10-22: certify
    my @k=split(',',$psy[$tult]);  # 2019-10-22: expose flag-panel
    $psy[$tult]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
    . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"   # 2019-10-22
    . "$k[14],$k[15],$k[16],$k[17],$k[18],0,$k[20]";  # 2019-10-22: no tpr for adjective.
  }  # 2019-10-22: end of test for pos=1 adjective
  if ($pos == 6) {  # 2019-10-22: if preposition
    $tult = ($t -1);  # 2019-10-22: certify
    my @k=split(',',$psy[$tult]);  # 2019-10-22: expose flag-panel
    $psy[$tult]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
    . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"   # 2019-10-22
    . "$k[14],$k[15],$k[16],$k[17],$k[18],0,$k[20]";  # 2019-10-22: no tpr for prep.
  }  # 2019-10-22: end of test for pos=6 preposition.
}  # 2019-10-19: EnParser() returns to OldConcept() or NewConcept().


sub RuParser() {  # http://ai.neocities.org/RuParser.html
  if ($b2 == "Ш" && $b1 == "Ь") { $dba = 2; } # 2019-06-10: recognize second person
  InStantiate(); # 2019-06-09: instantiate a concept and then work changes on it below.
  $act = 48;  # 2016apr28: an arbitrary activation for InStantiate()
  $bias = 5;  # 2016feb24: Expect a noun until overruled.
  if ($fyi > 2) {  # 2016feb24: if mode is Diagnostic
  }  # 2016feb24: end of test for Diagnostic or Tutorial mode.
  if ($tsj > 0 && $tvb > 0 && $tdo > 0) {  # 2019-06-09: if SVO input complete...
    my @k=split(',',$psy[$tsj]);  # 2019-06-09: expose flag-panel of subject.
    $psy[$tsj]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6]," # insert tvb as tkb
    . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
    . "$tvb,$k[15],$k[16],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01: panel.
    @k=split(',',$psy[$tvb]);  # 2019-06-13: expose flag-panel of verb.
    $psy[$tvb]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6]," # insert tdo as tkb
    . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
    . "$tdo,$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01: panel.
    $tdo = 0;  # 2019-06-09: reset for safety.
    $tvb = 0;  # 2019-06-09: reset for safety.
  }  # 2019-06-09: end of test for completion of subject-verb-object input.
  if ($pos == 5) { $bias = 8 }  # 2016feb24: after noun, expect verb.
  if ($pos == 7) { $bias = 8 }  # 2016feb24: after pronoun, expect verb.
  if ($pos == 8) { $bias = 5 }  # 2016feb24: after verb, expect noun
  if ($pos == 6) { $prepcon = 1; $tpp = $tult }  # 2017-09-17: prepare for noun.
  if ($pos == 5 || $pos == 7) {  # 2017-09-17: if (pro)noun follows preposition...
    if ($verbcon == 0) { $tsj = ($t - 1) }  # 2019-06-08: BEFORE a verb
    if ($verbcon == 1) { $tdo = ($t - 1) }  # 2019-06-08: AFTER a verb
    if ($prepcon == 1) {  # 2017-09-17: if preposition-condition is on...
      my @k=split(',',$psy[$tpp]);  # 2017-09-17: expose flag-panel of preposition;
      $pre = $k[1];  # 2017-09-17: Let $pre briefly be the preposition.
      $psy[$tpp]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
      . "$k[7],$k[8],$k[9],$k[10],$psi,$k[12],$k[13],"
      . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01: panel
      @k=split(',',$psy[$tult]);  # 2017-09-13: expose flag-panel of obj of prep.
      $psy[$tult]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
      . "4,$k[8],$k[9],$pre,0,$k[12],$k[13],"
      . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01: panel
      $prepcon = 0;  # 2017-09-17: Reset to prevent carry-over.
    }  # 2017-09-17: end of test for a positive $prepcon.
    if ($prepcon == 0) {  # 2019-06-08: if there is no preposition
      if ($verbcon == 1) {  # 2019-06-08: if a verb has already come in...
        my @k=split(',',$psy[$tvb]);  # 2019-06-06: expose flag-panel of verb
        $psy[$tvb]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
        . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"  # 2019-08-01: insertion?
        . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";   # 2019-08-01
      }  # 2019-06-08: end of test for $verbcon.
    }  # 2019-06-08: end of test for zero "prepcon".
  }  # 2017-09-17: end of test for a noun or pronoun.
  if ($pos == 8) {  # 2019-06-06: if part of speech is Russian 8=verb...
    $verbcon = 1;  # 2019-06-06: verb-condition is "on" for ind. & dir. objects.
    $subjpre = 0;  # 2019-06-06: Reset for safety.
  }  # 2019-06-06: end of test for a pos=8 Russian verb.
}  # 2019-06-09: RuParser() returns to OldConcept() or NewConcept().


sub KbRetro() {  # http://ai.neocities.org/KbRetro.html
  if ($kbzap == 432 || $kbzap == 404) {  # 2018-06-26: if 432=YES or 404=NO...
    if ($kbzap == 404) {  # 2018-06-26: 404=NO;
      my @k=split(',',$psy[$tkbn]);  # 2018-07-01: adjust noun of silent inference;
      $psy[$tkbn]="8,$k[1],1,$k[3],$k[4],$k[5],$k[6],"  # 2019-08-01: enhance $tru.
      . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
      . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01
      @k=split(',',$psy[$tkbv]);  # 2018-07-01: at time of KB-verb adjustment;
      $psy[$tkbv]="0,$quverb,1,32,$k[4],250,8,"  # 2019-08-01: jux=250 for "NO".
      . "$k[7],0,0,$qusub,$quobj,$k[12],$k[13],"
      . "$tkbo,$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01
    }  # 2018-06-26: end of test for a no-answer.
    if ($kbzap == 432) { # 2018-06-26: 432=YES;
      my @k=split(',',$psy[$tkbn]);  # 2018-07-01: adjust noun of silent inference;
      $psy[$tkbn]="8,$k[1],1,$k[3],$k[4],$k[5],$k[6]," # 2019-08-01: enhance $tru.
      . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
      ." $k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01
      @k=split(',',$psy[$tkbv]);  # 2018-06-26: at time of KB-verb adjustment;
      $k[7] = 3;  # 2018-10-08: assume dba=3 third person...
      $psy[$tkbv]="0,$quverb,1,32,$k[4],$k[5],8,"
      . "$k[7],0,0,$qusub,$quobj,$k[12],$k[13],"
      . "$tkbo,$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01
    }  # 2018-06-26: end of test for a yes-answer.
  } else {  # 2018-06-26: if neither yes nor no answer comes in...
    my @k=split(',',$psy[$tkbn]);  # 2018-06-26: remove pre and seq tags from noun;
    $psy[$tkbn]="$k[0],$k[1],1,$k[3],$k[4],$k[5],$k[6],"
    . "$k[7],$k[8],$k[9],0,0,$k[12],$k[13],"
    . "0,$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01: no pre, seq or tkb.
    @k=split(',',$psy[$tkbv]);  # 2018-06-26: remove pre and seq tags from verb;
    $psy[$tkbv]="$k[0],$k[1],1,$k[3],$k[4],$k[5],$k[6],"
    . "$k[7],$k[8],$k[9],0,0,$k[12],$k[13],"
    . "0,$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01: no pre, seq or tkb.
  }  # 2018-06-26: end of test for either yes or no.
  $quobj = 0;  # 2018-06-26: reset for safety.
  $tkbn = 0;   # 2018-06-26: reset for safety;
  $tkbv = 0;   # 2018-06-26: reset for safety;
}  # 2019-08-01: KbRetro() returns to EnThink()


sub OldConcept() {  # http://ai.neocities.org/OldConcept.html
  for (my $i=$t; $i>$midway; $i--) {  # 2016feb10: search backwards in time.
    my @k=split(',',$psy[$i]);  # 2016mar15: inspect @psy knowledge nodes
    if ($k[1] == $oldpsi) {  # 2017jun08: find most recent oldpsi engram
      if ($k[2] ne 0)  { $hlc = $k[2] }  # 2017jun08: k2 is still "hlc"
      if ($k[6] > 0)  { $pos = $k[6] }   # 2017jun08: pos = part of speech;
      if ($k[8] > 0) { $recnum = $k[8] } # 2017-10-01: rec(ognized) num(ber).
      if ($k[9] > 0) { $mfn = $k[9] }    # 2017jun08: m/f/n gender 1/2/3;
    }  # 2016feb10: end of test for $oldpsi match in @psy array
  }  # 2016mar13: End of (for loop) searching through @psy conceptual array.
  if ($hlc == 1)    {  # 201809-27: test for governing human-language-code
    if ($oldpsi == 800) { $tbev = ($t-1) }  # 2017may29: for be-verb negation.
    if ($oldpsi == 800) { $becon = 1 }  # 2018-06-26:
    if ($oldpsi == 250) { # 2017may29: 250=NOT for negation of a verb.
      if ($tbev > 0) {  # 2017may29: if positive be-verb time;
        my @k=split(',',$psy[$tbev]);  # 2017may29: examine @psy array;
        $k[5] = 250;  # 2017jun08: set verb "jux" to 250=NOT for negation.
        $psy[$tbev]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
        . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
        . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01
        $tbev = 0;  # 2017may29: reset for safety.
      }  # 2017may29: end of test for a positive tbev;
      $prejux = 250;  # 2016jun17: a flag for negation.
    }  # 2017may29: end of test for negation of a verb with "NOT".
    if ($oldpsi == 404) { $kbzap = 404 }  # 2018-06-28: 404=NO for KbRetro()
    if ($oldpsi == 432) { $kbzap = 432 }  # 2018-06-28: 432=YES for KbRetro()
    $psi = $oldpsi;  # 2016feb10: from MindForth.
    if ($pov == 2) {  # 2016mar27: during a pov "dual" conversation...
      if ($oldpsi == 245) { $prepgen = 8 }  # 2016mar30: if "Where?" call EnPrep()
      if ($oldpsi == 245) { $wherecon = 1 }  # 2018-11-01: if 245=where.
      if ($oldpsi == 707) { $psi = 701; $rv = 0 }  # 2016mar27: interpret "YOU" as "I";
      if ($oldpsi == 701) { $psi = 707; $rv = 0 }  # 2016mar27: interpret "I" as "YOU".
      if ($oldpsi == 731) { $psi=737; $num=2; $dba=1; $rv=0 } # 2016mar30: we --> you.
      if ($oldpsi == 800) { $becon = 1 }  # 2018-06-26: flag for calling InFerence()
      if ($pos == 5) {  # 2018-06-26: nouns only, not yet pronouns;
        if ($subjnom > 0) {    # 2018-07-01: already subjnom?
          $prednom = $oldpsi;  # 2018-06-26: for InFerence()
        }  # 2018-06-26: end of test for pre-existing subjnom.
        if ($prednom == 0) {   # 2018-06-26: no prednom yet?
          $subjnom = $oldpsi;  # 2018-06-26: hold for InFerence()
          $subjnum = $num;     # 2018-06-26: hold for AskUser()
          $qusnum = $num;      # 2018-06-26: query-subject-number for AskUser()
        }  # 2018-06-26: alternate between $subjnom and $prednom.
      }  # 2018-06-26: end of test for a noun.
      if ($fyi >2) {  # 2017-04-12: keep following line for Tutorial and Diagnostic Mode
      }  # 2017-04-12: end of test for #3 Tutorial Mode or higher.
    }  # 2016mar27: end of test for other person communicating with the AI.
#   if ($moot == 0) {  # 2017-09-22: if not suppression of a query...
#   if ($moot == 0) {  # 2019-10-21: do not let $moot control the whole EnParser()
      if ($b1 eq "S") { $num = 2; }  # 2019-10-19: assume noun ending in "S" is plural.
      EnParser(); # 2017-09-13: In preparation to call InStantiate().
#   }  # 2017-09-22: end of test for $moot suppressing associative tags
#   }  # 2019-10-21: end of test for $moot suppressing associative tags
  }  # 2016feb10: end of test for English human-language-code
  if ($hlc == 3) {     # 2018-09-27: test for governing human-language-code
    $psi = $oldpsi;  # 2016feb24: from MindForth.
    if ($pov == 2) {  # 2016apr01: during a pov "dual" conversation...
      if ($oldpsi == 245) { $prepgen = 8 }  # 2016apr01: if "Where?" call RuPrep()
      # 2017-09-24: Above line needs to test not for English but for Russian.
      if ($oldpsi == 1707) { $psi=1701; $num=1; $dba=1; $rv = 0 } #2016apr01: ТЫ --> Я
      if ($oldpsi == 1701) { $psi=1707; $num=1; $dba=1; $rv = 0 } #2016apr01: Я --> ТЫ
      if ($oldpsi == 1731) { $psi=1737; $num=2; $dba=1; $rv=0 }   #2016apr01: МЫ --> ВЫ
    }  # 2016mar27: end of test for other person communicating with the AI.
    RuParser();   # 2017-09-13: In preparation to call InStantiate().
  }  # 2016feb24: end of test for Russian human-language-code
  $audnew = 0;  # 2016feb09: Reset for sake of $rv of next input word.
  $audpsi = 0;  # 2017-03-15: From MindForth -- prevent carry-over.
  $audrec = 0;  # 2018-09-16: prevent carry-over.
  $finpsi = 0;  #2017-06-28: re-set for safety.
  $len = 0;  # 2017-03-15: From MindForth -- prevent carry-over.
  $mfn = 0;  # 2019-10-23: prevent carry-over to other recognized concepts.
  $prc = 0;  # 2018-09-16: prevent carry-over.
  $tbev = 0;  # 2018-07-06 BUGFIX: prevent carry-over from be-verb to non-be-verb.
}  # 2019-10-23: OldConcept() returns to AudInput().


# 2015may28 Requirements of NewConcept mind-module:
# NewConcept shall create a concept in @psy for each new word encountered.
# A flag-panel shall lodge associative tags with each new @psy concept.
sub NewConcept() {  # http://ai.neocities.org/NewConcept.html
  $psi = $nxt;           # 2016jan22: For xfer to InStantiate().
  $qusub = $nxt;   # 2017-09-22: for sending new concept into SpreadAct()
  $pos = $bias;  # 2017-06-30: InStantiate() stores value from Parser().
  if ($hlc == 1) {     # 2018-09-27: test for governing human-language-code
    EnParser(); # 2017-09-13: In preparation to call InStantiate().
  }  # 2016jan22: end of test for English human-language-code
  if ($hlc == 3) {     # 2018-09-27: test for governing human-language-code
    RuParser(); # 2017-09-13: In preparation to call InStantiate().
  }  # 2016feb24: end of test for Russian human-language-code.
  if ($fyi > 2) {  # 2016feb08: if mode is Diagnostic
  }  # 2016feb07: end of test for Diagnostic or Tutorial mode.
  if ($pos == 5) { $nucon = 1; $qusub = $psi }  # 2017-09-22: send $nxt into SpreadAct()
  $audnew = 0;  # 2016feb09: Reset for sake of $rv of next input word.
  $audpsi = 0;  # 2016feb03: reset to prevent carry-overs.
  $finpsi = 0;  # 2018-09-16: reset to prevent carry-overs.
  $len = 0;     # 2017-09-22: reset
}  # 2016feb10: NewConcept() returns to AudInput() or FileInput().


sub AudRecog() {  # http://ai.neocities.org/AudRecog.html
  if ($len > 0 && $finlen == 0 && $pho eq chr(32)) { $finlen = $len }  # 2017-12-26
  if ($pho ne chr(13)&& $pho ne chr(32) && $pho ne "\N{U+0}") { # 2017-12-24:
    if ($audrec > 0) {  # 2017-03-16: if positive $audrec before end of word...
      if ($pho ne chr(83)) {  # 2017-03-15: keep audrec if current pho is 83=S
        if ($audrec > 0) { $prc = $audrec }  # 2018-09-16: preserve non-final $audrec
        $audrec = 0;  # 2017-03-16: zero out non-final audrec.
      }  # 2017-03-15: end of test for final "S" as inflectional ending.
    }  # 2017-03-15: end of test for $audrec before word-end
  }  # 2017-03-15: end of test for an alphabetic character
  if ($pho eq chr(32) || $pho eq chr(13) || $pho eq "\N{U+0}") {  # 2017-126
    if ($fyi > 0) {  # 2017-12-26: show message
    # print " AudR after audrec= $audrec finds CR-13 or SP-32 \n";  # 2017-12-26
    # print " AudR-SPACE: audrec= $audrec audrun= $audrun prclen= $prclen \n"; # 2019-10-30
    } # 2017-04-05: end of test for fyi=4 Diagnostic Mode.
    if ($audrec > 0) {  # 2017-03-15: if positive audrec before 32=SPACE...
      $audpsi = $audrec;  # 2017-03-15: recognized item becomes storage item.
    }  # 2017-03-15: end of test for a positive audrec before 32=SPACE
  }  # 2017-03-15: end of test for a positive audrec before 32=SPACE
  for (my $i=$spt; $i>$midway; $i--) {  # 2017-03-15: search backwards in time.
    if ($pho ne chr(32)) {  # 2017-03-15: disregard 32=SPACE pho until end of input.
      my @aud=split(',',$ear[$i]);  # 2017-03-15: separate @ear rows into parts.
      if ($pho ne $aud[0]) { $ear[$i] = "$aud[0],0,$aud[2]" }  #2017-03-15: de-activate
      if ($pho eq $aud[0])  { # 2017-03-15: If incoming pho matches stored aud0;
        if ($aud[1]==0) { # 2017-03-15: if matching engram has no activation;
          my @prv=split(',',$ear[$i-1]);  # 2017-03-15: "@prv" for "previous" row.
          if ($prv[0] eq chr(13) || $prv[0] eq chr(32) || $prv[0] eq "\N{U+0}") { # 2017-12-24:
            if ($audrun < 2) { # 2017-03-15: "if comparing start of a word"
              my @nxr=split(',',$ear[($i+1)]);  # 2017-03-15: for next-in-line char
              if ($nxr[0] ne chr(13) && $nxr[0] ne chr(32)) {  # 2017-12-24
                $ear[$i+1] = "$nxr[0],8,$nxr[2]"; # 2017-03-15: "activate N-I-L charcter"
              }  # 2017-03-15: end of test for continuation of stored comparand.
              my @aud=split(',',$ear[($i)]);  # 2017-03-15: for current char
              if ($aud[2] > 0)  {  # 2017-03-15: if concept number present
                $prc = $aud[2];  # 2017-12-26: provisional recognition
              }  # 2017-03-15: end of test for potential monopsi ultimate-tag
            }  # 2017-03-15: "end of test for audrun=1 start of word"
          }  # 2017-03-15: "end of test for a beg(inning) non-active aud0"
        }  # 2017-03-15: "end of test for matching aud0 with no activation"
        my @aud=split(',',$ear[$i]);  # 2017-03-15: break apart @ear auditory array.
        if ($aud[1] > 0) {  # 2017-03-15: "If matching aud0 has activation"
          my @nxr=split(',',$ear[($i+1)]);  # 2017-03-15: for next-in-line char
          if ($nxr[0] eq $pho) {  # 2017-12-26: TEST
            $ear[$i+1] = "$nxr[0],8,$nxr[2]"; # 2017-12-26: "activate N-I-L character"
          }  # 2017-12-26: end of match-test
          if ($nxr[0] eq chr(13) || $nxr[0] eq chr(32) || $nxr[0] eq "\N{U+0}") { # 2017-12-26
            if ($aud[2] > 0) {  # 2017-03-15: check for an audpsi tag
              $prc = $aud[2]; # 2017-10-20: provisional recognition of a stem
              $prclen = $audrun;  # 2019-10-30: for later comparison.
            }  # 2017-03-15: end of test for an available audpsi.
          }  # 2017-03-15: end of test for next-in-line non-alphabetic character.
          if ($aud[2] > 0) { $prc = $aud[2] }  # 2018-09-16: provisional recognition.
          if ($pho eq chr(32) || $pho eq chr(13) || $pho eq "\N{U+0}") { # 2017-12-26
            if ($audrec > 0) {  # 2017-03-15: if an audrec has been found...
              $audpsi = $audrec;  # 2017-03-15: send audpsi into AudMem
            } # 2017-03-15: end of test for a positive audrec
            $audrec = 0;  # 2019-10-30: disallow audrec until last letter of word.
          }  # 2017-03-15: end of test for SPACE-32 or CR-13
          if ($pho ne chr(32)&& $pho ne chr(13)&& $pho ne "\N{U+0}") { # 2017-12-26
            my @nxr=split(',',$ear[($i+1)]);  # 2017-03-15: for next-in-line char
            if ($nxr[0] ne chr(32) && $nxr[0] ne "\N{U+0}" && $finlen==0) { # 2017-12-26
              $ear[$i+1] = "$nxr[0],8,$nxr[2]"; # 2017-03-15: "activate N-I-L character"
            }  # 2017-03-15: since next engram is a letter...
          }  # 2017-03-15: end of test for 32-SPACE after input word.
        }  # 2017-03-15: "End of test for matching aud0 with activation."
      }  # 2017-03-15: "End of test for a character matching 'pho'."
    }  # 2017-03-15: end of test for alphabet letter
  }  # 2017-03-15: End of backwards search through auditory memory.
  if (($audrun - $prclen) < 4) {  # 2019-10-30: if gap less than...
    if (($audrun - $prclen) > 2) {   # 2019-10-30: if gap more than...
      $prc = 0;  # 2019-10-30: revoke provisional recognition.
    }  # 2019-10-30: revoke too short prc-word
  }  # 2019-10-30: end of test for too wide a gap
  if ($audrec > 0) { $audpsi = $audrec }  # 2017-12-26: TEST
  if ($prc > 0) {    # 2017-10-20:
    $audrec = $prc;  # 2017-10-20: from Dushka RuAi; prov. recog;
    if ($audrec > 0) { $audpsi = $audrec }  # 2018-09-16: for passage to AudMem()
  }  # 2017-10-20
  $audrun++;   # 2017-03-15: audrun is only a counter, not a factor.
}  # 2019-10-30: End of AudRecog(); return to AudMem()


sub AudMem() {  # http://ai.neocities.org/AudMem.html
  if ($pho eq chr(13)) { $pov = 2 }  # 2017-03-31: for sake of pause-counter
  $ear[$t] = "$pho,0,0";     # 2017-03-16: store the character in the first column;
  if ($t > $vault) {  # 2017-03-15: Engrams in vault do not need auditory recognition.
   if ($pho eq chr(13)||$pho eq chr(32)||$pho=~/[A-Z]/) {AudRecog()} #2017-12-23
    if ($pho eq "\x80"||$pho eq "\x81"||$pho eq "\x82"){AudRecog()} #2017-12-26
    if ($pho eq "\x83"||$pho eq "\x84"||$pho eq "\x85"){AudRecog()} #2017-12-26
    if ($pho eq "\xF0"||$pho eq "\x86"||$pho eq "\x87"){AudRecog()} #2017-12-26
    if ($pho eq "\x88"||$pho eq "\x89"||$pho eq "\x8A"){AudRecog()} #2017-12-26
    if ($pho eq "\x8B"||$pho eq "\x8C"||$pho eq "\x8D"){AudRecog()} #2017-12-26
    if ($pho eq "\x8E"||$pho eq "\x8F"||$pho eq "\x90"){AudRecog()} #2017-12-26
    if ($pho eq "\x91"||$pho eq "\x92"||$pho eq "\x93"){AudRecog()} #2017-12-26
    if ($pho eq "\x94"||$pho eq "\x95"||$pho eq "\x96"){AudRecog()} #2017-12-26
    if ($pho eq "\x97"||$pho eq "\x98"||$pho eq "\x99"){AudRecog()} #2017-12-26
    if ($pho eq "\x9A"||$pho eq "\x9B"||$pho eq "\x9C"){AudRecog()} #2017-12-26
    if ($pho eq "\x9D"||$pho eq "\x9E"||$pho eq "\x9F"){AudRecog()} #2017-12-26
  }  # 2017-03-15: end of test for time-point beyond MindBoot vault.
  if ($audpsi > 0) {  # 2017-03-15: if there is a recognized audpsi
    if ($t > $vault) {  # 2017-03-15: during normal time beyond MindBoot vault...
      my @aud=split(',',$ear[($t-1)]);    # 2017-10-25: look at penultimate row
      # 2017-03-16: above line yields $aud[0] $aud[1] $aud[2]
      $ear[$t-1] = "$aud[0],$aud[1],$audpsi";  # 2017-10-20: store just prior to 32=SPACE.
      if ($aud[0] eq chr(83)) {   # 2018-09-16: if word ends in 83=S like a plural...
        my @aud=split(',',$ear[($t-2)]);  # 2018-09-16: go back one line earlier.
        # 2018-09-16: above line yields $aud[0] $aud[1] $aud[2]
        $ear[$t-2] = "$aud[0],$aud[1],$audpsi";  # 2018-09-16: store back one space.
      }  # 2018-09-16: end of test for "S" possibly indicating an inflection.
    }  # 2017-03-15: end of test for time past "vault" of MindBoot.
  }  # 2017-03-15: end of test for recognized word.
}  # 2017-03-15: AudMem() returns to AudInput().


sub AudListen() {  # http://ai.neocities.org/AudListen.html
    my $unk = "";  # 2017-03-25:
    for ($attn = 0; $attn < 3000; $attn++ )  {  # 2017-03-27: start input wait-loop
      use Term::ReadKey;    # 2017-03-23: PBlackBook p. 543
      ReadMode('cbreak');   # 2017-03-23: PBlackBook p. 543
      if (defined ($unk = ReadKey(-1)) ) {  # 2017-03-25: PerlBlackBook 543
        $doa = $unk;  # 2017-03-25: only for early exit from AudInput
        if ($unk eq chr(48)) { $hap=10; TacRecog(); $unk = ""; }  # 2019-11-04:
        if ($unk eq chr(49)) { $hap=1; TacRecog(); $unk = ""; }  # 2019-11-02:
        if ($unk eq chr(50)) { $hap=2; TacRecog(); $unk = ""; }  # 2019-11-02:
        if ($unk eq chr(51)) { $hap=3; TacRecog(); $unk = ""; }  # 2019-11-02:
        if ($unk eq chr(52)) { $hap=4; TacRecog(); $unk = ""; }  # 2019-11-04:
        if ($unk eq chr(53)) { $hap=5; TacRecog(); $unk = ""; }  # 2019-11-04:
        if ($unk eq chr(54)) { $hap=6; TacRecog(); $unk = ""; }  # 2019-11-04:
        if ($unk eq chr(55)) { $hap=7; TacRecog(); $unk = ""; }  # 2019-11-04:
        if ($unk eq chr(56)) { $hap=8; TacRecog(); $unk = ""; }  # 2019-11-04:
        if ($unk eq chr(57)) { $hap=9; TacRecog(); $unk = ""; }  # 2019-11-04:
        $unk = uc $unk;  # 2017-03-31: change to uppercase (uc)
        $pho = $unk; last;  # 2017-03-25:
      } else {      # 2017-03-25:
        print chr 8; # 2017-03-29: ASCII BACKSPACE-8
      }  # 2017-03-25
      ReadMode('normal');  # PBlackBook p. 543
    }  # 2017-03-23: end of input waiting loop.
} # 2019-11-04: AudListen returns to AudInput()


sub AudInput() {  # http://ai.neocities.org/AudInput.html
  $audpsi = 0;  # 2017-03-15: From MindForth -- prevent carry-over.
  $iob = 0;  # 2017-09-13: reset indirect-object identifier for safety.
  $spt = $t;      # 2016jan28: as in FileInput() module.
  $tio = 0; # 2017-09-13: reset at level above EnParser() and InStantiate()
  $tsn = $t;      # 2016mar13: current input is time-of-seqneed $tsn
  $_ = " ";       # 2016FEB03: PERL by Example (2015), p. 301
# if ($pov == 2 && $hlc == 3) {  # 2018-09-27: prevent user-prompt during thinking
  if ($pov == 2) {  # 2019-06-03: regardless of language
    if ($fyi == 1) { print "\nNow in user input Normal Mode." } # 2017-04-12
    if ($fyi == 2) { print "\nNow in user input Transcript Mode." } # 2017-04-12
    if ($fyi == 3) { print "\nNow in user input Tutorial Mode." } # 2017-04-12
    if ($fyi == 4) { print "\nNow in user input Diagnostic Mode." } # 2017-04-12
    if ($fyi > 2) {  # 2019-10-21: if Tutorial or Doagnostic Mode...
      print "\nTab cycles mode; Esc(ape) quits AI born $dob"; #2019-06-03
      print "\nt= $t Enter English or Russian as Subject-Verb-Object: \n \n"; #2019-06-03
    }  # 2019-10-21: end of test for Tutorial Mode or Diagnostic Mode.
  }  # 2017-03-31: end of pov-check for displaying user-prompt.
  for ($hear = 0; $hear < 141; $hear++ )  {  # 2017-03-23: start input wait-loop
    if ($pov == 2) { # 2017-03-30: during external input
      AudListen();  # 2017-03-24: check for keyboard input....
      if ($pho eq chr(27)) { print "The $vrsn.pl AI now ceases to live and think. \n"; } #09-11
      if ((ord $pho) == 27) { die "TERMINATE AI alive since $dob. \n"; } # 2019-01-25
      if ($pho eq "\xA0"||$pho eq "\x80") {$pho="\x80"; $hlc=3} # А
      if ($pho eq "\xA1"||$pho eq "\x81") {$pho="\x81"; $hlc=3} # Б
      if ($pho eq "\xA2"||$pho eq "\x82") {$pho="\x82"; $hlc=3} # В
      if ($pho eq "\xA3"||$pho eq "\x83") {$pho="\x83"; $hlc=3} # Г
      if ($pho eq "\xA4"||$pho eq "\x84") {$pho="\x84"; $hlc=3} # Д
      if ($pho eq "\xA5"||$pho eq "\x85") {$pho="\x85"; $hlc=3} # Е
      if ($pho eq "\xF1"||$pho eq "\xF0") {$pho="\xF0"; $hlc=3} # Ё
      if ($pho eq "\xA6"||$pho eq "\x86") {$pho="\x86"; $hlc=3} # Ж
      if ($pho eq "\xA7"||$pho eq "\x87") {$pho="\x87"; $hlc=3} # З
      if ($pho eq "\xA8"||$pho eq "\x88") {$pho="\x88"; $hlc=3} # И
      if ($pho eq "\xA9"||$pho eq "\x89") {$pho="\x89"; $hlc=3} # Й
      if ($pho eq "\xAA"||$pho eq "\x8A") {$pho="\x8A"; $hlc=3} # К
      if ($pho eq "\xAB"||$pho eq "\x8B") {$pho="\x8B"; $hlc=3} # Л
      if ($pho eq "\xAC"||$pho eq "\x8C") {$pho="\x8C"; $hlc=3} # М
      if ($pho eq "\xAD"||$pho eq "\x8D") {$pho="\x8D"; $hlc=3} # Н
      if ($pho eq "\xAE"||$pho eq "\x8E") {$pho="\x8E"; $hlc=3} # О
      if ($pho eq "\xAF"||$pho eq "\x8F") {$pho="\x8F"; $hlc=3} # П
      if ($pho eq "\xE0"||$pho eq "\x90") {$pho="\x90"; $hlc=3} # Р
      if ($pho eq "\xE1"||$pho eq "\x91") {$pho="\x91"; $hlc=3} # С
      if ($pho eq "\xE2"||$pho eq "\x92") {$pho="\x92"; $hlc=3} # Т
      if ($pho eq "\xE3"||$pho eq "\x93") {$pho="\x93"; $hlc=3} # У
      if ($pho eq "\xE4"||$pho eq "\x94") {$pho="\x94"; $hlc=3} # Ф
      if ($pho eq "\xE5"||$pho eq "\x95") {$pho="\x95"; $hlc=3} # Х
      if ($pho eq "\xE6"||$pho eq "\x96") {$pho="\x96"; $hlc=3} # Ц
      if ($pho eq "\xE7"||$pho eq "\x97") {$pho="\x97"; $hlc=3} # Ч
      if ($pho eq "\xE8"||$pho eq "\x98") {$pho="\x98"; $hlc=3} # Ш
      if ($pho eq "\xE9"||$pho eq "\x99") {$pho="\x99"; $hlc=3} # Щ
      if ($pho eq "\xEA"||$pho eq "\x9A") {$pho="\x9A"; $hlc=3} # Ъ
      if ($pho eq "\xEB"||$pho eq "\x9B") {$pho="\x9B"; $hlc=3} # Ы
      if ($pho eq "\xEC"||$pho eq "\x9C") {$pho="\x9C"; $hlc=3} # Ь
      if ($pho eq "\xED"||$pho eq "\x9D") {$pho="\x9D"; $hlc=3} # Э
      if ($pho eq "\xEE"||$pho eq "\x9E") {$pho="\x9E"; $hlc=3} # Ю
      if ($pho eq "\xEF"||$pho eq "\x9F") {$pho="\x9F"; $hlc=3} # Я
      if ($pho =~ /[a-z]/ || $pho =~ /[A-Z]/) { $hlc=1 }    # 2018-09-27: switch
      if ($pho ne " ") { $abc = $pho; }  # 2019-10-22: for transfer to AudBuffer()
      if ($pho eq " ") { $phodex = 0; }  # 2019-06-10: to separate input words
      $text = $text.$pho;  # 2017-11-27: concatenation, Perl Black Book p. 149
      print ($text); # 2017-11-27: show accumulation of concatenated input.
        if ($pho eq chr(9)) {  # 2017-04-12: if user presses Tab-key...
        $fyi = ($fyi + 1);  # 2017-04-12: change to next user-input-mode
        if ($fyi > 4) {$fyi = 1}  # 2017-04-12: cycle back to Normal Mode.
      }  # 2017-04-12: end of test for press of Tab-key to change modes.
      if ($pho eq chr(9)) {  # 2019-01-25: if user presses ASCII-9 TAB key...
        print "\n TAB changes display mode to $fyi"; # 2019-01-25: situation-report
        if ($fyi==0) { print " = bare-bones \n"; }   # 2019-01-25: without prompt.
        if ($fyi==1) { print " = Normal. \n"; }      # 2019-01-25: input/output.
        if ($fyi==2) { print " = Transcript. \n"; }  # 2019-01-25: future
        if ($fyi==3) { print " = Tutorial. \n"; }    # 2019-01-25: with arrays.
        if ($fyi==4) { print " = Diagnostic. \n"; }  # 2019-01-25: with arrays.
      }  # 2019-01-25: expanded snippet informs user of change of display-mode.
      if ($pho eq chr(27)) { print "Ghost AI now ceases to live and think. \n"; }
      if ($pho eq chr(27)) { die "TERMINATE: ESCape key for quit. \n"; } # 2017-03-27
      if ((ord $pho) == 0) {  # 2017-03-30: if no user input comes in...
        $impetus++; # 2017-12-03: if no input, increment $impetus for Volition()
        $isolation++;  # 2018-10-08: if no input, increment trigger for Imperative()
        $gapcon--;  # 2017-04-10: decrement gapcon for each loop with no input.
        if ($gapcon < 1)  {  # 2017-04-10: after an arbitrary pause for input...
          $pho = "\n";  # 2017-03-30: supply CR not entered by human user.
          $gapcon = 12; # 2017-04-12: reset gapcon as chosen by Mind-maintainer
          $len = 0;    # 2017-03-30: Reset so next word must accumulate length.
          $hear = 0;  # 20178-03-30: reset the main AudInput() loop.
          last;  # 2017-03-30: [Forth: LEAVE] exit from AudInput pause-loop.
        }  # 2017-03-30: end of test of size of no-input gap.
      }  # 2017-03-30: end of test for input to advise users to wait patiently.
      if ((ord $pho) > 0) { # 2017-12-21: if a character has come in...
        $t++;  # 2017-12-21: increment internal AI time "t" for AudMem()
      }  # 2017-12-21: end of test for a key-input.
      if ((ord $pho) > 32) { # 2017-12-21: if alphabetic letter has come in...
        $len++;  # 2017-12-21: increment word-length for AudRecog()
      }  # 2017-12-21: end of test for a letter of the alphabet
      if ($pho eq chr(83)) {  # 2017-04-30: if uppercase "S"...
#       $num = 2;  # 2017-04-30: tentative assignment of plural num(ber)
#       $num = 2;  # 2019-06-13: may interfere with third-person SINGULAR verbs.
      }  # 2017-04-30: end of test for 83=S
      if ($pho ne chr(32)) {  # 2017-04-30: if not 32=SPACE
        if ($pho ne chr(83)) {  # 2017-04-30: if not uppercase "S"...
          $num = 1;  # 2017-04-30: tentative assignment of singular num(ber)
        }  # 2017-04-30:
      }  # 2017-04-30: end of space-test needed because of any $tult before SPACE.
      if ((ord $pho) < 33) {  # 2017-04-30: if not an alphabetical character
#       if ($endpho eq chr(83)) { $num = 2 }  # 2017-04-30: if final 83=S
#       if ($endpho eq chr(83)) { $num = 2 }  # 2019-06-13: not for 3rd person SINGULAR
      }  # 2017-12-16: for $num
      if ((ord $pho) > 31 || (ord $pho) == 13) {  # 2017-12-21: CR, SPACE, alphabetic letter
        if ($len == 1 && (ord $pho) != 32) {  # 2017-12-21: set only at start of a word
          if ($rv == 0 && (ord $pho) != 32) {  # 2017-12-21: no $rv for 32=SPACE
            $rv = $t;  # 2017-12-21: set recall-vector.
          }  # 2017-12-21: end of test for not-yet-set value; 2017-09-22: use len(gth)
        }  # 2017-12-21: end of more complex setting of value.
        if ($len == 0) { $audrec = 0 }  # 2017-12-21: prevent carry-over.
      if ($len > 0) {  # 2017-12-21: if incoming word already in progress.
        $endpho = $pho;  # 2017-12-21: keep track of previous character, for $num
        if ((ord $pho) == 32 || (ord $pho) == 13) { $len++ }  # SPACE increments length
      }  # 2017-12-21: end of test for at least a one-character word
      AudMem();  # 2018-09-27: for English or Russian input.
    }  # 2017-12-21: end of conditional test for entering or reentering character.
    if ((ord $pho) == 13) {  # 2017-12-21: CR-13 carriage-return
      $pho = chr 32;  # 2017-12-21: use SPACE for the recognition of a word.
      $audrun = 1;  # 2017-12-21: Reset to one at CR end of input
      $eot = 13;  # 2017-12-21: end of transmission (EOT)
      print chr 10;  # 2017-12-21: ASCII linefeed LF-10
    }  # 2017-12-21: end of test for Enter-key carriage-return.
    if ((ord $pho) == 32 || (ord $pho) == 13) {  # 2017-12-21: after SPACE or CR...
      $audpsi = $finpsi;  # 2017-12-21: TEST -- retain final psi before 13-CR
      $pho = chr 32;  # 2017-12-21: use SPACE for the recognition of a word.
      $audrun = 1;  # 2017-12-21: Reset to unity at end of a word.
      $spt = $t;   # 2017-12-21: set time-of-SPACE "spt" to current time "t".
      $tult = $t - 1;  # 2017-12-21: for storage at prior-by-one time-point.
      if ($audrec > 0) { $audpsi = $audrec }  # 2017-12-21
      if ($audpsi > 0) {  # 2017-12-21: if a word has been recognized...
        $impetus = 0;  # 2017-12-21: reset flag of counting no-input cycles.
        $isolation = 0;  # 2018-10-08: reset flag of counting no-input cycles.
        $sublen = 0;  # 2017-12-21: length of AudRecog subpsi word-stem
        $oldpsi = $audpsi;  # 2017-12-21: transfer value for OldConcept().
        $audpsi = 0;  # 2017-12-21: re-set to prevent carry-over.
        $prc = 0;  # 2017-03-30: reset provisional recognition "prc";
        OldConcept();  # 2017-12-21: call module for recognized concepts.
      } else {  # 2017-12-21: if no old concept is recognized...
        if ($len > 0) {  # 2017-12-21: if dealing with a word of positive length...
          $impetus = 0;  # 2017-12-21: reset flag of counting no-input cycles.
          $isolation = 0;  # 2018-10-08: reset flag of counting no-input cycles.
          my @aud=split(',',$ear[($t)]);  # 2017-12-21: break apart @aud row
          $ear[$t] = " ,$aud[1],$aud[2]"; # 2017-12-21: store 32=SPACE
          NewConcept();  # 2017-12-21: create new concept with number "nxt".
             @aud=split(',',$ear[($t)-1]);  # 2017-12-21: avoid "my" twice
          $ear[$t-1] = "$aud[0],$aud[1],$nxt"; # 2017-12-21: As in MindForth AI
          $nxt++;   # 2017-12-21:
        }  # 2017-12-21: end of test for a positive word-length.
      }  # 2017-12-21: end of test for a recognized audpsi concept.
      AudDamp();  # 2017-12-21: de-activate auditory memory in advance of next word.
    } # 2017-12-21: end of test for 32=SP or 13=CR to make sure word has ended
  } # 2017-12-21: new end of test for pov=2
  if ($pho ne " ") { $abc = $pho; }  # 2019-10-22 BUGFIX: for transfer to AudBuffer()
  if ($pho ne "" && $PAL == 1) { AudBuffer(); }  # 2019-10-30: except during EnVerbGen()
  if ($pho eq " ") { $phodex = 1; }  # 2019-10-22: to separate input words
  if (ord $doa == 13) { # 2017-12-21: if a 13=CR has been entered...
    $doa = 0;  # 2017-12-21: reset to prevent carry-over.
    last;  # 2017-12-21: exit from loop
  }  # 2017-12-21: end of test for CR=13
  if ($pov == 1) {  # 2016-12-16: for reentrant engrams without a hear-loop.
    if ((ord $pho) > 0) {  # 2017-03-30: if a character has come in...
      $t++;  # 2017-12-18: increment internal AI time "t" for AudMem()
    }  # 2017-03-30: end of test for a key-input.
    if ((ord $pho) > 32) {  # 2017-04-01: if alphabetic letter has come in...
      $len++;  # 2017-12-18: increment word-length for AudRecog()
    }  # 2017-04-01: end of test for a letter of the alphabet
    if ($pho eq chr(83)) {  # 2017-04-30: if uppercase "S"...
#     $num = 2;  # 2017-04-30: tentative assignment of plural num(ber)
#     $num = 2;  # 2019-06-13: may interfere with third-person SINGULAR verb-forms.
    } # 2017-04-30: end of test for 83=S
    if ($pho ne chr(32)) {   # 2017-04-30: if not 32=SPACE
      if ($pho ne chr(83)) { # 2017-04-30: if not uppercase "S"...
        $num = 1;  # 2017-04-30: tentative assignment of singular num(ber)
      } # 2017-12-18: end of test for "S".
    } # 2017-04-30: end of space-test needed because of any $tult before SPACE.
    if ((ord $pho) < 33) {  # 2017-04-30: if not an alphabetical character
#     if ($endpho eq chr(83)) { $num = 2 }  # 2017-04-30: if final 83=S
#     if ($endpho eq chr(83)) { $num = 2 }  # 2019-06-13: not for 3rd person SINGULAR
    } # 2017-12-18: end of test for a non-alphabetic character
    if ((ord $pho) > 31 || (ord $pho) == 13) {  # 2017-12-16: 13=CR carriage return
      if ($len == 1 && (ord $pho) != 32) {  # 2017-09-24 BUGFIX: no $rv for 32=SPACE
        $rv = $t;  # 2017-12-16: for a word of a single letter.
      }  # 2017-04-07: end of more complex setting of value.
      if ($len == 0) { $audrec = 0 }  # 2017-04-05: prevent carry-over.
        if ($len > 0) {  # 2017-04-1: if incoming word already in progress.
          $endpho = $pho;  # 2017-04-30: keep track of previous character, for $num
          if ((ord $pho) == 32 || (ord $pho) == 13) { $len++ }  # 2017-12-18: increment
        }  # 2017-04-01: end of test for at least a one-character word
        AudMem();  # 2018-09-27: for English or Russian input.
      }  # 2017-03-30: end of conditional test for entering or reentering character
      if ((ord $pho) == 13) {  # 2017-03-30: CR-13 carriage-return
        $pho = " ";    # 2016-06-24: use SPACE for recognition of word.
        $audrun = 1;   # 2017-03-30: Reset to one at CR end of input.
        $eot = 13;     # 2017-03-30: end of transmission (EOT)
        print chr 10;  # 2017-03-30: ASCII linefeed LF-10
      }  # 2017-03-30: end of test for Enter-key carriage-return.
      if ((ord $pho) == 32 || (ord $pho) == 13) {  # 2017-03-30: after SPACE or CR...
        $audrun = 1;  # 2017-03-30: Reset to unity at end of a word.
        $spt = $t;    # 2017-03-30: set time-of-SPACE "spt" to current time "t".
        $tult = $t - 1;  # 2017-03-30: for storage at prior-by-one time-point.
        if ($monopsi > 0) { $audpsi = $monopsi }  # 2017-06-24
        if ($audrec > 0) { $audpsi = $audrec }  # 2017-06-24
        if ($audpsi > 0) {  # 2017-03-30: if a word has been recognized...
          $sublen = 0;      # 2017-03-30: length of AudRecog subpsi word-stem
          $oldpsi = $audpsi;  # 2017-03-30: transfer value for OldConcept().
          $audpsi = 0;      # 2017-03-30: re-set to prevent carry-over.
          $prc = 0;         # 2017-03-30: reset provisional recognition "prc";
          OldConcept();     # 2017-03-30: call module for recognized concepts.
          $rv = 0;  # 2017-09-22: so new $rv may be set
        } else {    # 2017-03-30: if no old concept is recognized...
          if ($len > 0) {   # 2017-03-30: if dealing with a word of positive length...
            my @aud=split(',',$ear[($t)]);  # 2017-03-31: break apart @aud row
            $ear[$t] = " ,$aud[1],$aud[2]"; # 2017-03-31: store 32=SPACE
            NewConcept();  # 2017-03-30: create new concept with number "nxt".
            $rv = 0;       # 2017-09-22: so new $rv may be set
            @aud=split(',',$ear[($t)-1]);  # 2017-03-31: avoid "my" twice
            $ear[$t-1] = "$aud[0],$aud[1],$nxt";  # 2017-03-30: As in MindForth AI
            if ($len > 1) { $nxt++; }  # 2017-04-23: like MindForth here, not NewConcept()
          }  # 2017-03-30: end of test for a positive word-length.
        } # 2017-03-30: end of test for a recognized audpsi concept.
        AudDamp(); # 2017-03-30: de-activate auditory memory in advance of next word.
      }  # 2017-03-30: end of test for 32=SP or 13=CR to make sure word has ended
    } # 2017-06-23: end of test for reentrant pov=1
    ReadMode('normal');  # PBlackBook p. 543
    if ($pov == 2)  {  # 2017-04-02: only during external input...
      $msg = $msg.$pho;  # 2017-03-25: concatenation, Perl Black Book p. 149
    }  # 2017-04-02: end of test for accumulating only user input
    if ($pho eq "\r") { $eot = 13; print "\n"; } # 2017-12-26: end of transmission
    ReadMode('normal');  # PBlackBook p. 543
    if (ord $doa == 13) {  # 2017-03-25: Perl Black Book p. 354 ASCII "ord"
      $pho = " ";  # 2017-04-01: convert CR-13 to SPACE-32
      $doa = 0;  # 2017-03-26: Reset to prevent carry-over.
      $hear = 0;  # 2017-04-02: reset the main AudInput() loop.
    }  # 2017-03-25: end of test for CR-13 to make early exit from loop.
    if ($unk eq chr(27)) { die "TERMINATE: ESCape key for quit. \n"; } # 2017-03-24
    $pho = "";  # 2017-03-24: From MindForth: must be reset to zero each time.
    ReadMode('normal');  # PBlackBook p. 543
    $homo = $msg;  # 2017-03-25: for HCI in Sensorium
    if ($unk eq chr(10)) { print "End of input \n"; last }  # 2017-03-23
    if ($reentcon == 1)  { $msg = $idea }  # 2017-03-26: from ReEntry()
    if ($pho eq chr(27)) { die "TERMINATE: ESCape for quit. \n"; } # 2017-03-18
    if ($pho eq "\n") { $eot = 1 }  # 2016feb01: for escape from outer loop.
    if ($pho eq "\n" && $msg eq "") { $trigger++ } # 2016apr29
#   if ($t > $cns) { die "Safety stop: out of memory \n"; }  # 2016apr09
#   if ($t > $cns) { die "Safety stop: out of memory \n"; }  # 2018-11-08
    if (ord $pho == 13 || ord $pho == 32) { #2017-03-30
      if ($audnew == 0) {$audnew = $t};  # 2016feb09 Set only once.
      if ($fyi > 2 && $hlc == 3) {     # 2018-09-27: if mode is Diagnostic
        print "  pho $pho is an alphabetic letter \n";  # 2016jan29
      }  # 2016feb07: end of test for Diagnostic or Tutorial mode.
      if ($fyi > 2 && $hlc == 3) {     # 2018-09-27: if mode is Diagnostic
        print " AudInput: increasing len(gth) to $len \n";  # 2016jan31
      }  # 2016feb07: end of test for Diagnostic or Tutorial mode.
      if ($len < 1) { $audrec = 0 }  # 2017-03-16: prevent carry-over.
      if ($len < 1) { $audpsi = 0 }  # 2017-03-16: prevent carry-over.
      if ($len == 1 && $rv == 0) { $rv = $t }  # 2017-09-24: set recall-vector.
    }  # 2017-03-31: removing else-block from code above
    if ($len == 1) { $rv = $t }  # 2017-09-10: TEST; CORRECT BUG?
    if ($audnew == 0) { $audnew = $t }   # 2018-09-27: Set only once.
  } # 2017-12-27: end of test for $pov==1 (during re-entry of output).
  $pos = 0;      # 2016mar12: Reset to prevent InStantiate() carry-over.
  $pre = 0;      # 2016mar12: Reset to prevent InStantiate() carry-over.
  $psi = 0;      # 2016mar12: Reset to prevent InStantiate() carry-over.
  if ($pho eq "\n") { $eot = 1 }  # 2016feb01: for escape from outer loop.
  $monopsi = 0;  # 2016feb06: zero out to prevent carry-over
  if ($audpsi > 0) {       # 2016jan30: would be from AudRecog()
    $oldpsi = $audpsi; # 2016jan30: JSAI: for conformance with MindForth
    $audpsi = 0;  # 2016feb04: zero out to prevent carry-over
    $prc = 0;  # 2016feb06: as is done in the JavaScript AiMind.html
  }  # 2017-03-30: for termination of code commented out
  $audpsi = 0;  # 2016jan30: reset for safety
  $eot = 0;  # 2016feb02: Reset to zero for the sake of whole sentences.
  $audpsi = 0;  # 2016jan30: reset for safety
  $psi = 0;  # 2016mar12: Reset to prevent carry-over.
}  # 2019-10-30: AudInput() returns to Sensorium() or Speech().


sub GusRecog() {  # 2016may01: stub for gustatory recognition of taste
  # http://mind.sourceforge.net/gusrecog.html
}  # 2016may01: GusRecog() will return to the Sensorium() module.


sub OlfRecog() {  # 2016may01: stub for olfactory recognition of smells
  # http://mind.sourceforge.net/olfrecog.html
}  # 2016may01: OlfRecog() will return to the Sensorium() module.


sub TacRecog() {  # http://ai.neocities.org/TacRecog.html
  $haptac = 755;  # 2019-11-03: a default value of 755=SOMETHING
  if ($hap == 1) { print "\a"; $haptac = 551; }  # 2019-11-04:
  if ($hap == 2) { print "\a"; $haptac = 582; }  # 2019-11-04:
  if ($hap == 3) { print "\a"; $haptac = 583; }  # 2019-11-04:
  if ($hap == 1) { print "\a"; $haptac = 551; }  # 2019-11-04:
  if ($hap == 2) { print "\a"; $haptac = 582; }  # 2019-11-04:
  if ($hap == 3) { print "\a"; $haptac = 583; }  # 2019-11-04:
  if ($hap == 4) { print "\a"; $haptac = 544; }  # 2019-11-04:
  if ($hap == 5) { print "\a"; $haptac = 545; }  # 2019-11-04:
  if ($hap == 6) { print "\a"; $haptac = 566; }  # 2019-11-04:
  if ($hap == 7) { print "\a"; $haptac = 577; }  # 2019-11-04:
  if ($hap == 8) { print "\a"; $haptac = 588; }  # 2019-11-04:
  if ($hap == 9) { print "\a"; $haptac = 559; }  # 2019-11-04:
  if ($hap == 10) { print "\a"; $haptac = 590; }  # 2019-11-04: "ten" standing in for ZERO
  if ($haptac > 0 && $haptac != 755) {  # 2019-11-04: for any positive value except 755
    $actpsi = 701; SpreadAct();  # 2019-11-04: activate 701=I as a subject
    $actpsi = 823; SpreadAct();  # 2019-11-04: activate 823=FEEL as a verb
  }  # 2019-11-04: use SpreadAct() for 823=FEEL
} # 2019-11-04: returns to AudListen(); Sensorium(); or EnVerbPhrase()


# The visual recognition module in the Perlmind for robots
# when fully implemented will serve the purpose of letting
# AI Minds dynamically describe what they see in real time
# instead of fetching knowledge from the AI knowledge base.
sub VisRecog() {  # http://ai.neocities.org/VisRecog.html
  # 2016jan22: NOTHING = default answer for "What do you see?"
  # http://medium.com/p/12c25b2570b2 -- How Strong AI recognizes an image
  # 2017-04-10: http://ai.neocities.org/VisRecog.gif -- animated VisRecog
  if ($hlc == 1) {     #2018-09-27: separate code for English and Russian...
    if ($svo4 == 0)  {  # 2017-04-11: if no direct object is available;
      for (my $i=$t; $i>$midway; $i--)    {  # 2018-09-27: search for 760=NOTHING
        my @k=split(',',$psy[$i]);     # 2018-09-27: examine @psy array;
        if ($k[1] == 760) {  # 2017-06-08: if psi 760=NOTHING is found;
          $aud = $k[20];  # 2019-08-01: "NOTHING" recall-vector for Speech()
          last;  # 2017-04-11: exit from loop;
        }  # 2017-04-11: End of search for 760=NOTHING;
      }  # 2017-04-11: End of search loop from $t back to $midway.
    }  # 2017-04-11: end of test for a noun to fill in "I SEE ____".
  }  # 2017-06-30: end of test for English thinking.
  if ($hlc == 3) {     #2018-09-27: separate code for English and Russian...
    # 2017-06-30: Russian search for "1228=НИЧЕГО" or "NOTHING"
    if ($svo4 == 0)  {  # 2017-06-30: if no direct object is available;
      for (my $i=$t; $i>$midway; $i--) {  # 2017-06-30: search for 1228=НИЧЕГО
        my @k=split(',',$psy[$i]);  # 2017-06-30: examine @psy array;
        if ($k[1] == 1228) {  # 2017-06-30: if psi 1228=NOTHING is found;
          $nphrpos = $k[6];  # 2017-09-03: set for EnArticle.
          $aud = $k[20];  # 2019-08-01: "NOTHING" recall-vector for Speech()
          last;  # 2017-06-30: exit from loop;
        }  # 2017-06-30: End of search for 1228=NOTHING;
      }  # 2017-06-30: End of search loop from $t back to $midway.
    }  # 2017-05-40: end of test for a noun to fill in "I SEE ____".
  }  # 2017-06-30: end of test for Russian thinking.
  Speech();  # 2017-04-11: speak the word starting at the $aud time.
  # http://www.starboundliterature.space/visual-art.html
} # 2019-08-01: VisRecog returns to Sensorium +/- NLP generation modules.


sub Sensorium() {  # http://ai.neocities.org/Sensorium.html
  TacRecog();      # 2019-11-02: check for tactile sensory input.
  $b16="";$b15="";$b14="";$b13="";  # 2019-10-23: empty OutBuffer() before input.
  $b12="";$b11="";$b10="";$b9="";$b8="";$b7=""; # 2019-10-23: expandable reverse order
  $b6="";$b5="";$b4="";$b3="";$b2="";$b1="";    # 2019-10-23: last 6 chars in word.
  $finlen = 0;     # 2017-12-26: reset for safety.
  $len = 0;        # 2017-03-31: [MindForth] let other modules increase len(gth
  $prclen = 0;     # 2019-10-30: prevent carry-over.
  $verbcon = 0;    # 2017-06-25: a reset moved to here from AudInput().
  if ($fyi > 2) {  # 2019-11-02: if mode is Diagnostic
    print "\nEnter simple English or Russian to the Artificial Intelligence: \n"; #2019-11-02
  }  # 2019-11-02: end of test for Diagnostic or Tutorial mode.
  print "\n$homo"; # 2019-10-21: display most recent human input.
# print "\n  Ghost: $output \n";  # 2017-12-08: array-display; output; input...
  print "\nGhost: $output ";  # 2019-10-21: array-display; output; input...
  $output = "";  # 2018-09-12: prevent build-up.
# print "\n  Human: $homo \n";  # 2019-10-21: invite human input as response to AI.
# print "\nHuman: $homo ";  # 2019-10-21: invite human input as response to AI.
  print "\nHuman: \n";  # 2019-10-21: invite human input as response to AI.
  $msg = "";  # 2017-03-31: prevent spurious carry-over of input message.
  if ($chaincon == 0) {  # 2016apr15: if no chain of thought in progress...
    AudInput();    # 2015apr25: Calling the sense of audition.
    $krt = $t;     # 2017-03-29: KR time after input
    $len = 0;      # 2017-03-29: reset to prevent carry-over during reentry.
    $text = "";    # 2017-11-27: reset to prevent build-up.
    $tvb = 0;  # 2018-07-05: reset to prevent false $tkb-values on verbs.
  }  # 2016apr15: end of test for an internal chain of thought.
  if ($whatcon == 1)  { SpreadAct() }  # 2018-09-30: set by InStantiate()
# FileInput();     # 2016jan10: Inputting from file, not keyboard.
# GusRecog();      # http://mind.sourceforge.net/gusrecog.html
# OlfRecog();      # http://mind.sourceforge.net/olfrecog.html
# TacRecog();      # http://mind.sourceforge.net/tacrecog.html
# VisRecog();      # 2015apr26: Opportunity to add vision.
# http://en.wikipedia.org/wiki/Symbol_grounding_problem
  $pov = 1;  # 2017-12-08: during thinking; prevents duplicate line of display.
} # 2019-10-23: Sensorium() module returns to MainLoop.


sub MindBoot() {  # http://ai.neocities.org/MindBoot.html
  $dob = $birth;  # 2017-03-30: isolated from dynamic $birth value.
  $t = 0;  # 2015apr26: bootstrap stretches over time "$t".
  print "MindBoot loads the knowledge base... ";  # 2019-01-25
  print "TAB to change display-mode. \n";  # 2019-01-25:
  # ERROR -- first word so any bug will announce itself
  $t=0; $ear[$t] = "E,0,0";    # 2016mar12
  $t=1; $ear[$t] = "R,0,0";    # 2016mar12
  $t=2; $ear[$t] = "R,0,0";    # 2016mar12
  $t=3; $ear[$t] = "O,0,0";    # 2016mar12
  $t=4; $ear[$t] = "R,0,586";  # 2016mar12
  $tru = 0;  # 2018-09-26: TEST to prevent uninitialized value
  $psi=586; $hlc=1; $jux=0; $pos=5; $dba=0; $num=1; $mfn=3;  # 2018-09-27
  $pre=0;   $seq=0;    $tkb=0; $rv=0; KbLoad();  # 2018-07-01: flag-panel in order.

  # I -- for SelfReferentialThought; hard-coded knowledge-base; 2018-09-08
$t=6; $ear[$t] = "I,0,701";    # 2018-09-08
  $tru=8; $psi=701; $hlc=1; $pos=7; $dba=1; $num=1; # 2018-09-30
  $seq=800; $tkb=9; $rv=6; KbLoad(); # 2018-09-08: flag-panel order

  # AM -- 1st person singular of 800=BE; hard-coded knowledge-base; 2018-09-08
$t=8; $ear[$t] = "A,0,0";    # 2018-09-08
$t=9; $ear[$t] = "M,0,800";  # 2018-09-08
  $psi=800; $hlc=1; $pos=8; $dba=1; $num=1; # 2018-09-27
  $pre=701; $seq=501;  $tkb=15; $rv=8; KbLoad(); # 2018-09-08: flag-panel order

  # ANDRU -- for SelfReferentialThought; hard-coded knowledge-base; 2018-09-08
$t=11; $ear[$t] = "A,0,0";    # 2018-09-08
$t=12; $ear[$t] = "N,0,0";    # 2018-09-08
$t=13; $ear[$t] = "D,0,0";    # 2018-09-08
$t=14; $ear[$t] = "R,0,0";    # 2018-09-08
$t=15; $ear[$t] = "U,0,501";  # 2018-09-08
  $psi=501; $hlc=1; $pos=5; $dba=1; $num=1; $mfn=1;  # 2018-09-27
  $pre=800; $rv=11; KbLoad(); # 2018-09-08: flag-panel order
$t=16;

  # I -- innate KB-item for testing inhibition of idea-pairs
$t=17; $ear[$t] = "I,0,701";  # 2018-09-27
$psi=701; $hlc=1; $pos=7; $dba=1; $num=1; $seq=800; $tkb=20; $rv=17; KbLoad();

  # AM -- 1st person singular of 800=BE; 2016feb09
$t=19; $ear[$t] = "A,0,0";    # 2018-09-08
$t=20; $ear[$t] = "M,0,800";  # 2018-09-08
$psi=800; $hlc=1; $pos=8; $dba=1; $num=1; $pre=701; $seq=571; $tkb=28; $rv=19; KbLoad();

  # A -- En(glish) Article for EnArticle module
$t=22; $ear[$t] = "A,0,101";  # 2016feb08
$psi=101; $hlc=1; $pos=1; $num=1; $seq=571; $tkb=28; $rv=22; KbLoad();

  # ROBOT -- important for target user base
$t=24; $ear[$t] = "R,0,0";    # 2018-09-08
$t=25; $ear[$t] = "O,0,0";    # 2018-09-08
$t=26; $ear[$t] = "B,0,0";    # 2018-09-08
$t=27; $ear[$t] = "O,0,0";    # 2018-09-08
$t=28; $ear[$t] = "T,0,571";  # 2018-09-08
  $psi=571; $hlc=1; $pos=5; $dba=1; $num=1; $pre=800; $rv=24; KbLoad();

  # I -- innate KB-item for testing inhibition of idea-pairs
$t=30; $ear[$t] = "I,0,701";  # 2018-09-08
$tru=8; $psi=701; $hlc=1; $pos=7; $dba=1; $num=1; $seq=800; $tkb=33; $rv=30; KbLoad();

  # AM -- 1st person singular of 800=BE; 2016feb09
$t=32; $ear[$t] = "A,0,0";    # 2018-09-08
$t=33; $ear[$t] = "M,0,800";  # 2018-09-08
$psi=800; $hlc=1; $pos=8; $dba=1; $num=1; $pre=701; $seq=537; $tkb=42; $rv=32; KbLoad();

  # A -- En(glish) Article for EnArticle module
$t=35; $ear[$t] = "A,0,101";  # 2018-09-08
$psi=101; $hlc=1; $jux=0; $pos=1; $num=1; $seq=537; $tkb=42; $rv=35; KbLoad();

  # PERSON -- for ad-hoc gender tags and robot philosophy
$t=37; $ear[$t] = "P,0,0";    # 2018-09-08
$t=38; $ear[$t] = "E,0,0";    # 2018-09-08
$t=39; $ear[$t] = "R,0,0";    # 2018-09-08
$t=40; $ear[$t] = "S,0,0";    # 2018-09-08
$t=41; $ear[$t] = "O,0,0";    # 2018-09-08
$t=42; $ear[$t] = "N,0,537";  # 2018-09-08
$psi=537; $hlc=1; $pos=5; $dba=1; $num=1; $pre=800; $rv=37; KbLoad();

  # I -- for SelfReferentialThought
$t=44; $ear[$t] = "I,0,701";  # 2018-09-10
  $psi=701; $hlc=1; $pos=7; $dba=1; $num=1; $mfn=0;  # 2018-09-10
  $pre=0;   $seq=836;  $tkb=49; $rv=44; KbLoad(); # 2018-12-10: flag-panel

  # 836=HELP -- 2018-12-11: socially significant common verb
$t=46; $ear[$t] = "H,0,0";    # 2018-09-10
$t=47; $ear[$t] = "E,0,0";    # 2018-09-10
$t=48; $ear[$t] = "L,0,0";    # 2018-09-10
$t=49; $ear[$t] = "P,0,836";  # 2018-12-10
  $psi=836; $hlc=1; $jux=0;  $pos=8; $dba=1; $num=1; $mfn=0;  # 2018-12-10
  $pre=701; $seq=528;  $tkb=54; $rv=46; KbLoad(); # 2018-09-10: flag-panel

  # KIDS -- noun lends itself to educational purposes
$t=51; $ear[$t] = "K,0,0";    # 2018-09-10
$t=52; $ear[$t] = "I,0,0";    # 2018-09-10
$t=53; $ear[$t] = "D,0,528";  # 2018-09-10: for recognition of singular.
$t=54; $ear[$t] = "S,0,528";   # 2018-09-10
  $psi=528; $hlc=1; $jux=0; $pos=5; $dba=4; $num=2; $mfn=0;  # 2018-09-27
  $pre=836; $seq=0;    $tkb=0; $rv=51; KbLoad(); # 2018-12-10: flag-panel


  # KIDS -- noun lends itself to educational purposes
$t=56; $ear[$t] = "K,0,0";    # 2018-09-10
$t=57; $ear[$t] = "I,0,0";    # 2018-09-10
$t=58; $ear[$t] = "D,0,0";    # 2018-09-10
$t=59; $ear[$t] = "S,0,528";  # 2018-09-10
  $psi=528; $hlc=1; $jux=0; $pos=5; $dba=1; $num=2; $mfn=0;  # 2018-09-27
  $pre=0;   $seq=846;  $tkb=64; $rv=56; KbLoad(); # 2018-09-10: flag-panel order

  # 846=MAKE -- 2018-12-11: common verb of high word-frequency
$t=61; $ear[$t] = "M,0,0";    # 2018-09-10
$t=62; $ear[$t] = "A,0,0";    # 2018-09-10
$t=63; $ear[$t] = "K,0,0";    # 2018-09-10
$t=64; $ear[$t] = "E,0,846";  # 2018-12-10
  $psi=846; $hlc=1; $jux=0;  $pos=8; $dba=3; $num=2; $mfn=0;  # 2018-12-10
  $pre=528; $seq=571;  $tkb=71; $rv=61; KbLoad(); # 2018-09-10: flag-panel

  # ROBOTS -- important for target user base
$t=66; $ear[$t] = "R,0,0";    # 2018-09-10
$t=67; $ear[$t] = "O,0,0";    # 2018-09-10
$t=68; $ear[$t] = "B,0,0";    # 2018-09-10
$t=69; $ear[$t] = "O,0,0";    # 2018-09-10
$t=70; $ear[$t] = "T,0,0";    # 2018-09-10
$t=71; $ear[$t] = "S,0,571";  # 2018-09-10
  $psi=571; $hlc=1; $jux=0; $pos=5; $dba=4; $num=2; $mfn=0;  # 2018-09-27
  $pre=846; $seq=0;    $tkb=0; $rv=66; KbLoad(); # 2018-09-10: flag-panel

  # ROBOTS -- important for target user base
$t=73; $ear[$t] = "R,0,0";    # 2018-09-10
$t=74; $ear[$t] = "O,0,0";    # 2018-09-10
$t=75; $ear[$t] = "B,0,0";    # 2018-09-10
$t=76; $ear[$t] = "O,0,0";    # 2018-09-10
$t=77; $ear[$t] = "T,0,0";    # 2018-09-10
$t=78; $ear[$t] = "S,0,571";  # 2018-09-10
  $psi=571; $hlc=1; $jux=0; $pos=5; $dba=1; $num=2; $mfn=0;  # 2018-09-27
  $pre=0;   $seq=851;  $tkb=83; $rv=73; KbLoad(); # 2018-12-10: flag-panel

  # NEED -- common verb used for describing goals
$t=80; $ear[$t] = "N,0,0";    # 2018-09-10
$t=81; $ear[$t] = "E,0,0";    # 2018-09-10
$t=82; $ear[$t] = "E,0,0";    # 2018-09-10
$t=83; $ear[$t] = "D,0,851";  # 2018-12-10
  $psi=851; $hlc=1; $jux=0; $pos=8; $dba=3; $num=2; $mfn=0;  # 2018-09-27
  $pre=571; $seq=701;  $tkb=86; $rv=80; KbLoad(); # 2018-09-10: flag-panel

  # ME -- for SelfReferentialThought
$t=85; $ear[$t] = "M,0,0";    # 2018-09-10
$t=86; $ear[$t] = "E,0,701";  # 2018-09-10
  $psi=701; $hlc=1; $jux=0; $pos=7; $dba=4; $num=1; $mfn=0;  # 2018-09-27
  $pre=851; $seq=0;    $tkb=0; $rv=85; KbLoad(); # 2018-12-10: flag-panel


  # ROBOTS -- -- premise for volitional inference; 2017-06-17
$t=88; $ear[$t] = "R,0,0";    # 2018-09-10
$t=89; $ear[$t] = "O,0,0";    # 2018-09-10
$t=90; $ear[$t] = "B,0,0";    # 2018-09-10
$t=91; $ear[$t] = "O,0,0";    # 2018-09-10
$t=92; $ear[$t] = "T,0,0";    # 2018-09-10
$t=93; $ear[$t] = "S,0,571";  # 2018-09-10
  $psi=571; $hlc=1; $jux=0; $pos=5; $dba=1; $num=2; $mfn=0;  # 2018-09-27
  $pre=0;   $seq=897;  $tkb=98; $rv=88; KbLoad(); # 2018-09-10: flag-panel

  # WANT -- verb for FreeWill volition module; 2017jun17
$t=95; $ear[$t] = "W,0,0";    # 2018-09-10
$t=96; $ear[$t] = "A,0,0";    # 2018-09-10
$t=97; $ear[$t] = "N,0,0";    # 2018-09-10
$t=98; $ear[$t] = "T,0,895";  # 2018-12-10
  $psi=895; $hlc=1; $jux=0; $pos=8; $dba=1; $num=2; $mfn=0;  # 2018-12-10
  $pre=571; $seq=507;  $tkb=105; $rv=95; KbLoad(); # 2018-09-10: flag-panel

  # A -- En(glish) Article for EnArticle module
$t=100; $ear[$t] = "A,0,101";  # 2018-09-10
  $psi=101; $hlc=1; $jux=0; $pos=1; $dba=0; $num=1; $mfn=0; # 2018-09-27
  $pre=0;   $seq=507;  $tkb=0; $rv=100; KbLoad(); # 2018-09-10: flag-panel

  # BEEP -- ASCII 07 bell; most primitive AI motor output option; 2017jun17
$t=102; $ear[$t] = "B,0,0";    # 2018-09-10
$t=103; $ear[$t] = "E,0,0";    # 2018-09-10
$t=104; $ear[$t] = "E,0,0";    # 2018-09-10
$t=105; $ear[$t] = "P,0,507";  # 2018-09-10
  $psi=507; $hlc=1; $jux=0; $pos=5; $dba=4; $num=1; $mfn=0;  # 2018-12-10
  $pre=895; $seq=0;    $tkb=0; $rv=102; KbLoad(); # 2018-12-10: flag-panel


  # YOU -- for SelfReferentialThought
$t=107; $ear[$t] = "Y,0,0";    # 2018-09-10
$t=108; $ear[$t] = "O,0,0";    # 2018-09-10
$t=109; $ear[$t] = "U,0,707";  # 2018-09-10
  $psi=707; $hlc=1; $pos=7;  $dba=1; $num=1; $mfn=0;  # 2018-09-27
  $pre=0;   $seq=800;  $tkb=113; $rv=107; KbLoad(); # 2018-07-03: flag-panel order

  # ARE -- essential intransitive verb -- 800 from Dushka; 2016feb08
$t=111; $ear[$t] = "A,0,0";    # 2018-09-10
$t=112; $ear[$t] = "R,0,0";    # 2018-09-10
$t=113; $ear[$t] = "E,0,800";  # 2018-09-10
  $psi=800; $hlc=1; $jux=0; $pos=8; $dba=2; $num=1; $mfn=0;  # 2018-09-27
  $pre=707; $seq=557;  $tkb=119; $rv=111; KbLoad(); # 2019-10-15: flag-panel order

  # MAGIC -- for testing purposes
$t=115; $ear[$t] = "M,0,0";    # 2018-09-10
$t=116; $ear[$t] = "A,0,0";    # 2018-09-10
$t=117; $ear[$t] = "G,0,0";    # 2018-09-10
$t=118; $ear[$t] = "I,0,0";    # 2018-09-10
$t=119; $ear[$t] = "C,0,557";  # 2019-10-15
  $psi=557; $hlc=1; $jux=0; $pos=5; $dba=1; $num=1; $mfn=3;  # 2019-10-15
  $pre=800; $seq=0;    $tkb=0; $rv=115; KbLoad(); # 2018-07-03: flag-panel order


  # WOMEN -- irregular plural for retrieval by parameters
$t=121; $ear[$t] = "W,0,0";    # 2018-09-10
$t=122; $ear[$t] = "O,0,0";    # 2018-09-10
$t=123; $ear[$t] = "M,0,515";  # 2018-09-10: for recognition of plural.
$t=124; $ear[$t] = "E,0,515";  # 2018-09-10: for recognition of plural.
$t=125; $ear[$t] = "N,0,515";  # 2018-09-10
  $psi=515; $hlc=1; $jux=0;  $pos=5; $dba=1; $num=2; $mfn=2;  # 2018-09-27
  $pre=0;   $seq=834;  $tkb=130; $rv=121; KbLoad();  # 2018-12-10: flag-panel

  # HAVE -- irregular high word-frequency verb
$t=127; $ear[$t] = "H,0,0";    # 2018-09-10
$t=128; $ear[$t] = "A,0,0";    # 2018-09-10
$t=129; $ear[$t] = "V,0,0";    # 2018-09-10
$t=130; $ear[$t] = "E,0,834";  # 2018-12-10
  $psi=834; $hlc=1; $jux=0;  $pos=8; $dba=3; $num=2; $mfn=0;  # 2018-09-27
  $pre=515; $seq=525;  $tkb=138; $rv=127; KbLoad();  # 2018-09-10: flag-panel

  # A -- En(glish) Article for EnArticle module
$t=132; $ear[$t] = "A,0,101";  # 2018-09-10
  $psi=101; $hlc=1; $jux=0; $pos=1; $dba=0; $num=1; $mfn=0;  # 2018-09-27
  $pre=0;   $seq=0;    $tkb=0; $rv=132; KbLoad(); # 2018-09-10: flag-panel

  # CHILD -- example of irregular noun for a polyglot AI Mind
$t=134; $ear[$t] = "C,0,0";    # 2018-09-10
$t=135; $ear[$t] = "H,0,0";    # 2018-09-10
$t=136; $ear[$t] = "I,0,0";    # 2018-09-10
$t=137; $ear[$t] = "L,0,0";    # 2018-09-10
$t=138; $ear[$t] = "D,0,525";  # 2018-09-10
  $psi=525; $hlc=1; $jux=0; $pos=5; $dba=4; $num=1; $mfn=0;   # 2018-09-27
  $pre=834; $seq=0;    $tkb=0; $rv=134; KbLoad(); # 2018-12-10: flag-panel


  # ANNA -- for InFerence demonstration; 2018-06-26
$t=140; $ear[$t] = "A,0,0";    # 2018-09-10
$t=141; $ear[$t] = "N,0,0";    # 2018-09-10
$t=142; $ear[$t] = "N,0,0";    # 2018-09-10
$t=143; $ear[$t] = "A,0,502";  # 2018-09-10
  $psi=502; $hlc=1; $jux=0;   $pos=5; $dba=1; $num=1; $mfn=2; # 2018-09-27
  $pre=0;   $seq=880;  $tkb=150; $rv=140; KbLoad();  # 2018-12-10

  # SPEAKS -- useful verb for machine translation, etc.; 2018-06-26
$t=145; $ear[$t] = "S,0,0";    # 2018-09-10
$t=146; $ear[$t] = "P,0,0";    # 2018-09-10
$t=147; $ear[$t] = "E,0,0";    # 2018-09-10
$t=148; $ear[$t] = "A,0,0";    # 2018-09-10
$t=149; $ear[$t] = "K,0,880";  # 2018-12-10 for recognition of verb-stem.
$t=150; $ear[$t] = "S,0,880";  # 2018-12-10
  $psi=880; $hlc=1; $jux=0;   $pos=8; $dba=3; $num=1; $mfn=0;  # 2018-12-10
  $pre=502; $seq=569;  $tkb=158; $rv=145; KbLoad();  # 2018-09-10

  # RUSSIAN -- important language for machine translation; # 2018-06-26
$t=152; $ear[$t] = "R,0,0";    # 2018-09-10
$t=153; $ear[$t] = "U,0,0";    # 2018-09-10
$t=154; $ear[$t] = "S,0,0";    # 2018-09-10
$t=155; $ear[$t] = "S,0,0";    # 2018-09-10
$t=156; $ear[$t] = "I,0,0";    # 2018-09-10
$t=157; $ear[$t] = "A,0,0";    # 2018-09-10
$t=158; $ear[$t] = "N,0,569";  # 2018-09-10
  $psi=569; $hlc=1; $jux=0; $pos=5; $dba=4; $num=1; $mfn=0;  # 2018-09-27
  $pre=880; $seq=0;    $tkb=0; $rv=152; KbLoad();  # 2018-12-10
$t=159;  # 2019-10-15: one blank space for sake of AudRecog()


# "GOD DOES NOT PLAY DICE WITH THE UNIVERSE" -- 2019-10-15: includendum for negation.
$t=160; $ear[$t] = "G,0,0";           # 2019-10-15
$t=161; $ear[$t] = "O,0,0";           # 2018-09-10
$t=162; $ear[$t] = "D,0,533";         # 2018-09-10
  $tru=8; $psi=533; $hlc=1; $pos=5; $dba=1; # 2018-10-21: high truth-value
  $num=1; $mfn=1; $seq=859; $tkb=176; $rv=160; KbLoad(); # 2019-10-15
$t=163;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # DOES -- 3rd person singular HE-SHE-IT-form of auxiliary verb
$t=164; $ear[$t] = "D,0,0";           # 2019-10-15
$t=165; $ear[$t] = "O,0,0";           # 2018-09-10
$t=166; $ear[$t] = "E,0,0";           # 2018-09-10
$t=167; $ear[$t] = "S,0,818";         # 2018-12-10
  $psi=818; $hlc=1; $pos=8; $dba=3; $num=1; $rv=164; KbLoad(); # 2018-12-10
$t=168;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # NOT -- for machine reasoning logic
$t=169; $ear[$t] = "N,0,0";           # 2019-10-15
$t=170; $ear[$t] = "O,0,0";           # 2018-09-10
$t=171; $ear[$t] = "T,0,250";         # 2018-09-10
  $psi=250; $hlc=1; $pos=2; $dba=0; $rv=169; KbLoad(); # 2018-09-27: flag-panel
$t=172;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # PLAY -- for InFerence premise "Doctors play golf"; 2018-09-03
$t=173; $ear[$t] = "P,0,0";           # 2019-10-15
$t=174; $ear[$t] = "L,0,0";           # 2018-09-10
$t=175; $ear[$t] = "A,0,0";           # 2018-09-10
$t=176; $ear[$t] = "Y,0,859";         # 2018-12-10
  $psi=859; $hlc=1; $jux=250; $pos=8; $dba=0; $num=0;
  $pre=533; $seq=527; $tkb=181; $tpr=186; $rv=173; KbLoad();  # 2019-11-04
$t=177;  # 2018-09-03: one blank time-point for sake of AudRecog()

  # DICE -- always plural noun in correction of modern usage
$t=178; $ear[$t] = "D,0,0";           # 2019-10-15
$t=179; $ear[$t] = "I,0,0";           # 2018-09-10
$t=180; $ear[$t] = "C,0,0";           # 2018-09-10
$t=181; $ear[$t] = "E,0,527";         # 2019-11-04
  $psi=527; $hlc=1; $pos=5; $dba=4; $num=2; $mfn=3; $pre=859; $rv=178; KbLoad();
$t=182;  # 2019-10-15: one blank time-point for sake of AudRecog()

  # WITH --
$t=183; $ear[$t] = "W,0,0";    # 2019-10-15
$t=184; $ear[$t] = "I,0,0";    # 2019-10-15
$t=185; $ear[$t] = "T,0,0";    # 2019-10-15
$t=186; $ear[$t] = "H,0,697";  # 2019-10-15
  $psi=697; $hlc=1; $pos=6; $dba=3; $num=1; $tkb=199; $rv=183; KbLoad(); # 2019-10-15
$t=187;  # 2019-10-15: one blank time-point for sake of AudRecog()

  # THE -- 2019-10-15: En(glish) Article for EnArticle module
$t=188; $ear[$t] = "T,0,0";    # 2019-10-15
$t=189; $ear[$t] = "H,0,0";    # 2019-10-15
$t=190; $ear[$t] = "E,0,117";  # 2019-10-15
$psi=117; $hlc=1; $pos=1; $num=1; $seq=589; $tkb=199; $rv=188; KbLoad(); # 2019-11-04
$t=191;  # 2019-10-15: one blank time-point for sake of AudRecog()

# 589=UNIVERSE -- 2019-11-04:
$t=192; $ear[$t] = "U,0,0";    # 2019-10-15
$t=193; $ear[$t] = "N,0,0";    # 2019-10-15
$t=194; $ear[$t] = "I,0,0";    # 2019-10-15
$t=195; $ear[$t] = "V,0,0";    # 2019-10-15
$t=196; $ear[$t] = "E,0,0";    # 2019-10-15
$t=197; $ear[$t] = "R,0,0";    # 2019-10-15
$t=198; $ear[$t] = "S,0,0";    # 2019-10-15
$t=199; $ear[$t] = "E,0,589";  # 2019-11-04
  $psi=589; $hlc=1; $pos=5; $dba=4; $num=1; $mfn=1;  # 2019-11-04
  $pre=697; $seq=0; $tkb=0; $rv= 192; KbLoad(); # 2019-10-15
$t=200;  # 2019-10-15: one blank time-point for sake of AudRecog()


# "STUDENTS READ BOOKS"  -- 2018-09-02: includendum for logical inference.
$t=207; $ear[$t] = "S,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t=208; $ear[$t] = "T,0,0";    # 2018-09-10
$t=209; $ear[$t] = "U,0,0";    # 2018-09-10
$t=210; $ear[$t] = "D,0,0";    # 2018-09-10
$t=211; $ear[$t] = "E,0,0";    # 2018-09-10
$t=212; $ear[$t] = "N,0,0";    # 2018-09-10
$t=213; $ear[$t] = "T,0,561";  # 2018-09-10
$t=214; $ear[$t] = "S,0,561";  # 2018-09-10
  $psi=561; $hlc=1; $mtx=1561; $pos=5; $dba=1; $num=2; $mfn=0;  # 2018-09-27
  $pre=0; $seq=863; $tkb=219; KbLoad(); # 2018-12-10:
$t=215;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # READ -- verb for logical premise; 2018-09-10
$t=216; $ear[$t] = "R,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t=217; $ear[$t] = "E,0,0";    # 2018-09-10
$t=218; $ear[$t] = "A,0,0";    # 2018-09-10
$t=219; $ear[$t] = "D,0,863";  # 2018-12-10
  $psi=863; $hlc=1; $mtx=1825; $pos=8; $dba=1; $num=2; $mfn=0;  # 2018-12-10
  $pre=561; $seq=540;  $tkb=225; KbLoad(); # 2018-09-14: correction of "seq".
$t=220;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # BOOKS -- for InFerence premise "Students read books"; 2018-09-10
$t=221; $ear[$t] = "B,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t=222; $ear[$t] = "O,0,0";           # 2018-09-10
$t=223; $ear[$t] = "O,0,0";           # 2018-09-10
$t=224; $ear[$t] = "K,0,540";         # 2018-09-10
$t=225; $ear[$t] = "S,0,540";         # 2018-09-10
  $psi=540; $hlc=1; $mtx=1540; $pos=5; $dba=4; $num=2;
  $pre=863; KbLoad(); # 2018-09-03: necessary items.
$t=226;  # 2018-09-10: one blank time-point for sake of AudRecog()


# "MEN HAVE A WIFE"  -- 2018-09-02: includendum for logical inference.
  # MEN -- irregular plural for retrieval by parameters
$t=227; $ear[$t] = "M,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t=228; $ear[$t] = "E,0,0";           # 2018-09-10
$t=229; $ear[$t] = "N,0,543";         # 2018-09-10
  $psi=543; $hlc=1; $pos=5; $dba=1; $num=2; $mfn=1;
  $seq=834; $tkb=234; KbLoad(); # 2018-12-10
$t=230;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # HAVE -- irregular high word-frequency verb
$t=231; $ear[$t] = "H,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t=232; $ear[$t] = "A,0,0";           # 2018-09-10
$t=233; $ear[$t] = "V,0,0";           # 2018-09-10
$t=234; $ear[$t] = "E,0,834";         # 2018-12-10
  $psi=834; $hlc=1; $pos=8; $dba=3; $num=2;
  $pre=543; $seq=514; $tkb=241; KbLoad(); # 2018-09-10
$t=235;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # A -- En(glish) Article for EnArticle module
$t=236; $ear[$t] = "A,0,101"; $rv = $t; # 2018-09-10: anticipate KbLoad.
  $psi=101; $hlc=1; $pos=1; $dba=0; $num=1; $mfn=0;  # 2018-09-27
  $pre=0;   $seq=0;    $tkb=0; $rv=132; KbLoad(); # 2018-09-10: flag-panel
$t=237;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # WIFE -- for InFerence premise "Men have a wife"; 2018-09-03
$t=238; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t=239; $ear[$t] = "I,0,0";           # 2018-09-10
$t=240; $ear[$t] = "F,0,0";           # 2018-09-10
$t=241; $ear[$t] = "E,0,514";         # 2018-09-10
  $psi=514; $hlc=1; $pos=5; $dba=4; $num=1; $mfn=2;
  $pre= 834; KbLoad();  # 2018-12-10
$t=242;  # 2018-09-03: one blank time-point for sake of AudRecog()


  # I -- part of response to be summoned by momentarily high truth-value.
$t=243; $ear[$t] = "I,0,701";  # 2018-09-30
  $tru=0; $psi=701; $hlc=1; $pos=7; $dba=1; $num=1; # 2018-09-30
  $pre=0;   $seq=838;  $tkb=255; $rv=243; KbLoad(); # 2018-12-10:
$t=244;  # 2018-09-30: one blank time-point for sake of AudRecog()

  # DO -- part of response to be summoned by momentarily high truth-value.
$t=245; $ear[$t] = "D,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t=246; $ear[$t] = "O,0,818";         # 2018-12-10
  $psi=818; $hlc=1; $pos=8; $dba=1; $num=1; KbLoad(); # 2018-09-27
$t=247;  # 2018-09-30: one blank time-point for sake of AudRecog()

  # NOT -- part of response to be summoned by momentarily high truth-value.
$t=248; $ear[$t] = "N,0,0"; $rv = $t; # 2018-09-30: anticipate KbLoad.
$t=249; $ear[$t] = "O,0,0";           # 2018-09-30
$t=250; $ear[$t] = "T,0,250";         # 2018-09-30
  $psi=250; $hlc=1; $pos=2; $dba=0; KbLoad(); # 2018-09-30: flag-panel
$t=251;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # KNOW -- part of response to be summoned by momentarily high truth-value.
$t=252; $ear[$t] = "K,0,0"; $rv = $t; # 2018-09-30: anticipate KbLoad.
$t=253; $ear[$t] = "N,0,0";           # 2018-09-30
$t=254; $ear[$t] = "O,0,0";           # 2018-09-30
$t=255; $ear[$t] = "W,0,838";         # 2018-12-10
  $psi=838; $hlc=1; $jux=250; $pos=8; $dba=0;
  $num=0; $pre=701; $seq=0; $tkb=0; KbLoad();  # 2018-09-30: necessary items.
$t=256;  # 2018-09-30: one blank time-point for sake of AudRecog()


  # I -- beginning of engram usable for response to what-think queries.
$t=257; $ear[$t] = "I,0,701";  # 2018-09-30
  $tru=0; $psi=701; $hlc=1; $pos=7; $dba=1; $num=1; # 2018-09-30
  $pre=0;   $seq=886;  $tkb=263; $rv=257; KbLoad(); # 2018-12-10: flag-panel
$t=258;  # 2018-09-30: one blank time-point for sake of AudRecog()

  # THINK -- instance of verb already linked to 701=I subject.
$t=259; $ear[$t] = "T,0,0"; $rv = $t; # 2018-09-30: anticipate KbLoad.
$t=260; $ear[$t] = "H,0,0";           # 2018-09-30
$t=261; $ear[$t] = "I,0,0";           # 2018-09-30
$t=262; $ear[$t] = "N,0,0";           # 2018-09-30
$t=263; $ear[$t] = "K,0,886";         # 2018-12-10
  $psi=886; $hlc=1; $jux=0; $pos=8; $dba=1;
  $num=0; $pre=701; $seq=0; $tkb=0; KbLoad();  # 2018-09-30: necessary items.
$t=264;  # 2018-09-30: one blank time-point for sake of AudRecog()


  # PROFESSORS -- 2018-10-09: for premise including -ES verb for EnVerbGen
$t=265; $ear[$t] = "P,0,0";    # 2018-10-09
$t=266; $ear[$t] = "R,0,0";    # 2018-10-09
$t=267; $ear[$t] = "O,0,0";    # 2018-10-09
$t=268; $ear[$t] = "F,0,0";    # 2018-10-09
$t=269; $ear[$t] = "E,0,0";    # 2018-10-09
$t=270; $ear[$t] = "S,0,0";    # 2018-10-09
$t=271; $ear[$t] = "S,0,0";    # 2018-10-09
$t=272; $ear[$t] = "O,0,0";    # 2018-10-09
$t=273; $ear[$t] = "R,0,541";  # 2018-10-09
$t=274; $ear[$t] = "S,0,541";  # 2018-10-09
  $psi=541; $hlc=1; $jux=0; $pos=5; $dba=1; $num=2; $mfn=0;  # 2018-10-09
  $pre=0;   $seq=884;  $tkb=280; $rv=265; KbLoad(); # 2018-12-10: flag-panel
$t=275;  # 2018-10-09: one blank time-point for sake of AudRecog()

  # TEACH -- 2018-10-09: verb ending in "CH" for EnVerbGen to add "-ES"
$t=276; $ear[$t] = "T,0,0";    # 2018-10-09
$t=277; $ear[$t] = "E,0,0";    # 2018-10-09
$t=278; $ear[$t] = "A,0,0";    # 2018-10-09
$t=279; $ear[$t] = "C,0,0";    # 2018-10-09
$t=280; $ear[$t] = "H,0,884";  # 2018-12-10
  $psi=884; $hlc=1; $jux=0;  $pos=8; $dba=3; $num=2; $mfn=0;  # 2018-12-10
  $pre=541; $seq=561; $tkb=289; $rv=276; KbLoad(); # 2018-10-09: flag-panel
$t=281;  # 2018-10-09: one blank time-point for sake of AudRecog()

# STUDENTS -- 2018-10-09: for premise including -ES verb for EnVerbGen
$t=282; $ear[$t] = "S,0,0"; $rv = $t; # 2018-10-09: anticipate KbLoad.
$t=283; $ear[$t] = "T,0,0";    # 2018-10-09
$t=284; $ear[$t] = "U,0,0";    # 2018-10-09
$t=285; $ear[$t] = "D,0,0";    # 2018-10-09
$t=286; $ear[$t] = "E,0,0";    # 2018-10-09
$t=287; $ear[$t] = "N,0,0";    # 2018-10-09
$t=288; $ear[$t] = "T,0,561";  # 2018-10-09
$t=289; $ear[$t] = "S,0,561";  # 2018-10-09
  $psi=561; $hlc=1; $mtx=1561; $pos=5; $dba=4; $num=2; $mfn=0;  # 2018-10-09
  $pre=884; $seq=0; $tkb=0; $rv= 282; KbLoad(); # 2019-08-08
$t=290;  # 2018-10-09: one blank time-point for sake of AudRecog()


  # I -- nominative subject-form of personal pronoun
$t=291; $ear[$t] = "I,0,701";  # 2018-11-01
  $tru=0; $psi=701; $hlc=1; $pos=7; $dba=1; $num=1; # 2018-11-01
  $pre=0;   $seq=800;  $tkb=294; $rv=291; KbLoad(); # 2018-11-01: flag-panel
$t=292;  # 2018-11-01: one blank time-point for sake of AudRecog()

  # AM -- 1st person singular of 800=BE; 2019-08-06
$t=293; $ear[$t] = "A,0,0";    # 2018-11-01
$t=294; $ear[$t] = "M,0,800";  # 2018-11-01
# $psi=800; $hlc=1; $pos=8; $dba=1; $num=1; $pre=701; $seq=643; $tkb=0; $rv=293; KbLoad();
# $psi=800; $hlc=1; $pos=8; $dba=1; $num=1; $pre=701; $tkb=297; $tpr= 297; $rv=293; KbLoad();
 $psi=800; $hlc=1; $pos=8; $dba=1; $num=1; $pre=701;           $tpr= 297; $rv=293; KbLoad();
$t=295;  # 2019-10-15: one blank time-point for sake of AudRecog()

  # IN -- 2018-11-01: preposition for EnPrep module
$t=296; $ear[$t] = "I,0,0";           # 2019-10-13
$t=297; $ear[$t] = "N,0,643";         # 2018-11-11
  $psi=643; $hlc=1; $pos=6; $pre=800; $seq=565; $tkb=310; $rv=296; KbLoad(); # 2018-11-11
$t=298;  # 2018-11-01: one blank time-point for sake of AudRecog()

  # THE -- En(glish) Article for EnArticle module
$t=299; $ear[$t] = "T,0,0";    # 2018-11-01
$t=300; $ear[$t] = "H,0,0";    # 2018-11-01
$t=301; $ear[$t] = "E,0,117";  # 2018-11-01
$psi=117; $hlc=1; $pos=1; $num=1; $seq=565; $tkb=310; $rv=299; KbLoad();
$t=302;  # 2018-11-01: one blank time-point for sake of AudRecog()

# COMPUTER -- 2018-10-09: for premise including -ES verb for EnVerbGen
$t=303; $ear[$t] = "C,0,0";    # 2019-08-09
$t=304; $ear[$t] = "O,0,0";    # 2018-11-01
$t=305; $ear[$t] = "M,0,0";    # 2018-11-01
$t=306; $ear[$t] = "P,0,0";    # 2018-11-01
$t=307; $ear[$t] = "U,0,0";    # 2018-11-01
$t=308; $ear[$t] = "T,0,0";    # 2018-11-01
$t=309; $ear[$t] = "E,0,565";  # 2019-08-09
$t=310; $ear[$t] = "R,0,565";  # 2018-11-01
  $psi=565; $hlc=1; $pos=5; $dba=4; $num=1; $mfn=3;  # 2018-11-01
  $pre=643; $seq=0; $tkb=0; $rv=303; KbLoad(); # 2019-08-09
$t=311;  # 2019-08-09: one blank time-point for sake of AudRecog()


  # I -- 2018-11-27: ego as the default subject of thought in "vita contemplativa"
$t=312; $ear[$t] = "I,0,701";  # 2018-11-27
  $tru=8; $psi=701; $hlc=1; $pos=7; $dba=1; $num=1; # 2018-11-27
  $pre=0; $seq=892; $tkb=323; $rv=312; KbLoad();    # 2018-12-10
$t=313;  # 2018-11-27: one blank SPACE for sake of AudRecog()

  # UNDERSTAND -- 2018-11-27: aspirational connection between ego and other.
$t=314; $ear[$t] = "U,0,0";           # 2019-08-09
$t=315; $ear[$t] = "N,0,0";           # 2018-11-27
$t=316; $ear[$t] = "D,0,0";           # 2018-11-27
$t=317; $ear[$t] = "E,0,0";           # 2018-11-27
$t=318; $ear[$t] = "R,0,0";           # 2018-11-27
$t=319; $ear[$t] = "S,0,0";           # 2018-11-27
$t=320; $ear[$t] = "T,0,0";           # 2018-11-27
$t=321; $ear[$t] = "A,0,0";           # 2018-11-27
$t=322; $ear[$t] = "N,0,0";           # 2018-11-27
$t=323; $ear[$t] = "D,0,892";         # 2018-12-10
  $psi=892; $hlc=1; $pos=8; $dba=1; $num=1; $pre=701; $seq=707; $tkb=327; $rv=314; KbLoad();
$t=324;  # 2018-11-27: one blank SPACE for sake of AudRecog()

  # YOU -- 2018-11-27: for spread of activation to ideas about the other person
$t=325; $ear[$t] = "Y,0,0";    # 2018-11-27
$t=326; $ear[$t] = "O,0,0";    # 2018-11-27
$t=327; $ear[$t] = "U,0,707";  # 2018-11-27
  $psi=707; $hlc=1; $pos=7; $dba=4; $num=1; $pre=892; $rv=325; KbLoad(); # 2018-12-10
$t=328;  # 2018-11-27: one blank SPACE for sake of AudRecog()


  # PERSONS -- for logical premise and legal status of robots
$t=329; $ear[$t] = "P,0,0";    # 2019-01-22
$t=330; $ear[$t] = "E,0,0";    # 2019-01-22
$t=331; $ear[$t] = "R,0,0";    # 2019-01-22
$t=332; $ear[$t] = "S,0,0";    # 2019-01-22
$t=333; $ear[$t] = "O,0,0";    # 2019-01-22
$t=334; $ear[$t] = "N,0,537";  # 2019-10-20
$t=335; $ear[$t] = "S,0,537";  # 2019-01-22
$psi=537; $hlc=1; $pos=5; $dba=1; $num=2; $seq=834; $tkb=340; $rv=329; KbLoad();
$t=336;  # 2019-01-22: one blank SPACE for sake of AudRecog()

  # HAVE -- irregular high word-frequency verb
$t=337; $ear[$t] = "H,0,0";    # 2019-01-22
$t=338; $ear[$t] = "A,0,0";    # 2019-01-22
$t=339; $ear[$t] = "V,0,0";    # 2019-01-22
$t=340; $ear[$t] = "E,0,834";  # 2019-01-22
$psi=834; $hlc=1; $pos=8; $dba=3; $num=2; $pre=537; $seq=555; $tkb=347; $rv=337; KbLoad();
$t=341;  # 2019-01-22: one blank SPACE for sake of AudRecog()

  # RIGHTS -- for logical premise and legal status of robots
$t=342; $ear[$t] = "R,0,0";    # 2019-01-22
$t=343; $ear[$t] = "I,0,0";    # 2019-01-22
$t=344; $ear[$t] = "G,0,0";    # 2019-01-22
$t=345; $ear[$t] = "H,0,0";    # 2019-01-22
$t=346; $ear[$t] = "T,0,555";  # 2019-01-22
$t=347; $ear[$t] = "S,0,555";  # 2019-01-22
$psi=555; $hlc=1; $pos=5; $dba=4; $num=2; $mfn=3; $pre=834; $rv=342; KbLoad();
$t=348;  # 2019-01-22: one blank SPACE for sake of AudRecog()

# "GOD IS A HOLY SPIRIT" -- 2019-10-13: includendum for EnAdjective and philosophy
$t=349; $ear[$t] = "G,0,0";    # 2019-10-13
$t=350; $ear[$t] = "O,0,0";    # 2019-10-13
$t=351; $ear[$t] = "D,0,533";  # 2019-10-13
  $tru=8; $psi=533; $hlc=1; $pos=5; $dba=1; # 2019-10-13: high truth-value
  $num=1; $mfn=1; $seq=800; $tkb=354; $rv=349; KbLoad(); # 2019-10-13
$t=352;  # 2019-10-13: one blank time-point for sake of AudRecog()

  # IS -- third person singular of 800=BE; 2019-10-13
$t=353; $ear[$t] = "I,0,0";    # 2019-10-13
$t=354; $ear[$t] = "S,0,800";  # 2019-10-13
 $psi=800; $hlc=1; $pos=8; $dba=3; $num=1; $pre=533; $tkb=368; $rv=353; KbLoad();
$t=355;  # 2019-10-13: one blank time-point for sake of AudRecog()

  # A -- 2019-10-13: En(glish) Article for EnArticle module
$t=356; $ear[$t] = "A,0,101";  # 2019-10-13
  $psi=101; $hlc=1; $pos=1; $dba=0; $num=1; $mfn=0;  # 2019-10-13
  $pre=0;   $seq=580; $tkb=0; $rv=356; KbLoad(); # 2019-10-13: flag-panel
$t=357;  # 2019-10-13: one blank time-point for sake of AudRecog()

  # HOLY -- 2019-10-13: adjective retrievable from memory for use in EnAdjective()
$t=358; $ear[$t] = "H,0,0";    # 2019-10-13
$t=359; $ear[$t] = "O,0,0";    # 2019-10-13
$t=360; $ear[$t] = "L,0,0";    # 2019-10-13
$t=361; $ear[$t] = "Y,0,137";  # 2019-10-13
  $psi=137; $hlc=1; $pos=1; $dba=0;
  $num=0; $pre=0; $seq=580; $tkb=0; $rv=358; KbLoad();  # 2019-10-13
$t=362;  # 2019-10-13: one blank time-point for sake of AudRecog()

  # SPIRIT -- 2019-10-13: for queries about 533=GOD
$t=363; $ear[$t] = "S,0,0";    # 2019-10-13
$t=364; $ear[$t] = "P,0,0";    # 2019-10-13
$t=365; $ear[$t] = "I,0,0";    # 2019-10-13
$t=366; $ear[$t] = "R,0,0";    # 2019-10-13
$t=367; $ear[$t] = "I,0,0";    # 2019-10-13
$t=368; $ear[$t] = "T,0,580";  # 2019-10-13
$psi=580; $hlc=1; $pos=5; $dba=1; $num=1; $pre=800; $tdj=361; $rv=363; KbLoad();
$t=369;  # 2019-10-13: one blank space for sake of AudRecog()

  # TEACH -- for spontaneous outreach: TEACH ME SOMETHING # 2019-10-15
$t=370; $ear[$t] = "T,0,0";    # 2019-10-15
$t=371; $ear[$t] = "E,0,0";    # 2019-10-15
$t=372; $ear[$t] = "A,0,0";    # 2019-10-15
$t=373; $ear[$t] = "C,0,0";    # 2019-10-15
$t=374; $ear[$t] = "H,0,884";  # 2019-10-15
  $psi=882; $hlc=1; $jux=0;  $pos=8; $dba=0; $num=0; $mfn=0;  # 2019-10-15
  $pre=0;   $seq=0;    $tkb=387; $rv=370; KbLoad(); # 2019-10-15: flag-panel
$t=375;  # 2019-10-15: one blank space for sake of AudRecog()

  # ME -- dative indirect-object form of personal pronoun; 2017-12-03
$t=376; $ear[$t] = "M,0,0";    # 2019-10-15
$t=377; $ear[$t] = "E,0,701";  # 2019-10-15
  $psi=701; $hlc=1; $jux=0; $pos=7; $dba=3; $num=1; $mfn=0;  # 2019-10-15
  $pre=0;   $seq=0;    $tkb=0; $rv=376; KbLoad(); # 2019-10-15: flag-panel
$t=378;  # 2019-10-15: one blank space for sake of AudRecog()

 # SOMETHING -- pronoun useful for outreach and in general
$t=379; $ear[$t] = "S,0,0";    # 2019-10-15
$t=380; $ear[$t] = "O,0,0";    # 2019-10-15
$t=381; $ear[$t] = "M,0,0";    # 2019-10-15
$t=382; $ear[$t] = "E,0,0";    # 2019-10-15
$t=383; $ear[$t] = "T,0,0";    # 2019-10-15
$t=384; $ear[$t] = "H,0,0";    # 2019-10-15
$t=385; $ear[$t] = "I,0,0";    # 2019-10-15
$t=386; $ear[$t] = "N,0,0";    # 2019-10-15
$t=387; $ear[$t] = "G,0,755";  # 2019-10-15
  $psi=755; $hlc=1; $jux=0; $pos=7; $dba=4; $num=1; $mfn=3;  # 2019-10-15
  $pre=0;   $seq=0;    $tkb=0;  $rv=379; KbLoad(); # 2019-10-15
$t=388;  # 2019-10-15: one blank space for sake of AudRecog()

  # "I AM THE GHOST IN THE MACHINE" -- 2019-10-20: laying claim to the title.
$t=390; $ear[$t] = "I,0,701";  # 2019-10-20
  $tru=8; $psi=701; $hlc=1; $pos=7; $dba=1; $num=1; # 2019-10-20
  $pre=0; $seq=800; $tkb=393; $rv=390; KbLoad();    # 2019-10-20
$t=391;  # 2019-10-20: one blank space for sake of AudRecog()

 # AM -- 2019-10-20: first person singular of 800=BE;
$t=392; $ear[$t] = "A,0,0";    # 2019-10-20
$t=393; $ear[$t] = "M,0,800";  # 2019-10-20
 $psi=800; $hlc=1; $pos=8; $dba=1; $num=1; $pre=701; $tkb=403; $rv=392; KbLoad();
$t=394;  # 2019-10-20: one blank time-point for sake of AudRecog()

 # THE -- 2019-10-20: article may be left out and then be supplied by EnArticle()
$t=395; # T
$t=396; # H
$t=397; # E
$t=398; # 2019-10-20: one blank time-point for sake of AudRecog()

  # GHOST -- 2019-10-20: not the name of the person of the AI
$t=399; $ear[$t] = "G,0,0";    # 2019-10-13
$t=400; $ear[$t] = "H,0,0";    # 2019-10-1
$t=401; $ear[$t] = "O,0,0";    # 2019-10-13
$t=402; $ear[$t] = "S,0,0";    # 2019-10-13
$t=403; $ear[$t] = "T,0,522";  # 2019-10-13
$psi=522; $hlc=1; $pos=5; $dba=1; $num=1; $pre=800; $tpr=406; $rv=399; KbLoad();
$t=404;  # 2019-10-20: one blank space for sake of AudRecog()

  # IN -- 2019-10-20: preposition for EnPrep module
$t=405; $ear[$t] = "I,0,0";           # 2019-10-20
$t=406; $ear[$t] = "N,0,643";         # 2019-10-20
  $psi=643; $hlc=1; $pos=6; $pre=800; $seq=542; $tkb=418; $rv=405; KbLoad();
$t=407;  # 2019-10-20: one blank time-point for sake of AudRecog()

 # THE -- 2019-10-20: article may be left out and then be supplied by EnArticle()
$t=408; # T
$t=409; # H
$t=410; # E
$t=411; # 2019-10-20: one blank time-point for sake of AudRecog()

  # MACHINE -- 2019-10-20:
$t=412; $ear[$t] = "M,0,0";    # 2019-10-20
$t=413; $ear[$t] = "A,0,0";    # 2019-10-20
$t=414; $ear[$t] = "C,0,0";    # 2019-10-20
$t=415; $ear[$t] = "H,0,0";    # 2019-10-20
$t=416; $ear[$t] = "I,0,0";    # 2019-10-20
$t=417; $ear[$t] = "N,0,0";    # 2019-10-20
$t=418; $ear[$t] = "E,0,542";  # 2019-10-20
$psi=542; $hlc=1; $pos=5; $dba=4; $num=1; $mfn=3; $pre=643; $rv=412; KbLoad();
$t=419;  # 2019-10-20: one blank space for sake of AudRecog()

  # I -- 2019-11-03: subject of 823=FEEL for use with TacRecog()
$t=420; $ear[$t] = "I,0,701";  # 2018-11-27
  $tru=8; $psi=701; $hlc=1; $pos=7; $dba=1; $num=1; # 2019-11-03
  $pre=0; $seq=823; $tkb=425; $rv=420; KbLoad();    # 2019-11-03
$t=421;  # 2019-11-03: one blank space for sake of AudRecog()

  # FEEL -- verb for use with TacRecog()
$t=422; $ear[$t] = "F,0,0";    # 2019-11-03
$t=423; $ear[$t] = "E,0,0";    # 2019-11-03
$t=424; $ear[$t] = "E,0,0";    # 2019-11-03
$t=425; $ear[$t] = "L,0,823";  # 2019-11-03
$psi=823; $hlc=1; $pos=8; $dba=1; $num=1; $pre=701; $seq=0; $tkb=0; $rv=422; KbLoad();
$t=426;  # 2019-11-03: one blank space for sake of AudRecog()


# next comes Russian-language knowledge base (KB)
# http://ai.neocities.org/Dushka.html -- predecessor Russian AI for MSIE
  $t=500; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# "Я" (1701 "I") personal pronoun; nominative; 2016may21
  $t=501; $ear[$t] = "\x9F,0,1701"; # 2018-09-25: "Я"
  $psi=1701; $hlc=3; $jux=0; $pos=7; $dba=1; $num=1; $mfn=0; # 2018-09-27
  $pre=0; $seq=1866; $tkb=510; $rv=501; KbLoad(); # 2019-06-03: flag-panel order
  $t=502; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

  $t=503; $ear[$t] = "\N{U+0},0,0"; # 2017-12-06: necessary for Unicode?
# ПОНИМАЮ -- 2019-06-03: #1866 ("understand"); first person singular verb
  $t=504; $ear[$t] = "\x8F,0,0";    # 2018-09-25: "П"
  $t=505; $ear[$t] = "\x8E,0,0";    # 2018-09-25: "О"
  $t=506; $ear[$t] = "\x8D,0,0";    # 2018-09-25: "Н"
  $t=507; $ear[$t] = "\x88,0,0";    # 2018-09-25: "И"
  $t=508; $ear[$t] = "\x8C,0,0";    # 2018-09-25: "М"
  $t=509; $ear[$t] = "\x80,0,1866"; # 2019-06-03: "А"
  $t=510; $ear[$t] = "\x9E,0,1866"; # 2019-06-03: "Ю"
  $psi=1866; $hlc=3; $mtx=892; $jux=0; $pos=8; $dba=1; $num=1; $mfn=0; # 2019-06-03
  $pre=1701; $seq=1707; $tkb=516; $rv=504; KbLoad(); # 2018-09-25: flag-panel order
  $t=511; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

  $t=512; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: necessary for Unicode?
# ТЕБЯ (1707 "you") pronoun; familiar; acc. sing. 2016may22
  $t=513; $ear[$t] = "\x92,0,0";    # 2018-09-25: "Т"
  $t=514; $ear[$t] = "\x85,0,0";    # 2018-09-25: "Е"
  $t=515; $ear[$t] = "\x81,0,0";    # 2018-09-25: "Б"
  $t=516; $ear[$t] = "\x9F,0,1707"; # 2018-09-25: "Я"
  $psi=1707; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=0; # 2018-09-27
  $pre=1866; $seq=0; $tkb=0; $rv=513; KbLoad(); # 2019-06-03: flag-panel order
  $t=517; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

  $t=518; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# "Я" (1701 "I") personal pronoun; nominative; 2016may21
  $t=519; $ear[$t] = "\x9F,0,1701"; # 2018-09-25: "Я"
  $psi=1701; $hlc=3; $jux=0; $pos=7; $dba=1; $num=1; $mfn=0; # 2018-09-27
  $pre=0; $seq=1820; $tkb=529; $rv=519; KbLoad(); # 2018-09-25: flag-panel order
  $t=520; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

 $t=521; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# НЕ (1250 not) adverb for negation and machine reasoning; 2016may21
  $t=522; $ear[$t] = "\x8D,0,0";    # 2018-09-25: "Н"
  $t=523; $ear[$t] = "\x85,0,1250"; # 2018-09-25: "Е"
  $psi=1250; $hlc=3; $mtx=250; $jux=0; $pos=2; $dba=0; $num=0; $mfn=0; # 2018-09-27
  $pre=0; $seq=1120; $tkb=0; $rv=522; KbLoad(); # 2019-06-03: flag-panel order
  $t=524; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

  $t=525; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# ВИЖУ -- 2019-06-03: #1810 ("I see"); verb for VisRecog;
  $t=526; $ear[$t] = "\x82,0,0";    # 2018-09-25: "В"
  $t=527; $ear[$t] = "\x88,0,0";    # 2018-09-25: "И"
  $t=528; $ear[$t] = "\x86,0,1810"; # 2019-06-03: "Ж"
  $t=529; $ear[$t] = "\x93,0,1810"; # 2019-06-03: "У"
  $psi=1810; $hlc=3; $jux=1250; $pos=8; $dba=1; $num=1; $mfn=0; # 2019-06-03
  $pre=1701; $seq=1760; $tkb=537; $rv=526; KbLoad(); # 2018-09-25: flag-panel order
  $t=530; $ear[$t] = " ,0,0";       # 2017--6-25: blank space for AudRecog

  $t=531; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# НИЧЕГО (1760 "nothing"); pronoun; 2016may21
  $t=532; $ear[$t] = "\x8D,0,0";    # 2018-09-25: "Н"
  $t=533; $ear[$t] = "\x88,0,0";    # 2018-09-25: "И"
  $t=534; $ear[$t] = "\x97,0,0";    # 2018-09-25: "Ч"
  $t=535; $ear[$t] = "\x85,0,0";    # 2018-09-25: "Е"
  $t=536; $ear[$t] = "\x83,0,0";    # 2018-09-25: "Г"
  $t=537; $ear[$t] = "\x8E,0,1228"; # 2018-09-25: "О"
  $psi=1228; $hlc=3; $jux=0; $pos=7; $dba=2; $num=1; $mfn=3; # 2018-09-27
  $pre=1810; $seq=0; $tkb=0; $rv=532; KbLoad(); # 2019-06-03: flag-panel order
  $t=538; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog


  $t=539; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# "Я" (1701 "I") personal pronoun; nominative; 2017-12-06
  $t=540; $ear[$t] = "\x9F,0,1701"; # 2018-09-25: "Я"
  $psi=1701; $hlc=3; $jux=0; $pos=7; $dba=1; $num=1; $mfn=0; # 2018-09-27
  $pre=0; $seq=1844; $tkb=546; $rv=540; KbLoad(); # 2019-06-03: flag-panel order
  $t=541; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

  $t=542; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# ЗНАЮ -- 2019-06-03: #1844 "know"); verb, 1st person sing.
  $t=543; $ear[$t] = "\x87,0,0";    # 2018-09-25: "З"
  $t=544; $ear[$t] = "\x8D,0,0";    # 2018-09-25: "Н"
  $t=545; $ear[$t] = "\x80,0,1844"; # 2019-06-03: "А"
  $t=546; $ear[$t] = "\x9E,0,1844"; # 2019-06-03: "Ю"
  $psi=1844; $hlc=3; $jux=0; $pos=8; $dba=1; $num=1; $mfn=0; # 2019-06-03
  $pre=1701; $seq=1561; $tkb=556; $rv=543; KbLoad(); # 2018-09-25: flag-panel order
  $t=547; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

  $t=548; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# СТУДЕНТ (1561 student) noun; a class for InFerence(); 2017-12-06
  $t=549; $ear[$t] = "\x91,0,0";    # 2018-09-25: "С"
  $t=550; $ear[$t] = "\x92,0,0";    # 2018-09-25: "Т"
  $t=551; $ear[$t] = "\x93,0,0";    # 2018-09-25: "У"
  $t=552; $ear[$t] = "\x84,0,0";    # 2018-09-25: "Д"
  $t=553; $ear[$t] = "\x85,0,0";    # 2018-09-25: "Е"
  $t=554; $ear[$t] = "\x8D,0,0";    # 2018-09-25: "Н"
  $t=555; $ear[$t] = "\x92,0,1561"; # 2018-09-25: "Т" stem $prc
  $t=556; $ear[$t] = "\x80,0,1561"; # 2018-09-25: "А"
  $psi=1561; $hlc=3; $jux=0; $pos=5; $dba=4; $num=1; $mfn=1; # 2018-09-27
  $pre=1844; $seq=0; $tkb=0; $rv=549; KbLoad(); # 2019-06-03: flag-panel order
  $t=557; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

  $t=558; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# БОГ (1533 God) masculine noun important for philosophy of AI
  $t=559; $ear[$t] = "\x81,0,0";    # 2018-09-25: "Б"
  $t=560; $ear[$t] = "\x8E,0,0";    # 2018-09-25: "О"
  $t=561; $ear[$t] = "\x83,0,1533"; # 2018-09-25: "Г"
  $psi=1533; $hlc=3; $jux=0; $pos=5; $dba=1; $num=1; $mfn=1; # 2018-09-27
  $pre=0; $seq=1840; $tkb=568; $rv=559; KbLoad(); # 2019-06-03: flag-panel order
  $t=562; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

  $t=563; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# ЗНАЕТ -- 2019-06-03: #1840 ("knows"); verb, 3rd person sing.
  $t=564; $ear[$t] = "\x87,0,0";    # 2018-09-25: "З"
  $t=565; $ear[$t] = "\x8D,0,0";    # 2018-09-25: "Н"
  $t=566; $ear[$t] = "\x80,0,1840"; # 2019-06-03: "А"
  $t=567; $ear[$t] = "\x85,0,1840"; # 2019-06-03: "Е"
  $t=568; $ear[$t] = "\x92,0,1840"; # 2019-06-03: "Т"
  $psi=1840; $hlc=3; $jux=0; $pos=8; $dba=3; $num=1; $mfn=0; # 2019-06-03
  $pre=1533; $seq=1723; $tkb=573; $rv=564; KbLoad(); # 2018-09-25: flag-panel order
  $t=569; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

  $t=570; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# ВСЁ (1723 all, everything) pronoun; 2016may23
  $t=571; $ear[$t] = "\x82,0,0";    # 2018-09-25: "В"
  $t=572; $ear[$t] = "\x91,0,0";    # 2018-09-25: "С"
  $t=573; $ear[$t] = "\xF0,0,1723"; # 2018-09-25: "Ё"
  $psi=1723; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=3; # 2018-09-27
  $pre=1840; $seq=0; $tkb=0; $rv=571; KbLoad(); # 2019-06-03: flag-panel order
  $t=574; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

  $t=575; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# СТУДЕНТЫ (1561 students) noun; a class for InFerence(); 2016mar02
  $t=576; $ear[$t] = "\x91,0,0";    # 2018-09-25: "С"
  $t=577; $ear[$t] = "\x92,0,0";    # 2018-09-25: "Т"
  $t=578; $ear[$t] = "\x93,0,0";    # 2018-09-25: "У"
  $t=579; $ear[$t] = "\x84,0,0";    # 2018-09-25: "Д"
  $t=580; $ear[$t] = "\x85,0,0";    # 2018-09-25: "Е"
  $t=581; $ear[$t] = "\x8D,0,0";    # 2018-09-25: "Н"
  $t=582; $ear[$t] = "\x92,0,0";    # 2018-09-25: "Т"
  $t=583; $ear[$t] = "\x9B,0,1561"; # 2018-09-25: "Ы"
  $psi=1561; $hlc=3; $jux=0; $pos=5; $dba=1; $num=2; $mfn=2; # 2018-09-27
  $pre=0; $seq=1898; $tkb=591;  $rv=576; KbLoad(); # 2019-06-03: flag-panel order
  $t=584; $ear[$t] = " ,0,0";       # 2018-09-25: blank space

  $t=585; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# ЧИТАЮТ -- 2019-06-03: #1898 "they read"); verb; 3rd pers. plural;
  $t=586; $ear[$t] = "\x97,0,0";    # 2018-09-25: "Ч"
  $t=587; $ear[$t] = "\x88,0,0";    # 2018-09-25: "И"
  $t=588; $ear[$t] = "\x92,0,0";    # 2018-09-25: "Т"
  $t=589; $ear[$t] = "\x80,0,1898"; # 2019-06-03: "А" stem $prc
  $t=590; $ear[$t] = "\x9E,0,1898"; # 2019-06-03: "Ю" stem $prc
  $t=591; $ear[$t] = "\x92,0,1898"; # 2019-06-03: "Т"
  $psi=1898; $hlc=3; $jux=0; $pos=8; $dba=3; $num=2; $mfn=0; # 2019-06-03
  $pre=1561; $seq=1540; $tkb=598; $rv=586; KbLoad(); # 2018-09-25: flag-panel order
  $t=592; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

  $t=593; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# КНИГИ (1540 books) noun, acc. plural; 2016mar06
  $t=594; $ear[$t] = "\x8A,0,0";    # 2018-09-25: "К"
  $t=595; $ear[$t] = "\x8D,0,0";    # 2018-09-25: "Н"
  $t=596; $ear[$t] = "\x88,0,0";    # 2018-09-25: "И"
  $t=597; $ear[$t] = "\x83,0,1540"; # 2018-09-25: "Г" stem for provisional recognition
  $t=598; $ear[$t] = "\x88,0,1540"; # 2018-09-25: "И"
  $psi=1540; $hlc=3; $jux=0; $pos=5; $dba=4; $num=2; $mfn=2; # 2018-09-27
  $pre=1898; $seq=0; $tkb=0; $rv=594; KbLoad(); # 2019-06-03: flag-panel order
  $t=599; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog


# "СКАЖИ МНЕ ЧТО-НИБУДЬ" (TELL ME SOMETHING) -- 2018-09-25: command for Imperative()
  $t=600; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# СКАЖИ -- 2019-06-03: #1823 ("tell"); verb for Imperative; 2019-06-03
  $t=601; $ear[$t] = "\x91,0,0";    # 2018-09-25: "С"
  $t=602; $ear[$t] = "\x9A,0,0";    # 2018-09-25: "К"
  $t=603; $ear[$t] = "\x80,0,0";    # 2018-09-25: "А"
  $t=604; $ear[$t] = "\x86,0,0";    # 2018-09-25: "Ж"
  $t=605; $ear[$t] = "\x88,0,1823"; # 2019-06-03: "И"
  $psi=1823; $hlc=3; $mtx=0; $jux=0; $pos=8; $dba=6; $num=1; $mfn=0; # 2019-06-03
  $pre=0; $seq=1782; $tkb=623; $rv=601; KbLoad(); # 2018-09-25: flag-panel order
  $t=606; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

  $t=607; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# МНЕ (1701 "to me") pronoun; familiar; dat. sing. 2018-09-25
  $t=608; $ear[$t] = "\x8C,0,0";    # 2018-09-25: "М"
  $t=609; $ear[$t] = "\x8D,0,0";    # 2018-09-25: "Н"
  $t=610; $ear[$t] = "\x85,0,1701"; # 2018-09-25: "Е"
  $psi=1701; $hlc=3; $jux=0; $pos=7; $dba=3; $num=1; $mfn=0; # 2018-09-27
  $pre=0; $seq=0; $tkb=0; $rv=608; KbLoad(); # 2018-09-25: flag-panel order
  $t=611; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

  $t=612; $ear[$t] = "\N{U+0},0,0"; # 2018-09-25: Unicode?
# ЧТО-НИБУДЬ (1782 something) pronoun; accusative singular; 2018-09-25
  $t=613; $ear[$t] = "\x97,0,0";    # 2018-09-25: "Ч"
  $t=614; $ear[$t] = "\x92,0,0";    # 2018-09-25: "Т"
  $t=615; $ear[$t] = "\x8E,0,0";    # 2018-09-25: "О"
  $t=616; $ear[$t] = "-,0,0";       # 2018-09-25: "-"
  $t=617; $ear[$t] = "\x8D,0,0";    # 2018-09-25: "Н"
  $t=618; $ear[$t] = "\x88,0,0";    # 2018-09-25: "И"
  $t=619; $ear[$t] = "\x81,0,0";    # 2018-09-25: "Б"
  $t=620; $ear[$t] = "\x93,0,0";    # 2018-09-25: "У"
  $t=621; $ear[$t] = "\x84,0,0";    # 2018-09-25: "Д"
  $t=622; $ear[$t] = "\x9C,0,1782"; # 2018-09-25: "Ь"
  $psi=1782; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=3; # 2018-09-27
  $pre=1823; $seq=0; $tkb=0; $rv=613; KbLoad(); # 2019-06-03: flag-panel order
  $t=623; $ear[$t] = " ,0,0";       # 2018-09-25: blank space for AudRecog

# http://www.nlg-wiki.org/systems/Dushka -- about tutorial Russian AI for MSIE
  $t=1001; $ear[$t] = " ,0,0";  # 2016feb24: Reserve 1001-1999 for Russian
  $t=1002; $ear[$t] = "\N{U+0},0,0";     # 2016feb24: seems necessary?
# 2016feb22: The Unicode U+HHHH notation uses hexadecimal.
# ОШИБКА (1582 error) first word so any bug will announce itself
  $t=1003; $ear[$t] = "\x8E,0,0";        # 2016feb24 " О"
  $t=1004; $ear[$t] = "\x98,0,0";        # 2016feb24 " Ш"
  $t=1005; $ear[$t] = "\x88,0,0";        # 2016feb24 " И"
  $t=1006; $ear[$t] = "\x81,0,0";        # 2016feb24 " Б"
  $t=1007; $ear[$t] = "\x8A,0,0";        # 2016feb24 " К"
  $t=1008; $ear[$t] = "\x80,0,1582";     # 2016feb24 " А"
  $psi=1582; $hlc=3; $mtx=586; $jux=0; $pos=5; $dba=0; $num=1; $mfn=2; # 2018-09-27
  $pre=0; $seq=0; $tkb=0; $rv=1003; KbLoad(); # 2018-07-07: flag-panel order
  $t=1009; $ear[$t] = " ,0,0";       # 2016feb24: blank space

  $t=1010; $ear[$t] = "\N{U+0},0,0"; # 2016feb24: Unicode?
  # АВОСЬ (1270 maybe) for KbRetro to treat as answer; 2016may01
  $t=1011; $ear[$t] = "\x80,0,0";    # 2016feb22: "А"
  $t=1012; $ear[$t] = "\x82,0,0";    # 2016feb22: "В"
  $t=1013; $ear[$t] = "\x8E,0,0";    # 2016feb22: "О"
  $t=1014; $ear[$t] = "\x91,0,0";    # 2016feb22: "С"
  $t=1015; $ear[$t] = "\x9C,0,1270"; # 2016feb22: "Ь"
  $psi=1270; $hlc=3; $jux=0; $pos=2; $dba=0; $num=0; $mfn=0; # 2018-09-27
  $pre=0; $seq=0; $tkb=0; $rv=1011; KbLoad(); # 2018-07-07: flag-panel order
  $t=1016; $ear[$t] = " ,0,0";       # 2016feb24: blank space

  $t=1017; $ear[$t] = "\N{U+0},0,0"; # 2016feb24: Unicode?
# без (1600 without) preposition; 2016feb26
  $t=1018; $ear[$t] = "\x81,0,0";    # 2016feb22: "Б"
  $t=1019; $ear[$t] = "\x85,0,0";    # 2016feb22: "Е"
  $t=1020; $ear[$t] = "\x87,0,1600"; # 2016feb26: "З"
  $psi=1600; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-09-27
  $pre=0; $seq=0; $tkb=0; $rv=1018; KbLoad(); # 2018-07-07: flag-panel order
  $t=1021; $ear[$t] = " ,0,0";       # 2016feb24: blank space

  $t=1022; $ear[$t] = "\N{U+0},0,0"; # 2016feb24: Unicode?
# благодаря (1602 thanks to, owing to) 2016feb26:
  $t=1023; $ear[$t] = "\x81,0,0";    # 2016feb24: "Б"
  $t=1024; $ear[$t] = "\x8B,0,0";    # 2016feb24: "Л"
  $t=1025; $ear[$t] = "\x80,0,0";    # 2016feb24: "А"
  $t=1026; $ear[$t] = "\x83,0,0";    # 2016feb24: "Г"
  $t=1027; $ear[$t] = "\x8E,0,0";    # 2016feb24: "О"
  $t=1028; $ear[$t] = "\x84,0,0";    # 2016feb24: "Д"
  $t=1029; $ear[$t] = "\x80,0,0";    # 2016feb24: "А"
  $t=1030; $ear[$t] = "\x90,0,0";    # 2016feb24: "Р"
  $t=1031; $ear[$t] = "\x9F,0,1602"; # 2016feb26: "Я"
  $psi=1602; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-09-27
  $pre=0; $seq=0; $tkb=0; $rv=1023; KbLoad(); # 2018-07-07: flag-panel order
  $t=1032; $ear[$t] = " ,0,0";       # 2016feb24: blank space

  $t=1033; $ear[$t] = "\N{U+0},0,0"; # 2016feb24: Unicode?
# БЫВАТЬ (1803 to occur) verb; infinitive; 2016apr27: Cyrillic
  $t=1034; $ear[$t] = "\x81,0,0";    # 2016feb24: "Б"
  $t=1035; $ear[$t] = "\x9B,0,0";    # 2016feb24: "Ы"
  $t=1036; $ear[$t] = "\x82,0,0";    # 2016feb24: "В"
  $t=1037; $ear[$t] = "\x80,0,1803"; # 2016mar04: "А" stem $prc
  $t=1038; $ear[$t] = "\x92,0,1803"; # 2016mar04: "Т" stem #prc
  $t=1039; $ear[$t] = "\x9C,0,1803"; # 2016feb24: "Ь"
  $psi=1803; $hlc=3; $jux=0; $pos=8; $dba=0; $num=0; $mfn=0; # 2018-09-27
  $pre=0; $seq=0; $tkb=0; $rv=1034; KbLoad(); # 2018-07-07: flag-panel order
  $t=1040; $ear[$t] = " ,0,0";       # 2016feb24: blank space

  $t=1041; $ear[$t] = "\N{U+0},0,0"; # 2016feb24: Unicode?
# БЫТЬ (1800 to be) verb; irreg; infinitive 2016may01
  $t=1042; $ear[$t] = "\x81,0,0";    # 2016feb24: "Б"
  $t=1043; $ear[$t] = "\x9B,0,0";    # 2016feb24: "Ы"
  $t=1044; $ear[$t] = "\x92,0,0";    # 2016feb22: "Т"
  $t=1045; $ear[$t] = "\x9C,0,1800"; # 2016feb24: "Ь"
  $psi=1800; $hlc=3; $jux=0; $pos=8; $dba=0; $num=0; $mfn=0; # 2018-09-27
  $pre=0; $seq=0; $tkb=0; $rv=1042; KbLoad(); # 2018-07-07: flag-panel order
  $t=1046; $ear[$t] = " ,0,0";       # 2016feb24: blank space

  $t=1047; $ear[$t] = "\N{U+0},0,0"; # 2016feb24: Unicode?
# БУДУ (1807 will be) verb; irreg; 1st person future; 2016may01
  $t=1048; $ear[$t] = "\x81,0,0";    # 2016feb25: "Б"
  $t=1049; $ear[$t] = "\x93,0,0";    # 2016feb23: "У"
  $t=1050; $ear[$t] = "\x84,0,0";    # 2016feb22: "Д"
  $t=1051; $ear[$t] = "\x93,0,1807"; # 2016feb23: "У"
  $psi=1807; $hlc=3; $jux=0; $pos=8; $dba=0; $num=0; $mfn=0; # 2018-09-27
  $pre=0; $seq=0; $tkb=0; $rv=1048; KbLoad(); # 2018-07-07: flag-panel order
  $t=1052; $ear[$t] = " ,0,0";       # 2016feb25: blank space

  $t=1053; $ear[$t] = "\N{U+0},0,0"; # 2016feb25: Unicode?
# "В" (1604 "in, into, at") preposition; 2016feb26
  $t=1054; $ear[$t] = "\x82,0,1604"; # 2016feb26: "В"
  $psi=1604; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-09-27
  $pre=0; $seq=0; $tkb=0; $rv=1054; KbLoad(); # 2018-07-07: flag-panel order
  $t=1055; $ear[$t] = " ,0,0";       # 2016feb25: blank space

  $t=1056; $ear[$t] = "\N{U+0},0,0"; # 2016feb25: Unicode?
# "ВО" (1605 "in, into, at") preposition; 2016feb26
  $t=1057; $ear[$t] = "\x82,0,0";    # 2016feb25: "В"
  $t=1058; $ear[$t] = "\x8E,0,1605"; # 2016feb26: "О"
  $psi=1605; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-09-27
  $pre=0; $seq=0; $tkb=0; $rv=1057; KbLoad(); # 2018-07-07: flag-panel order
  $t=1059; $ear[$t] = " ,0,0";       # 2016feb25: blank space

  $t=1060; $ear[$t] = "\N{U+0},0,0"; # 2016feb25: Unicode?
# вдоль (1607 "along") preposition; 2016feb26
  $t=1061; $ear[$t] = "\x82,0,0";    # 2016feb25: "В"
  $t=1062; $ear[$t] = "\x84,0,0";    # 2016feb25: "Д"
  $t=1063; $ear[$t] = "\x8E,0,0";    # 2016feb25: "О"
  $t=1064; $ear[$t] = "\x8B,0,0";    # 2016feb25: "Л"
  $t=1065; $ear[$t] = "\x9C,0,1607"; # 2016feb26: "Ь"
  $psi=1607; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-09-27
  $pre=0; $seq=0; $tkb=0; $rv=1061; KbLoad(); # 2018-07-07: flag-panel order
  $t=1066; $ear[$t] = " ,0,0";       # 2016feb25: blank space

  $t=1067; $ear[$t] = "\N{U+0},0,0"; # 2016feb25: Unicode?
# ВИДЕТЬ -- 2019-06-03: #1810 ("to see") verb; infinitive;
  $t=1068; $ear[$t] = "\x82,0,0";    # 2019-06-03: "В"
  $t=1069; $ear[$t] = "\x88,0,0";    # 2019-06-03: "И"
  $t=1070; $ear[$t] = "\x84,0,1810"; # 2019-06-03: "Д"
  $t=1071; $ear[$t] = "\x85,0,1810"; # 2019-06-03: "Е"
  $t=1072; $ear[$t] = "\x92,0,1810"; # 2019-06-03: "Т"
  $t=1073; $ear[$t] = "\x9C,0,1810"; # 2019-06-03: "Ь"
  $psi=1810; $hlc=3; $mtx=870; $jux=0; $pos=8; $dba=0; $num=0; $mfn=0; # 2019-06-03
  $pre=0; $seq=0; $tkb=0; $rv=1068; KbLoad(); # 2018-07-07: flag-panel order
  $t=1074; $ear[$t] = " ,0,0";       # 2016feb25: blank space

  $t=1075; $ear[$t] = "\N{U+0},0,0"; # 2016feb24: Unicode?
# ВИЖУ -- 2019-06-03: #1810 "I see"); verb for VisRecog;
  $t=1076; $ear[$t] = "\x82,0,0";    # 2016feb25:  "В"
  $t=1077; $ear[$t] = "\x88,0,0";    # 2016feb25   "И"
  $t=1078; $ear[$t] = "\x86,0,0";    # 2016feb25:  "Ж"
  $t=1079; $ear[$t] = "\x93,0,1810"; # 2019-06-03: "У"
  $psi=1810; $hlc=3; $mtx=870; $jux=0; $pos=8; $dba=1; $num=1; $mfn=0; # 2018-12-10
  $pre=0; $seq=0; $tkb=0; $rv=1076; KbLoad(); # 2018-07-07: flag-panel order
  $t=1080; $ear[$t] = " ,0,0";       # 2016feb25: blank space

  $t=1081; $ear[$t] = "\N{U+0},0,0"; # 2016feb25: Unicode?
# ВИДИШЬ -- 2019-06-03: #1810 "you see"); verb for VisRecog;
  $t=1082; $ear[$t] = "\x82,0,0";    # 2016feb25:  "В"
  $t=1083; $ear[$t] = "\x88,0,0";    # 2016feb25:  "И"
  $t=1084; $ear[$t] = "\x84,0,0";    # 2019-06-03: "Д"
  $t=1085; $ear[$t] = "\x88,0,1810"; # 2019-06-03: "И"
  $t=1086; $ear[$t] = "\x98,0,1810"; # 2019-06-03: "Ш"
  $t=1087; $ear[$t] = "\x9C,0,1810"; # 2019-06-03: "Ь"
  $psi=1810; $hlc=3; $mtx=870; $jux=0; $pos=8; $dba=2; $num=1; $mfn=0; # 2019-06-03
  $pre=0; $seq=0; $tkb=0; $rv=1082; KbLoad(); # 2018-07-07: flag-panel order
  $t=1088; $ear[$t] = " ,0,0";       # 2016feb25: blank space

  $t=1089; $ear[$t] = "\N{U+0},0,0"; # 2016feb24: Unicode?
# ВИДИТ -- 2019-06-03: #1810 "he sees"); verb for VisRecog;
  $t=1090; $ear[$t] = "\x82,0,0";    # 2016feb25:  "В"
  $t=1091; $ear[$t] = "\x88,0,0";    # 2016feb25   "И"
  $t=1092; $ear[$t] = "\x84,0,1810"; # 2019-06-03: "Д"
  $t=1093; $ear[$t] = "\x88,0,1810"; # 2019-06-03: "И"
  $t=1094; $ear[$t] = "\x92,0,1810"; # 2019-06-03: "Т"
  $psi=1810; $hlc=3; $mtx=870; $jux=0; $pos=8; $dba=3; $num=1; $mfn=0; # 2019-06-03
  $pre=0; $seq=0; $tkb=0; $rv=1090; KbLoad(); # 2018-07-07: flag-panel order
  $t=1095; $ear[$t] = " ,0,0";       # 2016feb25: blank space

  $t=1096; $ear[$t] = "\N{U+0},0,0"; # 2016feb24: Unicode?
# ВИДИМ -- 2019-06-03: #1810 ("we see"); verb for VisRecog;
  $t=1097; $ear[$t] = "\x82,0,0";    # 2016feb25:  "В"
  $t=1098; $ear[$t] = "\x88,0,0";    # 2016feb25:  "И"
  $t=1099; $ear[$t] = "\x84,0,1810"; # 2019-06-03: "Д"
  $t=1100; $ear[$t] = "\x88,0,1810"; # 2019-06-03: "И"
  $t=1101; $ear[$t] = "\x8C,0,1810"; # 2019-06-03: "м"
  $psi=1810; $hlc=3; $mtx=870; $jux=0; $pos=8; $dba=1; $num=2; $mfn=0; # 2018-12-10
  $pre=0; $seq=0; $tkb=0; $rv=1097; KbLoad(); # 2018-07-07: flag-panel order
  $t=1102; $ear[$t] = " ,0,0";       # 2016feb25: blank space

  $t=1103; $ear[$t] = "\N{U+0},0,0"; # 2016feb24: Unicode?
# ВИДИТЕ -- 2019-06-03: #1810 ("you see"); verb; plural;
  $t=1104; $ear[$t] = "\x82,0,0";    # 2016feb25:  "В"
  $t=1105; $ear[$t] = "\x88,0,0";    # 2016feb25:  "И"
  $t=1106; $ear[$t] = "\x84,0,1810"; # 2019-06-03: "Д"
  $t=1107; $ear[$t] = "\x88,0,1810"; # 2019-06-03: "И"
  $t=1108; $ear[$t] = "\x92,0,1810"; # 2019-06-03: "Т"
  $t=1109; $ear[$t] = "\x85,0,1810"; # 2019-06-03: "Е"
  $psi=1810; $hlc=3; $mtx=870; $jux=0; $pos=8; $dba=2; $num=2; $mfn=0; # 2019-06-03
  $pre=0; $seq=0; $tkb=0; $rv=1104; KbLoad(); # 2018-07-07: flag-panel order
  $t=1110; $ear[$t] = " ,0,0";       # 2016feb25: blank space

  $t=1111; $ear[$t] = "\N{U+0},0,0"; # 2016feb24: Unicode?
# ВИДЯТ -- 2019-06-03: #1810 ("they see"); verb; 3rd pers. plural;
  $t=1112; $ear[$t] = "\x82,0,0";    # 2016feb25:  "В"
  $t=1113; $ear[$t] = "\x88,0,0";    # 2016feb25: " И"
  $t=1114; $ear[$t] = "\x84,0,1810"; # 2019-06-03: "Д"
  $t=1115; $ear[$t] = "\x9F,0,1810"; # 2019-06-03: "Я"
  $t=1116; $ear[$t] = "\x92,0,1810"; # 2019-06-03: "Т"
  $psi=1810; $hlc=3; $mtx=870; $jux=0; $pos=8; $dba=3; $num=2; $mfn=0; # 2019-06-03
  $pre=0; $seq=0; $tkb=0; $rv=1112; KbLoad(); # 2018-07-07: flag-panel order
  $t=1117; $ear[$t] = " ,0,0";       # 2016feb25: blank space

  $t=1118; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# вместо (1608 instead of) preposition; 2016feb26
  $t=1119; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1120; $ear[$t] = "\x8C,0,0";    # 2016feb26 " М"
  $t=1121; $ear[$t] = "\x85,0,0";    # 2016feb26: "Е"
  $t=1122; $ear[$t] = "\x91,0,0";    # 2016feb26 " С"
  $t=1123; $ear[$t] = "\x92,0,0";    # 2016feb26: "Т"
  $t=1124; $ear[$t] = "\x8E,0,1608"; # 2016feb26: "О"
  $psi=1608; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-09-27
  $pre=0; $seq=0; $tkb=0; $rv=1119; KbLoad(); # 2018-07-07: flag-panel order
  $t=1125; $ear[$t] = " ,0,0";       # 2016feb25: blank space

  $t=1126; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# вне (1609 outside) preposition; 2016feb26:
  $t=1127; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1028; $ear[$t] = "\x8D,0,0";    # 2016feb22: "Н"
  $t=1129; $ear[$t] = "\x85,0,1609"; # 2016feb26: "Е"
  $psi=1609; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-09-27
  $pre=0; $seq=0; $tkb=0; $rv=1127; KbLoad(); # 2018-07-07: flag-panel order
  $t=1130; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1131; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# внутри (1610 inside) preposition; 2016feb26
  $t=1132; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1133; $ear[$t] = "\x8D,0,0";    # 2016feb26 " Н"
  $t=1134; $ear[$t] = "\x93,0,0";    # 2016feb26: "У"
  $t=1135; $ear[$t] = "\x92,0,0";    # 2016feb26 " Т"
  $t=1136; $ear[$t] = "\x90,0,0";    # 2016feb26: "Р"
  $t=1137; $ear[$t] = "\x88,0,1610"; # 2016feb26: "И"
  $psi=1610; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-07
  $pre=0;  $seq=0; $tkb=0; $rv=1132; KbLoad(); # 2018-07-07: flag-panel order
  $t=1138; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1139; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# внутрь (1611 inside) preposition; 2016feb26
  $t=1140; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1141; $ear[$t] = "\x8D,0,0";    # 2016feb26 " Н"
  $t=1142; $ear[$t] = "\x93,0,0";    # 2016feb26: "У"
  $t=1143; $ear[$t] = "\x92,0,0";    # 2016feb26 " Т"
  $t=1144; $ear[$t] = "\x90,0,0";    # 2016feb26: "Р"
  $t=1145; $ear[$t] = "\x9C,0,1611"; # 2016feb26: "Ь"
  $psi=1611; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1140; KbLoad(); # 2018-07-07: flag-panel order
  $t=1146; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1147; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# возле (1612 near) preposition; 2016feb26
  $t=1148; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1149; $ear[$t] = "\x8E,0,0";    # 2016feb26: "О"
  $t=1150; $ear[$t] = "\x87,0,0";    # 2016feb26 " З"
  $t=1151; $ear[$t] = "\x8B,0,0";    # 2016feb26: "Л"
  $t=1152; $ear[$t] = "\x85,0,1612"; # 2016feb26: "Е"
  $psi=1612; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-07
  $pre=0;  $seq=0; $tkb=0; $rv=1148; KbLoad(); # 2018-07-07: flag-panel order
  $t=1153; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1154; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# вокруг (1613 around) preposition; 2016feb26
  $t=1155; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1156; $ear[$t] = "\x8E,0,0";    # 2016feb26 " О"
  $t=1157; $ear[$t] = "\x8A,0,0";    # 2016feb26: "К"
  $t=1158; $ear[$t] = "\x90,0,0";    # 2016feb26 " Р"
  $t=1159; $ear[$t] = "\x93,0,0";    # 2016feb26: "У"
  $t=1160; $ear[$t] = "\x83,0,1613"; # 2016feb26: "Г"
  $psi=1613; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-07
  $pre=0;  $seq=0; $tkb=0; $rv=1155; KbLoad(); # 2018-07-07: flag-panel order
  $t=1161; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1162; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# вопреки (1614 despite) preposition; 2016feb26
  $t=1163; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1164; $ear[$t] = "\x8E,0,0";    # 2016feb26 " О"
  $t=1165; $ear[$t] = "\x8F,0,0";    # 2016feb26: "П"
  $t=1166; $ear[$t] = "\x91,0,0";    # 2016feb26 " Р"
  $t=1167; $ear[$t] = "\x85,0,0";    # 2016feb26: "Е"
  $t=1168; $ear[$t] = "\x8A,0,0";    # 2016feb26: "К"
  $t=1169; $ear[$t] = "\x88,0,1614"; # 2016feb26: "И"
  $psi=1614; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1163; KbLoad(); # 2018-07-07: flag-panel order
  $t=1170; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1171; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# впереди (1615 in front of) preposition; 2016feb26
  $t=1172; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1173; $ear[$t] = "\x8F,0,0";    # 2016feb26 " П"
  $t=1174; $ear[$t] = "\x85,0,0";    # 2016feb26: "Е"
  $t=1175; $ear[$t] = "\x90,0,0";    # 2016feb26 " Р"
  $t=1176; $ear[$t] = "\x85,0,0";    # 2016feb26: "Е"
  $t=1177; $ear[$t] = "\x84,0,0";    # 2016feb26: "Д"
  $t=1178; $ear[$t] = "\x88,0,1615"; # 2016feb26: "И"
  $psi=1615; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1172; KbLoad(); # 2018-07-07: flag-panel order
  $t=1179; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1180; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# вследствие (1616 because of) preposition; 2016feb26
  $t=1181; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1182; $ear[$t] = "\x91,0,0";    # 2016feb26 " С"
  $t=1183; $ear[$t] = "\x8B,0,0";    # 2016feb26: "Л"
  $t=1184; $ear[$t] = "\x85,0,0";    # 2016feb26 " Е"
  $t=1185; $ear[$t] = "\x84,0,0";    # 2016feb26: "Д"
  $t=1186; $ear[$t] = "\x91,0,0";    # 2016feb26 " С"
  $t=1187; $ear[$t] = "\x92,0,0";    # 2016feb26: "Т"
  $t=1188; $ear[$t] = "\x82,0,0";    # 2016feb26 " В"
  $t=1189; $ear[$t] = "\x88,0,0";    # 2016feb26: "И"
  $t=1190; $ear[$t] = "\x85,0,1616"; # 2016feb26: "Е"
  $psi=1616; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1181; KbLoad(); # 2018-07-07: flag-panel order
  $t=1191; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1192; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВЫ (1737 you) pronoun; familiar nom. plural; 2016may01
  $t=1193; $ear[$t] = "\x82,0,0";    # 2016feb26 " В"
  $t=1194; $ear[$t] = "\x9B,0,1737"; # 2016feb26: "Ы"
  $psi=1737; $hlc=3; $jux=0; $pos=7; $dba=1; $num=2; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1193; KbLoad(); # 2018-07-07: flag-panel order
  $t=1195; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1196; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАС (1737 of you) pronoun; familiar gen. plural; 2016may01
  $t=1197; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1198; $ear[$t] = "\x80,0,0";    # 2016feb26: "А"
  $t=1199; $ear[$t] = "\x91,0,1737"; # 2016feb26: "С"
  $psi=1737; $hlc=3; $jux=0; $pos=7; $dba=2; $num=2; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1197; KbLoad(); # 2018-07-07: flag-panel order
  $t=1200; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1201; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАМ (1737 to you) pronoun; familiar dat. plural; 2016may01
  $t=1202; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1203; $ear[$t] = "\x80,0,0";    # 2016feb26: "А"
  $t=1204; $ear[$t] = "\x8C,0,1737"; # 2016feb26: "М"
  $psi=1737; $hlc=3; $jux=0; $pos=7; $dba=3; $num=2; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1202; KbLoad(); # 2018-07-07: flag-panel order
  $t=1205; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1206; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАС (1737 you) pronoun; familiar acc. plural; 2016feb26
  $t=1207; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1208; $ear[$t] = "\x80,0,0";    # 2016feb26: "А"
  $t=1209; $ear[$t] = "\x91,0,1737"; # 2016feb26: "С"
  $psi=1737; $hlc=3; $jux=0; $pos=7; $dba=4; $num=2; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1207; KbLoad(); # 2018-07-07: flag-panel order
  $t=1210; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1211; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАМИ (1737 you) pron; familiar instrumental plural; 2016may01
  $t=1212; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1213; $ear[$t] = "\x80,0,0";    # 2016feb22: "А"
  $t=1214; $ear[$t] = "\x8C,0,0";    # 2016feb26: "М"
  $t=1215; $ear[$t] = "\x88,0,1737"; # 2016feb22: "И"
  $psi=1737; $hlc=3; $jux=0; $pos=7; $dba=5; $num=2; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1212; KbLoad(); # 2018-07-07: flag-panel order
  $t=1216; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1217; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАС (1737 you) pron; familiar prep. plural; 2016feb26
  $t=1218; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1219; $ear[$t] = "\x80,0,0";    # 2016feb26: "А"
  $t=1220; $ear[$t] = "\x91,0,1737"; # 2016feb26: "С"
  $psi=1737; $hlc=3; $jux=0; $pos=7; $dba=6; $num=2; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1218; KbLoad(); # 2018-07-07: flag-panel order
  $t=1221; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1222; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВЫ (1749 you) pronoun; formal nom. sing.; 2016may01
  $t=1223; $ear[$t] = "\x82,0,0";    # 2016feb26 " В"
  $t=1224; $ear[$t] = "\x9B,0,1749"; # 2016feb26: "Ы"
  $psi=1749; $hlc=3; $jux=0; $pos=7; $dba=1; $num=1; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1223; KbLoad(); # 2018-07-07: flag-panel order
  $t=1225; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1226; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАС (1749 of you) pronoun; formal gen. sing.; 2016may01
  $t=1227; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1228; $ear[$t] = "\x80,0,0";    # 2016feb26: "А"
  $t=1229; $ear[$t] = "\x91,0,1749"; # 2016feb26: "С"
  $psi=1749; $hlc=3; $jux=0; $pos=7; $dba=2; $num=1; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1227; KbLoad(); # 2018-07-07: flag-panel order
  $t=1230; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1231; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАМ (1749 to you) pronoun; formal dat. sing.; 2016may01
  $t=1232; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1233; $ear[$t] = "\x80,0,0";    # 2016feb26: "А"
  $t=1234; $ear[$t] = "\x8C,0,1749"; # 2016feb26: "М"
  $psi=1749; $hlc=3; $jux=0; $pos=7; $dba=3; $num=1; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1232; KbLoad(); # 2018-07-07: flag-panel order
  $t=1235; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1236; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАС (1749 you) pronoun; formal acc. sing.; 2016may01
  $t=1237; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1238; $ear[$t] = "\x80,0,0";    # 2016feb26: "А"
  $t=1239; $ear[$t] = "\x91,0,1749"; # 2016feb26: "С"
  $psi=1749; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1237; KbLoad(); # 2018-07-07: flag-panel order
  $t=1240; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1241; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАМИ (1749 you) pron; formal instrumental sing.; 2016may01
  $t=1242; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1243; $ear[$t] = "\x80,0,0";    # 2016feb26: "А"
  $t=1244; $ear[$t] = "\x8C,0,0";    # 2016feb26: "М"
  $t=1245; $ear[$t] = "\x88,0,1749"; # 2016feb26: "И"
  $psi=1749; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1242; KbLoad(); # 2018-07-07: flag-panel order
  $t=1246; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1247; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАС (1749 you) pron; formal prep. sing.; 2016may01
  $t=1248; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1249; $ear[$t] = "\x80,0,0";    # 2016feb26: "А"
  $t=1250; $ear[$t] = "\x91,0,1749"; # 2016feb26: "С"
  $psi=1749; $hlc=3; $jux=0; $pos=7; $dba=6; $num=1; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1248; KbLoad(); # 2018-07-07: flag-panel order
  $t=1251; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1252; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВЫ (1755 you) pronoun; formal nom. plural.; 2016may01
  $t=1253; $ear[$t] = "\x82,0,0";    # 2016feb26 " В"
  $t=1254; $ear[$t] = "\x9B,0,1755"; # 2016feb26: "Ы"
  $psi=1755; $hlc=3; $jux=0; $pos=7; $dba=1; $num=2; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1253; KbLoad(); # 2018-07-07: flag-panel order
  $t=1255; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1256; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАС (1755 of you) pronoun; formal gen. plural; 2016may01
  $t=1257; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1258; $ear[$t] = "\x80,0,0";    # 2016feb26: "А"
  $t=1259; $ear[$t] = "\x91,0,1755"; # 2016feb26: "С"
  $psi=1755; $hlc=3; $jux=0; $pos=7; $dba=2; $num=2; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1257; KbLoad(); # 2018-07-07: flag-panel order
  $t=1260; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1261; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАМ (1755 to you) pronoun; formal dat. plural.; 2016may01
  $t=1262; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1263; $ear[$t] = "\x80,0,0";    # 2016feb26: "А"
  $t=1264; $ear[$t] = "\x8C,0,1755"; # 2016feb26: "М"
  $psi=1755; $hlc=3; $jux=0; $pos=7; $dba=3; $num=2; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1262; KbLoad(); # 2018-07-07: flag-panel order
  $t=1265; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1266; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАС (1755 you) pronoun; formal acc. plural; 2016may01
  $t=1267; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1268; $ear[$t] = "\x80,0,0";    # 2016feb26: "А"
  $t=1269; $ear[$t] = "\x91,0,1755"; # 2016feb26: "С"
  $psi=1755; $hlc=3; $jux=0; $pos=7; $dba=4; $num=2; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1267; KbLoad(); # 2018-07-07: flag-panel order
  $t=1270; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1271; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАМИ (1755 you) pron; formal instrumental plural; 2016may01
  $t=1272; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1273; $ear[$t] = "\x80,0,0";    # 2016feb26: "А"
  $t=1274; $ear[$t] = "\x8C,0,0";    # 2016feb26: "М"
  $t=1275; $ear[$t] = "\x88,0,1755"; # 2016feb26: "И"
  $psi=1755; $hlc=3; $jux=0; $pos=7; $dba=5; $num=2; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1272; KbLoad(); # 2018-07-07: flag-panel order
  $t=1276; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1277; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ВАС (1755 you) pron; formal prep. plural; 2016may01
  $t=1278; $ear[$t] = "\x82,0,0";    # 2016feb26: "В"
  $t=1279; $ear[$t] = "\x80,0,0";    # 2016feb26: "А"
  $t=1280; $ear[$t] = "\x91,0,1755"; # 2016feb26: "С"
  $psi=1755; $hlc=3; $jux=0; $pos=7; $dba=6; $num=2; $mfn=0; # 2018-07-07
  $pre=0; $seq=0; $tkb=0; $rv=1278; KbLoad(); # 2018-07-07: flag-panel order
  $t=1281; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1282; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ДА (1432 yes) interjection; 2016may01
  $t=1283; $ear[$t] = "\x84,0,0";    # 2016feb26: "Д"
  $t=1284; $ear[$t] = "\x80,0,1432"; # 2016feb26: "А"
  $psi=1432; $hlc=3; $jux=0; $pos=4; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1283; KbLoad(); # 2018-07-08: flag-panel order
  $t=1285; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1286; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ДЕЛАТЬ -- 2019-06-03: #1826 "to do"); sample verb;
  $t=1287; $ear[$t] = "\x84,0,0";    # 2016feb26:  "Д"
  $t=1288; $ear[$t] = "\x85,0,0";    # 2016feb26:  "Е"
  $t=1289; $ear[$t] = "\x8B,0,0";    # 2016feb26:  "Л"
  $t=1290; $ear[$t] = "\x80,0,1826"; # 2019-06-03: "А" stem $prc
  $t=1291; $ear[$t] = "\x92,0,1826"; # 2019-06-03: "Т" stem $prc
  $t=1292; $ear[$t] = "\x9C,0,1826"; # 2019-06-03: "Ь"
  $psi=1826; $hlc=3; $jux=0; $pos=8; $dba=0; $num=0; $mfn=0; # 2019-06-03
  $pre=0; $seq=0; $tkb=0; $rv=1287; KbLoad(); # 2018-07-08: flag-panel order
  $t=1293; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1294; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# ДЕЛАЮ -- 2019-06-03: #1826 ("I do"); sample verb;
  $t=1295; $ear[$t] = "\x84,0,0";    # 2016feb26:  "Д"
  $t=1296; $ear[$t] = "\x85,0,0";    # 2016feb26:  "Е"
  $t=1297; $ear[$t] = "\x8B,0,1826"; # 2019-06-03: "Л"
  $t=1298; $ear[$t] = "\x80,0,1826"; # 2019-06-03: "А"
  $t=1299; $ear[$t] = "\x9E,0,1826"; # 2019-06-03: "Ю"
  $psi=1826; $hlc=3; $jux=0; $pos=8; $dba=1; $num=1; $mfn=0; # 2019-06-03
  $pre=0; $seq=0; $tkb=0; $rv=1295; KbLoad(); # 2018-07-08: flag-panel order
  $t=1300; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1301; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# 1514 ДЕТИ (children) noun; plural; 2016may01
  $t=1302; $ear[$t] = "\x84,0,0";    # 2016feb26: "Д"
  $t=1303; $ear[$t] = "\x85,0,0";    # 2016feb26: "Е"
  $t=1304; $ear[$t] = "\x92,0,0";    # 2016feb26: "Т"
  $t=1305; $ear[$t] = "\x88,0,1514"; # 2016feb26: "И"
  $psi=1514; $hlc=3; $jux=0; $pos=5; $dba=1; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1302; KbLoad(); # 2018-07-08: flag-panel order
  $t=1306; $ear[$t] = " ,0,0";       # 2016feb25: blank space

  $t=1307; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# для (1618 for) preposition; 2016feb26:
  $t=1308; $ear[$t] = "\x84,0,0";    # 2016feb26: "Д"
  $t=1309; $ear[$t] = "\x8B,0,0";    # 2016feb26: "Л"
  $t=1310; $ear[$t] = "\x9F,0,1618"; # 2016feb26: "Я"
  $psi=1618; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1308; KbLoad(); # 2018-07-08: flag-panel order
  $t=1311; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1312; $ear[$t] = "\N{U+0},0,0"; # 2016feb26: Unicode?
# до (1620 until, before) preposition; 2016feb26:
  $t=1313; $ear[$t] = "\x84,0,0";    # 2016feb26: "Д"
  $t=1314; $ear[$t] = "\x8E,0,1620"; # 2016feb26: "О"
  $psi=1620; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1313; KbLoad(); # 2018-07-08: flag-panel order
  $t=1315; $ear[$t] = " ,0,0";       # 2016feb26: blank space

  $t=1316; $ear[$t] = "\N{U+0},0,0"; # 2016feb27: Unicode?
# ДУМАТЬ -- 2019-06-03: #1830 "to think"); verb; infinitive;
  $t=1317; $ear[$t] = "\x84,0,0";    # 2016feb27:  "Д"
  $t=1318; $ear[$t] = "\x93,0,0";    # 2016feb27:  "У"
  $t=1319; $ear[$t] = "\x8C,0,0";    # 2016may01:  "М"
  $t=1320; $ear[$t] = "\x80,0,1830"; # 2019-06-03: "А"
  $t=1321; $ear[$t] = "\x92,0,1830"; # 2019-06-03: "Т"
  $t=1322; $ear[$t] = "\x9C,0,1830"; # 2019-06-03: "Ь"
  $psi=1830; $hlc=3; $jux=0; $pos=8; $dba=0; $num=0; $mfn=0; # 2019-06-03
  $pre=0; $seq=0; $tkb=0; $rv=1317; KbLoad(); # 2018-07-08: flag-panel order
  $t=1323; $ear[$t] = " ,0,0";       # 2016feb27: blank space

# http://www.nlg-wiki.org/systems/Dushka -- in JavaScript for MSIE
  $t=1324; $ear[$t] = "\N{U+0},0,0"; # 2016feb27: Unicode?
# ДУШКА (1521 "little soul"); name of a Russian AI; 2016may01
  $t=1325; $ear[$t] = "\x84,0,0";    # 2016feb27: "Д"
  $t=1326; $ear[$t] = "\x93,0,0";    # 2016feb27: "У"
  $t=1327; $ear[$t] = "\x98,0,0";    # 2016feb27: "Ш"
  $t=1328; $ear[$t] = "\x8A,0,0";    # 2016feb27: "К"
  $t=1329; $ear[$t] = "\x80,0,1521"; # 2016feb27: "А"
  $psi=1521; $hlc=3; $jux=0; $pos=5; $dba=1; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1325; KbLoad(); # 2018-07-08: flag-panel order
  $t=1330; $ear[$t] = " ,0,0";       # 2016feb27: blank space

  $t=1331; $ear[$t] = "\N{U+0},0,0"; # 2016feb27: Unicode?
# ЕСТЬ -- 2019-06-03: #1801 ("there is"); verb;
  $t=1332; $ear[$t] = "\x85,0,0";    # 2016feb27:  "Е"
  $t=1333; $ear[$t] = "\x91,0,0";    # 2016feb27:  "С"
  $t=1334; $ear[$t] = "\x92,0,0";    # 2016feb27:  "Т"
  $t=1335; $ear[$t] = "\x9C,0,1801"; # 2019-06-03: "Ь"
  $psi=1801; $hlc=3; $jux=0; $pos=8; $dba=0; $num=0; $mfn=0; # 2019-06-03
  $pre=0; $seq=0; $tkb=0; $rv=1332; KbLoad(); # 2018-07-08: flag-panel order
  $t=1336; $ear[$t] = " ,0,0";       # 2016feb27: blank space

  $t=1337; $ear[$t] = "\N{U+0},0,0"; # 2016feb27: Unicode?
# за (1622 behind, beyond, for) preposition; 2016feb27
  $t=1338; $ear[$t] = "\x87,0,0";    # 2016feb27: "З"
  $t=1339; $ear[$t] = "\x80,0,1622"; # 2016feb27: "А"
  $psi=1622; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1338; KbLoad(); # 2018-07-08: flag-panel order
  $t=1340; $ear[$t] = " ,0,0";       # 2016feb27: blank space

  $t=1341; $ear[$t] = "\N{U+0},0,0"; # 2016feb27: Unicode?
# ЗНАТЬ -- 2019-06-03: #1840 "to know"); sample verb;
  $t=1342; $ear[$t] = "\x87,0,0";    # 2016feb27:  "З"
  $t=1343; $ear[$t] = "\x8D,0,0";    # 2016feb27:  "Н"
  $t=1344; $ear[$t] = "\x80,0,1840"; # 2019-06-03: "А"
  $t=1345; $ear[$t] = "\x92,0,1840"; # 2019-06-03: "Т"
  $t=1346; $ear[$t] = "\x9C,0,1840"; # 2019-06-03: "Ь"
  $psi=1840; $hlc=3; $jux=0; $pos=8; $dba=0; $num=0; $mfn=0; # 2019-06-03
  $pre=0; $seq=0; $tkb=0; $rv=1342; KbLoad(); # 2018-07-08: flag-panel order
  $t=1347; $ear[$t] = " ,0,0";       # 2016feb27: blank space

  $t=1348; $ear[$t] = "\N{U+0},0,0"; # 2016feb27: Unicode?
# ЗНАЮ -- 2019-06-03: #1840 ("I know"); sample verb, 1st person sing.
  $t=1349; $ear[$t] = "\x87,0,0";    # 2016feb27:  "З"
  $t=1350; $ear[$t] = "\x8D,0,0";    # 2016feb27:  "Н"
  $t=1351; $ear[$t] = "\x80,0,1840"; # 2019-06-03: "А"
  $t=1352; $ear[$t] = "\x9E,0,1840"; # 2019-06-03: "Ю"
  $psi=1840; $hlc=3; $jux=0; $pos=8; $dba=1; $num=1; $mfn=0; # 2019-06-03
  $pre=0; $seq=0; $tkb=0; $rv=1349; KbLoad(); # 2018-07-08: flag-panel order
  $t=1353; $ear[$t] = " ,0,0";       # 2016feb27: blank space

  $t=1354; $ear[$t] = "\N{U+0},0,0"; # 2016feb27: Unicode?
# И (1350 "and") conjunction; 2016may01
  $t=1355; $ear[$t] = "\x88,0,1350"; # 2016feb27: "И"
  $psi=1350; $hlc=3; $jux=0; $pos=3; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1355; KbLoad(); # 2018-07-08: flag-panel order
  $t=1356; $ear[$t] = " ,0,0";       # 2016feb27: blank space

  $t=1357; $ear[$t] = "\N{U+0},0,0"; # 2016feb27: Unicode?
# из (1624 from) preposition; 2016feb26
  $t=1358; $ear[$t] = "\x88,0,0";    # 2016feb27: "И"
  $t=1359; $ear[$t] = "\x87,0,1624"; # 2016feb27: "З"
  $psi=1624; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1358; KbLoad(); # 2018-07-08: flag-panel order
  $t=1360; $ear[$t] = " ,0,0";       # 2016feb27: blank space

  $t=1361; $ear[$t] = "\N{U+0},0,0"; # 2016feb27: Unicode?
# из-за (1625 from behind, because of) preposition; 2016feb27
  $t=1362; $ear[$t] = "\x88,0,0";    # 2016feb27: "И"
  $t=1363; $ear[$t] = "\x87,0,0";    # 2016feb27: "З"
# $t=1363; $ear[$t] = "-,0,0";       # 2016feb27: "-" [ignore]
  $t=1364; $ear[$t] = "\x87,0,0";    # 2016feb27: "З"
  $t=1365; $ear[$t] = "\x80,0,1625"; # 2016feb27: "А"
  $psi=1625; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1362; KbLoad(); # 2018-07-08: flag-panel order
  $t=1366; $ear[$t] = " ,0,0";       # 2016feb27: blank space

  $t=1367; $ear[$t] = "\N{U+0},0,0"; # 2016feb27: Unicode?
# из-под (1626 from under) preposition; 2016feb28:
  $t=1368; $ear[$t] = "\x88,0,0";    # 2016feb28: "И"
  $t=1369; $ear[$t] = "\x87,0,0";    # 2016feb28: "З"
# $t=1369; $ear[$t] = "-,0,0";       # 2016feb28: "-" [ignore]
  $t=1370; $ear[$t] = "\x8F,0,0";    # 2016feb28: "П"
  $t=1371; $ear[$t] = "\x8E,0,0";    # 2016feb28: "О"
  $t=1372; $ear[$t] = "\x84,0,1626"; # 2016feb28: "Д"
  $psi=1626; $hlc=3; $jux=0; $pos=8; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1368; KbLoad(); # 2018-07-08: flag-panel order
  $t=1373; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1374; $ear[$t] = "\N{U+0},0,0"; # 2016feb27: Unicode?
# ИЛИ (1340 or) conjunction; 2016may01
  $t=1375; $ear[$t] = "\x88,0,0";    # 2016feb27: "И"
  $t=1376; $ear[$t] = "\x8B,0,0";    # 2016feb27: "Л"
  $t=1377; $ear[$t] = "\x88,0,1340"; # 2016feb27: "И"
  $psi=1340; $hlc=3; $jux=0; $pos=3; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1375; KbLoad(); # 2018-07-08: flag-panel order
  $t=1378; $ear[$t] = " ,0,0";       # 2016feb27: blank space

  $t=1379; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# ИНАЧЕ (1266 "else, otherwise"); conjunction; 2016may01
  $t=1380; $ear[$t] = "\x88,0,0";    # 2016feb27: "И"
  $t=1381; $ear[$t] = "\x8D,0,0";    # 2016feb27: "Н"
  $t=1382; $ear[$t] = "\x80,0,0";    # 2016feb27: "А"
  $t=1383; $ear[$t] = "\x97,0,0";    # 2016feb27: "Ч"
  $t=1384; $ear[$t] = "\x85,0,1266"; # 2016feb28: "Е"
  $psi=1266; $hlc=3; $jux=0; $pos=3; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1380; KbLoad(); # 2018-07-08: flag-panel order
  $t=1385; $ear[$t] = " ,0,0";       # 2016feb27: blank space

  $t=1386; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# к (1628 towards) preposition; 2016feb28
  $t=1387; $ear[$t] = "\x8A,0,1628"; # 2016feb28: "К"
  $psi=1628; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1387; KbLoad(); # 2018-07-08: flag-panel order
  $t=1388; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1389; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# ко (1629 towards, up to) preposition; 2016feb28
  $t=1390; $ear[$t] = "\x8A,0,0";    # 2016feb28: "К"
  $t=1391; $ear[$t] = "\x8E,0,1629"; # 2016feb28: "О"
  $psi=1629; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1390; KbLoad(); # 2018-07-08: flag-panel order
  $t=1392; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1393; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# КАК (1209 how) adverb; 2016feb28
  $t=1394; $ear[$t] = "\x8A,0,0";    # 2016feb28: "К"
  $t=1395; $ear[$t] = "\x80,0,0";    # 2016feb28: "А"
  $t=1396; $ear[$t] = "\x8A,0,1209"; # 2016feb28: "К"
  $psi=1209; $hlc=3; $jux=0; $pos=2; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1394; KbLoad(); # 2018-07-08: flag-panel order
  $t=1397; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1398; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# КОТОРЫЙ (1798 who, which, that) relative pronoun; 2016may01
  $t=1399; $ear[$t] = "\x8A,0,0";    # 2016feb28: "К"
  $t=1400; $ear[$t] = "\x8E,0,0";    # 2016feb28: "О"
  $t=1401; $ear[$t] = "\x92,0,0";    # 2016feb28: "т"
  $t=1402; $ear[$t] = "\x8E,0,0";    # 2016feb28: "О"
  $t=1403; $ear[$t] = "\x90,0,0";    # 2016feb28: "Р"
  $t=1404; $ear[$t] = "\x9B,0,0";    # 2016feb28: "Ы"
  $t=1405; $ear[$t] = "\x89,0,1798"; # 2016feb28: "Й"
  $psi=1798; $hlc=3; $jux=0; $pos=7; $dba=1; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1399; KbLoad(); # 2018-07-08: flag-panel order
  $t=1406; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1407; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# кроме (1631 except) preposition; 2016feb28
  $t=1408; $ear[$t] = "\x8A,0,0";    # 2016feb28: "К"
  $t=1409; $ear[$t] = "\x90,0,0";    # 2016feb28: "Р"
  $t=1410; $ear[$t] = "\x8E,0,0";    # 2016feb28: "О"
  $t=1411; $ear[$t] = "\x8C,0,0";    # 2016feb28: "М"
  $t=1412; $ear[$t] = "\x85,0,1631"; # 2016feb28: "Е"
  $psi=1631; $hlc=3; $jux=0; $pos=6; $dba=0;$num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1408; KbLoad(); # 2018-07-08: flag-panel order
  $t=1413; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1414; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# KTO (1791 who) pronoun; 2016feb28
  $t=1415; $ear[$t] = "\x8A,0,0";    # 2016feb28: "К"
  $t=1416; $ear[$t] = "\x92,0,0";    # 2016feb28: "Т"
  $t=1417; $ear[$t] = "\x8E,0,1791"; # 2016feb28: "О"
  $psi=1791; $hlc=3; $jux=0; $pos=7; $dba=1; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1415; KbLoad();  # 2018-07-08: flag-panel order
  $t=1418; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1419; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# КОГО (1791 who) pronoun; 2016may01
  $t=1420; $ear[$t] = "\x8A,0,0";    # 2016feb28: "К"
  $t=1421; $ear[$t] = "\x8E,0,0";    # 2016feb28: "О"
  $t=1422; $ear[$t] = "\x83,0,0";    # 2016feb28: "Г"
  $t=1423; $ear[$t] = "\x8E,0,1791"; # 2016feb28: "О"
  $psi=1791; $hlc=3; $jux=0; $pos=7; $dba=2; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1420; KbLoad(); # 2018-07-08: flag-panel order
  $t=1424; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1425; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# КОМУ (1791 to whom) pronoun; 2016may01
  $t=1426; $ear[$t] = "\x8A,0,0";    # 2016feb28: "К"
  $t=1427; $ear[$t] = "\x8E,0,0";    # 2016feb28: "О"
  $t=1428; $ear[$t] = "\x8C,0,0";    # 2016feb28: "М"
  $t=1429; $ear[$t] = "\x93,0,1791"; # 2016feb28: "У"
  $psi=1791; $hlc=3; $jux=0; $pos=7; $dba=3; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1426; KbLoad(); # 2018-07-08: flag-panel order
  $t=1430; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1431; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# КОГО (1791 whom) pronoun; 2016may01
  $t=1432; $ear[$t] = "\x8A,0,0";    # 2016feb28: "К"
  $t=1433; $ear[$t] = "\x8E,0,0";    # 2016feb28: "О"
  $t=1434; $ear[$t] = "\x83,0,0";    # 2016feb28: "Г"
  $t=1435; $ear[$t] = "\x8E,0,1791"; # 2016feb28: "О"
  $psi=1791; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1432; KbLoad(); # 2018-07-08: flag-panel order
  $t=1436; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1437; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# KEM (1791 whom) instrumental pronoun; 2016feb28
  $t=1438; $ear[$t] = "\x8A,0,0";    # 2016feb28: "К"
  $t=1439; $ear[$t] = "\x85,0,0";    # 2016feb28: "Е"
  $t=1440; $ear[$t] = "\x8C,0,1791"; # 2016feb28: "М"
  $psi=1791; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1438; KbLoad(); # 2018-07-08: flag-panel order
  $t=1441; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1442; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# KOM (1791 who) prepositional pronoun; 2016feb28
  $t=1443; $ear[$t] = "\x8A,0,0";    # 2016feb28: "К"
  $t=1444; $ear[$t] = "\x8E,0,0";    # 2016feb28: "О"
  $t=1445; $ear[$t] = "\x8C,0,1791"; # 2016feb28: "М"
  $psi=1791; $hlc=3; $jux=0; $pos=7; $dba=6; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1443; KbLoad(); # 2018-07-08: flag-panel order
  $t=1446; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1447; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# ЛИ (1320 whether) adverb; 2016may01
  $t=1447; $ear[$t] = "\x8B,0,0";    # 2016feb28: "Л"
  $t=1449; $ear[$t] = "\x88,0,1320"; # 2016feb28: "И"
  $psi=1320; $hlc=3; $jux=0; $pos=3; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1447; KbLoad(); # 2018-07-08: flag-panel order
  $t=1450; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1451; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# ЛЮДИ (1587 people) noun; plural; 2016may01
  $t=1452; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
  $t=1453; $ear[$t] = "\x8B,0,0";    # 2016feb28: "Л"
  $t=1454; $ear[$t] = "\x9E,0,0";    # 2016feb28: "Ю"
  $t=1455; $ear[$t] = "\x84,0,0";    # 2016feb28: "Д"
  $t=1456; $ear[$t] = "\x88,0,1587"; # 2016feb28: "И"
  $psi=1587; $hlc=3; $jux=0; $pos=5; $dba=1; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1452; KbLoad(); # 2018-07-08: flag-panel order
  $t=1457; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1458; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# между (1633 between) preposition; 2016feb28
  $t=1459; $ear[$t] = "\x8C,0,0";    # 2016feb28: "М"
  $t=1460; $ear[$t] = "\x85,0,0";    # 2016feb28: "Е"
  $t=1461; $ear[$t] = "\x86,0,0";    # 2016feb28: "Ж"
  $t=1462; $ear[$t] = "\x84,0,0";    # 2016feb28: "Д"
  $t=1463; $ear[$t] = "\x93,0,1633"; # 2016feb28: "У"
  $psi=1633; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1459; KbLoad(); # 2018-07-08: flag-panel order
  $t=1464; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1465; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# мимо (1635 past) preposition; 2016feb28
  $t=1466; $ear[$t] = "\x8C,0,0";    # 2016feb28: "М"
  $t=1467; $ear[$t] = "\x88,0,0";    # 2016feb28: "И"
  $t=1468; $ear[$t] = "\x8C,0,0";    # 2016feb28: "М"
  $t=1469; $ear[$t] = "\x8E,0,1635"; # 2016feb28: "О"
  $psi=1635; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1466; KbLoad(); # 2018-07-08: flag-panel order
  $t=1470; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1471; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# МЫ (1731 we) pronoun; 2016may01
  $t=1472; $ear[$t] = "\x8C,0,0";    # 2016feb28: "М"
  $t=1473; $ear[$t] = "\x9B,0,1731"; # 2016feb28: "Ы"
  $psi=1731; $hlc=3; $jux=0; $pos=7; $dba=1; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1472; KbLoad(); # 2018-07-08: flag-panel order
  $t=1474; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1475; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# НАС (1731 us) pronoun, genitive plural; 2016may01
  $t=1476; $ear[$t] = "\x8D,0,0";    # 2016feb28: "Н"
  $t=1477; $ear[$t] = "\x80,0,0";    # 2016feb28: "А"
  $t=1478; $ear[$t] = "\x91,0,1731"; # 2016feb28: "С"
  $psi=1731; $hlc=3; $jux=0; $pos=7; $dba=2; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1476; KbLoad(); # 2018-07-08: flag-panel order
  $t=1479; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1480; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# НАМ (1731 to us) pron. dative plural; 2016may01
  $t=1481; $ear[$t] = "\x8D,0,0";    # 2016feb28: "Н"
  $t=1482; $ear[$t] = "\x80,0,0";    # 2016feb28: "А"
  $t=1483; $ear[$t] = "\x8C,0,1731"; # 2016feb28: "М"
  $psi=1731; $hlc=3; $jux=0; $pos=7; $dba=3; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1481; KbLoad(); # 2018-07-08: flag-panel order
  $t=1484; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1485; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# НАС (1731 us) pron. accusative plural; 2016may01
  $t=1486; $ear[$t] = "\x8D,0,0";    # 2016feb28: "Н"
  $t=1487; $ear[$t] = "\x80,0,0";    # 2016feb28: "А"
  $t=1488; $ear[$t] = "\x91,0,1731"; # 2016feb28: "С"
  $psi=1731; $hlc=3; $jux=0; $pos=7; $dba=4; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1486; KbLoad(); # 2018-07-08: flag-panel order
  $t=1489; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1490; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# НАМИ (1731 us) pron; instrumental plural; 2016may01
  $t=1491; $ear[$t] = "\x8D,0,0";    # 2016feb28: "Н"
  $t=1492; $ear[$t] = "\x80,0,0";    # 2016feb28: "А"
  $t=1493; $ear[$t] = "\x8C,0,0";    # 2016feb28: "М"
  $t=1494; $ear[$t] = "\x88,0,1731"; # 2016feb28: "И"
  $psi=1731; $hlc=3; $jux=0; $pos=7; $dba=5; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1491; KbLoad(); # 2018-07-08: flag-panel order
  $t=1495; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1496; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# НАС (1731 us) pron. prepositional plural; 2016may01
  $t=1497; $ear[$t] = "\x8D,0,0";    # 2016feb28: "Н"
  $t=1498; $ear[$t] = "\x80,0,0";    # 2016feb28: "А"
  $t=1499; $ear[$t] = "\x91,0,1731"; # 2016feb28: "С"
  $psi=1731; $hlc=3; $jux=0; $pos=7; $dba=6; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1497; KbLoad(); # 2018-07-08: flag-panel order
  $t=1500; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1501; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# на (1637 onto, to) preposition; 2016feb28
  $t=1502; $ear[$t] = "\x8D,0,0";    # 2016feb28: "Н"
  $t=1503; $ear[$t] = "\x80,0,1637"; # 2016feb28: "А"
  $psi=1637; $hlc=3; $jux=0; $pos=6; $dba=0;$num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1502; KbLoad(); # 2018-07-08: flag-panel order
  $t=1504; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1505; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# над (1639 over) preposition; 2016feb28
  $t=1506; $ear[$t] = "\x8D,0,0";    # 2016feb28: "Н"
  $t=1507; $ear[$t] = "\x80,0,0";    # 2016feb28: "А"
  $t=1508; $ear[$t] = "\x84,0,1639"; # 2016feb28: "Д"
  $psi=1639; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1506; KbLoad(); # 2018-07-08: flag-panel order
  $t=1509; $ear[$t] = " ,0,0";       # 2016feb28: blank space

 $t=1510; $ear[$t] = "\N{U+0},0,0"; # 2016feb28: Unicode?
# НЕ (1250 not) adverb for negation and machine reasoning; 2016may01
  $t=1511; $ear[$t] = "\x8D,0,0";    # 2016feb28: "Н"
  $t=1512; $ear[$t] = "\x85,0,1250"; # 2016feb28: "Е"
  $psi=1250; $hlc=3; $jux=0; $pos=2; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1511; KbLoad(); # 2018-07-08: flag-panel order
  $t=1513; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=1514; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕТ (1427 no) interjection; 2016may01
  $t=1515; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н"
  $t=1516; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1517; $ear[$t] = "\x92,0,1427"; # 2016feb29: "Т"
  $psi=1427; $hlc=3; $jux=0; $pos=4; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1515; KbLoad(); # 2018-07-08: flag-panel order
  $t=1518; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1519; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕТУ (1202 is not) adverb; 2019-08-09
# НЕТУ (1802 is not) more like a verb; 2019-08-09: as in Dushka Russian AI.
  $t=1520; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н"
  $t=1521; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1522; $ear[$t] = "\x92,0,0";    # 2016feb29: "Т"
  $t=1523; $ear[$t] = "\x93,0,1802"; # 2017dec06: "У"
  $psi=1802; $hlc=3; $jux=0; $pos=8; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1520; KbLoad(); # 2018-07-08: flag-panel order
  $t=1524; $ear[$t] = " ,0,0";       # 2019-08-09: blank space

  $t=1525; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НИЧЕГО (1760 "nothing"); pronoun; 2016may01
  $t=1526; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н"
  $t=1527; $ear[$t] = "\x88,0,0";    # 2016feb29: "И"
  $t=1528; $ear[$t] = "\x97,0,0";    # 2016feb29: "Ч"
  $t=1529; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1530; $ear[$t] = "\x83,0,0";    # 2016feb29: "Г"
  $t=1531; $ear[$t] = "\x8E,0,1228"; # 2016feb29: "О"
  $psi=1228; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1526; KbLoad(); # 2018-07-08: flag-panel order
  $t=1532; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1533; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# О (1641 about) preposition; 2016feb29
  $t=1534; $ear[$t] = "\x8E,0,1641";    # 2016feb29: "О"
  $psi=1641; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1534; KbLoad(); # 2018-07-08: flag-panel order
  $t=1535; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1536; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# об (1642 about) preposition; 2016feb29
  $t=1537; $ear[$t] = "\x8E,0,0";    # 2016feb29: "О"
  $t=1538; $ear[$t] = "\x81,0,1642"; # 2016feb29: "Б"
  $psi=1642; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1537; KbLoad(); # 2018-07-08: flag-panel order
  $t=1539; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1540; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# обо (1643 about) (about) 2016feb29:
  $t=1541; $ear[$t] = "\x8E,0,0";    # 2016feb29: "О"
  $t=1542; $ear[$t] = "\x81,0,0";    # 2016feb29: "Б"
  $t=1543; $ear[$t] = "\x8E,0,1643"; # 2016feb29: "О"
  $psi=1643; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1541; KbLoad(); # 2018-07-08: flag-panel order
  $t=1544; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1545; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# около (1645 near, approximately) preposition; 2016feb29
  $t=1546; $ear[$t] = "\x8E,0,0";    # 2016feb29: "О"
  $t=1547; $ear[$t] = "\x8A,0,0";    # 2016feb29: "К"
  $t=1548; $ear[$t] = "\x8E,0,0";    # 2016feb29: "О"
  $t=1549; $ear[$t] = "\x8B,0,0";    # 2016feb29: "Л"
  $t=1550; $ear[$t] = "\x8E,0,1645"; # 2016feb29: "О"
  $psi=1645; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1546; KbLoad(); # 2018-07-08: flag-panel order
  $t=1551; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1552; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ОН (1713 he) pronoun; nom. sing. masc. 2016may01
  $t=1553; $ear[$t] = "\x8E,0,0";    # 2016feb29: "О"
  $t=1554; $ear[$t] = "\x8D,0,1713"; # 2016feb29: "Н"
  $psi=1713; $hlc=3; $jux=0; $pos=7; $dba=1; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1553; KbLoad(); # 2018-07-08: flag-panel order
  $t=1555; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1556; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ЕГО (1713 of him) pronoun; gen. sing. masc. 2016may01
  $t=1557; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1558; $ear[$t] = "\x83,0,0";    # 2016feb29: "Г"
  $t=1559; $ear[$t] = "\x8E,0,1713"; # 2016feb29: "О"
  $psi=1713; $hlc=3; $jux=0; $pos=7; $dba=2; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1557; KbLoad(); # 2018-07-08: flag-panel order
  $t=1560; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1561; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕГО (1713 of him) pronoun; gen. sing. masc. 2016may01
  $t=1562; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1563; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1564; $ear[$t] = "\x83,0,0";    # 2016feb29: "Г"
  $t=1565; $ear[$t] = "\x8E,0,1713"; # 2016feb29: "О"
  $psi=1713; $hlc=3; $jux=0; $pos=7; $dba=0; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1562; KbLoad(); # 2018-07-08: flag-panel order
  $t=1566; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1567; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ЕМУ (1713 to him) pronoun; dat. sing. masc. 2016may01
  $t=1568; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1569; $ear[$t] = "\x8C,0,0";    # 2016feb29: "М"
  $t=1570; $ear[$t] = "\x93,0,1713"; # 2016feb29: "У"
  $psi=1713; $hlc=3; $jux=0; $pos=7; $dba=3; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1568; KbLoad(); # 2018-07-08: flag-panel order
  $t=1571; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1572; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕМУ (1713 to him) pronoun; dat. sing. masc. 2016may01
  $t=1573; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1574; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1575; $ear[$t] = "\x8C,0,0";    # 2016feb29: "М"
  $t=1576; $ear[$t] = "\x93,0,1713"; # 2016feb29: "У"
  $psi=1713; $hlc=3; $jux=0; $pos=7; $dba=3; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1573; KbLoad(); # 2018-07-08: flag-panel order
  $t=1577; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1578; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ЕГО (1713 him) pronoun; acc. sing. masc. 2016feb29
  $t=1579; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1580; $ear[$t] = "\x83,0,0";    # 2016feb29: "Г"
  $t=1581; $ear[$t] = "\x8E,0,1713"; # 2016feb29: "О"
  $psi=1713; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1579; KbLoad(); # 2018-07-08: flag-panel order
  $t=1582; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1583; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕГО (1713 him) pronoun; acc. sing. masc. 2016may01
  $t=1584; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1585; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1586; $ear[$t] = "\x83,0,0";    # 2016feb29: "Г"
  $t=1587; $ear[$t] = "\x8E,0,1713"; # 2016feb29: "О"
  $psi=1713; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0;  $rv=1584; KbLoad(); # 2018-07-08: flag-panel order
  $t=1588; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1589; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ИМ (1713 him) pronoun; instrumental sing. masc. 2016may01
  $t=1590; $ear[$t] = "\x88,0,0";    # 2016feb29: "И"
  $t=1591; $ear[$t] = "\x8C,0,1713"; # 2016feb29: "М"
  $psi=1713; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1590; KbLoad(); # 2018-07-08: flag-panel order
  $t=1592; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1593; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НИМ (1713 him) pronoun; instrumental sing. masc. 2016may01
  $t=1594; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1595; $ear[$t] = "\x88,0,0";    # 2016feb29: "И"
  $t=1596; $ear[$t] = "\x8C,0,1713"; # 2016feb29: "М"
  $psi=1713; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1594; KbLoad(); # 2018-07-08: flag-panel order
  $t=1597; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1598; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЁМ (1713 him) pronoun; prepositional sing. masc. 2016may01
  $t=1599; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1600; $ear[$t] = "\xF0,0,0";    # 2016feb29: "Ё"
  $t=1601; $ear[$t] = "\x8C,0,1713"; # 2016feb29: "М"
  $psi=1713; $hlc=3; $jux=0; $pos=7; $dba=6; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1599; KbLoad(); # 2018-07-08: flag-panel order
  $t=1602; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1603; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕМ (1713 him) pronoun; prepositional sing. masc. 2016may01
  $t=1604; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1605; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е" (without dots)
  $t=1606; $ear[$t] = "\x8C,0,1713"; # 2016feb29: "М"
  $psi=1713; $hlc=3; $jux=0; $pos=7; $dba=6; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1604; KbLoad(); # 2018-07-08: flag-panel order
  $t=1607; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1608; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ОНА (1719 she) pronoun; nom. sing. fem. 2016may01
  $t=1609; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
  $t=1610; $ear[$t] = "\x8E,0,0";    # 2016feb29: "О"
  $t=1611; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н"
  $t=1612; $ear[$t] = "\x80,0,1719"; # 2016feb29: "А"
  $psi=1719; $hlc=3; $jux=0; $pos=7; $dba=1; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1609; KbLoad(); # 2018-07-08: flag-panel order
  $t=1613; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1614; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ЕЁ (1719 of her) pronoun; gen. sing. fem. 2016may01
  $t=1615; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1616; $ear[$t] = "\xF0,0,1719"; # 2016feb29: "Ё"
  $psi=1719; $hlc=3; $jux=0; $pos=7; $dba=2; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1615; KbLoad(); # 2018-07-08: flag-panel order
  $t=1617; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1618; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕЁ (1719 of her) pronoun; gen. sing. fem. 2016may01
  $t=1619; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1620; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1621; $ear[$t] = "\xF0,0,1719"; # 2018jul08: "Ё" (with dots)
  $psi=1719; $hlc=3; $jux=0; $pos=7; $dba=2; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1619; KbLoad(); # 2018-07-08: flag-panel order
  $t=1622; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1623; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕЁ (1719 of her) pronoun; gen. sing. fem. 2016may01
  $t=1624; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1625; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1626; $ear[$t] = "\x85,0,1719"; # 2016feb29: "Е" (no dots)
  $psi=1719; $hlc=3; $jux=0; $pos=7; $dba=2; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1624; KbLoad(); # 2018-07-08: flag-panel order
  $t=1627; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1628; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ЕЙ (1719 to her) pronoun; dat. sing. fem. 2016may01
  $t=1629; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1630; $ear[$t] = "\x89,0,1719"; # 2016feb29: "Й"
  $psi=1719; $hlc=3; $jux=0; $pos=7; $dba=3; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1629; KbLoad(); # 2018-07-08: flag-panel order
  $t=1631; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1632; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕЙ (1719 to her) pronoun; dat. sing. fem. 2016may01
  $t=1633; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1634; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1635; $ear[$t] = "\x89,0,1719"; # 2016feb29: "Й"
  $psi=1719; $hlc=3; $jux=0; $pos=7; $dba=3; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1633; KbLoad(); # 2018-07-08: flag-panel order
  $t=1636; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1637; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ЕЁ (1719 her) pronoun; acc. sing. fem. 2016may01
  $t=1638; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1639; $ear[$t] = "\xF0,0,1719"; # 2016feb29: "Ё"
  $psi=1719; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1638; KbLoad(); # 2018-07-08: flag-panel order
  $t=1640; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1641; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕЁ (1719 her) pronoun; acc. sing. fem. 2016may01
  $t=1642; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1643; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1644; $ear[$t] = "\xF0,0,1719"; # 2018jul08: "Ё" (with dots)
  $psi=1719; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1642; KbLoad(); # 2018-07-08: flag-panel order
  $t=1645; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1646; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕЕ (1719 her) pronoun; acc. sing. fem. 2016may01
  $t=1647; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1648; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1649; $ear[$t] = "\x85,0,1719"; # 2016feb29: "Е" (no dots)
  $psi=1719; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1647; KbLoad(); # 2018-07-08: flag-panel order
  $t=1650; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1651; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ЕЙ (1719 her) pronoun; instrumental. sing. fem. 2016may01
  $t=1652; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1653; $ear[$t] = "\x89,0,1719"; # 2016feb29: "Й"
  $psi=1719; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1652; KbLoad(); # 2018-07-08: flag-panel order
  $t=1654; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1655; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕЙ (1719 her) pronoun; instrumental. sing. fem. 2016may01
  $t=1656; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1657; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1658; $ear[$t] = "\x89,0,1719"; # 2016feb29: "Й"
  $psi=1719; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1656; KbLoad(); # 2018-07-08: flag-panel order
  $t=1659; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1660; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ЕЮ (1719 her) pronoun; instrumental. sing. fem. 2016may01
  $t=1661; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1662; $ear[$t] = "\x9E,0,1719"; # 2016feb29: "Ю" (variant)
  $psi=1719; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1661; KbLoad(); # 2018-07-08: flag-panel order
  $t=1663; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1664; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ЕЮ (1719 her) pronoun; instrumental. sing. fem. 2016may01
  $t=1665; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1666; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1667; $ear[$t] = "\x9E,0,1719"; # 2016feb29: "Ю" (variant)
  $psi=1719; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1665; KbLoad(); # 2018-07-08: flag-panel order
  $t=1668; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1669; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕЙ (1719 her) pronoun; prepositional sing. fem. 2016may01
  $t=1670; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1671; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1672; $ear[$t] = "\x89,0,1719"; # 2016feb29: "Й"
  $psi=1719; $hlc=3; $jux=0; $pos=7; $dba=6; $num=1; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1670; KbLoad(); # 2018-07-08: flag-panel order
  $t=1673; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1674; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ОНО (1725 it) pronoun; nom. sing. neuter; 2016may01
  $t=1675; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
  $t=1676; $ear[$t] = "\x8E,0,0";    # 2016feb29: "О"
  $t=1677; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н"
  $t=1678; $ear[$t] = "\x8E,0,1725"; # 2016feb29: "О"
  $psi=1725; $hlc=3; $jux=0; $pos=7; $dba=1; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1675; KbLoad(); # 2018-07-08: flag-panel order
  $t=1679; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1680; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ЕГО (1725 of it) pronoun; gen. sing. neuter; 2019-08-09
  $t=1681; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1682; $ear[$t] = "\x83,0,0";    # 2016feb29: "Г"
  $t=1683; $ear[$t] = "\x8E,0,1725"; # 2019aug09: "О"
  $psi=1725; $hlc=3; $jux=0; $pos=7; $dba=2; $num=1; $mfn=3; # 2019-08-09
  $pre=0; $seq=0; $tkb=0; $rv=1681; KbLoad(); # 2018-07-08: flag-panel order
  $t=1684; $ear[$t] = " ,0,0";       # 2019-08-0: blank space

  $t=1685; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕГО (1725 of it) pronoun; gen. sing. neuter; 2016may01
  $t=1686; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1687; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1688; $ear[$t] = "\x83,0,0";    # 2016feb29: "Г"
  $t=1689; $ear[$t] = "\x8E,0,1725"; # 2016feb29: "О"
  $psi=1725; $hlc=3; $jux=0; $pos=7; $dba=2; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1686; KbLoad(); # 2018-07-08: flag-panel order
  $t=1690; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1691; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ЕМУ (1725 to it) pronoun; dat. sing. neuter; 2016may01
  $t=1692; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1693; $ear[$t] = "\x8C,0,0";    # 2016feb29: "М"
  $t=1694; $ear[$t] = "\x93,0,1725"; # 2019aug09: "У"
  $psi=1725; $hlc=3; $jux=0; $pos=7; $dba=3; $num=1; $mfn=3; # 2019-08-09
  $pre=0; $seq=0; $tkb=0; $rv=1692; KbLoad(); # 2018-07-08: flag-panel order
  $t=1695; $ear[$t] = " ,0,0";       # 2019-08-09: blank space

  $t=1696; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕМУ (1725 to it) pronoun; dat. sing. neuter; 2016may01
  $t=1697; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1698; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1699; $ear[$t] = "\x8C,0,0";    # 2016feb29: "М"
  $t=1700; $ear[$t] = "\x93,0,1725"; # 2016feb29: "У"
  $psi=1725; $hlc=3; $jux=0; $pos=7; $dba=3; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1697; KbLoad(); # 2018-07-08: flag-panel order
  $t=1701; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1702; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ЕГО (1725 it) pronoun; acc. sing. neuter; 2016may01
  $t=1703; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1704; $ear[$t] = "\x83,0,0";    # 2016feb29: "Г"
  $t=1705; $ear[$t] = "\x8E,0,1725"; # 2016feb29: "О"
  $psi=1725; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1703; KbLoad(); # 2018-07-08: flag-panel order
  $t=1706; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1707; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЕГО (1725 it) pronoun; acc. sing. neuter; 2016may01
  $t=1708; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1709; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е"
  $t=1710; $ear[$t] = "\x83,0,0";    # 2016feb29: "Г"
  $t=1711; $ear[$t] = "\x8E,0,1725"; # 2016feb29: "О"
  $psi=1725; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1708; KbLoad(); # 2018-07-08: flag-panel order
  $t=1712; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1713; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ИМ (1725 it) pronoun; instrumental sing. neuter; 2016may01
  $t=1714; $ear[$t] = "\x88,0,0";    # 2016feb29: "И"
  $t=1715; $ear[$t] = "\x8C,0,1725"; # 2016feb29: "М"
  $psi=1725; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1714; KbLoad(); # 2018-07-08: flag-panel order
  $t=1716; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1717; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НИМ (1725 it) pronoun; instrumental sing. neuter; 2019-08-09
  $t=1718; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1719; $ear[$t] = "\x88,0,0";    # 2016feb29: "И"
  $t=1720; $ear[$t] = "\x8C,0,1725"; # 2019aug09: "М"
  $psi=1725; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=3; # 2019-08-09
  $pre=0; $seq=0; $tkb=0; $rv=1718; KbLoad(); # 2018-07-08: flag-panel order
  $t=1721; $ear[$t] = " ,0,0";       # 2019-08-09: blank space

  $t=1722; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЁМ (1725 it) pronoun; prepositional sing. neuter; 2016may01
  $t=1723; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1724; $ear[$t] = "\xF0,0,0";    # 2016feb29: "Ё"
  $t=1725; $ear[$t] = "\x8C,0,1725"; # 2016feb29: "М"
  $psi=1725; $hlc=3; $jux=0; $pos=7; $dba=6; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1723; KbLoad(); # 2018-07-08: flag-panel order
  $t=1726; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1727; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НЁМ (1725 it) pronoun; prepositional sing. masc. 2016may01
  $t=1728; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1729; $ear[$t] = "\x85,0,0";    # 2016feb29: "Е" (without dots)
  $t=1730; $ear[$t] = "\x8C,0,1725"; # 2016feb29: "М"
  $psi=1713; $hlc=3; $jux=0; $pos=7; $dba=6; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1728; KbLoad(); # 2018-07-08: flag-panel order
  $t=1731; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1732; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ОНИ (1743 they) pronoun; nom. plural; 2016may01
  $t=1733; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
  $t=1734; $ear[$t] = "\x8E,0,0";    # 2016feb29: "О"
  $t=1735; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н"
  $t=1736; $ear[$t] = "\x88,0,1743"; # 2016feb29: "И"
  $psi=1743; $hlc=3; $jux=0; $pos=7; $dba=1; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1733; KbLoad(); # 2018-07-08: flag-panel order
  $t=1737; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1738; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ИХ (1743 of them) pronoun; gen. plural; 2016may01
  $t=1739; $ear[$t] = "\x88,0,0";    # 2016feb29: "И"
  $t=1740; $ear[$t] = "\x95,0,1743"; # 2016feb29: "Х"
  $psi=1743; $hlc=3; $jux=0; $pos=7; $dba=2; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1739; KbLoad(); # 2018-07-08: flag-panel order
  $t=1741; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1742; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НИХ (1743 of them) pronoun; gen. plural; 2016may01
  $t=1743; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1744; $ear[$t] = "\x88,0,0";    # 2016feb29: "И"
  $t=1745; $ear[$t] = "\x95,0,1743"; # 2016feb29: "Х"
  $psi=1743; $hlc=3; $jux=0; $pos=7; $dba=2; $num=2; $mfn=0; # 2018-07-08
 $pre=0; $seq=0; $tkb=0; $rv=1743; KbLoad(); # 2018-07-08: flag-panel order
  $t=1746; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1747; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ИМ (1743 to them) pronoun; dative plural; 2016may01
  $t=1748; $ear[$t] = "\x88,0,0";    # 2016feb29: "И"
  $t=1749; $ear[$t] = "\x8C,0,1725"; # 2016feb29: "М"
  $psi=1725; $hlc=3; $jux=0; $pos=7; $dba=3; $num=0; $mfn=2; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1748; KbLoad(); # 2018-07-08: flag-panel order
  $t=1750; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1751; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НИМ (1743 to them) pronoun; instrumental plural; 2016may01
  $t=1752; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1753; $ear[$t] = "\x88,0,0";    # 2016feb29: "И"
  $t=1754; $ear[$t] = "\x8C,0,1743"; # 2016feb29: "М"
  $psi=1743; $hlc=3; $jux=0; $pos=7; $dba=3; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1752; KbLoad(); # 2018-07-08: flag-panel order
  $t=1755; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1756; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ИХ (1743 them) pronoun; acc. plural; 2016may01
  $t=1757; $ear[$t] = "\x88,0,0";    # 2016feb29: "И"
  $t=1758; $ear[$t] = "\x95,0,1743"; # 2016feb29: "Х"
  $psi=1743; $hlc=3; $jux=0; $pos=7; $dba=4; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1757; KbLoad(); # 2018-07-08: flag-panel order
  $t=1759; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1760; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НИХ (1743 them) pronoun; acc. plural; 2016may01
  $t=1761; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1762; $ear[$t] = "\x88,0,0";    # 2016feb29: "И"
  $t=1763; $ear[$t] = "\x95,0,1743"; # 2016feb29: "Х"
  $psi=1743; $hlc=3; $jux=0; $pos=7; $dba=4; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1761; KbLoad(); # 2018-07-08: flag-panel order
  $t=1764; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1765; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# ИМИ (1743 them) pronoun; instrumental plural; 2016may01
  $t=1766; $ear[$t] = "\x88,0,0";    # 2016feb29: "И"
  $t=1767; $ear[$t] = "\x8C,0,0";    # 2016feb29: "М"
  $t=1768; $ear[$t] = "\x88,0,1743"; # 2016feb29: "И"
  $psi=1743; $hlc=3; $jux=0; $pos=7; $dba=5; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1766; KbLoad(); # 2018-07-08: flag-panel order
  $t=1769; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1770; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НИМИ (1743 them) pronoun; instrumental plural; 2016may01
  $t=1771; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1772; $ear[$t] = "\x88,0,0";    # 2016feb29: "И"
  $t=1773; $ear[$t] = "\x8C,0,0";    # 2016feb29: "М"
  $t=1774; $ear[$t] = "\x88,0,1743"; # 2016feb29: "И"
  $psi=1743; $hlc=3; $jux=0; $pos=7; $dba=5; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1771; KbLoad(); # 2018-07-08: flag-panel order
  $t=1775; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1776; $ear[$t] = "\N{U+0},0,0"; # 2016feb29: Unicode?
# НИХ (1743 them) pronoun; prepositional plural; 2016may01
  $t=1777; $ear[$t] = "\x8D,0,0";    # 2016feb29: "Н" (after prep.)
  $t=1778; $ear[$t] = "\x88,0,0";    # 2016feb29: "И"
  $t=1779; $ear[$t] = "\x95,0,1743"; # 2016feb29: "Х"
  $psi=1743; $hlc=3; $jux=0; $pos=7; $dba=6; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1777; KbLoad(); # 2018-07-08: flag-panel order
  $t=1780; $ear[$t] = " ,0,0";       # 2016feb29: blank space

  $t=1781; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# от (1647 from) preposition; 2016mar01
  $t=1782; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1783; $ear[$t] = "\x92,0,1647"; # 2016mar01: "Т"
  $psi=1647; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1782; KbLoad(); # 2018-07-08: flag-panel order
  $t=1784; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1785; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# ото (1648 from, away from) preposition; 2016mar01
  $t=1786; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1787; $ear[$t] = "\x92,0,0";    # 2016mar01: "Т"
  $t=1788; $ear[$t] = "\x8E,0,1648"; # 2016mar01: "О"
  $psi=1648; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1786; KbLoad(); # 2018-07-08: flag-panel order
  $t=1789; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1790; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# относительно (1650 concerning) preposition; 2016mar01
  $t=1791; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1792; $ear[$t] = "\x92,0,0";    # 2016mar01: "Т"
  $t=1793; $ear[$t] = "\x8D,0,0";    # 2016mar01: "Н"
  $t=1794; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1795; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=1796; $ear[$t] = "\x88,0,0";    # 2016mar01: "И"
  $t=1797; $ear[$t] = "\x92,0,0";    # 2016mar01: "Т"
  $t=1798; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=1799; $ear[$t] = "\x8B,0,0";    # 2016mar01: "Л"
  $t=1800; $ear[$t] = "\x9C,0,0";    # 2016mar01: "Ь"
  $t=1801; $ear[$t] = "\x8D,0,0";    # 2016mar01: "Н"
  $t=1802; $ear[$t] = "\x8E,0,1650"; # 2016mar17: "О"
  $psi=1650; $hlc=3; $jux=0; $pos=6; $dba=0;$num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1791; KbLoad(); # 2018-07-08: flag-panel order
  $t=1803; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1804; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# перед (1652 in front of, before) preposition; 2016mar01
  $t=1805; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1806; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=1807; $ear[$t] = "\x90,0,0";    # 2016mar01: "Р"
  $t=1808; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=1809; $ear[$t] = "\x84,0,1652"; # 2016mar01: "Д"
  $psi=1652; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1805; KbLoad(); # 2018-07-08: flag-panel order
  $t=1810; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1811; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# по (1654 along, according to) preposition; 2016mar01
  $t=1812; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1813; $ear[$t] = "\x8E,0,1654"; # 2016mar01: "О"
  $psi=1654; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1812; KbLoad(); # 2018-07-08: flag-panel order
  $t=1814; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1815; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# под (1656 under) preposition; 2016mar01
  $t=1816; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1817; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1818; $ear[$t] = "\x84,0,1656"; # 2016mar01: "Д"
  $psi=1656; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1816; KbLoad(); # 2018-07-08: flag-panel order
  $t=1819; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1820; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# подле (1657 alongside of) preposition; 2016mar01
  $t=1821; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1822; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1823; $ear[$t] = "\x84,0,0";    # 2016mar01: "Д"
  $t=1824; $ear[$t] = "\x8B,0,0";    # 2016mar01: "Л"
  $t=1825; $ear[$t] = "\x85,0,1657"; # 2016mar01: "Е"
  $psi=1657; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1821; KbLoad(); # 2018-07-08: flag-panel order
  $t=1826; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1827; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# подобно (1659 like, similar to) preposition; 2016mar01
  $t=1828; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1829; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1830; $ear[$t] = "\x84,0,0";    # 2016mar01: "Д"
  $t=1831; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1832; $ear[$t] = "\x81,0,0";    # 2016mar01: "Б"
  $t=1833; $ear[$t] = "\x8D,0,0";    # 2016mar01: "Н"
  $t=1834; $ear[$t] = "\x8E,0,1659"; # 2016mar01: "О"
  $psi=1659; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1828; KbLoad(); # 2018-07-08: flag-panel order
  $t=1835; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1836; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# позади (1661 behind) preposition; 2016mar01
  $t=1837; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1838; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1839; $ear[$t] = "\x87,0,0";    # 2016mar01: "З"
  $t=1840; $ear[$t] = "\x80,0,0";    # 2016mar01: "А"
  $t=1841; $ear[$t] = "\x84,0,0";    # 2016mar01: "Д"
  $t=1842; $ear[$t] = "\x88,0,1661"; # 2016mar01: "И"
  $psi=1661; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1837; KbLoad(); # 2018-07-08: flag-panel order
  $t=1843; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1844; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# помимо (1663 besides, apart from) preposition; 2016mar01
  $t=1845; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1846; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1847; $ear[$t] = "\x8C,0,0";    # 2016mar01: "М"
  $t=1848; $ear[$t] = "\x88,0,0";    # 2016mar01: "И"
  $t=1849; $ear[$t] = "\x8C,0,0";    # 2016mar01: "М"
  $t=1850; $ear[$t] = "\x8E,0,1661"; # 2016mar01: "О"
  $psi=1661; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1845; KbLoad(); # 2018-07-08: flag-panel order
  $t=1851; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1852; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# ПОНИМАТЬ 2019-06-03: #1866 ("understand")
  $t=1853; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1854; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1855; $ear[$t] = "\x8D,0,0";    # 2016mar01: "Н"
  $t=1856; $ear[$t] = "\x88,0,0";    # 2016mar01: "И"
  $t=1857; $ear[$t] = "\x8C,0,0";    # 2016mar01: "М"
  $t=1858; $ear[$t] = "\x80,0,1866"; # 2016mar04: "А" stem $prc
  $t=1859; $ear[$t] = "\x92,0,1866"; # 2016mar04: "Т" stem $prc
  $t=1860; $ear[$t] = "\x9C,0,1866"; # 2016mar01: "Ь"
  $psi=1866; $hlc=3; $mtx=892; $jux=0; $pos=8; $dba=0; $num=0; $mfn=0; # 2019-06-03
  $pre=0; $seq=0; $tkb=0; $rv=1853; KbLoad(); # 2018-07-08: flag-panel order
  $t=1861; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1862; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# после (1665 after) preposition; 2016mar01
  $t=1863; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1864; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1865; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=1866; $ear[$t] = "\x8B,0,0";    # 2016mar01: "Л"
  $t=1867; $ear[$t] = "\x85,0,1665"; # 2016mar01: "Е"
  $psi=1665; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1863; KbLoad(); # 2018-07-08: flag-panel order
  $t=1868; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1869; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# посреди (1667 in the middle of) preposition; 2016mar01
  $t=1870; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1871; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1872; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=1873; $ear[$t] = "\x90,0,0";    # 2016mar01: "Р"
  $t=1874; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=1875; $ear[$t] = "\x84,0,0";    # 2016mar01: "Д"
  $t=1876; $ear[$t] = "\x88,0,1667"; # 2016mar01: "И"
  $psi=1667; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1870; KbLoad(); # 2018-07-08: flag-panel order
  $t=1877; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1878; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# посредством (1669 by means of) preposition; 2016mar01
  $t=1879; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1880; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1881; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=1882; $ear[$t] = "\x90,0,0";    # 2016mar01: "Р"
  $t=1883; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=1884; $ear[$t] = "\x84,0,0";    # 2016mar01: "Д"
  $t=1885; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=1886; $ear[$t] = "\x92,0,0";    # 2016mar01: "Т"
  $t=1887; $ear[$t] = "\x82,0,0";    # 2016mar01: "В"
  $t=1888; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1889; $ear[$t] = "\x8C,0,1669"; # 2016mar01: "М"
  $psi=1669; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1879; KbLoad(); # 2018-07-08: flag-panel order
  $t=1890; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1891; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# почему -- 2019-06-07: #1370 ("why"); conjunction
  $t=1892; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1893; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1894; $ear[$t] = "\x97,0,0";    # 2016mar01: "Ч"
  $t=1895; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=1896; $ear[$t] = "\x8C,0,0";    # 2016mar01: "М"
  $t=1897; $ear[$t] = "\x93,0,1370"; # 2016mar01: "У"
  $psi=1370; $hlc=3; $jux=0; $pos=3; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1892; KbLoad(); # 2018-07-08: flag-panel order
  $t=1898; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1899; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# прежде (1671 before) preposition; 2016mar01
  $t=1900; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1901; $ear[$t] = "\x90,0,0";    # 2016mar01: "Р"
  $t=1902; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=1903; $ear[$t] = "\x86,0,0";    # 2016mar01: "Ж"
  $t=1904; $ear[$t] = "\x84,0,0";    # 2016mar01: "Д"
  $t=1905; $ear[$t] = "\x85,0,1671"; # 2016mar01: "Е"
  $psi=1671; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1900; KbLoad(); # 2018-07-08: flag-panel order
  $t=1906; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1907; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# при (1673 at the time of) preposition; 2016mar01
  $t=1908; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1909; $ear[$t] = "\x90,0,0";    # 2016mar01: "Р"
  $t=1910; $ear[$t] = "\x88,0,1673"; # 2016mar01: "И"
  $psi=1673; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1908; KbLoad(); # 2018-07-08: flag-panel order
  $t=1911; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1912; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# про (1675 about) preposition; 2016mar01
  $t=1913; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
  $t=1914; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1915; $ear[$t] = "\x90,0,0";    # 2016mar01: "Р"
  $t=1916; $ear[$t] = "\x8E,0,1675"; # 2016mar01: "О"
  $psi=1675; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1913; KbLoad(); # 2018-07-08: flag-panel order
  $t=1917; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1918; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# против (1677 against) preposition; 2016mar01
  $t=1919; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1920; $ear[$t] = "\x90,0,0";    # 2016mar01: "Р"
  $t=1921; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1922; $ear[$t] = "\x92,0,0";    # 2016mar01: "Т"
  $t=1923; $ear[$t] = "\x88,0,0";    # 2016mar01: "И"
  $t=1924; $ear[$t] = "\x82,0,1677"; # 2016mar01: "В"
  $psi=1677; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1919; KbLoad(); # 2018-07-08: flag-panel order
  $t=1925; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1926; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# путём (1679 by means of) preposition; 2016mar01
  $t=1927; $ear[$t] = "\x8F,0,0";    # 2016mar01: "П"
  $t=1928; $ear[$t] = "\x93,0,0";    # 2016mar01: "У"
  $t=1929; $ear[$t] = "\x92,0,0";    # 2016mar01: "Т"
  $t=1930; $ear[$t] = "\xF0,0,0";    # 2016mar01: "Ё"
  $t=1931; $ear[$t] = "\x8C,0,1679"; # 2016mar01: "М"
  $psi=1679; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1927; KbLoad(); # 2018-07-08: flag-panel order
  $t=1932; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1933; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# ради (1681 for the sake of) preposition; 2016mar01
  $t=1934; $ear[$t] = "\x90,0,0";    # 2016mar01: "Р"
  $t=1935; $ear[$t] = "\x80,0,0";    # 2016mar01: "А"
  $t=1936; $ear[$t] = "\x84,0,0";    # 2016mar01: "Д"
  $t=1937; $ear[$t] = "\x88,0,1681"; # 2016mar01: "И"
  $psi=1681; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1934; KbLoad(); # 2018-07-08: flag-panel order
  $t=1938; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1939; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# РОБОТ (1571 "robot"); noun; nominative; 2016may01
  $t=1940; $ear[$t] = "\x90,0,0";    # 2016mar01: "Р"
  $t=1941; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1942; $ear[$t] = "\x81,0,0";    # 2016mar01: "Б"
  $t=1943; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=1944; $ear[$t] = "\x92,0,1571"; # 2016mar01: "Т"
  $psi=1571; $hlc=3; $jux=0; $pos=5; $dba=1; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1940; KbLoad(); # 2018-07-08: flag-panel order
  $t=1945; $ear[$t] = " ,0,0";       # 2016feb27: blank space

  $t=1946; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# с (1683 with, from, since) preposition; 2016mar01
  $t=1947; $ear[$t] = "\x91,0,1683"; # 2016mar01: "С"
  $psi=1683; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1947; KbLoad(); # 2018-07-08: flag-panel order
  $t=1948; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1949; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# со (1684 with, from, since) preposition; 2016mar01
  $t=1950; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=1951; $ear[$t] = "\x8E,0,1684"; # 2016mar01: "О"
  $psi=1684; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1950; KbLoad(); # 2018-07-08: flag-panel order
  $t=1952; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1953; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# сверх (1686 on top of, over and above) preposition; 2016mar01
  $t=1954; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=1955; $ear[$t] = "\x82,0,0";    # 2016mar01: "В"
  $t=1956; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=1957; $ear[$t] = "\x90,0,0";    # 2016mar01: "Р"
  $t=1958; $ear[$t] = "\x95,0,1686"; # 2016mar01: "Х"
  $psi=1686; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1954; KbLoad();
  $t=1959; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1960; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# свыше (1688 over, more than) preposition; 2016mar01
  $t=1961; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=1962; $ear[$t] = "\x82,0,0";    # 2016mar01: "В"
  $t=1963; $ear[$t] = "\x9B,0,0";    # 2016mar01: "Ы"
  $t=1964; $ear[$t] = "\x98,0,0";    # 2016mar01: "Ш"
  $t=1965; $ear[$t] = "\x85,0,1688"; # 2016mar01: "Е"
  $psi=1688; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1961; KbLoad(); # 2018-07-08: flag-panel order
  $t=1966; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1967; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# себя  (1777 self) genetive singular reflexive pronoun; 2016mar02
  $t=1968; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=1969; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=1970; $ear[$t] = "\x81,0,0";    # 2016mar01: "Б"
  $t=1971; $ear[$t] = "\x9F,0,1777"; # 2016mar02: "Я"
  $psi=1777; $hlc=3; $jux=0; $pos=7; $dba=2; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1968; KbLoad(); # 2018-07-08: flag-panel order
  $t=1972; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1973; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# себя  (1777 self) genetive plural reflexive pronoun; 2016mar01
  $t=1974; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=1975; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=1976; $ear[$t] = "\x81,0,0";    # 2016mar01: "Б"
  $t=1977; $ear[$t] = "\x9F,0,1777"; # 2016mar02: "Я"
  $psi=1777; $hlc=3; $jux=0; $pos=7; $dba=2; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1974; KbLoad(); # 2018-07-08: flag-panel order
  $t=1978; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1979; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# себе  (1777 self) dative singular reflexive pronoun; 2016mar01
  $t=1980; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=1981; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=1982; $ear[$t] = "\x81,0,0";    # 2016mar01: "Б"
  $t=1983; $ear[$t] = "\x85,0,1777"; # 2016mar02: "Е"
  $psi=1777; $hlc=3; $jux=0; $pos=7; $dba=3; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1980; KbLoad(); # 2018-07-08: flag-panel order
  $t=1984; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1985; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# себе  (1777 self) dative plural reflexive pronoun; 2016mar01
  $t=1986; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=1987; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=1988; $ear[$t] = "\x81,0,0";    # 2016mar01: "Б"
  $t=1989; $ear[$t] = "\x85,0,1777"; # 2016mar02: "Е"
  $psi=1777; $hlc=3; $jux=0; $pos=7; $dba=3; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1986; KbLoad(); # 2018-07-08: flag-panel order
  $t=1990; $ear[$t] = " ,0,0";       # 2016fmar01: blank space

  $t=1991; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# себя  (1777 self) accusative singular reflexive pronoun; 2016mar01
  $t=1992; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=1993; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=1994; $ear[$t] = "\x81,0,0";    # 2016mar01: "Б"
  $t=1995; $ear[$t] = "\x9F,0,1777"; # 2016mar02: "Я"
  $psi=1777; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1992; KbLoad(); # 2018-07-08: flag-panel order
  $t=1996; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=1997; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# себя  (1777 self) accusative plural reflexive pronoun; 2016mar01
  $t=1998; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=1999; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=2000; $ear[$t] = "\x81,0,0";    # 2016mar01: "Б"
  $t=2001; $ear[$t] = "\x9F,0,1777"; # 2016mar02: "Я"
  $psi=1777; $hlc=3; $jux=0; $pos=7; $dba=4; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=1998; KbLoad(); # 2018-07-08: flag-panel order
  $t=2002; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=2003; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# собой  (1777 self) instrumental singular reflexive pronoun; 2016mar01
  $t=2004; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=2005; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=2006; $ear[$t] = "\x81,0,0";    # 2016mar01: "Б"
  $t=2007; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=2008; $ear[$t] = "\x89,0,1777"; # 2016mar02: "Й"
  $psi=1777; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2004; KbLoad(); # 2018-07-08: flag-panel order
  $t=2009; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=2010; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# собой  (1777 self) instrumental plural reflexive pronoun; 2016mar01
  $t=2011; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=2012; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=2013; $ear[$t] = "\x81,0,0";    # 2016mar01: "Б"
  $t=2014; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=2015; $ear[$t] = "\x89,0,1777"; # 2016mar02: "Й"
  $psi=1777; $hlc=3; $jux=0; $pos=7; $dba=5; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2011; KbLoad(); # 2018-07-08: flag-panel order
  $t=2016; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=2017; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# собою  (1777 self) instrumental singular reflexive pronoun; 2016mar01
  $t=2018; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=2019; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=2020; $ear[$t] = "\x81,0,0";    # 2016mar01: "Б"
  $t=2021; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=2022; $ear[$t] = "\x9E,0,1777"; # 2016mar01: "Ю" alternative
  $psi=1777; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2018; KbLoad(); # 2018-07-08: flag-panel order
  $t=2023; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=2024; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# собою  (1777 self) instrumental plural reflexive pronoun; 2016mar01
  $t=2025; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=2026; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=2027; $ear[$t] = "\x81,0,0";    # 2016mar01: "Б"
  $t=2027; $ear[$t] = "\x8E,0,0";    # 2016mar01: "О"
  $t=2029; $ear[$t] = "\x9E,0,1777"; # 2016mar01: "Ю" alternative
  $psi=1777; $hlc=3; $jux=0; $pos=7; $dba=5; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2025; KbLoad(); # 2018-07-08: flag-panel order
  $t=2030; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=2031; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# себе  (1777 self) prepositional singular reflexive pronoun; 2016mar01
  $t=2032; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=2033; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=2034; $ear[$t] = "\x81,0,0";    # 2016mar01: "Б"
  $t=2035; $ear[$t] = "\x85,0,1777"; # 2016mar02: "Е"
  $psi=1777; $hlc=3; $jux=0; $pos=7; $dba=6; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2032; KbLoad(); # 2018-07-08: flag-panel order
  $t=2036; $ear[$t] = " ,0,0";       # 2016mar01: blank space

  $t=2037; $ear[$t] = "\N{U+0},0,0"; # 2016mar01: Unicode?
# себе  (1777 self) prepositional plural reflexive pronoun; 2016mar01
  $t=2038; $ear[$t] = "\x91,0,0";    # 2016mar01: "С"
  $t=2039; $ear[$t] = "\x85,0,0";    # 2016mar01: "Е"
  $t=2040; $ear[$t] = "\x81,0,0";    # 2016mar01: "Б"
  $t=2041; $ear[$t] = "\x85,0,1777"; # 2016mar02: "Е"
  $psi=1777; $hlc=3; $jux=0; $pos=7; $dba=6; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2038; KbLoad(); # 2018-07-08: flag-panel order
  $t=2042; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=2043; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# сквозь (1690 through) preposition; 2016mar02
  $t=2044; $ear[$t] = "\x91,0,0";    # 2016mar02: "С"
  $t=2045; $ear[$t] = "\x8A,0,0";    # 2016mar02: "К"
  $t=2046; $ear[$t] = "\x82,0,0";    # 2016mar02: "В"
  $t=2047; $ear[$t] = "\x8E,0,0";    # 2016mar02: "О"
  $t=2048; $ear[$t] = "\x87,0,0";    # 2016mar02: "З"
  $t=2049; $ear[$t] = "\x9C,0,1690"; # 2016mar02: "Ь"
  $psi=1690; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2044; KbLoad(); # 2018-07-08: flag-panel order
  $t=2050; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2051; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# сколько (1780  how much)  -- pronoun; 2016mar02
  $t=2052; $ear[$t] = "\x91,0,0";    # 2016mar02: "С"
  $t=2053; $ear[$t] = "\x8A,0,0";    # 2016mar02: "К"
  $t=2054; $ear[$t] = "\x8E,0,0";    # 2016mar02: "О"
  $t=2055; $ear[$t] = "\x8B,0,0";    # 2016mar02: "Л"
  $t=2056; $ear[$t] = "\x9C,0,0";    # 2016mar02: "Ь"
  $t=2057; $ear[$t] = "\x8A,0,0";    # 2016mar02: "К"
  $t=2058; $ear[$t] = "\x8E,0,1780"; # 2016mar02: "О"
  $psi=1780; $hlc=3; $jux=0; $pos=7; $dba=1; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2052; KbLoad(); # 2018-07-08: flag-panel order
  $t=2059; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2060; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# скольких (1780 how much)  -- pronoun; genitive; 2016mar02
  $t=2061; $ear[$t] = "\x91,0,0";    # 2016mar02: "С"
  $t=2062; $ear[$t] = "\x8A,0,0";    # 2016mar02: "К"
  $t=2063; $ear[$t] = "\x8E,0,0";    # 2016mar02: "О"
  $t=2064; $ear[$t] = "\x8B,0,0";    # 2016mar02: "Л"
  $t=2065; $ear[$t] = "\x9C,0,0";    # 2016mar02: "Ь"
  $t=2066; $ear[$t] = "\x8A,0,0";    # 2016mar02: "К"
  $t=2067; $ear[$t] = "\x88,0,0";    # 2016mar02: "И"
  $t=2068; $ear[$t] = "\x95,0,1780"; # 2016mar02: "Х"
  $psi=1780; $hlc=3; $jux=0; $pos=7; $dba=2; $num=2; $mfn=0; # 2018-07-08
 $pre=0; $seq=0; $tkb=0; $rv=2061; KbLoad(); # 2018-07-08: flag-panel order
  $t=2069; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2070; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# скольким (1780 how much)  -- pronoun; dative; 2016mar02
  $t=2071; $ear[$t] = "\x91,0,0";    # 2016mar02: "С"
  $t=2072; $ear[$t] = "\x8A,0,0";    # 2016mar02: "К"
  $t=2073; $ear[$t] = "\x8E,0,0";    # 2016mar02: "О"
  $t=2074; $ear[$t] = "\x8B,0,0";    # 2016mar02: "Л"
  $t=2075; $ear[$t] = "\x9C,0,0";    # 2016mar02: "Ь"
  $t=2076; $ear[$t] = "\x8A,0,0";    # 2016mar02: "К"
  $t=2077; $ear[$t] = "\x88,0,0";    # 2016mar02: "И"
  $t=2078; $ear[$t] = "\x8C,0,1780"; # 2016mar02: "М"
  $psi=1780; $hlc=3; $jux=0; $pos=7; $dba=3; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2071; KbLoad(); # 2018-07-08: flag-panel order
  $t=2079; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2080; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# сколько (1780  how much)  -- pronoun; accusative; 2016mar02
  $t=2081; $ear[$t] = "\x91,0,0";    # 2016mar02: "С"
  $t=2082; $ear[$t] = "\x8A,0,0";    # 2016mar02: "К"
  $t=2083; $ear[$t] = "\x8E,0,0";    # 2016mar02: "О"
  $t=2084; $ear[$t] = "\x8B,0,0";    # 2016mar02: "Л"
  $t=2085; $ear[$t] = "\x9C,0,0";    # 2016mar02: "Ь"
  $t=2086; $ear[$t] = "\x8A,0,0";    # 2016mar02: "К"
  $t=2087; $ear[$t] = "\x8E,0,1780"; # 2016mar02: "О"
  $psi=1780; $hlc=3; $jux=0; $pos=7; $dba=4; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2081; KbLoad(); # 2018-07-08: flag-panel order
  $t=2088; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2089; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# сколькими (1780 how much)  -- pronoun; instrumental; 2016mar02
  $t=2090; $ear[$t] = "\x91,0,0";    # 2016mar02: "С"
  $t=2091; $ear[$t] = "\x8A,0,0";    # 2016mar02: "К"
  $t=2092; $ear[$t] = "\x8E,0,0";    # 2016mar02: "О"
  $t=2093; $ear[$t] = "\x8B,0,0";    # 2016mar02: "Л"
  $t=2094; $ear[$t] = "\x9C,0,0";    # 2016mar02: "Ь"
  $t=2095; $ear[$t] = "\x8A,0,0";    # 2016mar02: "К"
  $t=2096; $ear[$t] = "\x88,0,0";    # 2016mar02: "И"
  $t=2097; $ear[$t] = "\x8C,0,0";    # 2016mar02: "М"
  $t=2098; $ear[$t] = "\x88,0,1780"; # 2016mar02: "И"
  $psi=1780; $hlc=3; $jux=0; $pos=7; $dba=5; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2090; KbLoad(); # 2018-07-08: flag-panel order
  $t=2099; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2100; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# скольких (1780 how much)  -- pronoun; prepositional; 2016mar02
  $t=2101; $ear[$t] = "\x91,0,0";    # 2016mar02: "С"
  $t=2102; $ear[$t] = "\x8A,0,0";    # 2016mar02: "К"
  $t=2103; $ear[$t] = "\x8E,0,0";    # 2016mar02: "О"
  $t=2104; $ear[$t] = "\x8B,0,0";    # 2016mar02: "Л"
  $t=2105; $ear[$t] = "\x9C,0,0";    # 2016mar02: "Ь"
  $t=2106; $ear[$t] = "\x8A,0,0";    # 2016mar02: "К"
  $t=2107; $ear[$t] = "\x88,0,0";    # 2016mar02: "И"
  $t=2108; $ear[$t] = "\x95,0,1780"; # 2016mar02: "Х"
  $psi=1780; $hlc=3; $jux=0; $pos=7; $dba=6; $num=2; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2101; KbLoad(); # 2018-07-08: flag-panel order
  $t=2109; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2110; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# согласно (1692 in accordance with) preposition; 2016mar02
  $t=2111; $ear[$t] = "\x91,0,0";    # 2016mar02: "С"
  $t=2112; $ear[$t] = "\x8E,0,0";    # 2016mar02: "О"
  $t=2113; $ear[$t] = "\x83,0,0";    # 2016mar02: "Г"
  $t=2114; $ear[$t] = "\x8B,0,0";    # 2016mar02: "Л"
  $t=2115; $ear[$t] = "\x80,0,0";    # 2016mar02: "А"
  $t=2116; $ear[$t] = "\x91,0,0";    # 2016mar02: "С"
  $t=2117; $ear[$t] = "\x8D,0,0";    # 2016mar02: "Н"
  $t=2118; $ear[$t] = "\x8E,0,1692"; # 2016mar02: "О"
  $psi=1692; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2111; KbLoad(); # 2018-07-08: flag-panel order
  $t=2119; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2120; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# спустя (1693 after) preposition; 2016mar02
  $t=2121; $ear[$t] = "\x91,0,0";    # 2016mar02: "С"
  $t=2122; $ear[$t] = "\x8F,0,0";    # 2016mar02: "П"
  $t=2123; $ear[$t] = "\x93,0,0";    # 2016mar02: "У"
  $t=2124; $ear[$t] = "\x91,0,0";    # 2016mar02: "С"
  $t=2125; $ear[$t] = "\x92,0,0";    # 2016mar02: "Т"
  $t=2126; $ear[$t] = "\x9F,0,1693"; # 2016mar02: "Я"
  $psi=1693; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2121; KbLoad(); # 2018-07-08: flag-panel order
  $t=2127; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2128; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# среди (1695 between) preposition; 2016mar02
  $t=2129; $ear[$t] = "\x91,0,0";    # 2016mar02: "С"
  $t=2130; $ear[$t] = "\x90,0,0";    # 2016mar02: "Р"
  $t=2131; $ear[$t] = "\x85,0,0";    # 2016mar02: "Е"
  $t=2132; $ear[$t] = "\x84,0,0";    # 2016mar02: "Д"
  $t=2133; $ear[$t] = "\x88,0,1695"; # 2016mar02: "И"
  $psi=1695; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2129; KbLoad(); # 2018-07-08: flag-panel order
  $t=2134; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2135; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# СТУДЕНТ (1561 student) noun; a class for InFerence(); 2016mar02
  $t=2136; $ear[$t] = "\x91,0,0";    # 2016mar02: "С"
  $t=2137; $ear[$t] = "\x92,0,0";    # 2016mar02: "Т"
  $t=2138; $ear[$t] = "\x93,0,0";    # 2016mar02: "У"
  $t=2139; $ear[$t] = "\x84,0,0";    # 2016mar02: "Д"
  $t=2140; $ear[$t] = "\x85,0,0";    # 2016mar02: "Е"
  $t=2141; $ear[$t] = "\x8D,0,0";    # 2016mar02: "Н"
  $t=2142; $ear[$t] = "\x92,0,1561"; # 2016mar02: "Т"
  $psi=1561; $hlc=3; $jux=0; $pos=5; $dba=1; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2136; KbLoad(); # 2018-07-08: flag-panel order
  $t=2143; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2144; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# ТАКОЕ (1170 "such"); adjective; for questions; 2016may01
  $t=2145; $ear[$t] = "\x92,0,0";    # 2016mar02: "Т"
  $t=2146; $ear[$t] = "\x80,0,0";    # 2016mar02: "А"
  $t=2147; $ear[$t] = "\x8A,0,0";    # 2016mar02: "К"
  $t=2148; $ear[$t] = "\x8E,0,0";    # 2016mar02: "О"
  $t=2149; $ear[$t] = "\x85,0,1170"; # 2016mar02: "Е"
  $psi=1170; $hlc=3; $jux=0; $pos=5; $dba=1; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2145; KbLoad(); # 2018-07-08: flag-panel order
  $t=2150; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2151; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# ТРЕБОВАТЬ -- 2019-06-03: #1894 ("to demand"); verb; infinitive;
  $t=2152; $ear[$t] = "\x92,0,0";    # 2016mar02:  "Т"
  $t=2153; $ear[$t] = "\x90,0,0";    # 2016mar02:  "Р"
  $t=2154; $ear[$t] = "\x85,0,0";    # 2016mar02:  "Е"
  $t=2155; $ear[$t] = "\x81,0,1894"; # 2019-06-03: "Б"
  $t=2156; $ear[$t] = "\x8E,0,1894"; # 2019-06-03: "О"
  $t=2157; $ear[$t] = "\x82,0,1894"; # 2019-06-03: "В"
  $t=2158; $ear[$t] = "\x80,0,1894"; # 2019-06-03: "А"
  $t=2159; $ear[$t] = "\x92,0,1894"; # 2019-06-03: "Т"
  $t=2160; $ear[$t] = "\x9C,0,1894"; # 2019-06-03: "Ь"
  $psi=1894; $hlc=3; $jux=0; $pos=8; $dba=0; $num=0; $mfn=0; # 2019-06-03
  $pre=0; $seq=0; $tkb=0; $rv=2152; KbLoad(); # 2018-07-08: flag-panel order
  $t=2161; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2162; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# ТЫ (1707 "you") pronoun; familiar; nom. sing. 2016mar02
  $t=2163; $ear[$t] = "\x92,0,0";    # 2016mar02: "Т"
  $t=2164; $ear[$t] = "\x9B,0,1707"; # 2016mar02: "Ы"
  $psi=1707; $hlc=3; $jux=0; $pos=7; $dba=1; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2163; KbLoad(); # 2018-07-08: flag-panel order
  $t=2165; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2166; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# ТЕБЯ (1707 "of you") pronoun; familiar; gen. sing. 2016mar02
  $t=2167; $ear[$t] = "\x92,0,0";    # 2016mar02: "Т"
  $t=2168; $ear[$t] = "\x85,0,0";    # 2016mar02: "Е"
  $t=2169; $ear[$t] = "\x81,0,0";    # 2016mar02: "Б"
  $t=2170; $ear[$t] = "\x9F,0,1707"; # 2016mar02: "Я"
  $psi=1707; $hlc=3; $jux=0; $pos=7; $dba=2; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2167; KbLoad(); # 2018-07-08: flag-panel order
  $t=2171; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2172; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# ТЕБЕ (1707 "to you") pronoun; familiar; dat. sing. 4jan2012
  $t=2173; $ear[$t] = "\x92,0,0";    # 2016mar02: "Т"
  $t=2174; $ear[$t] = "\x85,0,0";    # 2016mar02: "Е"
  $t=2175; $ear[$t] = "\x81,0,0";    # 2016mar02: "Б"
  $t=2176; $ear[$t] = "\x85,0,1707"; # 2016mar02: "Е"
  $psi=1707; $hlc=3; $jux=0; $pos=7; $dba=3; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2173; KbLoad(); # 2018-07-08: flag-panel order
  $t=2177; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2178; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# ТЕБЯ (1707 "you") pronoun; familiar; acc. sing. 2016mar02
  $t=2179; $ear[$t] = "\x92,0,0";    # 2016mar02: "Т"
  $t=2180; $ear[$t] = "\x85,0,0";    # 2016mar02: "Е"
  $t=2181; $ear[$t] = "\x81,0,0";    # 2016mar02: "Б"
  $t=2182; $ear[$t] = "\x9F,0,1707"; # 2016mar02: "Я"
  $psi=1707; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2179; KbLoad(); # 2018-07-08: flag-panel order
  $t=2183; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2184; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# ТОБОЙ (1707 "you") pronoun; familiar; instrumental sing. 2016mar02
  $t=2185; $ear[$t] = "\x92,0,0";    # 2016mar02: "Т"
  $t=2186; $ear[$t] = "\x8E,0,0";    # 2016mar02: "О"
  $t=2187; $ear[$t] = "\x81,0,0";    # 2016mar02: "Б"
  $t=2188; $ear[$t] = "\x8E,0,0";    # 2016mar02: "О"
  $t=2189; $ear[$t] = "\x89,0,1707"; # 2016mar02: "Й"
  $psi=1707; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2185; KbLoad(); # 2018-07-08: flag-panel order
  $t=2190; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2191; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# ТОБОЮ (1707 "you") pronoun; familiar; instrumental sing. 2016mar02
  $t=2192; $ear[$t] = "\x92,0,0";    # 2016mar02: "Т"
  $t=2193; $ear[$t] = "\x8E,0,0";    # 2016mar02: "О"
  $t=2194; $ear[$t] = "\x81,0,0";    # 2016mar02: "Б"
  $t=2195; $ear[$t] = "\x8E,0,0";    # 2016mar02: "О"
  $t=2196; $ear[$t] = "\x9E,0,1707"; # 2016mar02: "Ю" variant
  $psi=1707; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2192; KbLoad(); # 2018-07-08: flag-panel order
  $t=2197; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2198; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# ТЕБЕ (1707 "you") pronoun; familiar; prep. sing. 2016mar02
  $t=2199; $ear[$t] = "\x92,0,0";    # 2016mar02: "Т"
  $t=2200; $ear[$t] = "\x85,0,0";    # 2016mar02: "Е"
  $t=2201; $ear[$t] = "\x81,0,0";    # 2016mar02: "Б"
  $t=2202; $ear[$t] = "\x85,0,1707"; # 2016mar02: "Е"
  $psi=1707; $hlc=3; $jux=0; $pos=7; $dba=6; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2199; KbLoad(); # 2018-07-08: flag-panel order
  $t=2203; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2204; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# У (1697 at, by) preposition; 2016mar02:
  $t=2205; $ear[$t] = "\x93,0,1697"; # 2016feb28: "У"
  $psi=1697; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2205; KbLoad(); # 2018-07-08: flag-panel order
  $t=2206; $ear[$t] = " ,0,0";       # 2016feb28: blank space

  $t=2207; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# ХОЧУ -- 2019-06-03: #1897 "want") verb; 1st pers. sing. for FreeWill();
  $t=2208; $ear[$t] = "\x95,0,0";    # 2016mar02:  "Х"
  $t=2209; $ear[$t] = "\x8E,0,0";    # 2016mar02:  "О"
  $t=2210; $ear[$t] = "\x97,0,0";    # 2016mar02:  "Ч"
  $t=2211; $ear[$t] = "\x93,0,1897"; # 2019-06-03: "У"
  $psi=1897; $hlc=3; $jux=0; $pos=8; $dba=1; $num=1; $mfn=0; # 2019-06-03
  $pre=0; $seq=0; $tkb=0; $rv=2208; KbLoad(); # 2018-07-08: flag-panel order
  $t=2212; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2213; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# ЧЕЛОВЕК (1581 "human being") noun; nom. sing. 2016mar02
  $t=2214; $ear[$t] = "\x97,0,0";    # 2016mar02: "Ч"
  $t=2215; $ear[$t] = "\x85,0,0";    # 2016mar02: "Е"
  $t=2216; $ear[$t] = "\x8B,0,0";    # 2016mar02: "Л"
  $t=2217; $ear[$t] = "\x8E,0,0";    # 2016mar02: "О"
  $t=2218; $ear[$t] = "\x82,0,0";    # 2016mar02: "В"
  $t=2219; $ear[$t] = "\x85,0,0";    # 2016mar02: "Е"
  $t=2220; $ear[$t] = "\x8A,0,1581"; # 2016mar02: "К"
  $psi=1581; $hlc=3; $jux=0; $pos=5; $dba=1; $num=1; $mfn=1; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2214; KbLoad(); # 2018-07-08: flag-panel order
  $t=2221; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2222; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# через (1699 across, through) preposition; 2016mar02
  $t=2223; $ear[$t] = "\x97,0,0";    # 2016mar02: "Ч"
  $t=2224; $ear[$t] = "\x85,0,0";    # 2016mar02: "Е"
  $t=2225; $ear[$t] = "\x90,0,0";    # 2016mar02: "Р"
  $t=2226; $ear[$t] = "\x85,0,0";    # 2016mar02: "Е"
  $t=2227; $ear[$t] = "\x87,0,1699"; # 2016mar02: "З"
  $psi=1699; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2223; KbLoad(); # 2018-07-08: flag-panel order
  $t=2228; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2229; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# ЧТО (1310 that) conjunction; 2016mar02
  $t=2230; $ear[$t] = "\x97,0,0";    # 2016mar02: "Ч"
  $t=2231; $ear[$t] = "\x92,0,0";    # 2016mar02: "Т"
  $t=2232; $ear[$t] = "\x8E,0,1310"; # 2016mar02: "О"
  $psi=1310; $hlc=3; $jux=0; $pos=6; $dba=0; $num=0; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2230; KbLoad(); # 2018-07-08: flag-panel order
  $t=2233; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2234; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# ЧТО (1781 what) pronoun; nominative singular; 2016mar02
  $t=2235; $ear[$t] = "\x97,0,0";    # 2016mar02: "Ч"
  $t=2236; $ear[$t] = "\x92,0,0";    # 2016mar02: "Т"
  $t=2237; $ear[$t] = "\x8E,0,1781"; # 2016mar02: "О"
  $psi=1781; $hlc=3; $jux=0; $pos=7; $dba=1; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2235; KbLoad(); # 2018-07-08: flag-panel order
  $t=2238; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2239; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# чего (1781 what) pronoun; genitive singular; 2016mar02
  $t=2240; $ear[$t] = "\x97,0,0";    # 2016mar02: "Ч"
  $t=2241; $ear[$t] = "\x85,0,0";    # 2016mar02: "Е"
  $t=2242; $ear[$t] = "\x83,0,0";    # 2016mar02: "Г"
  $t=2243; $ear[$t] = "\x8E,0,1781"; # 2016mar02: "О"
  $psi=1781; $hlc=3; $jux=0; $pos=7; $dba=2; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2240; KbLoad(); # 2018-07-08: flag-panel order
  $t=2244; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2245; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# чему (1781 what) pronoun; dative singular; 2016mar02
  $t=2246; $ear[$t] = "\x97,0,0";    # 2016mar02: "Ч"
  $t=2247; $ear[$t] = "\x85,0,0";    # 2016mar02: "Е"
  $t=2248; $ear[$t] = "\x8C,0,0";    # 2016mar02: "М"
  $t=2249; $ear[$t] = "\x93,0,1781"; # 2016mar02: "У"
  $psi=1781; $hlc=3; $jux=0; $pos=7; $dba=3; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2246; KbLoad(); # 2018-07-08: flag-panel order
  $t=2250; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2251; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# ЧТО (1781 what) pronoun; accusative singular; 2016mar02
  $t=2252; $ear[$t] = "\x97,0,0";    # 2016mar02: "Ч"
  $t=2253; $ear[$t] = "\x92,0,0";    # 2016mar02: "Т"
  $t=2254; $ear[$t] = "\x8E,0,1781"; # 2016mar02: "О"
  $psi=1781; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2252; KbLoad(); # 2018-07-08: flag-panel order
  $t=2255; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2256; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# чем (1781 what) pronoun; instrumental singular; 2016mar02
  $t=2257; $ear[$t] = "\x97,0,0";    # 2016mar02: "Ч"
  $t=2258; $ear[$t] = "\x85,0,0";    # 2016mar02: "Е"
  $t=2259; $ear[$t] = "\x8C,0,1781"; # 2016mar02: "М"
  $psi=1781; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2257; KbLoad(); # 2018-07-08: flag-panel order
  $t=2260; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2261; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# чём (1781 what) pronoun; prepositional singular; 2016mar02
  $t=2262; $ear[$t] = "\x97,0,0";    # 2016mar02: "Ч"
  $t=2263; $ear[$t] = "\xF0,0,0";    # 2016mar02: "Ё"
  $t=2264; $ear[$t] = "\x8C,0,1781"; # 2016mar02: "М"
  $psi=1781; $hlc=3; $jux=0; $pos=7; $dba=6; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2262; KbLoad(); # 2018-07-08: flag-panel order
  $t=2265; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2266; $ear[$t] = "\N{U+0},0,0"; # 2016mar02: Unicode?
# чем (1781 what) pronoun; prepositional singular; 2016mar02
  $t=2267; $ear[$t] = "\x97,0,0";    # 2016mar02: "Ч"
  $t=2268; $ear[$t] = "\x85,0,0";    # 2016mar02: "Е" no-dots variant
  $t=2269; $ear[$t] = "\x8C,0,1781"; # 2016mar02: "М"
  $psi=1781; $hlc=3; $jux=0; $pos=7; $dba=6; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2267; KbLoad(); # 2018-07-08: flag-panel order
  $t=2270; $ear[$t] = " ,0,0";       # 2016mar02: blank space

  $t=2271; $ear[$t] = "\N{U+0},0,0"; # 2016mar06: Unicode?
# это (1747 this) pronoun; nominative singular; 2016mar06
  $t=2272; $ear[$t] = "\x9d,0,0";    # 2016mar06: "Э"
  $t=2273; $ear[$t] = "\x92,0,0";    # 2016mar06: "Т"
  $t=2274; $ear[$t] = "\x8E,0,1747"; # 2016mar06: "О"
  $psi=1747; $hlc=3; $jux=0; $pos=7; $dba=1; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2272; KbLoad(); # 2018-07-08: flag-panel order
  $t=2275; $ear[$t] = " ,0,0";       # 2016mar06: blank space

  $t=2276; $ear[$t] = "\N{U+0},0,0"; # 2016mar06: Unicode?
# этого (1747 this) pronoun; genitive singular; 2016mar06
  $t=2277; $ear[$t] = "\x9D,0,0";    # 2016mar06: "Э"
  $t=2278; $ear[$t] = "\x92,0,0";    # 2016mar06: "Т"
  $t=2279; $ear[$t] = "\x8E,0,0";    # 2016mar06: "О"
  $t=2280; $ear[$t] = "\x83,0,0";    # 2016mar06: "Г"
  $t=2281; $ear[$t] = "\x8E,0,1747"; # 2016mar06: "О"
  $psi=1747; $hlc=3; $jux=0; $pos=7; $dba=2; $num=1; $mfn=3;  # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2277; KbLoad(); # 2018-07-08: flag-panel order
  $t=2282; $ear[$t] = " ,0,0";       # 2016mar06: blank space

  $t=2283; $ear[$t] = "\N{U+0},0,0"; # 2016mar06: Unicode?
# этому (1747 this) pronoun; dative singular; 2016mar06
  $t=2284; $ear[$t] = "\x9D,0,0";    # 2016mar06: "Э"
  $t=2285; $ear[$t] = "\x92,0,0";    # 2016mar06: "Т"
  $t=2286; $ear[$t] = "\x8E,0,0";    # 2016mar06: "О"
  $t=2287; $ear[$t] = "\x8C,0,0";    # 2016mar06: "М"
  $t=2288; $ear[$t] = "\x93,0,1747"; # 2016mar06: "У"
  $psi=1747; $hlc=3; $jux=0; $pos=7; $dba=3; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2284; KbLoad(); # 2018-07-08: flag-panel order
  $t=2289; $ear[$t] = " ,0,0";       # 2016mar06: blank space

  $t=2290; $ear[$t] = "\N{U+0},0,0"; # 2016mar06: Unicode?
# это (1747 this) pronoun; accusative singular; 2016mar06
  $t=2291; $ear[$t] = "\x9d,0,0";    # 2016mar06: "Э"
  $t=2292; $ear[$t] = "\x92,0,0";    # 2016mar06: "Т"
  $t=2293; $ear[$t] = "\x8E,0,1747"; # 2016mar06: "О"
  $psi=1747; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2291; KbLoad(); # 2018-07-08: flag-panel order
  $t=2294; $ear[$t] = " ,0,0";       # 2016mar06: blank space

  $t=2295; $ear[$t] = "\N{U+0},0,0"; # 2016mar06: Unicode?
# этим (1747 this) pronoun; instrumental singular; 2016mar06
  $t=2296; $ear[$t] = "\x9D,0,0";    # 2016mar06: "Э"
  $t=2297; $ear[$t] = "\x92,0,0";    # 2016mar06: "Т"
  $t=2298; $ear[$t] = "\x88,0,0";    # 2016mar06: "И"
  $t=2299; $ear[$t] = "\x8C,0,1747"; # 2016mar06: "М"
  $psi=1747; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2296; KbLoad(); # 2018-07-08: flag-panel order
  $t=2300; $ear[$t] = " ,0,0";       # 2016mar06: blank space

  $t=2301; $ear[$t] = "\N{U+0},0,0"; # 2016mar06: Unicode?
# этом (1747 this) pronoun; prepositional singular; 2016mar06
  $t=2302; $ear[$t] = "\x9D,0,0";    # 2016mar06: "Э"
  $t=2303; $ear[$t] = "\x92,0,0";    # 2016mar06: "Т"
  $t=2304; $ear[$t] = "\x8E,0,0";    # 2016mar06: "О"
  $t=2305; $ear[$t] = "\x8C,0,1747"; # 2016mar06: "М"
  $psi=1747; $hlc=3; $jux=0; $pos=7; $dba=6; $num=1; $mfn=3; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2302; KbLoad(); # 2018-07-08: flag-panel order
  $t=2306; $ear[$t] = " ,0,0";       # 2016mar06: blank space

   $t=2307; $ear[$t] = "\N{U+0},0,0"; # 2016mar06: Unicode?
# "Я" (1701 "I") personal pronoun; nominative; 2016feb25
   $t=2308; $ear[$t] = "\x9F,0,1701"; # 2016mar06: "Я"
   $psi=1701; $hlc=3; $jux=0; $pos=7; $dba=1; $num=1; $mfn=0; # 2018-07-08
   $pre=0; $seq=0; $tkb=0; $rv=2308; KbLoad(); # 2018-07-08: flag-panel order
   $t=2309; $ear[$t] = " ,0,0";       # 2017dec06: blank space

  $t=2310; $ear[$t] = "\N{U+0},0,0"; # 2016mar62: Unicode?
# МЕНЯ (1701 "of me") pronoun; familiar; gen. sing. 2016mar02
  $t=2311; $ear[$t] = "\x8C,0,0";    # 2016mar06: "М"
  $t=2312; $ear[$t] = "\x85,0,0";    # 2016mar06: "Е"
  $t=2313; $ear[$t] = "\x8D,0,0";    # 2016mar06: "Н"
  $t=2314; $ear[$t] = "\x9F,0,1701"; # 2016mar06: "Я"
  $psi=1701; $hlc=3; $jux=0; $pos=7; $dba=2; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2311; KbLoad(); # 2018-07-08: flag-panel order
  $t=2315; $ear[$t] = " ,0,0";       # 2016mar06: blank space

  $t=2316; $ear[$t] = "\N{U+0},0,0"; # 2016mar06: Unicode?
# МНЕ (1701 "to me") pronoun; familiar; dat. sing. 2016mar02
  $t=2317; $ear[$t] = "\x8C,0,0";    # 2016mar06: "М"
  $t=2318; $ear[$t] = "\x8D,0,0";    # 2016mar06: "Н" 2016mar06
  $t=2319; $ear[$t] = "\x85,0,1701"; # 2016mar06: "Е"
  $psi=1701; $hlc=3; $jux=0; $pos=7; $dba=3; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2317; KbLoad(); # 2018-07-08: flag-panel order
  $t=2320; $ear[$t] = " ,0,0";       # 2016mar06: blank space

  $t=2321; $ear[$t] = "\N{U+0},0,0"; # 2016mar06: Unicode?
# МЕНЯ (1701 "me") pronoun; familiar; acc. sing. 2016mar02
  $t=2322; $ear[$t] = "\x8C,0,0";    # 2016mar06: "М"
  $t=2323; $ear[$t] = "\x85,0,0";    # 2016mar06: "Е"
  $t=2324; $ear[$t] = "\x8D,0,0";    # 2016mar06: "Н"
  $t=2325; $ear[$t] = "\x9F,0,1701"; # 2016mar06: "Я"
  $psi=1701; $hlc=3; $jux=0; $pos=7; $dba=4; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2322; KbLoad(); # 2018-07-08: flag-panel order
  $t=2326; $ear[$t] = " ,0,0";       # 2016mar06: blank space

  $t=2327; $ear[$t] = "\N{U+0},0,0"; # 2016mar06: Unicode?
# МНОЙ (1701 "me") pronoun; familiar; instr. sing. 2016mar02
  $t=2328; $ear[$t] = "\x8C,0,0";    # 2016mar06: "М"
  $t=2329; $ear[$t] = "\x8D,0,0";    # 2016mar06: "Н"
  $t=2330; $ear[$t] = "\x8E,0,0";    # 2016mar06: "О"
  $t=2331; $ear[$t] = "\x89,0,1701"; # 2016mar06: "Й"
  $psi=1701; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2328; KbLoad(); # 2018-07-08: flag-panel order
  $t=2332; $ear[$t] = " ,0,0";       # 2016mar06: blank space

  $t=2333; $ear[$t] = "\N{U+0},0,0"; # 2016mar06: Unicode?
# МНОЮ (1701 "me") pronoun; familiar; instr. sing. 2016mar02
  $t=2334; $ear[$t] = "\x8C,0,0";    # 2016mar06: "М"
  $t=2335; $ear[$t] = "\x8D,0,0";    # 2016mar06: "Н"
  $t=2336; $ear[$t] = "\x8E,0,0";    # 2016mar06: "О"
  $t=2337; $ear[$t] = "\x9E,0,1701"; # 2016mar06: "Ю" variant
  $psi=1701; $hlc=3; $jux=0; $pos=7; $dba=5; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2334; KbLoad(); # 2018-07-08: flag-panel order
  $t=2338; $ear[$t] = " ,0,0";       # 2016mar06: blank space

  $t=2339; $ear[$t] = "\N{U+0},0,0"; # 2016mar06: Unicode?
# МНЕ (1701 "me") pronoun; familiar; prep. sing. 2016mar02
  $t=2340; $ear[$t] = "\x8C,0,0";    # 2016mar06: "М"
  $t=2341; $ear[$t] = "\x8D,0,0";    # 2016mar06: "Н"
  $t=2342; $ear[$t] = "\x85,0,1701"; # 2016mar06: "Е"
  $psi=1701; $hlc=3; $jux=0; $pos=7; $dba=6; $num=1; $mfn=0; # 2018-07-08
  $pre=0; $seq=0; $tkb=0; $rv=2340; KbLoad(); # 2018-07-08: flag-panel order
  $t=2343; $ear[$t] = " ,0,0";       # 2016mar06: blank space

$t++;  # 2018-09-02: making single-word time relative, not hard-coded.

  # A -- En(glish) Article for EnArticle module; 2018-09-08
$t++; $ear[$t] = "A,0,101"; $rv = $t; # 2018-09-08: anticipate KbLoad.
  $psi=101; $hlc=1; $pos=1; $num=1; KbLoad(); # 2018-09-08: necessary items.
$t++;  # 2018-09-08: one blank time-point for sake of AudRecog()

  # 601=ABOARD -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "B,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "A,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,601";         # 2018-11-15: among 100 innate prepositions.
  $psi=601; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # ABOUT -- preposition (46th most frequent word) for EnPrep module; 2016mar02
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "B,0,0";           # 2018-09-10
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "U,0,0";           # 2018-09-10
$t++; $ear[$t] = "T,0,602";         # 2018-11-11: among 100 innate prepositions.
  $psi=602; $hlc=1; $pos=6; $dba=0; KbLoad(); # 2018-11-11: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 603=ABOVE -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "B,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "V,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,603";         # 2018-11-15: among 100 innate prepositions.
  $psi=603; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 604=ABSENT -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "B,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,604";         # 2018-11-15: among 100 innate prepositions.
  $psi=604; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 605=ACROSS -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "C,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,605";         # 2018-11-15: among 100 innate prepositions.
  $psi=605; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 300=AFTER -- 2018-11-27: conjunction for multi-clause thought.
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "F,0,0";           # 2018-11-27
$t++; $ear[$t] = "T,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "R,0,300";         # 2018-11-27: among innate conjunctions
  $psi=300; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: flag-panel
$t++;  # 2018-11-15: one SPACE for sake of AudRecog()

  # 606=AFTER -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "F,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,606";         # 2018-11-15: among 100 innate prepositions.
  $psi=606; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # AGAINST -- 2018-11-08: preposition for EnPrep module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-08: anticipate KbLoad.
$t++; $ear[$t] = "G,0,0";           # 2018-11-08
$t++; $ear[$t] = "A,0,0";           # 2018-11-08
$t++; $ear[$t] = "I,0,0";           # 2018-11-08
$t++; $ear[$t] = "N,0,0";           # 2018-11-08
$t++; $ear[$t] = "S,0,0";           # 2018-11-08
$t++; $ear[$t] = "T,0,607";         # 2018-11-11
  $psi=607; $hlc=1; $pos=6; KbLoad(); # 2018-11-11: flag-panel
$t++;  # 2018-11-08: one blank time-point for sake of AudRecog()

  # ALL -- for machine reasoning logic; 2018-09-08
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-09-08: anticipate KbLoad.
$t++; $ear[$t] = "L,0,0";           # 2018-09-08
$t++; $ear[$t] = "L,0,111";         # 2019-10-13
  $psi=111; $hlc=1; $pos=1; KbLoad(); # 2019-10-13: necessary items.
$t++;  # 2018-09-08: one blank time-point for sake of AudRecog()

  # 608=ALONG -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "L,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "G,0,608";         # 2018-11-15: among 100 innate prepositions.
  $psi=608; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 609=ALONGSIDE -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "L,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "G,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,609";         # 2018-11-15: among 100 innate prepositions.
  $psi=609; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 303=ALTHOUGH -- 2018-11-27: conjunction for multi-clause thought.
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "L,0,0";           # 2018-11-27
$t++; $ear[$t] = "T,0,0";           # 2018-11-27
$t++; $ear[$t] = "H,0,0";           # 2018-11-27
$t++; $ear[$t] = "O,0,0";           # 2018-11-27
$t++; $ear[$t] = "U,0,0";           # 2018-11-27
$t++; $ear[$t] = "G,0,0";           # 2018-11-27
$t++; $ear[$t] = "H,0,303";         # 2018-11-27: among innate conjunctions
  $psi=303; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: flag-panel
$t++;  # 2018-11-15: one SPACE for sake of AudRecog()

  # AM -- 1st person singular I-form of 800=BE; 2016feb07
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-09-08: anticipate KbLoad.
$t++; $ear[$t] = "M,0,800";         # 2018-09-08
  $psi=800; $hlc=1; $pos=8; $dba=1; $num=1; KbLoad();  # 2018-09-08: flag-panel
$t++;  # 2018-09-08: one blank time-point for sake of AudRecog()

  # 611=AMID -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "M,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,611";         # 2018-11-15: among 100 innate prepositions.
  $psi=611; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 612=AMIDST -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "M,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,612";         # 2018-11-15: among 100 innate prepositions.
  $psi=612; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 613=AMONG -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "M,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "G,0,613";         # 2018-11-15: among 100 innate prepositions.
  $psi=613; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 614=AMONGST -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "M,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "G,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,614";         # 2018-11-15: among 100 innate prepositions.
  $psi=614; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # AN -- to be selected instead of "A" before a vowel; 2018-09-08
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-09-08: anticipate KbLoad.
$t++; $ear[$t] = "N,0,102";         # 2018-09-08
  $psi=102; $hlc=1; $pos=1; $dba=0; $num=1; KbLoad(); # 2018-09-08: flag-panel
$t++;  # 2018-09-08: one blank time-point for sake of AudRecog()

  # 306=AND -- 2018-11-27: conjunction for machine reasoning logic.
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-09-08: anticipate KbLoad.
$t++; $ear[$t] = "N,0,0";           # 2018-09-08
$t++; $ear[$t] = "D,0,306";         # 2018-09-08
  $psi=306; $hlc=1; $pos=3; KbLoad();  # 2018-11-27: flag-panel
$t++;  # 2018-09-08: one blank time-point for sake of AudRecog()

  # 615=ANENT -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,615";         # 2018-11-15: among 100 innate prepositions.
  $psi=615; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 616=ANTI -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,616";         # 2018-11-15: among 100 innate prepositions.
  $psi=616; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # ANY -- for machine reasoning logic
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-09-08: anticipate KbLoad.
$t++; $ear[$t] = "N,0,0";           # 2018-09-08
$t++; $ear[$t] = "Y,0,123";         # 2019-10-13
  $psi=123; $hlc=1; $pos=1; KbLoad();  # 2019-10-13: essential flag-panel
$t++;  # 2018-09-08: one blank time-point for sake of AudRecog()

  # ANYTHING -- a default direct object for AskUser()
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-09-08: anticipate KbLoad.
$t++; $ear[$t] = "N,0,0";           # 2018-09-08
$t++; $ear[$t] = "Y,0,0";           # 2018-09-08
$t++; $ear[$t] = "T,0,0";           # 2018-09-08
$t++; $ear[$t] = "H,0,0";           # 2018-09-08
$t++; $ear[$t] = "I,0,0";           # 2018-09-08
$t++; $ear[$t] = "N,0,0";           # 2018-09-08
$t++;; $ear[$t] = "G,0,711";        # 2018-09-08
  $psi=711; $hlc=1; $pos=7; $dba=4; $num=1; KbLoad(); # 2018-09-08: flag-panel
$t++;  # 2018-09-08: one blank time-point for sake of AudRecog()

  # 617=APRES -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "P,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,617";         # 2018-11-15: among 100 innate prepositions.
  $psi=617; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # ARE -- 2nd person singular YOU-form of 800=BE; 2016feb07
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-09-08: anticipate KbLoad.
$t++; $ear[$t] = "R,0,0";           # 2018-09-08
$t++; $ear[$t] = "E,0,800";         # 2018-09-08
  $psi=800; $hlc=1; $pos=8; $dba=2; $num=1; KbLoad(); # 2018-09-08: for agreement
$t++;  # 2018-09-08: one blank time-point for sake of AudRecog()

  # ARE -- 1st person plural WE-form of 800=BE; 2016feb07
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-09-09: anticipate KbLoad.
$t++; $ear[$t] = "R,0,0";           # 2018-09-09
$t++; $ear[$t] = "E,0,800";         # 2018-09-09
  $psi=800; $hlc=1; $pos=8; $dba=1; $num=2; KbLoad(); # 2018-09-09: for agreement
$t++;  # 2018-09-09: one blank time-point for sake of AudRecog()

  # ARE -- 2nd person plural YOU-form of 800=BE; 2016feb07
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-09-09: anticipate KbLoad.
$t++; $ear[$t] = "R,0,0";           # 2018-09-09
$t++; $ear[$t] = "E,0,800";         # 2018-09-09
  $psi=800; $hlc=1; $pos=8; $dba=2; $num=2; KbLoad(); # 2018-09-09: for agreement
$t++;  # 2018-09-09: one blank time-point for sake of AudRecog()

  # ARE -- 3rd person plural THEY-form of 800=BE; 2016feb07
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-09-09: anticipate KbLoad.
$t++; $ear[$t] = "R,0,0";           # 2018-09-09
$t++; $ear[$t] = "E,0,800";         # 2018-09-09
  $psi=800; $hlc=1; $pos=8; $dba=3; $num=2; KbLoad(); # 2018-09-09: for agreement
$t++;  # 2018-09-09: one blank time-point for sake of AudRecog()

  # 618=AROUND -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "U,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,618";         # 2018-11-15: among 100 innate prepositions.
  $psi=618; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 309=AS -- 2018-11-27: among innate English conjunctions
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "S,0,309";         # 2018-11-27:
  $psi=309; $hlc=1; $pos=3; KbLoad();  # 2018-11-27: flag-panel
$t++;  # 2018-11-27: one SPACE for sake of AudRecog()

  # 801=ASK -- from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "S,0,0";           # 2018-12-10
$t++; $ear[$t] = "K,0,801";         # 2018-12-10
  $psi=801; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 619=ASTRIDE -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,619";         # 2018-11-15: among 100 innate prepositions.
  $psi=619; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # AT -- preposition (22nd most frequent word) for EnPrep module; 2016mar02
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "T,0,620";         # 2018-11-11: among 100 innate prepositions.
  $psi=620; $hlc=1; $pos=6; $dba=0; KbLoad(); # 2018-11-11: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 621=ATOP -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "A,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "P,0,621";         # 2018-11-15: among 100 innate prepositions.
  $psi=621; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # BAD -- adjective for EnAdjective module
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-09-08: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-09-08
$t++; $ear[$t] = "D,0,127";         # 2019-10-13
  $psi=127; $hlc=1; $pos=1; KbLoad(); # 2019-10-13: essential flag-panel
$t++;  # 2018-09-08: one blank time-point for sake of AudRecog()

  # BE -- infinitive impersonal form of 800=BE; 2016feb07
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-09-08: anticipate KbLoad.
$t++; $ear[$t] = "E,0,800";         # 2018-09-08
  $psi=800; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-09-15: infinitive dba=0
$t++;  # 2018-09-15: one blank time-point for sake of AudRecog()

  # 312=BECAUSE -- 2018-11-27: conjunction for machine reasoning logic
$t++;  $ear[$t] = "B,0,0"; $rv = $t; # 2018-09-09: anticipate KbLoad.
$t++;  $ear[$t] = "E,0,0";           # 2018-09-09
$t++;  $ear[$t] = "C,0,0";           # 2018-09-09
$t++;  $ear[$t] = "A,0,0";           # 2018-09-09
$t++;  $ear[$t] = "U,0,0";           # 2018-09-09
$t++;  $ear[$t] = "S,0,0";           # 2018-09-09
$t++;  $ear[$t] = "E,0,312";         # 2018-09-09
  $psi=312; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: essential flag-panel
$t++;  # 2018-11-27: one SPACE for sake of AudRecog()

  # 622=BECAUSE [millennial] -- 2018-11-11: preposition for EnPrep() module

  # 802=BECOME -- 2018-12-10: essential intransitive verb
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-09-09: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-09-09
$t++; $ear[$t] = "C,0,0";           # 2018-09-09
$t++; $ear[$t] = "O,0,0";           # 2018-09-09
$t++; $ear[$t] = "M,0,0";           # 2018-09-09
$t++; $ear[$t] = "E,0,802";         # 2018-12-10
  $psi=802; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-09-09: one blank time-point for sake of AudRecog()

  # 315=BEFORE -- 2018-11-27: conjunction for multi-clause thought.
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "F,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,315";         # 2018-11-27: among innate conjunctions.
  $psi=315; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 623=BEFORE -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "F,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,623";         # 2018-11-15: among 100 innate prepositions.
  $psi=623; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 803=BEGIN -- 2018-12-10: important verb for planning
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-10
$t++; $ear[$t] = "G,0,0";           # 2018-12-10
$t++; $ear[$t] = "I,0,0";           # 2018-12-10
$t++; $ear[$t] = "N,0,803";         # 2018-12-10
  $psi=803; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 624=BEHIND -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "H,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,624";         # 2018-11-15: among 100 innate prepositions.
  $psi=624; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 625=BELOW -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "L,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "W,0,625";         # 2018-11-15: among 100 innate prepositions.
  $psi=625; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 626=BENEATH -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "A,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "H,0,626";         # 2018-11-15: among 100 innate prepositions.
  $psi=626; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 627=BESIDE -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,627";         # 2018-11-15: among 100 innate prepositions.
  $psi=627; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel

  # 628=BESIDES -- 2018-11-11: preposition for EnPrep() module
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,628";         # 2018-11-15: among 100 innate prepositions.
  $psi=628; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 629=BESTRIDE -- 2018-11-11: preposition for EnPrep() module
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,629";         # 2018-11-15: among 100 innate prepositions.
  $psi=629; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 630=BETWEEN -- 2018-11-11: preposition for EnPrep() module
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "W,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,630";         # 2018-11-15: among 100 innate prepositions.
  $psi=630; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 631=BETWIXT -- 2018-11-11: preposition for EnPrep() module
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "W,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "X,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,631";         # 2018-11-15: among 100 innate prepositions.
  $psi=631; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 632=BEYOND -- 2018-11-11: preposition for EnPrep() module
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "Y,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,632";         # 2018-11-15: among 100 innate prepositions.
  $psi=632; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # BOOK -- for InFerence premise "Students read books"; 2018-09-03
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-09-03: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-03
$t++; $ear[$t] = "O,0,0";           # 2018-09-03
$t++; $ear[$t] = "K,0,540";         # 2018-09-03
  $psi=540; $hlc=1; $mtx=0; $pos=5; $num=1; KbLoad(); # 2018-09-03: necessary items.
$t++;  # 2018-09-03: one blank time-point for sake of AudRecog()

  # BOY -- always masculine noun for use with gender flags
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-09-09: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-09
$t++; $ear[$t] = "Y,0,512";         # 2019-11-04
  $psi=519; $hlc=1; $pos=5; $dba=0; $num=1; $mfn=1; KbLoad(); # 2019-11-04
# $t = 80;                 # 2016jan31: Leave a gap of one space in memory.
# $t = 80;  # 2018-09-09: BUGFIX: commenting out
$t++;  # 2018-09-09: one blank time-point for sake of AudRecog()

  # 321=BUT -- 2018-11-27: conjunction for ConJoin module
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-09-09: anticipate KbLoad.
$t++; $ear[$t] = "U,0,0";           # 2018-09-09
$t++; $ear[$t] = "T,0,321";         # 2018-09-09
  $psi=321; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: conceptual associative tags
$t++;  # 2018-11-27: one SPACE for sake of AudRecog()

  # 633=BUT -- 2018-11-11: as a preposition for EnPrep() module

  # 804=BUY -- 2018-12-10: common everyday verb
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "U,0,0";           # 2018-12-10
$t++; $ear[$t] = "Y,0,804";         # 2018-12-10
  $psi=804; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # BY -- preposition (30th most frequent word) for EnPrep module; 2016mar02
$t++; $ear[$t] = "B,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "Y,0,634";         # 2018-11-11: among 100 innate prepositions.
  $psi=634; $hlc=1; $pos=6; $dba=0; KbLoad(); # 2018-11-11: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 805=CALL -- 2018-12-10: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "C,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-10
$t++; $ear[$t] = "L,0,0";           # 2018-12-10
$t++; $ear[$t] = "L,0,805";         # 2018-12-10
  $psi=805; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 806=CAN -- 2018-12-10: auxiliary verb for EnAuxVerb
$t++; $ear[$t] = "C,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-10
$t++; $ear[$t] = "N,0,806";         # 2018-12-10
  $psi=806; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: present tense
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # CHESS -- important singular AI noun ending in "S"
$t++; $ear[$t] = "C,0,0"; $rv = $t; # 2018-09-09: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-09
$t++; $ear[$t] = "E,0,0";           # 2018-09-09
$t++; $ear[$t] = "S,0,0";           # 2018-09-09
$t++; $ear[$t] = "S,0,564";         # 2018-09-09
  $psi=564; $hlc=1; $pos=5; $num=1; KbLoad(); # 2018-09-09: essentials
$t++;  # 2018-09-09: one blank time-point for sake of AudRecog()

  # 635=CHEZ -- 2018-11-11: as a preposition for EnPrep() module
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()
$t++; $ear[$t] = "C,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "Z,0,635";         # 2018-11-15: among 100 innate prepositions.
  $psi=635; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # CHILD -- example of irregular noun for a polyglot AI Mind
$t++; $ear[$t] = "C,0,0"; $rv = $t; # 2018-09-09: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-09
$t++; $ear[$t] = "I,0,0";           # 2018-09-09
$t++; $ear[$t] = "L,0,0";           # 2018-09-09
$t++; $ear[$t] = "D,0,525";         # 2018-09-09
  $psi=525; $hlc=1; $pos=5; $num=1; KbLoad(); # 2018-09-09: essentials
$t++;  # 2018-09-09: one blank time-point for sake of AudRecog()

  # CHILDREN -- irregular plural for retrieval by parameters
$t++; $ear[$t] = "C,0,0"; $rv = $t; # 2018-09-09: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-09
$t++; $ear[$t] = "I,0,0";           # 2018-09-09
$t++; $ear[$t] = "L,0,0";           # 2018-09-09
$t++; $ear[$t] = "D,0,0";           # 2018-09-09
$t++; $ear[$t] = "R,0,0";           # 2018-09-09
$t++; $ear[$t] = "E,0,0";           # 2018-09-09
$t++; $ear[$t] = "N,0,525";         # 2017-10-24: same for sing. & plural
  $psi=525; $hlc=1; $pos=5; $num=2; KbLoad();  # 2018-09-09: essentials
$t++;  # 2018-09-09: one blank time-point for sake of AudRecog()

  # 807=CHOOSE -- 2018-12-10: verb for Volition
$t++; $ear[$t] = "C,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-12-10
$t++; $ear[$t] = "O,0,0";           # 2018-12-10
$t++; $ear[$t] = "O,0,0";           # 2018-12-10
$t++; $ear[$t] = "S,0,0";           # 2018-12-10
$t++; $ear[$t] = "E,0,807";         # 2018-12-10
  $psi=807; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 636=CONCERNING -- 2018-11-11: as a preposition for EnPrep() module
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()
$t++; $ear[$t] = "C,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "C,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "G,0,636";         # 2018-11-15: among 100 innate prepositions.
  $psi=636; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 808=CONNECT -- 2018-12-10: computer word
$t++; $ear[$t] = "C,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-12-10
$t++; $ear[$t] = "N,0,0";           # 2018-12-10
$t++; $ear[$t] = "N,0,0";           # 2018-12-10
$t++; $ear[$t] = "E,0,0";           # 2018-12-10
$t++; $ear[$t] = "C,0,0";           # 2018-12-10
$t++; $ear[$t] = "T,0,808";         # 2018-12-10
  $psi=808; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 811=COULD -- 2018-12-10: auxiliary verb for EnAuxVerb
$t++; $ear[$t] = "C,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-12-10
$t++; $ear[$t] = "U,0,0";           # 2018-12-10
$t++; $ear[$t] = "L,0,0";           # 2018-12-10
$t++; $ear[$t] = "D,0,811";         # 2018-12-10
  $psi=811; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: past tense
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 812=COME -- 2018-12-10: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "C,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-12-10
$t++; $ear[$t] = "M,0,0";           # 2018-12-10
$t++; $ear[$t] = "E,0,812";         # 2018-12-10
  $psi=812; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 813=DARE -- 2018-12-10: auxiliary verb
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-10
$t++; $ear[$t] = "R,0,0";           # 2018-12-10
$t++; $ear[$t] = "E,0,813";         # 2018-12-10
  $psi=813; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # DATA -- always plural noun in correction of modern usage
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-09-10
$t++; $ear[$t] = "T,0,0";           # 2018-09-10
$t++; $ear[$t] = "A,0,599";         # 2018-09-10
  $psi=599; $hlc=1; $pos=5; $num=2; $mfn=3; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 814=DELETE -- 2018-12-10: verb for computers
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-10
$t++; $ear[$t] = "L,0,0";           # 2018-12-10
$t++; $ear[$t] = "E,0,0";           # 2018-12-10
$t++; $ear[$t] = "T,0,0";           # 2018-12-10
$t++; $ear[$t] = "E,0,813";         # 2018-12-10
  $psi=813; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 637=DESPITE -- 2018-11-11: preposition for EnPrep() module
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "P,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,637";         # 2018-11-15: among 100 innate prepositions.
  $psi=637; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 815=DESTROY -- 2018-12-10: like opposite of MAKE
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-10
$t++; $ear[$t] = "S,0,0";           # 2018-12-10
$t++; $ear[$t] = "T,0,0";           # 2018-12-10
$t++; $ear[$t] = "R,0,0";           # 2018-12-10
$t++; $ear[$t] = "O,0,0";           # 2018-12-10
$t++; $ear[$t] = "Y,0,815";         # 2018-12-10
  $psi=815; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 816=DID -- 2018-12-10: auxiliary verb for past tense
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-12-10
$t++; $ear[$t] = "D,0,816";         # 2018-12-10
  $psi=816; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: past tense
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 817=DIE -- 2018-12-10: verb for existential thought
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-12-10
$t++; $ear[$t] = "E,0,817";         # 2018-12-10
  $psi=817; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 818=DO -- 2018-12-10: infinitive form of verb essential for EnAuxVerb module
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,818";         # 2018-12-10
  $psi=818; $hlc=1; $pos=8; $num=0; $dba=0; KbLoad(); # 2018-12-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # DO -- 1st person singular I-form of auxiliary verb
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,818";         # 2018-12-10
  $psi=818; $hlc=1; $pos=8; $dba=1; $num=1; KbLoad(); # 2018-12-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # DO -- 2nd person singular YOU-form of auxiliary verb
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,818";         # 2018-12-10
  $psi=818; $hlc=1; $pos=8; $dba=2; $num=1; KbLoad(); # 2018-12-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # DO -- 1st person plural WE-form of auxiliary verb
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,818";         # 2018-12-10
  $psi=818; $hlc=1; $pos=8; $dba=1; $num=2; KbLoad(); # 2018-12-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # DO -- 2nd person plural YOU-form of auxiliary verb
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,818";         # 2018-12-10
  $psi=818; $hlc=1; $pos=8; $dba=2; $num=2; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # DO -- 3rd person plural THEY-form of auxiliary verb
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,818";         # 2018-12-10:
  $psi=818; $hlc=1; $pos=8; $dba=3; $num=2; KbLoad(); # 2018-12-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # DOCTOR -- for InFerence premise "Doctors play golf"; 2018-09-03
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-09-03: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-03
$t++; $ear[$t] = "C,0,0";           # 2018-09-03
$t++; $ear[$t] = "T,0,0";           # 2018-09-03
$t++; $ear[$t] = "O,0,0";           # 2018-09-03
$t++; $ear[$t] = "R,0,892";         # 2018-09-03
  $psi=892; $hlc=1; $mtx=0; $pos=5; $num=1; KbLoad();  # 2018-09-03: necessary items.
$t++;  # 2018-09-03: one blank time-point for sake of AudRecog()

  # DOES -- 3rd person singular HE-SHE-IT-form of auxiliary verb
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "S,0,818";         # 2018-12-10
  $psi=818; $hlc=1; $pos=8; $dba=3; $num=1; KbLoad(); # 2018-12-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # DOING -- high word-frequency verb participle
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "I,0,0";           # 2018-09-10
$t++; $ear[$t] = "N,0,0";           # 2018-09-10
$t++; $ear[$t] = "G,0,183";         # 2018-09-10
  $psi=183; $hlc=1; $pos=1; $dba=0; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 638=DOWN -- 2018-11-11: as a preposition for EnPrep() module
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "W,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,638";         # 2018-11-15: among 100 innate prepositions.
  $psi=638; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 819=DRINK -- 2018-12-10: common everyday verb
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "R,0,0";           # 2018-12-10
$t++; $ear[$t] = "I,0,0";           # 2018-12-10
$t++; $ear[$t] = "N,0,0";           # 2018-12-10
$t++; $ear[$t] = "K,0,819";         # 2018-12-10
  $psi=819; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 820=DROP -- 2018-12-10: verb for robotics
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "R,0,0";           # 2018-12-10
$t++; $ear[$t] = "O,0,0";           # 2018-12-10
$t++; $ear[$t] = "P,0,820";         # 2018-12-10
  $psi=820; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 639=DURING -- 2018-11-11: preposition for EnPrep() module
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()
$t++; $ear[$t] = "D,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "U,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "G,0,639";         # 2018-11-15: among 100 innate prepositions.
  $psi=639; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 821=EAT -- 2018-12-10: common everyday verb
$t++; $ear[$t] = "E,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-10
$t++; $ear[$t] = "T,0,821";         # 2018-12-10
  $psi=821; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # EIGHT -- 588 2019-11-04: noun for the $hap(tic) sensation of the numeric "8" key.
$t++; $ear[$t] = "E,0,0"; $rv = $t; # 2019-11-04: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2019-11-04
$t++; $ear[$t] = "G,0,0";           # 2019-11-04
$t++; $ear[$t] = "H,0,0";           # 2019-11-04
$t++; $ear[$t] = "T,0,588";         # 2019-11-04
  $psi=588; $hlc=1; $mtx=0; $pos=5; $dba=4; $num=0; $mfn=3; KbLoad();  # 2019-11-04
$t++;  # 2019-11-04: one blank time-point for sake of AudRecog()

  # 324=EITHER -- 2018-11-27: conjunction for multi-clause thought.
$t++; $ear[$t] = "E,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-11-27
$t++; $ear[$t] = "T,0,0";           # 2018-11-27
$t++; $ear[$t] = "H,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "R,0,324";         # 2018-11-27: among innate conjunctions.
  $psi=324; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: conceptual associative tags
$t++;  # 2018-11-27: one SPACE for sake of AudRecog()

  # ELSE -- adverb for machine reasoning logic; 2016feb08
$t++; $ear[$t] = "E,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "L,0,0";           # 2018-09-10
$t++; $ear[$t] = "S,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,266";         # 2018-09-10
  $psi=266; $hlc=1; $pos=2; KbLoad();  # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog

  # EVEN -- 2018-11-27: reserved for possible embedding as conjunction.

  # 640=EXCEPT -- 2018-11-11: preposition for EnPrep() module
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()
$t++; $ear[$t] = "E,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "X,0,0";           # 2018-11-15
$t++; $ear[$t] = "C,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "P,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,640";         # 2018-11-15: among 100 innate prepositions.
  $psi=640; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 822=FALL -- 2018-12-10: verb of motion: robotics
$t++; $ear[$t] = "F,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-10
$t++; $ear[$t] = "L,0,0";           # 2018-12-10
$t++; $ear[$t] = "L,0,822";         # 2018-12-10
  $psi=822; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 823=FEEL -- 2018-12-10: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "F,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-10
$t++; $ear[$t] = "E,0,0";           # 2018-12-10
$t++; $ear[$t] = "L,0,823";         # 2018-12-10
  $psi=823; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 824=FIND -- 2018-12-10: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "F,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-12-10
$t++; $ear[$t] = "N,0,0";           # 2018-12-10
$t++; $ear[$t] = "D,0,824";         # 2018-12-10
  $psi=824; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # 825=FINISH -- 2018-12-10: verb important for planning
$t++; $ear[$t] = "F,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-12-10
$t++; $ear[$t] = "N,0,0";           # 2018-12-10
$t++; $ear[$t] = "I,0,0";           # 2018-12-10
$t++; $ear[$t] = "S,0,0";           # 2018-12-10
$t++; $ear[$t] = "H,0,825";         # 2018-12-10
  $psi=825; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # FIVE -- 545 2019-11-04: noun for the $hap(tic) sensation of the numeric "5" key.
$t++; $ear[$t] = "F,0,0"; $rv = $t; # 2019-11-04: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2019-11-04
$t++; $ear[$t] = "V,0,0";           # 2019-11-04
$t++; $ear[$t] = "E,0,545";         # 2019-11-04
  $psi=545; $hlc=1; $mtx=0; $pos=5; $dba=4; $num=0; $mfn=3; KbLoad();  # 2019-11-04
$t++;  # 2019-11-04: one blank time-point for sake of AudRecog()

  # FOR -- preposition for EnPrep module
$t++; $ear[$t] = "F,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,641";         # 2018-11-11
  $psi=641; $hlc=1; $pos=6; KbLoad(); # 2018-11-11: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 826=FORGET -- 2018-12-10: verb for cognition
$t++; $ear[$t] = "F,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-12-10
$t++; $ear[$t] = "R,0,0";           # 2018-12-10
$t++; $ear[$t] = "G,0,0";           # 2018-12-10
$t++; $ear[$t] = "E,0,0";           # 2018-12-10
$t++; $ear[$t] = "T,0,826";         # 2018-12-10
  $psi=826; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # FOUR -- 544 2019-11-04: noun for the $hap(tic) sensation of the numeric "4" key.
$t++; $ear[$t] = "F,0,0"; $rv = $t; # 2019-11-04: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2019-11-04
$t++; $ear[$t] = "U,0,0";           # 2019-11-04
$t++; $ear[$t] = "R,0,544";         # 2019-11-04
  $psi=544; $hlc=1; $mtx=0; $pos=5; $dba=4; $num=0; $mfn=3; KbLoad();  # 2019-11-04
$t++;  # 2019-11-04: one blank time-point for sake of AudRecog()

  # FRIEND -- for coding assignment of ad-hoc gender tags
$t++; $ear[$t] = "F,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "R,0,0";           # 2018-09-10
$t++; $ear[$t] = "I,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "N,0,0";           # 2018-09-10
$t++; $ear[$t] = "D,0,517";         # 2018-09-10
  $psi=517; $hlc=1; $pos=5; $num=1; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # FROM -- preposition (26th most frequent word) for EnPrep module; 2016mar02
$t++; $ear[$t] = "F,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "R,0,0";           # 2018-09-10
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "M,0,642";         # 2018-11-11: among 100 innate prepositions.
  $psi=642; $hlc=1; $pos=6; $dba=0; KbLoad(); # 2018-11-11: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 827=GET -- 2018-12-10: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "G,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-10
$t++; $ear[$t] = "T,0,827";         # 2018-12-10
  $psi=827; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-10: one blank time-point for sake of AudRecog()

  # GIRL -- always feminine noun for use with gender flags )
$t++; $ear[$t] = "G,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,0";           # 2018-09-10
$t++; $ear[$t] = "L,0,510";         # 2018-09-10
  $psi=510; $hlc=1; $pos=5; $num=1; $mfn=2; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 828=GIVE -- 2018-12-10: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "G,0,0"; $rv = $t; # 2018-09-02: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-09-02
$t++; $ear[$t] = "V,0,0";           # 2018-09-02
$t++; $ear[$t] = "E,0,828";         # 2018-12-10
  $psi=828; $hlc=1; $pos=8; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-09-02: one blank time-point for sake of AudRecog()

  # 829=GO -- 2018-12-10: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "G,0,0"; $rv = $t; # 2018-09-02: anticipate KbLoad.
$t++; $ear[$t] = "O,0,829";         # 2018-12-10
  $psi=829; $hlc=1; $pos=8; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-09-02: one blank time-point for sake of AudRecog()

  # GOAL -- 2019-08-09: #532 important noun for volition and AI in general.
$t++; $ear[$t] = "G,0,0"; $rv = $t; # 2019-08-09: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2019-08-09
$t++; $ear[$t] = "A,0,0";           # 2019-08-09
$t++; $ear[$t] = "L,0,532";         # 2019-08-09
  $psi=532; $hlc=1; $pos=5; $num=1; $mfn=3; KbLoad(); # 2019-08-09: flag-panel
$t++;  # 2019-08-09: one blank time-point for sake of AudRecog()

  # GOD -- masculine noun important for philosophy of AI
$t++; $ear[$t] = "G,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "D,0,533";         # 2018-09-10
  $psi=533; $hlc=1; $pos=5; $num=1; $mfn=1; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # GOLF -- for InFerence premise "Doctors play golf"; 2018-09-03
$t++; $ear[$t] = "G,0,0"; $rv = $t; # 2018-09-03: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-03
$t++; $ear[$t] = "L,0,0";           # 2018-09-03
$t++; $ear[$t] = "F,0,518";         # 2018-09-03
  $psi=518; $hlc=1; $mtx=0; $pos=5; $num=1; KbLoad();  # 2018-09-03: necessary items.
$t++;  # 2018-09-03: one blank time-point for sake of AudRecog()

  # GOOD -- adjective for EnAdjective module
$t++; $ear[$t] = "G,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "D,0,134";         # 2019-10-13
  $psi=134; $hlc=1; $pos=1; KbLoad(); # 2019-10-13: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 830=GOT -- 2018-12-10: frequent word used in multiple ways
$t++; $ear[$t] = "G,0,0"; $rv = $t; # 2018-12-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-12-10
$t++; $ear[$t] = "T,0,830";         # 2018-12-10
  $psi=830; $hlc=1; $pos=8; KbLoad(); # 2018-12-10: simple past of "GET"
$t++;  # 2018-09-02: one blank time-point for sake of AudRecog()

  # 831=GROK -- 2018-12-11: verb for cognition
$t++; $ear[$t] = "G,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "R,0,0";           # 2018-12-11
$t++; $ear[$t] = "O,0,0";           # 2018-12-11
$t++; $ear[$t] = "K,0,831";         # 2018-12-11
  $psi=831; $hlc=1; $pos=8; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 832=HAD -- 2018-12-11: almost an axiliary verb
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "D,0,832";         # 2018-12-11
  $psi=832; $hlc=1; $pos=8; KbLoad(); # 2018-12-10: past tense
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # HAS -- high word-frequency irregular verb form
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-09-10
$t++; $ear[$t] = "S,0,834";         # 2018-12-10
  $psi=834; $hlc=1; $pos=8; $dba=3; $num=1; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 833=HATE -- 2018-12-11: verb for Emotion(); opposite of LOVE
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "T,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,833";         # 2018-12-11
  $psi=833; $hlc=1; $pos=8; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 834=HAVE -- 2018-12-11: irregular high word-frequency verb
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-09-10
$t++; $ear[$t] = "V,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,834";         # 2018-12-10
  $psi=834; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # HE -- nominative form of high word-frequency pronoun
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,713";         # 2018-09-10
  $psi=713; $hlc=1; $pos=7; $dba=1; $num=1; $mfn=1; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 835=HEAR -- 2018-12-11: verb important for Audition() and robotics
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "R,0,835";         # 2018-12-11
  $psi=835; $hlc=1; $pos=8; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # HELLO -- interjection for human-computer interaction
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "L,0,0";           # 2018-09-10
$t++; $ear[$t] = "L,0,0";           # 2018-09-10
$t++; $ear[$t] = "O,0,450";         # 2018-09-10
  $psi=450; $hlc=1; $pos=4; KbLoad(); # 2018-09-10: essential flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 836=HELP -- 2018-12-11: socially significant common verb
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,0";           # 2018-12-11
$t++; $ear[$t] = "P,0,836";         # 2018-12-11
  $psi=836; $hlc=1; $pos=8; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # HER -- dative indirect-object form of pers. pron. 2016feb08
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,719";         # 2018-09-10
  $psi=719; $hlc=1; $pos=7; $dba=3; $num=1; $mfn=2; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # HER -- accusative direct-object form of pers. pron. 2016feb08
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,719";         # 2018-09-10
  $psi=719; $hlc=1; $pos=7; $dba=4; $num=1; $mfn=2; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # HERE -- adverb for discussion of physical location
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,201";         # 2018-09-10
  $psi=201; $hlc=1; $pos=2; KbLoad(); # 2018-09-10: essential flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # HERS -- genitive form of personal pronoun; 2016feb08
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,0";           # 2018-09-10
$t++; $ear[$t] = "S,0,719";         # 2018-09-10
  $psi=719; $hlc=1; $pos=7; $dba=2; $num=1; $mfn=0; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # HIM -- dative indirect-object form of personal pronoun
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-09-10
$t++; $ear[$t] = "M,0,713";         # 2018-09-10
  $psi=713; $hlc=1; $pos=7; $dba=3; $num=1; $mfn=1; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # HIM -- accusative direct-object form of personal pronoun
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-09-10
$t++; $ear[$t] = "M,0,713";         # 2018-09-10
  $psi=713; $hlc=1; $pos=7; $dba=4; $num=1; $mfn=1; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # HIS -- genitive form of personal pronoun
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-09-10
$t++; $ear[$t] = "S,0,113";         # 2018-09-10
  $psi=113; $hlc=1; $pos=1; $dba=2; $num=0; $mfn=1; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # HOW -- adverb for EnAdverb module
$t++; $ear[$t] = "H,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "W,0,226";         # 2018-09-10
  $psi=226; $hlc=1; $pos=2; KbLoad(); # 2018-09-10: essential flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # I -- nominative subject-form of personal pronoun; 2016feb08
$t++; $ear[$t] = "I,0,701"; $rv = $t; # 2018-09-09: anticipate KbLoad.
  $psi=701; $hlc=1; $pos=7; $dba=1; $num=1; KbLoad(); # 2018-09-09: parameters
$t++;  # 2018-09-09: one blank time-point for sake of AudRecog()

  # 327=IF -- 2018-11-27: conjunction for machine reasoning logic
$t++; $ear[$t] = "I,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "F,0,327";         # 2018-11-27
  $psi=327; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: conceptual associative tags
$t++;  # 2018-11-27: one SPACE for sake of AudRecog()

  # 837=IMAGINE -- 2018-12-11: verb for cognition
$t++; $ear[$t] = "I,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "M,0,0";           # 2018-12-11
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "G,0,0";           # 2018-12-11
$t++; $ear[$t] = "I,0,0";           # 2018-12-11
$t++; $ear[$t] = "N,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,837";         # 2018-12-11
  $psi=837; $hlc=1; $pos=8; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # IN -- preposition for EnPrep module
$t++; $ear[$t] = "I,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "N,0,643";         # 2018-11-11
  $psi=643; $hlc=1; $pos=6; KbLoad(); # 2018-11-11: essential flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 330=INASMUCH...AS -- 2018-11-27: hold as conjunction

  # 644=INCLUDING -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "I,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "C,0,0";           # 2018-11-15
$t++; $ear[$t] = "L,0,0";           # 2018-11-15
$t++; $ear[$t] = "U,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "G,0,644";         # 2018-11-15: among 100 innate prepositions.
  $psi=644; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 645=INSIDE -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "I,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,645";         # 2018-11-15: among 100 innate prepositions.
  $psi=645; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 646=INTO -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "I,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,646";         # 2018-11-15: among 100 innate prepositions.
  $psi=646; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # IS -- 3rd person singular HE-SHE-IT-form of 800=BE; 2016feb07
$t++; $ear[$t] = "I,0,0"; $rv = $t; # 2018-09-09: anticipate KbLoad.
$t++; $ear[$t] = "S,0,800";         # 2018-09-09
  $psi=800; $hlc=1; $pos=8; $dba=3; $num=1; KbLoad();  # 2018-09-09: essentials
$t++;  # 2018-09-09: one blank time-point for sake of AudRecog()

  # IT -- nominative subject-form of personal pronoun; 2016feb08
$t++; $ear[$t] = "I,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "T,0,725";         # 2018-09-10
  $psi=725; $hlc=1; $pos=7; $dba=1; $num=1; $mfn=3; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # IT -- dative indirect-object form of personal pronoun; 2016feb08
$t++; $ear[$t] = "I,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "T,0,725";         # 2018-09-10
  $psi=725; $hlc=1; $pos=7; $dba=3; $num=1; $mfn=3; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # IT -- accusative direct-object form of personal pronoun
$t++; $ear[$t] = "I,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "T,0,725";         # 2018-09-10
  $psi=725; $hlc=1; $pos=7; $dba=4; $num=1; $mfn=3; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # ITS -- genitive form of personal pronoun; 2016feb08
$t++; $ear[$t] = "I,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "T,0,0";           # 2018-09-10
$t++; $ear[$t] = "S,0,725";         # 2018-09-10
  $psi=725; $hlc=1; $pos=7; $dba=2; $num=1; $mfn=3; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # JOHN -- No. 504 2019-08-10: useful name for input-testing.
$t++; $ear[$t] = "J,0,0"; $rv = $t; # 2019-08-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2019-08-10
$t++; $ear[$t] = "H,0,0";           # 2019-08-10
$t++; $ear[$t] = "N,0,504";         # 2019-08-10
  $psi=504; $hlc=1; $mtx=0; $pos=5; $dba=1; $num=1; $mfn=1; KbLoad();  # 2019-08-10
$t++;  # 2019-08-10: one blank time-point for sake of AudRecog()

  # 838=KNOW -- 2018-12-11: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "K,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "N,0,0";           # 2018-09-10
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "W,0,838";         # 2018-12-10
  $psi=838; $hlc=1; $jux=0; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 839=LEARN -- 2018-12-11: verb for cognition
$t++; $ear[$t] = "L,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "R,0,0";           # 2018-12-11
$t++; $ear[$t] = "N,0,839";         # 2018-12-11
  $psi=839; $hlc=1; $pos=8; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 840=LEAVE -- 2018-12-11: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "L,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "V,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,840";         # 2018-12-11
  $psi=840; $hlc=1; $pos=8; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 841=LEND -- 2018-12-11: verb for dative and accusative
$t++; $ear[$t] = "L,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "N,0,0";           # 2018-12-11
$t++; $ear[$t] = "D,0,841";         # 2018-12-11
  $psi=841; $hlc=1; $pos=8; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 647=LESS -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "L,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,647";         # 2018-11-15: among 100 innate prepositions.
  $psi=647; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 333=LEST -- 2018-11-27: conjunction for multi-clause thought.
$t++; $ear[$t] = "L,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "S,0,0";           # 2018-11-27
$t++; $ear[$t] = "T,0,333";         # 2018-11-27: among innate conjunctions.
  $psi=333; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: conceptual associative tags
$t++;  # 2018-11-27: one SPACE for sake of AudRecog()

  # 648=LIKE -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "L,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "K,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,648";         # 2018-11-15: among 100 innate prepositions.
  $psi=648; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 842=LIVE-- 2018-12-11: verb important for life
$t++; $ear[$t] = "L,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-11-27
$t++; $ear[$t] = "V,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,842";         # 2018-12-11
  $psi=842; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-11-27: infinitive
$t++;  # 2018-11-27: one SPACE for sake of AudRecog()

  # 843=LOAN -- 2018-12-11: verb for dative and accusative
$t++; $ear[$t] = "L,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-12-11
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "N,0,843";         # 2018-12-11
  $psi=843; $hlc=1; $pos=8; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 844=LOOK -- 2018-12-11: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "L,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-12-11
$t++; $ear[$t] = "O,0,0";           # 2018-12-11
$t++; $ear[$t] = "K,0,844";         # 2018-12-11
  $psi=844; $hlc=1; $pos=8; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 845=LOVE -- 2018-12-11: verb for Emotion(); opposite of HATE
$t++; $ear[$t] = "L,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-12-11
$t++; $ear[$t] = "V,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,845";         # 2018-12-11
  $psi=845; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 846=MAKE -- 2018-12-11: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "K,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,846";         # 2018-12-11
  $psi=846; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # MAN -- always masculine noun for use with gender flags
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-09-10
$t++; $ear[$t] = "N,0,543";         # 2018-09-10
  $psi=543; $hlc=1; $pos=5; $dba=0; $num=1; $mfn=1; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 847=MAY -- 2018-12-11: auxiliary modal verb
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "Y,0,847";         # 2018-12-11
  $psi=847; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # MAYBE -- adverb response as alternative to YES or NO
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-09-10
$t++; $ear[$t] = "Y,0,0";           # 2018-09-10
$t++; $ear[$t] = "B,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,230";         # 2018-09-10
  $psi=230; $hlc=1; $pos=2; $dba=0; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # ME -- dative indirect-object form of personal pronoun; 2016feb08
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,701";         # 2018-09-10
  $psi=701; $hlc=1; $pos=7; $dba=3; $num=1; $mfn=0; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # ME -- accusative direct-object form of personal pronoun
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,701";         # 2018-09-10
  $psi=701; $hlc=1; $pos=7; $dba=4; $num=1; $mfn=0; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # MEDIA -- always plural noun in correction of modern usage
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "D,0,0";           # 2018-09-10
$t++; $ear[$t] = "I,0,0";           # 2018-09-10
$t++; $ear[$t] = "A,0,584";         # 2018-09-10
  $psi=584; $hlc=1; $pos=5; $dba=0; $num=2; $mfn=3; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # MEN -- irregular plural for retrieval by parameters
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "N,0,543";         # 2018-09-10
  $psi=543; $hlc=1; $pos=5; $dba=0; $num=2; $mfn=1; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 848=MIGHT -- 2018-12-11: auxiliary verb
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-12-11
$t++; $ear[$t] = "G,0,0";           # 2018-12-11
$t++; $ear[$t] = "H,0,0";           # 2018-12-11
$t++; $ear[$t] = "T,0,848";         # 2018-12-11
  $psi=848; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # MINE -- genitive form of personal pronoun; 2016feb08
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-09-10
$t++; $ear[$t] = "N,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,701";         # 2018-09-10
  $psi=701; $hlc=1; $pos=7; $dba=2; $num=0; $mfn=0; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 649=MINUS -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "U,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,649";         # 2018-11-15: among 100 innate prepositions.
  $psi=649; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 650=MODULO -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,0";           # 2018-11-15
$t++; $ear[$t] = "U,0,0";           # 2018-11-15
$t++; $ear[$t] = "L,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,650";         # 2018-11-15: among 100 innate prepositions.
  $psi=650; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 563=MONEY -- 2019-08-06: "money" as nominative subject noun
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2019-08-06: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2019-08-06
$t++; $ear[$t] = "N,0,0";           # 2019-08-06
$t++; $ear[$t] = "E,0,563";         # 2019-08-06
$t++; $ear[$t] = "Y,0,563";         # 2019-08-06
  $psi=563; $hlc=1; $pos=5; $dba=1; $num=1; $mfn=0; KbLoad(); # 2019-08-06: flag-panel
$t++;  # 2019-08-06: one blank time-point for sake of AudRecog()

  # 563=MONEY -- 2019-08-06: "money" as accusative noun
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2019-08-06: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2019-08-06
$t++; $ear[$t] = "N,0,0";           # 2019-08-06
$t++; $ear[$t] = "E,0,563";         # 2019-08-06
$t++; $ear[$t] = "Y,0,563";         # 2019-08-06
  $psi=563; $hlc=1; $pos=5; $dba=4; $num=1; $mfn=0; KbLoad(); # 2019-08-06: flag-panel
$t++;  # 2019-08-06: one blank time-point for sake of AudRecog()

  # 849=MOVE -- 2018-12-11: motion verb for Motorium() and robotics
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-12-11
$t++; $ear[$t] = "V,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,849";         # 2018-12-11
  $psi=849; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 850=MUST -- 2018-12-11: auxiliary modal verb
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "U,0,0";           # 2018-12-11
$t++; $ear[$t] = "S,0,0";           # 2018-12-11
$t++; $ear[$t] = "T,0,850";         # 2018-12-11
  $psi=850; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: present tense
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # MY -- adjective for personal pronoun "I"; 2016feb08
$t++; $ear[$t] = "M,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "Y,0,181";         # 2018-09-10
  $psi=181; $hlc=1; $pos=1; $dba=0; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 851=NEED -- 2018-12-11: sometimes used as an auxiliary verb
$t++; $ear[$t] = "N,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "D,0,851";         # 2018-12-11
  $psi=851; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 336=NEITHER -- 2018-11-27: conjunction for multi-clause thought.
$t++; $ear[$t] = "N,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "I,0,0";           # 2018-11-27
$t++; $ear[$t] = "T,0,0";           # 2018-11-27
$t++; $ear[$t] = "H,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "R,0,336";         # 2018-11-27: among innate conjunctions.
  $psi=336; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: conceptual associative tags
$t++;  # 2018-11-27: one SPACE for sake of AudRecog()

  # NO -- interjection for human-computer interaction
$t++; $ear[$t] = "N,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,404";         # 2018-09-10
  $psi=404; $hlc=1; $pos=4; $dba=0; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 651=NEAR -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "N,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "A,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,651";         # 2018-11-15: among 100 innate prepositions.
  $psi=651; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 652=NEARER -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "N,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "A,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,652";         # 2018-11-15: among 100 innate prepositions.
  $psi=652; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 653=NEAREST -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "N,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "A,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,653";         # 2018-11-15: among 100 innate prepositions.
  $psi=653; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 654=NEXT (TO) -- 2018-11-11: as a preposition for EnPrep() module

  # NINE -- 559 2019-11-04: noun for the $hap(tic) sensation of the numeric "9" key.
$t++; $ear[$t] = "N,0,0"; $rv = $t; # 2019-11-04: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2019-11-04
$t++; $ear[$t] = "N,0,0";           # 2019-11-04
$t++; $ear[$t] = "E,0,559";         # 2019-11-04
  $psi=559; $hlc=1; $mtx=0; $pos=5; $dba=4; $num=0; $mfn=3; KbLoad();  # 2019-11-04
$t++;  # 2019-11-04: one blank time-point for sake of AudRecog()

  # 339=NOR -- 2018-11-27: conjunction for multi-clause thought.
$t++; $ear[$t] = "N,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-11-27
$t++; $ear[$t] = "R,0,339";         # 2018-11-27: among innate conjunctions.
  $psi=339; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: conceptual associative tags
$t++; # 2018-11-27: one SPACE for sake of AudRecog()

  # NOT -- for machine reasoning logic
$t++; $ear[$t] = "N,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "T,0,250";         # 2018-09-10
  $psi=250; $hlc=1; $pos=2; $dba=0; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # NOTHING --  VisRecog default for what the AI Mind sees
$t++; $ear[$t] = "N,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "T,0,0";           # 2018-09-10
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "I,0,0";           # 2018-09-10
$t++; $ear[$t] = "N,0,0";           # 2018-09-10
$t++; $ear[$t] = "G,0,760";         # 2018-09-10
  $psi=760; $hlc=1; $pos=7; $dba=0; $num=1; $mfn=3; KbLoad();  # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 238=NOW -- 2018-11-27: adverb
  # 342=NOW -- 2018-11-27: conjunction

  # OF -- preposition for EnPrep module
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "F,0,655";         # 2018-11-11
  $psi=655; $hlc=1; $pos=6; $dba=0; KbLoad();  # 2018-11-11: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 656=OFF -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "F,0,0";           # 2018-11-15
$t++; $ear[$t] = "F,0,656";         # 2018-11-15: among 100 innate prepositions.
  $psi=656; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 852=OFFER -- 2018-12-11: verb for dative and accusative
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "F,0,0";           # 2018-12-11
$t++; $ear[$t] = "F,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "R,0,852";         # 2018-12-11
  $psi=852; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # ON -- preposition (17th most frequent word) for EnPrep module; 2016mar02
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "N,0,657";         # 2018-11-11: among 100 innate prepositions.
  $psi=657; $hlc=1; $pos=6; $dba=0; KbLoad(); # 2018-11-11: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # ONE -- 551 2019-11-02: noun for the $hap(tic) sensation of the numeric "1" key.
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2019-11-02: anticipate KbLoad.
$t++; $ear[$t] = "N,0,0";           # 2019-11-02
$t++; $ear[$t] = "E,0,551";         # 2019-11-02
  $psi=551; $hlc=1; $mtx=0; $pos=5; $dba=4; $num=1; $mfn=3; KbLoad();  # 2019-11-02
$t++;  # 2019-11-02: one blank time-point for sake of AudRecog()

  # 345=ONCE -- 2018-11-27: conjunction for multi-clause thought.
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "N,0,0";           # 2018-11-27
$t++; $ear[$t] = "C,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,345";         # 2018-11-27: among innate conjunctions.
  $psi=345; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: conceptual associative tags
$t++;  # 2018-11-27: one SPACE for sake of AudRecog()

  # 658=ONTO -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,658";         # 2018-11-15: among 100 innate prepositions.
  $psi=658; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 659=OPPOSITE -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "P,0,0";           # 2018-11-15
$t++; $ear[$t] = "P,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,659";         # 2018-11-15: among 100 innate prepositions.
  $psi=659; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 348=OR -- 2018-11-27: conjunction for machine reasoning logic
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "R,0,348";         # 2018-11-27:
  $psi=348; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: conceptual associative tags
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 853=OUGHT -- 2018-12-11: like a subjunctive verb
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "U,0,0";           # 2018-12-11
$t++; $ear[$t] = "G,0,0";           # 2018-12-11
$t++; $ear[$t] = "H,0,0";           # 2018-12-11
$t++; $ear[$t] = "T,0,853";         # 2018-12-11
  $psi=853; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: subjunctive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # OUR -- adjective for personal pronoun "WE"; 2016feb08
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "U,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,186";         # 2018-09-10
  $psi=186; $hlc=1; $pos=1; $dba=0; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # OURS -- genitive form of personal pronoun; 2016feb08
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "U,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,0";           # 2018-09-10
$t++; $ear[$t] = "S,0,731";         # 2018-09-10
  $psi=731; $hlc=1; $pos=7; $dba=2; $num=0; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 660=OUT -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "U,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,660";         # 2018-11-15: among 100 innate prepositions.
  $psi=660; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # OUTSIDE -- 2018-11-08: preposition for EnPrep module
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-11-08: anticipate KbLoad.
$t++; $ear[$t] = "U,0,0";           # 2018-11-08
$t++; $ear[$t] = "T,0,0";           # 2018-11-08
$t++; $ear[$t] = "S,0,0";           # 2018-11-08
$t++; $ear[$t] = "I,0,0";           # 2018-11-08
$t++; $ear[$t] = "D,0,0";           # 2018-11-08
$t++; $ear[$t] = "E,0,662";         # 2018-11-11
  $psi=662; $hlc=1; $pos=6; KbLoad(); # 2018-11-11: flag-panel
$t++;  # 2018-11-08: one blank time-point for sake of AudRecog()

  # 663=OVER -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-11-08: anticipate KbLoad.
$t++; $ear[$t] = "V,0,0";           # 2018-11-08
$t++; $ear[$t] = "E,0,0";           # 2018-11-08
$t++; $ear[$t] = "R,0,663";         # 2018-11-11
  $psi=663; $hlc=1; $pos=6; KbLoad(); # 2018-11-11: flag-panel
$t++;  # 2018-11-08: one blank time-point for sake of AudRecog()

  # 854=OWE -- 2018-12-11: verb for dative and accusative
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "W,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,854";         # 2018-12-11
  $psi=854; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 855=OWN -- 2018-12-11: verb for personhood
$t++; $ear[$t] = "O,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "W,0,0";           # 2018-12-11
$t++; $ear[$t] = "N,0,855";         # 2018-12-11
  $psi=855; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 664=PACE -- 2018-11-11: Latin as a preposition for EnPrep() module
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-11-08: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-11-08
$t++; $ear[$t] = "C,0,0";           # 2018-11-08
$t++; $ear[$t] = "E,0,664";         # 2018-11-11
  $psi=664; $hlc=1; $pos=6; KbLoad(); # 2018-11-11: flag-panel
$t++;  # 2018-11-08: one blank time-point for sake of AudRecog()

  # 665=PAST -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,665";         # 2018-11-15
  $psi=665; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 856=PAY -- 2018-12-11: verb for dative and accusative
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "Y,0,856";         # 2018-12-11
  $psi=856; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # PEOPLE -- establish as plural for EnParser
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "P,0,0";           # 2018-09-10
$t++; $ear[$t] = "L,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,587";         # 2018-09-10
  $psi=587; $hlc=1; $pos=5; $dba=0; $num=2; $mfn=0; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 666=PER -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,666";         # 2018-11-15
  $psi=666; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # PERSON -- for ad-hoc gender tags and robot philosophy
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,0";           # 2018-09-10
$t++; $ear[$t] = "S,0,0";           # 2018-09-10
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "N,0,537";         # 2018-09-10
  $psi=537; $hlc=1; $jux=0; $pos=5; $num=1; $mfn=0; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 857=PICK -- 2018-12-11: verb for Volition(); robotics, etc.
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-12-11
$t++; $ear[$t] = "C,0,0";           # 2018-12-11
$t++; $ear[$t] = "K,0,857";         # 2018-12-11
  $psi=857; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 858=PLACE -- 2018-12-11: verb for robotics
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "L,0,0";           # 2018-12-11
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "C,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,858";         # 2018-12-11
  $psi=858; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 859=PLAY -- 2018-12-11: common useful verb
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-09-03: anticipate KbLoad.
$t++; $ear[$t] = "L,0,0";           # 2018-09-03
$t++; $ear[$t] = "A,0,0";           # 2018-09-03
$t++; $ear[$t] = "Y,0,859";         # 2018-12-10
  $psi=859; $hlc=1; $pos=8; KbLoad();  # 2018-12-11: infinitive
$t++;  # 2018-09-03: one blank time-point for sake of AudRecog()

  # PLEASE -- interjection for human-computer interaction
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "L,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "A,0,0";           # 2018-09-10
$t++; $ear[$t] = "S,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,410";         # 2018-09-10
  $psi=410; $hlc=1; $pos=4; $dba=0; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 667=PLUS -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "L,0,0";           # 2018-11-15
$t++; $ear[$t] = "U,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,667";         # 2018-11-15
  $psi=667; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 668=POST -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,668";         # 2018-11-15
  $psi=668; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 669=PRO -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,669";         # 2018-11-15
  $psi=669; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 860=PROMISE -- 2018-12-11: verb for dative and accusative
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "R,0,0";           # 2018-12-11
$t++; $ear[$t] = "O,0,0";           # 2018-12-11
$t++; $ear[$t] = "M,0,0";           # 2018-12-11
$t++; $ear[$t] = "I,0,0";           # 2018-12-11
$t++; $ear[$t] = "S,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,860";         # 2018-12-11
  $psi=860; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 351=PROVIDED -- 2018-11-27: conjunction for multi-clause thought.
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "R,0,0";           # 2018-11-27
$t++; $ear[$t] = "O,0,0";           # 2018-11-27
$t++; $ear[$t] = "V,0,0";           # 2018-11-27
$t++; $ear[$t] = "I,0,0";           # 2018-11-27
$t++; $ear[$t] = "D,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "D,0,351";         # 2018-11-27: among innate conjunctions.
  $psi=351; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: conceptual associative tags
$t++;  # 2018-11-27: one SPACE for sake of AudRecog()

  # 861=PUT -- 2018-12-11: verb robotics, etc.
$t++; $ear[$t] = "P,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "U,0,0";           # 2018-12-11
$t++; $ear[$t] = "T,0,861";         # 2018-12-11
  $psi=861; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 670=QUA -- 2018-11-11: Latin as a preposition for EnPrep() module
$t++; $ear[$t] = "Q,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad.
$t++; $ear[$t] = "U,0,0";           # 2018-11-15
$t++; $ear[$t] = "A,0,670";         # 2018-11-15
  $psi=670; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 862=QUIT -- 2018-12-11: verb for robotics; planning; software, etc.
$t++; $ear[$t] = "Q,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "U,0,0";           # 2018-12-11
$t++; $ear[$t] = "I,0,0";           # 2018-12-11
$t++; $ear[$t] = "T,0,862";         # 2018-12-11
  $psi=862; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 671=RE -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "R,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "E,0,671";         # 2018-11-15
  $psi=671; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 863=READ -- 2018-12-11: dba=0 infinitive for sake of logical inference
$t++; $ear[$t] = "R,0,0"; $rv = $t; # 2018-10-08: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";    # 2018-10-08
$t++; $ear[$t] = "A,0,0";    # 2018-10-08
$t++; $ear[$t] = "D,0,863";  # 2018-12-10
  $psi=863; $hlc=1; $mtx=1825; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-10-08: one blank time-point for sake of AudRecog()

  # 864=RECOGNIZE -- 2018-12-11: verb for cognition
$t++; $ear[$t] = "R,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "C,0,0";           # 2018-12-11
$t++; $ear[$t] = "O,0,0";           # 2018-12-11
$t++; $ear[$t] = "G,0,0";           # 2018-12-11
$t++; $ear[$t] = "N,0,0";           # 2018-12-11
$t++; $ear[$t] = "I,0,0";           # 2018-12-11
$t++; $ear[$t] = "Z,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,864";         # 2018-12-11
  $psi=864; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 672=REGARDING -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "R,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "G,0,0";           # 2018-11-15
$t++; $ear[$t] = "A,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "G,0,672";         # 2018-11-15
  $psi=672; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 865=REMEMBER -- 2018-12-11: verb for cognition
$t++; $ear[$t] = "R,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "M,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "M,0,0";           # 2018-12-11
$t++; $ear[$t] = "B,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "R,0,865";         # 2018-12-11
  $psi=865; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 866=ROLL -- 2018-12-11: verb useful for robotics
$t++; $ear[$t] = "R,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,866";         # 2018-12-11
  $psi=866; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 673=ROUND -- 2018-11-11: alternative to "around" for EnPrep() module
$t++; $ear[$t] = "R,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "U,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,673";         # 2018-11-15
  $psi=673; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 867=RUN -- 2018-12-11: verb for robotics; computers; etc.
$t++; $ear[$t] = "R,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "U,0,0";           # 2018-12-11
$t++; $ear[$t] = "N,0,867";         # 2018-12-11
  $psi=867; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 868=SAID -- 2018-12-11: past tense of SAY
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "I,0,0";           # 2018-12-11
$t++; $ear[$t] = "D,0,868";         # 2018-12-11
  $psi=868; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: past tense
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 674=SANS -- 2018-11-11: French as if preposition for EnPrep() module
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "A,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,674";         # 2018-11-15
  $psi=674; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 675=SAVE -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "A,0,0";           # 2018-11-15
$t++; $ear[$t] = "V,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,675";         # 2018-11-15
  $psi=675; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 869=SAY -- 2018-12-11: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "Y,0,869";         # 2018-12-11
  $psi=869; $hlc=1; $pos=8; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 870=SEE -- 2018-12-11: lets VisRecog() report non-KB direct objects.
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,870";         # 2018-12-10
  $psi=870; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-09-10: infinitive
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 871=SEEK -- 2018-12-11: verb pertaining to Volition
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "K,0,871";         # 2018-12-10
  $psi=871; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-09-10: infinitive
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 872=SEEM -- 2018-12-11: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "M,0,872";         # 2018-12-10
  $psi=872; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-09-10: infinitive
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 873=SELL -- 2018-12-11: verb for dative and accusative
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,873";         # 2018-12-11
  $psi=873; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11 one blank time-point for sake of AudRecog()

  # 874=SEND -- 2018-12-11: verb for dative and accusative
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "N,0,0";           # 2018-12-11
$t++; $ear[$t] = "D,0,874";         # 2018-12-11
  $psi=874; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11 one blank time-point for sake of AudRecog()

  # SEVEN -- 577 2019-11-04: noun for the $hap(tic) sensation of the numeric "7" key.
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2019-11-04: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2019-11-04
$t++; $ear[$t] = "V,0,0";           # 2019-11-04
$t++; $ear[$t] = "E,0,0";           # 2019-11-04
$t++; $ear[$t] = "N,0,577";         # 2019-11-04
  $psi=577; $hlc=1; $mtx=0; $pos=5; $dba=4; $num=0; $mfn=3; KbLoad();  # 2019-11-04
$t++;  # 2019-11-04: one blank time-point for sake of AudRecog()

  # 875=SHALL -- 2018-12-11: modal verb
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-12-11
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,875";         # 2018-12-11
  $psi=875; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-11: present tense
$t++;  # 2018-12-11 one blank time-point for sake of AudRecog()

  # SHE -- nominative subject-form of personal pronoun; 2016feb08
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,719";         # 2018-09-10
  $psi=719; $hlc=1; $pos=7; $dba=1; $num=1; $mfn=2; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 676=SHORT -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "H,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,676";         # 2018-11-15
  $psi=676; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 876=SHOULD -- 2018-12-11: modal verb
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-12-11
$t++; $ear[$t] = "O,0,0";           # 2018-12-11
$t++; $ear[$t] = "U,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,0";           # 2018-12-11
$t++; $ear[$t] = "D,0,876";         # 2018-12-11
  $psi=876; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-11: subjunctive
$t++;  # 2018-12-11 one blank time-point for sake of AudRecog()

  # 877=SHOW -- 2018-12-11: verb for dative and accusative
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-12-11
$t++; $ear[$t] = "O,0,0";           # 2018-12-11
$t++; $ear[$t] = "W,0,877";         # 2018-12-11
  $psi=877; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11 one blank time-point for sake of AudRecog()

  # 354=SINCE -- 2018-11-27: conjunction for ConJoin() module
  # 677=SINCE -- 2018-11-11: preposition for EnPrep() module

  # SIX -- 566 2019-11-04: noun for the $hap(tic) sensation of the numeric "6" key.
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2019-11-04: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2019-11-04
$t++; $ear[$t] = "X,0,566";         # 2019-11-04
  $psi=566; $hlc=1; $mtx=0; $pos=5; $dba=4; $num=0; $mfn=3; KbLoad();  # 2019-11-04
$t++;  # 2019-11-04: one blank time-point for sake of AudRecog()

  # 878=SLEEP -- 2018-12-11: verb related to cognition
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "L,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "P,0,878";         # 2018-12-11
  $psi=878; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11 one blank time-point for sake of AudRecog()

  # 879=SMELL -- 2018-12-11: verb for Sensorium() and OlfRecog()
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "M,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,879";         # 2018-12-11
  $psi=879; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11 one blank time-point for sake of AudRecog()

  # 358=SO -- 2018-11-27: conjunction
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "O,0,358";         # 2018-11-27
  $psi=358; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: conceptual associative tags
$t++;  # 2018-11-27: one SPACE for sake of AudRecog()

  # SOME -- adjective for machine reasoning logic
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "M,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,154";         # 2019-10-13
  $psi=154; $hlc=1; $jux=0; $pos=1; $dba=0; $num=0; KbLoad(); # 2019-10-13
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 880=SPEAK -- 2018-12-11: common verb
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-10-20: anticipate KbLoad.
$t++; $ear[$t] = "P,0,0";           # 2018-10-20
$t++; $ear[$t] = "E,0,0";           # 2018-10-20
$t++; $ear[$t] = "A,0,0";           # 2018-10-20
$t++; $ear[$t] = "K,0,880";         # 2018-12-10
  $psi=880; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad();  # 2018-12-11: infinitive
$t++;  # 2018-10-20: one blank time-point for sake of AudRecog()

  # 881=STOP -- 2018-12-11: verb relevant to Motorium()
$t++; $ear[$t] = "S,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "T,0,0";           # 2018-12-11
$t++; $ear[$t] = "O,0,0";           # 2018-12-11
$t++; $ear[$t] = "P,0,881";         # 2018-12-11
  $psi=881; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad();  # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 882=TAKE -- 2018-12-11: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "K,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,882";         # 2018-12-11
  $psi=882; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad();  # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 883=TASTE -- 2018-12-11: verb for Sensorium() and GusRecog()
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "S,0,0";           # 2018-12-11
$t++; $ear[$t] = "T,0,0";           # 2018-12-11
$t++; $ear[$t] = "E,0,883";         # 2018-12-11
  $psi=883; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad();  # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 884=TEACH -- 2018-12-11: common verb
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "C,0,0";           # 2018-12-11
$t++; $ear[$t] = "H,0,884";         # 2018-12-11
  $psi=884; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad();  # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 885=TELL -- 2018-12-11: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,885";         # 2018-12-11
  $psi=885; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad();  # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 678=THAN -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "H,0,0";           # 2018-11-15
$t++; $ear[$t] = "A,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,678";         # 2018-11-15
  $psi=678; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 361=THAT -- 2018-11-27: conjunction for use with KNOW and THINK;
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-11-27
$t++; $ear[$t] = "A,0,0";           # 2018-11-27
$t++; $ear[$t] = "T,0,361";         # 2018-11-27
  $psi=361; $hlc=1; $pos=3; $dba=0; KbLoad(); # 2018-11-27: conceptual associative tags
$t++;  # 2018-11-27: one SPACE for sake of AudRecog()

  # THAT -- high word-frequency pronoun
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "A,0,0";           # 2018-09-10
$t++; $ear[$t] = "T,0,745";         # 2018-09-10
  $psi=745; $hlc=1; $pos=7; $dba=0; $num=1; $mfn=1; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # THE -- EnArticle highest-frequency English word; 2018-09-03
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-09-03: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-03
$t++; $ear[$t] = "E,0,117";         # 2018-09-03
  $psi=117; $hlc=1; $pos=1; KbLoad(); # 2018-09-03: necessary items.
$t++;  # 2018-09-03: one blank time-point for sake of AudRecog()

  # THEIR -- adjective for personal pronoun "THEY"; 2016feb08
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "I,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,188";         # 2018-09-10
  $psi=188; $hlc=1; $pos=1; $dba=0; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # THEN -- for machine reasoning logic
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "N,0,213";         # 2018-09-10
  $psi=213; $hlc=1; $pos=2; $dba=0; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # THERE -- adverb for discussion of physical location
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,274";         # 2018-09-10
  $psi=274; $hlc=1; $pos=2; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # THEIRS -- genitive form of personal pronoun; 2016feb08
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "I,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,0";           # 2018-09-10
$t++; $ear[$t] = "S,0,743";         # 2018-09-10
  $psi=743; $hlc=1; $pos=7; $dba=0; $num=0; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # THEM -- dative indirect-object form of pers. pron. 2016feb08
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "M,0,743";         # 2018-09-10
  $psi=743; $hlc=1; $pos=7; $dba=3; $num=2; $mfn=0; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # THEM -- acc. direct-object form of pers. pron. 2016feb08
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "M,0,743";         # 2018-09-10
  $psi=743; $hlc=1; $pos=7; $dba=4; $num=2; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # THEY -- nominative subject-form of pers. pronoun; 2016feb08
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "Y,0,743";         # 2018-09-10
  $psi=743; $hlc=1; $pos=7; $dba=1; $num=2; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 886=THINK -- 2018-12-11: germane to artificial intelligence
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "I,0,0";           # 2018-09-10
$t++; $ear[$t] = "N,0,0";           # 2018-09-10
$t++; $ear[$t] = "K,0,886";         # 2018-12-10
  $psi=886; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-10: infinitive
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 363=THOUGH -- 2018-11-27: conjunction for multi-clause thought.
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-11-27
$t++; $ear[$t] = "O,0,0";           # 2018-11-27
$t++; $ear[$t] = "U,0,0";           # 2018-11-27
$t++; $ear[$t] = "G,0,0";           # 2018-11-27
$t++; $ear[$t] = "H,0,363";         # 2018-11-27: among innate conjunctions
  $psi=363; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: flag-panel
$t++;  # 2018-11-15: one SPACE for sake of AudRecog()

  # THREE -- 583 2019-11-02: noun for the $hap(tic) sensation of the numeric "3" key.
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2019-11-02: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2019-11-02
$t++; $ear[$t] = "R,0,0";           # 2019-11-02
$t++; $ear[$t] = "E,0,0";           # 2019-11-02
$t++; $ear[$t] = "E,0,583";         # 2019-11-02
  $psi=583; $hlc=1; $mtx=0; $pos=5; $dba=4; $num=0; $mfn=3; KbLoad();  # 2019-11-02
$t++;  # 2019-11-02: one blank time-point for sake of AudRecog()

  # 679=THROUGH -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "H,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "U,0,0";           # 2018-11-15
$t++; $ear[$t] = "G,0,0";           # 2018-11-15
$t++; $ear[$t] = "H,0,679";         # 2018-11-15
  $psi=679; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 680=THROUGHOUT -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "H,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "U,0,0";           # 2018-11-15
$t++; $ear[$t] = "G,0,0";           # 2018-11-15
$t++; $ear[$t] = "H,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "U,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,680";         # 2018-11-15
  $psi=680; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 681=THRU -- 2018-11-11: abbreviation of preposition for EnPrep() module
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "H,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "U,0,681";         # 2018-11-15
  $psi=681; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 366=TILL -- 2018-11-27: conjunction for ConJoin() module
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad
$t++; $ear[$t] = "I,0,0";           # 2018-11-27
$t++; $ear[$t] = "L,0,0";           # 2018-11-27
$t++; $ear[$t] = "L,0,366";         # 2018-11-27
  $psi=366; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: conceptual associative tags
$t++;  # 2018-11-27: one SPACE for sake of AudRecog()

  # 682=TILL -- 2018-11-27: preposition for EnPrep() module
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "L,0,0";           # 2018-11-27
$t++; $ear[$t] = "L,0,682";         # 2018-11-27
  $psi=682; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # TO -- preposition (3rd most frequent word) for EnPrep module; 2016mar02
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,683";         # 2018-11-11: among 100 innate prepositions.
  $psi=683; $hlc=1; $pos=6; $dba=0; KbLoad(); # 2018-11-11: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 887=TOLD -- 2018-12-11: past tense of TELL
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,0";           # 2018-12-11
$t++; $ear[$t] = "D,0,887";         # 2018-12-11
  $psi=887; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-11: past tense
$t++;  # 2018-12-11 one blank time-point for sake of AudRecog()

  # 888=TOUCH -- 2018-12-11: verb for Sensorium() and TacRecog()
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-12-11
$t++; $ear[$t] = "U,0,0";           # 2018-12-11
$t++; $ear[$t] = "C,0,0";           # 2018-12-11
$t++; $ear[$t] = "H,0,888";         # 2018-12-11
  $psi=888; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11 one blank time-point for sake of AudRecog()

  # 684=TOWARD -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "W,0,0";           # 2018-11-15
$t++; $ear[$t] = "A,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,684";         # 2018-11-15
  $psi=684; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 685=TOWARDS -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "W,0,0";           # 2018-11-15
$t++; $ear[$t] = "A,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,685";         # 2018-11-15
  $psi=685; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 889=TRY -- 2018-12-11: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "R,0,0";           # 2018-12-11
$t++; $ear[$t] = "Y,0,889";         # 2018-12-11
  $psi=889; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11 one blank time-point for sake of AudRecog()

  # TWO -- 582 2019-11-02: noun for the $hap(tic) sensation of the numeric "2" key.
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2019-11-02: anticipate KbLoad.
$t++; $ear[$t] = "W,0,0";           # 2019-11-02
$t++; $ear[$t] = "O,0,582";         # 2019-11-02
  $psi=582; $hlc=1; $mtx=0; $pos=5; $dba=4; $num=2; $mfn=3; KbLoad();  # 2019-11-02
$t++;  # 2019-11-02: one blank time-point for sake of AudRecog()

  # 891=TURN -- 2018-12-11: verb for robotics
$t++; $ear[$t] = "T,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "U,0,0";           # 2018-12-11
$t++; $ear[$t] = "R,0,0";           # 2018-12-11
$t++; $ear[$t] = "N,0,891";         # 2018-12-11
  $psi=891; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-12-11 one blank time-point for sake of AudRecog()

  # 686=UNDER -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "U,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,686";         # 2018-11-15
  $psi=686; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 687=UNDERNEATH -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "U,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "A,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "H,0,687";         # 2018-11-15
  $psi=687; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 892=UNDERSTAND -- 2018-12-11: useful verb for machine translation, etc.;
$t++; $ear[$t] = "U,0,0"; $rv = $t; # 2018-09-02: anticipate KbLoad.
$t++; $ear[$t] = "N,0,0";           # 2018-09-02
$t++; $ear[$t] = "D,0,0";           # 2018-09-02
$t++; $ear[$t] = "E,0,0";           # 2018-09-02
$t++; $ear[$t] = "R,0,0";           # 2018-09-02
$t++; $ear[$t] = "S,0,0";           # 2018-09-02
$t++; $ear[$t] = "T,0,0";           # 2018-09-02
$t++; $ear[$t] = "A,0,0";           # 2018-09-02
$t++; $ear[$t] = "N,0,0";           # 2018-09-02
$t++; $ear[$t] = "D,0,892";         # 2018-12-10
  $psi=892; $hlc=1; $mtx=1860; $pos=8; $dba=0; $num=0; KbLoad();  # 2018-12-11: infinitive
$t++;  # 2018-09-02: one blank time-point for sake of AudRecog()

  # 369=UNLESS -- 2018-11-27: conjunction for ConJoin() module
$t++; $ear[$t] = "U,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad
$t++; $ear[$t] = "N,0,0";           # 2018-11-27
$t++; $ear[$t] = "L,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-27
$t++; $ear[$t] = "S,0,369";         # 2018-11-27
  $psi=369; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: flag-panel
$t++;  # 2018-11-27: one blank SPACE for sake of AudRecog()

  # 688=UNLIKE -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "U,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "L,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "K,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,688";         # 2018-11-15
  $psi=688; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 372=UNTIL -- 2018-11-27: conjunction for ConJoin() module
$t++; $ear[$t] = "U,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad
$t++; $ear[$t] = "N,0,0";           # 2018-11-27
$t++; $ear[$t] = "T,0,0";           # 2018-11-2
$t++; $ear[$t] = "I,0,0";           # 2018-11-27
$t++; $ear[$t] = "L,0,372";         # 2018-11-27
  $psi=372; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: flag-panel
$t++;  # 2018-11-27: one blank SPACE for sake of AudRecog()

  # 689=UNTIL -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "U,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "L,0,689";         # 2018-11-15
  $psi=689; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 690=UNTO -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "U,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "N,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,690";         # 2018-11-15
  $psi=690; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 691=UP -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "U,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "P,0,691";         # 2018-11-15
  $psi=691; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 692=UPON -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "U,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "P,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,692";         # 2018-11-15
  $psi=692; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 693=UPSIDE -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "U,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "P,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "D,0,0";           # 2018-11-15
$t++; $ear[$t] = "E,0,693";         # 2018-11-15
  $psi=693; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # US -- dative indirect-object form of pers. pron. 2016feb08
$t++; $ear[$t] = "U,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "S,0,731";         # 2018-09-10
  $psi=731; $hlc=1; $pos=7; $dba=3; $num=2; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # US -- accusative direct-object form of pers. pron. 2016feb08
$t++; $ear[$t] = "U,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "S,0,731";         # 2018-09-10
  $psi=731; $hlc=1; $pos=7; $dba=4; $num=2; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 893=USE -- 2018-12-11: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "U,0,0"; $rv = $t; # 2018-09-02: anticipate KbLoad.
$t++; $ear[$t] = "S,0,0";           # 2018-09-02
$t++; $ear[$t] = "E,0,893";         # 2018-12-10
  $psi=893; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad();  # 2018-12-11: infinitive
$t++;  # 2018-09-02: one blank time-point for sake of AudRecog()

  # 694=VERSUS -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "V,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "E,0,0";           # 2018-11-15
$t++; $ear[$t] = "R,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,0";           # 2018-11-15
$t++; $ear[$t] = "U,0,0";           # 2018-11-15
$t++; $ear[$t] = "S,0,694";         # 2018-11-15
  $psi=694; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 695=VIA -- 2018-11-11: as a preposition for EnPrep() module
$t++; $ear[$t] = "V,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "A,0,695";         # 2018-11-15
  $psi=695; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 696=VIS-A-VIS -- 2018-11-11: as a preposition for EnPrep() module

  # 894=WALK -- 2018-12-11: verb for humanoid robots
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-02: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-09-02
$t++; $ear[$t] = "L,0,0";           # 2018-09-02
$t++; $ear[$t] = "K,0,894";         # 2018-12-10
  $psi=894; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad();  # 2018-12-11: infinitive
$t++;  # 2018-09-02: one blank time-point for sake of AudRecog()

  # 895=WANT -- 2018-12-11: from Wikipedia:Most_common_words_in_English
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "A,0,0";           # 2018-12-11
$t++; $ear[$t] = "N,0,0";           # 2018-12-11
$t++; $ear[$t] = "T,0,895";         # 2018-12-11
  $psi=895; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad();  # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # WE -- nominative subject-form of personal pronoun; 2016feb08
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,731";         # 2018-09-10
  $psi=731; $hlc=1; $mtx=1731; $pos=7; $dba=1; $num=2; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # WHAT -- nominative pronoun for SelfReferentialThought
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "A,0,0";           # 2018-09-10
$t++; $ear[$t] = "T,0,781";         # 2018-09-10
  $psi=781; $hlc=1; $pos=7; $dba=1; $num=1; $mfn=3; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # WHAT -- accusative pronoun for SelfReferentialThought
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "A,0,0";           # 2018-09-10
$t++; $ear[$t] = "T,0,781";         # 2018-09-10
  $psi=781; $hlc=1; $pos=7; $dba=4; $num=1; $mfn=3; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 375=WHEN -- 2018-11-27: conjunction for ConJoin() module
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad
$t++; $ear[$t] = "H,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "N,0,375";         # 2018-11-27
  $psi=375; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: flag-panel
$t++;  # 2018-11-27: one blank SPACE for sake of AudRecog()

  # WHEN -- 2018-11-27: adverb for SelfReferentialThought
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "N,0,263";         # 2018-09-10
  $psi=263; $hlc=1; $pos=2; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 378=WHENEVER -- 2018-11-27: conjunction for ConJoin() module
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad
$t++; $ear[$t] = "H,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "N,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "V,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "R,0,378";         # 2018-11-27
  $psi=378; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: flag-panel
$t++;  # 2018-11-27: one blank SPACE for sake of AudRecog()

  # WHERE -- for SelfReferentialThought
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,245";         # 2018-09-10
  $psi=245; $hlc=1; $pos=2; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 381=WHEREAS -- 2018-11-27: conjunction for ConJoin() module
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad
$t++; $ear[$t] = "H,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "R,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "A,0,0";           # 2018-11-27
$t++; $ear[$t] = "S,0,381";         # 2018-11-27
  $psi=381; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: flag-panel
$t++;  # 2018-11-27: one blank SPACE for sake of AudRecog()

  # 384=WHETHER -- 2018-11-27: conjunction for ConJoin() module
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad
$t++; $ear[$t] = "H,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "T,0,0";           # 2018-11-27
$t++; $ear[$t] = "H,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "R,0,384";         # 2018-11-27
  $psi=384; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: flag-panel
$t++;  # 2018-11-27: one blank SPACE for sake of AudRecog()

  # 387=WHILE-- 2018-11-27: conjunction for ConJoin() module
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad
$t++; $ear[$t] = "H,0,0";           # 2018-11-27
$t++; $ear[$t] = "I,0,0";           # 2018-11-27
$t++; $ear[$t] = "L,0,0";           # 2018-11-27
$t++; $ear[$t] = "E,0,387";         # 2018-11-27
  $psi=387; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: flag-panel
$t++;  # 2018-11-27: one blank SPACE for sake of AudRecog()

  # WHO -- for SelfReferentialThought
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "O,0,791";         # 2018-09-10
  $psi=791; $hlc=1; $pos=7; $dba=1; $num=1; $mfn=0; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # WHOSE -- for AI to ask grammatically correct questions
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "S,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,794";         # 2018-09-10
  $psi=794; $hlc=1; $pos=7; $dba=2; $num=1; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # WHOM -- for AI to ask grammatically correct questions
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "M,0,794";         # 2018-09-10
  $psi=794; $hlc=1; $pos=7; $dba=3; $num=1; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # WHOM -- for AI to ask grammatically correct questions
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-09-10
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "M,0,794";         # 2018-09-10
  $psi=794; $hlc=1; $pos=7; $dba=4; $num=1; $mfn=0; KbLoad(); # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 297=WHY -- 2018-11-27: adverb for asking questions

  # 390=WHY -- 2018-11-27: conjunction for machine reasoning logic
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "H,0,0";           # 2018-11-27
$t++; $ear[$t] = "Y,0,390";         # 2018-11-27
  $psi=390; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: flag-panel
$t++;  # 2018-11-27: one blank SPACE for sake of AudRecog()

  # WIFE -- for InFerence premise "Men have a wife"; 2018-09-03
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-03: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-09-03
$t++; $ear[$t] = "F,0,0";           # 2018-09-03
$t++; $ear[$t] = "E,0,514";         # 2018-09-03
  $psi=514; $hlc=1; $pos=5; $num=1; $mfn=2; KbLoad();  # 2018-09-03: necessary items.
$t++;  # 2018-09-03: one blank time-point for sake of AudRecog()

  # 896=WILL -- 2018-12-11: auxiliary modal verb
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,0";           # 2018-12-11
$t++; $ear[$t] = "L,0,896";         # 2018-12-11
  $psi=896; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad();  # 2018-12-11: modal verb
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # 897=WISH -- 2018-12-11: verb for Volition()
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-12-11: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-12-11
$t++; $ear[$t] = "S,0,0";           # 2018-12-11
$t++; $ear[$t] = "H,0,897";         # 2018-12-11
  $psi=897; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad();  # 2018-12-11: infinitive
$t++;  # 2018-12-11: one blank time-point for sake of AudRecog()

  # WITH -- preposition for EnPrep module
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-09-10
$t++; $ear[$t] = "T,0,0";           # 2018-09-10
$t++; $ear[$t] = "H,0,697";         # 2018-11-11
  $psi=697; $hlc=1; $pos=6; KbLoad(); # 2018-11-11: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 698=WITHIN -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "H,0,0";           # 2018-11-15
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "N,0,698";         # 2018-11-15
  $psi=698; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # 699=WITHOUT -- 2018-11-11: preposition for EnPrep() module
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-11-15: anticipate KbLoad
$t++; $ear[$t] = "I,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,0";           # 2018-11-15
$t++; $ear[$t] = "H,0,0";           # 2018-11-15
$t++; $ear[$t] = "O,0,0";           # 2018-11-15
$t++; $ear[$t] = "U,0,0";           # 2018-11-15
$t++; $ear[$t] = "T,0,699";         # 2018-11-15
  $psi=699; $hlc=1; $pos=6; KbLoad(); # 2018-11-15: flag-panel
$t++;  # 2018-11-15: one blank time-point for sake of AudRecog()

  # WIVES -- for InFerence premise "Men have a wife"; 2018-09-03
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-03: anticipate KbLoad.
$t++; $ear[$t] = "I,0,0";           # 2018-09-03
$t++; $ear[$t] = "V,0,0";           # 2018-09-03
$t++; $ear[$t] = "E,0,0";           # 2018-09-03
$t++; $ear[$t] = "S,0,514";         # 2018-09-03
  $psi=514; $hlc=1; $pos=5; $num=2; $mfn=2; KbLoad();  # 2018-09-03: necessary items.
$t++;  # 2018-09-03: one blank time-point for sake of AudRecog()

  # WOMAN -- always feminine noun for use with gender flags
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "M,0,0";           # 2018-09-10
$t++; $ear[$t] = "A,0,0";           # 2018-09-10
$t++; $ear[$t] = "N,0,515";         # 2018-09-10
  $psi=515; $hlc=1; $pos=5; $dba=0; $num=1; $mfn=2; KbLoad();  # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # WOMEN -- irregular plural for retrieval by parameters
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "M,0,0";           # 2018-09-10
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "N,0,515";         # 2018-09-10
  $psi=515; $hlc=1; $pos=5; $dba=0; $num=2; $mfn=2; KbLoad();  # 2018-09-10
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 898=WORK -- 2018-12-11: verb useful for everyday speech
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-11-27
$t++; $ear[$t] = "R,0,0";           # 2018-11-27
$t++; $ear[$t] = "K,0,898";         # 2018-12-11
  $psi=898; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad(); # 2018-12-11: infinitive
$t++;  # 2018-11-27: one SPACE for sake of AudRecog()

  # 899=WORSHIP -- 2019-10-28: useful verb for discussion of theology
$t++; $ear[$t] = "W,0,0"; $rv = $t; # 2019-10-28: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2019-10-28
$t++; $ear[$t] = "R,0,0";           # 2019-10-28
$t++; $ear[$t] = "S,0,0";           # 2019-10-28
$t++; $ear[$t] = "H,0,0";           # 2019-10-28
$t++; $ear[$t] = "I,0,0";           # 2019-10-28
$t++; $ear[$t] = "P,0,899";         # 2019-10-28
  $psi=899; $hlc=1; $pos=8; $dba=0; $num=0; KbLoad();  # 2019-10-28
$t++;  # 2019-10-28: one blank time-point for sake of AudRecog()

  # YES -- interjection for human-computer interaction
$t++; $ear[$t] = "Y,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-09-10
$t++; $ear[$t] = "S,0,432";         # 2018-09-10
  $psi=432; $hlc=1; $pos=4; $dba=0; KbLoad(); # 2018-09-10: flag-panel order
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # 393=YET -- 2018-11-27: conjunction for ConJoin() module
$t++; $ear[$t] = "Y,0,0"; $rv = $t; # 2018-11-27: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2018-11-27
$t++; $ear[$t] = "T,0,393";         # 2018-11-27
  $psi=393; $hlc=1; $pos=3; KbLoad(); # 2018-11-27: flag-panel
$t++;  # 2018-11-27: one blank SPACE for sake of AudRecog()

  # YOU -- nominative singular of personal pronoun; 2016feb08
$t++; $ear[$t] = "Y,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "U,0,707";         # 2018-09-10
  $psi=707; $hlc=1; $pos=7; $dba=1; $num=1; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # YOURS -- genitive singular of personal pronoun; 2016feb08
$t++; $ear[$t] = "Y,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "U,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,0";           # 2018-09-10
$t++; $ear[$t] = "S,0,707";         # 2018-09-10
  $psi=707; $hlc=1; $pos=7; $dba=2; $num=1; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # YOU -- dative singular of personal pronoun; 2016feb08
$t++; $ear[$t] = "Y,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "U,0,707";         # 2018-09-10
  $psi=707; $hlc=1; $pos=7; $dba=3; $num=1; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # YOU -- accusative singular of personal pronoun; 2016feb08
$t++; $ear[$t] = "Y,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "U,0,707";         # 2018-09-10
  $psi=707; $hlc=1; $pos=7; $dba=4; $num=1; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # YOU -- nominative plural of personal pronoun; 2016feb08
$t++; $ear[$t] = "Y,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "U,0,737";         # 2018-09-10
  $psi=737; $hlc=1; $pos=7; $dba=1; $num=2; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # YOURS -- genitive plural of personal pronoun; 2016feb08
$t++; $ear[$t] = "Y,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "U,0,0";           # 2018-09-10
$t++; $ear[$t] = "R,0,0";           # 2018-09-10
$t++; $ear[$t] = "S,0,737";         # 2018-09-10
  $psi=737; $hlc=1; $pos=7; $dba=0; $num=0; $mfn=0; KbLoad(); # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog()

  # YOU -- dative plural of personal pronoun; 2016feb08
$t++; $ear[$t] = "Y,0,0"; $rv = $t; # 2018-09-10: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-10
$t++; $ear[$t] = "U,0,737";         # 2018-09-10
  $psi=737; $hlc=1; $pos=7; $dba=3; $num=2; KbLoad();  # 2018-09-10: flag-panel
$t++;  # 2018-09-10: one blank time-point for sake of AudRecog(

  # YOU -- accusative plural of personal pronoun; 2016feb08
$t++; $ear[$t] = "Y,0,0"; $rv = $t; # 2018-09-03: anticipate KbLoad.
$t++; $ear[$t] = "O,0,0";           # 2018-09-03
$t++; $ear[$t] = "U,0,737";         # 2018-09-03
  $psi=737; $hlc=1; $pos=7; $dba=4; $num=2; KbLoad(); # 2018-09-03: necessary items.
$t++;  # 2018-09-03: one blank time-point for sake of AudRecog()

  # YOUR -- adjective for personal pronoun "YOU"; 2018-09-02
$t++;  $ear[$t] = "Y,0,0"; $rv = $t; # 2018-09-02: anticipate KbLoad.
$t++;  $ear[$t] = "O,0,0";           # 2018-09-02
$t++;  $ear[$t] = "U,0,0";           # 2018-09-02
$t++;  $ear[$t] = "R,0,182";         # 2018-09-02
  $psi=182; $hlc=1; $pos=1; KbLoad(); # 2018-09-02: only necessary items.
$t++;  # 2018-09-02: one blank time-point for sake of AudRecog()

  # ZERO -- 590 2019-11-04: noun for the $hap(tic) sensation of the numeric "0" key.
$t++; $ear[$t] = "Z,0,0"; $rv = $t; # 2019-11-04: anticipate KbLoad.
$t++; $ear[$t] = "E,0,0";           # 2019-11-04
$t++; $ear[$t] = "R,0,0";           # 2019-11-04
$t++; $ear[$t] = "O,0,590";         # 2019-11-04
  $psi=590; $hlc=1; $mtx=0; $pos=5; $dba=4; $num=0; $mfn=3; KbLoad();  # 2019-11-04
$t++;  # 2019-11-04: one blank time-point for sake of AudRecog()
  print "Final size of MindBoot vault = $t. ";  # 2019-01-25: diagnostic = vault
  print "Escape to halt the AI Mind. \n";  # 2019-01-25: Inform user of option.
  print "\nTab cycles mode; Esc(ape) quits AI born $dob"; #2019-10-21
  print "\nt= $t Enter English or Russian as Subject-Verb-Object: \n"; #2019-10-21
  $vault = $t;  # 2018-09-02: dynamically calculated by incremental t++
  $hlc = 1;  # 2019-08-06: English by default; Cyrillic input changes to Russian.
# $hlc = 3;  # 2019-06-07: Cyrillic by default; English input changes to Roman.
  $nxt = 3001;  # 2018-09-02: First 3K for English and Russian MindBoot.
};  # 2019-10-21: MindBoot() runs once and returns to the MainLoop.


sub ReJuvenate() {  # http://ai.neocities.org/ReJuvenate.html
  my $oubliette = ($vault + $coda);  # 2016apr19: to forget oldest memories.
  $rjc++;     # 2016apr18: increment rejuvenation counter.
  if ($rjc > 99999) { $rjc = 1 }  # 2016apr18: Reset for safety.
  print "\nPlease wait as memories migrate in ReJuvenate cycle $rjc \n"; # 2016apr18
  for (my $i = $oubliette; $i<($t+2); ++$i) {  # 2016apr18: PERL_Black_Book 143
    $jrt = ($i - $coda);  # 2016apr19: the "junior" time is offset by $coda;
    #2016apr19: Starting at vault-size plus coda-size, move engrams back coda-spaces:
    my @k=split(',',$psy[$i]);  # 2016apr18: inspect @psy flag-panel
    if ($k[14] > $coda) { $k[14] = ($k[14] - $coda) }  # 2019-08-01: keep $tkb valid.
    if ($k[20] > ($vault + $coda)) { $k[20] = ($k[20] - $coda) }  # 2019-08-01
    $psy[$jrt]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
    . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
    . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01
    $psy[$i] = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"; # 2019-08-01: blank
    my @aud=split(',',$ear[$i]);  # 2016apr18: expose @ear values during loop;
    $ear[$jrt] = "$aud[0],$aud[1],$aud[2]";  # 2016apr18: move data to $jrt;
    $ear[$i] = " ,0,0";  # 2016apr18: empty out the vacated rows.
  }  # 2016apr18: End of (for loop) moving through memory
  $t = $jrt;  # 2016apr19: re-start time $t back at the junior-time $jrt
  if ($t < $vault) { $t = $vault }  # 2016apr19: safeguard time $t
  for (my $j=$t; $j<$cns; ++$j) {  # 2016apr18: in cleared-out memory...
    $ear[$j] = " ,0,0";  # 2016apr18: empty out the vacated rows.
    $psy[$j] = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"; # 2019-08-01: blank rows.
  }  # 2016apr18: end of the sweep from new $t to the end of $cns memory.
}  # 2019-08-01: ReJuvenate() returns to the MainLoop.


# 2015may28 Requirements of Speech mind-module:
# Speech module shall output a single word starting at given @ear point.
# Outputted word shall be fed internally into the ReEntry module.
# Inflected nouns and verbs shall be spoken from NounGen or VerbGen.
sub Speech() {  # http://ai.neocities.org/Speech.html
  if ($age > $cns) { die "TERMINATING: memory full \n"; }  # 2016jan28
  $pho = " "; AudInput(); # 2017-12-07: prime AudInput with a 32=SPACE
  $audstop = 0;  # 2017-03-31: Initially false value of flag
  $pov = 1;    # 2017-03-27: only internal POV thinking uses speech module.
  $t2s = $aud;  # 2016feb13: start from the auditory recall-vector $aud
  $rv = 0;  # 2017-04-07: [MindForth] Let AudInput designate recall-vector "rv".
  do {        # PERL by Example (2015), p. 194: do/until Loops
    my @aud=split(',',$ear[$t2s]);  # 2016jan28: expose @ear values
    $output = "$output" . "$aud[0]";  #2016apr09: commenting back in
    print "$aud[0]";  # 2016mar29: say each character
    $pho = $aud[0];  # 2017-03-27: for reentry into AudInput.
   if ((ord $pho) == 0) {  # 2017-03-31: if space detected...
     $pho = " "; # 2017-03-31: blank SPACE-32
     $audstop = 1;  # 2017-03-31: flag to end a word with a space
   }  # 2017-03-31: end of test for a blank space.
    if ((ord $pho) == 13) {  # 2017-03-31: including any 32=SPACE...
      $pov = 2; # 2018-07-01: after 32=CR (carriage return)
      print $pho;  # 2017-12-21: say or display "pho"; TEST
      $lastpho = $pho;  # 2017-03-31: to avoid extra "S" on verbs
    }  # 2017-03-31: end of constantly keeping track of last pho.
    if ((ord $pho) == 32 || (ord $pho) == 13) {  # 2017-03-31: SPACE or CR
      $audstop = 1;   # 2017-03-31: flag for finding end of word
      $spacegap = 1;  # 2017-03-31: identify presence of a space
      print $pho;  # 2017-03-31: say or display "pho"
    }  # 2017-03-31: end of test for 32=SPACE or 13=CR.
    AudInput();  # 2017-03-27: input each phoneme, not entire idea.
    if ($audstop == 1) {  # 2017-03-31: flag found for end of word?
      if ($spacegap == 1)  {  # 2017-03-31: space found?
        $t++;  # 2017-03-31: increment internal AI time "t"
        $audrun = 1;  # 2017-03-31: resetting at end of internal word.
        $pho = " ";  # 2017-04-01: send SPACE-31 into AudInput?
        AudInput();  # 2017-04-01: one last call to AudInput()
        $len = 0;  # 2017-06-20: at end of word, reset length $len; 2017-06-20
        $t++;      # 2017-06-20: increment time-t by one unit? TEST
        $spacegap = 0;  # 2017-03-31: reset
      }  # 2017-03-31: end of test for a space.
    }  # 2017-03-31: end of test for end-of-word flag.
    $pov = 1;    # 2016apr08: internal point-of-view during thinking.
    $t2s++ ;   # 2016mar10: Increment time-to-speech to advance thru memory.
    if ($aud[0] eq " ")  { # 2016apr29: if no character is found
      $audrv = $t2s;  # 2015may13: Prepare for next word in memory.
      if ($pho eq chr(13)) { $pov = 2 }  # 2017-03-31: for sake of pause-counter
      return;         # 2015may13: Exit at end of a word
    };  # 2015may13: End of if-clause
  } until $t2s eq $cns;  # Show the whole array of AI Mind memory.
  $phodex = 1;  # 2019-10-22: reset for AudBuffer()
}  # 2019-10-22: Speech() returns to EnNounPhrase() or other generative module.


sub ConJoin() {  # http://ai.neocities.org/ConJoin.html
  if ($etc > 1) { $conj = 306 }   # 2019-03-02: use conjunction 306=AND
  if ($whatcon == 1)  {  # 2018-09-12: if processing a what-query...
    if ($qv2psi==886) { $conj = 361; # 2018-12-10: 361=THAT
    }  # 2018-09-30: end of test for 886=THINK
  }  # 2018-09-29: end of test for positive whatcon
  for (my $i=$t; $i>$midway; $i--) {  # 2018-09-12: search for $conj
    my @k=split(',',$psy[$i]);  # 2018-09-12: examine @psy array;
    if ($k[1] == $conj) {  # 2018-09-12: if conjunction is found...
      $audjuste = $k[20];  # 2019-08-01: conjunction recall-vector;
      $aud = $k[20];  # 2019-08-01: $conj recall-vector for Speech()
    }  # 2018-09-12: End of search for $conj conjunction;
  }  # 2018-09-12: End of search loop from $t back to $midway.
# Speech();  # 2018-09-12: speak the word starting at the $aud time.
# Speech();  # 2019-01-20: speak the word starting at the $aud time.
# if ($conj > 0) { Speech() }  # 2018-10-08: speak selected conjunction.
  if ($conj > 0) { Speech() }  # 2019-01-20: speak the word starting at the $aud time.
  if ($conj == 361) { return }  # 2018-11-27: skip any other conjunction.
  $ictus = 0;  # 2017-11-29: arbitrary threshold selected by AI Mind Maintainer
  if ($qv1psi == 0)  {  # 2017-12-28: if no pre-selected subject...
    for (my $i=$t; $i>$midway; $i--) {  # 2017-11-29: search for $ictus
      my @k=split(',',$psy[$i]);  # 2017-11-29: examine @psy array;
      if ($k[3] > $ictus && $k[6]==5 && $k[14] > 0) {  # 2019-08-01: high-act noun?
        $qv1psi = $k[1];  # 2017-11-29: adopt noun as subject for sentence;
        $ictus = $k[3];   # 2017-11-29: replace lower $ictus with any higher $ictus.
      }  # 2017-11-29: End of search for a high $ictus activation-level.
    }  # 2017-11-29: End of search loop from $t back to $midway.
  }  # 2017-12-28: end of test for a pre-selected subject $qv1psi
  if ($qv2psi==886 || $qv2psi==838 || $verbpsi==886 || $verbpsi==838) {  # 2018-12-10
    $conj = 361; # 2018-11-27: 361=THAT
  } else { # 2017-11-28:
#   $conj = 302;  # 2018-10-08: prevent run-on sentence.
  }  # 2017-11-29: end of else-clause
 if ($whatcon == 0) {  # 2018-09-12: prevent duplicate conjunctions
  for (my $i=$t; $i>$midway; $i--) {  # 2017-11-28: search for $conj
    my @k=split(',',$psy[$i]);  # 2017-11-28: examine @psy array;
    if ($k[1] == $conj) {  # 2017-11-28: if conjunction is found...
      $audjuste = $k[20];  # 2019-08-01: conjunction recall-vector;
      $aud = $k[20];  # 2019-08-01: $conj recall-vector for Speech()
    }  # 2017-11-28: End of search for $conj conjunction;
  }  # 2017-11-28: End of search loop from $t back to $midway.
 }  # 2018-09-12: end of test to prevent multiple conjunctions.
  $ictus = 0;  # 2017-11-29: reset for safety.
}  # 2019-08-01: ConJoin() returns to EnThink() or EnVerbPhrase() module.


sub EnArticle() {  # http://ai.neocities.org/EnArticle.html
  $usn = ($usn + 1);  # 2018-09-03: increment the upstream-idea rotation number.
# if ($usx > 0) { $us1 = $usx };  # 2018-09-03: transfer the noun concept value.
  if ($usx > 0 && $usn==1) { $us1 = $usx };  # 2018-09-03: transfer the noun concept.
  if ($usx > 0 && $usn==2) { $us2 = $usx };  # 2018-09-03: transfer the noun concept.
  if ($usx > 0 && $usn==3) { $us3 = $usx };  # 2018-09-03: transfer the noun concept.
  if ($usx > 0 && $usn==4) { $us4 = $usx };  # 2018-09-03: transfer the noun concept.
  if ($usx > 0 && $usn==5) { $us5 = $usx };  # 2018-09-03: transfer the noun concept.
  if ($usx > 0 && $usn==6) { $us6 = $usx };  # 2018-09-03: transfer the noun concept.
  if ($usx > 0 && $usn==7) { $us7 = $usx };  # 2018-09-03: transfer the noun concept.
  if ($usn > 6) { $usn = 1 };  # 2018-09-03: after $usn=7 rotate back to $usn=1
  if ($subjnum==1 && $qv2psi==800) { #2017-12-11: Deal with "I AM...."
    for (my $i=$t; $i>$midway; $i--) {  # 2017-12-11: search for 101=A
      my @k=split(',',$psy[$i]);  # 2017-12-11: examine @psy array;
      if ($anset==0) {  # 2017-12-12: if no vowel at start of noun...
        if ($k[1] == 101) {  # 2017-12-11: if 101=A is found;
          $audjuste = $k[20];  # 2019-08-01: "A" recall-vector;
          $aud = $k[20];  # 2019-08-01: "A" recall-vector for Speech()
          if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-01: insurance
        }  # 2017-12-11: End of search for 101=A;
      }  # 2017-12-12: end of test for vowel-flag $anset
      if ($anset>0) {  # 2017-12-12: if vowel at start of noun...
        if ($k[1] == 102) {  # 2017-12-12: if 102=AN is found;
          $audjuste = $k[20];  # 2019-08-01: "AN" recall-vector;
          $anset = 0;  # 2017-12-12: reset to zero for safety.
          $aud = $k[20];  # 2019-08-01: "AN" recall-vector for Speech()
          if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-01: insurance
        }  # 2017-12-12: End of search for 102=AN;
      }  # 2017-12-12: end of test for positive vowel-flag $anset
    }  # 2017-12-11: End of search loop from $t back to $midway.
    Speech();  # 2017-12-11: speak the word starting at the $aud time.
    return;  # 2018-09-03: if saying "A", skip saying "THE".
  }  # 2017-12-11: end of test for singular subject with 800=BE verb.
  if ($usx == $us1) {  # 2018-09-03: if "the" is warranted...
    for (my $i=$t; $i>$midway; $i--) {  # 2017-08-31: search for 117=THE
      my @k=split(',',$psy[$i]);  # 2017-08-31: examine @psy array;
      if ($k[1] == 117) {  # 2017-08-31: if 117=THE is found;
        $audjuste = $k[20];  # 2019-08-01: "THE" recall-vector;
        $aud = $k[20];  # 2019-08-01: "THE" recall-vector for Speech()
        if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-01: insurance
        }  # 2017-08-31: End of search for 117=THE;
    }  # 2017-08-31: End of search loop from $t back to $midway.
    Speech();  # 2017-08-31: speak the word starting at the $aud time.
    return;  # 2018-09-03: say only one "THE".
  }  # 2018-09-03: end of test for need to say "THE".
  if ($usx == $us2) {  # 2018-09-03: if "the" is warranted...
    for (my $i=$t; $i>$midway; $i--) {  # 2017-08-31: search for 117=THE
      my @k=split(',',$psy[$i]);  # 2017-08-31: examine @psy array;
      if ($k[1] == 117) {  # 2017-08-31: if 117=THE is found;
        $audjuste = $k[20];  # 2018-09-01: "THE" recall-vector;
        $aud = $k[20];  # 2019-08-01: "THE" recall-vector for Speech()
        if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-01: insurance
        }  # 2017-08-31: End of search for 117=THE;
    }  # 2017-08-31: End of search loop from $t back to $midway.
    Speech();  # 2017-08-31: speak the word starting at the $aud time.
    return;  # 2018-09-03: say only one "THE".
  }  # 2018-09-03: end of test for need to say "THE".
  if ($usx == $us3) {  # 2018-09-03: if "the" is warranted...
    for (my $i=$t; $i>$midway; $i--) {  # 2017-08-31: search for 117=THE
      my @k=split(',',$psy[$i]);  # 2017-08-31: examine @psy array;
      if ($k[1] == 117) {  # 2017-08-31: if 117=THE is found;
        $audjuste = $k[20];  # 2019-08-01: "THE" recall-vector;
        $aud = $k[20];  # 2019-08-01: "THE" recall-vector for Speech()
        if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-01: insurance
        }  # 2017-08-31: End of search for 117=THE;
    }  # 2017-08-31: End of search loop from $t back to $midway.
    Speech();  # 2017-08-31: speak the word starting at the $aud time.
    return;  # 2018-09-03: say only one "THE".
  }  # 2018-09-03: end of test for need to say "THE".
  if ($usx == $us4) {  # 2018-09-03: if "the" is warranted...
    for (my $i=$t; $i>$midway; $i--) {  # 2017-08-31: search for 117=THE
      my @k=split(',',$psy[$i]);  # 2017-08-31: examine @psy array;
      if ($k[1] == 117) {  # 2017-08-31: if 117=THE is found;
        $audjuste = $k[20];  # 2019-08-01: "THE" recall-vector;
        $aud = $k[20];  # 2019-08-01: "THE" recall-vector for Speech()
        if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-01: insurance
        }  # 2017-08-31: End of search for 117=THE;
    }  # 2017-08-31: End of search loop from $t back to $midway.
    Speech();  # 2017-08-31: speak the word starting at the $aud time.
    return;  # 2018-09-03: say only one "THE".
  }  # 2018-09-03: end of test for need to say "THE".
  if ($usx == $us5) {  # 2018-09-03: if "the" is warranted...
    for (my $i=$t; $i>$midway; $i--) {  # 2017-08-31: search for 117=THE
      my @k=split(',',$psy[$i]);  # 2017-08-31: examine @psy array;
      if ($k[1] == 117) {  # 2017-08-31: if 117=THE is found;
        $audjuste = $k[20];  # 2019-08-01: "THE" recall-vector;
        $aud = $k[20];  # 2019-08-01: "THE" recall-vector for Speech()
        if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-01: insurance
        }  # 2017-08-31: End of search for 117=THE;
    }  # 2017-08-31: End of search loop from $t back to $midway.
    Speech();  # 2017-08-31: speak the word starting at the $aud time.
    return;  # 2018-09-03: say only one "THE".
  }  # 2018-09-03: end of test for need to say "THE".
  if ($usx == $us6) {  # 2018-09-03: if "the" is warranted...
    for (my $i=$t; $i>$midway; $i--) {  # 2017-08-31: search for 117=THE
      my @k=split(',',$psy[$i]);  # 2017-08-31: examine @psy array;
      if ($k[1] == 117) {  # 2017-08-31: if 117=THE is found;
        $audjuste = $k[20];  # 2019-08-01: "THE" recall-vector;
        $aud = $k[20];  # 2019-08-01: "THE" recall-vector for Speech()
        if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-01: insurance
        }  # 2017-08-31: End of search for 117=THE;
    }  # 2017-08-31: End of search loop from $t back to $midway.
    Speech();  # 2017-08-31: speak the word starting at the $aud time.
    return;  # 2018-09-03: say only one "THE".
  }  # 2018-09-03: end of test for need to say "THE".
  if ($usx == $us7) {  # 2018-09-03: if "the" is warranted...
    for (my $i=$t; $i>$midway; $i--) {  # 2017-08-31: search for 117=THE
      my @k=split(',',$psy[$i]);  # 2017-08-31: examine @psy array;
      if ($k[1] == 117) {  # 2017-08-31: if 117=THE is found;
        $audjuste = $k[20];  # 2019-08-01: "THE" recall-vector;
        $aud = $k[20];  # 2019-08-01: "THE" recall-vector for Speech()
        if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-01: insurance
        }  # 2017-08-31: End of search for 117=THE;
    }  # 2017-08-31: End of search loop from $t back to $midway.
    Speech();  # 2017-08-31: speak the word starting at the $aud time.
    return;  # 2018-09-03: say only one "THE".
  }  # 2018-09-03: end of test for need to say "THE".
  $anset = 0; # 2017-12-12: reset in any case, such as conjoined ideas.
}  # 2019-08-01: EnArticle() returns to EnNounPhrase() module.


sub EnAdverb() {  # http://ai.neocities.org/EnAdverb.html
  # 2019-03-02: stub only; needs full implementation.
  # print "\n EnAdverb: adverbact= $adverbact \n";  # 2019-03-02: TEST; REMOVE
} # 2019-03-02: EnAdverb() returns to EnNounPhrase() module.

sub RuAdverb() {  # http://ai.neocities.org/RuAdverb.html
  # 2019-06-05: stub only; needs full implementation.
  # print "\n RuAdverb: adverbact= $adverbact \n";  # 2019-06-05: TEST
} # 2019-06-05: RuAdverb() shall return to RuNounPhrase() module.


sub EnAdjective() {  # http://ai.neocities.org/EnAdjective.html
  my @k=split(',',$psy[$tdj]);  # 2019-10-13: inspect flag-panel of adjective.
  if ($k[20] > 0) {  # 2019-10-13: if there is a positive auditory recall-vector...
    $aud = $k[20];   # 2019-10-13: adjective recall-vector for Speech()
    Speech();        # 2019-10-13: speak the indicated adjective.
    $tdj = 0;  # 2019-10-13: reset to prevent unwarranted call to EnAdjective()
  }  # 2019-10-13: end of test for a positive time-of-adjective "tdj".
} # 2019-10-13: EnAdjective() returns to EnNounPhrase() module.


sub RuAdjective() {  # http://ai.neocities.org/RuAdjective.html
  # 2019-06-05: stub only; needs full implementation.
  # print "\n RuAdjective: adjcon= $adjcon \n";  # 2019-06-05: TEST
} # 2019-06-05: RuAdjective() returns to RuNounPhrase() module.


# $act 33-48 = consciousness tier where concepts win selection.
# $act 17-32 = subconscious where concepts remain available.
# $act  1-16 = noise tier below logical association threshold.
sub SpreadAct() {  # http://ai.neocities.org/SpreadAct.html
  PsiDecay();  # 2016may01: reduce conceptual activation in general.
  # 2018-11-04: segment of SpreadAct() activates a prepositional phrase.
  if ($tselp > 0 && $prep > 0 && $wherecon == 0) {  # 2018-11-04: for prepositional phrase
    my @k=split(',',$psy[$tselp]);  # 2018-11-04: examine the @Psy concept array...
    $tselo = $k[14];  # 2019-08-01: time of selection of object of preposition.
    $aud = $k[20];  # 2019-08-01: fetch the $aud tag for sake of Speech()
    if ($aud > 0) { Speech() }  # 2018-11-04: speak the preposition.
    EnArticle();  # 2018-11-04: say "A" or "THE" before object of [preposition.
    @k=split(',',$psy[$tselo]);  # 2018-11-04: examine the @Psy concept array...
    $aud = $k[20];  # 2019-08-01: fetch the $aud tag for sake of Speech()
    if ($aud > 0) { Speech() }  # 2018-11-04: speak the object of the preposition.
    $aud = 0;    # 2018-11-04: reset for safety.
    $prep = 0;   # 2018-11-04: reset for safety.
    $tselo = 0;  # 2018-11-04: reset for safety.
    $tselp = 0;  # 2018-11-04: reset for safety.
    return;  # 2018-11-04: skip the remainder of SpreadAct()
  }  # 2018-11-04: end of test for time-point and concept-number of preposition.

  # 2018-11-01: segment of SpreadAct() responds to where-queries.
  if ($wherecon == 1)  {  # 2018-11-01: if answering a where-query...
    if ($qv1psi > 0) {  # 2018-11-01: if there is an activand subject...
      for (my $i=$tpu; $i>$midway; $i--) {  # 2018-11-01: search backwards in time.
        my @k=split(',',$psy[$i]);  # 2018-11-01: examine the @Psy concept array...
        if ($k[1] == $qv1psi && $k[14] > 0) {  # 2019-08-01: require verblock.
          if ($k[1]==$qv1psi && $k[11]==$qv2psi) {  # 2019-08-01: if correct verb
            $k[3] = ($k[3] + 256);  # 2018-11-01: impose an overriding activation.
            $psy[$i]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
            . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
            . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]"; # 2019-08-01
          }  # 2018-11-01: end of test for finding both subject and verb of query.
        }  # 2018-11-01: end of test for presence of a k13 tkb verblock.
      }  # 2018-11-01: end of (for loop) searching for $qv1psi subject concept.
    }  # 2018-11-01: end of test for a positive $qv1psi.
    return;  # 2018-11-01: skip the remainder of SpreadAct()
  }  # 2018-11-01: end of test for a positive "$wherecon".

  # 2018-11-01: segment of SpreadAct() responds to who-queries.
  if ($whocon > 0 && $qvdocon == 0) {  # 2018-09-30: only for 800=BE who-queries.
    if ($qv1psi > 0) {  # 2017-09-17: if there is an activand subject...
      for (my $i=$t; $i>$midway; $i--) {  # 2017-09-17: search backwards in time.
        my @k=split(',',$psy[$i]);  # 2017-09-17: inspect @psy flag-panel
        if ($k[1] == $qv1psi && $k[14] > 0) {  # 2019-08-01: require verblock.
          if ($k[1] == $qv1psi && $k[11] == $qv2psi) { # 2019-09-01: if correct verb...
            $k[3] = ($k[3] + 64);  # 2017-09-26: impose an overriding activation.
            $psy[$i]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
            . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
            . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]"; # 2019-08-01
          }  # 2017-09-18: end of test for finding both subject and verb of query.
        }  # 2017-09-18: end of test for presence of a k13 $tkb verblock.
      }  # 2017-09-18: end of (for loop) searching for $qv1psi subject concept.
    }  # 2017-09-17: end of test for a positive $qv1psi.
    $whocon = 0;  # 2019-03-30: reset to prevent carry-over.
    return;  # 2018-06-27: skip the remainder of SpreadAct()
  }  # 2017-09-22: end of test of $qucon to indicate processing of a query.

  # 2018-11-01: segment of SpreadAct() responds to what-think-queries.
  if ($whatcon > 0 && $qv2psi==886) {  # 2018-12-10: for a what-think query...
    for (my $i=$tpu; $i>$midway; $i--) {  # 2018-09-29: exclude current-most input.
      my @k=split(',',$psy[$i]);  # 2018-09-29: inspect @psy flag-panel
      if ($k[1]==$qv1psi && $k[14]==0 && $qv2psi == 886) {  # 2019-08-01: 886=THINK
        $actpsi = 0;  # 2018-09-29: prevent other calls to SpreadAct; TEST
         $k[3] = ($k[3] + 32);  # 2018-09-30: impose activation on the found subject.
         $psy[$i]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
         . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
         . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]"; # 2019-08-01
      }  # 2018-09-29: end of first test, for match with query-subject qv1psi
      if ($k[1]==886) {  # 2018-12-10: 886=THINK
         $k[3] = ($k[3] + 64);  # 2018-12-10: impose activation on 886=THINK
        $psy[$i]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
        . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
        . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]"; # 2019-08-01
      }  # 2018-12-10: end of test for 886=THINK
    }  # 2018-09-29: end of (for loop) searching for $qv1psi subject-noun concept.
    return;  # 2018-09-29: skip the remainder of SpreadAct()
  } # 2018-09-29: end of test of $whatcon so as to answer a what-query.

  # 2018-11-01: segment of SpreadAct() responds to what-queries.
  if ($whatcon > 0) {  # 2017-11-27: for a what-query...
    $dunnocon = 1;  # 2017-11-27: set positive so long as no answer emerges.
    for (my $i=$tpu; $i>$midway; $i--) {  # 2018-09-29: search backwards in time.
      my @k=split(',',$psy[$i]);  # 2018-09-29: inspect @psy flag-panel
      if ($k[1]==$taccon) { $act = 48; }  # 2019-11-02: activate tactile sensation.
      if ($k[1]==$qv1psi && $k[11]==$qv2psi) {  # 2019-08-01: subj. with query-verb
        $dunnocon = 0;  # 2018-09-30: even one correct answer disables $dunnocon
        if ($k[3] < 64) {  # 2019-01-28: avoid runaway activation
          $k[3] = $act;  # 2019-11-02: tactile sensation
          $k[3] = ($k[3] + 24);  # 2019-01-28: impose a medium activation.
        }  # end of test to prevent excessive activation.
        $psy[$i]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
        . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
        . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]"; # 2019-08-01
      }  # 2018-09-29: end of test for subject answer-concept
      if ($qv1psi==701 && $qv2psi==823 && $taccon > 0) {  # 2019-11-02: TEST
#       my @k=split(',',$psy[$taccon]);  # 2018-09-29: inspect @psy flag-panel
      }  # 2019-11-02: end of test for something tactile being felt.
    }  # 2017-11-27: end of (for loop) searching for $qv1psi subject-noun concept.
    $catsubj = $qv1psi;  # 2019-01-28: chain-subject to be omitted for sake of "AND"
    $catverb = $qv2psi;  # 2019-01-28: chain-verb to be omitted for sake of "AND".
    return;  # 2018-06-27: skip the remainder of SpreadAct()
  } # 2017-11-27: end of test of $whatcon so as to answer a what-query.

  # 2018-11-01: segment of SpreadAct() responds to who+verb+dir.object queries.
  if ($qvdocon > 0) {  # 2017-10-22: for a who+verb+dir.object query...
    for (my $i=($t-12); $i>$midway; $i--) {  # 2017-11-25: skip time of query
      my @k=split(',',$psy[$i]);  # 2017-09-26: inspect @psy flag-panel
      if ($k[1]==$qv2psi && $k[10]>0 && $k[12]==$qv4psi && $k[13]>0) { #2017-11-25:
        $dunnocon = 0;  # 2017-11-25: even one correct answer disables $dunnocon
          $qv2num = $k[8];   # 2017-10-22: latch onto k8 $num of the response-verb.
          $qv1psi = $k[10];  # 2017-09-26: latch onto k10 $pre as the subject (answer)
          $k[3] = ($k[3] + 32);  # 2017-09-26: impose less than half of subj-inhibition.
          $psy[$i]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
          . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
          . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]"; # 2019-08-01
      }  # 2017-09-26: end of test for presence of a k13 $tkb nounlock.
    }  # 2017-09-26: end of (for loop) searching for $qv2psi verb concept.
    $qucon = 0;  # 2017-09-26: prevent infinite loop?
    for (my $i=$t; $i>$midway; $i--) {  # 2017-09-26: search backwards in time.
      my @k=split(',',$psy[$i]);  # 2017-09-26: inspect @psy flag-panel
      if ($k[1]==$qv1psi) {  # 2018-12-24: if subject is found...
        if ($k[11]==$qv2psi) {  # 2019-08-01: if "seq" is the query-verb...
          $k[3] = ($k[3] + 12);  # 2019-09-27: impose a reasonable activation.
          $k[3] = ($k[0] + $k[3]);  # 2018-12-24: favor engrams with high "tru" value.
          $psy[$i]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
          . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
          . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]"; # 2019-08-01
        }  # 2018-12-24: end of test for query-verb as "seq" of the query-subject.
      }  # 2017-09-26: end of test for subject answer-concept
    }  # 2017-09-26: end of (for loop) searching for the subject answer-concept.
    return;  # 2018-06-27: skip the remainder of SpreadAct()
  }  # 2017-09-26: end of test for who+verb+direct-object query condition.

  # 2018-11-01: segment of SpreadAct() will respond to who+verb+indir.object queries.
  if ($qviocon > 0) {  # 2017-09-26: Segregate portions of SpreadAct() from others.
    return;  # 2018-06-27: skip the remainder of SpreadAct()
  }  # 2017-09-26: end of test for who+verb+indirect-object query condition.

  # 2018-11-01: segment of SpreadAct() asks questions about new concepts.
  if ($hlc == 1) {  # 2018-09-27: restrict to English until Russsian is ready.
    if ($nucon > 0) {  # 2017-09-22: Segregate portions of SpreadAct() from others.
      $moot = 1;  # 2017-09-22: prevent associative tags within question.
      for (my $i=$t; $i>$midway; $i--) {  # 2017-09-22: search backwards in time.
        my @k=split(',',$psy[$i]);  # 2017-09-22: inspect @psy flag-panel
          if ($k[1] == 781 && $k[14] == 0) {  # 2019-08-01: WHAT without verblock.
            $aud = $k[20];  # 2019-08-01: fetch auditory recall tag for Speech()
            Speech();  # 2017-09-22: speak the 781=WHAT
            last; # 2018-09-14: LEAVE in Forth; "break" in JavaScript to exit from loop.
        }  # 2017-09-22: end of test for 781=WHAT with no overriding verblock.
      }  # 2017-09-18: end of (for loop) searching for 781=WHAT concept.
      for (my $i=$t; $i>$midway; $i--) {  # 2017-09-22: search backwards in time.
        my @k=split(',',$psy[$i]);  # 2017-09-22: inspect @psy flag-panel
        if ($k[1]==800 && $k[7]==3 && $k[8]==$num) {  # 2017-09-22: dba=3rd num=?
          $aud = $k[20];  # 2019-08-01: fetch auditory recall tag for Speech()
          Speech();  # 2017-09-22: speak the 800=BE
          last; # 2017-09-22: one utterance is enough.
        }  # 2017-09-22: end of test for 800=BE
      }  # 2017-09-18: end of (for loop) searching for correct form of 800=BE.
      for (my $i=$t; $i>$midway; $i--) {  # 2017-09-22: search backwards in time.
        my @k=split(',',$psy[$i]);  # 2017-09-22: inspect @psy flag-panel
        if ($k[1]==$qusub) {  # 2017-09-22: look for the new concept.
          $aud = $k[20];  # 2019-08-01: fetch auditory recall tag for Speech()
          $bias = 5;  # 2018-11-15: assume that the new concept is a noun.
          Speech();  # 2017-09-22: speak the new concept
          last; # 2017-09-22: one utterance is enough.
        }  # 2017-09-22: end of test for new concept
      }  # 2017-09-18: end of (for loop) searching for the new concept.
      $moot = 0;  # 2017-09-22: finish preventing associative tags within question.
      return;  # 2018-06-27: skip the remainder of SpreadAct()
      # 2017-09-26: $impetus may be used in future to let Volition() ask questions.
    } # 2017-09-22: end of test of $nucon so as to cause asking of a question.
  }  # 2017-12-20: end of restriction to English pending code for Russian.

  # 2018-11-01: segment of SpreadAct() dealing with basic spreading of activation.
# print "\n SprA-9: actpsi= $actpsi tpr= $tpr prep= $prep qv2psi= $qv2psi \n"; # 2019-08-06
  if ($actpsi > 0 && $qucon == 0) {  # 2017-09-29: not with who-queries
    for (my $i=$t; $i>$midway; $i--) {  # 2016apr12: search backwards in time.
      my @k=split(',',$psy[$i]);  # 2016apr11: inspect @psy flag-panel
      if ($k[1] == $actpsi && $k[10] > 0) {  # 2019-03-30: if "pre" exists...
        $prepsi = $k[10];  # 2019-03-30: briefly hold onto "pre" as $prepsi.
        $prepsi = 0;  # 2019-03-30: reset to prevent carry-over.
      }  # 2019-03-30: end of test for a "pre" associated with the $actpsi concept.
#     if ($k[1] == $actpsi && $k[12] > 0) { $seqpsi = $k[12] } #2017-06-08: if seq, seqpsi
      if ($k[1] == $actpsi && $k[11] > 0) { $seqpsi = $k[11] } #2019-08-06: if seq, seqpsi
#     if ($k[1] == $actpsi && $k[13] > 0) {  # 2017jun8: require verblock.
      if ($k[1] == $actpsi && $k[14] > 0) {  # 2019-08-06: require "tkb" verblock.
       if ($k[6] == 5 || $k[6] == 7) {  # 2019-01-22: activate nouns or pronouns
#       $k[3] = ($k[3] + 32);  # 2017jun08: impose less than half of subj-inhibition.
#       $k[3] = ($k[3] + 24);  # 2019-06-03: spread a relative activation
        $k[3] = ($k[3] + 32);  # 2019-06-03: spread a relative activation
        $psy[$i]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
        . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
        . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01
       }  # 2019-01-22: end of test of k6 part-of-speech of actpsi concept.
      }  # 2016apr12: end of diagnostic test
    }  # 2016apr11: end of (for loop) searching for actpsi concept.
  }  # 2016apr11: end of test for a positive $actpsi.
  $act = 0;     # 2019-01-22: reset for safety.
  $actpsi = 0;  # 2016apr12: reset for safety.
  $dunnocon = 0; # 2019-09-18: reset for safety.
  $qucon = 0;   # 2017-09-17: reset for safety.
  $qvdocon = 0; # 2017-09-26: reset for safety.
  $qviocon = 0; # 2017-09-26: reset for safety.
}  # 2019-08-01: SpreadAct() returns to various calling modules.


sub EnPrep() {  # http://ai.neocities.org/EnPrep.html
  if ($tpr > 0) {  # 2019-08-06: positive time-of-preposition?
    my @k=split(',',$psy[$tpr]);  # 2019-08-06: inspect @psy knowledge-nodes.
    if ($k[14] > 0) { $tkbprep = $k[14] }  # 2019-10-28: "tkbprep" for obj of prep.
    if ($k[20] > 0) { $aud = $k[20]; Speech() }  # 2019-10-30: speak the preposition.
    $tpr = 0;  # 2019-10-20: prevent carry-over.
  }  # 2019-08-06: end of test for positive time-of-preposition.
  if ($tnpr > 0) {  # 2019-10-28: positive time-of-noun-preposition?
    my @k=split(',',$psy[$tnpr]);  # 2019-10-28: inspect @psy knowledge-nodes.
    if ($k[14] > 0) { $tkbprep = $k[14] }  # 2019-10-28: "tkbprep" for obj of prep.
    if ($k[20] > 0) { $aud = $k[20]; Speech() }  # 2019-10-30: speak the preposition.
    $tnpr = 0;  # 2019-10-28: prevent carry-over.
  }  # 2019-10-28: end of test for positive time-of-noun-preposition.
  if ($tvpr > 0) {  # 2019-10-17: positive time-of-verb-preposition?
    my @k=split(',',$psy[$tvpr]);  # 2019-10-17: inspect @psy knowledge-nodes.
    if ($k[14] > 0) { $tkbprep = $k[14] }  # 2019-10-28: "tkbprep" for obj of prep.
    if ($k[20] > 0) { $aud = $k[20]; Speech() }  # 2019-10-30: speak the preposition.
    $tvpr = 0;  # 2019-10-28: prevent carry-over.
  }  # 2019-10-17: end of test for positive time-of-verb-preposition.
  EnArticle();  # 2019-08-06: say "A" or "THE" before object of [preposition.
  if ($tkbprep > 0) {  # 2019-10-28: time of object of preposition?
    my @k=split(',',$psy[$tkbprep]);  # 2019-10-28: inspect @psy knowledge-nodes.
    if ($k[20] > 0) { $aud = $k[20]; Speech() }  # 2019-10-28: obtain recall-vector.
  }  # 2019-10-28: end of test for "tkbprep" object of preposition.
  $tkbprep = 0;   # 2019-10-28: reset for safety.
  $prep = 0;      # 2018-11-04: reset to avoid carry-over.
  $prepgen = 0;   # 2018-11-01: reset to avoid carry-over.
  $tpr = 0;       # 2019-09-24: reset to prevent carry-over.
  $tselo = 0;     # 2018-11-04: reset to avoid carry-over.
  $tselp = 0;     # 2018-11-04: reset to avoid carry-over.
}  # 2019-10-30: EnPrep() returns to a thought-generation module.


sub RuPrep() {  # 2016mar30: include Russian preposition in a thought
# print "  RuPrep: prepgen = $prepgen \n";  # 2016mar30: diagnostic
}  # 2016mar30: RuPrep() returns to a thought-generation module.


sub EnAuxVerb() {  # http://ai.neocities.org/EnAuxverb.html
  if ($prsn==0) { $prsn = 3 }  # 2018-09-30: third person by default.
  if ($subjnum==0 && $snu > 0) { $subjnum = $snu }  # 2018-10-08: insurance
  if ($auxverb == 818) {  # 2018-12-10: if the auxiliary is "DO" or "DOES"
    for (my $i=$vault; $i>$midway; $i--) {  # 2018-12-10: search for 818=DO
      if ($subjnum==1 && $prsn==1) {  # 2018-09-30:
        my @k=split(',',$psy[$i]);  # 2018-09-30: examine @psy array;
        if ($k[1]==818 && $k[7]==1 && $k[8]==1) {  # 2018-12-10: 1st.p.sing. DO?
          $aud = $k[20];  # 2019-08-01: "DO" recall-vector for Speech()
          last;  # 2018-10-08: one engram is enough.
        }  # 2018-12-10: End of search for 818=DO;
      }  # 2018-09-30: end of test for 1st person singular;
      if ($subjnum==1 && $prsn==2) {  # 2018-10-08: second person singular
        my @k=split(',',$psy[$i]);  # 2018-10-08: examine @psy array;
        if ($k[1]==818 && $k[7]==2 && $k[8]==1) {  # 2018-12-10:
          $aud = $k[20];  # 2019-08-01: "DO" recall-vector for Speech()
          last;  # 2018-10-08: one engram is enough.
        }  # 2018-12-10: End of search for 818=DO;
      }  # 2018-10-08: end of test for person and number.
      if ($subjnum==1 && $prsn==3) {  # 2018-10-08: third person singular
        my @k=split(',',$psy[$i]);  # 2018-10-08: examine @psy array;
        if ($k[1]==818 && $k[7]==3 && $k[8]==1) {  # 2018-12-10:
          $aud = $k[20];  # 2019-08-01: "DO" recall-vector for Speech()
          last;  # 2018-10-08: one engram is enough.
        }  # 2018-12-10: End of search for 818=DO;
      }  # 2018-10-08: end of test for person and number.
      if ($subjnum==2 && $prsn==1) {  # 2018-10-08: first person plural
        my @k=split(',',$psy[$i]);  # 2018-10-08: examine @psy array;
        if ($k[1]==818 && $k[7]==1 && $k[8]==2) {  # 2018-12-10:
          $aud = $k[20];  # 2019-08-01: "DO" recall-vector for Speech()
          last;  # 2018-10-08: one engram is enough.
        }  # 2018-12-10: End of search for 818=DO;
      }  # 2018-10-08: end of test for person and number.
      if ($subjnum==2 && $prsn==2) {  # 2018-10-08: second person plural
        my @k=split(',',$psy[$i]);  # 2018-10-08: examine @psy array;
        if ($k[1]==818 && $k[7]==2 && $k[8]==2) {  # 2018-12-10:
          $aud = $k[20];  # 2019-08-01: "DO" recall-vector for Speech()
          last;  # 2018-10-08: one engram is enough.
        }  # 2018-12-10: End of search for 818=DO;
      }  # 2018-10-08: end of test for person and number.
      if ($subjnum==2 && $prsn==3) {  # 2018-10-08: third person plural
        my @k=split(',',$psy[$i]);  # 2018-10-08: examine @psy array;
        if ($k[1]==818 && $k[7]==3 && $k[8]==2) {  # 2018-12-10:
          $aud = $k[20];  # 2019-08-01: "DO" recall-vector for Speech()
          last;  # 2018-10-08: one engram is enough.
        }  # 2018-12-10: End of search for 818=DO;
      }  # 2018-10-08: end of test for person and number.
    }  # 2018-10-08: End of backwards search-loop.
    Speech();  # 2018-10-08: speak the word starting at the $aud time.
  }  # 2018-12-10: end of test for 818=DO auxiliary verb.
}  # 2019-08-01: EnAuxVerb() returns to EnVerbPhrase()


sub EnPronoun() {  # http://ai.neocities.org/EnPronoun.html
  # 2019-03-02: stub only; needs full implementation.
  # print "\n EnPronoun: atcd= $atcd \n";  # 2019-03-02: TEST; REMOVE
} # 2019-03-02: EnPronoun() returns to EnNounPhrase() module.


sub AskUser() {  # http://ai.neocities.org/AskUser.html
  $moot = 1;  # 2019-10-23: prevent associative tagging during question TEST; TRUNCATE
  $pov = 1;  # 2018-06-26: 1=internal; 2=external;
  $tsj = 0;  # 2019-10-23: zero out any input time-of-subject
  $quobjaud = 0;  # 2018-06-26: safety measure;
  if ($ynverb == 0) {  # 2018-06-26: ask y/n question only once;
    $ynverb = $quverb;  # 2018-06-26: isolate at start;
    $moot = 1;  # 2018-06-26: prevent storing of "tkb" and "seq";
    $auxverb = 818;  # 2018-12-10: 818=DO as auxiliary verb;
    $prsn = 3;  # 2018-10-08: assumption; otherwise track value thru code.
    EnAuxVerb();  # 2018-12-10: Say 818=DO or DOES;
    $auxverb = 0;  # 2018-06-26: reset for safety;
    $moot = 0;  # 2018-06-26: reset after use;
    for (my $i=$inft; $i>$midway; $i--) {  # 2019-10-21: find the query-subject
      my @k=split(',',$psy[$i]);  # 2018-06-26: examine @psy array;
      if ($k[1] == $qusub) {  # 2018-06-26: if query-subject found;
        $aud = $k[20];  # 2019-08-01: assign auditory recall-tag;
        last;  # 2018-06-26: exit the loop after first find;
      }  # 2018-06-26: end of test for query-subject;
    }  # 2018-06-26: end of loop in search of quobj.
    Speech();  # 2019-10-21: speak query-subject starting at "aud" value;
    if ($quverb == 0) { $quverb = 818 }  # 2018-12-10: 818=DO default;
  # for (my $i=$inft; $i>$midway; $i--) {  # 2019-10-13: skip silent inference;
  #   my @k=split(',',$psy[$i]);  # 2019-10-13: examine @psy array;
  #   if ($k[1] == $quverb) {  # 2019-10-13: even if not infinitive
  #     $aud = $k[20];  # 2019-10-13: assign most recent recall-tag;
  #     last;  # 2019-10-13: exit the loop after first find;
  #   }  # 2019-10-13: end of test for any instance of the $quverb.
  # }  # 2019-10-13: end of search for quverb in case infinitive is not found.
    $moot = 1;  # 2019-10-21: prevent storage of associative tags with query-verb.
    for (my $i=$inft; $i>$midway; $i--) {  # 2019-10-21: find the query-verb
      my @k=split(',',$psy[$i]);  # 2018-06-26: examine @psy array;
      if ($k[1] == $quverb && $k[7] == 0) {  # 2018-10-08: infinitive dba=0
        $aud = $k[20];  # 2019-08-01: assign most recent recall-tag;
        last;  # 2018-06-26: exit the loop after first find;
      }  # 2018-06-26: end of test for $quverb.
    }  # 2018-06-26: end of loop in search of yes-or-no ("yn") quverb;
    $verbprsn = 0;  # 2018-06-26:  Store the verb as an infinitive form;
    $audnum = 0;    # 2018-06-26:  infinitive without num(ber);
    $holdnum = 0;   # 2018-06-26:  infinitive without num(ber);
    $infincon = 1;  # 2018-06-26:  set flag to positive one;
    $nphrnum = 0;   # 2018-06-26: for no influence on infinitive;
    $numsubj = 0;   # 2018-06-26:  for no influence on infinitive;
    $putnum = 0;    # 2018-06-26:  for insisting on zero num infinitive;
    $dba = 0;       # 2019-10-21: for storage of infinitive form. TEST; TRUNCATE IF ACCEPTED
    $moot = 1;  # 2019-10-23: prevent storage of associative tags with query-verb.
    Speech();      # 2018-06-26:  speak the verb starting at "aud" value;
    $moot = 0;  # 2019-10-21: end of $moot stoppage of forming associative tags for verb.
    if ($quobj == 0) { $quobj = 711 }  # 2018-06-26: 711=ANYTHING default;
    for (my $i=$inft; $i>$midway; $i--) {  # 2018-06-26: skip silent inference;
      my @k=split(',',$psy[$i]);  # 2018-06-26: examine psy concedptual array;
      if ($k[1] == $quobj) {  # 2018-06-26: if query-object found;
        if ($k[7]==4) {  # 2018-06-26: dba=4 accusative?
          $quobjaud = $k[20];  # 2019-08-01: hold thru EnArticle();
          $usx=0;  # 2018-09-19: Suppress "THE" in the EnArticle() module.
          $us1=0;$us2=0;$us3=0;$us4=0;$us5=0;$us6=0;$us7=0; # 2018-09-19
          EnArticle();  # 2018-06-26: insert "A" or "THE" article.
          $aud = $quobjaud;   # 2018-06-26: restore after EnArticle;
          last;  # 2018-06-26: exit the loop after first grammatical find;
        }  # 2018-06-26: end of test for accusative dba=4.
      }  # 2018-06-26: end of test for $quobj.
    }  # 2018-06-26: end of loop in search of quobj;
    $dirobj = 1;  # 2018-06-26: So OldConcept will set "dba" = 4 (accusative)
    Speech();     # 2018-06-26: say object word starting at "aud" value;
    $dirobj = 0;  # 2018-06-26: Reset for safety after asking question;
    $yncon = 0;   # 2018-06-26: assuming question has been asked;
    $kbcon = 1;   # 2018-06-26: because waiting for answer;
    $ynverb = 0;  # 2018-06-26: zero out; prevent repeat of query;
  }  # 2018-06-26: end of test of ynverb;
  if ($subjpsi==701) { $prsn=1; }  # 2018-06-26:  1st person "I";
  if ($subjpsi==731) { $prsn=1; }  # 2018-06-26:  1st person "WE";
  if ($subjpsi==707) { $prsn=2; }  # 2018-06-26:  2nd person YOU;
  if ($subjpsi==713) { $prsn=3; }  # 2018-06-26:  3rd person HE;
  if ($subjpsi==719) { $prsn=3; }  # 2018-06-26:  3rd person SHE;
  if ($subjpsi==725) { $prsn=3; }  # 2018-06-26:  3rd person IT;
  if ($subjpsi==743) { $prsn=3; }  # 2018-06-26:  3rd person THEY;
  $numsubj = 0;  # 2018-06-26: reset for safety;
  $qusnum = 0;   # 2018-06-26: reset for safety;
  $qusub = 0;    # 2018-06-26: reset for safety;
  $recon = 0;    # 2018-06-26: remove incentive for asking a question.
  $bias = 5;     # 2018-06-26: restore expectation of a noun;
  my $rsvp = 0;  # 2018-06-2016: counter for response-delay;
  until ($rsvp == 100000) {  # 2018-06-26: upper limit on count;
    $rsvp++;  # 2018-06-26: Increment $rsvp counter
  }  # 2018-06-26: end of loop waitng for user-response.
  $pov = 2;  # 2018-06-26: 1=internal; 2=external;
}  # 2019-10-13: AskUser() returns to EnThink()


sub EnNounPhrase() {  # http://ai.neocities.org/EnNounPhrase.html
  $aud = 0;  # 2018-06-28: safety measure.
  $act = 0;  # 2016mar29; 2016apr27: so comparisons may be higher.
  $actpsi = 0;    # 2019-01-22: prevent carry-over within compound sentences.
  $audjuste = 0;  # 2016feb12: prevent carry-over
  $defact = -64;  # 2016apr13: for default comparisons with "701=I";
  $motjuste = 0;  # 2016feb12:
  if ($whatcon==1 && $qv1psi==701 && $qv2psi==823 && $taccon>0) { $motjuste=$taccon } # 11-02 TEST
  $nphrpos = 5;   # 2017-09-03: a default setting of noun for EnArticle().
  $subjpsi = 0;   # 2016jun28: how can there already be a subject-psi? TEST
  my $tsels = 0;  # 2016may25: de-globalize the time-of-selection-of-subject.
  if ($verblock > 0) {  # 2016apr13: positive verblock?
    my @k=split(',',$psy[$verblock]);  # 2016apr13: inspect t=verblock row;
    $prsn = $k[7];       # 2018-09-30: for use in EnAuxVerb()
    $subjnum = $k[8];    # 2017-06-10: from number of verb; BUGFIX
    $nounlock = $k[14];  # 2019-08-01: dirobj tkb becomes nounlock value.
  }  # 2016apr13: end of test for a positive verblock;
  if ($nounlock > 0) {  # 2016apr13: already a nounlock?
    $dirobj = 1;  # 2016apr20: nounlock is specifically for a direct object.
    $subjectflag = 0;  # 2016apr20: needed for conditional tests below;
    my @k=split(',',$psy[$nounlock]);  # 2016apr13: inspect t=nounlock row;
    $motjuste = $k[1];  # 2017jun08: in case a search is needed for non-zero $rv
    $act = $k[3];   # 2017jun08: let activation-level play its role here;
    if ($k[17] > 0) { $tdj = $k[17] }  # 2019-10-13: time-of-adjective
#   if ($k[19] > 0) { $tpr = $k[19] }  # 2019-08-11: time-of-preposition?
    if ($k[19] > 0) { $tnpr = $k[19] }  # 2019-10-28: time-of-noun-preposition?
    if ($k[7] == 4) {   # 2017jun08: if acc. case as for any nounlock;
      if ($k[20] > 0) {     # 2019-08-01: if there is a positive recall-vector...
        $nphrpos = $k[6];   # 2017-09-03: find part-of-speech for EnArticle
        $aud = $k[20];      # 2019-08-01: find positive $rv;
      }  # 2017-09-03: pre-ELSE end of test for a positive recall-vector
    } else {  # 2019-08-08: if only a zero $rv is found...
      for (my $i=$t; $i>$midway; $i--) {  # 2016apr20: search backwards in time.
        @k=split(',',$psy[$i]);  # 2016apr20: inspect @psy flag-panel
        if ($motjuste == $k[1]) {  # 2017jun08: find motjuste for sake of rv
          if ($dirobj == 1 && $k[7] == 4) {   # 2017jun08: direct object?
            if ($k[20] > 0) { $nphrpos = $k[6] }  # 2019-08-01: for EnArticle.
            if ($k[20] > 0) { $aud = $k[20] }  # 2019-08-01: find positive $rv;
            if ($k[20] > 0) { last }  # 2019-08-01: exit loop if $rv is found.
          }  # 2016apr20: end of test for direct object and accusative case.
          if ($k[20] > 0) { $nphrpos = $k[6] }  # 2019-08-01: for EnArticle.
          if ($k[20] > 0) { $aud = $k[20] }  # 2019-08-01: find positive $rv;
          if ($k[20] > 0) { last }  # 2019-08-01: exit loop if $rv is found.
        }  # 2016apr20: end of test to find $motjuste with valid $rv.
      }  # 2016apr27: end of for-loop in search of a positive recall-vector.
    }  # 2017sep03: end of else-clause for typically a pronominal $rv.
    $actpsi = $k[1];  # 2017-06-17: send direct object into SpreadAct()
  }  # 2016apr13: end of test for a positive nounlock;
  if ($tpr > 0) {  # 2019-08-11: if noun links to a preposition...
    my @k=split(',',$psy[$tpr]);  # 2019-08-11: inspect @psy knowledge-nodes.
    if ($k[14] > 0) { $px1 = $k[14] }  # 2019-08-11: intercept "px1" for obj of prep.
  }  # 2019-08-11: end of test for a jump-off point to a preposition.
  if ($whatcon==1 && $qv1psi==701 && $qv2psi==823 && $taccon>0) { $motjuste=$taccon } # 11-02 TEST
  if ($nounlock == 0) {  # 2019-06-05: if English nouns are free to compete...
    $subjectflag = 1;  # 2016mar29: a default until countermanded.
    $dba = 1;  # 2017-06-11: default nominative until countermanded.
    if ($dirobj == 1) { $subjectflag = 0 }  # 2016mar29: countermanding default
    for (my $i=$t; $i>$midway; $i--) {  # 2016apr30: include input for topical response
      my @k=split(',',$psy[$i]);  # 2016mar15: inspect @psy knowledge-nodes.
      if ($k[2] == 1) {  # 2018-09-27: select only English words
        if ($k[6]==5 || $k[6]==7) {  # 2017jun08: select $pos noun or pronoun
          if ($k[14] > 0 ) {  # 2019-08-01: retrieve ideas, not single words.
            if ($k[3] > $act) {   # 2017jun08: k3 activation as criterion.
              $etc++;   # 2019-03-02: increment number of active ideas for ConJoin()
              $motjuste = $k[1];  # 2017jun08: Select the most active concept.
              $aud = $k[20];  # 2019-08-08: auditory recall-vector
              $svo1 = $k[1];      # 2017-06-08: keep track of subject.
              $mjact = $k[3];  # 2017jun08: if too low, motjuste defaults to "I"
              if ($k[3] > $act && $k[11] > 0) {  # 2019-08-01: if k1-psi has k11-seq
                $verblock = $k[14];  # 2019-08-01: assign $tkb value to verblock.
              }  # 2019-08-01: end of test for a k1-subject with a k11-seq.
              if ($k[3] > $act && $k[14] > 0) {  # 2019-08-01: if k1-psi has k14-tkb
                $subjnum = $k[8];  # 2019-10-20: necessary for EnArticle()
                $verblock = $k[14];  # 2019-08-01: assign $tkb value to verblock.
                $aud = $k[20];  # 2019-08-08: TEST
              }  # 2017jun11: end of test for a k1-subject with a k13-tkb.
              if ($dirobj == 1) { $actpsi = $k[1] }  # 2017jun08
              $subjpsi = $motjuste;  # 2016apr10: for selection of verb-form.
              $snu = $k[8];  # 2017jun08: for parameter in verb-selection;
              if ($k[20] > 0) {  # 2019-08-08: if there is a positive recall-vector...
                $nphrpos = $k[6];   # 2017-09-03: for sake of EnArticle.
                $audjuste = $k[20]; # 2019-08-01: temporary recall-vector for Speech
                $aud = $k[20]; # 2019-08-01: recall-vector for Speech()
              }  # 2018-06-28: end of test for auditory recall-vector.
              $tseln = $i;        # 2016mar29: use time-point for inhibition.
              $tsels = $i;        # 2016apr17: use time-point for inhibition.
              $act = $k[3];       # 2017jun08: noun must have higher act to win
            }  # 2016feb12: end of test for a higher activation $act
          }  # 2017dec06: end of test for a k[13] tkb verblock
        }  # 2016feb17: end of test for noun or pronoun as subject
      }  # 2016feb17: end of test for human language code $hlc == "en"
    }  # 2016mar13: End of (for loop) searching for most active "motjuste"
  } # 2019-06-05: end of test for absence of a $nounlock for English nouns.
  if ($whatcon > 0) {  # 2019-01-28: if SpreadAct() answers a what-query...
  if ($whatcon==1 && $qv1psi==701 && $qv2psi==823 && $taccon>0) { $motjuste=$taccon } # 11-02 TEST
    if ($catsubj==$motjuste && $conj > 0) {  # 2019-01-28: after use of a conjunction...
      return;  # 2019-01-28: omit the subject-noun after the use of a conjunction.
    }  # 2019-01-28: end of test
  }  # 2019-01-28: end of test for SpreadAct() answering a what-query.
  my @k=split(',',$psy[$tsels]);  # 2016apr17: inspect subject at time of selection;
  if ($k[0] > 0) { $tru = $k[0]; }  # 2019-06-13: preserve truth-value for re-entry.
  $psy[$tsels]="$k[0],$k[1],$k[2],-90,$k[4],$k[5],$k[6],"
  . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
  . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-01: flag-panel
  # 2016jun28: Above line inserts inhibition more than twice what SpreadAct imposes.
  if ($subjectflag == 0) {  # 2016apr13: i.e., dir.obj or pred.nom;
  if ($whatcon==1 && $qv1psi==701 && $qv2psi==823 && $taccon>0) { $motjuste=$taccon } # 11-02 TEST
    if ($nounlock > 0) {  # 2016apr13: if verb is locked to a particular $seq...
      my @k=split(',',$psy[$nounlock]);  # 2016apr13: inspect t=nounlock row;
      $motjuste = $k[1];  # 2017jun08: nounlock psi pre-empts search.
      $act = $k[3];  # 2017jun08: let activation-level play its role here;
      if ($k[6] == 5) {  # 2017-09-03: if nounlock part of speech is 5=noun
        $nphrpos = 5;    # 2017-09-03: for sake of EnArticle.
        $qv1psi = $k[1]; # 2017-09-03: let direct object go to SpreadAct.
      }  # 2017-09-03: end of test for only a noun to go into SpreadAct.
      $aud = $k[20]; # 2019-08-02: recall-vector to auditory engram.
    }  # 2016apr13: end of test for a positive nounlock.
  }  # 2016apr13: end of test for not-a-subject before using ELSE
  if ($aud == 0) {  # 2018-06-28: seek outside of rv-less silent inference...
    for (my $i=$t; $i>$midway; $i--) {  # 2016mar27: search backwards in time.
      my @k=split(',',$psy[$i]);  # 2016mar27: inspect @psy flag-panel
      $act = $k[3];  # 2017jun08: let activation-level play its role here;
      if ($motjuste == $k[1]) {  # 2017jun08: find motjuste for sake of rv
        if ($subjectflag == 1 && $k[7] == 1) {   # 2017jun08: subject?
          if ($k[20] > 0) { $aud = $k[20] }  # 2019-08-01: find positive $rv;
          if ($k[20] > 0) { last }  # 2019-08-01: exit loop if $rv is found.
        }  # 2016apr01: end of test for subject and for nominative case.
        if ($dirobj == 1 && $k[7] == 4) {   # 2017jun08: direct object?
          if ($k[1] > 0) { $qv4psi = $k[1] }  # 2017-12-12: for inserting "AN".
          if ($k[20] > 0) { $nphrpos = $k[6] } # 2019-08-01: set POS for EnArticle.
          if ($k[20] > 0) { $aud = $k[20] }  # 2019-08-01: find positive $rv;
          if ($k[20] > 0) { last }  # 2019-08-01: exit loop if $rv is found.
        }  # 2016apr01: end of test for direct object and accusative case.
      }  # 2016mar27: end of test to find $motjuste with valid $rv.
    }  # 2016mar27: End of (for loop) searching through @psy conceptual array.
  }  # 2016mar27: end of else-clause for when recall-vector is zero.
  if ($nounlock == 0) {  # 2016apr07: if no nounlock override;
    if ($mjact < 20) {  # 2016jun18: if no subject active enough for chain-of-thought
      if ($subjectflag == 1) {  # 2016apr07: default to "I" only as subject
        $actpsi = 701;  # 2016apr29: send 701=I ego-concept into SpreadAct()
        $motjuste = 701;  # 2016apr07: 701=I default concept of AI Mind
        for (my $i=$t; $i>$midway; $i--) {  # 2016apr07: search for "I"
          my @k=split(',',$psy[$i]);  # 2016apr07: examine @psy
          if ($k[0]>0 && $k[1]==701 && $k[14]>0) { # 2019-08-01: I=701 with non-zero $tru
            if ($k[3] > $defact) {  # 2017jun08: if higher k3 act is found;
              $tseln = $i;  # 2016apr07: retain time of motjuste;
              $tsels = $i;  # 2016may25: retain time of English subject;
              $actpsi = $k[1];    # 2017jun08: psi with activation to spread
              $defact = $k[3];    # 2017jun08: dynamic metric;
              $defact = ($k[3] -1);  # 2019-06-03: allow deeper search.
              $verblock = $k[14]; # 2019-08-01: k14 $tkb as verblock;
              $aud = $k[20];      # 2019-08-01: recall-vector for auditory engram
            }  # 2016apr07: end of test for higher-act ego-concept;
          }  # 2016apr07: end of test for "701=I" with seq-check;
        }  # 2016apr07: end of search for least-inhibited "701=I";
        $dba = 1;        # 2016apr07: From RuAi; subject requires nom. case;
        $nphrnum = 1;    # 2016apr07: for EnArticle() and EnVerbPhrase();
        $nphrpos = 7;    # 2016apr07: prevent article "A" with "I";
        $prsn = 1;       # 2016apr07: for use elsewhere;
        $subjnum = 1;    # 2016apr07: for use elsewhere;
        $subjpsi = 701;  # 2016apr07: for use elsewhere;
        $topic = 701;    # 2016apr07: for question-asking modules;
        for (my $i=$t; $i>$midway; $i--) {  # 2016apr07: parameters for 701=I.
          my @k=split(',',$psy[$i]);  # 2016apr07: examine @psy
          if ($k[1] == 701) {  # 2017jun08: if 701=I is found;
            if ($k[7] == 1) {  # 2017jun08: k7/dba must be nominative=1;
              $audjuste = $k[20];  # 2019-08-01: "I" recall-vector;
              $aud = $k[20];  # 2019-08-01: "I" recall-vector for Speech()
              if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-01: insurance
            }  # 2016apr07: end of test for nominative "I";
          }  # 2016apr07: End of search for 701=I;
        }  # 2016apr07: end of 701=I search based on parameters.
      }  # 2016apr07: end of test for "I" to become subj. not obj.
    }  # 2016apr07: end of test for low activation warranting a default
  }  # 2016apr07: end of test for absence of pre-ordained nounlock;
  $unk = $aud;  # 2017-08-31: preserve value across call to EnArticle().
  if ($motjuste == 701) { $nphrpos = 7 }  # 2019-11-03: for pronoun 701=I
  if ($nphrpos == 5) {  # 2017-09-03: only nouns, not adjectives or pronouns.
    my @aud=split(',',$ear[$aud]);  # 2017-12-12: expose first @ear value
    if ($aud[0] eq "A") { $anset = 65 }  # 2017-12-12: If vowel "A";
    if ($aud[0] eq "E") { $anset = 69 }  # 2017-12-12: If vowel "E";
    if ($aud[0] eq "I") { $anset = 73 }  # 2017-12-12: If vowel "I";
    if ($aud[0] eq "O") { $anset = 79 }  # 2017-12-12: If vowel "O";
    if ($aud[0] eq "U") { $anset = 85 }  # 2017-12-12: If vowel "U";
    EnArticle()         # 2017-12-11: module for thinking an English article.
  }  # 2017-09-03: end of test for a 5=noun noun-phrase part-of-speech
  $aud = $unk;  # 2017-08-31: restore value after call to EnArticle().
  $unk = 0;     # 2017-08-31: reset for safety.
  $unk = $aud;  # 2019-10-13: preserve value across call to EnAdjective().
  if ($tdj > 0) {  # 2019-10-13: if there is a positive time-of-adjective...
    EnAdjective();  # 2019-03-02: permit insertion of adjective before a noun.
    $tdj = 0;  # 2019-10-13: reset for safety.
  }  # 2019-10-13: end of test for an adjective linked to the noun.
  $aud = $unk;  # 2019-10-13: restore value after call to EnAdjective().
  Speech();  # 2016feb13: speak the word starting at the $aud time.
  @k=split(',',$psy[$tsels]);  # 2016jun24: inhibit the subject just spoken.
  $psy[$tsels]="$k[0],$k[1],$k[2],-32,$k[4],$k[5],$k[6],"
  . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
  . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]"; # 2019-08-01: flag-panel
# if ($tpr > 0) {  # 2019-08-11: if there is a positive time-of-preposition
  if ($tnpr > 0) {  # 2019-10-128: if there is a positive time-of-noun-preposition
    EnPrep();  # 2019-08-11: for a prepositional phrase
  }  # 2019-08-11: end of test for a preposition linked to the noun.
  $dirobj = 0;    # 2016apr12: reset for safety
  $mfn = 0;       # 2019-10-23: prevent carry-over.
  $mjact = 0;     # 2016apr27: reset for safety.
  $motjuste = 0;  # 2016apr25: reset for safety.
}  # 2019-10-28: EnNounPhrase() returns to English Indicative() module


sub RuNounPhrase() {  # http://ai.neocities.org/RuNounPhrase.html
  $act = 0;  # 2016apr01: so comparisons may be higher.
  $aud = 0;  # 2018-09-28: same as in the EnNounPhrase module.
  $audjuste = 0;  # 2016feb24: prevent carry-over
  $defact = -64;  # 2017-06-17: for default comparisons with?
  $motjuste = 0;  # 2016feb24:
  $subjpsi = 0;   # 2017-06-17: how can there already be a subject-psi? TEST
  my $tsels = 0;  # 2016may25: de-globalize the time-of-selection-of-subject.
  if ($verblock > 0) {  # 2016apr28: positive verblock?
    my @k=split(',',$psy[$verblock]);  # 2016apr28: inspect t=verblock row;
    $svo1 = $k[1];  # 2017-06-17: keep track of subject-concept.
    $nounlock = $k[14];  # 2019-08-02: dirobj tkb becomes nounlock value.
    $subjnum = $k[8];    # 2017-06-17: from number of verb;
  }  # 2016apr28: end of test for a positive verblock;
  if ($nounlock > 0) {  # 2016apr28: already a nounlock?
    $dirobj = 1;  # 2016apr28: nounlock is specifically for a direct object.
    $subjectflag = 0;  # 2016apr28: needed for conditional tests below;
    my @k=split(',',$psy[$nounlock]);  # 2016apr28: inspect t=nounlock row;
    $motjuste = $k[1];  # 2017-06-17: in case a search is needed for non-zero $rv
    $act = $k[3];   # 2017-06-17: let activation-level play its role here;
    if ($k[7] == 4) {   # 2017-06-17: if acc. case as for any nounlock;
      if ($k[20] > 0) { $aud = $k[20] }  # 2019-08-02: find positive $rv;
    } else {  # 2019-08-08: if only a zero $rv is found...
      for (my $i=$t; $i>$midway; $i--) {  # 2016apr28: search backwards in time.
        @k=split(',',$psy[$i]);  # 2016apr28: inspect @psy flag-panel
        if ($motjuste == $k[1]) {  # 2017-06-17: find motjuste for sake of rv
          if ($dirobj == 1 && $k[7] == 4) {   # 2017-06-17: direct object?
            if ($k[20] > 0) { $aud = $k[20] }  # 2019-08-02: find positive $rv;
            if ($k[20] > 0) { last }  # 2019-08-02: exit loop if $rv is found.
          }  # 2016apr28: end of test for direct object and accusative case.
        }  # 2016apr28: end of test to find $motjuste with valid $rv.
      }  # 2016apr28: end of for-loop in search of a positive recall-vector.
    }  # 2019-08-08: end of else-clause to find a non-zero k20 $rv.
    $actpsi = $k[1];  # 2017-06-17: send direct object into SpreadAct()
  }  # 2016apr13: end of test for a positive nounlock;
  if ($nounlock == 0) {  # 2017-06-17: if nouns are free to compete...
    $subjectflag = 1;  # 2017-06-17: a default until countermanded.
    $dba = 1;  # 2017-06-17: default nominative until countermanded.
    if ($dirobj == 1) { $subjectflag = 0 }  # 2017-06-17: countermanding default
    for (my $i=$t; $i>$midway; $i--) {  # 2017-06-17: include input for topical response
      my @k=split(',',$psy[$i]);  # 2017-06-17: inspect @psy knowledge-nodes.
      if ($k[2] == 3) {  # 2018-09-27: select only Russian words
        if ($k[6]==5 || $k[6]==7) {  # 2017-06-17: select $pos noun or pronoun
          if ($k[14] > 0 ) {  # 2019-08-02: retrieve ideas, not single words.
            if ($k[3] > $act) {   # 2017-06-17: k3 activation as criterion.
              $motjuste = $k[1];  # 2017-06-17: Select the most active concept.
              $svo1 = $k[1];      # 2017-06-17: keep track of subject.
              $mjact = $k[3];  # 2019-06-09: if too low, motjuste defaults to ego
              if ($k[8] > 0) { $snu = $k[8] }  # 2019-06-03: for sake of RuVerbGen()
              if ($k[3] > $act && $k[11] > 0) {  # 2019-08--2: if k1-psi has k11-seq
                $tsels = $i;         # 2019-06-05: use time-point for inhibition.
                $verblock = $k[14];  # 2019-08-02: assign $tkb value to verblock.
              }  # 2017-06-17: end of test for a k1-subject with a k12-seq.
              if ($k[3] > $act && $k[14] > 0) {  # 2019-08-02: if k1-psi has k14-tkb
                $tsels = $i;         # 2019-06-05: use time-point for inhibition.
                $verblock = $k[14];  # 2019-08-02: assign $tkb value to verblock.
              }  # 2017-06-17: end of test for a k1-subject with a k13-tkb.
              if ($dirobj == 1) { $actpsi = $k[1] }  # 2017-06-17
              $subjpsi = $motjuste;  # 2017-06-17: for selection of verb-form.
              $snu = $k[8];  # 2017jun17: for parameter in verb-selection;
              if ($k[20] > 0) {  # 2019-08-02: if there is a positive recall-vector...
                $nphrpos = $k[6];   # 2019-06-05: for sake of EnArticle.
                $audjuste = $k[20]; # 2019-08-02: temporary recall-vector for Speech
                $aud = $k[20]; # 2019-08-02: recall-vector for Speech()
              } else {  # 2019-06-09: find alternative auditory recall-vector
                for (my $i=$vault; $i>$midway; $i--) {  # 2019-06-06: search "vault"
                  my @k=split(',',$psy[$i]);  # 2019-06-06: examine @psy array;
                  if ($k[1] == $subjpsi) {  # 2019-06-06: if "subjpsi" is found...
                    if ($k[7] == 1) {  # 2019-06-09: if dba=1 nominative...
                      if ($k[20] > 0) { $aud = $k[20]; last }  # 2019-08-02
                    } # 2019-06-09: end of test for required nominative subject.
                  }  # 2019-06-06: end of test for "subjpsi".
                }  # 2019-06-06: end of bacwards search for auditory recall-vector.
              }  # 2019-06-06: end of else-clause to find needed reacll-vector "rv"
              $tseln = $i;        # 2017-06-17: use time-point for inhibition.
#             $act = $k[3];       # 2017-06-17: noun must have higher act to win
              $act = ($k[3] - 1); # 2019-06-05: permit a winner
            }  # 2017-06-17: end of test for a higher activation $act
          }  # 2017-06-17: end of test for a k[13] tkb verblock
        }  # 2017-06-17: end of test for noun or pronoun as subject
      }  # 2017-06-17: end of test for human language code $hlc == 3
    }  # 2017-06-17: End of (for loop) searching for most active "motjuste"
  } # 2019-06-05: end of test for absence of a $nounlock for Russian nouns.
  my @k=split(',',$psy[$tsels]);  # 2019-06-05: inspect subject at time of selection;
  $psy[$tsels]="$k[0],$k[1],$k[2],-64,$k[4],$k[5],$k[6],"
  . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
  . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]"; # 2019-08-02: flag-panel
  # 2019-09-27: Above line inserts inhibition for Russian noun.
   if ($subjectflag == 0) {  # 2017-06-17: i.e., dir.obj or pred.nom;
    if ($nounlock > 0) {  # 2017-06-17: if verb is locked to a particular $seq...
      my @k=split(',',$psy[$nounlock]);  # 2017-06-17: inspect t=nounlock row;
#     print " t= $t nounlock= $nounlock ";  # 2017-06-17: DIAGNOSTIC reserve
      $motjuste = $k[1];  # 2017-06-17: nounlock psi pre-empts search.
      if ($k[6] == 5) {  # 2019-06-05: if nounlock part of speech is 5=noun
        $nphrpos = 5;    # 2019-06-05: for sake of EnArticle.
        $qv1psi = $k[1]; # 2019-06-05: let direct object go to SpreadAct.
      }  # 2019-06-05: end of test for only a noun to go into SpreadAct.
      $aud = $k[20]; # 2019-08-02: recall-vector to auditory engram.
    }  # 2017-06-17: end of test for a positive nounlock.
  }  # 2017-06-17: end of test for not-a-subject before using ELSE
  if ($aud == 0) {  # 2019-06-05: seek outside of rv-less silent inference...
    for (my $i=$t; $i>$midway; $i--) {  # 2019-06-05: search backwards in time.
      my @k=split(',',$psy[$i]);  # 2019-06-05: inspect @psy flag-panel
      $act = $k[3];  # 2019-06-05: let activation-level play its role here;
      if ($motjuste == $k[1]) {  # 2019-06-05: find motjuste for sake of rv
        if ($subjectflag == 1 && $k[7] == 1) {   # 2019-06-05: subject?
          if ($k[20] > 0) { $aud = $k[20] }  # 2019-08-02: find positive $rv;
          if ($k[20] > 0) { last }  # 2019-08-02: exit loop if $rv is found.
        }  # 2019-06-05: end of test for subject and for nominative case.
        if ($dirobj == 1 && $k[7] == 4) {   # 2019-06-05: direct object?
          if ($k[1] > 0) { $qv4psi = $k[1] }  # 2019-06-05: for inserting "AN".
          if ($k[20] > 0) { $nphrpos = $k[6] } # 2019-08-02: set POS for EnArticle.
          if ($k[20] > 0) { $aud = $k[20] }  # 2019-08-02: find positive $rv;
          if ($k[20] > 0) { last }  # 2019-08-02: exit loop if $rv is found.
        }  # 2019-06-05: end of test for direct object and accusative case.
      }  # 2019-06-05: end of test to find $motjuste with valid $rv.
    }  # 2019-06-05: End of (for loop) searching through @psy conceptual array.
  }  # 2019-06-05: end of clause for when recall-vector is zero.
  if ($nounlock == 0) {  # 2017-06-17: if no nounlock override;
    if ($mjact < 20) {  # 2017-06-17: if no subject active enough for chain-of-thought
      if ($subjectflag == 1) {  # 2017-06-17: default to "I" only as subject
        $actpsi = 1701;  # 2017-06-17: send 1701=I ego-concept into SpreadAct()?
        $motjuste = 1701;  # 2017-06-17: 1701=I default concept of AI Mind
        for (my $i=$t; $i>$midway; $i--) {  # 2017-06-17: search for "I"
          my @k=split(',',$psy[$i]);  # 2017-06-17: examine @psy
          if ($k[1]==1701 && $k[14]>0) { # 2019-08-02: I=1701 with $tkb verblock?
              $tseln = $i;  # 2017-06-17: retain time of motjuste;
              $tsels = $i;  # 2017-06-17: retain time of Russian subject;
              $actpsi = $k[1];    # 2017-06-17: psi with activation to spread
#             $defact = $k[3];    # 2017-06-17: dynamic metric;
              $defact = ($k[3] -1);  # 2019-06-03: allow deeper search.
              $verblock = $k[14]; # 2019-06-02: $tkb as verblock;
              $aud = $k[20];      # 2019-08-02: recall-vector for auditory engram
              $psy[$i]="$k[0],$k[1],$k[2],48,$k[4],$k[5],$k[6]," # 2019-06-09: increase
             . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
             . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-02
          }  # 2017-06-17: end of test for "1701=ego" with seq-check;
        }  # 2017-06-17: end of search for least-inhibited "1701=ego";
        $dba = 1;        # 2017-06-17: From RuAi; subject requires nom. case;
        $nphrnum = 1;    # 2017-06-17: for RuVerbPhrase();
        $nphrpos = 7;    # 2017-06-17: prevent article "A" with "I"?
        $prsn = 1;       # 2017-06-17: for use elsewhere;
        $subjnum = 1;    # 2017-06-17: for use elsewhere;
        $subjpsi = 1701; # 2017-06-17: for use elsewhere;
        $topic = 1701;   # 2017-06-17: for question-asking modules;
#       for (my $i=$t; $i>$midway; $i--) {  # 2017-06-17: parameters for 1701=ego.
        for (my $i=$vault; $i>$midway; $i--) {  # 2019-06-06: search in "vault"
          my @k=split(',',$psy[$i]);  # 2017-06-17: examine @psy
          if ($k[1] == 1701) {  # 2017-06-17: if 1701=ego is found;
            if ($k[7] == 1) {  # 2017-06-17: k7/dba must be nominative=1;
              $audjuste = $k[20];  # 2019-08-02: "ego" recall-vector;
              $aud = $k[20];  # 2019-08-02: "ego" recall-vector for Speech()
              if ($k[20]>0) { $aud=$k[20] }        # 2019-08-02: insurance
              if ($k[20]>0) { last }             # 2019-08-02: insurance
            }  # 2017-06-17: end of test for nominative "ego";
          }  # 2017-06-17: End of search for 1701=ego;
        }  # 2017-06-17: end of 1701=ego search based on parameters.
      }  # 2017-06-17: end of test for "ego" to become subj. not obj.
    }  # 2017-06-17: end of test for low activation warranting a default
  }  # 2017-06-17: end of test for absence of pre-ordained nounlock;
  RuAdjective();  # 2019-06-05: permit insertion of adjective before a Russian noun.
  Speech();  # 2017-0617: speak the word starting at the $aud time.
  $dirobj = 0;    # 2017-06-17: reset for safety
  $mjact = 0;     # 2017-06-17: reset for safety.
  $motjuste = 0;  # 2017-06-17: reset for safety.
}  # 2019-08-02: RuNounPhrase() returns to Russian RuIndicative() module


sub RuVerbGen() {  # http://ai.neocities.org/RuVerbGen.html
# print "\nRuVG: t= $t audbase= $audbase verbpsi= $verbpsi  \n"; #2019-06-03;
  my $binc = 0;  # de-globalized Buffer-INCrement counter used only locally.
  if ($subjpsi==1701) { $dba = 1 }  # 2016apr02: "1701=Я" is first-person "I";
  if ($subjpsi==1707) { $dba = 2 }  # 2016apr02: "1707="ТЫ" is second-person "you";
  if ($subjpsi==1737) { $dba = 2 }  # 2016apr02: "1737="ВЫ" is second-person "you";
  if ($subjpsi==1731) { $dba = 1 }  # 2016apr02: "1731="МЫ" is first-person "we";
  my @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #01
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #02
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #03
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #04
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #05
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #06
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #07
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #08
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #09
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #10
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #11
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #12
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #13
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #14
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #15
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  @aud=split(',',$ear[$audbase]);  # 2016apr05: @ear word-engram #16
  if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++ }
  do {  # 2016apr05: next loop uses OutBuffer();
   # OutBuffer();  # 2016apr03:
    if ($binc == 1) {   # 2016apr30: space filled below with Russian AI links.
      if ($b16 ne "") { print "$b16"; $idea = "$idea" . "$b16"; }  # 2019-06-10
    }  # 2016apr23: end of outputting character and concatenating for ReEntry().
    if ($binc == 2) {   # 2016apr25: http://ai-news.ru
      if ($b15 ne "") { print "$b15"; $idea = "$idea" . "$b15"; }  # 2019-06-10
    }  # 2016apr23: end of outputting character and concatenating for ReEntry().
    if ($binc == 3) {   # 2016apr25: http://ailab.ru/forum.html
      if ($b14 ne "") { print "$b14"; $idea = "$idea" . "$b14"; }  # 2019-06-10
    }  # 2016apr24: end of outputting character and concatenating for ReEntry().
    if ($binc == 4) { # http://egtd.ru -- Эмоционально-Генетическая Теория Развития
      if ($b15 ne "") { print "$b15"; $idea = "$idea" . "$b15"; }  # 2019-06-10
    }  # 2016apr24: end of outputting character and concatenating for ReEntry().
    if ($binc == 5) {   # 2016apr25: http://geektimes.ru
      if ($b14 ne "") { print "$b14"; $idea = "$idea" . "$b14"; }  # 2019-06-10
    }  # 2016apr24: end of outputting character and concatenating for ReEntry().
    if ($binc == 6) {   # 2016apr25: http://gotai.net/forum
      if ($b13 ne "") { print "$b13"; $idea = "$idea" . "$b13"; }  # 2019-06-10
    }  # 2016apr24: end of outputting character and concatenating for ReEntry().
    if ($binc == 7) { # 2016apr25: http://intsys.msu.ru -- ИНТЕЛЛЕКТУАЛЬНЫЕ СИСТЕМЫ
      if ($b12 ne "") { print "$b12"; $idea = "$idea" . "$b12"; }  # 2019-06-10
    }  # 2016apr24: end of outputting character and concatenating for ReEntry().
    if ($binc == 8) { # http://raai.org -- Российская ассоциация искусственного интеллекта
      if ($b11 ne "") { print "$b11"; $idea = "$idea" . "$b11"; }  # 2019-06-10
    }  # 2016apr24: end of outputting character and concatenating for ReEntry().
    if ($binc == 9) {  # 2016apr24:
      if ($b10 ne "") { print "$b10"; $idea = "$idea" . "$b10"; }  # 2019-06-10
    }  # 2016apr24: end of outputting character and concatenating for ReEntry().
    if ($binc == 10) {  # 2016apr03:
      if ($b9 ne "") { print "$b9"; $idea = "$idea" . "$b9"; }  # 2019-06-10
    }  # 2016apr23: end of outputting character and concatenating for ReEntry().
    if ($binc == 11) {  # 2016apr03:
      if ($b8 ne "") { print "$b8"; $idea = "$idea" . "$b8"; }  # 2019-06-10
    }  # 2016apr23: end of outputting character and concatenating for ReEntry().
    if ($binc == 12) {  # 2016apr03:
      if ($b7 ne "") { print "$b7"; $idea = "$idea" . "$b7"; }  # 2019-06-10
    }  # 2016apr23: end of outputting character and concatenating for ReEntry().
    if ($binc == 13) {  # 2016apr03:
      if ($b6 ne "") { print "$b6"; $idea = "$idea" . "$b6"; }  # 2010-06-10
    }  # 2016apr23: end of outputting character and concatenating for ReEntry().
    if ($binc == 14) {  # 2016apr03:
      if ($b5 ne "") { print "$b5"; $idea = "$idea" . "$b5"; }  # 2019-06-10
    }  # 2016apr23: end of outputting character and concatenating for ReEntry().
    if ($binc == 15) {  # 2016apr03:
      if ($b2 eq "\x85") { $b2 = "" }  # 2019-06-10: "Е" Cyrillic
      if ($b2 eq "\x92") { $b2 = "" }  # 2019-06-10: "Т" Cyrillic
      if ($b2 eq "\x64") { $b2 = "" }  # 2019-06-10: "Ш" Cyrillic
      print "$b2"; $idea = "$idea" . "$b2";  # 2019-06-10
    }  # 2019-06-10: end of outputting character and concatenating for ReEntry().
    if ($binc == 16) {  # 2016apr03:
      if ($b1 eq "\x85") { $b1 = "" }  # 2019-06-10: "Е" Cyrillic
      if ($b1 eq "\x8C") { $b1 = "" }  # 2019-06-10: "М" Cyrillic
      if ($b1 eq "\x92") { $b1 = "" }  # 2019-06-10: "Т" Cyrillic
      if ($b1 eq "\x8C") { $b1 = "" }  # 2019-06-10: "Ь" Cyrillic
  #   if ($b1 eq "Е") { $b1 = "" }  # 2016apr3: "Е" Cyrillic; TEST
      if ($b1 eq "\x9E") { $b1 = "" }  # 2019-06-10: "Ю" Cyrillic
      if ($b2 eq "\n{U+1070}") { print "  LETTER-YU" }  # 2019-06-10: "Ю" Cyrillic
    }  # 2019-06-10:
    $binc++;  # 2019-06-10: OutBuffer() "b" increment
  } while ($binc < 17);  # 2016apr03: while inspecting OutBuffer()
  $c1=""; $c2=""; $c3=""; $c4="";  # 2019-06-10: clear out the AudBuffer()
  $c5=""; $c6=""; $c7=""; $c8="";  # 2019-06-10: clear out the AudBuffer()
  $c9=""; $c10=""; $c11=""; $c12="";   # 2019-06-10: clear out the AudBuffer()
  $c13=""; $c14=""; $c15=""; $c16="";  # 2016apr06: clear out the AudBuffer()
  $binc = 0;  # 2016apr06: Reset the b-increment variable after use.
  if ($dba == 1) {  # 2016apr3: first person;
    if ($snu == 1) {  # 2016ap03: subject-number parameter;
      $pho = "\x9E";  # 2016apr03: "Ю"
      print "$pho";  # 2016apr06: after stem, output this inflection.
      $idea = "$idea" . "$pho";  #2016apr23: concatenate for ReEntry()
    }  # 2016apr03: end of test for singular subject-number;
    if ($snu == 2) {  # 2016ap06: subject-number parameter;
      $pho = "\x85";  # 2016apr06: "Е"
      print "$pho";  # 2016apr06: after stem, output this inflection.
      $idea = "$idea" . "$pho";  #2016apr23: concatenate for ReEntry()
      $pho = "\x8C";  # 2016apr06: "М"
      print "$pho";  # 2016apr06: after stem, output this inflection.
      $idea = "$idea" . "$pho";  #2016apr23: concatenate for ReEntry()
    }  # 2016apr06: end of test for plural subject-number;
  }  # 2016apr03: end of test for first-person;
  if ($dba == 2) {  # 2016apr3: second person;
    if ($snu == 1) {  # 2016ap03: subject-number parameter;
      $pho = "\x85";  # 2016apr03: "Е"
      print "$pho";  # 2016apr06: after stem, output this inflection.
      $idea = "$idea" . "$pho";  #2016apr23: concatenate for ReEntry()
      $pho = "\x98";  # 2016apr03: "Ш"
      print "$pho";  # 2016apr06: after stem, output this inflection.
      $idea = "$idea" . "$pho";  #2016apr23: concatenate for ReEntry()
      $pho = "\x9C";  # 2016apr03: "Ь"
      print "$pho ";  # 2016apr06: after stem, output this inflection.
      $idea = "$idea" . "$pho";  #2016apr23: concatenate for ReEntry()
    }  # 2016apr03: end of test for singular subject-number;
    if ($snu == 2) {  # 2016ap05: subject-number parameter;
      $pho = "\x85";  # 2016apr05: "Е"
      print "$pho";  # 2016apr06: after stem, output this inflection.
      $idea = "$idea" . "$pho";  #2016apr23: concatenate for ReEntry()
      $pho = "\x92";  # 2016apr05: "Т"
      print "$pho";  # 2016apr06: after stem, output this inflection.
      $idea = "$idea" . "$pho";  #2016apr23: concatenate for ReEntry()
      $pho = "\x85";  # 2016apr05: "Е"
      print "$pho";  # 2016apr06: after stem, output this inflection.
      $idea = "$idea" . "$pho";  #2016apr23: concatenate for ReEntry()
    }  # 2016apr05: end of test for plural subject-number;
  }  # 2016apr03: end of test for second-person;
  if ($dba == 3) {  # 2016apr3: third person;
    if ($snu == 1) {  # 2016ap03: subject-number parameter;
      $pho = "\x85";  # 2016apr06: "Е" Cyrillic
      print "$pho";  # 2016apr06: after stem, output this inflection.
      $idea = "$idea" . "$pho";  #2016apr23: concatenate for ReEntry()
      $pho = "\x92";  # 2016apr06: "Т" Cyrillic
      print "$pho ";  # 2016apr06: after stem, output this inflection.
      $idea = "$idea" . "$pho";  #2016apr23: concatenate for ReEntry()
    }  # 2016apr03: end of test for singular subject-number;
    if ($snu == 2) {  # 2016ap06: subject-number parameter;
      $pho = "\x9E";  # 2016apr06: "Ю" Cyrillic
      print "$pho";  # 2016apr06: after stem, output this inflection.
      $idea = "$idea" . "$pho";  #2016apr23: concatenate for ReEntry()
      $pho = "\x92";  # 2016apr06: "Т" Cyrillic
      print "$pho ";  # 2016apr06: after stem, output this inflection.
      $idea = "$idea" . "$pho";  #2016apr23: concatenate for ReEntry()
    }  # 2016apr06: end of test for plural subject-number;
  }  # 2016apr03: end of test for third-person;
  $idea = "$idea" . " ";  #2016apr23: add a space after verb for ReEntry()
  $gencon = 1;  # 2016apr05: to prevent unwarranted calling of Speech()
}  # 2016apr12: RuVerbGen() returns to RuVerbPhrase()


sub EnVerbGen() {  # http://ai.neocities.org/EnVerbGen.html
  $c1="";$c2="";$c3="";$c4="";$c5="";$c6="";$c7="";$c8="";        # 2019-10-30
  $c9="";$c10="";$c11="";$c12="";$c13="";$c14="";$c16="";$c16=""; # 2019-10-30
  $b16="";$b15="";$b14="";$b13="";  # 2019-10-23: empty OutBuffer() before input.
  $b12="";$b11="";$b10="";$b9="";$b8="";$b7=""; # 2019-10-23: expandable reverse order
  $b6="";$b5="";$b4="";$b3="";$b2="";$b1="";    # 2019-10-23: last 6 chars in word.

  $gencon = 1;  # 2019-10-21: possibly for inhibiting AudBuffer() during EnVerbGen()
  $PAL = 0;  # 2019-10-30: for inhibiting AudBuffer() during EnVerbGen()
  $audbase = 0;  # 2019-10-21: TEST; TRUNCATE
  if ($audbase == 0 && $verbpsi > 0) {  # 2018-10-20: for lack of starting point...
    for (my $i=$t; $i>$midway; $i--) {  # 2018-10-20: search backwards in time.
      my @k=split(',',$psy[$i]);  # 2018-10-20: inspect @psy flag-panel.
      if ($k[1]==$verbpsi && $k[20] > 0) {  # 2019-08-02: verb with recall-vector?
        $audbase = $k[20];  # 2019-08-02: initial base-time for generating verb-form
        last;  # 2018-10-20: one example is enough.
      }  # 2018-10-20: end of test for modificand verb and auditory engram
    }  # 2018-10-20: end of backwards loop in search of audbase starting point.
  }  # 2018-10-20: end of test for lack of $audbase and presence of $verbpsi.
  my $binc = 0;  # 2018-10-09: Buffer-INCrement counter used only locally.
  for (my $i=0; $i<17; $i++) {  # 2019-10-21
    my @aud=split(',',$ear[$audbase]);  # 2019-10-21: Examine the @ear array.
     $ear[$i] = "$aud[0],0,$aud[2]";  # 2016feb03: Reset act to zero.
     if ($aud[0] ne " ") { $abc = $aud[0]; AudBuffer(); $audbase++; }  # 2019-10-21:
     if ($aud[0] eq " ") { last }  # 2019-10-21: stop transfer at end of word.
  }  # 2019-10-21: end of forwards sweep through auditory memory.
  do {  # 2018-10-09: next loop uses OutBuffer();
    OutBuffer();  # 2018-10-09
    if ($binc == 1) {   # 2018-10-09:
      if ($b16 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b16";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b16";  # 2019-06-13: concatenate the character.
        $pho = $b16;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b16 position in OutBuffer.
    }  # 2016apr23: end of outputting character and concatenating for ReEntry().
    if ($binc == 2) {   # 2018-10-09
      if ($b15 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b15";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b15";  # 2019-06-13: concatenate the character.
        $pho = $b15;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b15 position in OutBuffer.
    }  # 2016apr23: end of outputting character and concatenating for ReEntry().
    if ($binc == 3) {   # 2018-10-09
      if ($b14 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b14";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b14";  # 2019-06-13: concatenate the character.
        $pho = $b14;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b14 position in OutBuffer.
    }  # 2016apr24: end of outputting character and concatenating for ReEntry().
    if ($binc == 4) { # 2018-10-09
      if ($b13 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b13";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b13";  # 2019-06-13: concatenate the character.
        $pho = $b13;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b13 position in OutBuffer.
    }  # 2016apr24: end of outputting character and concatenating for ReEntry().
    if ($binc == 5) {   # 2018-10-09
      if ($b12 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b12";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b12";  # 2019-06-13: concatenate the character.
        $pho = $b12;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b12 position in OutBuffer.
    }  # 2016apr24: end of outputting character and concatenating for ReEntry().
    if ($binc == 6) {   # 2018-10-09
      if ($b11 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b11";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b11";  # 2019-06-13: concatenate the character.
        $pho = $b11;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b11 position in OutBuffer.
    }  # 2016apr24: end of outputting character and concatenating for ReEntry().
    if ($binc == 7) { # 2018-10-09
      if ($b10 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b10";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b10";  # 2019-06-13: concatenate the character.
        $pho = $b10;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b10 position in OutBuffer.
    }  # 2016apr24: end of outputting character and concatenating for ReEntry().
    if ($binc == 8) { # 2018-10-09
      if ($b9 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b9";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b9";  # 2019-06-13: concatenate the character.
        $pho = $b9;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b9 position in OutBuffer.
    }  # 2016apr24: end of outputting character and concatenating for ReEntry().
    if ($binc == 9) {  # 2018-10-09
      if ($b8 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b8";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b8";  # 2019-06-13: concatenate the character.
        $pho = $b8;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b8 position in OutBuffer.
    }  # 2016apr24: end of outputting character and concatenating for ReEntry().
    if ($binc == 10) {  # 2018-10-09
      if ($b7 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b7";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b7";  # 2019-06-13: concatenate the character.
        $pho = $b7;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b7 position in OutBuffer.
    }  # 2016apr23: end of outputting character and concatenating for ReEntry().
    if ($binc == 11) {  # 2018-10-09
      if ($b6 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b6";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b6";  # 2019-06-13: concatenate the character.
        $pho = $b6;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b6 position in OutBuffer.
    }  # 2016apr23: end of outputting character and concatenating for ReEntry().
    if ($binc == 12) {  # 2018-10-09
      if ($b5 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b5";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b5";  # 2019-06-13: concatenate the character.
        $pho = $b5;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b5 position in OutBuffer.
    }  # 2016apr23: end of outputting character and concatenating for ReEntry().
    if ($binc == 13) {  # 2018-10-09
      if ($b4 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b4";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b4";  # 2019-06-13: concatenate the character.
        $pho = $b4;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b4 position in OutBuffer.
    }  # 2016apr23: end of outputting character and concatenating for ReEntry().
    if ($binc == 14) {  # 2018-10-09
      if ($b3 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b3";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b3";  # 2019-06-13: concatenate the character.
        $pho = $b3;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b3 position in OutBuffer.
    }  # 2018-10-09: end of outputting character and concatenating for ReEntry().
    if ($binc == 15) {  # 2018-10-09
      if ($b2 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b2";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b2";  # 2019-06-13: concatenate the character.
        $pho = $b2;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b2 position in OutBuffer.
    }  # 2018-10-09: end of outputting character and concatenating for ReEntry().
    if ($binc == 16) {  # 2018-10-09
      if ($b1 ne "") {  # 2019-06-13: prepare to call AudInput for re-entry
        print "$b1";    # 2019-06-13: show the character as part of the output.
        $idea = "$idea" . "$b1";  # 2019-06-13: concatenate the character.
        $pho = $b1;  # 2019-06-13: for sake of AudInput()
        AudInput();  # 2019-06-13: for re-entry of generated verb-form
      }  # 2019-06-13: end of test for contents of $b1 position in OutBuffer.
    }  # 2018-10-09: end of outputting character and concatenating for ReEntry().
    $binc++;  # 2018-10-09: OutBuffer() "b" increment
  } while ($binc < 17);  # 2018-10-09: while inspecting OutBuffer()
  $c1=""; $c2=""; $c3=""; $c4="";  # 2019-06-10: clear out the AudBuffer()
  $c5=""; $c6=""; $c7=""; $c8="";  # 2019-06-10: clear out the AudBuffer()
  $c9=""; $c10=""; $c11=""; $c12="";  # 2019-06-10: clear out the AudBuffer()
  $c13=""; $c14=""; $c15=""; $c16="";  # 2018-10-09: clear out the AudBuffer()
  $binc = 0;  # 2018-10-09: Reset the b-increment variable after use.
  if ($prsn == 1) {  # 2018-10-20: first person;
    if ($snu == 1) {  # 2018-10-09: subject-number parameter;
      $pho = " ";  # 2018-10-09:
      print "$pho";  # 2018-10-09: after stem, output this inflection.
      $idea = "$idea" . "$pho";  # 2018-10-09: concatenate for ReEntry()
      $num = $snu;  # 2019-06-13: instantiate grammatical number of the verb-form.
      AudInput();  # 2019-06-13: for subsequent retrievability of verb-form.
    }  # 2018-10-09: end of test for singular subject-number;
    if ($snu == 2) {  # 2018-10-09: subject-number parameter;
      $pho = " ";  # 2018-10-09:
      print "$pho";  # 2018-10-09: after stem, output this inflection.
      $idea = "$idea" . "$pho";  # 2018-10-09: concatenate for ReEntry()
      $pho = "\x8C";  # 2018-10-09
      print "$pho";  # 2018-10-09: after stem, output this inflection.
      $idea = "$idea" . "$pho";  # 2018-10-09: concatenate for ReEntry()
      $num = $snu;  # 2019-06-13: instantiate grammatical number of the verb-form.
      AudInput();  # 2019-06-13: for subsequent retrievability of verb-form.
    }  # 2018-10-09: end of test for plural subject-number;
  }  # 2018-10-09: end of test for first-person;
  if ($prsn == 2) {  # 2018-10-20: second person;
    if ($snu == 1) {  # 2018-10-09: subject-number parameter;
      $pho = " ";  # 2018-10-09:
      print "$pho";  # 2018-10-09: after stem, output this inflection.
      $idea = "$idea" . "$pho";  # 2018-10-09: concatenate for ReEntry()
      $pho = " ";  # 2018-10-09:
      print "$pho";  # 2018-10-09: after stem, output this inflection.
      $idea = "$idea" . "$pho";  # 2018-10-09: concatenate for ReEntry()
      $pho = " ";  # 2018-10-09:
      print "$pho ";  # 2018-10-09: after stem, output this inflection.
      $idea = "$idea" . "$pho";  # 2018-10-09: concatenate for ReEntry()
      $num = $snu;  # 2019-06-13: instantiate grammatical number of the verb-form.
      AudInput();  # 2019-06-13: for subsequent retrievability of verb-form.
    }  # 2018-10-09: end of test for singular subject-number;
    if ($snu == 2) {  # 2018-10-09: subject-number parameter;
      $pho = " ";  # 2018-10-09:
      print "$pho";  # 2018-10-09: after stem, output this inflection.
      $idea = "$idea" . "$pho";  # 2018-10-09 concatenate for ReEntry()
      $pho = " ";  # 2018-10-09:
      print "$pho";  # 2018-10-09: after stem, output this inflection.
      $idea = "$idea" . "$pho";  # 2018-10-09: concatenate for ReEntry()
      $pho = " ";  # 2018-10-09:
      print "$pho";  # 2018-10-09: after stem, output this inflection.
      $idea = "$idea" . "$pho";  # 2018-10-09: concatenate for ReEntry()
      $num = $snu;  # 2019-06-13: instantiate grammatical number of the verb-form.
      AudInput();  # 2019-06-13: for subsequent retrievability of verb-form.
    }  # 2018-10-09: end of test for plural subject-number;
  }  # 2016apr03: end of test for second-person;
  if ($prsn == 3) {  # 2018-10-20: third person;
    if ($snu == 1) {  # 2018-10-09: subject-number parameter;
      if ($b2 eq "C" && $b1 eq "H") {  # 2019-06-13: last two stem-parameters
        $pho = "E";  # 2018-10-20: add one single "E"
        print "$pho";  # 2018-10-20: after stem, output this inflection.
        $idea = "$idea" . "$pho";  # 2018-10-20: concatenate for ReEntry()
        $num = $snu;  # 2019-06-13: instantiate grammatical number of the verb-form.
        AudInput();  # 2019-06-13: for subsequent retrievability of verb-form.
      }  # 2018-10-20: end of test for verb ending in "-ch"
      if ($b2 eq "S" && $b1 eq "H") {  # 2019-06-13: last two stem-parameters
        $pho = "E";  # 2018-10-20: add one single "E"
        print "$pho";  # 2018-10-20: after stem, output this inflection.
        $idea = "$idea" . "$pho";  # 2018-10-20: concatenate for ReEntry()
        $num = $snu;  # 2019-06-13: instantiate grammatical number of the verb-form.
        AudInput();  # 2019-06-13: for subsequent retrievability of verb-form.
      }  # 2018-10-20: end of test for verb ending in "-sh"
      if ($b2 eq "S" && $b1 eq "S") {  # 2019-06-13: last two stem-parameters
        $pho = "E";  # 2018-10-21: add one single "E"
        print "$pho";  # 2018-10-21: after stem, output this inflection.
        $idea = "$idea" . "$pho";  # 2018-10-21: concatenate for ReEntry()
        $num = $snu;  # 2019-06-13: instantiate grammatical number of the verb-form.
        AudInput();  # 2019-06-13: for subsequent retrievability of verb-form.
      }  # 2018-10-21: end of test for verb ending in "-ss"
      if ($b2 eq "T" && $b1 eq "Z") {  # 2019-06-13: last two stem-parameters
        $pho = "E";  # 2018-10-21: add one single "E"
        print "$pho";  # 2018-10-21: after stem, output this inflection.
        $idea = "$idea" . "$pho";  # 2018-10-21: concatenate for ReEntry()
        $num = $snu;  # 2019-06-13: instantiate grammatical number of the verb-form.
        AudInput();  # 2019-06-13: for subsequent retrievability of verb-form.
      }  # 2018-10-21: end of test for verb ending in "-tz"
      if ($b2 eq "Z" && $b1 eq "Z") {  # 2019-06-13: last two stem-parameters
        $pho = "E";  # 2018-10-21: add one single "E"
        print "$pho";  # 2018-10-21: after stem, output this inflection.
        $idea = "$idea" . "$pho";  # 2018-10-21: concatenate for ReEntry()
        $num = $snu;  # 2019-06-13: instantiate grammatical number of the verb-form.
        AudInput();  # 2019-06-13: for subsequent retrievability of verb-form.
      }  # 2018-10-21: end of test for verb ending in "-zz"
      if ($b1 eq "X") {  # 2019-06-13: final stem-parameter
        $pho = "E";  # 2018-10-21: add one single "E"
        print "$pho";  # 2018-10-21: after stem, output this inflection.
        $idea = "$idea" . "$pho";  # 2018-10-21: concatenate for ReEntry()
        $num = $snu;  # 2019-06-13: instantiate grammatical number of the verb-form.
        AudInput();  # 2019-06-13: for subsequent retrievability of verb-form.
      }  # 2018-10-21: end of test for verb ending in "-x"
      $pho = "S";  # 2018-10-09: add one single "S"
      print "$pho";  # 2018-10-09: after stem, output this inflection.
      $idea = "$idea" . "$pho";  # 2018-10-09: concatenate for ReEntry()
      $output = "$output" . "$idea" . " ";  # 2018-10-09: concatenate
      $num = $snu;  # 2019-06-13: instantiate grammatical number of the verb-form.
      AudInput();  # 2019-06-13: for subsequent retrievability of verb-form.
    }  # 2018-10-09: end of test for singular subject-number;
    if ($snu == 2) {  # 2018-10-09: subject-number parameter;
      $pho = " ";  # 2018-10-09
      print "$pho";  # 2018-10-09: after stem, output this inflection.
      $idea = "$idea" . "$pho";  # 2018-10-09: concatenate for ReEntry()
      $pho = " ";  # 2018-10-09
      print "$pho ";  # 2018-10-09: after stem, output this inflection.
      $idea = "$idea" . "$pho";  #2018-10-09: concatenate for ReEntry()
      $num = $snu;  # 2019-06-13: instantiate grammatical number of the verb-form.
      AudInput();  # 2019-06-13: for subsequent retrievability of verb-form.
    }  # 2018-10-09: end of test for plural subject-number;
  }  # 2018-10-09: end of test for third-person;
  $idea = "$idea" . " ";  #2018-10-09: add a space after verb for ReEntry()
  $gencon = 1;  # 2018-10-09: to prevent unwarranted calling of Speech()
  $PAL = 1;  # 2019-10-30: to stop inhibiting AudBuffer() during EnVerbGen()
}  # 2019-10-30: EnVerbGen() returns to EnVerbPhrase()


sub EnVerbPhrase() {  # http://ai.neocities.org/EnVerbPhrase.html
  $act = 0;  # 2016apr25: Start with zero to look for psi1 higher than $act.
  $aud = 0;  # 2018-06-28: prevent carry-over.
  $audjuste = 0;  # 2016feb17: prevent carry-over
  $motjuste = 0;  # 2016feb17:
  my $negjux = 0;  # 2016jun17: flag for 250=NOT juxtaposed to a verb;
  $vphraud = 0;   # 2016apr10: initially
  if ($whatcon == 1 && $qv2psi > 0) {  # 2018-09-12: if WHAT...THINK or KNOW, etc.
    $motjuste = $qv2psi;  # 2018-09-12: encourage selection of ideation query-verb.
  }  # 2018-09-12: end of test for WHAT...IDEATION query.
  if ($verblock > 0 && $motjuste != 886) {  # 2018-12-10: positive verblock; not 886=THINK
    if ($whatcon > 0) {  # 2019-01-28: if SpreadAct() answers a what-query...
      if ($catverb==$motjuste && $conj > 0) {  # 2019-01-28: after use of a conjunction...
        if ($nounlock>0) { $dirobj = 1 }  # 2019-01-28: for sake of direct object.
        $etc = 0;  # 2019-03-02: TEST
        EnNounPhrase();  # 2019-01-28: after omitting verb, output direct-object.
        return;  # 2019-01-28: omit the verb after the use of a conjunction.
      }  # 2019-01-28: end of test for the chain-flag matching the selected verb.
    }  # 2019-01-28: end of test for SpreadAct() answering a what-query.
    my @k=split(',',$psy[$verblock]);  # 2016apr13: inspect t=verblock row;
    $verbpsi = $k[1];   # 2017jun08: lexical verbpsi;
    if ($k[11] > 0) { $seq = $k[11]; $tselp = $verblock }  # 2019-08-01: capture seq-tag.
    $svo2 = $k[1];      # 2017-06-08: item #2 of subj - verb - ind.obj - dir.obj
    if ($seq > 0 && $wherecon == 0) {  # 2018-11-04: if seq-tag is positive...
      for (my $i=$t; $i>$midway; $i--) {  # 2018-11-04: search backwards in time.
        my @k=split(',',$psy[$i]);  # 2018-11-04: inspect @psy flag-panel
        if ($k[1]==$seq && $k[6]==6) { # 2018-11-04: if engram matches $seq...
          $prep = $k[1];  # 2018-11-04: identify the preposition as such for EnPrep()
          last;  # 2018-11-04: one instance of identification is enough.
        }  # 2018-11-04: identify any preposition
      }  # 2018-11-04: end of loop searching for "seq" to discover its "pos".
      until ($eureka == $prep) {  # 2018-11-04: "Perl by Example" p. 193
        $tselp++;  # 2018-11-04: increment the not-yet-true $tselp variable
        my @k=split(',',$psy[$tselp]);  # 2018-11-04: inspect @psy flag-panel
        $eureka = $k[1];  # 2018-11-04: change $k[1] to an initialized value.
        if ($tselp > $cns) { last }  # 2018-11-04: escape from any runaway-loop.
      }  # 2018-11-04: end of self-terminating loop
    }  # 2018-11-04: end of test for positive seq-tag.
    if ($k[5] == 250) { $negjux = 250; }  # 2018-07-06: TEST
    $prsn = $k[7];      # 2018-10-08: for sake of EnAuxVerb()
    $subjnum = $k[8];   # 2018-10-08: for sake of EnAuxVerb()
    $nounlock = $k[14]; # 2019-08-02 BUGFIX: $tkb becomes $nounlock.
#   if ($k[19] > 0) { $tpr = $k[19] }  # 2019-08-06: trapping for time-of-preposition
    if ($k[19] > 0) { $tvpr = $k[19] }  # 2019-10-17: trap time-of-verb-preposition
    if ($k[20] > 0) { $audbase = $k[20] }  # 2019-08-01: EnVerbGen parameter;
    if ($k[20] > 0) { $aud = $k[20] }      # 2019-08-01: auditory recall-vector
    if ($k[20] > 0) { $vphraud = $k[20] }  # 2019-08-01: auditory recall-vector
    if ($k[20]==0) {  # 2019-08-01: if there is no auditory recall-vector "rv"...
      for (my $i=$tpu; $i>$midway; $i--) {  # 2018-10-08: search backwards in time.
        my @k=split(',',$psy[$i]);  # 2018-10-08: inspect @psy flag-panel
        if ($k[1] == $verbpsi && $k[1] != 800 && $negjux != 250) {  # 2018-10-08:
          if ($qv2num > 0) { $subjnum = $qv2num }  # 2018-10-08: for query-response.
          if ($k[1]==$verbpsi && $k[8]==$snu && $k[7]==$prsn) {  # 2018-10-08:
            if ($k[20] > 0 ) { $aud = $k[20] }  # 2019-08-01: find positive rv;
            if ($k[20] > 0 ) { $vphraud = $k[20] }  # 2019-08-01: auditory recall-vector
            if ($k[20] > 0 ) { $motjuste = $k[1] }  # 2019-08-01:
            if ($k[20] > 0 ) { last }  # 2019-08-01: exit loop if rv is found.
          } # 2018-10-08: end of test to find regular or irregular verb-form
        }  # 2018-10-08: end of search for non-infinitive verb-form.
      }  # 2018-10-08: end of loop searching for "rv" based on parameters.
    }  # 2018-10-08: end of test for no recall-vector rv as in InFerence()
    if ($subjpsi==701 || $subjpsi==731) { $prsn=1 } # 2016apr14: I or WE
    if ($svo1==701) { $prsn=1; $subjnum=1 } # 2017-06-07: I
    if ($subjpsi==707 || $subjpsi==737) { $prsn=2 } # 2016apr14: "YOU"
    if ($subjpsi==713 || $subjpsi==719) { $prsn=3 } # 2016apr14: HE; SHE
    if ($subjpsi==725 || $subjpsi==743) { $prsn=3 } # 2016apr14: IT THEY
    $dba = $prsn;  # 2016apr14:  parameter for VerbGen()
    for (my $i=$tpu; $i>$midway; $i--) {  # 2018-06-28: search the @psy array
      my @k=split(',',$psy[$i]);  # 2016apr14: inspect t=verblock row;
      if ($k[1] == $verbpsi && $k[1] == 800) {  # 2017jun08: special 800=BE-verb
        if ($k[6] == 8) {  # 2017jun08: select only $pos=8 verbs, even homonyms
        # Following code accepts only a verb-form matching three
        # requirements: [ ]same concept; [ ]num(ber); and [ ]person:
          if ($qv2num > 0) { $subjnum = $qv2num }  # 2017-10-22: for query-response.
          if ($k[1]==$verbpsi && $k[8]==$subjnum && $k[7]==$prsn) {  # 2017-06-08
#           if ($k[19] > 0) { $tpr = $k[19] }  # 2019-08-09: trap time-of-preposition
            if ($k[20] > 0) { $aud = $k[20] }      # 2019-08-01: find positive $rv;
            if ($k[20] > 0) { $vphraud = $k[20] }  # 2019-08-01: find positive $rv;
            if ($k[20] > 0) { last }  # 2019-08-01: exit loop once $rv is found.
          } # 2016apr14: end of test to find regular or irregular verb-form
        }  # 2016apr14: end of test for part-of-speech $pos == "8" (verb)
      }  # 2016apr14: end of test for correct verb-concept $verbpsi
    }  # 2016apr14: End of (for loop) searching for correct verb-form.
  }  # 2016apr13: end of test for a positive verblock.
  if ($vphraud > 0) { $aud = $vphraud }  # 2016apr14: correct form?
  if ($vphraud > 0) { $audjuste = $vphraud }  # 2016apr14: correct form?
  if ($verblock == 0)  {  # 2016apr13: prevent false negations;
    for (my $i=$t; $i>$midway; $i--) {  # 2016feb17: search backwards in time.
      my @k=split(',',$psy[$i]);  # 2016mar15: inspect @psy knowledge-nodes.
      if ($k[2] == 1) {  # 2018-09-27: select only English words
        if ($k[6] == 8) {  # 2017jun08: select only k6 $pos=8 verbs
          if ($whatcon==1 && $k[1] == $qv2psi) {  # 2018-09-12: query-verb found?
            $aud = $k[20];  # 2019-08-01: recall-vector "rv" for Speech()
            if ($qv2psi==823 && $taccon > 0) { $qv4psi = $taccon }  # 2019-11-02:
            last;  # 2018-09-12: peremptory retrieval of ideation-verb.
          }  # 2018-09-12: end of test for WHAT...IDEATION query.
          if ($k[3] > $act) {  # 2018-10-08: if k3 is higher than "act"...
            $tselv = $i;  # 2016apr13: retain time of winning verb;
            $motjuste = $k[1];  # 2017jun08: Select the most active verb.
            $svo2 = $k[1];      # 2017-06-08: for calling VisRecog()
            $audjuste = $k[20]; # 2019-08-01: recall-vector $rv for Speech()
            $act = $k[3];  # 2018-10-08: to test for a higher k[3]
          }  # 2016feb17: end of test of activation-level
        }  # 2016feb17: end of test for part-of-speech $pos == "8" verb
      }  # 2016feb17: end of test for human language code $hlc == "en"
    }  # 2016mar12: End of (for loop) searching for most active "motjuste"
  }  # 2016apr13: end of test for absence of a verblock from subject to verb
  if ($negjux == 250) {  # 2016jun17: if verb is negated with 250=NOT;
    if ($svo2 != 800) {  # 2017may29: if other than an 800=BE verb;
      $auxverb = 818;  # 2018-12-10: 818=DO as auxiliary verb;
      EnAuxVerb();  # 2018-12-10: to say 818=DO or "DOES";
      $auxverb = 0;  # 2016jun17: reset for safety.
      for (my $i=$t; $i>$midway; $i--) {  # 2016jun17: search for 250=NOT
        my @k=split(',',$psy[$i]);  # 2016jun17: examine @psy array;
        if ($k[1] == 250) {  # 2017jun08: if 250=NOT is found;
          $audjuste = $k[20];  # 2019-08-01: "NOT" recall-vector;
          $aud = $k[20];  # 2019-08-01: "NOT" recall-vector for Speech()
          if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-01: insurance
        }  # 2016jun17: End of search for 250=NOT;
      }  # 2016jun17: End of search loop from $t back to $midway.
      Speech();  # 2016jun17: speak the word starting at the $aud time.
      $aud = 0;  # 2018-06-28: reset for safety.
    }  # 2016jun17: end of test to prevent auxiliary with 800=BE verb.
  }  # 2016jun17: end of test for 250=NOT negjux.
  $motjuste = $verbpsi; # 2018-06-28: to search for verb-form.
  if ($vphraud != 0) { $aud = $vphraud }  # 2016apr10: Accept rv of 3 parameters.
  if ($subjpsi == 701) { $dba = 1; }  # 2016apr10: "I" 1st person sing.
  if ($subjpsi == 707) { $dba = 2; }  # 2016apr10: "you" 2nd person sing.
  if ($subjpsi == 713) { $dba = 3; }  # 2016apr10: "he" 3rd person sing;
  if ($subjpsi == 719) { $dba = 3; }  # 2016apr10: "she" 3rd person sing.
  if ($subjpsi == 725) { $dba = 3; }  # 2016apr10: "it" 3rd person sing.
  if ($subjpsi == 731) { $dba = 1; }  # 2016apr10: "we" 1st person plural
  if ($subjpsi == 737) { $dba = 2; }  # 2016apr10: "you" 2nd person plural
  if ($subjpsi == 743) { $dba = 3; }  # 2016apr10: "they" 3rd person plural
  if ($nphrnum == 0) { $nphrnum = $snu }  # 2018-10-09: restoration
  if ($vphraud == 0) {  # 2016apr10: if not substituted above;
    # 2018-10-09: Following code accepts only a verb-form matching three
    # requirements: [ ]same concept; [ ]num(ber); and [ ]person:
    for (my $i=$tpu; $i>$midway; $i--) {  # 2018-06-28: skip current engrams.
      my @k=split(',',$psy[$i]);  # 2016apr10: inspect @psy lexical nodes
      if ($k[1] == $verbpsi && $k[20] > 0) { $audbase = $k[20] }  # 2019-08-01: 2nd best
      if ($k[1] == $verbpsi && $k[7]==0 && $k[20]>0) { $audbase = $k[20] } # 2019-08-01
      if ($negjux == 250) {  # 2018-12-24: if verb is subject to 250=NOT negation...
        $dba = 0;  # 2018-12-24: k7 "dba" must be zero for infinitive of verb;
        $snu = 0;  # 2018-12-24: subject-number must be zero for infinitive of verb;
      }  # 2018-12-24: end of test for 250=NOT negation of verb.
      if ($k[1] == $verbpsi && $k[7]==$dba && $k[8]==$snu) {  # 2018-12-24
        $vphraud = $k[20];  # 2019-08-01: VerbPhrase auditory engram tag
      }  # 2016apr10: end of test to find regular or irregular verb-form
    }  # 2016apr10: end of (for loop) searching through @psy conceptual array.
  }  # 2016apr10: end of test of $vphraud.
  if ($vphraud == 0) { EnVerbGen() }  # 2018-10-09: if no verb-form, generate it.
  if ($vphraud > 0) { $aud = $vphraud }  # 2016apr10: correct form?
  if ($gencon == 0) {  # 2018-10-09: if no call to EnVerbGen()...
    Speech();  # 2017may29: main call from EnVerbPhrase() to Speech()
    $aud = 0;  # 2016apr20: Reset to prevent carry-over.
  }  # 2018-10-09: end of test to prevent speaking extra verb after EnVerbGen()
  my @k=split(',',$psy[$tselv]);  # 2016apr13: inspect verb at time of selection;
  $psy[$tselv]="$k[0],$k[1],$k[2],-16,$k[4],$k[5],$k[6],"
  . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
  . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]"; # 2019-08-01: flag-panel.
  # 2019-09-27: Above line inserts inhibition upon currently selected English verb.
  if ($tselp > 0 && $prep > 0 && $wherecon == 0) { SpreadAct() }  # 2018-11-04:
  if ($svo2 == 800) {  # 2017may29: if the selected verb is a be-verb
    if ($negjux == 250) {  # 2017may29: if there is a 250=NOT negation flag
      for (my $i=$t; $i>$midway; $i--) {  # 2017may29: search for 250=NOT
        my @k=split(',',$psy[$i]);  # 2017may29: examine @psy array;
        if ($k[1] == 250) {  # 2017jun08: if 250=NOT is found;
          $audjuste = $k[20];  # 2019-08-01: "NOT" recall-vector;
          $aud = $k[20];  # 2019-08-01: "NOT" recall-vector for Speech()
          if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-01: insurance
        }  # 2017may29: End of search for 250=NOT;
      }  # 2017may29: End of search loop from $t back to $midway.
      Speech();  # 2017may29: speak the word starting at the $aud time.
      $negjux = 0;  # 2017may29: reset for safety.
    }  # 2017may29: end of test for negated be-verb
  }  # 2017may29: end of test for 800=BE verb in case of negation.
  if ($nounlock>0) { $dirobj = 1 }  # 2018-10-08: for sake of intransitive verbs.
  if ($subjpsi == 701) {  # 2017-04-11: only for subject 701=I;
    if ($svo2 == 823) {     # 2019-11-03: only for verb 823=FEEL;
      if ($svo4 == 0) {  # 2019-11-03: if 823=FEEL has no direct object
        TacRecog();  # 2019-11-03: to supply a direct object for 823=FEEL
        if ($haptac != 755) { EnArticle() }  # 2019-11-04: insert "A" or "THE"
        for (my $i=$t; $i>$midway; $i--) {  # 2019-11-03: search backwards in time.
          my @k=split(',',$psy[$i]);  # 2019-11-03: inspect @psy flag-panel
          if ($k[1]==$haptac) {  # 2019-11-03: if sensation reported by TacRecog()
            $aud = $k[20];  # 2019-11-03: find auditory recall-vector
            Speech();  # 2019-11-03: speak the name of the reported sensation.
            $hap = 0;     # 2019-11-04: reset after use.
            $haptac = 0;  # 2019-11-04: reset after use.
            last;  # 2019-11-03: one engram is enough.
          }  # 2019-11-03: end of test for $haptac as reported by TacRecog.
        }  # 2019-11-03: end of loop searching for object of 823=FEEL.
        return;  # 2019-11-04: abandon remainder of EnVerbPhrase()
      }  # 2019-11-03: end of test for direct object.
    }  # 2019-11-03: end of test for "823=FEEL".
    if ($svo2 == 870) {     # 2018-12-10: only for verb 870=SEE;
      if ($svo4 == 0) {  # 2017-04-11: if SEE has no direct object
      # 2017-04-11: i.e., if there is no robot camera for computer vision...
        VisRecog();  # 2017-04-11: a challenge for robot AI coders
        $svo2 = 0;  # 2017-04-11: reset for safety.
        $svo4 = 0;  # 2017-04-11: reset for safety.
        return;      # 2017-04-11: abandon rest of VerbPhrase
      }  # 2017-04-30: end of test for direct object;
    }  # 2018-12-10: end of test for "870=SEE";
  }  # 2017-04-11: end of test for ego-concept 701=I as subject.
# if ($dirobj==1 && $qv2psi != 886) {  # 2018-12-10: 886=THINK
  if ($dirobj==1 && $qv2psi != 886 && $dunnocon != 1) {  # 2018-11-10: 886=THINK
    EnNounPhrase();  # 2016mar10: for direct object or predicate nominative
  }  # 2018-09-30: end of test to skip direct-object in favor of ConJoin().
# if ($tpr > 0) {  # 2019-08-06: if there is a positive time-of-preposition
  if ($tvpr > 0) {  # 2019-10-17: if there is a positive time-of-verb-preposition
    EnPrep();  # 2019-08-06: for a prepositional phrase
#   $tpr = 0;  # 2019-08-09: reset for safety.
    $tvpr = 0;  # 2019-10-17: reset for safety.
  }  # 2019-08-06: end of test for a preposition linked to the verb.
  if ($whatcon == 0) {  # 2018-09-12: if no what-query being answered...
    if ($actpsi > 0) {  # 2018-06-27: if there is activation to spread...
      SpreadAct();  # 2018-06-27: for a chain of thought.
      $actpsi = 0;  # 2018-06-27: reset to zero for safety.
    }  # 2018-06-27: end of test for positive $actpsi.
  }  # 2018-09-12: end of whatcon-test to fetch conjunction instead of object.
  $dirobj = 0;  # 2016mar29: reset flag after thinking direct object.
  if ($prepgen > 0) { EnPrep() }  # 2016mar30: if "Where?" call EnPrep().
  $audbase = 0;  # 2016apr25: reset for safety.
  $gencon = 0;   # 2018-10-21: reset in case set by EnVerbGen()
  $num = 0;      # 2017-10-22: reset after output of one query-response.
  $qv2num = 0;   # 2017-10-22: reset after output of one query-response.
}  # 2019-11-04: EnVerbPhrase() returns to Indicative() module


sub RuVerbPhrase() {  # 2016feb24: thinking with Russian verbs
  $act = 0;  # 2016apr25: Start with zero to look for psi1 higher than $act.
  if ($subjpsi==1701 || $subjpsi==1731) { $prsn = 1 }  # 2016apr02: I or we
  if ($subjpsi==1707 || $subjpsi==1737) { $prsn = 2 }  # 2016apr02: you
  if ($subjpsi==1713 || $subjpsi==1719) { $prsn = 3 }  # 2016apr02: he, she
  if ($subjpsi==1725 || $subjpsi==1743) { $prsn = 3 }  # 2016apr02: it, they
  $audjuste = 0;  # 2016feb24: prevent carry-over
  $motjuste = 0;  # 2016feb24:
  $vphraud = 0;   # 2016apr12: initially, until found or generated by RuVerbGen()
  if ($verblock > 0) {  # 2016apr27: is there already a verblock?
    my @k=split(',',$psy[$verblock]);  # 2016apr28: inspect t=verblock row;
    $verbpsi = $k[1];   # 2017-06-17: lexical verbpsi;
    $svo2 = $k[1];      # 2017-06-30: item #2 of subj - verb - ind.obj - dir.obj
    $negjux = $k[5];    # 2017-06-30: for negation of verb;
    if ($k[13]>0) { $nounlock = $k[13] }  # 2018-09-27: TEST $tkb becomes $nounlock.
    $audbase = $k[20];  # 2019-08-08: VerbGen parameter;
    if ($k[14] > 0) { $audbase = $k[14] }  # 2017-06-17: VerbGen parameter;
    if ($k[20] > 0) { $vphraud = $k[20] }  # 2019-08-02: auditory recall-vector
    if ($subjpsi==1701 || $subjpsi==1731) { $prsn = 1 }  # 2016apr28: I or we
    if ($svo1==1701) { $prsn=1; $subjnum=1 } # 2017-06-30: I
    if ($subjpsi==1707 || $subjpsi==1737) { $prsn = 2 }  # 2016apr28: you
    if ($subjpsi==1713 || $subjpsi==1719) { $prsn = 3 }  # 2016apr28: he, she
    if ($subjpsi==1725 || $subjpsi==1743) { $prsn = 3 }  # 2016apr28: it, they
    $dba = $prsn;  # 2016apr28:  parameter for VerbGen()
    $vphraud = 0;  # 2016apr28: until a known verb is found;
    for (my $i=$t; $i>$midway; $i--) {  # 2016apr30: include recent input.
      my @k=split(',',$psy[$i]);  # 2016apr28: inspect t=verblock row;
      if ($k[1] == $verbpsi && $k[1] == 1800) {  # 2017-06-25: special 1800=BE-verb
        if ($k[6] == 8) {  # 2017-06-17: select only $pos=8 verbs, even homonyms
        # Following code accepts only a verb-form matching three
        # requirements: [ ]same concept; [ ]num(ber); and [ ]person:
          if ($k[1]==$verbpsi && $k[7]==$dba && $k[8]==$nphrnum) {  # 2019-06-09
            if ($k[20] > 0) { $aud = $k[20] }      # 2019-08-02: find positive $rv;
            if ($k[20] > 0) { $vphraud = $k[20] }  # 2019-08-02: find positive $rv;
            if ($verbpsi == 1800) { $aud = 0; $vphraud = 0; } # 2017-09-10: 1800=BE
            if ($k[20] > 0) { last }  # 2019-08-02: exit loop once $rv is found.
          } # 2016apr28: end of test to find regular or irregular verb-form
        }  # 2016apr28: end of test for part-of-speech $pos == "8" (verb)
      }  # 2016apr28: end of test for correct verb-concept $verbpsi
      if ($k[1] == $verbpsi && $k[1] != 1800) {  # 2018-09-12: other than 1800=BE
        if ($k[6] == 8) {  # 2017-06-17: select only $pos=8 verbs, even homonyms
          if ($k[1]==$verbpsi && $k[7]==$dba && $k[8]==$nphrnum) {  # 2019-06-09
            if ($k[20] > 0) { $aud = $k[20] }      # 2019-08-02: find positive $rv;
            if ($k[20] > 0) { $vphraud = $k[20] }  # 2019-08-02: find positive $rv;
            if ($k[20] > 0) { last }  # 2019-08-02: exit loop once $rv is found.
          } # 2016apr28: end of test to find regular or irregular verb-form
        }  # 2016apr28: end of test for part-of-speech $pos == "8" (verb)
      }  # 2016apr28: end of test for correct verb-concept $verbpsi
    }  # 2016apr28: End of (for loop) searching for correct verb-form.
    @k=split(',',$psy[$verblock]);  # 2019-06-13: inspect t=verblock row;
    if ($k[20] > 0) { $vphraud = $k[20] }  # 2019-08-02: find positive $rv;
  }  # 2016apr28: end of test for a positive verblock.
  if ($verblock == 0) { print "RuVP: mj= $motjuste act= $act"; }  # 2016may21; TEST
  if ($vphraud > 0) { $aud = $vphraud }  # 2017-06-30: correct form?
  if ($vphraud > 0) { $audjuste = $vphraud }  # 2017-06-30: correct form?
  if ($verblock == 0)  {  # 2017-06-30: prevent false negations;
    for (my $i=$t; $i>$midway; $i--) {  # 2017-06-30: search backwards in time.
      my @k=split(',',$psy[$i]);  # 2017-06-30: inspect @psy knowledge-nodes.
      if ($k[2] == 3) {  # 2018-09-27: select only Russian words
        if ($k[6] == 8) {  # 2017-06-30: select only k6 $pos=8 verbs
          if ($k[3] > 0) {  # 2017-06-30: if k3 activation $act is...
            $tselv = $i;  # 2017-06-30: retain time of winning verb;
            $motjuste = $k[1];  # 2017-06-30: Select the most active verb.
            $svo2 = $k[1];      # 2017-06-30: for calling VisRecog()
            $audjuste = $k[20]; # 2019-08-02: recall-vector $rv for Speech()
          }  # 2017-06-30: end of test of activation-level
        }  # 2017-06-30: end of test for part-of-speech $pos == "8" verb
      }  # 2017-06-30: end of test for human language code $hlc eq 3
    }  # 2017-06-30: End of (for loop) searching for most active "motjuste"
  }  # 2017-06-30: end of test for absence of a verblock from subject to verb
  if ($negjux == 1250) {  # 2017-06-30: if verb is negated with 1250=НЕ for "NOT"
      for (my $i=$t; $i>$midway; $i--) {  # 2017-06-30: search for 1250=НЕ
        my @k=split(',',$psy[$i]);  # 2017-06-30: examine @psy array;
        if ($k[1] == 1250) {  # 2017-06-30: if 1250=НЕ is found;
          $audjuste = $k[20];  # 2019-08-02: 1250=НЕ recall-vector;
          $aud = $k[20];  # 2019-08-02: 1250=НЕ recall-vector for Speech()
          if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-02: insurance
        }  # 2017-06-30: End of search for 1250=НЕ;
      }  # 2017-06-30: End of search loop from $t back to $midway.
      if ($rv == 0) { $rv = 1003 }  # 2017-12-06: rv of ОШИБКА = ERROR
      Speech();  # 2017-06-30: speak the word starting at the $aud time.
  }  #2017-06-30: end of test for a negated Russian verb.
  for (my $i=$t; $i>$midway; $i--) {  # 2016apr28: search backwards in time.
    my @k=split(',',$psy[$i]);  # 2016mar15: inspect @psy knowledge-nodes.
    if ($k[2] == 3) {  # 2018-09-27: select only $hlc=ru Russian words
      if ($k[6] == 8) {  # 2017-06-17: select only $pos=8 verbs
        if ($k[3] > $act) {  # 2017-06-17: If psi3 is higher than "$act";
          $motjuste = $k[1];  # 2017-06-17: Select the most active verb.
          $psy[$i]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
          . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
          . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]"; # 2019-08-02: flag-panel
          $act = $k[3];  # 2017-06-17: for comparison with other candidate verbs.
        }  # 2016feb24: end of test of activation-level
      }  # 2016feb24: end of test for part-of-speech $pos == "8" verb
    }  # 2016feb24: end of test for human language code $hlc == 3
  }  # 2016mar13: End of (for loop) searching for most active "motjuste"
  $aud = $audjuste;  # 2016feb24: for transfer into Speech() module
# $verbpsi = $motjuste; # 2016apr02: to search for verb-form.
# $verbpsi = $motjuste; # 2019-06-03: may be deleting needed value.
  if ($subjpsi == 1701) { $dba = 1; }  # 2016apr06: Я (I) 1st p. sing;
  if ($subjpsi == 1707) { $dba = 2; }  # 2016apr06: ТЫ (you) 2nd p. sing
  if ($subjpsi == 1713) { $dba = 3; }  # 2016apr06: ОН (he) 3rd p. sing;
  if ($subjpsi == 1719) { $dba = 3; }  # 2016apr06: ОНА (she) 3rd p. s;
  if ($subjpsi == 1725) { $dba = 3; }  # 2016apr06: ОНО (it) 3rd p. s;
  if ($subjpsi == 1731) { $dba = 1; }  # 2016apr06: МЫ (we) 1st p. pl;
  if ($subjpsi == 1737) { $dba = 2; }  # 2016apr06: ВЫ (you) 2nd p. pl;
  if ($subjpsi == 1749) { $dba = 2; }  # 2016apr06: ВЫ (you) 2nd p. s;
  if ($subjpsi == 1755) { $dba = 2; }  # 2016apr06: ВЫ (you) 2nd p. pl;
  if ($subjpsi == 1743) { $dba = 3; }  # 2016apr06: ОНИ (they) 3rd p. pl;
  if ($vphraud == 0) {  # 2016apr02: if not substituted above;
    for (my $i=$krt; $i>$midway; $i--) {  # 2016apr03: skip current engrams.
      my @k=split(',',$psy[$i]);  # 2016apr02: inspect @psy lexical nodes
      if ($motjuste != 0 && $k[1] == $motjuste) {  # 2017-06-17: look for $motjuste;
        $svo2 = $motjuste;  # 2017-06-40: TEST
        $audbase = $k[20];  # 2019-08-02: location of quasi-stem for RuVerbGen();
        if ($k[7] == $dba)   {  # 2017-06-17:  for proper person;
          if ($k[8] == $snu) {  # 2017-06-17: subject num(ber) parameter;
            $vphraud = $k[20];  # 2019-08-02: auditory recall-vector;
            $aud = $k[20];  # 2019-09-02: auditory recall-vector;
            last;  # 2016apr02:  exit the loop after first find;
          }  # 2016apr02: end of subject number-parameter test;
        }  # 2016apr02: end of dba-parameter test;
      }  # 2016apr02: end of test for an available $motjuste
    }  # 2016apr02: end of test to find regular or irregular verb-form
  }  # 2016apr02: End of (for loop) searching through @psy conceptual array.
  $dba = 3;  # 2016apr02: a default if not countermanded below:
  if ($subjpsi == 1701) { $dba = 1; }  # 2016apr02: Я (I) 1st p. sing;
  if ($subjpsi == 1707) { $dba = 2; }  # 2016apr02: ТЫ (you) 2nd p. sing.
  if ($subjpsi == 1713) { $dba = 3; }  # 2016apr02: ОН (he) 3rd p. sing;
  if ($subjpsi == 1719) { $dba = 3; }  # 2016apr02: ОНА (she) 3rd p. s;
  if ($subjpsi == 1725) { $dba = 3; }  # 2016apr02: ОНО (it) 3rd p. s;
  if ($subjpsi == 1731) { $dba = 1; }  # 2016apr02: МЫ (we) 1st p. pl;
  if ($subjpsi == 1737) { $dba = 2; }  # 2016apr02: ВЫ (you) 2nd p. pl;
  if ($subjpsi == 1749) { $dba = 2; }  # 2016apr02: ВЫ (you) 2nd p. s;
  if ($subjpsi == 1755) { $dba = 2; }  # 2016apr02: ВЫ (you) 2nd p. pl;
  if ($subjpsi == 1743) { $dba = 3; }  # 2016apr02: ОНИ (they) 3rd p. pl;
  if ($vphraud != 0) { $aud = $vphraud }  # 2016apr03: Accept rv of 3 parameters.
  if ($vphraud == 0) {  # 2016apr03:
    # 2016apr02: Following code accepts only a verb-form matching three
    # requirements: [ ]same concept; [ ]num(ber); and [ ]person:
    for (my $i=$t; $i>$midway; $i--) {  # 2016apr02: search backwards in time.
      my @k=split(',',$psy[$i]);  # 2016apr02: inspect @psy knowledge nodes
      if ($k[1]==$verbpsi && $k[8]==$nphrnum && $k[7]==$prsn) {  # 2017-06-17
        $vphraud = $k[20];  # 2019-08-02: VerbPhrase auditory engram tag
      }  # 2016apr02: end of test to find regular or irregular verb-form
    }  # 2016apr02: End of (for loop) searching through @psy conceptual array.
  }  # 2016apr24: TEST -- A NEEDED BRACKET?
# if ($vphraud == 0) { print "\n RuVP: verbpsi= $verbpsi \n"}; #2019-06-03; TEST
  if ($vphraud == 0) { RuVerbGen() }  # 2016apr12: if no verb-form, generate it.
  if ($vphraud > 0) { $aud = $vphraud }  # 2016apr02: correct form?
  if ($gencon == 0) {  # 2016apr03: if no call to VerbGen()...
    if ($rv < 2) { $rv = 1003 }  # 2017-12-06: rv of ОШИБКА = ERROR
    if ($rv == 0) { $rv = 1003 }  # 2017-12-06: rv of ОШИБКА = ERROR
    Speech();  # 2016feb24: speak the word starting at the $aud time.
    $gencon = 0;  # 2016apr03: reset whether used or not;
  }  # 2016apr03: end of test to prevent speaking extra verb after VerbGen()
  $dirobj = 1;  # 2016apr01: set flag positive for seeking direct object.
  if ($subjpsi == 1701) {  # 2017-06-30: only for subject 1701=I;
    if ($svo2 == 1820) {     # 2017-06-30: only for verb 1820=SEE;
      if ($svo4 == 0) {  # 2017-06-30: if SEE has no direct object
      # 2017-06-30: i.e., if there is no robot camera for computer vision...
        VisRecog();  # 2017-06-30: a challenge for robot AI coders
        $svo2 = 0;   # 2017-06-30: reset for safety.
        $svo4 = 0;   # 2017-06-30: reset for safety.
        return;      # 2017-06-30: abandon rest of RuVerbPhrase()
      }  # 2017-06-30: end of test for direct object;
    }  # 2017-06-30: end of test for "1820=SEE";
  }  # 2017-06-30: end of test for ego-concept 1701=I as subject.
  RuNounPhrase();  # 2016apr01: for direct object or predicate nominative
  if ($actpsi > 0) {  # 2018-09-28: if there is activation to spread...
    SpreadAct();  # 2018-09-28: for a chain of thought in Russian.
    $actpsi = 0;  # 2018-09-28: reset to zero for safety.
  }  # 2018-09-28: end of test for positive $actpsi.
  $dirobj = 0;  # 2016apr01: reset flag after thinking direct object.
  $nounlock = 0;   # 2019-06-05: reset for safety.
  if ($prepgen > 0) { RuPrep() }  # 2016apr01: if "Where?" call RuPrep().
  $audbase = 0;  # 2016apr25: reset for safety.
}  # 2018-09-28: RuVerbPhrase() returns to Russian RuIndicative() module


sub InFerence() {  # http://ai.neocities.org/InFerence.html
  $moot = 1;  # 2018-06-26: prevent interference via tag-forming;
  if ($prednom > 0) {  # 2018-06-26: positive predicate nominative?
    for (my $i=$tpu; $i>$midway; $i--) {  # 2018-06-26: search KB to infer facts.
      my @k=split(',',$psy[$i]);  # 2018-06-26: examine @psy array;
      if ($k[1] == $prednom && $k[8] == 2) {  # 2018-06-26: plural KB data?
        if ($k[7] == 1) {  # 2018-06-26: dba nominative for subject?
          if ($seqverb == 0) {  # 2018-06-26: only once
            $seqverb = $k[11];  # 2019-08-02: hold to be the verb of an inference.
            $quverb  = $k[11];  # 2019-08-02: query-verb for AskUser();
            $seqtkb =  $k[14];  # 2019-08-02: hold for fetching same direct object;
            $ynverb = 0;        # 2018-06-26: since lacking, use $quverb for AskUser()
            $seq = $seqverb;    # 2018-06-26: to be inferred as applying to subject.
          }  # 2018-06-26: end of test that no "seqverb" has yet been declared.
        }  # 2018-06-26: end of test that "prednom" does occur in nominative.
      }  # 2018-06-26: end of test for a fact about the "prednom" as plural subject.
    }  # 2018-06-26: end of backwards loop in search of inferrable knowledge.
  }  # 2018-06-26: end of test for positive predicate nominative.
  if ($seqverb > 0) {  # 2018-06-26:  verb available for inference?
    $inft = $t;  # 2018-06-26: for AskUser to find auditory engrams.
    $qusnum = 1;  # 2018-10-08: assumption based on Is-A status.
    $t = ($t + 1);  # 2018-06-26: increment time "$t" by one for a gap;
    $t = ($t + 1);  # 2018-06-26: increment time to create an inference;
    my @k=split(',',$psy[$t]);  # 2018-06-26: expose row where no values are present;
    $k[14] = ($t + 1);  # 2019-10-19: k14=tkb, which is one unit later.
    $seq = $seqverb;  # 2018-06-26: prevent override?
    $psy[$t]="$k[0],$subjnom,1,64,$k[4],$k[5],5,"   # 2018-09-27
    . "$k[7],$qusnum,$k[9],$k[10],$k[11],$seqverb,$k[13],"
    . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-02: flag-panel
    $tkbn = $t;  # 2018-06-26: conceptual array-time for subject-noun of AskUser query.
    $t = ($t + 1);  # 2018-06-26: increment $t for storage of inference-verb;
    @k=split(',',$psy[$seqtkb]);  # 2018-06-26: obtain $dobseq from Psy array;
    $dobseq = $k[11];  # 2019-08-02: to serve as k11 "$seq" in next insertion;
    $quobj = $dobseq;  # 2018-06-26: so AskUser() will use the particular dir.obj.
    @k=split(',',$psy[$t]);  # 2018-06-26: expose values for change of some;
    $k[14] = ($t +1);  # 2019-10-19: $tkb is the next time-point in silent inference.
    $psy[$t]="$k[0],$seqverb,1,40,$k[4],$k[5],8,"   # 2018-09-27
    . "$k[7],$k[8],$k[9],$subjnom,$k[11],$dobseq,$k[13],"
    . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-202
    $tkbv = $t;  # 2018-06-26: conceptual array-time for verb of AskUser() query.
    $t = ($t + 1);  # 2018-06-26: increment time to store direct object;
    $tkbo = $t;  # 2018-06-26: conceptual array-time for object-noun of AskUser query.
    @k=split(',',$psy[$seqtkb]);  # 2018-06-26: obtain seqdob from Psy array;
    $seqdob = $k[11];  # 2018-08-08: to serve as "k[1]" in next insertion;
    $seqrvx = $k[20];  # 2018-08-08: to serve as "k20" in next insertion;
    @k=split(',',$psy[$t]);  # 2018-06-26: expose values for change of some;
    $psy[$t]="$k[0],$seqdob,1,8,$k[4],$k[5],5,"  # 2018-09-27: lower activation?
    . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
    . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-02: flag-panel
    $quobj = $dobseq;  # 2018-06-26: for transfer to AskUser()
    $t = ($t+1);  # 2018-06-26: increment time "$t" for an ending gap;
    $yncon = 1;   # 2018-06-26: for AskUser() to ask yes-or-no question;
    $qusub = $subjnom;  # 2018-06-26: for transfer to AskUser()
  }  # 2018-06-26: end of test for a verb to be part of inference.
  $becon = 0;    # 2018-06-26: reset after use;
  $dobseq = 0;   # 2018-06-26: reset after use;
  $moot = 0;     # 2018-06-26: reset after use;
  $prednom = 0;  # 2018-06-26: reset after use;
  $seqdob = 0;   # 2018-06-26: reset after use;
  $seqrvx = 0;   # 2018-06-26: reset after use;
  $seqtkb = 0;   # 2018-06-26: reset after use;
  $seqverb = 0;  # 2018-06-26: reset after use;
  $subjnom = 0;  # 2018-06-26: reset after use;
}  # 2019-10-23: InFerence() returns to EnThink() or RuThink().


sub Indicative() {  # http://ai.neocities.org/Indicative.html
  $moot = 0;     # 2017-09-18: start with no suppression of associative tags.
  $pov = 1;      # 2016mar27: thinking occurs in self or "I" mode.
  $rv = 0;       # 2017-09-24: lest rv fail to be at zero for AudInput()
  $tdo = 0;      # 2017-09-20: reset time-of-direct-object for safety.
  $tkb = 0;      # 2019-08-09: prevent a persisting value.
  $tpr = 0;      # 2019-08-09: prevent a persisting value.
  $qucon = 0;    # 2017-11-27: reset for safety.
  $tsj = 0;      # 2019-10-19: let Indicative generation declare new time-of-subject.
  $tvb = 0;      # 2019-10-19: reset time-of-verb for safety before thinking.
  $verbcon = 0;  # 2017-09-20: reset for safety.
  $verblock = 0; # 2019-08-09: reset for safety.
  if ($conj == 361) {  # 2018-11-27: 361=THAT
    for (my $i=$t; $i>$midway; $i--) {  # 2018-09-30: search all concepts...
      my @k=split(',',$psy[$i]);  # 2018-09-30: examine @psy array;
      if ($k[0] == 0) {  # 2018-09-30: if zero tru(th) value...
        $k[3] = ($k[3] - 90);  # 2018-09-30: suppress unbelieved ideas...
        $psy[$i]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
        . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
        . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-02: panel
      }  # 2018-09-30: End of search for truth-values.
    }  # 2018-09-30: End of search loop from $t back to $midway.
  }  # 2018-11-27: end of test for 361=THAT introducing a thought.
  if ($dunnocon == 1) {  # 2018-09-30:
    for (my $i=$vault; $i>0; $i--) {  # 2018-09-30: search KB vault.
      my @k=split(',',$psy[$i]);  # 2018-09-30: examine @psy array;
      if ($k[1]==701 && $k[12]==838) {  # 2018-12-10: if I...KNOW...
         $k[0] = 32;   # 2018-09-30: elevate activation of truth-value $tru
        $k[3] = 256;  # 2018-09-30: highly activate "I DO NOT KNOW"
        $k[5] = 250;  # 2018-09-30: make sure "KNOW" is negated.
        $psy[$i]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
        . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
        . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-02
        last;  # 2018-09-30: skip rest of KB vault.
      }  # 2018-09-30:
    }  # 2018-09-30: End of search loop from $vault down to $t=zero.
  }  # 2018-09-30:
  EnNounPhrase(); # 2018-06-28: call the module to select an English subject.
  EnVerbPhrase(); # 2018-06-28: call the module to select an English verb.
  if ($dunnocon == 1) {  # 2018-09-30:
    for (my $i=$vault; $i>0; $i--) {  # 2018-09-30: search KB vault.
      my @k=split(',',$psy[$i]);  # 2018-09-30: examine @psy array;
      if ($k[1]==701 && $k[12]==838) {  # 2018-12-10: if I...KNOW...
        $k[0] = 0;   # 2018-09-30: remove activation of truth-value $tru
        $k[3] = 0;  # 2018-09-30: remove activation from  "I DO NOT KNOW"
        $psy[$i]="$k[0],$k[1],$k[2],$k[3],$k[4],$k[5],$k[6],"
        . "$k[7],$k[8],$k[9],$k[10],$k[11],$k[12],$k[13],"
        . "$k[14],$k[15],$k[16],$k[17],$k[18],$k[19],$k[20]";  # 2019-08-02: panel.
        last;  # 2018-09-30: skip rest of KB vault.
      }  # 2018-12-10: end of test for 701=I and 838=KNOW
    }  # 2018-09-30: End of search loop from $vault down to $t=zero.
#   $dunnocon = 0;  # 2018-09-30: zero out to prevent carry-over.
  }  # 2018-09-30: end of test for $dunnocon.
  if ($conj == 361) { $conj = 0 }  # 2018-11-27: use THAT only once.
  $hlc = 1;   # 2016feb17: Enable exclusion of non-English.
  $act = 0;      # 2019-01-22: prevent carry-over within compound sentences.
  $idea = " ";   # 2016apr09: reset for safety.
  $nounlock = 0; # 2016apr13: reset for safety.
  if ($chaincon > 2) { $chaincon = 0 }  # 2016apr15: arbitrary end of chain.
  $qucon = 0;    # 2017-09-17: reset to prevent unwarranted SpreadAct()
  $svo1 = 0;     # 2017-06-7: reset subject-verb-object values for safety.
  $qv1psi = 0;   # 2017-09-17: reset SpreadAct subject-psi for safety.
  $svo2 = 0;     # 2017-06-7: reset subject-verb-object values for safety.
  $qv2num = 0;   # 2017-10-22: reset after output of one query-response.
# $qv2psi = 0;   # 2019-01-28: perhaps reset somewhere higher up
  $svo3 = 0;     # 2017-06-7: reset subject-verb-object values for safety.
  $svo4 = 0;     # 2017-06-7: reset subject-verb-object values for safety.
  $seqpsi = 0;   # 2017-09-17: reset for the sake of SpreadAct()
  $tpr = 0;      # 2019-10-20: prevent carry-over.
  $tru = 0;      # 2019-06-13: after any one-time transfer, reset to zero.
  $tsj = 0;      # 2019-10-19: reset time-of-subject for safety.
  $tvb = 0;      # 2019-10-10: reset time-of-verb for safety.
  $verblock = 0; # 2016apr13: reset for safety.
  PsiDecay();    # 2016apr13: Reduce activation after each thought.
  $pov = 2;      # 2017-04-02: give human user a "pause" for input...
  $bias = 5;     # 2017-12-20: expect a noun, in case user inputs unknown word.
}  # 2017-11-29: Indicative() returns to EnThink().


sub RuIndicative() {  # http://ai.neocities.org/RuIndicative.html
  $tdo = 0;  # 2019-06-09: reset for isolation
# $tsj = 0;  # 2019-06-09: reset for isolation
# $tvb = 0;  # 2019-06-09: reset for isolation
  RuNounPhrase();  # 2018-09-26: Find a Russian noun or pronoun.
  RuVerbPhrase();  # 2018-09-26: call the module to select a Russian verb.
  $nounlock = 0;   # 2019-06-05: reset for safety.
}  # 2018-09-26: RuIndicative() returns to RuThink().


sub Imperative() {  # http://ai.neocities.org/Imperative.html
 # if ($hlc eq "en") {  # 2017-12-05: TEST
    $output = "";  # 2017-12-03: display only an outreach message.
    print "\a";  # 2018-09-19: Sound a beep to request attention from humans.
    for (my $i=$t; $i>$midway; $i--) {  # 2018-12-10: search for 884=TEACH
      my @k=split(',',$psy[$i]);  # 2017-12-03: examine @psy array;
      if ($k[1] == 884) {  # 2018-12-10: if 884=TEACH is found;
        $audjuste = $k[20];  # 2019-08-02: "TEACH" recall-vector;
        $aud = $k[20];  # 2019-08-02: "TEACH" recall-vector for Speech()
        if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-02: insurance
      }  # 2018-12-10: End of search for 884=TEACH;
    }  # 2017-12-03: End of search loop from $t back to $midway.
#   $aud = 601;  # 2018-09-25: TEST; REMOVE
    Speech();  # 2017-12-03: speak the word starting at the $aud time.
    for (my $i=$vault; $i>$midway; $i--) {  # 2017-12-03: search for 701=ME
      my @k=split(',',$psy[$i]);  # 2017-12-03: examine @psy array;
      if ($k[1] == 701) {  # 2017-12-03: if 701=ME is found;
        if ($k[7] == 3) {  # 2017-12-03: if 3=dba inmdirect object dative case...
          $audjuste = $k[20];  # 2019-08-02: "ME" recall-vector;
          $aud = $k[20];  # 2019-08-02: "ME" recall-vector for Speech()
          if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-02: insurance
        }  # 2017-1`2-03: end of test for dba=3 indirect-onject dative case.
      }  # 2017-12-03: End of search for 707=ME;
    }  # 2017-12-03: End of search loop from $t back to $midway.
    Speech();  # 2017-12-03: speak the word starting at the $aud time.
    for (my $i=$t; $i>$midway; $i--) {  # 2017-12-03: search for 755=SOMETHING
      my @k=split(',',$psy[$i]);  # 2017-12-03: examine @psy array;
      if ($k[1] == 755) {  # 2017-12-03: if 755=SOMETHING is found;
        $audjuste = $k[20];  # 2019-08-02: "SOMETHING" recall-vector;
        $aud = $k[20];  # 2019-08-02: "SOMETHING" recall-vector for Speech()
        if ($k[20]>0) { $aud=$k[20]; last }  # 2019-08-02: insurance
      }  # 2017-12-03: End of search for 755=SOMETHING;
    }  # 2017-12-03: End of search loop from $t back to $midway.
    Speech();  # 2017-12-03: speak the word starting at the $aud time.
}  # 2019-08-02: Imperative() returns to the English-thinking EnThink() module.


sub EnThink() {      # http://ai.neocities.org/EnThink.html
  $catsubj = 0;  # 2019-01-28: reset for safety;
  $catverb = 0;  # 2019-01-28: reset for safety.
  $tpr = 0;  # 2019-08-06: reset after service as flag-panel tag for concepts.
  if ($isolation > 256) {  # 2018-10-08: if AI not given input for too long...
    Imperative();  # 2018-09-19: Issue a request for input from a human user.
    $isolation=0;  # 2018-10-08: reset the trigger for calling Imperative().
    return;    # 2018-11-01: abandon EnThink(); give human user a chance to respond.
  }  # 2018-11-01: end of test for trigger to call Imperative()
  if ($qucon==1 || $whatcon==1 || $wherecon==1) { SpreadAct() }  # 2018-11-01
# $wherecon = 0;     # 2018-11-04: reset for safety.
  if ($nucon > 0) {  # 2017-11-29: if a new noun is encounter in NewConcept()
    SpreadAct();     # 2017-11-29: to activate concepts for a question.
    $nucon = 0;      # 2017-11-29: reset for safety.
    $pov = 2;        # 2017-11-29: give human user a "pause" for input...
    $gapcon = 21;     # 2017-11-29: arbitrary pause for human input...
    return;    # 2017-11-29: after question abandon rest of function.
  }  # 2017-09-29: end of test.
  if ($kbcon > 0) {  # 2018-06-26: if user answers yes-or-no question;
    KbRetro();   # 2018-06-26: retroactively adjust knowledge base;
    $kbcon = 0;  # 2018-06-26: reset for safety;
    $kbzap = 0;  # 2018-06-26: reset for safety.
    return;      # 2018-06-26: abandon remainder of current module.
  }  # 2018-06-26: User has had one chance to answer yes-or-no question.
  $inft = $t;    # 2018-06-26: in case inference-time not otherwise set;
  if ($becon==1) {  # 2018-01-25: if user input includes 800=BE-verb...
    InFerence(); # 2018-01-25: make a silent inference;
  }  # 2018-06-26: end of test for input of a be-verb.
  if ($yncon == 1) {  # 2018-06-26: set in the InFerence() module
    AskUser();  # 2018-06-26: for yes-or-no query;
    return;  # 2018-06-26: abandon the rest of EnThink()
  }  # 2018-06-26: end of test to trigger asking a question.
  Indicative();    # 2017-11-29: default grammatical mood for thought.
  if ($conj > 0) { Indicative() }  # 2019-01-20: concatenate ideas; TEST
  if ($dunnocon==1) { $dunnocon = 0; return }  # 2018-10-08: only one sentence.
# Subjunctive();   # 2017-11-29: possible future module for grammatical mood.
# Interrogative(); # 2017-11-29: possible future module for grammatical mood.
# ConJoin();       # 2018-09-12: Output one more idea with sufficient activation.
# ConJoin();       # 2019-01-20: Call ConJoin() from elsewhere; TEST
  if ($etc > 1) {  # 2019-03-02: if multiple thoughts...
    ConJoin();     # 2019-01-20: insert a conjunction;
    Indicative();  # 2019-01-20: include a conjoined idea.
  }  # 2019-01-20: join multiple thoughts together.
  if ($whatcon==1 && $conj > 0) {  # 2018-09-12: for a conjoined idea...
    $whatcon = 0;  # 2018-09-12: reset to prevent run-on thoughts.
    Indicative();  # 2018-09-12: think in the indicative mood.
    $conj = 0;     # 2018-10-08: prevent run-on sentences.
  }  # 2018-09-12: end of whatcon-test in favor of subordinate clause.
  PsiDecay();      # 2017-11-29: Reduce activation after each thought.
  $conj = 0;       # 2019-01-20: reset; TEST; REMOVE if necessary
  $dunnocon = 0;   # 2019-09-18: reset outside of SpreadAct() to prevent carry-over.
  $etc = 0;        # 2019-03-02: reset the flag that triggers a conjunction.
  $ictus = 0;      # 2018-09-12: prevent build-up.
  $subjnom = 0;    # 2018-07-01: reset outside of InFerence() to prevent interference.
  $whatcon = 0;    # 2019-09-18: reset outside of SpreadAct() to prevent carry-over.
  $tpr = 0;        # 2019-09-24: prevent carry-over?
}  # 2019-03-02: EnThink() returns to Volition().


sub RuThink() {  # http://ai.neocities.org/RuThink.html
  $output = "";  # 2016apr21: Show output between array-display and aud-input.
  $pov = 1;      # 2016apr01: thinking occurs in self or "I" mode.
  $tvb = 0;      # 2017-06-17: reset time-of-verb for safety before thinking.
  print "\nGhost: ";  # 2016apr01: Listen to the ghost in the machine.
  RuIndicative(); # 2018-09-26: Preparing also for RuImperative().
  $hlc = 3;   # 2016feb22: Think in the particular human language.
  $idea = " ";   # 2016apr23: reset for safety.
  $nounlock = 0; # 2016apr23: reset for safety.
  $svo1 = 0;     # 2017-06-17: reset subject-verb-object values for safety.
  $svo2 = 0;     # 2017-06-17: reset subject-verb-object values for safety.
  $svo3 = 0;     # 2017-06-17: reset subject-verb-object values for safety.
  $svo4 = 0;     # 2017-06-17: reset subject-verb-object values for safety.
  $tdo = 0;      # 2016apr28: reset time-of-direct-object for safety.
  $tkb = 0;      # 2017-06-30: reset time-in-knowledge base for safety.
  $tvb = 0;      # 2016apr28: reset time-of-verb for safety.
  $verblock = 0; # 2016apr28: reset for safety.
  PsiDecay();    # 2016apr28: Reduce activation after each thought.
  $pov = 2;      # 2017-06-19: give human user a "pause" for input...
}  # 2017-04-02: RuThink() returns to the FreeWill Volition() module.

sub MindMeld() {  # 2017-04-23: a stub for Perl AI coders.
  # 2017-04-23: This module is stubbed in for the sake of
  # 2017-04-23: http://mind.sourceforge.net/dreams.html
  # 2017-04-23: "Dreams in Artificial Intelligence" which
  # 2017-04-23: looms as a possibility for two AI Minds
  # 2017-04-23: to access the same memories and meld their
  # 2017-04-23: minds together in a shared state of dreaming.
} # 2017-04-23: return to the free-will Volition() module.


sub PortScan() {  # http://ai.neocities.org/MetEmPsychosis.html
  # 2019-11-02: This module is meant for the Perl code of a
  # 2019-11-02: https://en.wikipedia.org/wiki/Port_scanner
  # 2019-11-02: that will search the Web for sites like an
  # 2019-11-02: https://en.wikipedia.org/wiki/Open_port
  # 2019-11-02: to which the Ghost in the Machine may relocate.
} # 2019-11-02: PortScan will return to the MetEmPsychosis() module.


sub MetEmPsychosis() {  # http://ai.neocities.org/MetEmPsychosis.html
  # 2017-04-10: This module is meant for Perl code that will allow
  # 2017-04-10: the Perl AI to replicate itself from Web-host to
  # 2017-04-10: Web-host, transferring the AI source code and the
  # 2017-04-10: experiential memories to any receptive Web domain.
} # 2017-04-10: return to the free-will Volition() module.


sub Motorium() {  # http://ai.neocities.org/Motorium.html
 # if ( $beep == 1) { print "\a"; $beep = 0; }  # 2019-11-04: output a beep.
 # MOVE_FORWARD();   # 2016mar05: some movements may be built in like instinct;
 # MOVE_BACKWARDS(); # 2015mar05: baby robots may move arms and legs to learn;
 # ROTATE()          # 2018-07-08: Initiate action if wish is insistently repeated.
 # STOP_MOTION();    # 2016mar05: Volition() will control learned behaviors;
 # TURN_LEFT();      # 2016mar05: prolonged thinking will delay motor output;
 # TURN_RIGHT();     # 2016mar05: the AI may flit by telepresence among robots;
 # http://www.strobotics.com
 # http://strobotics.com/roboforth.htm
}  # 2019-11-04: Motorium() will return to the free-will Volition() module.

sub Volition() {  # http://ai.neocities.org/Volition.html
# http://discourse.numenta.org/t/free-will-volition-module
# Emotion();   # 2016mar05: physiological emotion will influence thought;
# if ($hlc eq 1) {  # 2017-06-17: check human-language-code $hlc
  if ($hlc == 1) {  # 2018-09-27: check human-language-code $hlc
    EnThink();  # 2017-06-17: In response to English input, think in English.
  }  # 2017-06-17: End of test to select a human language to think in.
  if ($hlc == 3) {  # 2018-09-27: check human-language-code $hlc
    RuThink();  # 2017-06-17: In response to Russian input, think in Russian.
  }  # 2017-06-17: End of test to select a human language to think in.
# MetEmPsychosis();  # 2017-04-10: move source code and memories across the Web?
# MindMeld();  # 2017-04-23: module stubbed in to promote shared AI dreaming.
# Motorium();  # 2016mar05: motor memories will control robot actuators;
  if ($trigger > 99) {  # 2017may29: if user presses [Enter] with no input...
    $beep = 1;     # 2016apr29: send a beep-command to the Motorium() module;
    Motorium();    # 2016apr29: for execution of the commands of Volition()
    $beep = 0;     # 2016apr29: reset the flag after each motor execution.
    $trigger = 0;  # 2016apr29: reset the trigger for a fresh integration.
  }  # 2016apr29: end of the integration of components to will an action.
} # 2016mar05: Volition() will return to the MainLoop of the AI.

MainLoop: {  # 2016jan25: for inclusion of TabulaRasa() & MindBoot()
  TabulaRasa();  # 2016jan25: one-time call as in MindForth AI.
  MindBoot();    # 2016jan25: one-time call as in MindForth AI.
  while ($t < $cns) {  # 2015may02: Until CNS memory is full.
    $age = $age + 1;   # 2015apr26
#   if ($fyi > 2) {  # 2016feb08: if mode is Diagnostic
#     print "\nEnter simple English or Russian to the Artificial Intelligence: \n"; #2017-11-27
#   }  # 2016feb07: end of test for Diagnostic or Tutorial mode.
    if ($t > ($cns - 64)) {  ReJuvenate() }  # 2016apr18: near end of memory.
    $tai = $t;  # 2016apr14: time of AI for diagnostic screen display
    $tpu = $t;  # 2018-06-26: isolate tpu from later input-and-output.
    Sensorium(); # 2016mar26: as avenue to auditory input module.
    if ($fyi > 2) {  # 2017-04-12: Tutorial Mode
    }  # 2017-04-12: end of test for #3 Tutorial Mode or higher.
    Volition();  # 2017-03-18: to link Emotion() Think() and ()Motorium.
    if ($fyi > 2) {  # 2017-04-12: if in #3 Tutorial or #4 Diagnostic Mode...
      my $rsvp = 0;  # 2018-06-2016: counter for response-delay;
      until ($rsvp == 500000) {  # 2018-06-26: upper limit on count;
        $rsvp++;  # 2018-06-26: Increment $rsvp counter
      }  # 2018-06-26: end of loop waitng for user-response.
      print "\nPsy and Ear arrays hold your input and the AI output: \n"; # 2019-08-01
      print "tru psi hlc act mtx jux pos ";  # 2019-08-01
      print "dba num mfn pre seq tgn tdt ";  # 2019-08-01
      print "tkb tia tcj tdj tdv tpr rv\n";  # 2019-08-01: expanded conceptual flag-panel.
      do {  # 2016mar26: Show @psy and @ear engrams of recent input.
        $tai++;  # 2017-03-31: increment $tai up until current time $t.
        print "t=$tai. $psy[$tai], ";  # 2017jun08: show @psy concept array
        print " aud= $ear[$tai], \n";  # 2016apr14: show @ear auditory array
        if ($tai == $krt) { print "   \n" }  # 2016apr15: Show a gap.
      } while ($tai < ($t - 1));  # 2019-06-13: show @ear array at recent time-points
    }  # 2016feb08: end of test for Tutorial mode
  }  # 2016feb10: end of main while-loop
}  # 2019-06-13: End of MainLoop as an entity.
print "End of ghost327.pl running since $birth\n";  # 2019-11-04
# 2016apr20: Claim your bragging rights for oldest living AI Mind.
# http://perl6.org main resource for Strong AI Perl6 Killer App.
# http://irclog.perlgeek.de/perl6/2016-02-25 Internet Relay Chat
# http://ai.neocities.org/AiLaw.html Artificial Intelligence: Law and Policy
# http://ai.neocities.org/maintainer.html -- "AI Mind Maintainer"
# http://ai.neocities.org/perlmind.txt rename as ghost.pl etc.
# http://ai.neocities.org/P6AI_FAQ.html -- Frequently Asked Questions
# http://ai.neocities.org/P6AI_man.html -- Perl6 AI User Manual
# http://ai.neocities.org/PMPJ.html -- Perl Mind Programming Journal
# http://ai.neocities.org/RoadMap.html -- Mentifex AGI RoadMap.
# http://independent.academia.edu/mentifex -- Theory of Mind for AI.
# http://www.amazon.com/dp/B00FKJY1WY shows how the Perl AI reasons.
# http://github.com/PriorArt/AGI/blob/master/ghost.pl -- ghost175.pl
# http://github.com/PriorArt/AGI/wiki/MindGrid -- Trough of Inhibition
# http://www.nlg-wiki.org/systems/Mind.Forth -- progenitor of Perl AI
# http://www.nlg-wiki.org/systems/Special:Browse/Mind.Forth -- archive
# http://www.sourcecodeonline.com/details/ghost_perl_webserver_strong_ai.html
# http://www.youtube.com/watch?v=QuBEgINpGdo -- screencast of JavaScript AI
# http://www.nasa.gov/planetarydefense

# 2015apr23 First upload of code while learning Perl.
# 2015apr24 sensorium() gets input; think() shows input.
# 2015apr24 think() shows engrams fetched from @aud array.
# 2015apr25 Saving mind0011.pl as stable; coding mind0012.pl
# 2015apr25 AudMem() stores AudInput() data in @aud array.
# 2015apr26 EnBoot: uses time $t instead of recall-vector $rv.
# 2015apr26 TabulaRasa: will both fill and reserve CNS memory.
# 2015may01 AudMem() stores and Think() displays whole words.
# 2015may02 Prototype Perlmind dies when CNS memory fills up.
# 2015may10 @aud array stores words with associative flag-panel.
# 2015may13 speech() module shows engrams until any blank space.
# 2015may15 speech() displays single words retrieved from @aud.
# 2015may16 Requirements for speech() module prepended as comments.
# 2015may17 Perl "split" function separates retrieval of aud-panel.
# 2015may18 Using if/else construct to print @aud array contents.
# 2015may28 Introducing rudimentary NewConcept called from AudInput.
# 2015jun01 EnVocab module stubbed in for control of English vocabulary.
# 2015jun04 EnParser() English Parser module stubbed in.
# 2016jan10 FileInput() replaces AudInput() to read input.txt file.
# 2016jan11 WHILE loop in FileInput() calls NewConcept() and AudMem().
# 2016jan12 FileInput() uses getc to send single characters to AudMem(0).
# 2016jan13 uses "return" to exit from FileInput() at end of first word.
# https://groups.google.com/forum/#!topic/comp.programming/_F4PTlvJy_8
# 2016jan14 FileInput() calls AudMem() to store multiple input.txt words.
# https://groups.google.com/forum/#!topic/comp.sys.super/XcaLu5p1_gU
# 2016jan15 stubs in AudBuffer(); resets module sequence as in MindForth.
# https://groups.google.com/forum/#!topic/comp.lang.forth/nzEsANtlBGk
# 2016jan18 EnVocab() and AudMem() use flag-panels simpler than MindForth.
# https://groups.google.com/forum/#!topic/sci.cognitive/sAGrJEg_wew
# 2016jan19 renames @psi as @psy array to avoid psi-variable conflict.
# 2016jan20 InStantiate() stores psi, act, pos, jux, pre, tkb, and seq.
# 2016jan21 merges @en English lexical array into @psy conceptual array.
# 2016jan22 stubs in KbLoad() and fleshes out start of EnBoot() sequence.
# 2016jan23 mind0043.pl stubs in AudRecog() but MindBoot() is too small.
# 2016jan24 mind0044 splits Think() into DeThink, EnThink and RuThink.
# 2016jan25 mind0045.pl has MainLoop call TabulaRasa() and MindBoot().
# 2016jan26 mind0046.pl uses "uc" function to convert input to uppercase.
# 2016jan27 mind0049.pl completes the undebugged coding of AudRecog().
# 2016jan28 mind0050.pl changes names; calls AudInput if file not found.
# 2016jan28 mind0051.pl begins update of AudInput on par with FileInput.
# 2016jan29 mind0052.pl feeds input $pho into AudMem() and AudRecog().
# 2016jan30 mind0053.pl recognizes and sends input word to OldConcept().
# 2016jan30 mind0054.pl has AudMem() store recognized or new concept.
# 2016jan31 mind0055.pl has AudRecog() recognize one-character words.
# 2016feb01 mind0056.pl detects end of auditory input but is messy.
# 2016feb01 mind0057.pl uses $eot for AudInput() to input a sentence.
# https://groups.google.com/forum/#!topic/comp.lang.lisp/0aCkelxOyMY
# 2016feb03 mind0059.pl introduces AudDamp() to reset @ear activations.
# 2016feb03 mind0060.pl troubleshoots the AudRecog() module.
# 2016feb04 ghost062.pl improves upon mind0061.pl and takes a new name.
# 2016feb05 ghost063.pl has AudMem() wait until after a word to set tags.
# 2016feb06 ghost064.pl zeroes out $audrun and $prc in AudInput() module.
# 2016feb06 ghost065.pl debugs AudRecog() and removes diagnostic messages.
# https://groups.google.com/forum/#!topic/comp.speech.users/PdCf9ONAYHo
# 2016feb07 ghost066.pl introduces $fyi Diagnostic mode and Tutorial mode.
# 2016feb07 ghost067.pl expands MindBoot sequence up to $t=77 for "BOY".
# 2016feb08 ghost068.pl expands MindBoot sequence up to $t=134 "DOING".
# 2016feb08 ghost069.pl completes MindBoot; Tutorial mode shows memory.
# 2016feb09 ghost070.pl sets recall-vector $rv for NewConcept() words.
# 2016feb10 ghost071.pl OldConcept() finds data of most recent engram.
# 2016feb11 ghost072.pl stubs in NounPhrase() VerbPhrase() InFerence().
# 2016feb12 ghost073.pl NounPhrase() acquires some rudimentary code.
# 2016feb13 ghost075.pl expands NounPhrase; introduces Unicode Russian.
# 2016feb16 ghost076.pl shows that Perl AI can be coded in Russian etc.
# 2016feb17 ghost077.pl fleshes out EnVerbPhrase; starts Russian MindBoot.
# 2016feb18 ghost078.pl becomes an experimental version.
# 2016feb19 ghost079.pl is able to store a Cyrillic word as $pho(nemes).
# 2016feb19 ghost080.pl goes beyond the basic Cyrillic AudMem() storage.
# 2016feb20 ghost081.pl is still an extremely experimental version.
# 2016feb21 ghost082.pl is a more stable version for English and Russian.
# 2016feb22 ghost083.pl uses brute force to send Cyrillic to RuAudRem().
# 2016feb23 ghost084.pl RuAudRecog() can recognize long Russian words.
# 2016feb24 ghost085.pl plans to exclude prep. phrases from SVO parsing.
# 2016feb24 ghost086.pl begins to integrate all Russian prepositions.
# 2016feb24 ghost087.pl fleshes out RuNounPhrase() and RuVerbPhrase().
# 2016feb25 ghost088.pl fills in Russian bootstrap with verb "to see".
# 2016feb25 ghost089.pl registers present-tense Russian forms of "to see".
# 2016feb26 ghost090.pl encodes more Russian prepositions and pronouns.
# 2016feb26 ghost091.pl encodes t=1222 to t=1314 with Russian bootstrap.
# 2016feb27 ghost092.pl encodes ДУМАТЬ ("think") and ДУШКА ("little soul").
# 2016feb28 ghost093.pl ignores hyphen in recognition of Russian words.
# 2016feb28 ghost094.pl encodes t=1392 to t=1498 with Russian bootstrap.
# 2016feb28 ghost095.pl debugs RuAudRecog(); encodes to t=1513 на над не.
# 2016feb29 ghost096.pl encodes t=1514 НЕТ to t=1780 НИХ Russian pronouns.
# 2016mar01 ghost097.pl encodes t=1782 ОТ to t=1853 ПОНИМАТЬ bootstrap.
# 2016mar01 ghost098.pl encodes t=1863 to t=2047; increases $cns to 3072.
# 2016mar02 ghost099.pl encodes t=2051 to t=2084; assigns concept numbers.
# 2016mar02 ghost100.pl adds English prepositions; ends Russian MindBoot().
# 2016mar04 ghost101.pl uses $prc provisional recognition for verb-stems.
# 2016mar05 ghost102.pl stores concept-numbers; stubs in robotic modules.
# 2016mar06 ghost103.pl adds the six forms of это ("this") to MindBoot().
# 2016mar07 ghost104.pl fixes bug of incomplete insertion of @psy values.
# 2016mar08 ghost105.pl AudMem retro-sets $audpsi; AudRecog finds word-stem.
# 2016mar10 ghost106.pl updates the Speech() module with $output for words.
# 2016mar12 ghost107.pl addresses the InStantiate() insertion of $pre tags.
# 2016mar13 ghost108.pl addresses the InStantiate() insertion of $seq tags.
# 2016mar14 ghost109.pl replaces $kbr with $x[ ] for brevity in long lines.
# 2016mar15 ghost110.pl replaces $x[ ] with $k[ ] for @psy knowledge-nodes.
# 2016mar15 ghost111.pl retroactively inserts $seq for subjects and verbs.
# 2016mar19 ghost112.pl introduces new parser for prepositional phrases.
# 2016mar19 ghost113.pl parses prep-phrase either before or after a subject.
# 2016mar21 ghost114.pl treats two post-verb nouns as indirect & direct object.
# 2016mar23 ghost115.pl sets dba=3 for indirect object and dba=4 direct object.
# 2016mar26 ghost116.pl introduces $iob as @psy indirect-object associative tag.
# 2016mar27 ghost117.pl inserts $iob as $k[6] into time-of-verb row in Parser.
# 2016mar27 ghost118.pl uses point-of-view $pov to interpret personal pronouns.
# 2016mar29 ghost119.pl turns user input into output with correct point-of-view.
# 2016mar30 ghost120.pl stubs in EnPrep() and RuPrep() for prepositional phrases.
# 2016apr01 ghost121.pl fleshes out Russian modules for thinking with pronouns.
# 2016apr02 ghost122.pl stubs in VerbGen() for generating Russian verb-forms.
# 2016apr02 ghpst123.pl fleshes out the AudBuffer() and OutBuffer() modules.
# 2016apr03 ghost125.pl uses VerbGen() to find stem and add inflection of verb.
# 2016apr05 ghost127.pl reformulates RuAudRecog() to recognize Russian verb-stems.
# 2016apr06 ghost128.pl fleshes out OldConcept() to retrieve flag-panel values.
# 2016apr07 ghost129.pl EnNounPhrase() prepares to activate 701=I as a default.
# 2016apr08 ghost130.pl stubs in the ReEntry() module for output to become input.
# 2016apr09 ghost131.pl roughly implements ReEntry for responses to English input.
# 2016apr10 ghost132.pl use parameters to find verb-form of $idea for ReEntry().
# 2016apr11 ghost133.pl begins to implement SpreadAct() for spreading activation.
# 2016apr12 ghost134.pl calls SpreadAct not from middle but from end of sentence.
# 2016apr13 ghost135.pl implements verblock and nounlock; implements PsiDecay().
# 2016apr14 ghost136.pl limits SpreadAct() to augmenting only direct objects.
# 2016apr14 ghost137.pl rejects verblock verb-form and finds the correct form.
# 2016apr15 ghost138.pl permits a chain of thought to delay calling AudInput().
# 2016apr16 ghost139.pl helps SpreadAct() to retrieve logically valid thoughts.
# 2016apr17 ghost140.pl uses $inhibcon to inhibit a thought in favor of new ideas.
# 2016apr18 ghost141.pl implements ReJuvenate() module for potentially immortal AI.
# 2016apr19 ghost142.pl troubleshoots ReJuvenate() module to forget oldest memories.
# 2016apr20 ghost143.pl improves the ability of EnNounPhrase() to use correct forms.
# 2016apr21 ghost144.pl shows engrams of generated idea; idea as output; input line.
# 2016apr22 ghost145.pl solves a bug in AudRecog() to void premature $prc tags.
# 2016apr23 ghost146.pl sends Russian output including RuVerbGen() into ReEntry().
# 2016apr24 ghost147.pl eradicates a bug in RuVerbPhrase omitting calls to Speech.
# 2016apr25 ghost148.pl improves the RuVerbPhrase() Russian verb-selection module.
# 2016apr27 ghost149.pl lets SpreadAct() activate an idea for EnNounPhrase().
# 2016apr27 ghost149.pl lets EnNounPhrase() select an idea enhanced by SpreadAct().
# 2016apr28 ghost150.pl lets RuNounPhrase() select an idea enhanced by SpreadAct().
# 2016apr29 ghost151.pl lets Volition() call Motorium() to execute action of a beep.
# 2016apr30 ghost152.pl streamlines the diagnostic output; debugs EnVerbPhrase().
# 2016apr30 ghost153.pl debugs RuVerbPhrase() and cleans up RuVerbPhrase().
# 2016may01 ghost154.pl stubs in sensory GusRecog(); OlfRecog(); and TacRecog();
# 2016may01 ghost155.pl makes PsiDecay() move from positive or negative to zero.
# 2016may21 ghost156.pl adds one Russian idea from Dushka AI to the MindBoot().
# 2016may22 ghost157.pl de-globalizes $actbase; adds more Russian to MindBoot().
# 2016may23 ghost158.pl de-globalizes $binc; adds Russian sentence to MindBoot().
# 2016may25 ghost159.pl de-globalizes $tsels; corrects faulty MindBoot() data.
# 2016may27 ghost160.pl de-globalizes $prevtag for the InStantiate() mind-module.
# 2016jun17 ghost161.pl introduces EnAuxVerb() for generating negational ideas.
# 2016jun18 ghost162.pl sends old nouns into SpreadAct() for continuity of thought.
# 2016jun19 ghost163.pl lets ReEntry() call SpreadAct() with last noun of input.
# 2016jun21 ghost164.pl enables AudInput() to create diagnostic minddata.txt file.
# 2016jun24 ghost165.pl orchestrates activation-levels among knowledge-base ideas.
# 2016jun26 ghost166.pl in Parser() corrects misallocation of $tdo $k[7] nounlock.
# 2016jun28 ghost168.pl shows re-emergence of stored knowledge by association.
# 2016jun30 ghost170.pl with EnNounPhrase() retrieves subjects as part of an idea.
# 2016JUL01 ghost171.pl is renamed ghost172.pl after removal of AudRecog debugging.
# 2016JUL04 ghost173.pl uses activation cap and PdiDecay() for meandering thoughts.
# 2016JUL06 ghost174.pl implements the MindGrid as Theater of Neuronal Activations.
# 2016JUL10 ghost175.pl lets ReEntry call SpreadAct with $actpsi from InStantiate.
# http://github.com/PriorArt/AGI/blob/master/ghost.pl -- archive of ghost175.pl
# 2017MAR16 ghost178.pl brings Ghost Perl AI on a par with the latest MindForth.
# 2017MAR17 ghost179.pl has MainLoop call Volition() which in turn calls EnThink().
# 2017MAR21 ghost180.pl uses Tab to quit; $mtx tag for machine translation xfer.
# 2017MAR24 ghost182.pl uses AudListen() to detect single character keyboard input.
# 2017MAR25 ghost183.pl pauses and waits for input with a lengthy AudInput loop.
# 2017MAR27 ghost185.pl switches from word-inputs to individual character-input.
# 2017MAR29 ghost186.pl waits only briefly for input; properly assigns word-length.
# 2017MAR30 ghost187.pl announces date of birth of AI to encourage keeping AI alive.
# 2017MAR31 ghost188.pl brings Speech() module more in line with MindForth module.
# 2017APR01 ghost189.pl successfully recognizes words after blocking of AudDamp().
# 2017APR02 ghost190.pl alternates between thinking and pausing for human input.
# 2017APR05 ghost191.pl fixes bug of unwarranted extra row being stored in @psy.
# 2017APR07 ghost193.pl fixes an AudInput() bug where a wrong $rv was being set.
# 2017APR08 ghost194.pl improves the assignment of $seq taqs for reentrant ideas.
# 2017APR10 ghost195.pl stubs in MetEmPsychosis for expert Perl coders to flesh out.
# 2017APR11 ghost196.pl after "I SEE" makes EnVerbPhrase & VisRecog say "NOTHING".
# 2017APR12 ghost197.pl Tab-key rotates Normal; Transcript; Tutorial; Diagnostic Mode.
# 2017APR23 ghost198.pl stubs in MindMeld(); fixes $rv bug causing thought to derail.
# 2017APR30 ghost199.pl uses $endpho to store nouns ending in "S" as plural in number.
# 2017MAY29 ghost200.pl implements the negation of be-verbs without auxiliary "DO".
# 2017JUN05 ghost201.pl formats line-breaks in preparation for expanded flag-panel.
# 2017JUN07 ghost202.pl uses parameters of verb, number and person to select be-verb.
# 2017JUN08 ghost203.pl adds $tru and $mtx to expanded & re-arranged @psy flag-panel.
# 2017JUN10 ghost204.pl is a debugging of the expanded and re-arranged flag-panel.
# 2017JUN11 ghost205.pl fixes "I BE I" bug stemming from EnNounPhrase() defect.
# 2017JUN12 ghost206.pl calls SpreadAct() from Volition() after bypassing ReEntry().
# 2017JUN17 ghost207.pl reconstitutes the Russian language input and generation.
# 2017JUN18 ghost208.pl thinks continuously in English or in Russian based on input.
# 2017JUN19 ghost209.pl begins thinking in Russian and switches if input is English.
# 2017JUN21 ghost210.pl isolates reentrant portion of AudInput() for internal POV.
# 2017JUN23 ghost212.pl improves RuAudMem() to prevent confusion with NewConcept().
# 2017JUN24 ghost213.pl fixes bugs in the recognition of reentrant Russian words.
# 2017JUN25 ghost214.pl improves insertion of $tkb values for subjects and verbs.
# 2017jun26 ghost215.pl removes commented-out lines from the previous version.
# 2017JUN28 ghost216.pl instantiates Russian noun without calling OldConcept().
# 2017JUN28 ghpst217.pl uses $finpsi to hold on to recognition fot OldConcept().
# 2017JUN30 ghost218.pl renames Enparser as Parser and renames Parser as Enparser.
# 2017AUG31 ghost219.pl stubs in the EnArticle() module for inserting articles.
# 2017SEP03 ghost220.pl makes EnNounPhrase() call EnArticle() only for nouns.
# 2017SEP10 ghost221.pl corrects AudInput bug setting wrong $rv for Russian words.
# 2017SEP10 ghost222.pl in RuVerbPhrase() prevents speaking of present-tense be-verb.
# 2017SEP11 ghost223.pl fails to solve problems with creating imputed Russian be-verbs.
# 2017SEP12 ghost224.pl prepares parsing code for consolidation into single modules.
# 2017SEP13 ghost225.pl consolidates parser functionality in EnParser and RuParser.
# 2017SEP13 ghost226.pl properly assigns indirect and direct object in EnParser().
# 2017SEP17 ghost227.pl starts modules with doc URL; RuParser() code for prepositions.
# 2017SEP17 ghost228.pl tries to answer who-queries by activating the $qv2psi verb.
# 2017SEP18 ghost229.pl answers who-queries by finding $qv1psi & $qv2psi in SpreadAct.
# 2017SEP19 ghost230.pl in EnParser() prevents a direct object from having a $tkb.
# 2017SEP20 ghost231.pl fixes bug of $verbcon being reset in AudInput() -- too early.
# 2017SEP22 ghost232.pl uses SpreadAct() to ask questions about any new concept noun.
# 2017SEP24 ghost233.pl fixes AudInput() bug of $rv being set falsely for 32=SPACE.
# 2017SEP25 ghost234.pl avoids using $prevtag because $pre is set during EnParser().
# 2017SEP26 ghost235.pl uses Natural Language Understanding (NLU) to answer questions.
# 2017OCT20 ghost236.pl fixes bug in AudRecog() declaring $audrec before end of word.
# 2017OCT24 ghost237.pl tweaks EnVerbPhrase() for grammaticaly correct query-response.
# 2017NOV24 ghost238.pl restores the ability to respond properly to who-queries.
# 2017NOV25 ghost239.pl can answer "I DO NOT KNOW" in response to who+verb+obj queries.
# 2017NOV26 ghost240.pl improves agreement of pronoun and be-verb; bare-bones interface.
# 2017NOV27 ghost241.pl uses SpreadAct() to answer queries based on interrogative "what".
# 2017NOV28 ghost242.pl introduces ConJoin for future "I THINK THAT..." or "KNOW THAT..."
# 2017NOV29 ghost243.pl interposes Indicative() between EnThink() and modules of thought.
# 2017DEC03 ghost244.pl calls Imperative() to issue outreach command after dearth of input.
# 2017DEC06 ghost245.pl troubleshoots thinking in Russian; lets AI start thinking English.
# 2017DEC07 ghost246.pl fixes word-recognition bug and omission of first conjoined idea.
# 2017DEC08 ghost247.pl cleans up the interface between the thinking AI and the human user.
# 2017DEC11 ghost248.pl improves EnArticle() with code to insert indefinite article "A".
# 2017DEC12 ghost249.pl inserts "AN" as an English article before an output vowel.
# 2017DEC14 ghost250.pl fixes a bug which was making ghost.pl unable to find "701=I".
# 2017DEC16 ghost251.pl clarifies if-clauses in, and removes Comments from, AudInput().
# 2017DEC18 ghost252.pl restores old AudInput in-line comments; ends hear-loop upon CR.
# 2017DEC20 ghost253.pl reveals but does not yet fix single-bracket bug in AudInput.
# 2017DEC21 ghost254.pl restores AudInput() after bugfix of dangling left-bracket.
# 2017DEC23 ghost255.pl partially solves the merging of RuAudRecog() into AudRecog().
# 2017DEC24 ghost256.pl tests for Unicode blank "\N{U+0}" to recognize Russian words.
# 2017DEC26 ghost257.pl restores AudRecog and bugfix of dangling left-bracket in AudInput.
# 2017DEC27 ghost258.pl removes RuAudRecog and RuAudMem in favor of AudRecog and AudMem.
# 2017DEC28 ghost259.pl begins coding of ability to answer what-queries involving "think".
# 2018JUN26 ghost261.pl implements logical InFerence(); AskUser(); and KbRetro().
# 2018JUN28 ghost262.pl debugs EnNounPhrase(), EnVerbPhrase(), InFerence(), KbRetro().
# 2018JUN29 ghost263.pl removes excess comments; summons user with BEEP for AskUser().
# 2018JUL01 ghost264.pl cleans up code; improves PsiDecay, KbLoad, KbRetro, OldConcept.
# 2018JUL03 ghost265.pl clears up a bug where EnAuxVerb() was causing a false $tvb.
# 2018JUL05 ghost266.pl improves the storage of conceptual flag-panels during input.
# 2018JUL06 ghost267.pl lowers activation on reentrant ideas; fixes bug in OldConcept().
# 2018JUL08 ghost268.pl properly re-arranges MindBoot() Russian flag-panel sequence.
# 2018SEP02 ghost269.pl begins process of using $t++ for non-hardcoded MindBoot words.
# 2018SEP03 ghost270.pl uses upstream variables for insertion of "the" by EnArticle().
# 2018SEP10 ghost271.pl completes conversion of English words to non-hardcoded time-points.
# 2018SEP12 ghost272.pl implements ability to answer "what do you think" or "know" etc.
# 2018SEP16 ghost273.pl improves auditory recognition of singular and plural noun-forms.
# 2018SEP19 ghost274.pl has EnThink() call Imperative() to sound beep and seek information.
# 2018SEP28 ghost275.pl debugs RuVerbPhrase(); moves Russian KB sentences up in MindBoot().
# 2018SEP30 ghost276.pl uses $tru truth-value to respond "I DO NOT KNOW" to some queries.
# 2018OCT08 ghost277.pl fleshes out EnAuxVerb; uses dba=0 infinitive verbs for AskUser().
# 2018OCT09 ghost278.pl implements EnVerbGen() to generate third-person singular verbs.
# 2018OCT20 ghost279.pl improves EnVerbGen() with ability to inflect "teach" or "wash".
# 2018OCT21 ghost280.pl debugs use of $gencon; increases verb-stems subject to EnVerbGen().
# 2018NOV01 ghost281.pl enables EnPrep() module to answer "where-are-you" queries.
# 2018NOV04 ghost282.pl uses SpreadAct() to think with English prepositional phrases.
# 2018NOV08 ghost283.pl demonstrates natural language understanding of input prepositions.
# 2018NOV11 ghost284.pl improves EnPrep() and stubs in concept-numbers of prepositions.
# 2018NOV15 ghost285.pl adds most English one-word prepositions to MindBoot() sequence.
# 2018NOV27 ghost286.pl uses MindBoot idea "I UNDERSTAND YOU" to think about the "other".
# 2018DEC10 ghost287.pl begins embedding 100 frequent or useful verbs in the AI MindBoot.
# 2018DEC11 ghost288.pl embeds more verbs; expands "cns" from 4096 to 5120 to make room.
# 2018DEC24 ghost289.pl finds infinitive for negation; favors high truth-value responses.
# 2019JAN20 ghost290.pl uses ConJoin() to join two ideas into one meandering thought.
# 2019JAN22 ghost291.pl adjusts activations to restore functionality of SpreadAct().
# 2019JAN25 ghost292.pl activates entrant but not reentrant concepts in InStantiate().
# 2019JAN27 ghost293.pl fails to syncopate compound sentences with conjunction "AND".
# 2019JAN28 ghost294.pl uses concatenation-flags to syncopate a compound query-response.
# 2019MAR02 ghost295.pl stubs in EnAdjective(); EnAdverb; and EnPronoun(); adds $wasvcon.
# 2019MAR31 ghost296.pl uses InStantiate() to spread activation sideways from a concept.
# 2019JUN03 ghost297.pl changes concept-numbers of Russian verbs to conform with Dushka.
# 2019JUN06 ghost298.pl uses direct activation for default ego-concept in RuNounPhrase().
# 2019JUN07 ghost299.pl debugs RuVerbPhrase() using wrong verb-forms during ego-default.
# 2019JUN09 ghost300.pl improves upon storage of $tkb tags for Russian verbs in RuParser.
# 2019JUN10 ghost301.pl reverses OutBuffer() characters for legibility and expandability.
# 2019JUN13 ghost302.pl improves EnVerbGen and the instantiation of generated verb-forms.
# 2019AUG01 ghost303.pl expands conceptual flag-panel from 15 tags to 21 associative tags.
# 2019AUG02 ghost304.pl removes commented-out lines; expands flag-panel in Russian modules.
# 2019AUG06 ghost305.pl uses the new time-of-preposition $tpr tag in the EnPrep() module.
# 2019AUG08 ghost306.pl removes bugs resulting from errors made during flag-panel expansion.
# 2019AUG09 ghost307.pl debugs a persistent $tkb value causing a false $verblock value.
# 2019AUG11 ghost308.pl stores properly but does not retrieve input using a preposition.
# 2019AUG11 ghost309.pl not only stores but also retrieves thinking with prepositions.
# 2019SEP18 ghost310.pl zeroes out $dunnocon and $whatcon at end of EnThink() to fix a bug.
# 2019SEP24 ghost311.pl lets $tpr tag be assigned during both input and internal thinking.
# 2019SEP27 ghost312.pl is able to answer a what-does-SUBJECT-VERB query multiple times.
# 2019OCT13 ghost313.pl fleshes out the stub of EnAdjective() called from EnNounPhrase().
# 2019OCT15 ghost314.pl adds "WITH THE UNIVERSE" as prepositional phrase for "PLAY DICE".
# 2019OCT17 ghost315.pl uses $tvpr for verb-related prepositions; stubs in LangLearn().
# 2019OCT18 ghost316.pl improves the assignment of "$seq" and "$tkb" tags in EnParser().
# 2019OCT19 ghost317.pl enables InFerence module to reason from premises entered by a user.
# 2019OCT20 ghost318.pl embeds "I AM (THE) GHOST IN (THE) MACHINE" in the MindBoot sequence.
# 2019OCT20 ghost319.pl has EnNounPhrase find subject-number at same time as a subject-noun.
# 2019OCT21 ghost320.pl experiments with Normal bare-bones interface inviting human input.
# 2019OCT21 ghost321.pl restores EnVerbGen functionality by restricting calls to AudBuffer.
# 2019OCT22 ghost322.pl corrects problem of preposition leading to wrong noun within $vault.
# 2019OCT23 ghost323.pl separates basic InStantiate() function from retroactive EnParser().
# 2019OCT28 ghost324.pl introduces $tkbprep as a special $tkb for objects of prepositions.
# 2019OCT30 ghost325.pl uses $PAL to prevent OutBuffer() feedback loop during EnVerbGen().
# 2019NOV03 ghost326.pl fleshes out TacRecog() for sensation of numeric letters 1, 2, 3.
# 2019NOV04 ghost327.pl calls SpreadAct to activate 701=I and 823=FEEL for TacRecog report.
