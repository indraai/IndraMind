( IndraMind.forth MindForth INDRA in the Machine source code as of 2020-1-11 )
( ghost104.F MindForth Ghost in the Machine source code as of 2019-11-05 )
\ First working artificial intelligence for autonomous humanoid robots.
\ First Working AGI with unsupervised learning for embodiment in robots.
( http://www.complang.tuwien.ac.at/forth/win32forth/W32for42.exe )
( http://dl.acm.org/citation.cfm?doid=307824.307853 -- Association for Computing Machinery )
DECIMAL  ( 2016JUL25: use decimal numbers )
variable abc  ( 2018-10-19: AudBuffer transfer character )
variable act 0 act ! ( 2016JUL25: activation level  )
variable actbase ( 2016JUL28: AudRecog discrimination activation base )
variable actpsi  ( 2018-06-19: psi from which activation is to be spread )
variable anset   ( 2018-09-07: Sets "an" before a vowel at start of noun )
variable aud  ( 2016aug14: auditory recall-tag for activating engrams)
variable audbase  ( 2016aug22: recall-vector for VerbGen )
variable audjuste  ( 2016aug14: NounPhrase motjuste aud for Speech module )
variable audnum  ( 2018-06-22: de-globalizes the "num" variable )
variable audpsi  ( 2016JUL25: concept number of word in ear{ array )
variable audrec  ( 2016JUL28: auditory recognition concept-number )
variable audrun 1 audrun ! ( 2016JUL28: counter of loops through AudRecog )
variable audstop  ( 2019-09-30: flag to stop Speech module after one word )
variable auxverb  ( 2018-12-13: such as 800=BE; 818=DO; or modal verb )
variable b1   ( 2019-06-16: buffer character 01 in OutBuffer )
variable b2   ( 2019-06-16: buffer character 01 in OutBuffer )
variable b3   ( 2019-06-16: buffer character 01 in OutBuffer )
variable b4   ( 2019-06-16: buffer character 01 in OutBuffer )
variable b5   ( 2019-06-16: buffer character 01 in OutBuffer )
variable b6   ( 2019-06-16: buffer character 01 in OutBuffer )
variable b7   ( 2019-06-16: buffer character 01 in OutBuffer )
variable b8   ( 2019-06-16: buffer character 01 in OutBuffer )
variable b9   ( 2019-06-16: buffer character 01 in OutBuffer )
variable b10  ( 2018-10-19: buffer character 10 in OutBuffer )
variable b11  ( 2018-10-19: buffer character 11 in OutBuffer )
variable b12  ( 2018-10-19: buffer character 12 in OutBuffer )
variable b13  ( 2018-10-19: buffer character 13 in OutBuffer )
variable b14  ( 2018-10-19: buffer character 14 in OutBuffer )
variable b15  ( 2018-10-19: buffer character 15 in OutBuffer )
variable b16  ( 2018-10-19: buffer character 16 in OutBuffer )
variable bday ( 2016sep06: TIME&DATE day of birth )
variable becon 0 becon !  ( 2018-06-19: detect be-verb for InFerence )
variable bhour ( 2016sep06: TIME&DATE hour of birth )
variable bias 5 bias ! ( 2016aug23: Parser; NewConcept: expected POS )
variable binc  ( 2018-10-19: OutBuffer "b" increment for EnVerbGen )
variable bminute ( 2016sep06: TIME&DATE minute of birth )
variable bmonth ( 2016sep06: TIME&DATE month of birth )
variable bsec ( 2016sep06: TIME&DATE  second of birth )
variable byear ( 2016sep06: TIME&DATE year of birth )
variable c1   ( 2019-06-16: character in AudBuffer )
variable c2   ( 2019-06-16: character in AudBuffer )
variable c3   ( 2019-06-16: character in AudBuffer )
variable c4   ( 2019-06-16: character in AudBuffer )
variable c5   ( 2019-06-16: character in AudBuffer )
variable c6   ( 2019-06-16: character in AudBuffer )
variable c7   ( 2019-06-16: character in AudBuffer )
variable c8   ( 2019-06-16: character in AudBuffer )
variable c9   ( 2019-06-16: character in AudBuffer )
variable c10  ( 2018-10-19: character in AudBuffer )
variable c11  ( 2018-10-19: character in AudBuffer )
variable c12  ( 2018-10-19: character in AudBuffer )
variable c13  ( 2018-10-19: character in AudBuffer )
variable c14  ( 2018-10-19: character in AudBuffer )
variable c15  ( 2018-10-19: character in AudBuffer )
variable c16  ( 2018-10-19: character in AudBuffer )
variable catdobj  ( 2019-02-20: concat-direct-object for ConJoin "AND".  )
variable catiobj  ( 2019-02-20: concat-indirect-object for ConJoin "AND". )
variable catsubj  ( 2019-02-20: concat-subject for ConJoin "AND". )
variable catverb  ( 2019-02-20: concat-verb for ConJoin "AND". )
variable cns  3000 cns !  ( 2019-09-29: MindGrid size beyond which AI fails to run )
variable coda 160 coda !  ( 2019-10-11: memory to be recycled in ReJuvenate )
variable conj ( 2018-07-09: AI4U: oldConcept; Conjoin: conjunction )
variable dba  ( 2016JUL25: case for nouns; person for verbs )
variable dirobj  ( 2016aug22: flag indicates seeking for a direct object )
variable dobmfn  ( 2018-06-21: for InFerence to pass gender to AskUser )
variable dobseq  ( 2018-06-21: for transfer within InFerence )
variable dunnocon  ( 2018-10-07: condition of "I-don't-know" for queries. )
variable edge  0 edge ! ( 2016sep06: Rejuvenate edge-of-thought flag )
variable eot  ( 2016JUL26: end of text carriage-return )
variable etc  ( 2019-02-20: number of ideas simultaneously active for ConJoin)
variable eureka  ( 2018-11-10: value for use in until-loop )
variable foom    ( 2018-09-07: arbitrary trigger for invoking the Spawn module )
variable fyi 0 fyi ! ( 2019-11-05: for a bare-bones human-computer interaction )
\ variable fyi 4 fyi ! ( 2019-11-05: TAB to rotate through display modalities )
variable gencon      ( 2018-10-19: EnVerbGen status flag )
variable hap   ( 2019-11-05: a "haptic" sensation of touch for TacRecog )
variable haptac  ( 2019-11-05: for transfer from TacRecog to EnVerbPhrase )
variable hlc  1 hlc ! ( 2016JUL25: human language code )
variable holdnum   ( 2018-06-22: transfer from subject to verb )
variable impetus   ( 2018-09-23: incentive or trigger for volitional action )
variable infincon  ( 2018-06-22: infinitive condition flag )
variable inft  ( 2018-06-21: inference-time for AskUser )
variable inhibcon  ( 2016sep04: flag for neural inhibition )
variable iob  ( 2016JUL25: time-of-indirect-object for parser module )
variable isolation  ( 2018-10-07: counter to trigger "TEACH ME SOMETHING" )
variable jrt ( 2016sep06: ReJuvenate "junior time" for memories moved )
variable jux  0 jux ! ( 2016JUL25: holds psi # of a JUXtaposed word )
variable kbcon  ( 2018-06-22: flag for awaiting a yes-or-no answer )
variable kbzap  ( 2018-06-22: holds 432=YES or 404=NO for KbRetro )
variable krt ( 2016aug23: knowledge representation time )
variable lastpho  ( 2016aug23:  to avoid extra "S" on verbs )
variable len ( 2016JUL27: length, for avoiding non-words in AudInput)
variable mfn  ( 2016JUL25: "masculine feminine neuter" gender flag )
variable midway 0 midway ! ( 2016JUL25: adjustable time-limit )
variable mjact  ( 2016aug14: motjuste-activation for defaulting to 701=I )
variable monopsi  ( 2016JUL28: for use in audRecog module )
variable moot  ( 2018-06-19: flag to prevent associations during queries )
variable morphpsi  ( 2016JUL29: "for audRecog recognition of morphemes" )
variable motjuste  ( 2016aug14: "best word for inclusion in a thought" )
variable mtx ( 2017jun14: machine-translation xfer tag for flag-panel. )
variable negjux  ( 2016aug22: flag for 250=NOT juxtaposed to a verb )
variable newpsi   ( 2018-06-21: for singular-nounstem assignments )
variable nounlock  ( 2016aug14: for a verb to lock onto a seq-noun )
variable nphrnum 0 nphrnum ! ( 2016aug23: NounPhrase number )
variable nphrpos 0 nphrpos ! ( 2016aug26: NounPhrase part-of-speech )
variable num 0 num !  ( 2016JUL25: number-flag for the psy array )
variable numsubj   ( 2018-06-22: for number of subject )
variable nxt  ( 2016JUL29: number incremented for each new concept )
variable objprep  ( 2018-11-15: object of a prepositionl for EnPrep )
variable oldpsi  ( 2016JUL28: audpsi becomes oldpsi for OldConcept )
variable onset  0 onset ! ( 2016aug01: of an auditory memory engram )
variable PAL  1 PAL ! ( 2019-10-29: Permissive Action Link for AudBuffer and OutBuffer )
variable pho  ( 2016JUL25: phoneme of input/output & internal reentry )
variable phodex  0 phodex ! ( 2016aug23: pho-index for AudBuffer )
variable pos  ( 2019-10-04: 1=adj; 2=adv; 3=conj; 4=interj; 5=noun; 6=prep; 7=pron; 8=verb )
variable pov 1 pov !  ( 2016JUL29: point-of-view: 1=self; 2=dual; 3=alien )
variable prc  ( 2016JUL28: provisional recognition in AudRecog )
variable prclen  ( 2016JUL28:  lenth of stem when prc is declared )
variable pre  ( 2016JUL25: previous concept associated with a concept )
variable prednom  ( 2018-06-21: predicate nominative for InFerence )
variable prejux  ( 2016-08-26: previous jux to carry NOT to verb )
variable prep    ( 2018-11-10: preposition identifier for EnPrep )
variable prepcon  ( 2016aug27: prepositional condition-flag for parsing )
variable prepgen  ( 2016-08-27: urgency to generate a prepositional phrase )
variable prepsi   ( 2019-04-06: identification of concept for activation to spread to )
variable prevtag  ( 2016aug28: "previous concept" for "pre" in InStantiate )
variable prsn  0 prsn ! ( 2016aug23: 1st, 2nd, 3rd person of verb-forms )
variable psi  ( 2016JUL25: identifier of a psi concept in Psy mindcore )
variable psi20   ( 2019-09-29:  recall-vector "aud" in Rejuvenate )
variable psibase ( 2016JUL29: "winning psibase with winning actbase" )
variable putnum  ( 2018-06-22: putative number for subj-verb agreement )
variable qucon   ( 2018-06-19: query-condition for dealing with query-words )
variable quobj   ( 2018-06-21: query-object for yes-or-no questions )
variable quobjaud ( 2018-06-22: auditory recall-tag for AskUser module )
variable qusnum  ( 2018-06-21: query-subject-number for AskUser module )
variable qusub   ( 2018-06-21: internal provisional query-subject )
variable quverb  ( 2018-06-21: query-verb for yes-or-no questions )
variable qv1psi  ( 2016aug22: concept for SpreadAct to seek as a subject )
variable qv2num  ( 2018-06-19: number of a verb in a who+verb+dir.obj response )
variable qv2psi  ( 2016aug22: concept for SpreadAct to seek as a verb )
variable qv3psi  ( 2016aug22: concept for SpreadAct to seek as ind. obj. )
variable qv4psi  ( 2016aug22: concept for SpreadAct to seek as dir. obj.  )
variable qvdocon ( 2018-12-18: Query-condition for Who+Verb+Direct-Object )
variable recnum  ( 2016JUL29: "recognized number of a recognized word" )
variable rjc  0 rjc !  ( 2016aug29: rejuvenation counter for tracking )
variable rv   ( 2016aug01: recall-vector for auditory memory )
variable seq  ( 2016JUL25: subSEQuent concept associated with another )
variable seqdob  ( 2018-06-21: for direct object transfer within InFerence )
variable seqneed  ( 2016aug28: noun/pronoun or verb needed as a "seq" )
variable seqpsi ( 2016-08-26: synaptic deglobalized "seq" in SpreadAct )
variable seqrvx ( 2018-06-21: for rvx transfer within InFerence )
variable seqtkb ( 2018-06-21: for transfer during InFerence )
variable seqverb ( 2018-06-21: interstitial carrier for InFerence )
variable snu  ( 2016aug22: subject-number as parameter for verb-selection )
variable spacegap  ( 2019-09-30: to add gap of one space in Speech )
variable spt  ( 2016JUL28: blank space time before start of a word )
variable stemgap  ( 2016JUL29: "for avoiding false AudRecog stems" )
variable subjectflag  ( 2016aug14: flag for when seeking a subject )
variable subjnom ( 2018-06-21: subject-nominative for InFerence )
variable subjnum ( 2016aug25: for agreement with predicate nominative )
variable subjpre  ( 2016aug28: subject-pre to be held for verb in parsing )
variable subjpsi  ( 2016aug22: parameter to govern person of verb-forms )
variable sublen  ( 2016JUL29: "length of AudRecog subpsi word-stem" )
variable subpsi  ( 2016JUL29: "for AudRecog of sub-component wordstems" )
variable svo1  ( 2017jun15: subject -- item #1 in subject-verb-object )
variable svo2  ( 2016aug17: second item among subj-VERB-indirobj-object )
variable svo3  ( 2016aug17: third item among subj-verb-INDIROBJ-object )
variable svo4  ( 2016aug17: fourth item among subj-verb-IndirObj-OBJECT )
variable t  0 t ! ( 2016JUL25: time incremented during AudMem storage )
variable t2s  ( 2019-09-30: auditory text-to-speech index for Speech )
variable tai  ( 2016aug27: time of artificial intelligence diagnostics )
variable tbev ( 2017-06-15: time of be-verb for use with negation )
variable tcj  ( 2019-09-28: conceptual flag-panel time-of-conjunction )
variable tdj  ( 2019-09-28: conceptual flag-panel time-of-adjective )
variable tdo  ( 2016aug27: time-of-direct-object for a parser module )
variable tdt  ( 2019-09-28: time-of-dative conceptual indirect-object flag )
variable tdv  ( 2019-09-28: conceptual flag-panel time-of-adverb )
variable tgn  ( 2019-09-28: conceptual flag-panel time-of-genitive )
variable tia  ( 2019-09-28: conceptual flag-panel time-of-ablative )
variable tin   ( 2016aug29: time-of-input for interactive display )
variable tio   ( 2016aug27: time-of-indirect-object for parser module )
variable tkb  ( 2016JUL25: time-in-knowledge-base of an idea )
variable tkbn ( 2018-06-21: time of retroactive KB noun adjustment )
variable tkbo ( 2018-06-21: time of retroactive KB direct-object adjustment )
variable tkbprep  ( 2019-10-29: time of object of preposition for EnPrep )
variable tkbv  ( 2018-06-21: time of KbRetro verb adjustment )
variable tnpr  ( 2019-10-26: time-of-noun-preposition for EnPrep )
variable topic  ( 2016aug25: conceptual topic for a question to be asked )
variable tpp  ( 2016aug27: time-of-preposition for parsing )
variable tpr  ( 2019-09-28: conceptual flag-panel time-of-preposition )
variable tpu  ( 2018-06-24: time-pen-ultimate before current I/O )
variable trc  ( 2016aug29:  tabula-rasa-counter like rjc )
variable tru    ( 2017jun14: truth-value tag for conceptual flag-panel )
variable tseln  ( 2016aug22: time of selection of noun for neural inhibition )
variable tselo  ( 2018-11-10: time of selection of object )
variable tselp  ( 2018-11-10: time of selection of preposition )
variable tsels  ( 2016aug22: time of selection of subject )
variable tselv  ( 2016aug22: time of selection of verb for neural inhibition )
variable tsj   ( 2016aug27: time-of-subject for parsing )
variable tult  ( 2016JUL31: t penultimate, or time-minus-one )
variable tvb  ( 2016aug27: time-of-verb for parsing )
variable tvpr ( 2019-10-26: time-of-verb-preposition for EnPrep )
variable unk  ( 2016JUL26: general "unknown" all-purpose variable )
variable us1  ( 2018-06-20: "the" upstream noun #1 for EnArticle to keep track of )
variable us2  ( 2018-06-20: "the" upstream noun #2 for EnArticle to keep track of )
variable us3  ( 2018-06-20: "the" upstream noun #3 for EnArticle to keep track of )
variable us4  ( 2018-06-20: "the" upstream noun #4 for EnArticle to keep track of )
variable us5  ( 2018-06-20: "the" upstream noun #5 for EnArticle to keep track of )
variable us6  ( 2018-06-20: "the" upstream noun #6 for EnArticle to keep track of )
variable us7  ( 2018-06-20: "the" upstream noun #7 for EnArticle to keep track of )
variable usn  ( 2018-09-07: rotation-number for us1-us7 EnArticle concepts )
variable usx  ( 2018-09-07: transfer-variable for us1-us7 upstream variables )
variable vault 2067 vault ! ( 2019-09-28: dynamically calculated size of MindBoot )
variable verbcon  ( 2016aug27: verb-condition for seeking indirect objects )
variable verblock ( 2016aug22: for subject-noun to lock onto seq-verb )
variable verbprsn ( 2018-06-22: reverting to zero for infinitive forms )
variable verbpsi  ( 2016aug22: psi concept-number of verb in the psy{ array )
variable vphraud  ( 2016aug22: holds aud-fetch of verb-form for speech module )
variable vrsn 20191105 vrsn ! ( version identifier: 2019-11-05 )
variable wasvcon  ( 2019-02-22: query-condition for what-AUXILIARY-SUBJECT-VERB )
variable whatcon  ( 2018-06-19: flag for condition of answering a what-query )
variable wherecon ( 2018-11-10: flag for condition of answering a where-query )
variable whocon   ( 2018-12-18: flag for condition of answering a who-query )
variable whoq    ( 2019-01-15: flag for letting AskUser ask a who-question )
variable yncon   ( 2018-06-21: statuscon to trigger yes-or-no AskUser query )
variable ynverb  ( 2018-06-21: yes-or-no verb for AskUser )


:  CHANNEL   ( size num -< name >- )
  CREATE   ( Returns address of newly named channel. )
  OVER     ( #r #c -- #r #c #r )
  ,        ( Stores number of rows from stack to array.)
  * CELLS  ( Feeds product of columns * rows to ALLOT.)
  ALLOT    ( Reserves given quantity of cells for array.)
  DOES>    ( member; row col -- a-addr )
  DUP @    ( row col pfa #rows )
  ROT *    ( row pfa col-index )
  ROT +    ( pfa index )
  1 +      ( because first cell has the number of rows.)
  CELLS +  ( from number of items to # of bytes in offset )
; ( 2016JUL25: adopted from 24jul14A.F MindForth AI )


\ cns @  15  CHANNEL  psy{  ( 2017JUN14: Mindcore concept array "psy" )
cns @  21  CHANNEL  psy{  ( 2019-09-28: Mindcore concept array "psy" )
cns @   3  CHANNEL  ear{  ( 2016JUL25: Auditory memory channel "ear" )


:  TabulaRasa  ( 2016aug29: prepare memory as an empty "clean slate" )
  0 trc !  ( 2016aug29:  tabula-rasa-counter like jrc )
  BEGIN              \ 2016aug29:
    cns @  1  DO   \ 2016aug29: loop throughout "cns" memory.
    0 I  trc @  psy{ !       \ 2016aug29: put zero into each column.
  LOOP                       \ 2016aug29: make sure memory is blank.
  1  trc +!                  \ 2016aug29: Increment the counter.
  trc @  21  <  WHILE  \ 2019-09-30: Cover 21 columns designated 0-20;
  REPEAT   \ 2016aug29:
  0 trc !     \ 2016aug29: Reset tabula-rasa-counter.
  BEGIN                       \ 2016aug29:
    cns @  1  DO           \ 2016aug29:
    0 I  trc @  ear{ !     \ 2016aug29:
  LOOP                         \ 2016aug29:
  1  trc +!                    \ 2016aug29: Increment the counter.
  trc @  3  <  WHILE     \ 2016aug29:
  REPEAT                     \ 2016aug29:
  cns @  1  DO              \ 2016aug29:
    32   I  0   ear{ !      \ 2016aug29: insert ASCII 32=SPACE
  LOOP                        \ 2016aug29:
;  \ 2019-09-30: TabulaRasa returns to MainLoop.


:  PsiDecay ( http://ai.neocities.org/PsiDecay.html )
  midway @  t @  DO  \ 2016-08-27: loop from present back to "midway".
    I 3 psy{ @ 2 > IF  -2 I 3 psy{ +! THEN  \ 2017-06-14: approach zero.
    I 3 psy{ @ 0 < IF   2 I 3 psy{ +! THEN  \ 2017-06-14: rapid recovery.
  -1 +LOOP   \ 2016-08-27: loop backwards
;  \ 2017-09-17: PsiDecay returns to SpreadAct, EnThink.


:  AudDamp ( 2016aug04: deactivate auditory engrams )
  midway @  t @  DO  \ 2016aug04: loop from present back to "midway".
    0 I  1 ear{ !   \ 2016aug04: store zero activation in auditory array.
  -1 +LOOP   \ 2016aug04: loop backwards
;  \ 2016aug04: AudDamp returns to AudInput AGI mind-module.


:  .psy ( 2016JUL25: show concepts in the Psy array )
  CR  ." Psy mindcore concepts"
  CR  ." time: tru psi hlc act mtx jux pos dba num mfn pre seq tgn tdt " \ 2019-09-29
  ." tkb tia tcj tdj tdv tpr rv -- pho act audpsi " CR \ 2019-09-29
  t @ 1+  vault @ DO  \ 2016aug24: show only from end of MindBoot "vault"
      CR I . ." : "  ( http://github.com/PriorArt/AGI/wiki/MindGrid )
      I  0  psy{ @ . ." "  \ 2017JUN14: Show tru
      I  1  psy{ @ . ." "  \ 2017JUN14: Show psi
      I  2  psy{ @ . ." "  \ 2016JUL25: Show hlc
      I  3  psy{ @ . ." "  \ 2017JUN14: Show act
      I  4  psy{ @ . ." "  \ 2017JUN14: Show mtx
      I  5  psy{ @ . ." "  \ 2017JUN14: Show jux
      I  6  psy{ @ . ." "  \ 2017JUN14: Show pos
      I  7  psy{ @ . ." "  \ 2017JUN14: Show dba
      I  8  psy{ @ . ." "  \ 2017JUN14: Show num
      I  9  psy{ @ . ." "  \ 2017JUN14: Show mfn
      I 10  psy{ @ . ." "  \ 2017JUN14: Show pre
      I 11  psy{ @ . ." "  \ 2019-09-28: Show seq
      I 12  psy{ @ . ." "  \ 2019-09-28: Show tgn
      I 13  psy{ @ . ." "  \ 2019-09-28: Show tdt
      I 14  psy{ @ . ." "  \ 2019-09-28: Show tkb
      I 15  psy{ @ . ." "  \ 2019-09-28: Show tia
      I 16  psy{ @ . ." "  \ 2019-09-28: Show tch
      I 17  psy{ @ . ." "  \ 2019-09-28: Show tdj
      I 18  psy{ @ . ." "  \ 2019-09-28: Show tdv
      I 19  psy{ @ . ." "  \ 2019-09-28: Show tpr
      I 20  psy{ @ . ."   "  \ 2019-09-29: Show rv
      I  0  ear{ @ . ." "  \ 2016aug04: Show ear{ ASCII
      I  1  ear{ @ . ." "  \ 2016JUL25: Show activation
      I  2  ear{ @ .       \ 2016JUL25: Show audpsi concept number
      I  0  ear{ @ EMIT ."  "   \ 2016aug04: Show ear{ pho
  LOOP  ( 2016JUL25: end of forwards loop through cns time-points )
  CR ." time: tru psi hlc act mtx jux pos dba num mfn pre iob seq tkb rv "  \ 0 unk !
  CR ." You may enter .psy to view memory engrams or "
  CR ." MainLoop [ENTER] to erase all memories and restart the Mind."
  CR
;  ( 2019-09-30: End of .psy post-Escape report )


:  .out ( 2019-06-16: show characters in the OutBuffer )
  CR ." AudBuffer word = " CR  \ 2019-06-16
  c1  @ EMIT  c2  @ EMIT  c3  @ EMIT  c4  @ EMIT
  c5  @ EMIT  c6  @ EMIT  c7  @ EMIT  c8  @ EMIT
  c9  @ EMIT  c10 @ EMIT  c11 @ EMIT  c12 @ EMIT
  c13 @ EMIT  c14 @ EMIT  c15 @ EMIT  c16 @ EMIT
  CR ." OutBuffer word = " CR  \ 2019-06-16
  b16 @ EMIT  b15 @ EMIT  b14 @ EMIT  b13 @ EMIT  \ 2019-10-07
  b12 @ EMIT  b11 @ EMIT  b10 @ EMIT  b9  @ EMIT  \ 2019-10-07
  b8  @ EMIT  b7  @ EMIT  b6  @ EMIT  b5  @ EMIT  \ 2019-10-07
  b4  @ EMIT  b3  @ EMIT  b2  @ EMIT  b1  @ EMIT  \ 2019-10-07
  CR ." 6543210987654321 " \ 2019-06-16: show right-justification
  CR  \ 2019-06-16: Return to left margin for Forth ok prompt.
;  ( 2019-10-07: End of OutBuffer report )


:  KbLoad  ( 2016JUL25: Load the Knowledge Base from the MindBoot )
  ( truth-value tru )                    tru @  t @   0 psy{ !  \ 2017jun14
  ( concept fiber psi )                  psi @  t @   1 psy{ !  \ 2017jun14
  ( human language code )                hlc @  t @   2 psy{ !  \ 2017jun14
  ( activation level not booted )
  ( machine translation transfer )       mtx @  t @   4 psy{ !  \ 2017jun14
  ( Store JUXtaposition )                jux @  t @   5 psy{ !  \ 2017jun14
  ( Store functional pos code. )         pos @  t @   6 psy{ !  \ 2017jun14
  ( Store the dba tag )                  dba @  t @   7 psy{ !  \ 2017jun14
  ( Store NUMber )                       num @  t @   8 psy{ !  \ 2017jun14
  ( Store masc/fem/neuter )              mfn @  t @   9 psy{ !  \ 2017jun14
  ( Store PREvious associand. )          pre @  t @  10 psy{ !  \ 2017jun14
  ( Store the subSEQuent tag. )          seq @  t @  11 psy{ !  \ 2019-09-28
  ( Store the "tgn" time-point. )        tgn @  t @  12 psy{ !  \ 2019-09-28
  ( Store the "tdt" time-point. )        tdt @  t @  13 psy{ !  \ 2019-09-28
  ( Store the "tkb" time-point. )        tkb @  t @  14 psy{ !  \ 2019-09-28
  ( Store the "tia" time-point. )        tia @  t @  15 psy{ !  \ 2019-09-28
  ( Store the "tcj" time-point. )        tcj @  t @  16 psy{ !  \ 2019-09-28
  ( Store the "tdj" time-point. )        tdj @  t @  17 psy{ !  \ 2019-09-28
  ( Store the "tdv" time-point. )        tdv @  t @  18 psy{ !  \ 2019-09-28
  ( Store the "tpr" time-point. )        tpr @  t @  19 psy{ !  \ 2019-09-28
  ( Store the rv recall-vector. )         rv @  t @  20 psy{ !  \ 2019-09-28
  0 tru ! 0 psi ! 0 hlc ! 0 act ! 0 mtx ! 0 jux ! 0 pos !  \ 2019-09-28: safety reset
  0 dba ! 0 num ! 0 mfn ! 0 pre ! 0 seq ! 0 tgn ! 0 tdt !  \ 2019-09-28: safety reset
  0 tkb ! 0 tia ! 0 tcj ! 0 tdj ! 0 tdv ! 0 tpr ! 0  rv !  \ 2019-09-28: safety reset
;  ( 2019-09-28: KbLoad returns to MindBoot )


:  OutBuffer  ( http://ai.neocities.org/OutBuffer.html )
  32 b1  !  32 b2  !  32 b3  !  32 b4  !  32 b5  !
  32 b6  !  32 b7  !  32 b8  !  32 b9  !  32 b10 !
  32 b11 !  32 b12 !  32 b13 !  32 b14 !  32 b15 !
  32 b16 !
  c16 @ 32 > IF  \ 2019-06-16: if the AudBuffer is full;
    c16 @ b1  ! c15 @ b2  ! c14 @ b3  ! c13 @ b4  !
    c12 @ b5  ! c11 @ b6  ! c10 @ b7  ! c9  @ b8  !
    c8  @ b9  ! c7  @ b10 ! c6  @ b11 ! c5  @ b12 !
    c4  @ b13 ! c3  @ b14 ! c2  @ b15 ! c1  @ b16 !
    EXIT  \ 2019-06-16: abandon remainder of function;
  THEN \ 2019-06-16: end of transfer of 16-character word;
  c15 @ 32 > IF  \ 2019-06-16: word only 15 chars long?
    c15 @ b1  ! c14 @ b2  ! c13 @ b3  ! c12 @ b4  !
    c11 @ b5  ! c10 @ b6  ! c9  @ b7  ! c8  @ b8  !
    c7  @ b9  ! c6  @ b10 ! c5  @ b11 ! c4  @ b12 !
    c3  @ b13 ! c2  @ b14 ! c1  @ b15 !    32 b16 !  EXIT
  THEN  \ 2019-06-16: end transfer of a 15-character word;
  c14 @ 32 > IF \ 2019-06-16: word only 14 chars long?
    c14 @ b1  !  c13 @ b2  !  c12 @ b3  !  c11 @ b4  !
    c10 @ b5  !  c9  @ b6  !  c8  @ b7  !  c7  @ b8  !
    c6  @ b9  !  c5  @ b10 !  c4  @ b11 !  c3  @ b12 !
    c2  @ b13 !  c1  @ b14 !     32 b15 !     32 b16 ! EXIT
  THEN \ 2019-06-16: end transfer of a 14-character word;
  c13 @ 32 > IF \ 2019-06-16: word only 13 chars long?
    c13 @ b1  !  c12 @   b2 ! c11 @   b3 ! c10 @  b4 !
    c9  @ b5  !  c8  @   b6 ! c7  @  b7  ! c6  @  b8 !
    c5  @ b9  !  c4  @  b10 ! c3  @  b11 ! c2  @ b12 !
    c1  @ b13 !      32 b14 !     32 b15 !    32 b16 ! EXIT
  THEN \ 2019-06-16: end transfer of a 13-character word;
  c12 @ 32 > IF \ 2019-06-16: word only 12 chars long?
    c12 @ b1  !  c11 @ b2  !  c10 @ b3  !  c9  @ b4  !
    c8  @ b5  !  c7  @ b6  !  c6  @ b7  !  c5  @ b8  !
    c4  @ b9  !  c3  @ b10 !  c2  @ b11 !  c1  @ b12 !
       32 b13 !     32 b14 !     32 b15 !     32 b16 ! EXIT
  THEN \ 2019-06-16: end transfer of a 12-character word;
  c11 @ 32 > IF \ 2019-06-16: word only 11 chars long?
    c11 @ b1  !  c10 @ b2  !  c9  @ b3  !  c8  @  b4  !
    c7  @ b5  !  c6  @ b6  !  c5  @ b7  !  c4  @  b8  !
    c3  @ b9  !  c2  @ b10 !  c1  @ b11 !      32 b12 !
       32 b13 !     32 b14 !     32 b15 !      32 b16 ! EXIT
  THEN \ 2019-06-16: end transfer of a 11-character word;
  c10 @ 32 > IF \ 2019-06-16: word only 10 chars long?
    c10 @ b1  !  c9  @ b2  !  c8  @ b3  !  c7  @ b4  !
    c6  @ b5  !  c5  @ b6  !  c4  @ b7  !  c3  @ b8  !
    c2  @ b9  !  c1  @ b10 !     32 b11 !     32 b12 !
       32 b13 !     32 b14 !     32 b15 !     32 b16 ! EXIT
  THEN \ 2019-06-16: end transfer of a 10-character word;
  c9 @ 32 > IF \ 2019-06-16: word only 9 chars long?
    c9  @ b1  !  c8  @  b2 !  c7  @  b3 !  c6  @  b4 !
    c5  @ b5  !  c4  @  b6 !  c3  @  b7 !  c2  @  b8 !
    c1  @ b9  !     32 b10 !     32 b11 !     32 b12 !
       32 b13 !     32 b14 !     32 b15 !     32 b16 ! EXIT
  THEN \ 2019-06-16: end transfer of a 9-character word;
  c8 @ 32 > IF \ 2019-06-16: word only 8 chars long?
    c8  @ b1  !  c7  @ b2  !  c6  @ b3  !  c5  @ b4  !
    c4  @ b5  !  c3  @ b6  !  c2  @ b7  !  c1  @ b8  !
       32 b9  !     32 b10 !     32 b11 !     32 b12 !
       32 b13 !     32 b14 !     32 b15 !     32 b16 ! EXIT
  THEN \ 2019-06-16: end transfer of a 8-character word;
  c7 @ 32 > IF \ 2019-06-16: word only 7 chars long?
    c7  @ b1  !  c6  @ b2  !  c5  @ b3  !  c4  @ b4 !
    c3  @ b5  !  c2  @ b6  !  c1  @ b7  !     32 b8 !
       32 b9  !     32 b10 !     32 b11 !    32 b12 !
       32 b13 !     32 b14 !     32 b15 !    32 b16 ! EXIT
  THEN \ 2019-06-16: end transfer of a 7-character word;
  c6 @ 32 > IF \ 2019-06-16: word only 6 chars long?
    c6  @ b1  !  c5  @ b2  !  c4  @ b3  !  c3  @ b4 !
    c2  @ b5  !  c1  @ b6  !     32 b7  !     32 b8 !
       32 b9  !     32 b10 !     32 b11 !    32 b12 !
       32 b13 !     32 b14 !     32 b15 !    32 b16 ! EXIT
  THEN \ 2019-06-16: end transfer of a 6-character word;
  c5 @ 32 > IF \ 2019-06-16: word only 5 chars long?
    c5  @ b1  !  c4  @ b2  !  c3  @ b3  !  c2  @ b4 !
    c1  @ b5  !     32 b6  !     32 b7  !     32 b8 !
       32 b9  !     32 b10 !     32 b11 !    32 b12 !
       32 b13 !     32 b14 !     32 b15 !    32 b16 ! EXIT
  THEN \ 2019-06-16: end transfer of a 5-character word;
  c4 @ 32 > IF \ 2019-06-16: word only 4 chars long?
    c4  @ b1  !  c3  @ b2  !  c2  @ b3  !   c1 @ b4 !
       32 b5  !     32 b6  !     32 b7  !     32 b8 !
       32 b9  !     32 b10 !     32 b11 !    32 b12 !
       32 b13 !     32 b14 !     32 b15 !    32 b16 ! EXIT
  THEN \ 2019-06-16: end transfer of a 4-character word;
  c3 @ 32 > IF \ 2019-06-16: word only 3 chars long?
     c3 @ b1  !  c2  @ b2  !  c1  @ b3  !    32 b4  !
       32 b5  !     32 b6  !     32 b7  !    32 b8  !
       32 b9  !     32 b10 !     32 b11 !    32 b12 !
       32 b13 !     32 b14 !     32 b15 !    32 b16 ! EXIT
  THEN \ 2019-06-16: end transfer of a 3-character word;
  c2 @ 32 > IF \ 2019-06-16: word only 2 chars long?
    c2  @ b1  !  c1  @ b2  !     32 b3  !    32 b4  !
       32 b5  !     32 b6  !     32 b7  !    32 b8  !
       32 b9  !     32 b10 !     32 b11 !    32 b12 !
       32 b13 !     32 b14 !     32 b15 !    32 b16 ! EXIT
  THEN \ 2019-06-16: end transfer of a 2-character word;
  c1 @ 32 > IF \ 2019-06-16: word only 1 char long?
     c1  @ b1 !     32 b2  !     32 b3  !    32 b4  !
       32 b5  !     32 b6  !     32 b7  !    32 b8  !
       32 b9  !     32 b10 !     32 b11 !    32 b12 !
       32 b13 !     32 b14 !     32 b15 !    32 b16 ! EXIT
  THEN \ 2019-06-16: end transfer of a 1-character word;
;  \ end of OutBuffer; return to AudBuffer or VerbGen.


:  AudBuffer  ( http://ai.neocities.org/AudBuffer.html )
  1 phodex +!  \ increment; 12nov2012
  phodex @  1 = IF  \ Erase any left-over old data;
    abc @ c1 !  \ fill in first item of new data.
    32 c2  ! 32 c3  ! 32 c4  ! 32 c5  ! 32 c6  !
    32 c7  ! 32 c8  ! 32 c9  ! 32 c10 ! 32 c11 !
    32 c12 ! 32 c13 ! 32 c14 ! 32 c15 ! 32 c16 !
  THEN  \ end of blanking out with 32=SPACE
  phodex @  2 = IF abc @ c2  !  THEN  \ 2019-06-16
  phodex @  3 = IF abc @ c3  !  THEN  \ 2019-06-16
  phodex @  4 = IF abc @ c4  !  THEN  \ 2019-06-16
  phodex @  5 = IF abc @ c5  !  THEN  \ 2019-06-16
  phodex @  6 = IF abc @ c6  !  THEN  \ 2019-06-16
  phodex @  7 = IF abc @ c7  !  THEN  \ 2019-06-16
  phodex @  8 = IF abc @ c8  !  THEN  \ 2019-06-16
  phodex @  9 = IF abc @ c9  !  THEN  \ 2019-06-16
  phodex @ 10 = IF abc @ c10 !  THEN  \ 12nov2012
  phodex @ 11 = IF abc @ c11 !  THEN  \ 12nov2012
  phodex @ 12 = IF abc @ c12 !  THEN  \ 12nov2012
  phodex @ 13 = IF abc @ c13 !  THEN  \ 12nov2012
  phodex @ 14 = IF abc @ c14 !  THEN  \ 12nov2012
  phodex @ 15 = IF abc @ c15 !  THEN  \ 12nov2012
  phodex @ 16 = IF abc @ c16 !  THEN  \ 12nov2012
  OutBuffer  \ right-justify each input word; 15nov2012
  0 abc !  \ 2019-06-16: reset for non-persistence.
;  \ end of AudBuffer; return to AudInput or EnVerbGen


:  InStantiate ( http://ai.neocities.org/InStantiate.html )
  0 prevtag !   \ 2016aug28: Reset for safety.
  oldpsi @ 701 = IF 7 pos ! THEN  \ 2016aug23: 7 = pronoun.
  0 act !  \ 2016aug23: preparing to activate only older nodes of concepts.
  pov @ 2 = IF  \ 2018-07-09: only during external input, not re-entry
    psi @ 781 = IF  \ 2018-07-09: upon input of 781=WHAT
      whatcon @ 0 = IF  \ 2018-07-09: to set only once per input idea
        1 whatcon !  \ 2018-07-09: set positive to process rest of input.
      THEN  \ 2018-07-09: end of test for whatcon at zero.
    THEN  \ 2018-07-09: end of test for input of 781=WHAT
    whocon @ 0 >  qv2psi @ 800 =  AND IF  \ 2019-10-11: third stage of WHO-BE trap
      pos @ 5 =  pos @ 7 =  OR IF psi @ qv1psi ! THEN  \ 2019-10-11: catch query-subject.
    THEN  \ 2019-10-11: end of test for triple of WHO & BE and subject.
    whocon @ 0 > IF  \ 2019-10-11: second stage of WHO-BE trap
      psi @ 800 = IF  800 qv2psi ! THEN  \ 2019-10-11: set verb as 800=BE
    THEN  \ 2019-10-11: end of test for combo of WHO and BE.
    psi @ 791 = IF  \ 2018-12-18: upon input of 791=WHO...
      1 whocon !  \ 2018-12-18: set positive for use in SpreadAct.
    THEN  \ 2018-12-18: end of test for interrogative pronoun.
  THEN  \ 2018-07-09: end of test for point-of-view pov.
  pov @ 2 = IF  \ 2019-04-06: only during external input, not re-entry.
    midway @  t @  DO  \ 2016aug23: search backwards in time.
      inhibcon @ 0 = IF  \ 2016sep04: reactivate old concepts
        I 1 psy{ @ psi @ = IF  \ 2019-04-06: if stored concept matches incoming concept
          24 I 3 psy{  +!      \ 2019-04-06: activate enough to spark a thought
          I 10 psy{ @ 0 > IF  \ 2019-04-06: if a "pre" is present...
            I 10 psy{ @ prepsi !  \ 2019-04-06: grab hold of "pre" as "prepsi".
            midway @  tpu @  DO  \ 2019-04-06: search backwards in time.
              I 1 psy{ @  prepsi @ = IF  \ 2019-04-06: if concepts matches prepsi...
                midway @  tpu @  DO  \ 201904-06: search backwards in time.
                  I    1 psy{ @  0 > IF  \ 2019-04-06
                    I 11 psy{ @  prepsi @ = IF  \ 2019-09-28: if prepsi a seq
                       32 I 3 psy{ !  \ 2019-04-06: activate subject of "prepsi"
                    THEN   \ 2019-04-06: end of test for word leeding to prepsi
                  THEN  \ 2019-04-06: end of test for a positive concept-number.
                -1 +LOOP   \ 2019-04-06: end of second inner loop
              THEN  \ 2019-04-06: end of test for concept matching prepsi.
            -1 +LOOP   \ 2019-04-06: end of inner loop searching backwards in time.
          THEN  \ 2019-04-06: end of test for a positive "pre"
        THEN  \ 2019-04-06: end of test for old concept in loop to match incoming concept.
      THEN   \  2016sep04: end of test for no inhibcon.
   -1 +LOOP   \ 2016aug23: end of loop searching backwards in time.
  THEN  \ 2016aug23: end of potential test for a specific point-of-view "pov".
  wasvcon @ 0 > IF  \ 2019-02-22: if what-AUX-SUBJ-VERB query is active
    pos @ 8 =  IF  \ 2019-02-22: if part-of-speech is 8=verb
      psi @ 800 = NOT  psi @ 818 = NOT  AND IF  \ 2019-02-22: not BE or DO
        psi @ qv2psi !  \ 2019-02-22: for transfer as query-verb to SpreadAct
      THEN  \ 2019-02-22: end of test excluding 800=BE and 818=DO.
    THEN  \ 2019-02-22: end of test for 8=verb.
  THEN  \ 2019-02-22: end of test for what-AUX-SUBJ-VERB query.
  qucon @ 0 >  whatcon @ 0 >  OR IF   \ 2019-02-20: deal with more than who-is queries
    pos @ 8 =  IF  \ 2018-07-10: if part-of-speech is 8=verb
      psi @ 818 = IF  \ 2019-02-22: form of auxiliary verb 818=DO?
        1 wasvcon !  \ 2019-02-22: set positive query-con for what-AUX-SUBJ-VERB
        0 whatcon !  \ 2019-02-22: reset to zero a query-flag no longer needed.
      THEN  \ 2019-02-22: end of test for 818=DO AUX verb.
      psi @ 800 = NOT  psi @ 818 = NOT  AND IF  \ 2018-12-13: not BE or DO
        psi @ qv2psi !  \ 2018-07-10: for transfer as query-verb to SpreadAct
      THEN  \ 2018-12-13: end of test excluding 800=BE and 818=DO.
      psi @ 800 =  psi @ 818 = AND NOT IF  \ 2018-12-19: not 800=BE or 818=DO
        whocon @ 1 = IF 1 qvdocon ! THEN \ 2019-02-20: query who+verb+direct-object.
        psi @ qv2psi !  \ 2018-12-19: for transfer to SpreadAct.
      THEN  \ 2018-12-19: end of test for verb other than 800=BE or 818=DO.
    THEN  \ 2018-07-10: end of test for 8=verb part-of-speech.
    pos @ 5 =  pos @ 7 =  OR IF  \ 2018-07-09: if 5=noun or 7=pronoun...
      dba @ 1 = IF  \ 2019-10-11: require nominative case for subject.
        psi @ qv1psi !  \ 2018-07-09: for transfer as query-subject to SpreadAct.
      THEN  \ 2019-10-11: end of test for nominative dba=1.
    THEN  \ 2018-07-09: end of test for 5=noun or 7=pronoun.
    pos @ 5 =  qvdocon @ 0 >  AND IF  \ 2018-12-19: if 5=noun comes in during query...
      psi @  qv4psi !  \ 2018-12-19: to send direct object into SpreadAct.
    THEN  \ 2018-12-19: end of test for noun during who-verb-dirobj query.
    pos @ 5 =  dba @ 4 =  AND IF \ 2018-12-19: if noun and direct object...
      psi @  qv4psi !  \ 2018-12-19: to send direct object into SpreadAct.
    THEN  \ 2018-12-19: end of test for same direct-object noun as contained in query.
  THEN  \ 2018-07-09: end of test for positive query-condition whatcon.
  t @  1 - tult !  \ 2017-09-14: for storage at prior-by-one time-point.
  -48 act !  \ 2016aug26: for a "trough" of recent-most inhibition.
  tsj @ 0 > IF   \ 2019-10-02
    verbcon @ 0 > IF   \ 2019-10-02
      t @  tvb @  > IF  \ 2019-10-02
        tdo @ 0 = IF     \ 2019-10-02
\         tult @ tdo !    \ 2019-10-02
\         tdo @ tkb !    \ 2019-10-02: for storage as psi14 at time=tvb
        THEN  \ 2019-10-02
      THEN  \ 2019-10-02:
    THEN  \ 2019-10-02:
  THEN  \ 2019-10-02:
  pos @ 8 = IF prsn @ dba ! THEN  \ 2019-10-07: for verbs, use "prsn" as "dba"
  ( truth-value tru )             tru @  tult @  0 psy{ !  \ 2017JUN14: tru
  ( concept fiber psi )           psi @  tult @  1 psy{ !  \ 2017JUN14: psi
  ( human-language-code hlc )     hlc @  tult @  2 psy{ !  \ 2017JUN14: hlc
  ( activation-level act )        act @  tult @  3 psy{ !  \ 2017JUN14: act
  ( machine-translation xfer )    mtx @  tult @  4 psy{ !  \ 2017JUN14: mtx
  ( Store JUXtaposition tags. )   jux @  tult @  5 psy{ !  \ 2017JUN14: jux
  ( Store functional pos code. )  pos @  tult @  6 psy{ !  \ 2017JUN14: pos
  ( doing-business-as role )      dba @  tult @  7 psy{ !  \ 2017JUN14: dba
  ( Set "num" number flag )       num @  tult @  8 psy{ !  \ 2017JUN14: num
  ( masculine-fem.-neuter )       mfn @  tult @  9 psy{ !  \ 2017JUN14: mfn
  ( Store PREvious associand. )   pre @  tult @ 10 psy{ !  \ 2017JUN14: pre
  ( Store the subSEQuent tag )    seq @  tult @ 11 psy{ !  \ 2019-09-28: seq
  ( Store the time-of-genitive )  tgn @  tult @ 12 psy{ !  \ 2019-09-28: tgn
  ( Store any indirect object. )  iob @  tult @ 13 psy{ !  \ 2019-09-28: iob or tdt
  ( Store the time-of-dative )    tdt @  tult @ 13 psy{ !  \ 2019-09-28: tdt
  ( time-in-knowledge-base )      tkb @  tult @ 14 psy{ !  \ 2019-09-28: tkb
  ( Store the time-of-ablative )  tia @  tult @ 15 psy{ !  \ 2019-09-28: tia
  ( Store the time-of-conj. )     tcj @  tult @ 16 psy{ !  \ 2019-09-28: tcj
  ( Store the time-of-adjective ) tdj @  tult @ 17 psy{ !  \ 2019-09-28: tdj
  ( Store the time-of-adverb )    tdv @  tult @ 18 psy{ !  \ 2019-09-28: tdv
  ( Store the time-of-prep. )     tpr @  tult @ 19 psy{ !  \ 2019-09-28: tpr
  ( Store the "rv" time-point. )   rv @  tult @ 20 psy{ !  \ 2019-09-28: rv
\ pos @ 1 = IF tult @ tdj ! THEN  \ 2019-10-04: identify tdj time-of-adjective
\ pos @ 2 = IF tult @ tdv ! THEN  \ 2019-10-04: identify tdv time-of-adverb
  pos @ 5 =  pos @ 7 = OR IF  \ 2019-10-04: test for noun or pronoun
    dba @  1 = IF  \ 2019-10-04: test for nominative-case subject
      tsj @ 0 = IF  \ 2019-10-04: if not already declared...
        tult @  tsj !  \ 2019-10-04: declare time-of-subject
      THEN  \ 2019-10-4: end of test for previous declaration.
    THEN  \ 2019-10-04: end of test for nominative case "dba"
  THEN   \ 2019-10=04: end of test of "pos" part of speech.
  pos @ 8 = IF tult @ tvb ! THEN  \ 2019-10-03: identify tvb time-of-verb
  0 tult !  \ 2017-09-14: reset for safety (from ghost.pl AI)
  jux @ 250 = IF  0 jux !  THEN  \ 2016aug27: Reset after use.
    prejux @ 250 = IF  \ 2016aug28: 250=NOT; from OldConcept
    250 jux !  \ 2016aug27: set jux for next instantiand;
    0 prejux !  \ 2016aug27: Reset for safety.
  THEN  \ 2016aug27: end of post-instantiation test.
  pos @ 5 =  pov @ 2 =  AND IF psi @ usx !  \ 2018-09-07: for transfer.
    usn @ 1 = IF  psi @  us1 !  THEN  \ 2018-09-07: transfer to EnArticle.
    usn @ 2 = IF  psi @  us2 !  THEN  \ 2018-09-07: transfer to EnArticle.
    usn @ 3 = IF  psi @  us3 !  THEN  \ 2018-09-07: transfer to EnArticle.
    usn @ 4 = IF  psi @  us4 !  THEN  \ 2018-09-07: transfer to EnArticle.
    usn @ 5 = IF  psi @  us5 !  THEN  \ 2018-09-07: transfer to EnArticle.
    usn @ 6 = IF  psi @  us6 !  THEN  \ 2018-09-07: transfer to EnArticle.
    usn @ 7 = IF  psi @  us7 !  THEN  \ 2018-09-07: transfer to EnArticle.
  THEN  \ 2018-09-07: external input.
\ pos @ 5 = IF  psi @  actpsi ! THEN  \ 2018-12-21: send noun to SpreadAct
\ pos @ 5 = IF  psi @  actpsi ! THEN  \ 2019-10-28: delegate to generation module.
  pos @ 5 = pos @ 7 =  OR IF  psi @ prevtag !  THEN  \ 2016aug28: after subject
\ pos @ 5 = pos @ 7 =  OR IF  psi @ qv1psi !  THEN  \ 2018-11-15
\ pos @ 5 = pos @ 7 =  OR IF  psi @ qv1psi !  THEN  \ 2019-10-11: nominative dba=1?
  pos @ 8 = IF  psi @ prevtag !  THEN  \ 2016aug28: after a verb.
  pos @ 8 = seqneed @ 0 = AND IF psi @ seq ! THEN \ 2016aug28: for "seq" of a subject
  pos @ 5 =  pos @ 7 =  OR IF  \ 2016aug28: if 5=noun or 7=pronoun...
    0 seq !   \ 2016aug28: until set by the "seqneed" mechanism...
    seqneed @ 0 = IF  8 seqneed !  THEN  \ 2016aug28:  if start of input sentence...
    seqneed @ 5 = IF  0 seqneed !  THEN  \ 2016aug28: for subject only
  THEN  \ 2016aug28: end of test for an incoming noun or pronoun.
  pos @ 8 = IF  psi @ qv2psi ! THEN  \ 2018-11-15: verb for SpreadAct or EnPrep
  pos @ 8 = IF  5 seqneed !  THEN  \ 2016aug28: if verb, need direct object
  0 act !   \ 2016aug28: reset to prevent carry-over.
  0 pre !   \ 2016aug28: Reset to prevent carry-over.
  0 len !   \ 2018-11-24: for sake of next word before end of input.
;  \ 2019-10-04: InStantiate returns to EnParser robot mind-module.


:  EnParser ( http://ai.neocities.org/EnParser.html )
  pos @ 5 =  pos @ 7 =  OR IF  \ 2019-10-04: if noun or pronoun
    tsj @ 0 = IF  1 dba ! THEN  \ 2019-10-04: if no subject has been declared...
  THEN  \ 2019-10-04: end of test for noun or pronoun.
  48 act !  \ 2016aug23: an arbitrary activation for InStantiate
  5 bias !  \ 2016aug23: Expect a noun until overruled.
  InStantiate  \ 2019-09-29: first instantiation during parsing Stage One
  pos @ 5 = IF  8 bias ! THEN  \ 2016aug23:  after noun, expect verb.
  pos @ 7 = IF  8 bias ! THEN  \ 2016aug23: after pronoun, expect verb.
  pos @ 8 = IF  5 bias ! THEN  \ 2016aug23: after verb, expect noun.
  prepcon @ 0 = IF  \ 2016aug27: if not handling a preposition...
    pos @ 5 =  pos @ 7 = OR IF  \ 2016aug27: if noun or pronoun...
      verbcon @ 1 = IF  \ 2016aug27: if a verb has come in...
        tio @ 0 = IF  tult @ tdo !  THEN  \ 2017-09-14: gh.pl set once or twice
        tio @ 0 = IF  tult @ tio !  THEN  \ 2017-09-14: gh.pl set only once
        tio @ 0 > IF tult @ tdo ! THEN  \ 2017-09-14: 2nd noun sets dir. obj. time
        tdo @ tkb !  \ 2018-11-22 BUGFIX: let verb have a "nounlock" to direct object.
        tvb @ 1 psy{ @  pre !  \ 2017-09-14: verb psi will be pre of direct object
        tio @ 1 psy{ @  iob !  \ 2017-09-14: excerpt indirect-object concept for k11
        3 tio @  7 psy{  !  \ 2018-06-20: insert dba=3 for dative-case indirect object.
    psi @ tio @ 11 psy{  !  \ 2019-09-29: insert psi as seq at time of indirect object.
    tvb @ tio @ 14 psy{  !  \ 2019-09-29: insert tvb as tkb at time of indirect object
        tdo @ 10 psy{ @  pre ! \ 2018-06-20: obtain the "pre" of the direct object.
        0 tdo @ 11 psy{  !  \ 2019-09-29: insert zero for k11 "seq" of direct object.
        0 tdo @ 14 psy{  !  \ 2019-09-29: insert zero for k14 "tkb" of direct object.
        t @ 1 - tdo !  \ 2017-09-14: gh.pl insert time-of-direct-object for nounlock;
        tdo @ tkb !  \ 2017-09-14: from ghost.pl
            4 tdo @  7 psy{ !  \ 2019-10-07: insert dba=4 for accusative-case direct object.
       svo2 @ tdo @ 10 psy{ !  \ 2019-10-107: insert verb-psi as k10 "pre" of direct object.
            0 tdo @ 11 psy{ !  \ 2019-10-07: no "seq" for a direct object.
       prsn @ tvb @  7 psy{  !  \ 2019-10-07: insert "prsn" as "dba" of verb.
        iob @ tvb @ 11 psy{ !  \ 2017-09-14: insert ind. obj. at time of verb.
        psi @ tvb @ 11 psy{ !  \ 2019-09-29: insert "psi" as "seq" of verb.
        tkb @ tvb @ 14 psy{ !  \ 2019-09-30: insert "tkb" as k14 of verb.
        0 tkb !  \ 2018-06-20: BUGFIX: the tdo is a valid tkb only for a verb.
      THEN  \ 2017-09-14: gh.pl end of test for a condition following a verb.
    THEN  \ 2017-09-14: end of test for noun not object of a preposition.
  THEN  \ 2017-09-14: end of test for a non-prepositional condition.
  pos @ 6 = IF  1 prepcon !  tult @ tpp !  THEN  \ 2016aug27: prepare for a noun.
  pos @ 5 =   pos @ 7 =  OR IF  \ 2016aug27: if 5=noun or 7=pronoun...
    prepcon @ 1 = IF  \ 2016aug27: if dealing with a preposition...
      tpp @ 1 psy{ @ pre !  \ 2018-11-10: Let "pre" briefly be the preposition.
      tpp @ 1 psy{ @ prep ! \ 2018-11-10: identify prep. to be the seq of the verb.
      psi @  tpp @ 11 psy{ !  \ 2019-09-29: object becomes "seq" of the preposition.
      tult @ tpp @ 14 psy{ !  \ 2019-09-29: establish tkb between prep. and its object.
      4     tult @  7 psy{ !  \ 2018-11-10: set 4=obj as "dba" of object of preposition.
      pre @ tult @ 10 psy{ !  \ 2018-11-10: set the chosen "pre" of the obj. of prep.
      prep @ tvb @ 11 psy{ !  \ 2019-09-29: set the "prep" as the "seq" of the verb.
      0 prep !     \ 2018-11-10: Reset to prevent carry-over.
      0 prepcon !  \ 2018-11-10: Reset to prevent carry-over.
    THEN  \ 2016aug27: end of test for a positive prepcon.
  THEN  \ 2016aug27: end of test for a noun or pronoun.
  pos @ 8 =  IF  \ 2016aug28: if part-of-speech is 8=verb...
    psi @ 818 = NOT IF  \ 2018-12-13: if verb other than 818=DO
     \ 2016aug30 Note: An "auxcon" could be used to permit non-auxcon "DO".
\     tult @ tvb !  \ 2016aug27: hold onto time-of-verb for flag-insertions.
\     tult @ tvb !  \ 2019-10-03; declaration may belong in InStantiate module.
      1 verbcon !  \ 2016aug27: verb-condition is "on" for ind. & dir. objects.
    tsj @  1 psy{ @  subjpre !  \ 2017-09-14: Hold onto subjpre for the pos=8 verb
    1  tsj @  7 psy{ !  \ 2017jun14: for subject set 1=dba to be nominative.
    psi @  tsj @ 11 psy{ !  \ 2019-09-29: for subject set "psi" (verb) to be the "seq".
    tvb @  tsj @ 14 psy{ !  \ 2019-09-28: for subject set "tkb" to be the verb.
    subjpre @  tult @ 10 psy{ !  \ 2017-09-14: subjpre becomes "pre" of the verb.
    0 subjpre !   \ 2016aug28: Reset for safety.
    THEN  \ 2018-12-13: end of test for not auxiliary 818=DO
  THEN  \ 2016aug27: end of test for a pos=8 verb.
;  \ 2019-10-07: EnParser returns to OldConcept or NewConcept.


:  KbRetro ( http://ai.neocities.org/KbRetro.html )
  kbzap @ 432 =  kbzap @  404 =  OR IF  \ 2018-06-22: if 432=YES or 404=NO...
    kbzap @ 404 = IF  \ 2018-06-22: if user response is 404=NO...
      64  tkbn @  3 psy{ ! \ 2018-06-22: high noun activation;
      quverb @ tkbv @  1 psy{ !  \ 2018-06-22: insert verb concept-number
      64       tkbv @  3 psy{ !  \ 2018-06-22: set high verb activation.
      250      tkbv @  5 psy{ !  \ 2018-06-22: set 250=NOT jux flag.
      8        tkbv @  6 psy{ !  \ 2018-06-22: set 8=verb POS-flag.
      qusub @  tkbv @ 10 psy{ !  \ 2018-06-22: set qusub as pre of verb.
      quobj @  tkbv @ 11 psy{ !  \ 2019-09-29: set quobj as seq of verb.
      tkbo  @  tkbv @ 14 psy{ !  \ 2019-09-29: set tkbo as tkb of verb.
      0        tkbv @ 20 psy{ !  \ 2019-09-29: set no auditory recall-vector.
    THEN  \ 2018-06-22: end of test for a no-answer.
    kbzap @ 432 = IF  \ 2018-06-22: if user response is 432=YES...
      6        tkbn @  0 psy{ !  \ 2019-06-16: set positive "tru" truth-value.
      64       tkbn @  3 psy{ !  \ 2019-10-01: activate the subject-noun
      5        tkbn @  6 psy{ !  \ 2019-10-01: for noun set pos=6 noun.
      1        tkbn @  7 psy{ !  \ 2019-10-01: for noun set dba=1 nominative
      quverb @ tkbn @ 11 psy{ !  \ 2019-10-01: for noun set query-verb as seq
      64       tkbv @  3 psy{ !  \ 2018-06-22: set high verb activation.
      8        tkbv @  6 psy{ !  \ 2018-06-22: set 8=verb POS-flag.
      3        tkbv @  7 psy{ !  \ 2018-10-19: set 3=dba person-flag
      qusub @  tkbv @ 10 psy{ !  \ 2018-06-22: set qusub as pre of verb.
      quobj @  tkbv @ 11 psy{ !  \ 2019-09-29: set quobj as seq of verb.
      tkbo  @  tkbv @ 14 psy{ !  \ 2019-09-29: set tkbo as tkb of verb.
      4        tkbo @  7 psy{ !  \ 2019-10-01: for dir.obj. set dba=4 accusative
    THEN  \ 2018-06-22: end of test for a yes-answer.
    ELSE  \ 2018-06-22: if neither yes nor no answer comes in...
    0          tkbn @  10 psy{ !  \ 2018-06-22: remove any pre from noun.
    0          tkbn @  11 psy{ !  \ 2019-09-29: remove any seq from noun.
    0          tkbv @  10 psy{ !  \ 2018-06-22: remove any pre from verb.
    0          tkbv @  11 psy{ !  \ 2019-09-29: remove any seq from verb.
  THEN  \ 2018-06-22: end of test for either yes or no.
  0 inft !    \ 2019-10-02: reset for safety.
  0 quobj !   \ 2018-06-22: reset for safety.
  0 qusub !   \ 2019-10-02: reset for safety.
  0 qusnum !  \ 2019-10-02: reset for safery.
  0 quverb !  \ 2019-10-02: reset for safety.
  0 tkbn  !   \ 2018-06-22: reset for safety.
  0 tkbo !    \ 2019-10-02: reset for safety.
  0 tkbv  !   \ 2018-06-22: reset for safety.
  PsiDecay    \ 2018-06-22: for distribution of PsiDecay influence;
;  \ 2019-10-02: KbRetro returns to EnThink.


:  OldConcept ( http://ai.neocities.org/OldConcept.html )
  midway @  t @  DO  \ 2016aug26: search backwards in time
    I  1 psy{ @  oldpsi @ = IF  \ 2017jun14:
      I 6 psy{ @ 0 > IF  I 6 psy{ @ pos !  THEN  \ 2017jun14: pos = part of speech;
      I 8 psy{ @ 0 > IF  I 8 psy{ @ num !  THEN  \ 2017jun14: grammatical number;
      I  9 psy{ @ 0 > IF  I  9 psy{ @ mfn !  THEN  \ 2017jun14: m/f/n gender 1/2/3;
    THEN  \ 2016aug26: end of test for oldpsi match in psy{ concept array.
  -1 +LOOP   \ 2016aug26: end of loop searching through @psy conceptual array.
  oldpsi @ 800 = IF t @  1 - tbev !  THEN  \ 2017-06-15: for be-verb negation.
  oldpsi @ 250 = IF   \ 2017-06-15: from ghost.pl
    tbev @ 0 > IF  250 tbev @ 5 psy{ ! 0 tbev ! THEN  \ 2017-06-15: store 250=NOT
  THEN  \ 2017-06-15: end of test for NOT-negation.
  oldpsi @ 250 = IF  250 prejux !  THEN  \ 2016aug26: a flag for negation.
  oldpsi @  432 = IF  432 kbzap ! THEN  \ 2018-06-22: 432=YES for KbRetro
  oldpsi @  404 = IF  404 kbzap ! THEN  \ 2018-06-22: 404=NO for KbRetro
  oldpsi @ psi !  \ 2016JUL31: to be used in InStantiate.
  pov @ 2 = IF  \ 2016aug26: during external input in  a pov "dual" conversation...
    oldpsi @ 245 = IF  8 prepgen !  THEN  \ 2018-11-15: if "Where?" call EnPrep.
    oldpsi @ 245 = IF  1 wherecon ! THEN  \ 2018-11-15: if 245=where.
    oldpsi @ 707 = IF  701 psi !  0 rv !  THEN  \ 2016aug26: interpret "YOU" as "I";
    oldpsi @ 701 = IF  707 psi !  0 rv !  THEN  \ 2016aug26: interpret "I" as "YOU".
    oldpsi @ 731 = IF  737 psi ! 2 num ! 1 dba !  0 rv !  THEN  \ 2016aug26: we --> you.
    oldpsi @ 800 = IF  1 becon ! THEN  \ 2018-06-19: for InFerence.
  THEN  \ 2016aug26: end of test for other person communicating with the AI.
  b1 @ 83 = IF 2 num ! THEN  \ 2019-10-08: assume noun ending in "S" is plural
  EnParser  \ 2016JUL31: In preparation to call InStantiate.
  pov @ 2 = IF  \ 2018-06-21: external POV during input;
    pos @ 5 = IF  \ 2018-06-21: nouns only, not pronouns;
      subjnom @  0 >  IF  \ 2018-06-21: already subjnom?
        oldpsi @  prednom !  \ 2018-06-21: for InFerence;
      THEN  \ 2018-06-21: end of test for pre-existing subjnom.
      subjnom @ 0 =  prednom @ 0 = AND IF  \ 2019-10-10: a stricter test
        oldpsi @  subjnom !  \ 2018-06-21: hold for InFerence;
        num @ subjnum !      \ 2018-06-21: for AskUser;
        num @ qusnum !  \ 2018-06-21: query-subject-number for AskUser;
      THEN  \ 2018-06-21: alternate between subjnon and prednom.
    THEN  \ 2018-06-21: end of test for a noun.
    pos @ 8 = IF  \ 2018-06-21: verb part-of-speech?
      oldpsi @  800 = NOT IF  \ 2018-06-21: other than be-verb?
        0 subjnom !  \ 2018-06-21: cancel out any subjnom.
      THEN  \ 2018i-06-21: end of test for a be-verb.
    THEN  \ 2018-06-21: end of test for a verb.
  THEN  \ 2018-06-21: end of test for external-input POV.
  0 audpsi !  \ 2016aug05: prevent carry-over.
  0 audrec !  \ 2018-09-23: TEST
  0 mfn !     \ 2019-10-26: prevent carry-over.
  0 prc !     \ 2018-09-23: TEST
  0 monopsi !  \ 2016aug06: prevent carry-over.
  0 oldpsi !  \ 2016JUL28: reset for safety.
;  \ 2016JUL28: OldConcept returns to AudInput mind-module.


:  NewConcept ( http://ai.neocities.org/NewConcept.html )
  nxt @ psi !  \ 2016JUL30: for transfer to InStantiate module.
  bias @ 5 = IF psi @ subjnom ! THEN  \ 2019-10-10: for InFerence
  bias @ pos !   \ 2016aug29: assume an expected part-of-speech "pos".
  bias @ 8 = IF  3 dba ! THEN  \ 2016aug29: default dba=3 third person;
  bias @ 5 = IF  \ 2019-10-08: if expecting a noun...
    b1 @ 83 = IF 2 num ! THEN  \ 2019-10-08: assume noun ending in "S" is plural
  THEN  \ 2019-10-08: end of test for expecting a noun.
  EnParser     \ 2016JUL30: as a bridge to the InStantiate module.
  pos @ 8 = IF nxt @ quverb ! THEN  \ 2018-06-21: for AskUser yes-or-no;
  pov @  2 = IF  \ 2018-06-21: external POV during input?
    pos @ 5 = IF  \ 2018-06-21: nouns only, not pronouns;
      subjnom @  0 >  IF  \ 2018-06-21: already subjnom?
        newpsi @  prednom !  \ 2018-06-21: infer from prednom;
      THEN  \ 2018-06-21: end of test for pre-existing subjnom.
      subjnom @ 0 = IF newpsi @ subjnom ! THEN  \ 2019-10-10: for InFerence
      prednom @ 0 = IF  \ 2018i-06-21: subject-slot still open?
\       newpsi @  subjnom !  \ 2018-06-21: hold for InFerence;
        subjnom @ 0 = IF newpsi @  subjnom ! THEn  \ 2019-10-10: partial BUGFIX
        num @ subjnum !      \ 2018-06-21: hold for AskUser;
        num @ qusnum !       \ 2018-06-21: query-subject-number for AskUser;
      THEN  \ 2018-06-21: alternate between subjnon and prednom.
    THEN  \ 2018-06-21: end of test for a noun;
  THEN  \ 2018-06-21: end of test for external-input POV.
  0 audpsi !   \ 2016aug01: reset to prevent carry-overs.
  0 monopsi !  \ 2016aug06: prevent carry-over.
;  \ 2019-10-10: NewConcept returns to AudInput AGI mind-module.


:  GusRecog  ( gustatory recognition robot mind-module stub )
  ( See http://ai.neocities.org/GusRecog.html )
  ( See http://mind.sourceforge.net/gusrecog.html )
;   \ 2018-07-09: GusRecog will return to the Sensorium mind-module.

:  OlfRecog  ( olfactory recognition robot mind-module stub )
  ( See http://ai.neocities.org/OlfRecog.html )
  ( See http://mind.sourceforge.net/olfrecog.html )
;   \ 2018-07-09: OlfRecog will return to the Sensorium mind-module.

:  TacRecog  ( http://ai.neocities.org/TacRecog.html )
  755 haptac !  \ 2019-11-05: a default value of 755=SOMETHING
  hap @  1 = IF  551 haptac ! THEN  \ 2019-11-05: identifier of noun 551=ONE
  hap @  2 = IF  582 haptac ! THEN  \ 2019-11-05: identifier of noun 582=TWO
  hap @  3 = IF  583 haptac ! THEN  \ 2019-11-05: identifier of noun 583=THREE
  hap @  4 = IF  544 haptac ! THEN  \ 2019-11-05: identifier of noun 544=FOUR
  hap @  5 = IF  545 haptac ! THEN  \ 2019-11-05: identifier of noun 545=FIVE
  hap @  6 = IF  566 haptac ! THEN  \ 2019-11-05: identifier of noun 566=SIX
  hap @  7 = IF  577 haptac ! THEN  \ 2019-11-05: identifier of noun 577=SEVEN
  hap @  8 = IF  588 haptac ! THEN  \ 2019-11-05: identifier of noun 588=EIGHT
  hap @  9 = IF  559 haptac ! THEN  \ 2019-11-05: identifier of noun 559=NINE
  hap @ 10 = IF  590 haptac ! THEN  \ 2019-11-05: identifier of noun 590=ZERO
  haptac @ 0 > IF  \ 2019-11-05:
    701 actpsi !  \ 2019-11-05: activate 701=I as a self-aware subject.
    823 actpsi !  \ 2019-11-05: activate 823=FEEL as a verb of sentience.
  THEN  \ 2019-11-05: end of test for positive haptac
;   \ 2019-11-05: TacRecog returns to Sensorium or EnVerbPhrase.

\ The visual recognition module of MindForth AI for robots
\ when fully implemented will serve the purpose of letting
\ AI Minds dynamically describe what they see in real time
\ instead of fetching knowledge from the AI knowledge base.
:  VisRecog  ( http://ai.neocities.org/VisRecog.html )
  svo4  @ 0 = IF  \ 2016aug31: if no direct object is available;
    midway @  t @  DO  \ 2016aug31: search for an automatic default
      I       1 psy{ @  760 = IF  \ 2017jun143: 760=NOTHING
        I     6 psy{ @  nphrpos !   \ 2017-09-01: set for EnArticle.
        I    20 psy{ @  aud !       \ 2019-09-29:  hold address for Speech
        LEAVE       \ 2016aug31: one engram is enough.
      THEN          \ end of test for concept # 760=NOTHING
    -1 +LOOP      \ 2016aug31: end of backwards loop
  THEN    \ end of test for subject-verb-object item #4
; \ 2019-09-30: VisRecog returns to Sensorium +/- NLP generation modules.


:  AudRecog ( http://ai.neocities.org/AudRecog.html )
  audrun @ 0 = pho @ 32 = AND IF 0 audrun ! THEN \ 2019-10-29: non-increment here only
  pho @ 32 =  pho @ 13 = OR NOT IF  \ 2016aug20: if incoming word continues
    audrec @ 0 > IF  \ 2016aug20: if positive audrec before end of word...
      pho @ 83 = NOT IF  \ 2016aug22: keep audrec if current pho is 83=S
         audrec @ 0 > IF  audrec @ prc ! THEN  \ 2018-09-23: keep non-final audrec
         0 audrec !  \ 2016aug20: zero out non-final audrec.
      THEN  \ 2016aug22: end of test for final "S" as inflectional ending.
    THEN  \ 2016aug20: end of test for audrec before word-end
  THEN  \ 2016aug20: end of test for an alphabetic character
  pho @ 32 = pho @ 13 = OR IF     \ 2016aug24: 32=SPACE or 13=CR
    audrec 0 > IF   \ 2016aug20: if positive audrec before 32=SPACE...
       audrec @ audpsi !  \ 2016aug24: recognized item becomes storage item.
    THEN  \ 2016aug20: end of test for a positive audrec before 32=SPACE
  THEN  \ 2016aug20: end of test for 32=SPACE after a word of input.
  midway @  spt @ DO  \ 2016aug20: search backwards in time.
    pho @ 32 > IF  \ 2016aug20: disregard 32=SPACE pho until end of input.
      I 0 ear{ @ pho @ = NOT IF  0 I 1 ear{ ! THEN  \ 2016sep16: de-activate (Ghost.pl)
      I 0 ear{ @ pho @ = IF  \ 2016aug20: If incoming pho matches stored aud0;
        I 1 ear{ @ 0 = IF  \ 2016aug20: if matching engram has no activation;
          I 1 -  0 ear{ @ 33 < IF  \ 2016aug20: if previous engram not a letter...
            audrun @ 2 < IF  \ 2016aug20: if comparing start of a word...
               I 1+ 0 ear{ @ 32 > IF  \ 2016aug20: if next engram is a letter...
                 8 I 1+  1 ear{ !  \ 2016JUL28: activate the N-I-L character,
               THEN  \ 2016aug20: end of test for continuation of stored comparand.
               I   2 ear{ @ 0 > IF   \ 2016aug20: audpsi available?
                 I 2 ear{ @ prc !     \ 2018-09-23: provisional recognition
               THEN  \ 2016aug20: end of test for potential monopsi ultimate-tag
            THEN  \ 2016aug20:  Mindforth "end of test for audrun=1 start of word"
          THEN  \ 2016aug20: "end of test for a beg(inning) non-active aud0"
        THEN  \ 2016aug20:  "end of test for matching aud0 with no activation"
        I 1 ear{ @ 0 > IF  \ 2016aug20: "If matching aud0 has activation"
            8 I 1+  1 ear{ !  \ 2018-09-23: activate the N-I-L character
            I 1+ 0 ear{ @ 13 =  I 1+ 0 ear{ @ 32 =  OR IF  \ 2018-09-23
               I 2 ear{ @ 0 > IF  \ 2018-09-23: check for an audpsi tag
                I 2 ear{ @ prc !  \ 2018-09-23: provisional recognition of a stem
              THEN  \ 2018-09-23: end of test for an available audpsi.
            THEN  \ 2018-09-23:
         I 2 ear{ @ 0 > IF  I 2 ear{ @ prc ! THEN  \ 2018-09-23: provisionmal
         pho @ 32 = pho @ 13 = OR IF  \ 2016aug24: no report until SPACE or CR
           audrec @ 0 > IF  \ 2016aug20: if an audrec has been found...
             audrec @ audpsi !   \ 2016aug20: send audpsi into AudMem
           THEN  \ 2016aug20: end of test for a positive audrec
           0 audrec !  \ 2016aug20: disallow audrec until last letter of word.
          THEN  \ 2016aug20
         pho @ 32 = pho @ 13 = OR NOT IF  \ 2016aug24: if not CR or SPACE
          I 1+ 0 ear{ @ 32 > IF  \ 2016aug20: if next engram is a letter...
            8 I 1+  1 ear{ !  \ 2016aug20: activate the N-I-L character
          THEN  \ 2016aug20: since next engram is a letter...
         THEN  \ 2016aug20: end of test for 32-SPACE after input word.
        THEN  \ 2016aug20: "End of test for matching aud0 with activation."
      THEN  \ 2016aug20: "End of test for a character matching 'pho'."
    THEN  \ 2016aug20: end of test for alphabet letter
  -1 +LOOP  \ 2016aug20: End of backwards search through auditory memory.
  audrec @ 0 > IF  audrec @ audpsi ! THEN  \ 2018-09-23: for transfer to AudMem
  prc @ 0 > IF  \ 2018-09-23:
    prc @ audrec !  \ 2018-09-23: provisional recognition becomes actual.
    audrec @ 0 > IF  audrec @ audpsi ! THEN  \ 2018-09-23: for passage to AudMem
  THEN  \ 2018-09-23:
  1 audrun +!  \ 2016aug20: audrun is only a counter, not a factor.
;  \ 2019-10-29: AudRecog returns to AudMem with audpsi of any recognized concept.


:  AudMem ( http://ai.neocities.org/AudMem.html )
  pho @  t @  0 ear{ !  \ 2016aug04: store the character in the first columns;
  pho @ 13 = IF  32 t @  0 ear{ !  THEN  \ 2019-02-22: store SPACE instread of CR.
  t @ vault @ > IF  \ 2016JUL28: Engrams in vault do not need auditory recognition.
    pho @ 13 =  pho @ 31 >  OR IF   \ 2016aug26: permit CR or SPACE equally.
      AudRecog  \ 2016JUL28: for audpsi concept-number upon recognition.
    THEN   \ 2016aug24: end of test for CR or SPACE or alphabetic letter.
  THEN  \ 2016JUL28: end of test for time-point beyond MindBoot vault.
  audpsi @ 0 > IF               \ 2016aug01: if there is a recognized audpsi
    t @ vault @ < IF   \ 2016aug04: if not checking for post-word SPACE...
      audpsi @  t @  2 ear{ !   \ 2016aug04: store in the rightmost column;
   THEN  \ 2016aug04: end of test for time within "vault" of MindBoot.
    t @ vault @ > IF  \ 2016aug04: during normal time beyond MindBoot vault...
      audpsi @  t @ 1 -  2 ear{ !   \ 2016aug04: store just prior to 32=SPACE.
      t @ 1 -  0 ear{ @ 83 = IF  \ 2018-09-23: if 83=S indicates plural...
        audpsi @  t @ 2 -  2 ear{ !   \ 2018-09-23: store one row back from "S".
      THEN  \ 2018-09-23: end of test for "S" at end of word being stored.
    THEN  \ 2016aug04: end of test for time past "vault" of MindBoot.
  THEN                               \ 2016aug01: end of test for recognized word.
;  \ 2016JUL28: AudMem returns to the AudInput AGI mind-module.


:  AudListen ( http://ai.neocities.org/AudListen.html )
  1024  1 DO   \ 2018-11-22: begin loop; changing 512 to 1024 for longer input time.
    KEY? IF   \ 2016JUL26:
      KEY pho !   \ 2016JUL26: move keyboard value to pho
      pho @ 48 = IF  7 EMIT 10 hap ! TacRecog 0 pho ! THEN  \ 2019-11-05: sensory input
      pho @ 49 = IF  7 EMIT  1 hap ! TacRecog 0 pho ! THEN  \ 2019-11-05: sensory input
      pho @ 50 = IF  7 EMIT  2 hap ! TacRecog 0 pho ! THEN  \ 2019-11-05: sensory input
      pho @ 51 = IF  7 EMIT  3 hap ! TacRecog 0 pho ! THEN  \ 2019-11-05: sensory input
      pho @ 52 = IF  7 EMIT  4 hap ! TacRecog 0 pho ! THEN  \ 2019-11-05: sensory input
      pho @ 53 = IF  7 EMIT  5 hap ! TacRecog 0 pho ! THEN  \ 2019-11-05: sensory input
      pho @ 54 = IF  7 EMIT  6 hap ! TacRecog 0 pho ! THEN  \ 2019-11-05: sensory input
      pho @ 55 = IF  7 EMIT  7 hap ! TacRecog 0 pho ! THEN  \ 2019-11-05: sensory input
      pho @ 56 = IF  7 EMIT  8 hap ! TacRecog 0 pho ! THEN  \ 2019-11-05: sensory input
      pho @ 57 = IF  7 EMIT  9 hap ! TacRecog 0 pho ! THEN  \ 2019-11-05: sensory input
      pho @ 0 > IF  \ 2016JUL26: if there is a positive pho value...
        pho @ EMIT  \ 2016JUL26: display the input pho character
      THEN             \ 2016JUL26: end of test for input
      pho @ DUP 96 > IF  \ 2016JUL26: convert input to UPPERCASE
        DUP 123 < IF        \ 2016JUL26: from 24jul14A.F
          32 -                    \ 2016JUL26: from 24jul14A.F
        THEN                    \ 2016JUL26: from 24jul14A.F
      THEN  pho !  \ 2016JUL26: save UPPERCASE as pho(neme) again.
      pho @ abc !  \ 2018-10-19: for transfer first to AudBuffer, then OutBuffer
      pho @ 9 = IF 1 fyi +! THEN  \ 2018-11-22: from 24jul14A.F
      fyi @ 4 > IF 0 fyi ! THEN   \ 2018-11-22: adapted from 24jul14A.F
      0 impetus !  \ 2018-09-23: upon user imput, disincentivize Imperative.
      0 isolation !  \ 2018-10-07: upon user imput, disincentivize Imperative.
      LEAVE  \ 2016JUL26: accept one character at a time.
     ELSE   \ 2016JUL26: if no character comes in...
      ."  "    \ 2016JUL26: display a SPACE in preparation for back-space
    THEN  \ 2016JUL26: end of if-clause
    8  EMIT  \ 2016sep04: backspace to flicker like a living soul.
  LOOP  \ end of loop waiting for input
; ( 2016JUL26: AudListen returns to AudInput )


:  AudInput ( http://ai.neocities.org/AudInput.html )
  t @ krt !  \ 2016aug23: knowledge-representation-time
  t @ spt !  \ 2016JUL28: time of a space between words.
  0 audpsi !  \ 2016aug05: prevent carry-over.
  0 iob !  \ 2017-09-14: reset indirect-object identifier for safety.
\ 0 tdo !  \ 2017-09-14: reset at level above EnParser and InStantiate
\ 0 tdo !  \ 2019-10-03: value must be kept across multi-word inputs.
  0 tio !  \ 2017-09-14: reset at level above EnParser and InStantiate
  pov @ 2 = IF   ( 2016aug26: during external input POV  )
   fyi @ 0 > IF  \ 2018-11-22: do not display prompt if fyi=0
    CR ." Human: " CR  \ 2016aug27: Display prompt for human input.
   THEN  \ 2018-11-22: end of condition permitting display of pure thought.
  THEN  \ 2016aug26: end of external POV entry prompt.
  140 0 DO ( Accept a tweet of 140 characters from Twitter)
    pov @ 2 = IF   ( 2016aug25: during external input )
      AudListen  \ 2016JUL26: check for keyboard input....
      pho @ 32 > IF  \ 2016aug01: if input is an alphabetic character...
        1 len +!         \ 2016aug01: increment length
        AudBuffer  \ 2018-10-19: For external input; otherwise from EnVerbGen
      THEN  \ 2016aug04: end of establishing len(gth).
    THEN  \ 2016aug25: end of test for pov=2 external input
    pho @  0 > IF  \ 2016aug25: if a character has come in...
      1 t +!           \ 2016aug25: increment internal AI time "t"
    THEN  \ 2016aug25: end of test for a key-input.
    pho @ 31 >  pho @ 13 =  OR IF  \ 2016aug27: CR, SPACE or alphabetic letter
      pho @ 32 > IF  \ 2018-10-23: no recall-vector for 32=SPACE
        len @ 1 = IF t @ rv !  THEN  \ 2016aug28: set recall-vector.
        rv @ 0 = IF  \ 2018-11-24: if not yet set...
          len @ 1 = IF t @ rv !  THEN  \ 2016aug28: set recall-vector.
        THEN  \ 2018-11-24: end of test for not-yet-set value
      THEN  \ 2018-10-23: end of exclusion of 32=SPACE from "rv".
      AudMem  \ 2016aug25: Calling memory-insertion subroutine
    THEN             \ 2016aug25: end of conditional test.
    pho @ 13 = IF  ( 2016aug01: carriage-return )
      1 audrun !  \ 2016aug01: Reset to one at CR end of input.
      13 eot !      \ 2016aug01: end of transmission
      10 EMIT  CR  \ 2016aug01: 10 = Linefeed
    THEN  \ 2016aug01: end of test for Enter-key carriage-return.
    pho @ 27 =  IF  \ 2016aug02: ASCII 27 = ESCape key.
       CR ." Enter .psy to see contents of MindGrid."  \ 2016aug02: message
       QUIT  \ 2016aug02: Stop the Win32Forth program.
    THEN  \ 2016JUL26: Press ESC to quit.
    pho @ 32 =  pho @ 13 =  OR IF  \ 2016aug24: after SPACE or CR...
      1 audrun !  \ 2016aug01: Reset to unity at end of a word.
      0 phodex !  \ 2018-10-19: Reset for AudBuffer.
      t @ spt !    \ 2016aug01: set time-of-SPACE "spt" to current time "t".
      t @  1 - tult !  \ 2016aug01: for storage at prior-by-one time-point.
      audpsi @ 0 > IF  \ 2016JUL28: if a word has been recognized...
        0 sublen !  \ 2016aug01: length of audRecog subpsi word-stem
        pho @ 32 =  pho @ 13 =  OR IF   \ 2016aug24: SPACE or CR
          audpsi @ oldpsi !  \ 2016JUL28: transfer value for OldConcept.
            0 audpsi !  \ 2016aug22: re-set to prevent carry-over.
          0 prc !  \ 2016JUL28: reset provisional recognition "prc";
        THEN  \ 2016aug04: end of test for word-terminating 32=SPACE
        OldConcept  \ 2016JUL28: call module for recognized concepts.
        0 rv !  \ 2018-11-24: so new "rv" may be set for another word.
\       LEAVE  \ 2018-11-24: stop the loop if word is recognized.
       ELSE  \ 2016JUL29: if no old concept is recognized...
          len @ 0 > IF  \ 2016JUL29: if dealing with a word of positive length...
            32 t @ 1 + 0 ear{ !  \ 2016aug01: departure from Perl AI: store 32=SPACE
            tult @ 0 ear{ @  32 > IF   \ 2016aud01: store only next to a character
              nxt @ tult @  2 ear{ !  \ 2018-09-23: store "nxt" before NewConcept
            THEN  \ 2016aug01: end of test for a character
            NewConcept  \ 2016JUL29: create new concept with number "nxt".
            0 rv !  \ 2018-11-24: so new "rv" may be set for another word.
            1 nxt +!   \ 2016aug01: increment for next concept.
\           LEAVE  \ 2018-11-24: stop the loop if new concept is created.
          THEN  \ 2016JUL29: end of test for a positive word-length.
      THEN  \ 2016JUL28: end of test for a recognized audpsi concept.
      AudDamp  \ 2016aug06: de-activate auditory memory in advance of next word.
     THEN  \ 2016JUL31: end of test for 32=SP or 13=CR to make sure word has ended
      pho @ 13 = IF 13 eot ! THEN  \ 2016aug24: merely capture the 13=CR
      eot @ 0 > IF  \ 2016JUL26: if end of txt...
       eot @ 14 = IF  \ 2016JUL26: after waiting
         0 eot !   \ 2016JUL26: zero out
         0 pho !  \ 2016JUL26: zero out
         LEAVE   \ 2016JUL26: stop input after enter-key
       THEN     \ 2016JUL26: end of test
       14 eot !  \ 2016JUL26: wait for one more character?
      THEN  \ 2016JUL26: end of test
      0 pho !  \ 2016JUL26: must be reset to zero each time.
  LOOP
  0 audpsi !  \ 2016JUL28: Reset for safety.
  0 audrec !  \ 2018-09-23: TEST
  0 pre !     \ 2018-09-23: TEST
  0 psi !       \ 2016JUL28: Reset to prevent carry-over.
; ( 2019-10-14: AudInput returns to Sensorium or Speech )


:  Sensorium ( http://ai.neocities.org/Sensorium.html )
  0 len !  \ 2016aug28: let other modules increase len(gth)
  0 tdo !   \ 2016sep03: zero out to prevent carry-over.
  0 tio !   \ 2016sep03: zero out to prevent carry-over.
  0 tvb !   \ 2016sep03: zero out to prevent carry-over.
  0 verbcon !  \ 2016sep03: zero out to prevent carry-over.
  fyi @ 0 > IF  \ 2018-11-22: let 0=fyi show nothing but the AI thinking.
    CR CR ." Enter Subject-Verb-Object or prepositional phrase; TAB for fyi= " fyi @ .
  THEN  \ 2018-11-22: end of test for a positive "fyi"
  2 pov !  \ 2016aug25: set pov=2 external point-of-view
  32 pho !  \ 2018-09-23: prevent initial misrecognition.
  AudInput   ( 2016AUG01: for entry or reentry of phonemic ASCII )
  GusRecog  ( 2016aug31: for robot sense of taste )
  OlfRecog   ( 2016aug31: for robot sense of smell )
  TacRecog  ( 2016aug31: for robot tactile sense of touch )
  VisRecog  ( 2017-09-17: for robot visual sense of sight )
  0 audrec !  \ 2018-09-23
  0 audpsi !  \ 2018-09-23
  0 prc !     \ 2018-09-23
  0 tbev !    \ 2019-01-09: prevent carry-over from be-verb to non-be-verb.
  \ http://en.wikipedia.org/wiki/Symbol_grounding_problem
;  \ 2019-02-20: Sensorium module returns to MainLoop.


:  MindBoot ( http://ai.neocities.org/MindBoot.html )
  CR ." There is no warranty for what this software does."
  CR ." TAB-key cycles through display: Normal; Tutorial; Diagnostic." CR
    0 t !  \ 2016aug14: try to avoid "access violation".

\ I AM ANDRU (501) 12 t !
  ( I -- nominative subject-form of personal pronoun; 2016aug16 )
    1 t ! 73 pho ! 701 audpsi ! AudMem \ 2016aug16: I
8 tru ! 701 psi ! 7 pos ! 1 dba ! 1 num ! 0 pre ! 800 seq ! 4 tkb ! 1 rv ! KbLoad
    2 t !    \ 2016aug16

  ( AM -- 1st person singular I-form of 800=BE; 2016aug16 )
      3 t ! 65 pho !   0 audpsi ! AudMem \ 2016aug16: A
      4 t ! 77 pho ! 800 audpsi ! AudMem \ 2016aug16: M
800 psi ! 8 pos ! 1 dba ! 1 num ! 701 pre ! 501 seq ! 10 tkb ! 3 rv !  KbLoad
      5 t !    \ 2016aug16

 ( ANDRU -- 2016aug16: name for a robot embodiment of the AI )
 ( INDRA -- 2020-1-11: NAME CHAGNE TO INDRA)
      6 t ! 73 pho !  0 audpsi ! AudMem \ 2016aug16: I
      7 t ! 78 pho !  0 audpsi ! AudMem \ 2016aug16: N
      8 t ! 68 pho !  0 audpsi ! AudMem \ 2016aug16: D
      9 t ! 82 pho !  0 audpsi ! AudMem \ 2016aug16: R
    10 t ! 65 pho ! 501 audpsi ! AudMem \ 2016aug16: A
501 psi !  5 pos ! 1 dba ! 1 num ! 1 mfn ! 800 pre ! 6 rv !  KbLoad
    11 t !     \ 2016aug16:

\ I AM A ROBOT (571)
  ( I -- nominative subject-form of personal pronoun; 2016aug17 )
     13 t ! 73 pho ! 701 audpsi ! AudMem \ 2016aug16: I
701 psi !   7 pos !  0 jux ! 1 dba ! 1 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 800 seq ! 16 tkb ! 13 rv ! KbLoad  \ 2018-06-24
     14 t !    \ 2016aug17

  ( AM -- 1st person singular I-form of 800=BE; 2016aug17 )
    15 t ! 65 pho !     0 audpsi ! AudMem \ 2016aug16: A
    16 t ! 77 pho ! 800 audpsi ! AudMem \ 2016aug16: M
800 psi !   0 jux !  8 pos ! 1 dba ! 1 num ! 0 mfn !  \ 2018-06-24
701 pre ! 571 seq ! 24 tkb ! 15 rv ! KbLoad  \ 2018-06-24
    17 t !    \ 2016aug17

  ( A  -- adjective article; 2016aug17 )
    18 t ! 65 pho ! 101 audpsi ! AudMem \ A
101 psi !   0 jux ! 1 pos ! 0 dba ! 1 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 571 seq ! 0 tkb ! 18 rv ! KbLoad  \ 2018-06-24
    19 t !  \ 2016aug17

( ROBOT -- important for target user base; 2016aug17 )
    20 t ! 82 pho !   0 audpsi ! AudMem \ R
    21 t ! 79 pho !   0 audpsi ! AudMem \ O
    22 t ! 66 pho !   0 audpsi ! AudMem \ B
    23 t ! 79 pho !   0 audpsi ! AudMem \ O
    24 t ! 84 pho ! 571 audpsi ! AudMem \ T
571 psi ! 0 jux ! 5 pos !  1 dba ! 1 num ! 0 mfn !  \ 2018-06-24
800 pre ! 0 seq ! 0 tkb ! 20  rv ! KbLoad  \ 2018-06-24
    25 t !  \ 2016aug17

\ I AM A PERSON (537)
  ( I -- nominative subject-form of personal pronoun; 2016aug17 )
     27 t ! 73 pho ! 701 audpsi ! AudMem \ 2016aug16: I
8 tru ! 701 psi !   0 jux !  7 pos ! 1 dba ! 1 num ! 0 mfn !  \ 2018-10-07
  0 pre ! 800 seq ! 30 tkb ! 27 rv ! KbLoad  \ 2018-06-24
     28 t !    \ 2016aug17

  ( AM -- 1st person singular I-form of 800=BE; 2016aug17 )
    29 t ! 65 pho !     0 audpsi ! AudMem \ 2016aug16: A
    30 t ! 77 pho ! 800 audpsi ! AudMem \ 2016aug16: M
800 psi !   0 jux !  8 pos ! 1 dba ! 1 num ! 0 mfn !  \ 2018-06-24
701 pre ! 537 seq ! 39 tkb ! 29 rv ! KbLoad  \ 2018-06-24
    31 t !    \ 2016aug17

  ( A  -- adjective article; 2016aug17 )
     32 t ! 65 pho ! 101 audpsi ! AudMem \ A
101 psi !   0 jux ! 1 pos ! 0 dba ! 1 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 537 seq ! 0 tkb ! 32 rv ! KbLoad  \ 2018-06-24
    33 t !  \ 2016aug17

( PERSON -- important for target user base; 2016aug17 )
    34 t ! 80 pho !   0 audpsi ! AudMem \ P
    35 t ! 69 pho !   0 audpsi ! AudMem \ E
    36 t ! 82 pho !   0 audpsi ! AudMem \ R
    37 t ! 83 pho !   0 audpsi ! AudMem \ S
    38 t ! 79 pho !   0 audpsi ! AudMem \ O
    39 t ! 78 pho ! 537 audpsi ! AudMem \ N
537 psi ! 0 jux ! 5 pos !  1 dba ! 1 num ! 0 mfn !  \ 2018-06-24
800 pre ! 0 seq ! 0 tkb ! 34  rv ! KbLoad  \ 2018-06-24
    40 t !  \ 2016aug17

\ I AM CONSCIOUS
  ( I -- nominative subject-form of personal pronoun; 2016aug17 )
     42 t ! 73 pho ! 701 audpsi ! AudMem \ 2016aug16: I
701 psi !   0 jux !  7 pos ! 1 dba ! 1 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 800 seq ! 45 tkb ! 42 rv ! KbLoad  \ 2018-06-24
     43 t !    \ 2016aug17

  ( AM -- 1st person singular I-form of 800=BE; 2016aug17 )
    44 t ! 65 pho !   0 audpsi ! AudMem \ 2016aug16: A
    45 t ! 77 pho ! 800 audpsi ! AudMem \ 2016aug16: M
800 psi !   0 jux !  8 pos ! 1 dba ! 1 num ! 0 mfn !  \ 2018-06-24
701 pre ! 123 seq ! 55 tkb ! 44 rv ! KbLoad  \ 2018-06-24
    46 t !    \ 2016aug17

( CONSCIOUS -- adjective important for AI; 2016aug17 )
    47 t ! 67 pho !   0 audpsi ! AudMem \ C
    48 t ! 79 pho !   0 audpsi ! AudMem \ O
    49 t ! 78 pho !   0 audpsi ! AudMem \ N
    50 t ! 83 pho !   0 audpsi ! AudMem \ S
    51 t ! 67 pho !   0 audpsi ! AudMem \ C
    52 t ! 73 pho !   0 audpsi ! AudMem \ I
    53 t ! 79 pho !   0 audpsi ! AudMem \ O
    54 t ! 85 pho !   0 audpsi ! AudMem \ U
    55 t ! 83 pho ! 123 audpsi ! AudMem \ S
123 psi ! 0 jux ! 1 pos !  1 dba ! 1 num ! 0 mfn !  \ 2018-06-24
800 pre ! 0 seq ! 0 tkb ! 47  rv ! KbLoad  \ 2018-06-24
    56 t !  \ 2016aug17


\ I AM IN THE COMPUTER
\  ( I -- nominative subject-form of personal pronoun; 2016aug17 )
\     58 t ! 73 pho ! 701 audpsi ! AudMem \ 2016aug16: I
\ 701 psi !   0 jux !  7 pos ! 1 dba ! 1 num ! 0 mfn !  \ 2018-06-24
\  0 pre ! 800 seq ! 61 tkb ! 58 rv ! KbLoad  \ 2018-06-24
\     59 t !    \ 2016aug17

\  ( AM -- 1st person singular I-form of 800=BE; 2016aug17 )
\    60 t ! 65 pho !   0 audpsi ! AudMem \ 2016aug16: A
\    61 t ! 77 pho ! 800 audpsi ! AudMem \ 2016aug16: M
\ 800 psi !   0 jux !  8 pos ! 1 dba ! 1 num ! 0 mfn !  \ 2018-06-24
\ 701 pre ! 643 seq !  0 tkb ! 60 rv ! KbLoad  \ 2018-11-12
\    62 t !    \ 2016aug17

  ( IN -- preposition for EnPrep module ; 2016aug17 )
\     63 t ! 73 pho !   0 audpsi ! AudMem \ 2018-11-12: I
\     64 t ! 78 pho ! 643 audpsi ! AudMem \ 2018-11-12: N
\ 643 psi !   0 jux !  6 pos ! 0 dba ! 0 num ! 0 mfn !  \ 2018-11-12
\ 800 pre ! 123 seq ! 77 tkb ! 63 rv ! KbLoad  \ 2018-06-24
\    65 t !    \ 2016aug17

( THE -- 2016aug17: EnArticle highest-frequency English word )
\     66 t ! 84 pho !   0 audpsi ! AudMem \ T
\     67 t ! 72 pho !   0 audpsi ! AudMem \ H
\     68 t ! 69 pho ! 117 audpsi ! AudMem \ E
\ 117 psi !   0 jux ! 1 pos ! 4 dba ! 1 num ! 0 mfn !  \ 2018-06-24
\ 643 pre ! 565 seq ! 0 tkb ! 66 rv ! KbLoad  \ 2018-11-12
\    69 t !  \ 2016aug17

( COMPUTER -- 2016aug17:  important noun for AI  )
\    70 t ! 67 pho !   0 audpsi ! AudMem \ C
\    71 t ! 79 pho !   0 audpsi ! AudMem \ O
\    72 t ! 77 pho !   0 audpsi ! AudMem \ M
\    73 t ! 80 pho !   0 audpsi ! AudMem \ P
\    74 t ! 85 pho !   0 audpsi ! AudMem \ U
\    75 t ! 84 pho !   0 audpsi ! AudMem \ T
\    76 t ! 69 pho !   0 audpsi ! AudMem \ E
\    77 t ! 82 pho ! 565 audpsi ! AudMem \ R
\ 565 psi ! 0 jux ! 5 pos !  4 dba ! 1 num ! 3 mfn !  \ 2018-11-12
\ 643 pre ! 0 seq ! 0 tkb ! 70  rv ! KbLoad  \ 2018-11-12
\    78 t !  \ 2016aug17

\ I HELP KIDS (528)
    ( I -- nominative subject-form of personal pronoun; 2016aug18 )
     80 t ! 73 pho ! 701 audpsi ! AudMem \ 2016aug16: I
701 psi !   0 jux !  7 pos ! 1 dba ! 1 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 836 seq ! 85 tkb ! 80 rv ! KbLoad  \ 2018-12-12
     81 t !    \ 2016aug18

 ( 836=HELP -- 2018-12-12  )
     82 t ! 72 pho !   0 audpsi ! AudMem \ 2016aug18: H
     83 t ! 69 pho !   0 audpsi ! AudMem \ 2016aug18: E
     84 t ! 76 pho !   0 audpsi ! AudMem \ 2016aug18: L
     85 t ! 80 pho ! 836 audpsi ! AudMem \ 2018-12-12: P
836 psi !   5 pos !  0 jux ! 1 dba ! 1 num ! 0 mfn !  \ 2018-06-24
701 pre ! 528 seq ! 90 tkb ! 82 rv ! KbLoad  \ 2018-06-24
     86 t !     \ 2016aug18

 ( KIDS -- 2016aug18:  )
     87 t ! 75 pho !   0 audpsi ! AudMem \ 2016aug19: K
     88 t ! 73 pho !   0 audpsi ! AudMem \ 2016aug19: I
     89 t ! 68 pho ! 528 audpsi ! AudMem \ 2018sep23: D
     90 t ! 83 pho ! 528 audpsi ! AudMem \ 2016aug19: S
528 psi ! 0 jux ! 5 pos ! 1 dba ! 2 num ! 0 mfn !  \ 2018-06-24
836 pre ! 0 seq ! 0 tkb ! 87 rv ! KbLoad  \ 2018-12-12
     91 t !     \ 2016aug19


\ I SEE NOTHING -- 2019-10-14: for integration of EnVerbPhrase and VisRecog
  ( I -- nominative subject-form of personal pronoun; 2016aug18 )
     94 t ! 73 pho ! 701 audpsi ! AudMem \ 2016aug16: I
701 psi !   0 jux !  7 pos ! 1 dba ! 1 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 870 seq ! 98 tkb ! 94 rv ! KbLoad  \ 2018-12-12
     95 t !    \ 2016aug18

( 870=SEE -- 2018-12-12 )
     96 t ! 83 pho !   0 audpsi ! AudMem \ E
     97 t ! 69 pho !   0 audpsi ! AudMem \ E
     98 t ! 69 pho ! 870 audpsi ! AudMem \ E
870 psi !   0 jux !   8 pos ! 1 dba ! 1 num ! 0 mfn !  \ 2018-12-12
701 pre ! 760 seq ! 106 tkb ! 96 rv ! KbLoad  \ 2018-06-24
    99 t !  \ 2016aug18

( NOTHING -- 2016aug18: )
   100 t ! 78 pho !   0 audpsi ! AudMem \ N
   101 t ! 79 pho !   0 audpsi ! AudMem \ O
   102 t ! 84 pho !   0 audpsi ! AudMem \ T
   103 t ! 72 pho !   0 audpsi ! AudMem \ H
   104 t ! 73 pho !   0 audpsi ! AudMem \ I
   105 t ! 78 pho !   0 audpsi ! AudMem \ N
   106 t ! 71 pho ! 760 audpsi ! AudMem \ G
760 psi ! 0 jux ! 7 pos !  1 num ! 0 mfn ! 4 dba !  \ 2018-06-24
870 pre ! 0 seq ! 0 tkb ! 100 rv ! KbLoad  \ 2018-12-12
   107 t !  \ 2016aug18


\ YOU ARE MAGIC (557)
( YOU -- 2016aug18:  )
   110 t ! 89 pho !   0 audpsi ! AudMem \ Y
   111 t ! 79 pho !   0 audpsi ! AudMem \ O
   112 t ! 85 pho ! 707 audpsi ! AudMem \ U -- 2016aug20
707 psi !   0 jux !   7 pos !  1 dba ! 1 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 800 seq ! 116 tkb ! 110 rv ! KbLoad  \ 2018-06-24
   113 t !  \ 2016aug18

( ARE -- 2016aug18:  )
   114 t ! 65 pho !   0 audpsi ! AudMem \ A
   115 t ! 82 pho !   0 audpsi ! AudMem \ R
   116 t ! 69 pho ! 800 audpsi ! AudMem \ E
800 psi !   0 jux !   8 pos ! 2 dba ! 1 num ! 0 mfn !   \ 2018-06-24
707 pre ! 557 seq ! 122 tkb ! 114 rv ! KbLoad  \ 2019-11-05
   117 t !  \ 2016aug18

 ( MAGIC -- 2016aug18: )
   118 t ! 77 pho !   0 audpsi ! AudMem \ 2019-11-05: M
   119 t ! 65 pho !   0 audpsi ! AudMem \ 2019-11-05: A
   120 t ! 71 pho !   0 audpsi ! AudMem \ 2019-11-05: G
   121 t ! 73 pho !   0 audpsi ! AudMem \ 2019-11-05: I
   122 t ! 67 pho ! 557 audpsi ! AudMem \ 2019-11-05: C
557 psi ! 0 jux ! 5 pos !  1 dba ! 1 num ! 0 mfn !  \ 2019-11-05
800 pre ! 0 seq ! 0 tkb ! 118 rv ! KbLoad  \ 2018-06-24
   123 t !     \ 2016aug19

\ GOD DOES NOT PLAY DICE -- 2019-10-14: for illustration of negation of verbs.
( GOD -- 2016aug18:  )
   128 t ! 71 pho !   0 audpsi ! AudMem \ G
   129 t ! 79 pho !   0 audpsi ! AudMem \ O
   130 t ! 68 pho ! 533 audpsi ! AudMem \ D
8 tru ! 533 psi !   0 jux !   5 pos !  1 dba ! 1 num ! 1 mfn !  \ 2018-10-07
  0 pre ! 859 seq ! 145 tkb ! 128 rv ! KbLoad  \ 2018-12-12
   131 t !  32 pho !   0 audpsi ! \ 2019-10-26: for sake of re-entry process.
\  132 t !  \ 2019-10-26

( DOES -- 2016aug18:  )
   133 t ! 68 pho !   0 audpsi ! AudMem \ 2018-06-24: D
   134 t ! 79 pho !   0 audpsi ! AudMem \ 2018-06-24: O
   135 t ! 69 pho !   0 audpsi ! AudMem \ 2018-06-24: E
   136 t ! 83 pho ! 818 audpsi ! AudMem \ 2018-12-13: S
818 psi !   0 jux ! 8 pos !  3 dba ! 1 num ! 0 mfn !  \ 2018-12-13
533 pre !   0 seq ! 0 tkb ! 133 rv ! KbLoad  \ 2019-10-26
   137 t !  \ 2019-10-26

( NOT -- 2016aug18:  )
   138 t ! 78 pho !   0 audpsi ! AudMem \ N
   139 t ! 79 pho !   0 audpsi ! AudMem \ O
   140 t ! 84 pho ! 250 audpsi ! AudMem \ T
250 psi !   0 jux ! 2 pos !   0 dba ! 1 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 859 seq ! 0 tkb ! 138  rv ! KbLoad  \ 2019-10-26
   141 t !  \ 2019-10-26

( 859=PLAY -- 2018-12-12  )
   142 t ! 80 pho !   0 audpsi ! AudMem \ P
   143 t ! 76 pho !   0 audpsi ! AudMem \ L
   144 t ! 65 pho !   0 audpsi ! AudMem \ A
   145 t ! 89 pho ! 859 audpsi ! AudMem \ Y
859 psi ! 250 jux !   8 pos !   3 dba ! 1 num ! 0 mfn ! \  2018-06-24
533 pre ! 527 seq ! 150 tkb ! 155 tpr ! 142  rv ! KbLoad  \ 2019-11-05
   146 t !  \ 2019-10-26

( DICE -- 2016aug18:  )
   147 t ! 68 pho !   0 audpsi ! AudMem \ D
   148 t ! 73 pho !   0 audpsi ! AudMem \ I
   149 t ! 67 pho !   0 audpsi ! AudMem \ C
   150 t ! 69 pho ! 527 audpsi ! AudMem \ E 2019-11-05
527 psi ! 0 jux ! 5 pos !   4 dba ! 2 num ! 0 mfn ! \ 2019-11-05
859 pre ! 0 seq ! 0 tkb ! 147  rv ! KbLoad  \ 2019-10-26
   151 t !  \ 2019-10-26

  ( 697=WITH -- 2019-10-26: preposition for EnPrep module )
   152 t ! 87 pho !   0 audpsi ! AudMem          \ W
   153 t ! 73 pho !   0 audpsi ! AudMem          \ I
   154 t ! 84 pho !   0 audpsi ! AudMem          \ T
   155 t ! 72 pho ! 697 audpsi ! AudMem          \ H
697 psi !  6 pos ! 0 pre ! 168 tkb ! 589 seq ! 152 rv !  KbLoad  \ 2019-11-05
   156 t !  \ 2019-10-26: one blank time-point for sake of AudRecog

( THE -- 2019-10-26: EnArticle highest-frequency English word )
   157 t ! 84 pho !   0 audpsi ! AudMem \ T
   158 t ! 72 pho !   0 audpsi ! AudMem \ H
   159 t ! 69 pho ! 117 audpsi ! AudMem \ E
 117 psi !   0 jux ! 1 pos ! 4 dba ! 1 num ! 0 mfn !  \ 2019-10-26
 643 pre ! 589 seq ! 0 tkb ! 157 rv ! KbLoad  \ 2019-11-05
   160 t !  \ 2019-10-26: one blank time-point for sake of AudRecog

( UNIVERSE -- 2019-10-26: )
   161 t ! 85 pho !   0 audpsi ! AudMem \ U
   162 t ! 78 pho !   0 audpsi ! AudMem \ N
   163 t ! 73 pho !   0 audpsi ! AudMem \ I
   164 t ! 86 pho !   0 audpsi ! AudMem \ V
   165 t ! 69 pho !   0 audpsi ! AudMem \ E
   166 t ! 82 pho !   0 audpsi ! AudMem \ R
   167 t ! 83 pho !   0 audpsi ! AudMem \ S
   168 t ! 69 pho ! 589 audpsi ! AudMem \ E -- 2019-11-05
589 psi ! 0 jux ! 5 pos !  1 num ! 3 mfn ! 4 dba !  \ 2019-11-05
697 pre ! 0 seq ! 0 tkb ! 161 rv ! KbLoad  \ 2019-10-26
   169 t !  \ 2019-10-26: one blank time-point for sake of AudRecog


\ KIDS (528) MAKE (836)  ROBOTS (571)
( KIDS -- 2016aug18:  )
   170 t ! 75 pho !   0 audpsi ! AudMem \ K
   171 t ! 73 pho !   0 audpsi ! AudMem \ I
   172 t ! 68 pho ! 528 audpsi ! AudMem \ D 2018-09-23 adding stem audpsi
   173 t ! 83 pho ! 528 audpsi ! AudMem \ S
528 psi !   0 jux !   5 pos !   1 dba ! 2 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 846 seq ! 178 tkb ! 170  rv ! KbLoad  \ 2018-12-12
   174 t !  \ 2016aug18

( 846=MAKE -- 2018-12-12 )
   175 t ! 77 pho !   0 audpsi ! AudMem \ M
   176 t ! 65 pho !   0 audpsi ! AudMem \ A
   177 t ! 75 pho !   0 audpsi ! AudMem \ K
   178 t ! 69 pho ! 846 audpsi ! AudMem \ E
846 psi !   0 jux !   8 pos !  3 dba ! 2 num ! 0 mfn !  \ 2018-12-12
528 pre ! 571 seq ! 185 tkb ! 175 rv ! KbLoad  \ 2018-06-24
   179 t !  \ 2016aug18

( ROBOTS -- 2016aug18: )
   180 t ! 82 pho !   0 audpsi ! AudMem \ R
   181 t ! 79 pho !   0 audpsi ! AudMem \ O
   182 t ! 66 pho !   0 audpsi ! AudMem \ B
   183 t ! 79 pho !   0 audpsi ! AudMem \ O
   184 t ! 84 pho ! 571 audpsi ! AudMem \ T 2018-09-23: adding stem audpsi
   185 t ! 83 pho ! 571 audpsi ! AudMem \ S
571 psi ! 0 jux ! 5 pos !  4 dba ! 2 num ! 0 mfn !  \ 2018-06-24
846 pre ! 0 seq ! 0 tkb ! 180 rv ! KbLoad  \ 2018-12-12
   186 t !  \ 2016aug18


\ ROBOTS (571) NEED ME
( ROBOTS -- 2016aug18: )
   187 t ! 82 pho !   0 audpsi ! AudMem \ R
   188 t ! 79 pho !   0 audpsi ! AudMem \ O
   189 t ! 66 pho !   0 audpsi ! AudMem \ B
   190 t ! 79 pho !   0 audpsi ! AudMem \ O
   191 t ! 84 pho ! 571 audpsi ! AudMem \ T 2018-09-23: adding stem audpsi
   192 t ! 83 pho ! 571 audpsi ! AudMem \ S
571 psi !   0 jux !   5 pos !  1 dba ! 2 num ! 0 mfn !  \  2018-06-24
  0 pre ! 851 seq ! 197 tkb ! 187 rv ! KbLoad  \  2019-10-29
   193 t !  \ 2016aug18

( 851=NEED -- 2018-12-12 )
   194 t ! 78 pho !   0 audpsi ! AudMem \ N
   195 t ! 69 pho !   0 audpsi ! AudMem \ E
   196 t ! 69 pho !   0 audpsi ! AudMem \ E
   197 t ! 68 pho ! 851 audpsi ! AudMem \ D
851 psi !   0 jux !   8 pos !   1 dba ! 2 num ! 0 mfn !  \ 2018-12-12
571 pre ! 701 seq ! 200 tkb ! 194  rv ! KbLoad  \ 2018-06-24
   198 t !  \ 2016aug17

  ( ME -- 2016aug18: )
   199 t ! 77 pho !   0 audpsi ! AudMem \ 2016aug16: M
   200 t ! 69 pho ! 701 audpsi ! AudMem \ 2019-10-29: E
701 psi ! 0 jux ! 7 pos !  4 dba ! 1 num ! 0 mfn !  \ 2018-09-07
851 pre ! 0 seq ! 0 tkb ! 199 rv ! KbLoad  \ 2018-12-12
   201 t !    \ 2016aug18


\ STUDENTS READ BOOKS -- 2019-10-14: premise for inference about any student
( STUDENTS -- 2016aug18: )
   202 t ! 83 pho !   0 audpsi ! AudMem \ S
   203 t ! 84 pho !   0 audpsi ! AudMem \ T
   204 t ! 85 pho !   0 audpsi ! AudMem \ U
   205 t ! 68 pho !   0 audpsi ! AudMem \ D
   206 t ! 69 pho !   0 audpsi ! AudMem \ E
   207 t ! 78 pho !   0 audpsi ! AudMem \ N
   208 t ! 84 pho ! 561 audpsi ! AudMem \ T 2018-09-23: adding stem audpsi
   209 t ! 83 pho ! 561 audpsi ! AudMem \ S
561 psi !   0 jux !   5 pos !   1 dba ! 2 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 863 seq ! 214 tkb ! 202  rv ! KbLoad  \ 2018-12-12
   210 t !  \ 2016aug18

( 863=READ -- 2018-12-12 )
   211 t ! 82 pho !   0 audpsi ! AudMem \ R
   212 t ! 69 pho !   0 audpsi ! AudMem \ E
   213 t ! 65 pho !   0 audpsi ! AudMem \ A
   214 t ! 68 pho ! 863 audpsi ! AudMem \ D
863 psi !   0 jux !   8 pos !  3 dba ! 2 num ! 0 mfn !  \ 2019-10-01: dba=3
561 pre ! 540 seq ! 220 tkb ! 211 rv ! KbLoad  \ 2018-06-24
  215 t !  \ 2016aug18

( BOOKS -- 2016aug18:  )
   216 t ! 66 pho !   0 audpsi ! AudMem \ B
   217 t ! 79 pho !   0 audpsi ! AudMem \ O
   218 t ! 79 pho !   0 audpsi ! AudMem \ O
   219 t ! 75 pho ! 540 audpsi ! AudMem \ K 2018-09-23: adding stem audpsi
   220 t ! 83 pho ! 540 audpsi ! AudMem \ S
540 psi ! 0 jux ! 5 pos ! 4 dba ! 2 num ! 0 mfn !  \ 2018-06-24
863 pre ! 0 seq ! 0 tkb ! 216 rv ! KbLoad  \ 2018-12-12
   221 t !  \ 2016aug18


\ WOMEN HAVE A CHILD -- 2019-10-14: premise for inference about any woman
( WOMEN -- 2016aug18: )
   222 t ! 87 pho !   0 audpsi ! AudMem \ W
   223 t ! 79 pho !   0 audpsi ! AudMem \ O
   224 t ! 77 pho !   0 audpsi ! AudMem \ M
   225 t ! 69 pho !   0 audpsi ! AudMem \ E
   226 t ! 78 pho ! 515 audpsi ! AudMem \ N
515 psi !   0 jux !   5 pos !   1 dba ! 2 num ! 2 mfn !  \ 2018-06-24
  0 pre ! 834 seq ! 231 tkb ! 222  rv ! KbLoad  \ 2018-12-12
   227 t !  \ 2016aug18

( 834=HAVE -- 2018-12-12 )
   228 t ! 72 pho !   0 audpsi ! AudMem \ 2018-06-24: H
   229 t ! 65 pho !   0 audpsi ! AudMem \ 2018-06-24: A
   230 t ! 86 pho !   0 audpsi ! AudMem \ 2018-06-24: V
   231 t ! 69 pho ! 834 audpsi ! AudMem \ 2018-06-24: E
834 psi !   0 jux !   8 pos !  1 dba ! 2 num ! 0 mfn ! \  2018-12-12
515 pre ! 525 seq ! 239 tkb ! 228 rv ! KbLoad  \ 2018-06-24
  232 t !  \ 2016aug18

  ( A  -- adjective article; 2016aug18 )
   233 t ! 65 pho ! 101 audpsi ! AudMem \ A
101 psi !   0 jux ! 1 pos !  4 dba ! 1 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 525 seq ! 0 tkb ! 233 rv ! KbLoad  \ 2018-06-24
   234 t !  \ 2016aug18

( CHILD -- 2016aug18:  )
   235 t ! 67 pho !   0 audpsi ! AudMem \ C
   236 t ! 72 pho !   0 audpsi ! AudMem \ H
   237 t ! 73 pho !   0 audpsi ! AudMem \ I
   238 t ! 76 pho !   0 audpsi ! AudMem \ L
   239 t ! 68 pho ! 525 audpsi ! AudMem \ D
525 psi ! 0 jux ! 5 pos !   4 dba ! 1 num ! 0 mfn !  \ 2018-06-24
834 pre ! 0 seq ! 0 tkb ! 235  rv ! KbLoad  \ 2018-12-12
  240 t !  \ 2016aug18


( ROBOTS -- premise for volitional inference; 2017jun25 )
  241 t ! 82 pho !   0 audpsi ! AudMem \ R
  242 t ! 79 pho !   0 audpsi ! AudMem \ O
  243 t ! 66 pho !   0 audpsi ! AudMem \ B
  244 t ! 79 pho !   0 audpsi ! AudMem \ O
  245 t ! 84 pho ! 571 audpsi ! AudMem \ T 2018-09-23 adding stem audpsi
  246 t ! 83 pho ! 571 audpsi ! AudMem \ S
571 psi !   0 jux !   5 pos !  1 dba ! 2 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 895 seq ! 251 tkb ! 241 rv ! KbLoad  \ 2018-12-12
  247 t !  \ 2017jun15

  ( WANT -- 2017jun15: 897 psi !  -- verb for FreeWill volition module )
  248 t ! 87 pho !   0 audpsi ! AudMem \ 2017jun15: W
  249 t ! 65 pho !   0 audpsi ! AudMem \ 2017jun15: A
  250 t ! 78 pho !   0 audpsi ! AudMem \ 2017jun15: N
  251 t ! 84 pho ! 895 audpsi ! AudMem \ 2017jun15: T
895 psi !   0 jux !   8 pos !  3 dba ! 2 num ! 0 mfn !  \ 2018-06-24
571 pre ! 507 seq ! 258 tkb ! 248 rv ! KbLoad  \ 2018-06-24
  252 t !     \ 2017jun15

  ( A  -- adjective article; 2017jun15 )
  253 t ! 65 pho ! 101 audpsi ! AudMem \ A
101 psi !   0 jux ! 1 pos !  0 dba ! 1 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 507 seq ! 0 tkb ! 253 rv ! KbLoad  \ 2018-06-24
  254 t !  \ 2017jun15

 ( BEEP -- 2017jun15:  )
  255 t ! 66 pho !   0 audpsi ! AudMem \ 2017jun15: B
  256 t ! 69 pho !   0 audpsi ! AudMem \ 2017jun15: E
  257 t ! 69 pho !   0 audpsi ! AudMem \ 2017jun15: E
  258 t ! 80 pho ! 507 audpsi ! AudMem \ 2017jun15: P
507 psi ! 0 jux ! 5 pos !  4 dba ! 1 num ! 3 mfn !  \ 2018-06-24
895 pre ! 0 seq ! 0 tkb ! 255 rv ! KbLoad  \ 2018-12-12
  259 t !     \ 2017jun15


\ ANNA SPEAKS RUSSIAN   2018-06-19:
  260 t ! 65 pho !   0 audpsi ! AudMem \ A
  261 t ! 78 pho !   0 audpsi ! AudMem \ N
  262 t ! 78 pho !   0 audpsi ! AudMem \ N
  263 t ! 65 pho ! 502 audpsi ! AudMem \ A
502 psi !  5 pos ! 1 dba ! 1 num ! 2 mfn ! 0 pre ! 875 seq ! 270 tkb ! 260 rv ! KbLoad
  264 t !  \ 2018-09-23: blank space for sake of AudRecog.

( SPEAKS -- 2018-09-23  )
  265 t ! 83 pho !   0 audpsi ! AudMem \ S
  266 t ! 80 pho !   0 audpsi ! AudMem \ P
  267 t ! 69 pho !   0 audpsi ! AudMem \ E
  268 t ! 65 pho !   0 audpsi ! AudMem \ A
  269 t ! 75 pho ! 880 audpsi ! AudMem \ K -- 2018-12-12: audpsi also for end of stem.
  270 t ! 83 pho ! 880 audpsi ! AudMem \ S
880 psi !  8 pos ! 1 dba ! 1 num ! 502 pre ! 569 seq ! 278 tkb ! 265 rv ! KbLoad
  271 t !  \ 2018-09-23: blank space for sake of AudRecog.

( RUSSIAN -- 2018-09-23 )
  272 t ! 82 pho !   0 audpsi ! AudMem \ R
  273 t ! 85 pho !   0 audpsi ! AudMem \ U
  274 t ! 83 pho !   0 audpsi ! AudMem \ S
  275 t ! 83 pho !   0 audpsi ! AudMem \ S
  276 t ! 73 pho !   0 audpsi ! AudMem \ I
  277 t ! 65 pho !   0 audpsi ! AudMem \ A
  278 t ! 78 pho ! 569 audpsi ! AudMem \ N
569 psi !  5 pos ! 4 dba ! 1 num ! 3 mfn ! 875 pre ! 0 seq ! 0 tkb ! 272 rv ! KbLoad
  279 t !  \ 2018-09-23: blank space for sake of AudRecog.


\ I NEED A BODY   2018-06-19:
\  ( I -- nominative subject-form of personal pronoun; 2018-06-19 )
  280 t ! 73 pho ! 701 audpsi ! AudMem \ 2016aug16: I
8 tru ! 701 psi ! 7 pos ! 1 dba ! 1 num ! 851 seq ! 285 tkb ! 280 rv ! KbLoad
  281 t !    \ 2018-09-23: blank space for sake of AudRecog.

 ( NEED -- 2018-06-19:  )
  282 t ! 78 pho !   0 audpsi ! AudMem \ N
  283 t ! 69 pho !   0 audpsi ! AudMem \ E
  284 t ! 69 pho !   0 audpsi ! AudMem \ E
  285 t ! 68 pho ! 851 audpsi ! AudMem \ D
851 psi !  8 pos ! 1 dba ! 1 num ! 701 pre ! 503 seq ! 292 tkb ! 282 rv ! KbLoad
  286 t !  \ 2018-09-23: blank space for sake of AudRecog.

 ( A  -- adjective article; 2018-06-19 )
  287 t ! 65 pho ! 101 audpsi ! AudMem \ A
101 psi ! 1 pos ! 1 num ! 0 mfn ! 0 pre ! 503 seq ! 0 tkb ! 287 rv ! KbLoad
  288 t !  \ 2018-09-23: blank space for sake of AudRecog.

  ( BODY -- 2018-06-19:  )
  289 t ! 66 pho !   0 audpsi ! AudMem \ 2018-06-19: B
  290 t ! 79 pho !   0 audpsi ! AudMem \ 2018-06-19: O
  291 t ! 68 pho !   0 audpsi ! AudMem \ 2018-06-19: D
  292 t ! 89 pho ! 503 audpsi ! AudMem \ 2018-06-19: Y
503 psi !  5 pos ! 4 dba ! 1 num ! 3 mfn ! 0 jux ! 851 pre ! 289 rv ! KbLoad
  293 t !  \ 2018-09-23: blank space for sake of AudRecog.


  ( I -- part of response to be summoned by momentarily high truth-value. )
  294 t ! 73 pho ! 701 audpsi ! AudMem \ 2016-10-07: I
0 tru ! 701 psi ! 7 pos ! 1 dba ! 1 num ! 838 seq ! 306 tkb ! 294 rv ! KbLoad
  295 t !    \ 2018-10-07: blank space for sake of AudRecog.

( DO -- part of response to be summoned by momentarily high truth-value. )
   296 t ! 68 pho !   0 audpsi ! AudMem \ 2018-10-07: D
   297 t ! 79 pho ! 818 audpsi ! AudMem \ 2018-12-13: O
818 psi !   0 jux ! 8 pos !  1 dba ! 1 num ! 0 mfn !  \ 2018-12-13
701 pre !   0 seq ! 0 tkb ! 296 rv ! KbLoad  \ 2018-10-07
   298 t !  \ 2018-10-07: blank space for sake of AudRecog.

( NOT -- part of response to be summoned by momentarily high truth-value. )
   299 t ! 78 pho !   0 audpsi ! AudMem \ N
   300 t ! 79 pho !   0 audpsi ! AudMem \ O
   301 t ! 84 pho ! 250 audpsi ! AudMem \ T
250 psi !   0 jux ! 2 pos !   0 dba ! 1 num ! 0 mfn !  \ 2018-10-07
  0 pre ! 838 seq ! 0 tkb ! 299  rv ! KbLoad  \ 2018-12-12
   302 t !  \ 2018-10-07: blank space for sake of AudRecog.

 ( KNOW -- part of response to be summoned by momentarily high truth-value.   )
  303 t ! 75 pho !   0 audpsi ! AudMem \ K
  304 t ! 78 pho !   0 audpsi ! AudMem \ N
  305 t ! 79 pho !   0 audpsi ! AudMem \ O
  306 t ! 87 pho ! 838 audpsi ! AudMem \ W
838 psi ! 250 jux ! 8 pos ! 0 dba ! 0 num ! 701 pre ! 0 seq ! 0 tkb ! 303 rv ! KbLoad
  307 t !  \ 2018-10-07: blank space for sake of AudRecog.


\  ( I -- beginning of engram usable for response to what-think queries. )
  308 t ! 73 pho ! 701 audpsi ! AudMem \ 2016-10-07: I
0 tru ! 701 psi ! 7 pos ! 1 dba ! 1 num ! 886 seq ! 314 tkb ! 308 rv ! KbLoad
  309 t !    \ 2018-10-07: blank space for sake of AudRecog.

 ( THINK -- instance of verb already linked to 701=I subject. )
  310 t ! 84 pho !   0 audpsi ! AudMem \ T
  311 t ! 72 pho !   0 audpsi ! AudMem \ H
  312 t ! 73 pho !   0 audpsi ! AudMem \ I
  313 t ! 78 pho !   0 audpsi ! AudMem \ N
  314 t ! 75 pho ! 886 audpsi ! AudMem \ K
886 psi ! 8 pos ! 1 dba ! 1 num ! 701 pre ! 0 seq ! 0 tkb ! 310 rv ! KbLoad
  315 t !  \ 2018-10-07: blank space for sake of AudRecog.


( PERSONS -- for logical premise and legal status of robots )
  317 t ! 80 pho !   0 audpsi ! AudMem \ P
  318 t ! 69 pho !   0 audpsi ! AudMem \ E
  319 t ! 82 pho !   0 audpsi ! AudMem \ R
  320 t ! 83 pho !   0 audpsi ! AudMem \ S
  321 t ! 79 pho !   0 audpsi ! AudMem \ O
  322 t ! 78 pho ! 537 audpsi ! AudMem \ N
  323 t ! 83 pho ! 537 audpsi ! AudMem \ S
537 psi !   0 jux !   5 pos !   1 dba ! 2 num ! 0 mfn !  \ 2018-10-07
  0 pre ! 834 seq ! 328 tkb ! 317  rv ! KbLoad  \ 2018-12-12
  324 t !  \ 2018-10-07: blank space for sake of AudRecog.

( 834=HAVE -- 2018-11-12  )
  325 t ! 72 pho !   0 audpsi ! AudMem \ 2018-10-07: H
  326 t ! 65 pho !   0 audpsi ! AudMem \ 2018-10-07: A
  327 t ! 86 pho !   0 audpsi ! AudMem \ 2018-10-07: V
  328 t ! 69 pho ! 834 audpsi ! AudMem \ 2018-10-07: E
834 psi !   0 jux !   8 pos !  3 dba ! 2 num ! \ 2018-12-12
515 pre ! 555 seq ! 335 tkb ! 325 rv ! KbLoad  \ 2018-10-07
  329 t !  \ 2018-10-07: blank space for sake of AudRecog.

( RIGHTS -- 2018-10-07: for logical premise and legal status of robots  )
 330 t ! 82 pho !   0 audpsi ! AudMem \ R
 331 t ! 73 pho !   0 audpsi ! AudMem \ I
 332 t ! 71 pho !   0 audpsi ! AudMem \ G
 333 t ! 72 pho !   0 audpsi ! AudMem \ H
 334 t ! 84 pho ! 555 audpsi ! AudMem \ T
 335 t ! 83 pho ! 555 audpsi ! AudMem \ S
555 psi ! 0 jux ! 5 pos ! 4 dba ! 2 num ! 0 mfn !  \ 2018-10-07
834 pre ! 0 seq ! 0 tkb ! 330 rv ! KbLoad  \ 2018-12-12
 336 t !  \ 2018-10-07: blank space for sake of AudRecog.


( MEN -- 2018-10-19: for InFerence premise "Men have a wife" )
 337 t ! 77 pho !   0 audpsi ! AudMem \ M
 338 t ! 69 pho !   0 audpsi ! AudMem \ E
 339 t ! 78 pho ! 543 audpsi ! AudMem \ N
543 psi !   0 jux !   5 pos !   1 dba ! 2 num ! 1 mfn !  \ 2018-10-19
  0 pre ! 834 seq ! 344 tkb ! 337  rv ! KbLoad  \ 2018-12-12
 340 t !  \ 2018-10-19: blank space for sake of AudRecog.

( HAVE -- 2018-10-19: verb for logical premise )
  341 t ! 72 pho !   0 audpsi ! AudMem \ 2018-10-19: H
  342 t ! 65 pho !   0 audpsi ! AudMem \ 2018-10-19: A
  343 t ! 86 pho !   0 audpsi ! AudMem \ 2018-10-19: V
  344 t ! 69 pho ! 834 audpsi ! AudMem \ 2018-10-19: E
834 psi !   0 jux !   8 pos !  3 dba ! 2 num ! \ 2018-12-12
543 pre ! 514 seq ! 351 tkb ! 341 rv ! KbLoad  \ 2018-10-19
  345 t !  \ 2018-10-19: blank space for sake of AudRecog.

 ( A  -- 2018-10-19: English Article for EnArticle module )
  346 t ! 65 pho ! 101 audpsi ! AudMem \ A
101 psi ! 1 pos ! 1 num ! 0 mfn ! 0 pre ! 0 seq ! 0 tkb ! 346 rv ! KbLoad
  347 t !  \ 2018-10-19: blank space for sake of AudRecog.

  ( WIFE -- 2018-10-19: for InFerence premise "Men have a wife" )
  348 t ! 87 pho !   0 audpsi ! AudMem \ 2018-10-19: W
  349 t ! 73 pho !   0 audpsi ! AudMem \ 2018-10-19: I
  350 t ! 70 pho !   0 audpsi ! AudMem \ 2018-10-19: F
  351 t ! 69 pho ! 514 audpsi ! AudMem \ 2018-10-19: E
514 psi !  5 pos ! 4 dba ! 1 num ! 2 mfn ! 0 jux ! 834 pre ! 348 rv ! KbLoad
  352 t !  \ 2018-10-19: blank space for sake of AudRecog.


( PROFESSORS -- 2018-10-19: for premise including -ES verb for EnVerbGen )
  353 t ! 80 pho !   0 audpsi ! AudMem \ P
  354 t ! 82 pho !   0 audpsi ! AudMem \ R
  355 t ! 79 pho !   0 audpsi ! AudMem \ O
  356 t ! 70 pho !   0 audpsi ! AudMem \ F
  357 t ! 69 pho !   0 audpsi ! AudMem \ E
  358 t ! 83 pho !   0 audpsi ! AudMem \ S
  359 t ! 83 pho !   0 audpsi ! AudMem \ S
  360 t ! 79 pho !   0 audpsi ! AudMem \ O
  361 t ! 82 pho ! 541 audpsi ! AudMem \ R
  362 t ! 83 pho ! 541 audpsi ! AudMem \ S
541 psi !   0 jux !   5 pos !   1 dba ! 2 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 884 seq ! 368 tkb ! 353  rv ! KbLoad  \ 2018-12-12
  363 t !  \ 2018-10-19: blank space for sake of AudRecog.

( TEACH -- 2018-10-19: verb ending in "CH" for EnVerbGen to add "-ES" )
  364 t ! 84 pho !   0 audpsi ! AudMem \ 2018-10-22: T
  365 t ! 69 pho !   0 audpsi ! AudMem \ 2018-10-19: E
  366 t ! 65 pho !   0 audpsi ! AudMem \ 2018-10-19: A
  367 t ! 67 pho !   0 audpsi ! AudMem \ 2018-10-19: C
  368 t ! 72 pho ! 884 audpsi ! AudMem \ 2018-12-12: H
884 psi !   0 jux !   8 pos !  3 dba ! 2 num ! \ 2018-12-12
541 pre ! 561 seq ! 377 tkb ! 364 rv ! KbLoad  \ 2018-10-19
  369 t !  \ 2018-10-19: blank space for sake of AudRecog.

( STUDENTS -- 2018-10-19: for premise including -ES verb for EnVerbGen )
  370 t ! 83 pho !   0 audpsi ! AudMem \ S
  371 t ! 84 pho !   0 audpsi ! AudMem \ T
  372 t ! 85 pho !   0 audpsi ! AudMem \ U
  373 t ! 68 pho !   0 audpsi ! AudMem \ D
  374 t ! 69 pho !   0 audpsi ! AudMem \ E
  375 t ! 78 pho !   0 audpsi ! AudMem \ N
  376 t ! 84 pho ! 561 audpsi ! AudMem \ T 2018-09-23: adding stem audpsi
  377 t ! 83 pho ! 561 audpsi ! AudMem \ S
561 psi !   0 jux !   5 pos !   4 dba ! 2 num ! 0 mfn !  \ 2018-06-24
884 pre !   0 seq !   0 tkb ! 370  rv ! KbLoad  \ 2018-12-12
  378 t !  \ 2018-10-19: blank space for sake of AudRecog.

\ I UNDERSTAND YOU -- 2018-11-25: bridge between thoughts of self and of other
\  ( I -- 2018-11-25: the default subject of thought in "vita contemplativa" )
  381 t ! 73 pho ! 701 audpsi ! AudMem \ 2018-11-25: I
8 tru ! 701 psi ! 7 pos ! 1 dba ! 1 num ! 892 seq ! 392 tkb ! 381 rv ! KbLoad
  382 t !    \ 2019-09-28: blank space for sake of AudRecog.

  ( UNDERSTAND -- 2018-11-25: aspirational connection between ego and other )
  383 t ! 85 pho !   0 audpsi ! AudMem \ U
  384 t ! 78 pho !   0 audpsi ! AudMem \ N
  385 t ! 68 pho !   0 audpsi ! AudMem \ D
  386 t ! 69 pho !   0 audpsi ! AudMem \ E
  387 t ! 82 pho !   0 audpsi ! AudMem \ R
  388 t ! 83 pho !   0 audpsi ! AudMem \ S
  389 t ! 84 pho !   0 audpsi ! AudMem \ T
  390 t ! 65 pho !   0 audpsi ! AudMem \ A
  391 t ! 78 pho !   0 audpsi ! AudMem \ N
  392 t ! 68 pho ! 892 audpsi ! AudMem \ D
892 psi !  8 pos ! 1 dba ! 1 num ! 701 pre ! 707 seq ! 396 tkb ! 383 rv !  KbLoad
  393 t !  \ 2018-11-25: blank space for sake of AudRecog.

( YOU -- 2018-11-25: for spread of activation to ideas about the other person )
  394 t ! 89 pho !   0 audpsi ! AudMem \ Y
  395 t ! 79 pho !   0 audpsi ! AudMem \ O
  396 t ! 85 pho ! 707 audpsi ! AudMem \ U -- 2018-11-25
707 psi !  7 pos ! 4 dba ! 1 num ! 892 pre ! 394 rv ! KbLoad  \ 2018-12-12
  397 t !  \ 2018-11-25: blank space for sake of AudRecog.

\ GOD IS A HOLY SPIRIT -- 2019-10-14:
( GOD #533 -- 2019-10-14: masculine singular noun  )
   398 t ! 71 pho !   0 audpsi ! AudMem \ G
   399 t ! 79 pho !   0 audpsi ! AudMem \ O
   400 t ! 68 pho ! 533 audpsi ! AudMem \ D
8 tru ! 533 psi ! 5 pos !  1 dba ! 1 num ! 1 mfn !  \ 2019-10-14
  0 pre ! 800 seq ! 403 tkb ! 398 rv ! KbLoad  \ 2019-10-14
  401 t !  \ 2019-10-14: blank space for sake of AudRecog.

  ( IS #800 -- 2019-10-14: third person singular form of 800=BE )
  402 t ! 73 pho !   0 audpsi ! AudMem \ 2019-10-14: I
  403 t ! 83 pho ! 800 audpsi ! AudMem \ 2019-10-14: S
 800 psi !   0 jux !   8 pos ! 3 dba ! 1 num ! 0 mfn !  \ 2019-10-14
 533 pre ! 580 seq ! 417 tkb ! 402 rv ! KbLoad  \ 2019-10-14
  404 t !  \ 2019-10-14: blank space for sake of AudRecog.

 ( A #101 -- 2019-10-14: English Article for EnArticle module )
  405 t ! 65 pho ! 101 audpsi ! AudMem \ A
101 psi ! 1 pos ! 1 num ! 0 mfn ! 0 pre ! 0 seq ! 0 tkb ! 405 rv ! KbLoad
  406 t !  \ 2019-10-14: blank space for sake of AudRecog.

  ( HOLY #137 -- 2019-10-14: retrievable adjective for use in EnAdjective )
  407 t ! 72 pho !   0 audpsi ! AudMem \ 2019-10-14: H
  408 t ! 79 pho !   0 audpsi ! AudMem \ 2019-10-14: O
  409 t ! 76 pho !   0 audpsi ! AudMem \ 2019-10-14: L
  410 t ! 89 pho ! 137 audpsi ! AudMem \ 2019-10-14: Y
137 psi !  1 pos ! 580 seq ! 407 rv ! KbLoad
  411 t !  \ 2019-10-14: blank space for sake of AudRecog.

( SPIRIT #580 -- 2019-10-14: for queries about God )
  412 t ! 83 pho !   0 audpsi ! AudMem \ 2019-10-14: S
  413 t ! 80 pho !   0 audpsi ! AudMem \ 2019-10-14: P
  414 t ! 73 pho !   0 audpsi ! AudMem \ 2019-10-14: I
  415 t ! 82 pho !   0 audpsi ! AudMem \ 2019-10-14: R
  416 t ! 73 pho !   0 audpsi ! AudMem \ 2019-10-14: I
  417 t ! 84 pho ! 580 audpsi ! AudMem \ 2019-10-14: T
580 psi !   0 jux !   5 pos !   4 dba ! 2 num ! 0 mfn !  \ 2019-10-14
884 pre !   0 seq ! 410 tdj ! 412  rv ! KbLoad  \ 2019-10-14
  418 t !  \ 2019-10-14: blank space for sake of AudRecog.

  ( I -- 2019-10-26: I AM THE GHOST IN THE MACHINE )
  ( I -- 2020-1-11: I AM THE ROBOT IN THE MACHINE )
  420 t ! 73 pho ! 701 audpsi ! AudMem \ 2019-10-26: I
0 tru ! 701 psi ! 7 pos ! 1 dba ! 1 num ! 800 seq ! 423 tkb ! 420 rv ! KbLoad
  421 t !  \ 2019-10-26: blank space for sake of AudRecog.

  ( AM -- 2019-10-26: 1st person singular I-form of 800=BE )
  422 t ! 65 pho !   0 audpsi ! AudMem \ 2016aug16: A
  423 t ! 77 pho ! 800 audpsi ! AudMem \ 2016aug16: M
 800 psi !   0 jux !   8 pos ! 1 dba ! 1 num ! 0 mfn !  \ 2019-10-26
 701 pre ! 522 seq ! 433 tkb ! 422 rv ! KbLoad  \ 2019-10-26
  424 t !  \ 2019-10-26: blank space for sake of AudRecog.

  425 t !  \ T ( article may be left out and then be supplied by EnArticle )
  426 t !  \ H
  427 t !  \ E
  428 t !  \ 2019-10-26: blank space for sake of AudRecog.

( GHOST #522 -- 2019-10-26: neuter singular noun  )
( ROBOT #522 -- 2020-1-11: CHANGE GHOST TO ROBOT )
  429 t ! 82 pho !   0 audpsi ! AudMem \ R
  430 t ! 79 pho !   0 audpsi ! AudMem \ O
  431 t ! 66 pho !   0 audpsi ! AudMem \ B
  432 t ! 79 pho !   0 audpsi ! AudMem \ O
  433 t ! 84 pho ! 571 audpsi ! AudMem \ T
8 tru ! 522 psi ! 5 pos !  1 dba ! 1 num ! 3 mfn !  \ 2019-10-26
  800 pre ! 0 seq ! 0 tkb ! 436 tpr ! 429 rv ! KbLoad  \ 2019-10-26
  434 t !  \ 2019-10-26: blank space for sake of AudRecog.

  ( IN -- 2019-10-26: preposition for EnPrep module )
  435 t ! 73 pho !   0 audpsi ! AudMem \ 2019-10-26: I
  436 t ! 78 pho ! 643 audpsi ! AudMem \ 2019-10-26: N
643 psi !   6 pos !   0 dba ! 0 num ! 0 mfn !  \ 2019-10-26
800 pre ! 123 seq ! 448 tkb ! 435 rv ! KbLoad  \ 2019-10-26
  437 t !  \ 2019-10-26: blank space for sake of AudRecog.

  438 t !  \ T ( article may be left out and then be supplied by EnArticle )
  439 t !  \ H
  440 t !  \ E
  441 t !  \ 2019-10-26: blank space for sake of AudRecog.

( MACHINE #542 -- 2019-10-26: neuter singular noun  )
  442 t ! 77 pho !   0 audpsi ! AudMem \ M
  443 t ! 65 pho !   0 audpsi ! AudMem \ A
  444 t ! 67 pho !   0 audpsi ! AudMem \ C
  445 t ! 72 pho !   0 audpsi ! AudMem \ H
  446 t ! 73 pho !   0 audpsi ! AudMem \ I
  447 t ! 78 pho !   0 audpsi ! AudMem \ N
  448 t ! 69 pho ! 542 audpsi ! AudMem \ E
542 psi ! 5 pos !  1 dba ! 1 num ! 3 mfn ! 642 pre ! 442 rv ! KbLoad  \ 2019-10-26
  449 t !  \ 2019-10-26: blank space for sake of AudRecog.

  ( I -- subject of 823=FEEL for use with TacRecog )
  450 t ! 73 pho ! 701 audpsi ! AudMem \ 2019-11-05: I
0 tru ! 701 psi ! 7 pos ! 1 dba ! 1 num ! 823 seq ! 455 tkb ! 450 rv ! KbLoad
  451 t !    \ 2019-11-05: blank space for sake of AudRecog.

  ( FEEL -- 2019-11-05: sensory verb for use with TacRecog )
  452 t ! 70 pho !   0 audpsi ! AudMem \ F
  453 t ! 69 pho !   0 audpsi ! AudMem \ E
  454 t ! 69 pho !   0 audpsi ! AudMem \ E
  455 t ! 76 pho ! 823 audpsi ! AudMem \ L
823 psi !  8 pos ! 1 dba ! 1 num ! 701 pre ! 452 rv !  KbLoad
  456 t !  \ 2019-11-05: blank space for sake of AudRecog.

\ 2019-11-05: end of innate knowledge base; start of single words of vocabulary.

\ 2019-10-14: Relative time-points start here for insertion of vocabulary.
  ( A #101 -- 2019-10-14: adjective article
   1 t +! 65 pho ! 101 audpsi ! AudMem t @ rv !  \ A
101 psi ! 1 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !
 1 num ! 0 mfn ! 0 dba !   KbLoad  \ 2016aug15
 1 t +!  \ 2018-09-01

  ( 601=ABOARD -- 2018-11-12: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 66 pho !   0 audpsi ! AudMem          \ B
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 68 pho ! 601 audpsi ! AudMem          \ D
601 psi !  6 pos !  KbLoad  \ 2018-11-15
   1 t +!  \ 2018-11-15: space for the sake of AudRecog

  ( 602=ABOUT -- preposition for EnPrep module; 2018-11-12 )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv !  \ A
   1 t +! 66 pho !   0 audpsi ! AudMem           \ B
   1 t +! 79 pho !   0 audpsi ! AudMem           \ O
   1 t +! 85 pho !   0 audpsi ! AudMem           \ U
   1 t +! 84 pho ! 602 audpsi ! AudMem           \ T
602 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
  0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug15
 1 t +!  \ 2018-09-01

  ( 603=ABOVE -- preposition for EnPrep module; 2018-11-12 )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 66 pho !   0 audpsi ! AudMem          \ B
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 86 pho !   0 audpsi ! AudMem          \ V
   1 t +! 69 pho ! 603 audpsi ! AudMem          \ E
603 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
  0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug15
 1 t +!  \ 2018-09-01

  ( 604=ABSENT -- 2018-11-12: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 66 pho !   0 audpsi ! AudMem          \ B
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 84 pho ! 604 audpsi ! AudMem          \ T
604 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 605=ACROSS -- preposition for EnPrep module; 2018-11-12 )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 67 pho !   0 audpsi ! AudMem          \ C
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 83 pho ! 605 audpsi ! AudMem          \ S
605 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
  0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016sep06
 1 t +!  \ 2018-09-01

  ( 300=AFTER -- 2018-11-23: conjunction )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 70 pho !   0 audpsi ! AudMem          \ F
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 82 pho ! 300 audpsi ! AudMem          \ R
300 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 606=AFTER -- 2018-11-12: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 70 pho !   0 audpsi ! AudMem          \ F
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 82 pho ! 606 audpsi ! AudMem          \ R
606 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
  0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016sep18
 1 t +!  \ 2018-09-01

  ( 607= AGAINST -- 2018-11-12: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 71 pho !   0 audpsi ! AudMem          \ G
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 84 pho ! 607 audpsi ! AudMem          \ T
607 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
  0 num !  0 mfn ! 0 dba !   KbLoad  \ 2017-09-17
 1 t +!  \ 2018-09-01

  ( AI -- 2016aug17: 599 psi !  -- noun formed from initials of artificial intelligence )
 1 t +!  \ 2018-09-01
 1 t +!  \ 2018-09-01: redundant; remove "AI"?
 1 t +!  \ 2018-09-01

  ( AIR -- 2016aug15: 593 psi ! -- noun for prepositions and needs )
   1 t +! 65 pho !     0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 73 pho !     0 audpsi ! AudMem \ I
   1 t +! 82 pho ! 534 audpsi ! AudMem \ R
534 psi ! 5 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !
 1 num ! 3 mfn ! 0 dba !   KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

 ( ALL #111 -- 2019-10-14: adjective for machine reasoning logic )
   1 t +! 65 pho !     0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 76 pho !     0 audpsi ! AudMem \ L
   1 t +! 76 pho ! 111 audpsi ! AudMem \  2016aug16: L
111 psi ! 1 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !
 0 num ! 0 mfn ! 0 dba !   KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

  ( ALL -- 2016aug16: 711 psi ! -- pronoun )
 1 t +!  \ 2018-09-01
 1 t +!  \ 2018-09-01
 1 t +!  \ 2018-09-01
 1 t +!  \ 2018-09-01

  ( ALLOW -- 2016aug18: 802 psi ! -- verb with indirect object; 355+6=361 )
 1 t +!  \ 2018-09-01

  ( 608=ALONG -- 2018-11-12: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 76 pho !   0 audpsi ! AudMem          \ L
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 71 pho ! 608 audpsi ! AudMem          \ G
608 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 609=ALONGSIDE -- 2018-11-12: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 76 pho !   0 audpsi ! AudMem          \ L
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 71 pho !   0 audpsi ! AudMem          \ G
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 68 pho !   0 audpsi ! AudMem          \ D
   1 t +! 69 pho ! 609 audpsi ! AudMem          \ E
609 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( ALREADY -- 2016aug19: 200 psi ! -- adverb )
 1 t +!  \ 2018-09-01

  ( ALSO -- -- 2016aug19: 202 psi ! -- adverb )
 1 t +!  \ 2018-09-01

  ( 303=ALTHOUGH -- 2018-11-23: conjunction )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 76 pho !   0 audpsi ! AudMem          \ L
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 71 pho !   0 audpsi ! AudMem          \ G
   1 t +! 72 pho ! 303 audpsi ! AudMem          \ H
303 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( ALWAYS -- 2016aug18: 206 psi ! -- adverb for machine reasoning logic )
 1 t +!  \ 2018-09-01

  ( 611=AMID -- 2018-11-12: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 77 pho !   0 audpsi ! AudMem          \ M
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 68 pho ! 611 audpsi ! AudMem          \ D
611 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 612=AMIDST -- 2018-11-11: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 77 pho !   0 audpsi ! AudMem          \ M
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 68 pho !   0 audpsi ! AudMem          \ D
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 84 pho ! 612 audpsi ! AudMem          \ T
612 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 613=AMONG -- 2018-11-12: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 77 pho !   0 audpsi ! AudMem          \ M
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 71 pho ! 613 audpsi ! AudMem          \ G
613 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 614=AMONGST -- 2018-11-12: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 77 pho !   0 audpsi ! AudMem          \ M
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 71 pho !   0 audpsi ! AudMem          \ G
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 84 pho ! 614 audpsi ! AudMem          \ T
614 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

 ( AN -- lengthening of article "A" before a vowel  )
   1 t +! 65 pho !     0 audpsi ! AudMem t @ rv !  \ A
   1 t +! 78 pho ! 102 audpsi ! AudMem \ 2018-09-07: N
102 psi ! 1 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !
 1 num ! 0 mfn ! 0 dba !  KbLoad  \ 2016aug15
 1 t +!  \ 2018-09-07

 ( AND -- 2016aug16:  306 psi ! -- conjunction for machine reasoning logic )
   1 t +! 65 pho !       0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 78 pho !       0 audpsi ! AudMem \ N
   1 t +! 68 pho !   306 audpsi ! AudMem \ 2016aug19: D
306 psi !  3 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
 0 num !  0 mfn ! 0 dba !  KbLoad  \ 2016aug15
 1 t +!  \ 2018-09-01

 ( ANDRU -- name for a robot embodiment of the AI )
 ( INDRA -- NAME CHAGED TO INDRA 2020-1-11)
   1 t +! 73 pho !   0 audpsi ! AudMem t @ rv !  \ I
   1 t +! 78 pho !   0 audpsi ! AudMem \ N
   1 t +! 68 pho !   0 audpsi ! AudMem \ D
   1 t +! 82 pho !   0 audpsi ! AudMem \ R
   1 t +! 65 pho ! 501 audpsi ! AudMem \ A
501 psi !  5 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
 1 num !  1 mfn ! 0 dba !  KbLoad  \ 2016aug15
 1 t +!  \ 2018-09-01

  ( 615=ANENT -- 2018-11-12: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 84 pho ! 615 audpsi ! AudMem          \ T
615 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

 ( ANNA -- -- for InFerence demonstration; 2018-09-07 )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv !    \ A
   1 t +! 78 pho !   0 audpsi ! AudMem \ 2018-09-07: N
   1 t +! 78 pho !   0 audpsi ! AudMem \ 2018-09-07: N
   1 t +! 65 pho ! 502 audpsi ! AudMem \ 2018-09-07: A
502 psi !  5 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq ! \ 2018-09-07
 1 num !  2 mfn !  KbLoad  \ 2018-09-07
 1 t +!  \ 2018-09-07

  ( 616=ANTI -- 2018-11-12: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 73 pho ! 616 audpsi ! AudMem          \ I
616 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( ANY #123 -- 2019-10-14: undefined quantity for machine reasoning logic )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 89 pho ! 123 audpsi ! AudMem          \ Y
123 psi ! 1 pos ! KbLoad  \ 2019-10-14
 1 t +!  \ 2019-10-14: space for the sake of AudRecog

\  441 t ! A
\  442 t ! N
\  443 t ! Y
\  444 t ! T
\  445 t ! H
\  446 t ! I
\  447 t ! N
\  448 t ! G  721=ANYTHING pronoun 2016aug19

  ( 617=APRES -- 2018-11-16: French preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 80 pho !   0 audpsi ! AudMem          \ P
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 83 pho ! 617 audpsi ! AudMem          \ S
617 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 618=AROUND -- 2018-11-12: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 81 pho !   0 audpsi ! AudMem          \ O
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 68 pho ! 618 audpsi ! AudMem          \ D
618 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

( 122 psi !  ARTIFICIAL -- 2016aug19: adjective important for AI: 455+11=466 )
 1 t +!  \ 2018-09-01

  ( 309=AS -- 2018-11-23: conjunction )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 83 pho ! 309 audpsi ! AudMem          \ S
309 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

 ( 506=ASIA -- 2018-11-24: for prepositions and for conversations )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 65 pho ! 506 audpsi ! AudMem          \ A
   506 psi ! 5 pos ! 0 jux ! 1 num ! 3 mfn ! 0 dba ! KbLoad \ 2018-11-24
 1 t +!  \ 2018-11-24: one blank time-point for sake of AudRecog

  ( 801=ASK -- 2018-12-12: from Wikipedia:Most_common_words_in_English )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: A
   1 t +! 83 pho !   0 audpsi ! AudMem          \ 2018-12-12: s
   1 t +! 75 pho ! 801 audpsi ! AudMem          \ 2018-12-12: K
801 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

  ( 619=ASTRIDE -- 2018-11-12: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 68 pho !   0 audpsi ! AudMem          \ D
   1 t +! 69 pho ! 619 audpsi ! AudMem          \ E
619 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 620=AT -- preposition for EnPrep module; 2018-11-12 )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 84 pho ! 620 audpsi ! AudMem          \ T
620 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
 0 num !  0 mfn ! 0 dba !  KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01
 1 t +!  \ 2018-09-01: Leave gap between A and B for safety?

  ( 621=ATOP -- 2018-11-12: preposition for EnPrep module )
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 80 pho ! 621 audpsi ! AudMem          \ P
621 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( BAD #127 -- 2019-10-14: adjective for EnAdjective module )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 68 pho ! 127 audpsi ! AudMem          \ D
127 psi ! 1 pos ! KbLoad  \ 2019-10-14
 1 t +!  \ 2019-10-14: space for the sake of AudRecog

  ( BE -- infinitive impersonal form of 800=BE; 2016aug07 )
   1 t +! 66 pho !     0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 69 pho ! 800 audpsi ! AudMem \ E
800 psi ! 8 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !
 0 num ! 0 mfn ! 0 dba !   KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

  ( AM -- 1st person singular I-form of 800=BE; 2016aug07 )
   1 t +! 65 pho !     0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 77 pho ! 800 audpsi ! AudMem \ M
800 psi ! 8 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !
 1 num ! 0 mfn ! 1 dba !  KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

   ( ARE -- 2nd person singular YOU-form of 800=BE; 2016aug07 )
   1 t +! 65 pho !     0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 82 pho !     0 audpsi ! AudMem \ R
   1 t +! 69 pho ! 800 audpsi ! AudMem \ E
800 psi ! 8 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !  \ 2016aug29: correction
 1 num ! 0 mfn ! 2 dba !  KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

  ( IS -- 3rd person singular HE-SHE-IT-form of 800=BE; 2016aug07 )
   1 t +! 73 pho !     0 audpsi ! AudMem t @ rv ! \ I
   1 t +! 83 pho ! 800 audpsi ! AudMem \ S
800 psi ! 8 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !
 1 num ! 0 mfn ! 3 dba !  KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

 ( ARE -- 1st person plural WE-form of 800=BE; 2016aug07 )
   1 t +! 65 pho !     0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 82 pho !     0 audpsi ! AudMem \ R
   1 t +! 69 pho ! 800 audpsi ! AudMem \ E
800 psi ! 8 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !
 2 num ! 0 mfn ! 1 dba !  KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

  ( ARE -- 2nd person plural YOU-form of 800=BE; 2016aug07 )
   1 t +! 65 pho !     0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 82 pho !     0 audpsi ! AudMem \ R
   1 t +! 69 pho ! 800 audpsi ! AudMem \ E
800 psi ! 8 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !
 2 num ! 0 mfn ! 2 dba !   KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

  ( ARE -- 3rd person plural THEY-form of 800=BE; 2016aug07 )
   1 t +! 65 pho !     0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 82 pho !     0 audpsi ! AudMem \ R
   1 t +! 69 pho ! 800 audpsi ! AudMem \ E
800 psi ! 8 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !
 2 num ! 0 mfn ! 3 dba !  KbLoad  \ 2016aug19  1 t +!  \ 2018-09-01
 1 t +!  \ 2018-09-01

  ( 312=BECAUSE -- 2018-11-23: conjunction for machine reasoning logic )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 67 pho !   0 audpsi ! AudMem          \ C
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 69 pho ! 312 audpsi ! AudMem          \ E
312 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 622=BECAUSE [millennial] -- 2018-11-12: preposition for EnPrep module )

  ( BECOME -- 2016aug15: essential intransitive verb )
 1 t +!  \ 2018-09-01

  ( 802=BECOME -- 2018-12-12: essential intransitive verb )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-12: E
   1 t +! 67 pho !   0 audpsi ! AudMem          \ 2018-12-12: C
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-12: O
   1 t +! 77 pho !   0 audpsi ! AudMem          \ 2018-12-12: M
   1 t +! 69 pho ! 802 audpsi ! AudMem          \ 2018-12-12: E
802 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

  ( 315=BEFORE -- 2018-11-23: conjunction for machine reasoning logic )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 70 pho !   0 audpsi ! AudMem          \ F
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 69 pho ! 315 audpsi ! AudMem          \ E
315 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 623=BEFORE -- 2018-11-12: preposition for EnPrep module )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 70 pho !   0 audpsi ! AudMem          \ F
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 69 pho ! 623 audpsi ! AudMem          \ E
623 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 803=BEGIN -- 2018-12-12: important verb for planning )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-12: E
   1 t +! 71 pho !   0 audpsi ! AudMem          \ 2018-12-12: G
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2018-12-12: I
   1 t +! 78 pho ! 803 audpsi ! AudMem          \ 2018-12-12: N
803 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

  ( 624=BEHIND -- 2018-11-12: preposition for EnPrep module )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 68 pho ! 624 audpsi ! AudMem          \ D
624 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 625=BELOW -- 2018-11-12: preposition for EnPrep module )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 76 pho !   0 audpsi ! AudMem          \ L
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 87 pho ! 625 audpsi ! AudMem          \ W
625 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 626=BENEATH -- 2018-11-12: preposition for EnPrep module )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 70 pho !   0 audpsi ! AudMem          \ N
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 72 pho ! 626 audpsi ! AudMem          \ H
626 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  (  627=BESIDE -- 2018-11-12: preposition for EnPrep module )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 68 pho !   0 audpsi ! AudMem          \ D
   1 t +! 69 pho ! 627 audpsi ! AudMem          \ E
627 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog
 1 t +!  \ 2018-09-01

  ( 628=BESIDES -- 2018-11-12: preposition for EnPrep module )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 68 pho !   0 audpsi ! AudMem          \ D
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 83 pho ! 628 audpsi ! AudMem          \ S
628 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog
 1 t +!  \ 2018-09-01

  ( BEST -- 2016aug16: 143 psi !  superlative form of adjective 141= GOOD )
 1 t +!  \ 2018-09-01

  ( 629=BESTRIDE -- 2018-11-12: preposition for EnPrep module )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 68 pho !   0 audpsi ! AudMem          \ D
   1 t +! 69 pho ! 629 audpsi ! AudMem          \ E
629 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( BETTER -- 2016aug16: 142 psi ! comparative form of adjective 141=GOOD )
 1 t +!  \ 2018-09-01: adjective; 584+7=591

  ( 630=BETWEEN -- 2018-11-12: preposition for EnPrep module )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 87 pho !   0 audpsi ! AudMem          \ W
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 78 pho ! 630 audpsi ! AudMem          \ N
630 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 631=BETWIXT -- 2018-11-12: preposition for EnPrep module )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 87 pho !   0 audpsi ! AudMem          \ W
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 88 pho !   0 audpsi ! AudMem          \ X
   1 t +! 84 pho ! 631 audpsi ! AudMem          \ T
631 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 632=BEYOND -- 2018-11-12: preposition for EnPrep module )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 89 pho !   0 audpsi ! AudMem          \ Y
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 68 pho ! 632 audpsi ! AudMem          \ D
632 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( BOOK -- 2016aug16: 540 psi ! -- noun for logical inference )
   1 t +! 66 pho !     0 audpsi ! AudMem t @ rv !  \ B
   1 t +! 79 pho !     0 audpsi ! AudMem \ O
   1 t +! 79 pho !     0 audpsi ! AudMem \ O
   1 t +! 75 pho ! 540 audpsi ! AudMem \ K
540 psi !  5 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug22
 1 num !  3 mfn ! 0 dba !  KbLoad  \ 2016aug22
 1 t +!  \ 2018-09-01

  ( BOY -- 2019-11-05: 512 psi ! -- always masculine noun for use with gender flags )
   1 t +! 66 pho !     0 audpsi ! AudMem t @ rv ! \ 2019-11-05 - B
   1 t +! 79 pho !     0 audpsi ! AudMem          \ 2019-11-05 - O
   1 t +! 89 pho ! 512 audpsi ! AudMem            \ 2019-11-05 - Y
512 psi !  5 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2019-11-05
 1 num !  1 mfn ! 0 dba !   KbLoad  \ 2016aug22
 1 t +!  \ 2018-09-01

  ( 633=BUT -- 2018-11-12: as a preposition for EnPrep module )
 1 t +!  \ 2018-09-01

  ( 321=BUT -- 2018-11-23: conjunction for ConJoin module  )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ B
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 84 pho ! 321 audpsi ! AudMem          \ T
321 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 804=BUY -- 2018-12-12: common everyday verb )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: B
   1 t +! 85 pho !   0 audpsi ! AudMem          \ 2018-12-12: U
   1 t +! 89 pho ! 804 audpsi ! AudMem          \ 2018-12-12: Y
804 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

  ( 634=BY -- preposition -- 30th most frequent word -- for EnPrep module )
   1 t +! 66 pho !   0 audpsi ! AudMem t @ rv !  \ B
   1 t +! 89 pho ! 634 audpsi ! AudMem           \ Y
634 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
 0 num !  0 mfn ! 0 dba !  KbLoad  \ 2016aug24
 1 t +!  \ 2018-09-01

  ( BYE -- 2018-12-12: interjection; plays special role in Forth )

  ( 805=CALL -- 2018-12-12: from Wikipedia:Most_common_words_in_English )
   1 t +! 67 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: C
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-12: A
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2018-12-12: L
   1 t +! 76 pho ! 805 audpsi ! AudMem          \ 2018-12-12: L
805 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

  ( 806=CAN -- 2018-12-12: auxiliary modal verb for EnAuxVerb )
   1 t +! 67 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: C
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-12: A
   1 t +! 78 pho ! 806 audpsi ! AudMem          \ 2018-12-12: N
806 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

 ( CELLPHONE -- 2016aug17: 545 psi ! -- noun ) ( 643+10=653)

 ( CHESS -- 2016aug15: 564 psi ! important singular AI noun ending in "S" )

  ( 635=CHEZ -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 67 pho !   0 audpsi ! AudMem t @ rv ! \ C
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 90 pho ! 635 audpsi ! AudMem          \ Z
635 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

 ( CHILD -- 2016aug15: 525 psi ! example of irregular noun for a polyglot AI Mind )
 ( CHILDREN -- 2016aug15: 525 psi ! same rv? irregular plural for retrieval by parameters )

  ( 807=CHOOSE -- 2018-12-12: verb for Volition )
   1 t +! 67 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: C
   1 t +! 72 pho !   0 audpsi ! AudMem          \ 2018-12-12: H
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-12: O
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-12: O
   1 t +! 83 pho !   0 audpsi ! AudMem          \ 2018-12-12: S
   1 t +! 69 pho ! 807 audpsi ! AudMem          \ 2018-12-12: E
807 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

  ( CITY -- 2016aug15: 590 psi ! -- noun for prepositions and location )

  ( 812=COME -- 2018-12-13: from Wikipedia:Most_common_words_in_English )
   1 t +! 67 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: C
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-13: O
   1 t +! 77 pho !   0 audpsi ! AudMem          \ 2018-12-13: M
   1 t +! 69 pho ! 812 audpsi ! AudMem          \ 2018-12-13: E
812 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-13: infinitive
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

 ( COMPUTER -- 2016aug17:  565 psi ! -- important noun for AI ) ( 683+9=692 )

  ( 636=CONCERNING -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 67 pho !   0 audpsi ! AudMem t @ rv ! \ C
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 67 pho !   0 audpsi ! AudMem          \ C
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 71 pho ! 636 audpsi ! AudMem          \ G
636 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 808=CONNECT -- 2018-12-12: verb for Volition )
   1 t +! 67 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: C
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-12: O
   1 t +! 78 pho !   0 audpsi ! AudMem          \ 2018-12-12: N
   1 t +! 78 pho !   0 audpsi ! AudMem          \ 2018-12-12: N
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-12: E
   1 t +! 67 pho !   0 audpsi ! AudMem          \ 2018-12-12: C
   1 t +! 84 pho ! 808 audpsi ! AudMem          \ 2018-12-12: T
808 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

  ( CONSCIOUS -- 2016aug16:  123 psi ! -- adjective important for AI )

  ( CONSCIOUSNESS -- 2016aug16: 523 psi ! -- noun important for AI )

  ( CORNER -- 2016aug17: 567 psi ! -- noun important for prepositions and location )
 1 t +!  \ 2018-09-01: calculated time-point
 1 t +!  \ 2018-09-01: unitary gap between C and D

  ( 811=COULD -- 2018-12-12: auxiliary verb for EnAuxVerb )
   1 t +! 67 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: C
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-12: O
   1 t +! 85 pho !   0 audpsi ! AudMem          \ 2018-12-12: U
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2018-12-12: L
   1 t +! 68 pho ! 811 audpsi ! AudMem          \ 2018-12-12: D
811 psi ! 88 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: past tense
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

  ( 813=DARE -- 2018-12-13: auxiliary verb )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: D
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-13: A
   1 t +! 82 pho !   0 audpsi ! AudMem          \ 2018-12-13: R
   1 t +! 69 pho ! 813 audpsi ! AudMem          \ 2018-12-13: E
813 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-13: infinitive
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

  ( DATA -- 2016aug15: always plural noun in correction of modern usage )

  ( 814=DELETE -- 2018-12-13: verb for computers )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: D
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-13: E
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2018-12-13: L
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-13: E
   1 t +! 84 pho !   0 audpsi ! AudMem          \ 2018-12-13: T
   1 t +! 69 pho ! 814 audpsi ! AudMem          \ 2018-12-13: E
814 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-13: infinitive
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

  ( 637=DESPITE -- 2018-11-12: preposition for EnPrep module )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ D
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 80 pho !   0 audpsi ! AudMem          \ P
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 69 pho ! 637 audpsi ! AudMem          \ E
637 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 815=DESTROY -- 2018-12-13: like opposite of MAKE )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: D
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-13: E
   1 t +! 83 pho !   0 audpsi ! AudMem          \ 2018-12-13: S
   1 t +! 84 pho !   0 audpsi ! AudMem          \ 2018-12-13: T
   1 t +! 82 pho !   0 audpsi ! AudMem          \ 2018-12-13: R
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-13: O
   1 t +! 89 pho ! 815 audpsi ! AudMem          \ 2018-12-13: Y
815 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-13: infinitive
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

  ( 816=DID -- 2018-12-13: auxiliary verb for past tense )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: D
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2018-12-13: I
   1 t +! 68 pho ! 816 audpsi ! AudMem          \ 2018-12-13: D
816 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-13: infinitive
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

  ( 817=DIE -- 2018-12-13: verb for existential thought )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: D
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2018-12-13: I
   1 t +! 69 pho ! 817 audpsi ! AudMem          \ 2018-12-13: E
817 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-13: infinitive
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

 ( 818=DO -- 2018-12-13: infinitive form of verb essential for AuxVerb module )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: D
   1 t +! 79 pho ! 818 audpsi ! AudMem          \ 2018-12-13: O
818 psi !  8 pos ! 0 dba !  0 num ! KbLoad  \ 2018-12-13: infinitive
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

 ( 818=DO -- 2018-12-13: 1st person singular I-form of auxiliary verb )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: D
   1 t +! 79 pho ! 818 audpsi ! AudMem          \ 2018-12-13: O
818 psi ! 8 pos ! 1 dba !  1 num ! KbLoad \ 2018-12-13: first person singular
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

 ( 818=DO -- 2018-12-13: 2nd person sing. YOU-form of auxiliary verb )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: D
   1 t +! 79 pho ! 818 audpsi ! AudMem          \ 2018-12-13: O
818 psi ! 8 pos !  2 dba ! 1 num ! KbLoad  \ 2018-12-13: 2nd person singular
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

 ( 818=DOES -- 2018-12-13: 3rd person sing. HE-SHE-IT-form of auxiliary verb )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: D
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-13: O
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-13: E
   1 t +! 83 pho ! 818 audpsi ! AudMem          \ 2018-12-13: S
818 psi ! 8 pos ! 3 dba ! 1 num ! KbLoad  \ 2018-12-13: 3rd person singular
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

 ( 818=DO -- 2018-12-13: 1st person plural WE-form of auxiliary verb )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: D
   1 t +! 79 pho ! 818 audpsi ! AudMem          \ 2018-12-13: O
818 psi ! 8 pos ! 1 dba ! 2 num ! KbLoad \ 2018-12-13: first person plural
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

  ( 818=DO -- 2018-02-13: 2nd person plural YOU-form of auxiliary verb )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: D
   1 t +! 79 pho ! 818 audpsi ! AudMem          \ 2018-12-13: O
818 psi ! 8 pos ! 2 dba ! 2 num ! KbLoad \ 2018-12-13: second person plural
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

  ( 818=DO -- 2018-12-13: 3rd person plural THEY-form of auxiliary verb )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: D
   1 t +! 79 pho ! 818 audpsi ! AudMem          \ 2018-12-13: O
818 psi ! 8 pos ! 3 dba ! 2 num ! KbLoad \ 2018-12-13: third person plural
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

  ( DOING -- 2018-12-13:  118 psi ! -- adjectival participle from 818=DO verb )

  ( 638=DOWN -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ D
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 87 pho !   0 audpsi ! AudMem          \ W
   1 t +! 78 pho ! 638 audpsi ! AudMem          \ N
638 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 819=DRINK -- 2018-12-13: common everyday verb )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: D
   1 t +! 82 pho !   0 audpsi ! AudMem          \ 2018-12-13: R
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2018-12-13: I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ 2018-12-13: N
   1 t +! 75 pho ! 819 audpsi ! AudMem          \ 2018-12-13: K
819 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-13: infinitive
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

  ( 820=DROP -- 2018-12-13: verb for robotics )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-13: D
   1 t +! 82 pho !   0 audpsi ! AudMem          \ 2018-12-13: R
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-13: O
   1 t +! 80 pho ! 819 audpsi ! AudMem          \ 2018-12-13: P
819 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-13: infinitive
 1 t +!  \ 2018-12-13: one SPACE for AudRecog

  ( 639=DURING -- 2018-11-12: preposition for EnPrep module )
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ D
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 71 pho ! 639 audpsi ! AudMem          \ G
639 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( EACH -- 2016aug16: 131 psi ! -- adjective for machine reasoning logic )

  ( EARTH -- 2016aug16: 531 psi ! -- noun for prepositions and location )

  ( 821=EAT -- 2018-12-14: common everyday verb )
   1 t +! 69 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: E
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-14: A
   1 t +! 84 pho ! 821 audpsi ! AudMem          \ 2018-12-14: T
821 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-14: infinitive
 1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( 588=EIGHT -- 2019-11-05: noun for the haptic sensation of the numeric "8" key )
   1 t +! 69 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-11-05: E
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2019-11-05: I
   1 t +! 71 pho !   0 audpsi ! AudMem          \ 2019-11-05: G
   1 t +! 72 pho !   0 audpsi ! AudMem          \ 2019-11-05: H
   1 t +! 84 pho ! 588 audpsi ! AudMem          \ 2019-11-05: T
588 psi !  5 pos ! 4 dba ! 1 num ! 3 mfn ! KbLoad \ 2019-11-05
 1 t +!  \ 2019-11-05: one blank time-point for sake of AudRecog

  ( 324=EITHER -- 2018-11-23: conjunction  )
   1 t +! 69 pho !   0 audpsi ! AudMem t @ rv ! \ E
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 82 pho ! 324 audpsi ! AudMem          \ R
324 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( ELSE  2016aug18: 210 psi ! -- adverb for machine reasoning logic )

 ( ENERGY -- 2016aug19: 588 psi ! -- noun )

 ( ENGLISH -- 2016aug17: 569 psi ! -- noun important for NLP )

( ENOUGH -- 2016aug16: 128 psi ! -- adjective important for logic )
( ENOUGH -- 2016aug16: 728 psi ! -- pronoun )

 \ ( 538=ERROR -- 2018-11-24: was first word so any bug would announce itself )
 \   1 t *! 73 pho !  0 audpsi ! AudMem \ 2016aug16: E
 \   1 t *! 78 pho !  0 audpsi ! AudMem \ 2016aug16: R
 \   1 t *! 68 pho !  0 audpsi ! AudMem \ 2016aug16: R
 \   1 t *! 82 pho !  0 audpsi ! AudMem \ 2016aug16: O
 \   1 t *! 65 pho ! 538 audpsi ! AudMem \ 2016aug16: R
 \   538 psi !  5 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq ! \ 2018-11-24
 \    1 num !  3 mfn ! 0 dba !  KbLoad  \ 2016aug19
 \ 1 t +!  \ 2018-09-01

 ( EVEN  -- 2016aug18: 214 psi ! -- adverb ) ( 846+5=851 )

  ( EVERY -- 2016aug16: 132 psi ! -- adjective for machine reasoning logic ) ( 851+6=857 )

  ( EVERYWHERE -- 2016aug18: 218 psi ! -- adverb ) ( 857+11=868 )

  ( 640=EXCEPT -- 2018-11-12: preposition for EnPrep module )
   1 t +! 69 pho !   0 audpsi ! AudMem t @ rv ! \ E
   1 t +! 88 pho !   0 audpsi ! AudMem          \ X
   1 t +! 67 pho !   0 audpsi ! AudMem          \ C
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 80 pho !   0 audpsi ! AudMem          \ P
   1 t +! 84 pho ! 640 audpsi ! AudMem          \ T
640 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 822=FALL -- 2018-12-14: verb of motion for robotics )
   1 t +! 70 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: F
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-14: A
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2018-12-14: L
   1 t +! 76 pho ! 822 audpsi ! AudMem          \ 2018-12-14: L
822 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-14: infinitive
 1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( FALSE -- 2016aug16: 180 psi ! -- adjective )

  ( 823=FEEL -- 2018-12-14: from Wikipedia:Most_common_words_in_English )
   1 t +! 70 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: F
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-14: E
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-14: E
   1 t +! 76 pho ! 823 audpsi ! AudMem          \ 2018-12-14: L
823 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-14: infinitive
 1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( FEW -- 2016aug17: 152 psi ! -- adjective for machine reasoning logic )

  ( 824=FIND -- 2018-12-14: from Wikipedia:Most_common_words_in_English )
   1 t +! 70 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: F
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2018-12-14: I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ 2018-12-14: N
   1 t +! 68 pho ! 824 audpsi ! AudMem          \ 2018-12-14: D
824 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-14: infinitive
 1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( 825=FINISH -- 2018-12-14: verb important for planning )
   1 t +! 70 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: F
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2018-12-14: I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ 2018-12-14: N
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2018-12-14: I
   1 t +! 83 pho !   0 audpsi ! AudMem          \ 2018-12-14: S
   1 t +! 72 pho ! 825 audpsi ! AudMem          \ 2018-12-14: H
825 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-14: infinitive
 1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( FIRST -- 2016aug16: 100 psi ! -- adjective )

  ( FISH -- 2016aug15: 548 psi ! -- useful common noun )
   1 t +! 70 pho !     0 audpsi ! AudMem t @ rv ! \ 2016aug19: F
   1 t +! 73 pho !     0 audpsi ! AudMem \ 2016aug19: I
   1 t +! 83 pho !     0 audpsi ! AudMem \ 2016aug19: S
   1 t +! 72 pho ! 548 audpsi ! AudMem \ 2016aug19: H
548 psi !  5 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016sep03
  1 num !  0 mfn ! 1 dba !   KbLoad  \ 2016sep03
 1 t +!  \ 2018-09-01

  ( 545=FIVE -- 2019-11-05: noun for the haptic sensation of the numeric "5" key )
   1 t +! 70 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-11-05: F
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2019-11-05: I
   1 t +! 86 pho !   0 audpsi ! AudMem          \ 2019-11-05: V
   1 t +! 69 pho ! 545 audpsi ! AudMem          \ 2019-11-05: E
545 psi !  5 pos ! 4 dba ! 1 num ! 3 mfn ! KbLoad \ 2019-11-05
 1 t +!  \ 2019-11-05: one blank time-point for sake of AudRecog

 ( FLOOR -- 2016aug17: 572 psi ! -- noun important for prepositions and location )

  ( FOOD -- 2019-10-14: 542 psi ! -- noun for inference and ontology )

  ( 641=FOR -- preposition for EnPrep module )
   1 t +! 70 pho !   0 audpsi ! AudMem t @ rv ! \ F
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 82 pho ! 641 audpsi ! AudMem          \ R
641 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
 0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug24
 1 t +!  \ 2018-09-01

  ( 826=FORGET -- 2018-12-14: verb for cognition )
   1 t +! 70 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: F
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-14: O
   1 t +! 82 pho !   0 audpsi ! AudMem          \ 2018-12-14: R
   1 t +! 71 pho !   0 audpsi ! AudMem          \ 2018-12-14: G
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-14: E
   1 t +! 84 pho ! 826 audpsi ! AudMem          \ 2018-12-14: T
826 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-14: infinitive
 1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( 544=FOUR -- 2019-11-05: noun for the haptic sensation of the numeric "4" key )
   1 t +! 70 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-11-05: F
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2019-11-05: O
   1 t +! 85 pho !   0 audpsi ! AudMem          \ 2019-11-05: U
   1 t +! 82 pho ! 544 audpsi ! AudMem          \ 2019-11-05: R
544 psi !  5 pos ! 4 dba ! 1 num ! 3 mfn ! KbLoad \ 2019-11-05
 1 t +!  \ 2019-11-05: one blank time-point for sake of AudRecog

  ( FRIEND -- 2018-12-13: 517 psi ! -- for coding assignment of ad-hoc gender tags )
  ( FRIENDLY-- 2018-12-13: 117 psi ! --  adjective )

  ( 642=FROM -- 2018-11-12: preposition for EnPrep module )
   1 t +! 70 pho !   0 audpsi ! AudMem t @ rv ! \ F
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 77 pho ! 642 audpsi ! AudMem          \ M
642 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
 0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug24
 1 t +!  \ 2018-09-01

  ( FUN -- 2016aug16: 585 psi ! -- noun ) ( 933+4-937 )

  ( FUNNY -- 2016aug16: 185 psi ! -- adjective )
 1 t +!  \ 2018-09-01: calculated time-point
 1 t +!  \ 2018-09-01: unitary gap between F and G

  ( 827=GET -- 2018-12-14: from Wikipedia:Most_common_words_in_English )
   1 t +! 71 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: G
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-14: E
   1 t +! 84 pho ! 827 audpsi ! AudMem          \ 2018-12-14: T
827 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-14: infinitive
   1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( GIRL -- 2016aug15: 510 psi ! -- always feminine noun for use with gender flags )

  ( 828=GIVE -- 2018-12-14: dative verb for indirect objects )
   1 t +! 71 pho !     0 audpsi ! AudMem t @ rv ! \ 2018-12-14: G
   1 t +! 73 pho !     0 audpsi ! AudMem          \ 2018-12-14: I
   1 t +! 86 pho !     0 audpsi ! AudMem          \ 2018-12-14: V
   1 t +! 69 pho ! 828 audpsi ! AudMem            \ 2018-12-14: E
828 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-14: infinitive
   1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( 829=GO -- 2018-12-14: from Wikipedia:Most_common_words_in_English )
   1 t +! 71 pho !     0 audpsi ! AudMem t @ rv ! \ 2018-12-14: G
   1 t +! 79 pho ! 829 audpsi ! AudMem            \ 2018-12-14: E
829 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-14: infinitive
   1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( GOAL -- 2016aug19: 532 psi !  -- noun important for FreeWill volition module )

  ( GOD -- 2016aug15: 533 psi ! -- masculine noun important for philosophy of AI )

  ( 829=GOES -- 2018-12-14: irregular third person singular of GO )
   1 t +! 71 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: G
   1 t +! 81 pho !   0 audpsi ! AudMem          \ 2018-12-14: O
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-14: E
   1 t +! 83 pho ! 829 audpsi ! AudMem          \ 2018-12-14: S
829 psi ! 8 pos ! 3 dba ! 1 num ! KbLoad \ 2018-12-14: third person singular
   1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( GOOD #134 -- 2019-10-14: adjective for EnAdjective module )

  ( 830=GOT -- 2018-12-14: frequent word used in multiple ways )
   1 t +! 71 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: G
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-14: O
   1 t +! 84 pho ! 830 audpsi ! AudMem          \ 2018-12-14: T
830 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-14: past tense
   1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( 831=GROK -- 2018-12-14: verb for cognition )
   1 t +! 71 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: G
   1 t +! 82 pho !   0 audpsi ! AudMem          \ 2018-12-14: R
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-14: O
   1 t +! 75 pho ! 831 audpsi ! AudMem          \ 2018-12-14: K
831 psi ! 8 pos ! 3 dba ! 1 num ! KbLoad \ 2018-12-14: infinitive
   1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( 832=HAD-- 2018-12-14: almost an axiliary verb )
   1 t +! 72 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: H
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-14: A
   1 t +! 68 pho ! 832 audpsi ! AudMem          \ 2018-12-14: D
832 psi ! 8 pos ! 3 dba ! 1 num ! KbLoad \ 2018-12-14: infinitive
   1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( 833=HATE-- 2018-12-14: verb for Emotion; opposite of LOVE )
   1 t +! 72 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: H
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-14: A
   1 t +! 84 pho !   0 audpsi ! AudMem          \ 2018-12-14: T
   1 t +! 69 pho ! 833 audpsi ! AudMem          \ 2018-12-14: E
833 psi ! 8 pos ! 3 dba ! 1 num ! KbLoad \ 2018-12-14: infinitive
   1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( 834=HAVE -- 2018-12-12: irregular high-word-frequency verb )
   1 t +! 72 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-06-24: H
   1 t +! 65 pho !   0 audpsi ! AudMem \ 2018-06-24: A
   1 t +! 86 pho !   0 audpsi ! AudMem \ 2018-06-24: V
   1 t +! 69 pho ! 834 audpsi ! AudMem \ 2018-06-24: E
834 psi ! 0 jux ! 8 pos !  0 dba ! 0 num ! 0 mfn !  \ 2018-12-12
  0 pre ! 0 seq ! 0 tkb !  KbLoad  \ 2018-06-24
 1 t +!  \ 2018-09-01

( 834=HAS -- 2018-12-12: high-word-frequency irregular verb form )
   1 t +! 72 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-06-24: H
   1 t +! 65 pho !   0 audpsi ! AudMem \ 2018-06-24: A
   1 t +! 83 pho ! 834 audpsi ! AudMem \ 2018-06-24: S
834 psi ! 0 jux ! 8 pos !  3 dba ! 1 num ! 0 mfn !  \ 2018-12-12
  0 pre ! 0 seq ! 0 tkb !  KbLoad  \ 2018-06-24:
 1 t +!  \ 2018-09-01

( HE -- 2016aug19: nominative form of high-word-frequency pronoun )
   1 t +! 72 pho !     0 audpsi ! AudMem t @ rv ! \ H
   1 t +! 69 pho ! 713 audpsi ! AudMem \ E
713 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug19
 1 num !  1 mfn ! 1 dba !   KbLoad  \ 2016aug19: masculine
 1 t +!  \ 2018-09-01

( HIS -- 2016aug19: genitive form of personal pronoun )
   1 t +! 72 pho !     0 audpsi ! AudMem t @ rv ! \ H
   1 t +! 73 pho !     0 audpsi ! AudMem \ I
   1 t +! 83 pho ! 113 audpsi ! AudMem \ S
713 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug19
 1 num !  1 mfn ! 2 dba !   KbLoad  \ 2016aug19: masculine
 1 t +!  \ 2018-09-01

( HIM -- 2016aug19: dative indirect-object form of personal pronoun )
   1 t +! 72 pho !     0 audpsi ! AudMem t @ rv ! \ H
   1 t +! 73 pho !     0 audpsi ! AudMem \ I
   1 t +! 77 pho ! 713 audpsi ! AudMem \ M
713 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug19
 1 num !  1 mfn ! 3 dba !  KbLoad  \ 2016aug19: masculine
 1 t +!  \ 2018-09-01

( HIM -- 2016aug19: accusative direct-object form of personal pronoun )
   1 t +! 72 pho !     0 audpsi ! AudMem t @ rv ! \ H
   1 t +! 73 pho !     0 audpsi ! AudMem \ I
   1 t +! 77 pho ! 713 audpsi ! AudMem \ M
713 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2019-02-22
 1 num !  1 mfn ! 4 dba !   KbLoad  \ 2016aug19: masculine
 1 t +!  \ 2018-09-01

( HIS -- 2016aug19: possessive adjective for personal pronoun )
   1 t +! 72 pho !     0 audpsi ! AudMem t @ rv ! \ H
   1 t +! 73 pho !     0 audpsi ! AudMem \ I
   1 t +! 83 pho ! 113 audpsi ! AudMem \ S
113 psi !  1 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug19
  0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

  ( 835=HEAR-- 2018-12-14: verb important for Audition and robotics )
   1 t +! 72 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-14: E
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-14: A
   1 t +! 82 pho ! 835 audpsi ! AudMem          \ 2018-12-14: R
835 psi ! 8 pos ! 3 dba ! 1 num ! KbLoad \ 2018-12-14: infinitive
   1 t +!  \ 2018-12-14: one SPACE for AudRecog

( HELLO -- 2016aug19: interjection for human-computer interaction )
   1 t +! 72 pho ! 0 audpsi ! AudMem t @ rv !  \ H
   1 t +! 69 pho ! 0 audpsi ! AudMem \ E
   1 t +! 76 pho ! 0 audpsi ! AudMem \ L
   1 t +! 76 pho ! 0 audpsi ! AudMem \ L
   1 t +! 79 pho ! 450 audpsi ! AudMem \ O
450 psi !  4 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug19
  0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

  ( 836=HELP -- 2018-12-12: socially significant common verb )
   1 t +! 72 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-12: E
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2018-12-12: L
   1 t +! 80 pho ! 836 audpsi ! AudMem          \ 2018-12-12: P
836 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

 ( HER -- 2016aug19: 119 psi ! -- possessive adjective from personal pronoun )
   1 t +! 72 pho !     0 audpsi ! AudMem t @ rv ! \ H
   1 t +! 69 pho !     0 audpsi ! AudMem \ E
   1 t +! 82 pho ! 119 audpsi ! AudMem \ R
119 psi !  1 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug19
  0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

 ( HERE -- 2016aug18: 222 psi ! -- adverb for discussion of physical location )

  ( HOUSE -- 2016aug17: 570 psi ! -- noun important for prepositions and location )

  ( HOW -- 2016aug18: 226 psi !  -- adverb for EnAdverb module )
 1 t +!  \ 2018-09-01

  ( I -- 2016aug19: nominative subject-form of personal pronoun )
   1 t +! 73 pho ! 701 audpsi ! AudMem t @ rv ! \ I
701 psi ! 7 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !
 1 num ! 0 mfn ! 1 dba !   KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

  ( MINE -- 2016aug19: genitive form of personal pronoun )
   1 t +! 77 pho !     0 audpsi ! AudMem t @ rv ! \ M
   1 t +! 73 pho !     0 audpsi ! AudMem \ I
   1 t +! 78 pho !     0 audpsi ! AudMem \ N
   1 t +! 69 pho ! 701 audpsi ! AudMem \ E
701 psi ! 7 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !
 1 num ! 0 mfn ! 2 dba !   KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

  ( ME -- 2016aug19: dative indirect-object form of personal pronoun; )
   1 t +! 77 pho !     0 audpsi ! AudMem t @ rv !  \ M
   1 t +! 69 pho ! 701 audpsi ! AudMem \ E
701 psi ! 7 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !
 1 num ! 0 mfn ! 3 dba !   KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

 ( ME -- 2016aug19: accusative direct-object form of personal pronoun )
   1 t +! 77 pho !     0 audpsi ! AudMem t @ rv ! \ M
   1 t +! 69 pho ! 701 audpsi ! AudMem \ E
701 psi ! 7 pos ! 0 jux !  0 pre ! 0 tkb ! 0 seq !
 1 num ! 0 mfn ! 4 dba !  KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01

  ( 327=IF -- 2018-11-23: conjunction for machine reasoning logic )
   1 t +! 73 pho !   0 audpsi ! AudMem t @ rv ! \ I
   1 t +! 70 pho ! 327 audpsi ! AudMem          \ F
327 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 837=IMAGINE -- 2018-12-14: verb for cognition )
   1 t +! 73 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: I
   1 t +! 77 pho !   0 audpsi ! AudMem          \ 2018-12-14: M
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-14: A
   1 t +! 71 pho !   0 audpsi ! AudMem          \ 2018-12-14: G
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2018-12-14: I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ 2018-12-14: N
   1 t +! 69 pho ! 837 audpsi ! AudMem          \ 2018-12-14: E
837 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-14: infinitive
   1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( 643=IN -- 2018-11-12 -- preposition for EnPrep module; in KB )
   1 t +! 73 pho !   0 audpsi ! AudMem t @ rv !  \ I
   1 t +! 78 pho ! 643 audpsi ! AudMem           \ N
643 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
 0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug24
 1 t +!  \ 2018-09-01

  ( INASMUCH -- 2016aug16:  330 psi !  conjunction; with AS? )

  ( 644=INCLUDING -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 73 pho !   0 audpsi ! AudMem t @ rv ! \ I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 67 pho !   0 audpsi ! AudMem          \ C
   1 t +! 76 pho !   0 audpsi ! AudMem          \ L
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 68 pho !   0 audpsi ! AudMem          \ D
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 71 pho ! 644 audpsi ! AudMem          \ G
644 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 645=INSIDE -- 2018-11-12: preposition for EnPrep module )
   1 t +! 73 pho !   0 audpsi ! AudMem t @ rv ! \ I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 68 pho !   0 audpsi ! AudMem          \ D
   1 t +! 69 pho ! 645 audpsi ! AudMem          \ E
645 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( INTELLIGENCE -- 2016aug17: 524 psi ! -- noun )
  ( INTELLIGENT -- 2016aug17:   124 psi ! -- adjective )

  ( INTERNET -- 2016aug17: 568 psi !  -- noun for general ontology )

  ( 646=INTO -- 2018-11-12: preposition for EnPrep module )
   1 t +! 73 pho !   0 audpsi ! AudMem t @ rv ! \ I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 79 pho ! 646 audpsi ! AudMem          \ O
646 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( IT -- 2016aug15: 725 psi ! -- nominative subject-form of personal pronoun )

  ( ITS -- 2016aug15: 725 psi ! -- genitive form of personal pronoun )

  ( IT -- 2016aug15: 725 psi ! -- dative indirect-object form of pers. pronoun )

  ( IT -- 2016aug15: 725 psi ! -- accusative direct-obj. form of pers. pronoun )

( IT -- 2016aug19: nominative subject-form of personal pronoun  )
   1 t +! 73 pho !     0 audpsi ! AudMem t @ rv ! \ I
   1 t +! 84 pho ! 725 audpsi ! AudMem \ T
725 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug19
 1 num !  3 mfn ! 1 dba !   KbLoad  \ 2016aug19: neuter
 1 t +!  \ 2018-09-01

( ITS -- 2016aug19 genitive form of personal pronoun; 2016aug19 )
   1 t +! 73 pho !     0 audpsi ! AudMem t @ rv !  \ I
   1 t +! 84 pho !     0 audpsi ! AudMem \ T
   1 t +! 83 pho ! 725 audpsi ! AudMem \ S
725 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug19
 1 num !  3 mfn ! 2 dba !   KbLoad  \ 2016aug19: neuter
 1 t +!  \ 2018-09-01

( IT -- 2016aug19: dative indirect-object form of pers. pronoun )
   1 t +! 73 pho !     0 audpsi ! AudMem t @ rv !  \ I
   1 t +! 84 pho ! 725 audpsi ! AudMem \ T
725 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug19
 1 num !  3 mfn ! 3 dba !   KbLoad  \ 2016aug19: neuter
 1 t +!  \ 2018-09-01

( IT -- 2016aug19: accusative direct-obj. form of pers. pronoun )
   1 t +! 73 pho !     0 audpsi ! AudMem t @ rv !  \ I
   1 t +! 84 pho ! 725 audpsi ! AudMem \ T
713 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug19
 1 num !  3 mfn ! 4 dba !   KbLoad  \ 2016aug19: neuter
 1 t +!  \ 2018-09-01

  ( ITS -- 2016aug17: 125 psi ! -- possessive adjective from personal pronoun )
   1 t +! 73 pho !     0 audpsi ! AudMem t @ rv !  \ I
   1 t +! 84 pho !     0 audpsi ! AudMem \ T
   1 t +! 83 pho ! 125 audpsi ! AudMem \ S
125 psi !  1 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug19
 0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug19
 1 t +!  \ 2018-09-01: calculated time-point
 1 t +!  \ 2018-09-01: unitary gap between I and K

  ( 504=JOHN -- 2019-09-28: useful noun for input-testing )
 1 t +! 74 pho !    0 audpsi ! AudMem t @ rv ! \ J
 1 t +! 79 pho !    0 audpsi ! AudMem \ O
 1 t +! 72 pho !    0 audpsi ! AudMem \ H
 1 t +! 78 pho !  504 audpsi ! AudMem \ N
504 psi !  0 jux !  5 pos !  1 dba !    1 num !          \ 2019-09-28
  1 mfn !  0 pre !  0 seq !  0 tkb !   KbLoad  \ 2019-09-28
 1 t +!  \ 2019-09-28: one blank time-point for sake of AudRecog

  ( 838=KNOW -- 2018-12-14: from Wikipedia:Most_common_words_in_English )
   1 t +! 75 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: K
   1 t +! 78 pho !   0 audpsi ! AudMem          \ 2018-12-14: N
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-14: O
   1 t +! 87 pho ! 838 audpsi ! AudMem          \ 2018-12-14: W
838 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-14: infinitive
   1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( LAST -- 2016aug16: 199 psi ! -- adjective ) ( 1135+5=1140 )

  ( 839=LEARN -- 2018-12-14: verb for cognition )
   1 t +! 76 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: L
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-14: E
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-14: A
   1 t +! 82 pho !   0 audpsi ! AudMem          \ 2018-12-14: R
   1 t +! 78 pho ! 839 audpsi ! AudMem          \ 2018-12-14: N
839 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-14: infinitive
   1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( 840=LEAVE -- 2018-12-14: from Wikipedia:Most_common_words_in_English )
   1 t +! 76 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-14: L
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-14: E
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-14: A
   1 t +! 86 pho !   0 audpsi ! AudMem          \ 2018-12-14: V
   1 t +! 69 pho ! 840 audpsi ! AudMem          \ 2018-12-14: E
840 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-14: infinitive
   1 t +!  \ 2018-12-14: one SPACE for AudRecog

  ( 841  LEND -- 2018-12-14: verb for dative and accusative )
   1 t +! 76 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-15: L
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-15: E
   1 t +! 78 pho !   0 audpsi ! AudMem          \ 2018-12-15: N
   1 t +! 68 pho ! 841 audpsi ! AudMem          \ 2018-12-15: D
841 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-15: infinitive
   1 t +!  \ 2018-12-15: one SPACE for AudRecog

  ( 647=LESS -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 76 pho !   0 audpsi ! AudMem t @ rv ! \ L
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 83 pho ! 647 audpsi ! AudMem          \ S
647 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 333=LEST -- 2018-11-23: conjunction  )
   1 t +! 76 pho !   0 audpsi ! AudMem t @ rv ! \ L
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 84 pho ! 333 audpsi ! AudMem          \ T
333 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 648=LIKE -- 2018-11-12: as a preposition for EnPrep module )

  ( 842  LIVE -- 2018-12-14: verb important for life )
   1 t +! 76 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-18: L
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2018-12-18: I
   1 t +! 86 pho !   0 audpsi ! AudMem          \ 2018-12-18: V
   1 t +! 69 pho ! 842 audpsi ! AudMem          \ 2018-12-18: E
842 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-18: infinitive
   1 t +!  \ 2018-12-18: one SPACE for AudRecog

  ( 843  LOAN    2018-12-14: verb for dative and accusative )
   1 t +! 76 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-19: L
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-19: O
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-19: A
   1 t +! 78 pho ! 843 audpsi ! AudMem          \ 2018-12-19: N
843 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-18: infinitive
   1 t +!  \ 2018-12-19: one SPACE for AudRecog

  ( 844  LOOK    2018-12-14: from Wikipedia:Most_common_words_in_English )
   1 t +! 76 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-19: L
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-19: O
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-19: O
   1 t +! 75 pho ! 844 audpsi ! AudMem          \ 2018-12-19: K
844 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-18: infinitive
   1 t +!  \ 2018-12-19: one SPACE for AudRecog

  ( 845  LOVE -- 2018-12-14: verb for Emotion; opposite of HATE )
   1 t +! 76 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-19: L
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-19: O
   1 t +! 86 pho !   0 audpsi ! AudMem          \ 2018-12-19: V
   1 t +! 69 pho ! 845 audpsi ! AudMem          \ 2018-12-19: E
845 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-18: infinitive
   1 t +!  \ 2018-12-19: one SPACE for AudRecog

  ( 846=MAKE -- 2018-12-12: from Wikipedia:Most_common_words_in_English )
   1 t +! 77 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: M
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-12: A
   1 t +! 75 pho !   0 audpsi ! AudMem          \ 2018-12-12: K
   1 t +! 69 pho ! 846 audpsi ! AudMem          \ 2018-12-12: E
846 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

  ( MAN -- 2016aug15: 543 psi !  -- always masculine noun for use with gender flags )
   1 t +! 77 pho !     0 audpsi ! AudMem t @ rv ! \ 2018-10-19: M
   1 t +! 65 pho !     0 audpsi ! AudMem          \ 2018-10-19: A
   1 t +! 78 pho !   543 audpsi ! AudMem          \ 2018-10-19: N
543 psi !  5 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2018-10-19
 1 num !  1 mfn ! 0 dba !   KbLoad  \ 2018-10-19
 1 t +!  \ 2018-10-19: blank space for sake of AudRecog.

  ( MEN -- 2016aug21: 543 psi !  -- irreg. pl. for retrieval by parameters; sing. rv? )

  ( MANY -- 2016aug17: 171 psi ! -- adjective for machine reasoning logic )

  ( 847  MAY     2018-12-14: auxiliary modal verb )
   1 t +! 77 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-20: M
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-20: A
   1 t +! 89 pho ! 847 audpsi ! AudMem          \ 2018-12-20: Y
847 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-20: modal verb
   1 t +!  \ 2018-12-20: one SPACE for AudRecog

  ( MAYBE --  2016aug18: 230 psi ! -- adverb response as alternative to YES or NO )
   1 t +! 77 pho !   0 audpsi ! AudMem t @ rv !  \ 2018-06-24: M
   1 t +! 65 pho !   0 audpsi ! AudMem \ 2018-06-24: A
   1 t +! 89 pho !   0 audpsi ! AudMem \ 2018-06-24: Y
   1 t +! 66 pho !   0 audpsi ! AudMem \ 2018-06-24: B
   1 t +! 69 pho ! 230 audpsi ! AudMem \ 2018-06-24: E
230 psi ! 0 jux ! 2 pos !   0 dba ! 0 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 0 seq ! 0 tkb !  KbLoad  \ 2018-06-24
 1 t +!  \ 2018-09-01

  ( MEDIA -- 2016aug21: 584 psi ! -- always pl. noun in correction of modern usage )

  ( 848  MIGHT   2018-12-14: auxiliary verb )
   1 t +! 77 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-20: M
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2018-12-20: I
   1 t +! 71 pho !   0 audpsi ! AudMem          \ 2018-12-20: G
   1 t +! 72 pho !   0 audpsi ! AudMem          \ 2018-12-20: H
   1 t +! 84 pho ! 848 audpsi ! AudMem          \ 2018-12-20: T
848 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-20: past tense
   1 t +!  \ 2018-12-20: one SPACE for AudRecog

  ( 649=MINUS -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 77 pho !   0 audpsi ! AudMem t @ rv ! \ M
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 83 pho ! 649 audpsi ! AudMem          \ S
649 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 650=MODULO -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 77 pho !   0 audpsi ! AudMem t @ rv ! \ M
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 68 pho !   0 audpsi ! AudMem          \ D
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 76 pho !   0 audpsi ! AudMem          \ L
   1 t +! 79 pho ! 650 audpsi ! AudMem          \ O
650 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 563=MONEY -- 2019-09-28: "money" as accusative noun )
 1 t +! 77 pho !    0 audpsi ! AudMem t @ rv ! \ M
 1 t +! 79 pho !    0 audpsi ! AudMem \ O
 1 t +! 78 pho !    0 audpsi ! AudMem \ N
 1 t +! 69 pho !    0 audpsi ! AudMem \ E
 1 t +! 89 pho !  563 audpsi ! AudMem \ Y
563 psi !  0 jux !  5 pos !  4 dba !    1 num !          \ 2019-09-28
  3 mfn !  0 pre !  0 seq !  0 tkb !   KbLoad  \ 2019-09-28
 1 t +!  \ 2019-09-28: one blank time-point for sake of AudRecog

  ( MORE -- 2016aug17: 172 psi ! -- adjective )
  ( MORE -- 2016aug17: 772 psi ! -- pronoun )

  ( MOST -- 2016aug17: 173 psi ! -- adjective for machine reasoning logic )

  ( 849  MOVE    2018-12-14: motion verb for Motorium and robotics )
   1 t +! 77 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-20: M
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-20: O
   1 t +! 86 pho !   0 audpsi ! AudMem          \ 2018-12-20: V
   1 t +! 69 pho ! 849 audpsi ! AudMem          \ 2018-12-20: E
849 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-20: infinitive
   1 t +!  \ 2018-12-20: one SPACE for AudRecog

  ( MUCH -- 2016aug17: 170 psi ! -- adjective )
  ( MUCH -- 2016aug17: 770 psi ! -- pronoun )

  ( 850  MUST    2018-12-14: auxiliary modal verb )
   1 t +! 77 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-20: M
   1 t +! 85 pho !   0 audpsi ! AudMem          \ 2018-12-20: U
   1 t +! 83 pho !   0 audpsi ! AudMem          \ 2018-12-20: S
   1 t +! 84 pho ! 850 audpsi ! AudMem          \ 2018-12-20: T
850 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-20: modal verb
   1 t +!  \ 2018-12-20: one SPACE for AudRecog

  ( MY -- 2016aug15: 181 psi ! -- adjective for personal pronoun "I" )
 1 t +!  \ 2018-09-01: calculated time-point
 1 t +!  \ 2018-09-01: unitary gap between M and N

  ( 651=NEAR -- 2018-11-12: preposition for EnPrep module )
   1 t +! 78 pho !   0 audpsi ! AudMem t @ rv ! \ N
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 82 pho ! 651 audpsi ! AudMem          \ R
651 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 652=NEARER -- 2018-11-12: preposition for EnPrep module )
   1 t +! 78 pho !   0 audpsi ! AudMem t @ rv ! \ N
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 82 pho ! 652 audpsi ! AudMem          \ R
652 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 653=NEAREST -- 2018-11-12: preposition for EnPrep module )
   1 t +! 78 pho !   0 audpsi ! AudMem t @ rv ! \ N
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 84 pho ! 653 audpsi ! AudMem          \ T
653 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 851=NEED -- 2018-12-12: sometimes used as an auxiliary verb )
   1 t +! 78 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: N
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-12: E
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-12: E
   1 t +! 68 pho ! 851 audpsi ! AudMem          \ 2018-12-12: D
851 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

  ( 336=NEITHER -- 2018-11-23: conjunction  )
   1 t +! 78 pho !   0 audpsi ! AudMem t @ rv ! \ N
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 82 pho ! 336 audpsi ! AudMem          \ R
336 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( NEVER -- 2016aug18: 234 psi ! -- adverb )

  ( NEW -- 2016aug16: 110 psi ! -- adjective )

  ( 654=NEXT +/- TO -- 2018-11-12: as a preposition for EnPrep module )

  ( 559=NINE -- 2019-11-05: noun for the haptic sensation of the numeric "9" key )
   1 t +! 78 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-11-05: N
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2019-11-05: I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ 2019-11-05: N
   1 t +! 69 pho ! 559 audpsi ! AudMem          \ 2019-11-05: E
559 psi !  5 pos ! 4 dba ! 1 num ! 3 mfn ! KbLoad \ 2019-11-05
 1 t +!  \ 2019-11-05: one blank time-point for sake of AudRecog

  ( NO -- 2016aug17: 160 psi ! -- adjective for machine reasoning logic )

 ( NO -- 2016aug21: 404 psi ! -- interj. for human-computer interaction )
   1 t +! 78 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-06-24: N
   1 t +! 79 pho ! 404 audpsi ! AudMem \ 2018-06-24: O
404 psi ! 0 jux ! 4 pos ! 0 dba ! 0 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 0 seq ! 0 tkb ! KbLoad  \ 2018-06-24
 1 t +!  \ 2018-09-01

  ( 339=NOR -- 2018-11-23: conjunction  )
   1 t +! 78 pho !   0 audpsi ! AudMem t @ rv ! \ N
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 82 pho ! 339 audpsi ! AudMem          \ R
339 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( NOT  --  2016aug18: 250 psi ! -- adverb for machine reasoning logic )
   1 t +! 78 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-06-24: N
   1 t +! 79 pho !   0 audpsi ! AudMem \ 2018-06-24: O
   1 t +! 84 pho ! 250 audpsi ! AudMem \ 2018-06-24: T
250 psi ! 0 jux ! 2 pos !    0 dba ! 0 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 0 seq ! 0 tkb !  KbLoad  \ 2018-06-24
 1 t +!  \ 2018-09-01

  ( NOTHING -- 2016aug21: 760 psi ! -- pron.; VisRecog default for what AI sees )
   1 t +! 78 pho !   0 audpsi ! AudMem t @ rv !  \ N
   1 t +! 79 pho !   0 audpsi ! AudMem \ O
   1 t +! 84 pho !   0 audpsi ! AudMem \ T
   1 t +! 72 pho !   0 audpsi ! AudMem \ H
   1 t +! 73 pho !   0 audpsi ! AudMem \ I
   1 t +! 78 pho !   0 audpsi ! AudMem \ N
   1 t +! 71 pho ! 760 audpsi ! AudMem \ G
760 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug31; 2017-09-01
 1 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug31
  1 t +!  \ 2018-09-01

\ notwithstanding

  ( NOW -- 2016aug18: 238 psi ! -- adverb )
  ( NOW -- 2016aug18: 342 psi !  -- conjunction )

 ( NOWHERE -- 2016aug18: 242 psi ! -- adverb )
 1 t +!  \ 2018-09-01: calculated time-point
 1 t +!  \ 2018-09-01: unitary gap between N and O

 ( 655=OF -- 2018-11-12: preposition for EnPrep module )
   1 t +! 79 pho !   0 audpsi ! AudMem t @ rv ! \ O
   1 t +! 70 pho ! 655 audpsi ! AudMem          \ F
655 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
 0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug24
 1 t +!  \ 2018-09-01

  ( 656=OFF -- 2018-11-12: preposition for EnPrep module )
   1 t +! 79 pho !   0 audpsi ! AudMem t @ rv ! \ O
   1 t +! 70 pho !   0 audpsi ! AudMem          \ F
   1 t +! 70 pho ! 656 audpsi ! AudMem          \ F
656 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 852 OFFER   2018-12-14: verb for dative and accusative )
   1 t +! 81 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-21: O
   1 t +! 70 pho !   0 audpsi ! AudMem          \ 2018-12-21: F
   1 t +! 70 pho !   0 audpsi ! AudMem          \ 2018-12-21: F
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-21: E
   1 t +! 82 pho ! 852 audpsi ! AudMem          \ 2018-12-21: R
852 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-21: infinitive
   1 t +!  \ 2018-12-21: one SPACE for AudRecog

  ( OFTEN -- 2016aug18: 246 psi ! -- adverb )

  ( OLD -- 2016aug16: 190 psi ! -- adjective )

  ( 657=ON -- 2018-11-12: preposition for EnPrep module )
  1 t +! 79 pho !   0 audpsi ! AudMem t @ rv !  \ O
  1 t +! 78 pho ! 657 audpsi ! AudMem           \ N
657 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
 0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug24
  1 t +!  \ 2018-09-01

  ( 551=ONE -- 2019-11-05: noun for the haptic sensation of the numeric "1" key )
   1 t +! 79 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-11-05: O
   1 t +! 78 pho !   0 audpsi ! AudMem          \ 2019-11-05: N
   1 t +! 69 pho ! 551 audpsi ! AudMem          \ 2019-11-05: E
551 psi !  5 pos ! 4 dba ! 1 num ! 3 mfn ! KbLoad \ 2019-11-05
 1 t +!  \ 2019-11-05: one blank time-point for sake of AudRecog

  ( ONCE -- 2016aug18: 248 psi ! -- adverb )
  ( ONCE -- 2016aug18: 345 psi ! -- conjunction )

  ( ONLY -- 2016aug16: 150 psi ! -- adjective )
  ( ONLY -- 2016aug16: 200 psi ! -- adverb )

  ( 658=ONTO -- 2018-11-12: preposition for EnPrep module )
   1 t +! 79 pho !   0 audpsi ! AudMem t @ rv ! \ O
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 79 pho ! 658 audpsi ! AudMem          \ O
658 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 659=OPPOSITE -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 79 pho !   0 audpsi ! AudMem t @ rv ! \ O
   1 t +! 80 pho !   0 audpsi ! AudMem          \ P
   1 t +! 80 pho !   0 audpsi ! AudMem          \ P
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 69 pho ! 659 audpsi ! AudMem          \ E
659 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( OR -- 2016aug22: 348 psi ! -- conjunction )
   1 t +! 79 pho !   0 audpsi ! AudMem t @ rv ! \ O
   1 t +! 82 pho ! 348 audpsi ! AudMem          \ R
348 psi !  3 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug22
 0 num !  0 mfn ! 0 dba !  KbLoad  \ 2016aug22
 1 t +!  \ 2018-09-01

  ( OTHER -- 2016aug16: 182 psi ! -- adjective )

  ( 853 OUGHT   2018-12-14: like a subjunctive verb )
   1 t +! 79 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-21: O
   1 t +! 85 pho !   0 audpsi ! AudMem          \ 2018-12-21: U
   1 t +! 71 pho !   0 audpsi ! AudMem          \ 2018-12-21: G
   1 t +! 72 pho !   0 audpsi ! AudMem          \ 2018-12-21: H
   1 t +! 84 pho ! 853 audpsi ! AudMem          \ 2018-12-21: T
853 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-21: subjunctive
   1 t +!  \ 2018-12-21: one SPACE for AudRecog

  ( OUR -- 2016aug18: 186 psi ! -- adjective for personal pronoun "WE" )

  ( 660=OUT -- 2018-11-12: preposition for EnPrep module )
   1 t +! 79 pho !   0 audpsi ! AudMem t @ rv ! \ O
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 84 pho ! 660 audpsi ! AudMem          \ T
660 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 662=OUTSIDE -- 2018-11-12: preposition for EnPrep module )
   1 t +! 79 pho !   0 audpsi ! AudMem t @ rv ! \ O
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 68 pho !   0 audpsi ! AudMem          \ D
   1 t +! 69 pho ! 662 audpsi ! AudMem          \ E
662 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 663=OVER -- 2018-11-12: preposition for EnPrep module )
   1 t +! 79 pho !   0 audpsi ! AudMem t @ rv ! \ O
   1 t +! 86 pho !   0 audpsi ! AudMem          \ V
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 82 pho ! 663 audpsi ! AudMem          \ R
663 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 854=OWE -- 2018-12-12: verb for dative and accusative )
   1 t +! 79 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: O
   1 t +! 87 pho !   0 audpsi ! AudMem          \ 2018-12-12: W
   1 t +! 69 pho ! 854 audpsi ! AudMem          \ 2018-12-12: E
854 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

  ( 855 OWN     2018-12-14: verb for personhood )
   1 t +! 79 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-21: O
   1 t +! 87 pho !   0 audpsi ! AudMem          \ 2018-12-21: W
   1 t +! 78 pho ! 855 audpsi ! AudMem          \ 2018-12-21: N
855 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-21: infinitive
   1 t +!  \ 2018-12-21: one SPACE for AudRecog

  ( 664=PACE -- 2018-11-12: Latin as a preposition for EnPrep module )
   1 t +! 80 pho !   0 audpsi ! AudMem t @ rv ! \ P
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 67 pho !   0 audpsi ! AudMem          \ C
   1 t +! 69 pho ! 664 audpsi ! AudMem          \ E
664 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( PARENTS -- 2019-11-05: 567 psi ! -- important noun )

  ( 665=PAST -- 2018-11-12: preposition for EnPrep module )
   1 t +! 80 pho !   0 audpsi ! AudMem t @ rv ! \ P
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 84 pho ! 665 audpsi ! AudMem          \ T
665 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 856 PAY -- 2018-12-14:  verb for dative and accusative )
   1 t +! 80 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-21: P
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-21: A
   1 t +! 89 pho ! 856 audpsi ! AudMem          \ 2018-12-21: Y
856 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-21: infinitive
   1 t +!  \ 2018-12-21: one SPACE for AudRecog

  ( PEOPLE -- 2016aug1q5: 587 psi ! -- establish as plural for EnParser )

  ( 666=PER -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 80 pho !   0 audpsi ! AudMem t @ rv ! \ P
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 82 pho ! 666 audpsi ! AudMem          \ R
666 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( PERHAPS -- 2016aug18: 254 psi ! -- adverb )

  ( PHONE -- 2016aug17: 546 psi !  -- noun for general ontology )

  ( 857 PICK -- 2018-12-14: verb for Volition; robotics, etc. )
   1 t +! 80 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-21: P
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2018-12-21: I
   1 t +! 67 pho !   0 audpsi ! AudMem          \ 2018-12-21: C
   1 t +! 75 pho ! 857 audpsi ! AudMem          \ 2018-12-21: K
857 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-21: infinitive
   1 t +!  \ 2018-12-21: one SPACE for AudRecog

  ( 858 PLACE     2018-12-14:  verb for robotics )
   1 t +! 80 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-21: P
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2018-12-21: L
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-21: A
   1 t +! 67 pho !   0 audpsi ! AudMem          \ 2018-12-21: C
   1 t +! 69 pho ! 858 audpsi ! AudMem          \ 2018-12-21: E
858 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-21: infinitive
   1 t +!  \ 2018-12-21: one SPACE for AudRecog

  ( 859=PLAY -- 2018-12-12: common everyday verb )
   1 t +! 80 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: P
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2018-12-12: L
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-12: A
   1 t +! 89 pho ! 859 audpsi ! AudMem          \ 2018-12-12: Y
859 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

\ PLEASE -- interjection for human-computer interaction )

  ( 667=PLUS -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 80 pho !   0 audpsi ! AudMem t @ rv ! \ P
   1 t +! 76 pho !   0 audpsi ! AudMem          \ L
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 83 pho ! 667 audpsi ! AudMem          \ S
667 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 668=POST -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 80 pho !   0 audpsi ! AudMem t @ rv ! \ P
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 84 pho ! 668 audpsi ! AudMem          \ T
668 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

 ( POWER -- 2016aug16: 575 psi ! -- noun )

  ( 669=PRO -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 80 pho !   0 audpsi ! AudMem t @ rv ! \ P
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 79 pho ! 669 audpsi ! AudMem          \ O
669 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 860 PROMISE   2018-12-14: verb for dative and accusative )
   1 t +! 80 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-21: P
   1 t +! 82 pho !   0 audpsi ! AudMem          \ 2018-12-21: R
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2018-12-21: O
   1 t +! 77 pho !   0 audpsi ! AudMem          \ 2018-12-21: M
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2018-12-21: I
   1 t +! 83 pho !   0 audpsi ! AudMem          \ 2018-12-21: S
   1 t +! 69 pho ! 860 audpsi ! AudMem          \ 2018-12-21: E
860 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2018-12-21: infinitive
   1 t +!  \ 2018-12-21: one SPACE for AudRecog

  ( 351=PROVIDED -- 2018-11-23: conjunction  )
   1 t +! 80 pho !   0 audpsi ! AudMem t @ rv ! \ P
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 86 pho !   0 audpsi ! AudMem          \ V
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 68 pho !   0 audpsi ! AudMem          \ D
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 68 pho ! 351 audpsi ! AudMem          \ D
351 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 861 PUT -- 2018-12-14: verb for Motorium and robotics )
   1 t +! 80 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: P
   1 t +! 85 pho !   0 audpsi ! AudMem          \ 2019-01-05: U
   1 t +! 84 pho ! 861 audpsi ! AudMem          \ 2019-01-05: T
861 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 670=QUA -- 2018-11-12: Latin as a preposition for EnPrep module )
   1 t +! 81 pho !   0 audpsi ! AudMem t @ rv ! \ Q
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 65 pho ! 670 audpsi ! AudMem          \ A
670 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 862 QUIT -- 2018-12-14: verb for robotics; planning; software, etc. )
   1 t +! 81 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: Q
   1 t +! 85 pho !   0 audpsi ! AudMem          \ 2019-01-05: U
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2019-01-05: I
   1 t +! 84 pho ! 862 audpsi ! AudMem          \ 2019-01-05: T
862 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( QUITE -- 2016aug18: 256 psi ! -- adverb )

  ( RATHER -- 2016aug18: 258 psi ! -- adverb )

  ( 671=RE -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 82 pho !   0 audpsi ! AudMem t @ rv ! \ R
   1 t +! 69 pho ! 671 audpsi ! AudMem          \ E
671 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

( 863=READ -- 2018-12-12: dba=0 infinitive for sake of logical inference  )
 1 t +! 82 pho !   0 audpsi ! AudMem t @ rv ! \ R
 1 t +! 69 pho !   0 audpsi ! AudMem          \ E
 1 t +! 65 pho !   0 audpsi ! AudMem          \ A
 1 t +! 68 pho ! 863 audpsi ! AudMem          \ D
863 psi ! 8 pos !  0 dba ! 0 num ! KbLoad  \ 2019-01-05: infinitive
 1 t +!  \ 2018-10-07: SPACE for the sake of AudRecog

  ( 864 RECOGNIZE -- 2018-12-14: verb for cognition )
   1 t +! 82 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: R
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-01-05: E
   1 t +! 67 pho !   0 audpsi ! AudMem          \ 2019-01-05: C
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2019-01-05: O
   1 t +! 71 pho !   0 audpsi ! AudMem          \ 2019-01-05: G
   1 t +! 78 pho !   0 audpsi ! AudMem          \ 2019-01-05: N
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2019-01-05: I
   1 t +! 90 pho !   0 audpsi ! AudMem          \ 2019-01-05: Z
   1 t +! 69 pho ! 864 audpsi ! AudMem          \ 2019-01-05: E
864 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 672=REGARDING -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 82 pho !   0 audpsi ! AudMem t @ rv ! \ R
   1 t +! 69 pho !   0 audpsi ! AudMem t @ rv ! \ E
   1 t +! 71 pho !   0 audpsi ! AudMem t @ rv ! \ G
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 82 pho !   0 audpsi ! AudMem t @ rv ! \ R
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ D
   1 t +! 73 pho !   0 audpsi ! AudMem t @ rv ! \ I
   1 t +! 78 pho !   0 audpsi ! AudMem t @ rv ! \ N
   1 t +! 71 pho ! 672 audpsi ! AudMem          \ G
672 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 865 REMEMBER -- 2018-12-14: verb for cognition )
   1 t +! 82 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: R
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-01-05: E
   1 t +! 77 pho !   0 audpsi ! AudMem          \ 2019-01-05: M
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-01-05: E
   1 t +! 77 pho !   0 audpsi ! AudMem          \ 2019-01-05: M
   1 t +! 66 pho !   0 audpsi ! AudMem          \ 2019-01-05: B
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-01-05: E
   1 t +! 82 pho ! 865 audpsi ! AudMem          \ 2019-01-05: R
865 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( ROBOT 2016aug16: 571 psi ! )

  ( 866 ROLL -- 2018-12-14: verb useful for robotics )
   1 t +! 82 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: R
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2019-01-05: O
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2019-01-05: L
   1 t +! 76 pho ! 866 audpsi ! AudMem          \ 2019-01-05: L
866 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 673=ROUND -- 2018-11-12: alternative to "around" for EnPrep module )
   1 t +! 82 pho !   0 audpsi ! AudMem t @ rv ! \ R
   1 t +! 79 pho !   0 audpsi ! AudMem t @ rv ! \ O
   1 t +! 85 pho !   0 audpsi ! AudMem t @ rv ! \ U
   1 t +! 78 pho !   0 audpsi ! AudMem t @ rv ! \ N
   1 t +! 68 pho ! 673 audpsi ! AudMem          \ D
673 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

 ( ROOM -- 2016aug21: 573 psi ! -- noun important for prep. and location )
 1 t +!  \ 2018-09-01: calculated time-point
 1 t +!  \ 2018-09-01: unitary gap between Q and R

  ( 867 RUN -- 2018-12-14: verb for robotics; computers; etc. )
   1 t +! 82 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: R
   1 t +! 85 pho !   0 audpsi ! AudMem          \ 2019-01-05: U
   1 t +! 78 pho ! 867 audpsi ! AudMem          \ 2019-01-05: N
867 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 868 SAID -- 2019-01-05: past tense of 869=SAY )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: S
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2019-01-05: A
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2019-01-05: I
   1 t +! 68 pho ! 868 audpsi ! AudMem          \ 2019-01-05: D
868 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: past tense
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 674=SANS -- 2018-11-12: French as if preposition for EnPrep module )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ S
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 82 pho !   0 audpsi ! AudMem t @ rv ! \ N
   1 t +! 83 pho ! 674 audpsi ! AudMem          \ S
674 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 675=SAVE -- 2018-11-12: preposition for EnPrep module )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ S
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 86 pho !   0 audpsi ! AudMem t @ rv ! \ V
   1 t +! 69 pho ! 675 audpsi ! AudMem          \ E
675 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 869 SAY -- 2018-12-14: from Wikipedia:Most_common_words_in_English )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: S
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2019-01-05: A
   1 t +! 89 pho ! 869 audpsi ! AudMem          \ 2019-01-05: Y
869 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 870=SEE -- 2018-12-12: lets VisRecog report non-KB direct objects )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: S
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-12: E
   1 t +! 69 pho ! 870 audpsi ! AudMem          \ 2018-12-12: E
870 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

  ( 871 SEEK -- 2018-12-14:  verb pertaining to Volition )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: S
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-01-05: E
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-01-05: E
   1 t +! 75 pho ! 871 audpsi ! AudMem          \ 2019-01-05: K
871 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 872 SEEM -- 2018-12-14: from Wikipedia:Most_common_words_in_English )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: S
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-01-05: E
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-01-05: E
   1 t +! 77 pho ! 872 audpsi ! AudMem          \ 2019-01-05: M
872 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( SELDOM -- 2016aug18: 260 psi ! -- adverb )

  ( SELF -- 2016aug18: 777 psi ! -- reflexive pronoun )

  ( SELFISH -- 2016aug18: 177 psi ! adjective -- prime example of "-ish" ending )

  ( 873 SELL -- 2018-12-14: verb for dative and accusative )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: S
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-01-05: E
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2019-01-05: L
   1 t +! 76 pho ! 873 audpsi ! AudMem          \ 2019-01-05: L
873 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 874 SEND -- 2018-12-14: verb for dative and accusative )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: S
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-01-05: E
   1 t +! 78 pho !   0 audpsi ! AudMem          \ 2019-01-05: N
   1 t +! 68 pho ! 874 audpsi ! AudMem          \ 2019-01-05: D
874 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( SEVERAL -- 2016aug17: 153 psi ! -- adjective for machine reasoning logic )

  ( 577=SEVEN -- 2019-11-05: noun for the haptic sensation of the numeric "7" key )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-11-05: S
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-11-05: E
   1 t +! 86 pho !   0 audpsi ! AudMem          \ 2019-11-05: V
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-11-05: E
   1 t +! 78 pho ! 577 audpsi ! AudMem          \ 2019-11-05: N
577 psi !  5 pos ! 4 dba ! 1 num ! 3 mfn ! KbLoad \ 2019-11-05
 1 t +!  \ 2019-11-05: one blank time-point for sake of AudRecog

  ( 875 SHALL -- 2018-12-14: modal verb )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: S
   1 t +! 72 pho !   0 audpsi ! AudMem          \ 2019-01-05: H
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2019-01-05: A
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2019-01-05: L
   1 t +! 76 pho ! 875 audpsi ! AudMem          \ 2019-01-05: L
875 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: modal verb
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

 ( SHE -- 2016aug18: 719 psi ! -- nominative subject-form of personal pronoun )
   1 t +! 83 pho !     0 audpsi ! AudMem t @ rv ! \ S
   1 t +! 72 pho !     0 audpsi ! AudMem \ H
   1 t +! 69 pho ! 719 audpsi ! AudMem \ E
719 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 1 num !  2 mfn ! 1 dba !   KbLoad  \ 2016aug21: feminine
 1 t +!  \ 2018-09-01

( HERS -- genitive form of personal pronoun; 10nov2012 )
   1 t +! 72 pho !     0 audpsi ! AudMem t @ rv ! \ H
   1 t +! 69 pho !     0 audpsi ! AudMem \ E
   1 t +! 82 pho !     0 audpsi ! AudMem \ R
   1 t +! 83 pho ! 719 audpsi ! AudMem \ S
719 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 1 num !  2 mfn ! 2 dba !    KbLoad  \ 2016aug21: feminine
 1 t +!  \ 2018-09-01

( HER -- dative indirect-object form of pers. pron. 9nov2012 )
   1 t +! 72 pho !     0 audpsi ! AudMem t @ rv ! \ H
   1 t +! 69 pho !     0 audpsi ! AudMem \ E
   1 t +! 82 pho ! 719 audpsi ! AudMem \ R
719 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 1 num !  2 mfn ! 3 dba !   KbLoad  \ 2016aug21: feminine
 1 t +!  \ 2018-09-01

( HER -- accusative direct-object form of pers. pron. 9nov2012 )
   1 t +! 72 pho !     0 audpsi ! AudMem t @ rv ! \ H
   1 t +! 69 pho !     0 audpsi ! AudMem \ E
   1 t +! 82 pho ! 719 audpsi ! AudMem \ R
719 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 1 num !  2 mfn ! 4 dba !   KbLoad  \ 2016aug21: feminine
 1 t +!  \ 2018-09-01

  ( 676=SHORT -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ S
   1 t +! 72 pho !   0 audpsi ! AudMem t @ rv ! \ H
   1 t +! 79 pho !   0 audpsi ! AudMem t @ rv ! \ O
   1 t +! 82 pho !   0 audpsi ! AudMem t @ rv ! \ R
   1 t +! 84 pho ! 676 audpsi ! AudMem          \ T
676 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 876 SHOULD -- 2018-12-14: subjunctive modal verb )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: S
   1 t +! 72 pho !   0 audpsi ! AudMem          \ 2019-01-05: H
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2019-01-05: O
   1 t +! 85 pho !   0 audpsi ! AudMem          \ 2019-01-05: U
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2019-01-05: L
   1 t +! 68 pho ! 876 audpsi ! AudMem          \ 2019-01-05: D
876 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: subjunctive modal verb
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 877 SHOW -- 2018-12-14: verb for dative and accusative )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: S
   1 t +! 72 pho !   0 audpsi ! AudMem          \ 2019-01-05: H
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2019-01-05: O
   1 t +! 87 pho ! 877 audpsi ! AudMem          \ 2019-01-05: W
877 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( SINCE -- 2016aug16: 354 psi ! -- conjunction; also preposition? )  ( 2437 t !  )

  ( 677=SINCE -- 2018-11-16: preposition for EnPrep module; embed later )

  ( SINGULARITY -- 2016aug17: 591 psi ! -- noun associated with AI )

  ( 566=SIX -- 2019-11-05: noun for the haptic sensation of the numeric "6" key )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-11-05: S
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2019-11-05: I
   1 t +! 88 pho ! 566 audpsi ! AudMem          \ 2019-11-05: X
566 psi !  5 pos ! 4 dba ! 1 num ! 3 mfn ! KbLoad \ 2019-11-05
 1 t +!  \ 2019-11-05: one blank time-point for sake of AudRecog

  ( 755=SOMETHING -- 2019-11-05: pronoun default object of verb 823=FEEL )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-11-05: S
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2019-11-05: O
   1 t +! 77 pho !   0 audpsi ! AudMem          \ 2019-11-05: M
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-11-05: E
   1 t +! 84 pho !   0 audpsi ! AudMem          \ 2019-11-05: T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ 2019-11-05: H
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2019-11-05: I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ 2019-11-05: N
   1 t +! 71 pho ! 755 audpsi ! AudMem          \ 2019-11-05: G
755 psi !  7 pos ! 4 dba ! 1 num ! 3 mfn ! KbLoad \ 2019-11-05
 1 t +!  \ 2019-11-05: one blank time-point for sake of AudRecog

  ( 878  SLEEP -- 2018-12-14: verb related to cognition )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: S
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2019-01-05: L
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-01-05: E
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-01-05: E
   1 t +! 80 pho ! 878 audpsi ! AudMem          \ 2019-01-05: P
878 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( SMARTPHONE -- 2016aug17: 547 psi ! -- noun )

  ( 879  SMELL -- 2018-12-14: verb for Sensorium and OlfRecog )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: S
   1 t +! 77 pho !   0 audpsi ! AudMem          \ 2019-01-05: M
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-01-05: E
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2019-01-05: L
   1 t +! 76 pho ! 879 audpsi ! AudMem          \ 2019-01-05: L
879 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( SO -- 2016aug18: 262 psi ! -- adverb )

  ( 358=SO -- 2018-11-23: conjunction  )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ S
   1 t +! 79 pho ! 358 audpsi ! AudMem          \ O
358 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( SOME -- 2016aug15: 123 psi ! -- adjective for machine reasoning logic )

  ( SOON -- 2016aug18: 266 psi ! -- adverb )

  ( SOUL -- 2016aug17: 538 psi ! -- noun )

  ( 880=SPEAK -- 2018-12-12: common verb )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-12-12: S
   1 t +! 80 pho !   0 audpsi ! AudMem          \ 2018-12-12: P
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-12-12: E
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-12-12: A
   1 t +! 75 pho ! 880 audpsi ! AudMem          \ 2018-12-12: K
880 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad  \ 2018-12-12: infinitive
 1 t +!  \ 2018-12-12: one SPACE for AudRecog

  ( STILL -- 2016aug18: 268 psi ! -- adverb )

  ( 881  STOP -- 2018-12-14: verb relevant to Motorium )
   1 t +! 83 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: S
   1 t +! 84 pho !   0 audpsi ! AudMem          \ 2019-01-05: T
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2019-01-05: O
   1 t +! 80 pho ! 881 audpsi ! AudMem          \ 2019-01-05: P
881 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( STUDENT -- 2016aug15: 561 psi ! -- noun for logical inference )

  ( STUFF -- 2016aug15: 596 psi ! -- useful general noun )

  ( SUN -- 2016aug16: 539 psi ! -- noun for prepositions and location )

  ( TABLE -- 2016aug17: 574 psi ! -- noun for preposition and location )

  ( 882  TAKE -- 2018-12-14: from Wikipedia:Most_common_words_in_English )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: T
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2019-01-05: A
   1 t +! 75 pho !   0 audpsi ! AudMem          \ 2019-01-05: K
   1 t +! 69 pho ! 882 audpsi ! AudMem          \ 2019-01-05: E
882 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 883  TASTE -- 2018-12-14: verb for Sensorium and GusRecog )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: T
   1 t +! 65 pho !   0 audpsi ! AudMem          \ 2019-01-05: A
   1 t +! 83 pho !   0 audpsi ! AudMem          \ 2019-01-05: S
   1 t +! 84 pho !   0 audpsi ! AudMem          \ 2019-01-05: T
   1 t +! 69 pho ! 883 audpsi ! AudMem          \ 2019-01-05: E
883 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  1 t +!  \ 2018-09-23: space for sake of AudRecog.
  ( TEACH -- 2018-09-23: verb for Imperative to say TEACH ME SOMETHING. )
  1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-09-23: T
  1 t +! 69 pho !   0 audpsi ! AudMem          \ 2018-09-23: E
  1 t +! 65 pho !   0 audpsi ! AudMem          \ 2018-09-23: A
  1 t +! 67 pho !   0 audpsi ! AudMem          \ 2018-09-23: C
  1 t +! 72 pho ! 884 audpsi ! AudMem          \ 2018-12-12: H
884 psi ! 0 jux ! 8 pos ! 0 dba ! 0 num ! 0 mfn !  \ 2018-12-12
  0 pre ! 0 seq ! 0 tkb !  KbLoad  \ 2018-09-23
  1 t +!  \ 2018-09-23

  ( TELEPHONE -- 2016aug17: 548 psi ! -- noun )

  ( 885  TELL -- 2018-12-14: from Wikipedia:Most_common_words_in_English )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: T
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-01-05: E
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2019-01-05: L
   1 t +! 76 pho ! 885 audpsi ! AudMem          \ 2019-01-05: L
885 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 678=THAN -- 2018-11-12: preposition for EnPrep module )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 78 pho ! 678 audpsi ! AudMem          \ N
678 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( THAT -- 2016aug16: 147 psi ! -- singular adjective )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 84 pho ! 145 audpsi ! AudMem          \ T
145 psi !  1 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 1 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

  ( THAT -- 2018-07-09: 310 psi ! -- conjunction )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 84 pho ! 310 audpsi ! AudMem          \ T 2018-07-09
310 psi !  0 jux ! 3 pos ! 0 dba ! 0 num !  0 mfn !   \ 2018-07-09
  0 pre !  0 seq ! 0 tkb !   KbLoad  \ 2018-07-09: flag-panel order
 1 t +!  \ 2018-09-01

  ( THAT -- 2016aug16: 747 psi ! -- high word-frequency pronoun )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 84 pho ! 745 audpsi ! AudMem          \ T
745 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 1 num !  3 mfn ! 0 dba !   KbLoad  \ 2016aug21: neuter
 1 t +!  \ 2018-09-01

 ( THE -- 2016aug17: 117 psi ! -- indefinite article as an adjective )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho ! 117 audpsi ! AudMem          \ E
117 psi !  1 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 0 num !  0 mfn ! 0 dba !  KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

  ( THEIR -- 2016aug21: 188 psi ! -- poss. adj. for personal pronoun "THEY" )

  ( THEN  --  2016aug18: 270 psi ! -- adverb for machine reasoning logic )

  ( THERE  -- 2016aug21: 274 psi !  --  adv. for discussion of physical location )

  ( THESE -- 2016aug16: 146 psi ! -- plural adjective from THIS )
 1 t +!  \ 2018-09-01

  ( THEY -- 2016aug18: 743 psi ! -- nominative subject-form of pers. pronoun )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 89 pho ! 743 audpsi ! AudMem          \ Y
743 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 3 num !  0 mfn ! 1 dba !  KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

(  THEIRS -- 2016aug21: genitive form of personal pronoun )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 83 pho ! 743 audpsi ! AudMem          \ S
743 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 2 num !  0 mfn ! 2 dba !  KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

( THEM -- 2016aug21: dative indirect-object form of pers. pron. )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 77 pho ! 743 audpsi ! AudMem          \ M
743 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 2 num !  0 mfn ! 3 dba !  KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

( THEM --  2016aug21: acc. direct-object form of pers. pron. )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 77 pho ! 743 audpsi ! AudMem          \ M
743 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 2 num !  0 mfn ! 4 dba !  KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

 ( 586=THING -- 2018-11-24: useful general noun )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 71 pho ! 586 audpsi ! AudMem          \ G
   586 psi ! 5 pos ! 1 num ! 3 mfn ! 0 dba ! KbLoad \ 2018-11-24
 1 t +!  \ 2018-11-24: one blank time-point for sake of AudRecog

  ( 886=THINK -- 2018-12-12: verb germane to artificial intelligence )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ 2018-06-24: T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ 2018-06-24: H
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2018-06-24: I
   1 t +! 78 pho !   0 audpsi ! AudMem          \ 2018-06-24: N
   1 t +! 75 pho ! 886 audpsi ! AudMem          \ 2018-12-12: K
886 psi ! 0 jux ! 8 pos ! 0 dba ! 0 num ! 0 mfn !  \ 2018-12-12
  0 pre ! 0 seq ! 0 tkb !  KbLoad  \ 2018-06-24
 1 t +!  \ 2018-09-01

  ( THIS -- 2016aug16: 147 psi ! -- singular adjective )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 83 pho ! 145 audpsi ! AudMem          \ S
147 psi !  1 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 1 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

  ( THIS -- 2016aug16: 745 psi ! -- singular pronoun; keep 746 in reserve for plural )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv !  \ T
   1 t +! 72 pho !   0 audpsi ! AudMem           \ H
   1 t +! 73 pho !   0 audpsi ! AudMem           \ I
   1 t +! 83 pho ! 747 audpsi ! AudMem           \ S
747 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 1 num !  3 mfn ! 0 dba !   KbLoad  \ 2016aug21: neuter
 1 t +!  \ 2018-09-01

  ( THESE -- 2016aug21: 146 psi !  -- plural adjective )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 69 pho ! 147 audpsi ! AudMem          \ E
147 psi !  1 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 2 num !  0 mfn ! 0 dba ! KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

  ( THOSE -- 2016aug21: 145 psi ! -- plural adjective from 745=THAT )
   1 t +! 84 pho !     0 audpsi ! AudMem t @ rv !  \ T
   1 t +! 72 pho !     0 audpsi ! AudMem \ H
   1 t +! 79 pho !     0 audpsi ! AudMem \ O
   1 t +! 83 pho !     0 audpsi ! AudMem \ S
   1 t +! 69 pho ! 145 audpsi ! AudMem \ E
145 psi !  1 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 2 num !  0 mfn ! 0 dba !  KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

  ( 363=THOUGH -- 2018-11-23: conjunction )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 81 pho !   0 audpsi ! AudMem          \ O
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 71 pho !   0 audpsi ! AudMem          \ G
   1 t +! 72 pho ! 363 audpsi ! AudMem          \ H
363 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 583=THREE -- 2019-11-05: noun for the haptic sensation of the numeric "3" key )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-11-05: T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ 2019-11-05: H
   1 t +! 82 pho !   0 audpsi ! AudMem          \ 2019-11-05: R
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-11-05: E
   1 t +! 69 pho ! 583 audpsi ! AudMem          \ 2019-11-05: E
583 psi !  5 pos ! 4 dba ! 1 num ! 3 mfn ! KbLoad \ 2019-11-05
 1 t +!  \ 2019-11-05: one blank time-point for sake of AudRecog

  ( 679=THROUGH -- 2018-11-12: preposition for EnPrep module )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 71 pho !   0 audpsi ! AudMem          \ G
   1 t +! 72 pho ! 679 audpsi ! AudMem          \ H
679 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 680=THROUGHOUT -- 2018-11-12: preposition for EnPrep module )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 71 pho !   0 audpsi ! AudMem          \ G
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 84 pho ! 680 audpsi ! AudMem          \ T
680 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 681=THRU -- 2018-11-12: abbreviation of preposition for EnPrep module )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 85 pho ! 681 audpsi ! AudMem          \ U
681 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 682=TILL -- 2018-11-23: preposition for EnPrep module )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 76 pho !   0 audpsi ! AudMem          \ L
   1 t +! 76 pho ! 682 audpsi ! AudMem          \ L
682 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 366=TILL -- 2018-11-23: conjunction )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 76 pho !   0 audpsi ! AudMem          \ L
   1 t +! 76 pho ! 366 audpsi ! AudMem          \ L
366 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 683=TO -- 2018-11-12: preposition for EnPrep module )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv !  \ T
   1 t +! 79 pho ! 682 audpsi ! AudMem           \ O
682 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
 0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug24
 1 t +!  \ 2018-09-01

  ( TODAY -- 2016aug18: 278 psi ! -- adverb )

  ( 887  TOLD -- 2019-01-05: past tense of 887=TELL )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: T
   1 t +! 81 pho !   0 audpsi ! AudMem          \ 2019-01-05: O
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2019-01-05: L
   1 t +! 68 pho ! 887 audpsi ! AudMem          \ 2019-01-05: D
887 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: simple past
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( TOMORROW -- 2016aug18: 282 psi ! -- adverb )

  ( TONIGHT -- 2016aug18: 284 psi ! -- adverb )

  ( TOO -- 2016aug19: 285 psi !  -- adverb )

  ( 888  TOUCH -- 2018-12-14: verb for Sensorium and TacRecog )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: T
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2019-01-05: O
   1 t +! 85 pho !   0 audpsi ! AudMem          \ 2019-01-05: U
   1 t +! 67 pho !   0 audpsi ! AudMem          \ 2019-01-05: C
   1 t +! 72 pho ! 888 audpsi ! AudMem          \ 2019-01-05: H
888 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 684=TOWARD -- 2018-11-12: preposition for EnPrep module )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 67 pho !   0 audpsi ! AudMem          \ W
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 62 pho !   0 audpsi ! AudMem          \ R
   1 t +! 68 pho ! 684 audpsi ! AudMem          \ D
684 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 685=TOWARDS -- 2018-11-12: preposition for EnPrep module )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 67 pho !   0 audpsi ! AudMem          \ W
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 62 pho !   0 audpsi ! AudMem          \ R
   1 t +! 68 pho !   0 audpsi ! AudMem          \ D
   1 t +! 83 pho ! 685 audpsi ! AudMem          \ S
685 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( TRUE -- 2016aug16: 181 psi ! -- adjective )

  ( 889  TRY -- 2018-12-14: from Wikipedia:Most_common_words_in_English )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: T
   1 t +! 82 pho !   0 audpsi ! AudMem          \ 2019-01-05: R
   1 t +! 89 pho ! 889 audpsi ! AudMem          \ 2019-01-05: Y
889 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( TRUTH -- 2016aug16: 581 psi ! -- noun )

  ( 891  TURN -- 2018-12-14: verb for robotics )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: T
   1 t +! 85 pho !   0 audpsi ! AudMem          \ 2019-01-05: U
   1 t +! 82 pho !   0 audpsi ! AudMem          \ 2019-01-05: R
   1 t +! 78 pho ! 891 audpsi ! AudMem          \ 2019-01-05: N
891 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 582=TWO -- 2019-11-05: noun for the haptic sensation of the numeric "2" key )
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-11-05: T
   1 t +! 87 pho !   0 audpsi ! AudMem          \ 2019-11-05: W
   1 t +! 79 pho ! 582 audpsi ! AudMem          \ 2019-11-05: O
582 psi !  5 pos ! 4 dba ! 1 num ! 3 mfn ! KbLoad \ 2019-11-05
 1 t +!  \ 2019-11-05: one blank time-point for sake of AudRecog

  ( 686= UNDER -- 2018-11-12: preposition for EnPrep module )
   1 t +! 85 pho !   0 audpsi ! AudMem t @ rv !  \ U
   1 t +! 78 pho !   0 audpsi ! AudMem           \ N
   1 t +! 68 pho !   0 audpsi ! AudMem           \ D
   1 t +! 69 pho !   0 audpsi ! AudMem           \ E
   1 t +! 82 pho ! 686 audpsi ! AudMem           \ R
686 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
  0 num !  0 mfn ! 0 dba !  KbLoad  \ 2016aug24
 1 t +!  \ 2018-09-01

  ( 687=UNDERNEATH -- 2018-11-12: preposition for EnPrep module )
   1 t +! 85 pho !   0 audpsi ! AudMem t @ rv ! \ U
   1 t +! 78 pho !   0 audpsi ! AudMem t @ rv ! \ N
   1 t +! 68 pho !   0 audpsi ! AudMem t @ rv ! \ D
   1 t +! 69 pho !   0 audpsi ! AudMem t @ rv ! \ E
   1 t +! 82 pho !   0 audpsi ! AudMem t @ rv ! \ R
   1 t +! 78 pho !   0 audpsi ! AudMem t @ rv ! \ N
   1 t +! 69 pho !   0 audpsi ! AudMem t @ rv ! \ E
   1 t +! 65 pho !   0 audpsi ! AudMem t @ rv ! \ A
   1 t +! 84 pho !   0 audpsi ! AudMem t @ rv ! \ T
   1 t +! 72 pho ! 687 audpsi ! AudMem          \ H
687 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 892=UNDERSTAND -- 2018-12-12: verb germane to AI )
   1 t +! 85 pho !   0 audpsi ! AudMem t @ rv !  \ U
   1 t +! 78 pho !   0 audpsi ! AudMem \ N
   1 t +! 68 pho !   0 audpsi ! AudMem \ D
   1 t +! 69 pho !   0 audpsi ! AudMem \ E
   1 t +! 82 pho !   0 audpsi ! AudMem \ R
   1 t +! 83 pho !   0 audpsi ! AudMem \ S
   1 t +! 84 pho !   0 audpsi ! AudMem \ T
   1 t +! 65 pho !   0 audpsi ! AudMem \ A
   1 t +! 78 pho !   0 audpsi ! AudMem \ N
   1 t +! 68 pho ! 892 audpsi ! AudMem \ D
892 psi !  8 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2018-12-12
 0 num !  0 mfn ! 0 dba !  KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

  ( 369=UNLESS -- 2018-11-23: conjunction )
   1 t +! 88 pho !   0 audpsi ! AudMem t @ rv ! \ U
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 76 pho !   0 audpsi ! AudMem          \ L
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 83 pho ! 369 audpsi ! AudMem          \ S
369 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 688=UNLIKE -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 85 pho !   0 audpsi ! AudMem t @ rv ! \ U
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 76 pho !   0 audpsi ! AudMem          \ L
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 75 pho !   0 audpsi ! AudMem          \ K
   1 t +! 69 pho ! 688 audpsi ! AudMem          \ E
688 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 689=UNTIL -- 2018-11-12: preposition for EnPrep module )
   1 t +! 85 pho !   0 audpsi ! AudMem t @ rv ! \ U
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 76 pho ! 689 audpsi ! AudMem          \ L
689 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 372=UNTIL -- 2018-11-23: conjunction )
   1 t +! 85 pho !   0 audpsi ! AudMem t @ rv ! \ U
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 76 pho ! 372 audpsi ! AudMem          \ L
372 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 690=UNTO -- 2018-11-12: preposition for EnPrep module )
   1 t +! 85 pho !   0 audpsi ! AudMem t @ rv ! \ U
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 81 pho ! 690 audpsi ! AudMem          \ O
690 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 691=UP -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 85 pho !   0 audpsi ! AudMem t @ rv ! \ U
   1 t +! 80 pho ! 691 audpsi ! AudMem          \ P
691 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 692=UPON -- 2018-11-12: preposition for EnPrep module )
   1 t +! 85 pho !   0 audpsi ! AudMem t @ rv ! \ U
   1 t +! 80 pho !   0 audpsi ! AudMem          \ P
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 82 pho ! 692 audpsi ! AudMem          \ N
692 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 693=UPSIDE -- 2018-11-12: preposition for EnPrep module )
   1 t +! 85 pho !   0 audpsi ! AudMem t @ rv ! \ U
   1 t +! 80 pho !   0 audpsi ! AudMem          \ P
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 68 pho !   0 audpsi ! AudMem          \ D
   1 t +! 69 pho ! 693 audpsi ! AudMem          \ E
693 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 893 USE -- 2018-12-14: from Wikipedia:Most_common_words_in_English )
   1 t +! 85 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: U
   1 t +! 83 pho !   0 audpsi ! AudMem          \ 2019-01-05: S
   1 t +! 69 pho ! 893 audpsi ! AudMem          \ 2019-01-05: E
893 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 694=VERSUS -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 86 pho !   0 audpsi ! AudMem t @ rv ! \ V
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 83 pho !   0 audpsi ! AudMem          \ S
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 83 pho ! 694 audpsi ! AudMem          \ S
694 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( VERY -- 2016aug18: 286 psi ! -- adverb )

  ( 695=VIA -- 2018-11-12: as a preposition for EnPrep module )
   1 t +! 86 pho !   0 audpsi ! AudMem t @ rv ! \ V
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 65 pho ! 695 audpsi ! AudMem          \ A
695 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 696=VIS-A-VIS -- 2018-11-12: as a preposition for EnPrep module )

  ( 895=WANT -- 2018-12-12: dba=0 infinitive for sake of logical inference )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv !    \ W
   1 t +! 65 pho !   0 audpsi ! AudMem \ 2018-10-19: A
   1 t +! 78 pho !   0 audpsi ! AudMem \ 2018-10-19: N
   1 t +! 84 pho ! 895 audpsi ! AudMem \ 2018-10-19: T
895 psi !  8 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2018-12-12
 0 num !  0 mfn ! 0 dba !   KbLoad  \ 2018-10-19
 1 t +!  \ 2018-10-19: blank space for sake of AudRecog.

  ( WE -- 2016aug18: 731 psi ! -- nominative subject-form of personal pronoun )
   1 t +! 87 pho !     0 audpsi ! AudMem t @ rv !  \ W
   1 t +! 69 pho ! 731 audpsi ! AudMem \ E
731 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 2 num !  0 mfn ! 1 dba !  KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

( OURS -- 2016aug21: genitive form of personal pronoun )
   1 t +! 79 pho ! 0 audpsi ! AudMem t @ rv ! \ O
   1 t +! 85 pho ! 0 audpsi ! AudMem \ U
   1 t +! 82 pho ! 0 audpsi ! AudMem \ R
   1 t +! 83 pho ! 731 audpsi ! AudMem \ S
731 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 2 num !  0 mfn ! 2 dba !  KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

( US -- 2016aug21: dative indirect-object form of pers. pron. )
   1 t +! 85 pho ! 0 audpsi ! AudMem t @ rv ! \ U
   1 t +! 83 pho ! 731 audpsi ! AudMem \ S
731 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 2 num !  0 mfn ! 3 dba !  KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

( US -- 2016aug21: accusative direct-object form of pers. pron. )
   1 t +! 85 pho ! 0 audpsi ! AudMem t @ rv ! \ U
   1 t +! 83 pho ! 731 audpsi ! AudMem \ S
731 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 2 num !  0 mfn ! 4 dba !  KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

  ( WEB -- 2016aug16: 562 psi ! -- noun for prepositions and location )

  ( WELL -- 2016aug18: 290 psi ! -- adverb )

  ( WET -- 2016aug16: 183 psi ! -- adjective, because 583=WATER )
 1 t +!  \ 2018-09-01

  ( WHAT -- 2016aug18: 781 psi ! -- nominative pronoun for SelfReferentialThought )
   1 t +! 87 pho !     0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 72 pho !     0 audpsi ! AudMem \ H
   1 t +! 65 pho !     0 audpsi ! AudMem \ A
   1 t +! 84 pho ! 781 audpsi ! AudMem \ T
781 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 1 num !  3 mfn ! 1 dba !   KbLoad  \ 2016aug21: neuter
 1 t +!  \ 2018-09-01

  ( WHAT -- 2016aug21: 781 psi ! -- accusative pronoun for SelfReferentialThought )
   1 t +! 87 pho !     0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 72 pho !     0 audpsi ! AudMem \ H
   1 t +! 65 pho !     0 audpsi ! AudMem \ A
   1 t +! 84 pho ! 781 audpsi ! AudMem \ T
781 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 1 num !  3 mfn ! 4 dba !   KbLoad  \ 2016aug21: neuter
 1 t +!  \ 2018-09-01

  ( WHEN  -- 2016aug18: 294 psi !  -- adverb for SelfReferentialThought )

  ( 375=WHEN -- 2018-11-23: conjunction )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 78 pho ! 375 audpsi ! AudMem          \ N
375 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 378=WHENEVER -- 2018-11-23: conjunction )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 78 pho !   0 audpsi ! AudMem          \ N
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 86 pho !   0 audpsi ! AudMem          \ V
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 82 pho ! 378 audpsi ! AudMem          \ R
378 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 245=WHERE -- 2018-11-15: adverb for SelfReferentialThought )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 69 pho ! 245 audpsi ! AudMem          \ E
245 psi !  2 pos !  KbLoad  \ 2018-11-15
   1 t +!  \ 2018-11-15: space for the sake of AudRecog

  ( 381=WHEREAS -- 2018-11-23: conjunction )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 82 pho !   0 audpsi ! AudMem          \ R
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 65 pho !   0 audpsi ! AudMem          \ A
   1 t +! 83 pho ! 381 audpsi ! AudMem          \ S
381 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 384=WHETHER -- 2018-11-23: conjunction )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 69 pho !   0 audpsi ! AudMem          \ E
   1 t +! 82 pho ! 384 audpsi ! AudMem          \ R
384 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 387=WHILE -- 2018-11-23: conjunction )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 76 pho !   0 audpsi ! AudMem          \ L
   1 t +! 69 pho ! 387 audpsi ! AudMem          \ E
387 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( WHO -- 2016aug18:  791 psi ! -- interrogative pronoun for SelfReferentialThought )
   1 t +! 87 pho !     0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 72 pho !     0 audpsi ! AudMem \ H
   1 t +! 79 pho ! 791 audpsi ! AudMem \ O
791 psi !  7 pos ! 1 dba !  KbLoad  \ 2019-01-15: nominative subject form
 1 t +!  \ 2018-09-01

  ( WHOSE -- 2016aug18:  791 psi ! -- possessive interrogative pronoun )
   1 t +! 87 pho ! 0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 72 pho ! 0 audpsi ! AudMem \ H
   1 t +! 83 pho ! 0 audpsi ! AudMem \ O
   1 t +! 83 pho ! 0 audpsi ! AudMem \ S
   1 t +! 69 pho ! 791 audpsi ! AudMem \ E
791 psi !  7 pos ! 1 num !  0 mfn ! 2 dba ! KbLoad  \ 2019-01-15: possessive form
 1 t +!  \ 2018-09-01

  ( WHOM -- 2016aug18:  791 psi ! -- dative interrogative pronoun )
   1 t +! 87 pho ! 0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 72 pho ! 0 audpsi ! AudMem \ H
   1 t +! 79 pho ! 0 audpsi ! AudMem \ O
   1 t +! 77 pho ! 791 audpsi ! AudMem \ M
791 psi !  7 pos ! 3 dba !  KbLoad  \ 2019-01-15: dative indirect-object form
 1 t +!  \ 2018-09-01

  ( WHOM -- 2016aug18:  791 psi ! -- accusative interrogative pronoun )
   1 t +! 87 pho ! 0 audpsi ! AudMem t @ rv !  \ W
   1 t +! 72 pho ! 0 audpsi ! AudMem \ H
   1 t +! 79 pho ! 0 audpsi ! AudMem \ O
   1 t +! 77 pho ! 791 audpsi ! AudMem \ M
791 psi !  7 pos ! 1 num ! 4 dba !  KbLoad  \ 2019-01-15: accusative direct-object
 1 t +!  \ 2018-09-01

  ( WHY -- 2016aug18: 297 psi ! -- adverb for asking questions )

  ( 390=WHY -- 2018-11-23: conjunction for machine reasoning logic )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 89 pho ! 390 audpsi ! AudMem          \ Y
390 psi !  3 pos !    KbLoad  \ 2018-11-23: flag-panel
 1 t +!  \ 2018-11-23: one blank time-point for sake of AudRecog

  ( 896 WILL -- 2018-12-14: auxiliary modal verb )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: W
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2019-01-05: I
   1 t +! 76 pho !   0 audpsi ! AudMem          \ 2019-01-05: L
   1 t +! 76 pho ! 896 audpsi ! AudMem          \ 2019-01-05: L
896 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: modal verb
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 897 WISH -- 2018-12-14: verb for Volition )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: W
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2019-01-05: I
   1 t +! 83 pho !   0 audpsi ! AudMem          \ 2019-01-05: S
   1 t +! 72 pho ! 897 audpsi ! AudMem          \ 2019-01-05: H
897 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 697=WITH -- 2018-11-12: preposition for EnPrep module )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 72 pho ! 697 audpsi ! AudMem          \ H
697 psi !  6 pos ! 0 jux !   0 pre ! 0 tkb ! 0 seq !
 0 num !  0 mfn ! 0 dba !   KbLoad  \ 2016aug24
 1 t +!  \ 2018-09-01

  ( 698=WITHIN -- 2018-11-12: preposition for EnPrep module )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 78 pho ! 698 audpsi ! AudMem          \ N
698 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( 699=WITHOUT -- 2018-11-12: preposition for EnPrep module )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 73 pho !   0 audpsi ! AudMem          \ I
   1 t +! 84 pho !   0 audpsi ! AudMem          \ T
   1 t +! 72 pho !   0 audpsi ! AudMem          \ H
   1 t +! 79 pho !   0 audpsi ! AudMem          \ O
   1 t +! 85 pho !   0 audpsi ! AudMem          \ U
   1 t +! 84 pho ! 699 audpsi ! AudMem          \ T
699 psi !  6 pos !  KbLoad  \ 2018-11-16
   1 t +!  \ 2018-11-16: space for the sake of AudRecog

  ( WOMAN -- 2018-06-21: -- always feminine noun for use with gender flags )
   1 t +! 87 pho !    0 audpsi ! AudMem t @ rv ! \ W
   1 t +! 79 pho !    0 audpsi ! AudMem \ O
   1 t +! 77 pho !    0 audpsi ! AudMem \ M
   1 t +! 65 pho !    0 audpsi ! AudMem \ A
   1 t +! 78 pho !  515 audpsi ! AudMem \ N
515 psi !  0 jux !  5 pos !  1 dba !    1 num !          \ 2018-06-21
  2 mfn !  0 pre !  0 seq !  0 tkb !   KbLoad  \ 2019-09-28
 1 t +!  \ 2018-09-01

  ( WORK -- 2016aug15: 588 psi ! -- noun associated with the verb )

  ( 898 WORK -- 2018-12-14: verb from Wikipedia:Most_common_words_in_English )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-01-05: W
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2019-01-05: O
   1 t +! 82 pho !   0 audpsi ! AudMem          \ 2019-01-05: R
   1 t +! 75 pho ! 898 audpsi ! AudMem          \ 2019-01-05: K
898 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-01-05: infinitive
   1 t +!  \ 2019-01-05: one SPACE for AudRecog

  ( 899=WORSHIP -- 2019-10-26: useful verb for discussion of theology )
   1 t +! 87 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-10-26: W
   1 t +! 79 pho !   0 audpsi ! AudMem          \ 2019-10-26: O
   1 t +! 82 pho !   0 audpsi ! AudMem          \ 2019-10-26: R
   1 t +! 83 pho !   0 audpsi ! AudMem          \ 2019-10-26: S
   1 t +! 72 pho !   0 audpsi ! AudMem          \ 2019-10-26: H
   1 t +! 73 pho !   0 audpsi ! AudMem          \ 2019-10-26: I
   1 t +! 80 pho ! 899 audpsi ! AudMem          \ 2019-10-26: P
899 psi ! 8 pos ! 0 dba ! 0 num ! KbLoad \ 2019-10-26: verb
   1 t +!  \ 2019-10-26: one blank time-point for sake of AudRecog

  ( WORSE -- 2016aug16: 105 psi ! -- comparative adjective of 104=BAD )

  ( WORST -- 2016aug16: 106 psi ! -- superlative adjective of 104=BAD )

  ( WORTH -- 2016aug18:  696 psi ! -- preposition for EnPrep module )
 1 t +!  \ 2018-09-01

  ( YES -- 2016aug15: 432 psi ! -- interjection for human-computer interaction )
 1 t +! 89 pho !   0 audpsi ! AudMem t @ rv ! \ Y
 1 t +! 69 pho !   0 audpsi ! AudMem \ E
 1 t +! 83 pho ! 432 audpsi ! AudMem \ S
432 psi ! 0 jux ! 4 pos !   0 dba ! 0 num ! 0 mfn !  \ 2018-06-24
  0 pre ! 0 seq ! 0 tkb ! KbLoad  \ 2018-06-24
 1 t +!  \ 2018-09-01

  ( YESTERDAY -- 2016aug18: 298 psi ! -- adverb )
 1 t +!  \ 2018-09-01

( YOU -- 2016aug21: nominative singular of personal pronoun )
 1 t +! 89 pho !     0 audpsi ! AudMem t @ rv ! \ Y
 1 t +! 79 pho !     0 audpsi ! AudMem \ O
 1 t +! 85 pho ! 707 audpsi ! AudMem \ U
707 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 1 num !  0 mfn ! 1 dba ! KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

( YOURS -- 2016aug21: genitive singular of personal pronoun )
 1 t +! 89 pho !     0 audpsi ! AudMem t @ rv !  \ Y
 1 t +! 79 pho !     0 audpsi ! AudMem \ O
 1 t +! 85 pho !     0 audpsi ! AudMem \ U
 1 t +! 82 pho !     0 audpsi ! AudMem \ R
 1 t +! 83 pho ! 707 audpsi ! AudMem \ S
707 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 1 num !  0 mfn ! 2 dba !  KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

( YOU -- 2016aug21: dative singular of personal pronoun )
 1 t +! 89 pho !     0 audpsi ! AudMem t @ rv ! \ Y
 1 t +! 79 pho !     0 audpsi ! AudMem \ O
 1 t +! 85 pho ! 707 audpsi ! AudMem \ U
707 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 1 num !  0 mfn ! 3 dba !  KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

( YOU -- 2016aug21: accusative singular of personal pronoun )
 1 t +! 89 pho !     0 audpsi ! AudMem t @ rv ! \ Y
 1 t +! 79 pho !     0 audpsi ! AudMem \ O
 1 t +! 85 pho ! 707 audpsi ! AudMem \ U
707 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 1 num !  0 mfn ! 4 dba !  KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

( YOU -- 2016aug21: nominative plural of personal pronoun )
 1 t +! 89 pho !     0 audpsi ! AudMem t @ rv ! \ Y
 1 t +! 79 pho !     0 audpsi ! AudMem \ O
 1 t +! 85 pho ! 737 audpsi ! AudMem \ U
737 psi !  7 pos ! 0 jux ! 0 pre ! 0 tkb ! 0 seq !  \ 2016aug21
 2 num !  0 mfn ! 1 dba !   KbLoad  \ 2016aug21
 1 t +!  \ 2018-09-01

( YOURS -- 2016aug21: genitive plural of personal pronoun )
 1 t +! 89 pho !   0 audpsi ! AudMem t @ rv ! \ Y
 1 t +! 79 pho !   0 audpsi ! AudMem          \ O
 1 t +! 85 pho !   0 audpsi ! AudMem          \ U
 1 t +! 82 pho !   0 audpsi ! AudMem          \ R
 1 t +! 83 pho ! 737 audpsi ! AudMem          \ S
737 psi !  7 pos !    2 dba ! 2 num ! KbLoad  \ 2018-09-01
 1 t +!  \ 2018-09-01

( YOU -- 2016aug21: dative plural of personal pronoun )
 1 t +! 89 pho !   0 audpsi ! AudMem t @ rv ! \ Y
 1 t +! 79 pho !   0 audpsi ! AudMem          \ O
 1 t +! 85 pho ! 737 audpsi ! AudMem          \ U
737 psi !  7 pos !    3 dba ! 2 num ! KbLoad  \ 2018-09-01
 1 t +!  \ 2018-09-01

( YOU -- 2016aug24: accusative plural of personal pronoun )
 1 t +! 89 pho !   0 audpsi ! AudMem t @ rv ! \ Y
 1 t +! 79 pho !   0 audpsi ! AudMem          \ O
 1 t +! 85 pho ! 737 audpsi ! AudMem          \ U
737 psi !  7 pos !    4 dba ! 2 num ! KbLoad  \ 2018-09-01
 1 t +!  \ 2018-09-01
 1 t +!  \ 2016aug21: unitary gap after t=3000

  ( YOUNG #191 -- 2019-10-14: adjective )
 1 t +! 89 pho !   0 audpsi ! AudMem t @ rv ! \ Y
 1 t +! 79 pho !   0 audpsi ! AudMem          \ O
 1 t +! 85 pho !   0 audpsi ! AudMem          \ U
 1 t +! 78 pho !   0 audpsi ! AudMem          \ N
 1 t +! 71 pho ! 191 audpsi ! AudMem          \ G
191 psi !             1 pos ! KbLoad \ 2019-10-14
 1 t +!  \ 2018-09-01

  ( YOUR -- 2016aug16: 107 psi ! -- sing. poss. adj. of 707=YOU pronoun )
 1 t +! 89 pho !   0 audpsi ! AudMem t @ rv ! \ Y
 1 t +! 79 pho !   0 audpsi ! AudMem          \ O
 1 t +! 85 pho !   0 audpsi ! AudMem          \ U
 1 t +! 82 pho ! 107 audpsi ! AudMem          \ R
107 psi !             1 pos ! KbLoad \ 2018-09-01
 1 t +!  \ 2018-09-01

  ( YOUR -- 2016aug18: 137 psi ! -- plural poss. adj. of 737=YOU pronoun )
 1 t +! 89 pho !   0 audpsi ! AudMem t @ rv ! \ Y
 1 t +! 79 pho !   0 audpsi ! AudMem          \ O
 1 t +! 85 pho !   0 audpsi ! AudMem          \ U
 1 t +! 82 pho ! 137 audpsi ! AudMem          \ R
137 psi !             1 pos ! KbLoad \ 2018-09-01
 1 t +!  \ 2018-09-01

  ( 590=ZERO -- 2019-11-05: noun for the haptic sensation of the numeric "0" key )
   1 t +! 90 pho !   0 audpsi ! AudMem t @ rv ! \ 2019-11-05: Z
   1 t +! 69 pho !   0 audpsi ! AudMem          \ 2019-11-05: E
   1 t +! 82 pho !   0 audpsi ! AudMem          \ 2019-11-05: R
   1 t +! 79 pho ! 590 audpsi ! AudMem          \ 2019-11-05: O
590 psi !  5 pos ! 4 dba ! 1 num ! 3 mfn ! KbLoad \ 2019-11-05
 1 t +!  \ 2019-11-05: one blank time-point for sake of AudRecog

  0 audpsi !  \ 2016JUL28: prevent carry-over after AudMem.
  3001 nxt !  \ 2016JUL29:
  t @ vault ! \ 2018-09-01: dynamically calculated by incremental t++
  CR ." MindBoot time-point vault = " vault @ . ." cns = " cns @ . ." fyi= " fyi @ .
  0 oldpsi !  \ 2016JUL28: prevent carry-over after KbLoad.
  0 psi !  \ 2016JUL28: prevent carry-over after KbLoad.
  0 pho !  \ 2016JUL26: Prevent carry-over of value.
; \ 2017-09-30: MindBoot returns to MainLoop.


:  ReJuvenate ( http://ai.neocities.org/ReJuvenate.html )
  CR ." ReJuvenate has been called. "   \ 2016sep06: TEST
  CR 1 rjc +!   \ 2016sep06: from old 24jul14A.F MindForth
  ." Please wait as memories migrate in ReJuvenate cycle #"
  rjc @ . CR   \ 2016sep06: from old 24jul14A.F MindForth
  t @ 2 +  coda @ vault @ +  DO     \ 2016sep06: from 24jul14A.F MindForth
    I  jrt !                                \ 2016sep06: from old 24jul14A.F MindForth
    jrt @  coda @ -  jrt !           \ 2016sep06: from old 24jul14A.F MindForth
    edge @ 1 = IF                   \ 2016sep06: from old 24jul14A.F MindForth
      I 0 psy{ @  jrt @  0 psy{ !  0 I 0 psy{ !   \ 2017jun15: tru truth-value
      I 1 psy{ @  jrt @  1 psy{ !  0 I 1 psy{ !   \ 2017jun15: psi concept number
      I 2 psy{ @  jrt @  2 psy{ !  0 I 2 psy{ !   \ 2017jun15: hcl human language code
      I 3 psy{ @  jrt @  3 psy{ !  0 I 3 psy{ !   \ 2017jun15: act activation-level
      I 4 psy{ @  jrt @  4 psy{ !  0 I 4 psy{ !   \ 2017jun15: mtx machine-translation xfer
      I 5 psy{ @  jrt @  5 psy{ !  0 I 5 psy{ !   \ 2017jun15: jux such as 250=NOT
      I 6 psy{ @  jrt @  6 psy{ !  0 I 6 psy{ !   \ 2017jun15: pos part-of-speech
      I 7 psy{ @  jrt @  7 psy{ !  0 I 7 psy{ !   \ 2017jun15: dba case or verb-person
      I 8 psy{ @  jrt @  8 psy{ !  0 I 8 psy{ !   \ 2017jun15: num grammatical number
      I 9 psy{ @  jrt @  9 psy{ !  0 I 9 psy{ !   \ 2017jun15: mfn male/female/neuter
      I 10 psy{ @  jrt @ 10 psy{ !  0 I 10 psy{ !   \ 2017jun15: pre previous concept
      I 11 psy{ @  jrt @ 11 psy{ !  0 I 11 psy{ !   \ 2019-09-29: seq subSEQuent concept
      I 12 psy{ @  jrt @ 12 psy{ !  0 I 12 psy{ !   \ 2019-09-29: tgn time-of-genitive
      I 13 psy{ @  jrt @ 13 psy{ !  0 I 13 psy{ !   \ 2019-09-29: tdt time-of-dative
      \ 2016sep06: Next lines adjusts tkb by minus-coda;
      I 14 psy{  @  0 > IF  \ 2019-09-29: if there is a positive tkb value...
        I  14 psy{ @ coda @ -  jrt @ 14 psy{ !  0 I 14 psy{ !  \ 2019-09-29: keep tkb valid.
      ELSE     \ 2016sep06: if there is no tkb value...
       0 I 14 psy{ !   \ 2019-09-29: zero out the tkb value.
      THEN   \ 2016sep06: end of test for a positive tkb value.
      I 15 psy{ @  jrt @ 15 psy{ !  0 I 15 psy{ !   \ 2019-09-29: tia time-of-ablative
      I 16 psy{ @  jrt @ 16 psy{ !  0 I 16 psy{ !   \ 2019-09-29: tcj time-of-conjunction
      I 17 psy{ @  jrt @ 17 psy{ !  0 I 17 psy{ !   \ 2019-09-29: tdj time-of-adjective
      I 18 psy{ @  jrt @ 18 psy{ !  0 I 18 psy{ !   \ 2019-09-29: tdv time-of-adverb
      I 19 psy{ @  jrt @ 19 psy{ !  0 I 19 psy{ !   \ 2019-09-29: tpr time-of-preposition
      I 20 psy{ @  psi20 !                    \ 2019-09-29: time of recall-vector rv
      psi20 @  vault @ < IF                  \ 2019-09-29: if longer than MindBoot...
          psi20 @  jrt @  20 psy{ !  0 I 20 psy{ !  THEN  \ 2019-09-20
          psi20 @  coda @  vault @ +  > IF      \ 2019-09-29
          psi20 @  coda @ -  jrt @ 20 psy{ !      \ 2019-09-29: rv recall-vector
        THEN               0 I 20 psy{ !  \ 2019-09-29: blank out auditory recall-vector
    THEN          \ 2016sep06: from old 24jul14A.F MindForth
    edge @  1 = IF            \ 2016sep06: from old 24jul14A.F MindForth
      I 0 ear{ @  jrt @  0 ear{ !  \ 2016sep06: from old 24jul14A.F MindForth
      I 1 ear{ @  jrt @  1 ear{ !  \ 2016sep06: from old 24jul14A.F MindForth
      I 2 ear{ @  jrt @  2 ear{ !  \ 2016sep06: from old 24jul14A.F MindForth
      fyi @ 0 > IF         \ 2016sep06: from old 24jul14A.F MindForth
        jrt @  0 ear{ @ EMIT  \ 2016sep06: from old 24jul14A.F MindForth
     THEN                  \ 2016sep06: from old 24jul14A.F MindForth
    THEN                   \ 2016sep06: from old 24jul14A.F MindForth
    edge @ 0 = IF      \ 2016sep06: from old 24jul14A.F MindForth
     32 jrt @ 0 ear{ !  \ 2016sep06: from old 24jul14A.F MindForth
      0 jrt @ 1 ear{ !   \ 2016sep06: from old 24jul14A.F MindForth
            I 0 ear{ @    13 = IF  1 edge !  THEN   \ 2016sep06
      0 jrt @ 2 ear{ !   \ 2016sep06: from old 24jul14A.F MindForth
      0 jrt @  0 psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
      0 jrt @  1 psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
      0 jrt @  2 psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
      0 jrt @  3 psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
      0 jrt @  4 psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
      0 jrt @  5 psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
      0 jrt @  6 psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
      0 jrt @  7 psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
      0 jrt @  8 psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
      0 jrt @  9 psy{ !  \ 2016sep06
      0 jrt @ 10 psy{ !  \ 2016sep06
      0 jrt @ 11 psy{ !  \ 2016sep06
      0 jrt @ 12 psy{ !  \ 2016sep06
      0 jrt @ 13 psy{ !  \ 2019-09-29: tdt time-of-dative
      0 jrt @ 14 psy{ !  \ 2019-09-29: tkb time-in-knowledge-base
      0 jrt @ 15 psy{ !  \ 2019-09-29: tia time-of-ablative (not used in English)
      0 jrt @ 16 psy{ !  \ 2019-09-29: tcj time-of-conjunction
      0 jrt @ 17 psy{ !  \ 2019-09-29: tdj time-of-adjective
      0 jrt @ 18 psy{ !  \ 2019-09-29: tdv time-of-adverb
      0 jrt @ 19 psy{ !  \ 2019-09-29: tpr time-of-preposition
      0 jrt @ 20 psy{ !  \ 2019-09-29: rv auditory recall-vector for Speech module
    THEN    \ 2016sep06: from old 24jul14A.F MindForth
  LOOP    \ 2016sep06: from old 24jul14A.F MindForth
  jrt @  t !    \ 2016sep06: from old 24jul14A.F MindForth
  cns @    t @  DO   \ 2016sep06: from old 24jul14A.F MindForth
    0  I  0  psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
    0  I  1  psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
    0  I  2  psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
    0  I  3  psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
    0  I  4  psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
    0  I  5  psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
    0  I  6  psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
    0  I  7  psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
    0  I  8  psy{ !  \ 2016sep06: from old 24jul14A.F MindForth
    0  I  9  psy{ !  \ 2016sep06
    0  I 10 psy{ !  \ 2016sep06
    0  I 11 psy{ !  \ 2016sep06
    0  I 12 psy{ !  \ 2016sep06
    0  I 13 psy{ !  \ 2017jun15
    0  I 14 psy{ !  \ 2017jun15
    0  I 15 psy{ !  \ 2019-09-29
    0  I 16 psy{ !  \ 2019-09-29
    0  I 17 psy{ !  \ 2019-09-29
    0  I 18 psy{ !  \ 2019-09-29
    0  I 19 psy{ !  \ 2019-09-29
    0  I 20 psy{ !  \ 2019-09-29
   32  I 0  ear{ ! \ 2016sep06: from old 24jul14A.F MindForth
    0  I 1  ear{ !  \ 2016sep06: from old 24jul14A.F MindForth
    0  I 2  ear{ !  \ 2016sep06: from old 24jul14A.F MindForth
  LOOP   \ 2016sep06: from old 24jul14A.F MindForth
;   \ 2019-09-30: ReJuvenate returns to MainLoop.


:  Speech ( http://ai.neocities.org/Speech.html )
  0 audstop !   ( 2016aug25: Initially false value of flag )
  0 len !   \ 2016aug28: for sake of setting "rv" during re-entry.
  1 pov !   \ 2019-09-30: only internal POV thinking uses Speech.
  0 pho !       ( 2016aug23: Lest pho already be at 32=SPACE )
  0 rv !   \ 2018-11-24: Let AudInput designate recall-vector "rv".
  aud @ onset !  ( 2016aug23: onset of a word is its recall-vector )
  aud @ t2s !  \ 2016aug14: start from the auditory recall-vector "aud".
  40  1  DO  \ 2016aug14: assume word will not be longer than 40 characters.
    1 len +!      \ 2016aug25: increment to leave 1=len to set "rv"
    t2s @  0  ear{ @ pho !  \ 2016aug23: retrieve character as pho(neme)
    pho @ 0 = IF 32 pho !  1 audstop !  AudInput  THEN  \ 2016aug26: TEST
    pho @ 31 > IF  \ 2016aug26: including any 32=SPACE...
      pho @ EMIT  ( 2016aug14: say or display "pho" )
      pho @ lastpho !  \ 2016aug23: to avoid extra "S" on verbs
    THEN  \ 2016aug22: end of test for SPACE at end of word.
    pho @ 32 =  pho @ 13 = OR IF  \ 2016aug25:
      1 audstop !   \ 2016aug26: TEST
      1 spacegap !  \ 2016aug26:
      pho @ EMIT  ( 2016aug26: say or display "pho" )
    THEN  \ 2016aug25: end of test for 32=SPACE or 13=CR.
    AudInput  ( 2016aug25: for reentry of thought back into a mind )
    audstop @ 1 = IF  \ 2016aug25:
       spacegap @ 1 = IF  \ 21016aug26:
        1 t +!           \ 2016aug26: increment internal AI time "t"
        1 audrun ! \ resetting at end of internal word.
        AudInput      \ 2016aug25:
        0 len !  \ 2016aug28: reset len(gth) for next word.
        0 spacegap !    \ 2016aug26:
       THEN  \ 2016aug26:
      LEAVE     \ 2016aug25:
    THEN  \ 2016aug25: end of test
    t2s @  1+  t2s !  \ 2016aug25: increment to retrieve letters in sequence.
  LOOP  \ 2016aug14: end of loop retrieving characters from auditory ear{ array.
  0 aud !  \ 2016aug14: Avoid unwarranted carry-over of value.
  0 phodex !  \ 2018-10-19 BUGFIX: re-set for AudBuffer.
;  \ 2019-09-30: Speech returns to EnNounPhrase or other generative module.


:  ConJoin  ( http://ai.neocities.org/ConJoin.html )
  etc @ 1 > IF 306 conj ! THEN  \ 2019-02-20: use conjunction 306=AND.
  whatcon @ 1 = IF  \ 2019-02-20: if processing a what-query...
    qv2psi @ 886 = IF  \ 2019-01-09: 886=THINK after renumbering of verbs 800-899.
      310 conj !  \ 2018-07-09: set conjunction to 310=THAT
    THEN  \ 2019-01-09: end of test for verb of 886=THINK after renumbering.
  THEN  \ 2019-02-20: end of test for positive value
  midway @  vault @  DO  \ 2018-07-09: search in "vault" for reliability.
\   I    1 psy{ @ 310 = IF  \ 2018-07-09: 310=THAT
    I    1 psy{ @ conj @ = IF  \ 2019-02-20: if conjunction is found...
      I 20 psy{ @  aud !    \ 2019-09-29: hold address for Speech
      LEAVE  \ 2018-07-09: one auditory engram is enough.
    THEN  \ 2018-07-09:
  -1 +LOOP   \ 2018-07-09: end of backwards loop.
  conj @ 0 > IF Speech THEN  \ 2019-02-20: speak the selected conjunction.
  0 svo1 ! 0 svo2 ! 0 svo3 ! 0 svo4 !  \ 2018-07-10: prepare new idea.
;  \ 2019-09-30: ConJoin returns to EnThink.


:  EnArticle  ( http://ai.neocities.org/EnArticle.html )
  usx @  us1 @  = IF  \ 2018-09-07: if definite article "the" is warranted...
    1  vault @  DO   \ 2018-09-07: search backwards for 117=THE
      I           1 psy{ @ 117 = IF  \ 2018-09-07: 117=THE
        I   20 psy{ @  aud !      \ 2019-09-29: auditory recall-vector
        LEAVE                     \ 2018-09-07: one engram is enough.
      THEN     \ 2018-09-07: end of test for 117=THE;
    -1 +LOOP   \ 2018-09-07: end of backwards loop.
    Speech     \ 2018-09-07: Say word starting at "aud" value;
    EXIT       \ 2018-09-07: skip the rest of EnArticle.
  THEN  \ 2018-09-07: end of test for need to say "THE".
  usx @  us2 @  = IF  \ 2018-09-07: if definite article "the" is warranted...
    1  vault @  DO   \ 2018-09-07: search backwards for 117=THE
      I           1 psy{ @ 117 = IF  \ 2018-09-07: 117=THE
        I   20 psy{ @  aud !      \ 2019-09-29: auditory recall-vector
        LEAVE                     \ 2018-09-07: one engram is enough.
      THEN     \ 2018-09-07: end of test for 117=THE;
    -1 +LOOP   \ 2018-09-07: end of backwards loop.
    Speech     \ 2018-09-07: Say word starting at "aud" value;
    EXIT       \ 2018-09-07: skip the rest of EnArticle.
  THEN  \ 2018-09-07: end of test for need to say "THE".
  usx @  us3 @  = IF  \ 2018-09-07: if definite article "the" is warranted...
    1  vault @  DO   \ 2018-09-07: search backwards for 117=THE
      I           1 psy{ @ 117 = IF  \ 2018-09-07: 117=THE
        I   20 psy{ @  aud !      \ 2019-09-27: auditory recall-vector
        LEAVE                     \ 2018-09-07: one engram is enough.
      THEN     \ 2018-09-07: end of test for 117=THE;
    -1 +LOOP   \ 2018-09-07: end of backwards loop.
    Speech     \ 2018-09-07: Say word starting at "aud" value;
    EXIT       \ 2018-09-07: skip the rest of EnArticle.
  THEN  \ 2018-09-07: end of test for need to say "THE".
  usx @  us4 @  = IF  \ 2018-09-07: if definite article "the" is warranted...
    1  vault @  DO   \ 2018-09-07: search backwards for 117=THE
      I           1 psy{ @ 117 = IF  \ 2018-09-07: 117=THE
        I   20 psy{ @  aud !      \ 2019-09-29: auditory recall-vector
        LEAVE                     \ 2018-09-07: one engram is enough.
      THEN     \ 2018-09-07: end of test for 117=THE;
    -1 +LOOP   \ 2018-09-07: end of backwards loop.
    Speech     \ 2018-09-07: Say word starting at "aud" value;
    EXIT       \ 2018-09-07: skip the rest of EnArticle.
  THEN  \ 2018-09-07: end of test for need to say "THE".
  usx @  us5 @  = IF  \ 2018-09-07: if definite article "the" is warranted...
    1  vault @  DO   \ 2018-09-07: search backwards for 117=THE
      I           1 psy{ @ 117 = IF  \ 2018-09-07: 117=THE
        I   20 psy{ @  aud !      \ 2019-09-29: auditory recall-vector
        LEAVE                     \ 2018-09-07: one engram is enough.
      THEN     \ 2018-09-07: end of test for 117=THE;
    -1 +LOOP   \ 2018-09-07: end of backwards loop.
    Speech     \ 2018-09-07: Say word starting at "aud" value;
    EXIT       \ 2018-09-07: skip the rest of EnArticle.
  THEN  \ 2018-09-07: end of test for need to say "THE".
  usx @  us6 @  = IF  \ 2018-09-07: if definite article "the" is warranted...
    1  vault @  DO   \ 2018-09-07: search backwards for 117=THE
      I           1 psy{ @ 117 = IF  \ 2018-09-07: 117=THE
        I   20 psy{ @  aud !      \ 2019-09-29: auditory recall-vector
        LEAVE                     \ 2018-09-07: one engram is enough.
      THEN     \ 2018-09-07: end of test for 117=THE;
    -1 +LOOP   \ 2018-09-07: end of backwards loop.
    Speech     \ 2018-09-07: Say word starting at "aud" value;
    EXIT       \ 2018-09-07: skip the rest of EnArticle.
  THEN  \ 2018-09-07: end of test for need to say "THE".
  usx @  us7 @  = IF  \ 2018-09-07: if definite article "the" is warranted...
    1  vault @  DO   \ 2018-09-07: search backwards for 117=THE
      I           1 psy{ @ 117 = IF  \ 2018-09-07: 117=THE
        I   20 psy{ @  aud !      \ 2019-09-29: auditory recall-vector
        LEAVE                     \ 2018-09-07: one engram is enough.
      THEN     \ 2018-09-07: end of test for 117=THE;
    -1 +LOOP   \ 2018-09-07: end of backwards loop.
    Speech     \ 2018-09-07: Say word starting at "aud" value;
    EXIT       \ 2018-09-07: skip the rest of EnArticle.
  THEN  \ 2018-09-07: end of test for need to say "THE".
  1 usn +!  \ 2018-09-07: increment the upstream-idea rotation number.
  usx @ 0 >  usn @ 1 =  AND IF  usx @ us1 ! THEN  \ 2018-09-07: transfer noun concept.
  usx @ 0 >  usn @ 2 =  AND IF  usx @ us2 ! THEN  \ 2018-09-07: transfer noun concept.
  usx @ 0 >  usn @ 3 =  AND IF  usx @ us3 ! THEN  \ 2018-09-07: transfer noun concept.
  usx @ 0 >  usn @ 4 =  AND IF  usx @ us4 ! THEN  \ 2018-09-07: transfer noun concept.
  usx @ 0 >  usn @ 5 =  AND IF  usx @ us5 ! THEN  \ 2018-09-07: transfer noun concept.
  usx @ 0 >  usn @ 6 =  AND IF  usx @ us6 ! THEN  \ 2018-09-07: transfer noun concept.
  usx @ 0 >  usn @ 7 =  AND IF  usx @ us7 ! THEN  \ 2018-09-07: transfer noun concept.
  usn @  6 > IF  1 usn !  THEN  \ 2018-09-07: after usn=7 rotate back to usn=1
  nphrnum @  1 = IF  \ 2018-09-07: say "A" only for a singular noun...
    1  vault @  DO   \ 2018-09-07: search backwards for 101=A
      anset @  0 = IF  \ 2018-09-07: if no vowel at start of noun...
        I           1 psy{ @ 101 = IF  \ 2018-09-07: 101=A
          I   20 psy{ @  aud !      \ 2019-09-29: auditory recall-vector
          LEAVE                     \ 2018-09-07: one engram is enough.
        THEN     \ 2018-09-07: end of test for 101=A;
      THEN  \ 2018-09-07: end of test for vowel-flag "anset".
      anset @  0 > IF  \ 2018-09-07: if vowel at start of noun...
        I           1 psy{ @ 102 = IF  \ 2018-09-07: 102=AN
          I   20 psy{ @  aud !      \ 2019-09-29: auditory recall-vector
          LEAVE                     \ 2018-09-07: one engram is enough.
        THEN     \ 2018-09-07: end of test for 102=AN;
      THEN  \ 2018-09-07: end of test for positive vowel-flag "anset".
    -1 +LOOP   \ 2018-09-07: end of backwards loop.
    Speech     \ 2018-09-07: Say word starting at "aud" value;
  THEN  \ 2018-09-07: end of test of grammatical number of noun.
; \ 2019-09-30: EnArticle returns to EnNounPhrase or AskUser module.


:  EnAdverb  ( http://ai.neocities.org/EnAdverb.html )
  \ 2019-10-14: stub only, needs full implementation.
  \ 2019-10-14: will be invoked by the time-of-adverb "tdv" flag.
; \ 2019-10-14: EnAdverb returns to EnVerbPhrase module.


:  EnAdjective  ( http://ai.neocities.org/EnAdjective.html )
  tdj @ 0 > IF  \ 2019-10-14: if there is a positive time-of-adjective...
    tdj @ 20 psy{ @ aud ! \ 2019-10-14: adjective recall-vector for Speech
    Speech  \ 2019-10-14: speak the indicated adjective.
    0 tdj !  \ 2019-10-14: reset for safety.
  THEN  \ 2019-10-14: end of test for a positive "tdj" time-of-adjective.
; \ 2019-10-14: EnAdjective returns to EnNounPhrase module.


\ act 33-48 = consciousness tier where concepts win selection.
\ act 17-32 = subconscious where concepts remain available.
\ act  1-16 = noise tier below logical association threshold.
:  SpreadAct  ( http://ai.neocities.org/SpreadAct.html )
  PsiDecay  \ 2016aug27:  reduce conceptual activation in general.

  \ 2018-11-10: SpreadAct, called from EnVerbPhrase, activates a prepositional phrase.
  wherecon @ 0 = IF  \ 2018-11-10: if not answering a where-query...
    tselp @ 0 >  prep @ 0 > AND IF  \ 2018-11-10:
      tselp @ 14 psy{ @ tselo !  \ 2019-09-29: time of selection of object of preposition.
      tselp @ 20 psy{ @ aud !    \ 2019-09-29: fetch the aud-tag for the sake of Speech.
      aud @ 0 > IF Speech THEN   \ 2018-11-10: speak the preposition.
      EnArticle  \ 2018-11-10: say "A" or "THE" before object of preposition.
      tselo @ 20 psy{ @  aud !  \ 2019-09-29: fetch the object aud-tag for Speech
      aud @ 0 > IF Speech THEN   \ 2018-11-10: speak the object of the preposition.
      0 aud !    \ 2018-11-10: reset for safety.
      0 prep !   \ 2018-11-10: reset for safety.
      0 tselo !  \ 2018-11-10: reset for safety.
      0 tselp !  \ 2018-11-10: reset for safety.
    THEN  \ 2018-11-10: end of test for time-point and concept-number of preposition.
  THEN  \ 2018-11-10: end of teest for a positive "wherecon".

  \ 2018-11-15: SpreadAct, called from EnThink, responds to where-queries.
  wherecon @ 1 = IF  \ 2018-11-15: if answering a where-query...
    qv1psi @ 0 > IF  \ 2018-11-15: if there is an activand subject...
      midway @  t @  DO   \ 2018-11-15: search backwards from current time
        I 1 psy{ @  qv1psi @ =  I 14 psy{ @ 0 >  AND IF  \ 2019-09-29: require verblock
          I 1 psy{ @  qv1psi @ = I 11 psy{ @ qv2psi @ =  AND IF  \ 2019-09-29: verb?
             256 I 3 psy{ +!  \ 2018-11-15: impose an overriding activation.
          THEN  \ 2018-11-15: end of test for finding both subject and verb of query.
        THEN  \ 2018-11-15: end of test for presence of a psi13 tkb verblock.
      -1 +LOOP   \ 2018-11-15: end of loop searching for qv1psi subject concept.
    THEN  \ 2018-11-15: end of test for a positive qv1psi.
    EXIT  \ 2018-11-15: skip the remainder of SpreadAct
  THEN  \ 2018-11-15: end of test for a positive "$wherecon".

  \ 2018-12-19: SpreadAct, called from EnThink, responds to who-be queries.
  whocon @ 0 >  qvdocon @ 0 = AND IF  \ 2018-12-18: only for 800=BE who-queries
    qv1psi @ 0 > IF  \ 2018-12-18: if there is an activand subject...
      midway @  t @  DO  \ 2018-12-18: search backwards in time.
        I          1 psy{ @  qv1psi @ = IF  \ 2018-12-18:
          I       14 psy{ @  0 > IF  \ 2019-09-29: require verblock for a full thought.
            I     11 psy{ @  qv2psi @ = IF  \ 2019-09-30: if correct seq-verb...
              64 I 3 psy{ +!  \ 2018-12-18: impose an overriding activation.
            THEN  \ 2018-12-18: end of test for finding same verb as in query.
          THEN  \ 2018-12-18: end of test for a tkb-verblock.
        THEN  \ 2018-12-18: end of test to find the query-subject concept.
      -1 +LOOP   \ 2018-12-18: end of loop searching backwards in time.
    THEN  \ 2018-12-18: end of test for a positive qv1psi.
    0 whocon !  \ 2018-12-18: reset to prevent carry-over.
    EXIT  \ 2018-12-18: skip the remainder of SpreadAct.
  THEN  \ 2018-12-18: end of test to indicate processing of an input query.

  \ 2018-12-19: SpreadAct, called from EnThink, responds to who+verb+dir.object queries.
  qvdocon @ 0 > IF  \ 2018-12-19: for a who+verb+dir.object query...
    1 dunnocon !  \ 2019-01-05: set positive so long as no answer emerges.
    midway @  tpu @  DO  \ 2019-01-05: search backwards in time for the query-verb.
      I          1 psy{ @  qv2psi @ = IF  \ 2018-12-19: if query-verb is found...
        I       10 psy{ @  0 > IF  \ 2018-12-19: if positive "pre" exists...
          I     11 psy{ @  qv4psi @ = IF  \ 2019-09-29: if "seq" is direct object...
            I   13 psy{ @  0 > IF  \ 2018-12-19: if positive "tkb" for direct object...
              I  8 psy{ @  qv2num !  \ 2018-12-19: latch onto "num" of response-verb.
              I 10 psy{ @  qv1psi !  \ 2018-12-19: latch onto "pre" as answer-subject.
           32 I  4 psy{ +!  \ 2018-12-19: activate verb-to-be of query-response.
            THEN  \ 2018-12-19: end of test for specific time-point of direct object.
          THEN  \ 2018-12-19: end of test for presence of direct-object "seq".
        THEN  \ 2018-12-19: end of test for postive "pre" or subject of query-verb.
      THEN  \ 2018-12-19: end of test for query-verb qv2psi.
    -1 +LOOP   \ 2018-12-19: end of backwards loop searching for verb of response.
    0 qucon !  \ 2018-12-19: prevent infinite loop?
    midway @  tpu @  DO  \ 2019-01-05: search backwards in time for subject of query-verb.
     qv1psi @ 0 > IF  \ 2018-12-21: only for a positive qv1psi
      I          1 psy{ @  qv1psi @ = IF  \ 2018-12-18: if subject is found...
        I       11 psy{ @  qv2psi @ = IF  \ 2019-09-29: if query-verb is the "seq"...
          0 dunnocon !  \ 2019-01-05: even one correct answer disables dunnocon.
          256 I  3 psy{ +!  \ 2018-12-21: activate subject-to-be of query-response.
              I  0 psy{ @  I 3 psy{ +!  \ 2019-01-05: superimpose quantity of "tru" value.
        THEN  \ 2019-01-05: end of test for query-verb as "seq" of the query-subject.
      THEN  \ 2018-12-19: end of test for subject-to-be of answer to query.
     THEN  \ 2018-12-21: end of test for a positive query-subject qv1psi.
    -1 +LOOP   \ 2018-12-19: end of loop searching backwards in time.
    EXIT  \ 2018-12-21: after activation of query-response, skip remainder of SpreadAct.
  THEN  \ 2018-12-19: end of test for who+verb+direct-object query condition.

  \ 2018-12-20: SpreadAct, called from Enthink,  responds to what-do-subjects-VERB query
  wasvcon @ 0 > IF  \ 2019-02-22: for a what-AUX-SUBJ-VERB query...
    1 dunnocon !  \ 2018-10-07: set positive so long as no answer emerges.
    midway @  tpu @  DO   \ 2018-07-09: search backwards from Time-Pen-Ultimate
      I          1 psy{ @  qv1psi @ = IF  \ 2018-12-20: if query-subject is found...
        I       11 psy{ @  qv2psi @ = IF  \ 2019-09-29: if "seq" is query-verb...
          0 dunnocon !  \ 2018-10-07: even one correct answer disables dunnocon.
          64          I 3 psy{ +!  \ 2018-10-07: impose activation on the found subject.
          I 0 psy{ @  I 3 psy{ +!  \ 2018-12-20: superimpose quantity of "tru" value.
        THEN  \ 2018-12-20: end of test for psi12 "seq" as query-verb.
      THEN  \ 2018-10-07: end of test for subject tagged to query-verb.
    -1 +LOOP   \ 2018-07-09: end of loop searching for qv1psi subject-noun concept.
    qv1psi @ catsubj !  \ 2019-02-20: chain-subject to be omitted for sake of "AND"
    qv2psi @ catverb !  \ 2019-02-20: chain-verb to be omitted for sake of "AND".
    EXIT  \ 2018-10-07: skip the remainder of SpreadAct after one special function.
  THEN  \ 2018-10-07: end of test of whatcon so as to answer a what-query.

  \ 2018-12-20: SpreadAct, called from Enthink,  responds to what-do-subjects-VERB query
  whatcon @ 0 > IF  \ 2018-07-09:
    1 dunnocon !  \ 2018-10-07: set positive so long as no answer emerges.
    midway @  tpu @  DO   \ 2018-07-09: search backwards from Time-Pen-Ultimate
      I          1 psy{ @  qv1psi @ = IF  \ 2018-12-20: if query-subject is found...
        I       11 psy{ @  qv2psi @ = IF  \ 2019-09-29: if "seq" is query-verb...
          0 dunnocon !  \ 2018-10-07: even one correct answer disables dunnocon.
          64          I 3 psy{ +!  \ 2018-10-07: impose activation on the found subject.
          I 0 psy{ @  I 3 psy{ +!  \ 2018-12-20: superimpose quantity of "tru" value.
        THEN  \ 2018-12-20: end of test for psi12 "seq" as query-verb.
      THEN  \ 2018-10-07: end of test for subject tagged to query-verb.
    -1 +LOOP   \ 2018-07-09: end of loop searching for qv1psi subject-noun concept.
    qv1psi @ catsubj !  \ 2019-02-20: chain-subject to be omitted for sake of "AND"
    qv2psi @ catverb !  \ 2019-02-20: chain-verb to be omitted for sake of "AND".
    EXIT  \ 2018-10-07: skip the remainder of SpreadAct after one special function.
  THEN  \ 2018-10-07: end of test of whatcon so as to answer a what-query.

  whatcon @ 0 > IF  \ 2018-07-09:
    1 dunnocon !  \ 2018-10-07: set positive so long as no answer emerges.
    midway @  tpu @  DO   \ 2018-07-09: search backwards from Time-Pen-Ultimate
      I 1 psy{ @ qv1psi @ =  qv2psi @ 886 =  AND IF \ 2018-12-20: 886=THINK
        64 I 3 psy{ +!  \ 2018-07-09: impose activation on the found subject.
      THEN  \ 2018-07-09: end of test
      I 1 psy{ @ 886 =   qv2psi @ 886 =  AND IF \ 2018-12-20: if 886=THINK query...
         64 I 3 psy{ +!  \ 2018-07-10: impose activation on the found verb.
      THEN  \ 2018-07-09:
    -1 +LOOP   \ 2018-07-09: end of loop searching for qv1psi subject-noun concept.
    qv1psi @ catsubj !  \ 2019-02-20: chain-subject to be omitted for sake of "AND"
    qv2psi @ catverb !  \ 2019-02-20: chain-verb to be omitted for sake of "AND".
    EXIT  \ 2018-07-09: skip the remainder of SpreadAct after one special function.
  THEN  \ 2018-07-09: end of test of whatcon so as to answer a what-query.

  \ 2018-12-20: segment of SpreadAct dealing with basic spreading of activation.
  actpsi @ 0 >  qucon @ 0 = AND IF  \ 2018-07-10: not with who-queries
    midway @  t @  DO  \ 2016aug26: search backwards in time.
      I  1 psy{ @ actpsi @ =  I 14 psy{ @ 0 > AND IF  \ 2019-09-29: require verblock
       I 6 psy{ @ 5 =  I 6 psy{ @ 7 = OR IF   \ 2018-11-25: noun or pronoun
\       32 I 3 psy{  +!    \ 2017jun14: impose less than half of subj-inhibition.
       128 I 3 psy{  +!    \ 2018-11-24: try a higher activation.
       THEN   \ 21016aug31: end of test for augend concept to be a 5=noun.
      THEN  \ 2016aug26: end of test for associated concept with positive tkb verblock.
    -1 +LOOP   \ 2016aug26: end of loop searching for qv1psi subject concept.
  THEN  \ 2016aug26: end of test for spreading activation to a candidate subject.
  0 qv1psi !  \ 2016aug26: reset for safety.
;  \ 2019-09-30: SpreadAct returns to EnThink.


:  EnPrep ( http://ai.neocities.org/EnPrep.html )
  tnpr @ 0 > IF  \ 2019-10-26: positive time-of-noun-preposition?
\   tnpr @  14 psy{ @ 0 > IF tnpr @ 14 psy{ @ tkb ! THEN  \ 2019-10-26: obj. of prep.
    tnpr @  14 psy{ @ 0 > IF tnpr @ 14 psy{ @ tkbprep ! THEN  \ 2019-10-29: obj. of prep.
    tnpr @  20 psy{ @ 0 > IF tnpr @ 20 psy{ @ aud ! THEN  \ 2019-10-26: recall
    tnpr @  20 psy{ @ 0 > IF SPEECH THEN  \ 2019-10-20: speak the preposition
    0 tnpr !  \ 2019-10-26: prevent carry-over.
  THEN  \ 2019-10-26: end of test for positive time-of-noun-preposition.
  tvpr @ 0 > IF  \ 2019-10-26: positive time-of-verb-preposition?
\   tvpr @  14 psy{ @ 0 > IF tvpr @ 14 psy{ @ tkb ! THEN  \ 2019-10-26: obj. of prep.
    tvpr @  14 psy{ @ 0 > IF tvpr @ 14 psy{ @ tkbprep ! THEN  \ 2019-10-29: obj. of prep.
    tvpr @  20 psy{ @ 0 > IF tvpr @ 20 psy{ @ aud ! THEN  \ 2019-10-26: recall
    tvpr @  20 psy{ @ 0 > IF SPEECH THEN  \ 2019-10-20: speak the preposition
    0 tvpr !  \ 2019-10-26: prevent carry-over.
  THEN  \ 2019-10-26: end of test for positive time-of-verb-preposition.
  EnArticle  \ 2019-10-26: Say "A" or "THE" before object of preposition.
\ tkb @ 0 > IF  \ 2019-10-26: object of preposition?
  tkbprep @ 0 > IF  \ 2019-10-29: object of preposition?
\   tkb @ 20 psy{ @ aud ! SPEECH  \ 2019-10-26:
    tkbprep @ 20 psy{ @ aud ! SPEECH  \ 2019-10-29:
    0 tkb !  \ 2019-10-25: prevent carry-over.
    0 tkbprep !  \ 2019-10-29: prevent carry-over.
  THEN  \ 2019-10-26: end of test for "tkb" object of preposition.
  0 objprep !  \ 2018-11-23: reset to avoid carry-over.
  0 prep !     \ 2018-11-23: reset to avoid carry-over.
  0 prepgen !  \ 2018-11-23: reset to avoid carry-over.
  0 tselo !    \ 2018-11-23: reset to avoid carry-over.
  0 tselp !    \ 2018-11-23: reset to avoid carry-over.
;  \ 2019-10-29: EnPrep returns to EnNounPhrase or EnVerbPhrase.


:  EnPronoun  \ http://ai.neocities.org/EnPronoun.html
;  \ 2019-02-20: EnPronoun returns to EnNounPhrase.


:  EnAuxVerb  ( http://ai.neocities.org/EnAuxverb.html )
  auxverb @ 818 = IF  \ 2018-12-13: if the auxiliary is "DO" or "DOES"
    subjnum @ 1 =  prsn @ 1 = AND IF  \ 2018-10-07: 1st person singular?
      midway @  t @  DO   \ 2018-10-07: search backwards
        I          1 psy{ @ 818 = IF   \ 2018-12-13: 818=DO
          I        8 psy{ @ 1 = IF     \ 2018-10-07: singular?
            I      7 psy{ @ 1 = IF     \ 2018-10-07: 1st person?
              I   20 psy{ @  aud !     \ 2019-09-29: auditory recall-vector
              LEAVE                    \ 2018-10-07: one engram is enough.
            THEN  \ 2018-10-07: end of test for first person;
          THEN    \ 2018-10-07: end of test for num=1 singular;
        THEN      \ 2018-12-13: end of test for 818=DO;
      -1 +LOOP  \ 2018-10-07: end of backwards loop.
      Speech     \ 2018-10-07: Say word starting at "aud" value;
    THEN  \ 2018-10-07: end of test for search parameters.
    subjnum @ 1 =  prsn @ 2 = AND IF  \ 2018-10-07: 2nd person singular?
      midway @  t @  DO   \ 2018-10-07: search backwards
        I           1 psy{ @ 818 = IF  \ 2018-12-13: 818=DO
          I         8 psy{ @ 1 = IF    \ 2018-10-07: singular?
            I      7 psy{ @ 2 = IF     \ 2018-10-07: 2nd person?
              I   20 psy{ @  aud !     \ 2019-09-29: auditory recall-vector
              LEAVE                    \ 2018-10-07: one engram is enough.
            THEN  \ 2018-10-07: end of test for second person;
          THEN    \ 2018-10-07: end of test for num=1 singular;
        THEN      \ 2018-12-13: end of test for 818=DO;
      -1 +LOOP  \ 2018-10-07: end of backwards loop.
      Speech     \ 2018-10-07: Say word starting at "aud" value;
    THEN  \ 2018-10-07: end of test for search parameters.
    subjnum @ 1 =  prsn @ 3 = AND IF  \ 2018-10-07: 3rd person singular?
      midway @  t @  DO   \ 2018-10-07: search backwards
        I           1 psy{ @ 818 = IF  \ 2018-12-13: 818=DO
          I         8 psy{ @ 1 = IF    \ 2018-10-07: singular?
            I      7 psy{ @ 3 = IF     \ 2018-10-07: 3rd person?
              I   20 psy{ @  aud !     \ 2019-09-29: auditory recall-vector
              LEAVE                    \ 2018-10-07: one engram is enough.
            THEN  \ 2018-10-07: end of test for third person;
          THEN    \ 2018-10-07: end of test for num=1 singular;
        THEN      \ 2018-12-13: end of test for 818=DO;
      -1 +LOOP  \ 2018-10-07: end of backwards loop.
      Speech     \ 2018-10-07: Say word starting at "aud" value;
    THEN  \ 2018-10-07: end of test for search parameters.
    subjnum @ 2 =  prsn @ 1 = AND IF  \ 2018-10-07: 1st person plural?
      midway @  t @  DO   \ 2018-10-07: search backwards
        I           1 psy{ @ 818 = IF  \ 2018-12-13: 818=DO
          I         8 psy{ @ 2 = IF    \ 2018-10-07: plural?
            I      7 psy{ @ 1 = IF     \ 2018-10-07: 1st person?
              I   20 psy{ @  aud !     \ 2019-09-20: auditory recall-vector
              LEAVE                    \ 2018-10-07: one engram is enough.
            THEN  \ 2018-10-07: end of test for first person;
          THEN    \ 2018-10-07: end of test for num=2 plural;
        THEN      \ 2018-12-13: end of test for 818=DO;
      -1 +LOOP  \ 2018-10-07: end of backwards loop.
      Speech     \ 2018-10-07: Say word starting at "aud" value;
    THEN  \ 2018-10-07: end of test for search parameters.
    subjnum @ 2 =  prsn @ 2 = AND IF  \ 2018-10-07: 2nd person plural?
      midway @  t @  DO   \ 2018-10-07: search backwards
        I           1 psy{ @ 818 = IF  \ 2018-12-13: 818=DO
          I         8 psy{ @ 2 = IF    \ 2018-10-07: plural?
            I      7 psy{ @ 2 = IF     \ 2018-10-07: 2nd person?
              I   20 psy{ @  aud !     \ 2019-09-29: auditory recall-vector
              LEAVE                    \ 2018-10-07: one engram is enough.
            THEN  \ 2018-10-07: end of test for second person;
          THEN    \ 2018-10-07: end of test for num=2 plural;
        THEN      \ 2018-12-13: end of test for 818=DO;
      -1 +LOOP  \ 2018-10-07: end of backwards loop.
      Speech     \ 2018-10-07: Say word starting at "aud" value;
    THEN  \ 2018-10-07: end of test for search parameters.
    subjnum @ 2 =  prsn @ 3 = AND IF  \ 2018-10-07: 3rd person plural?
      midway @  t @  DO   \ 2018-10-07: search backwards
        I           1 psy{ @ 818 = IF  \ 2018-12-13: 818=DO
          I         8 psy{ @ 2 = IF    \ 2018-10-07: plural?
            I      7 psy{ @ 3 = IF     \ 2018-10-07: 3rd person?
              I   20 psy{ @  aud !     \ 2019-09-20: auditory recall-vector
              LEAVE                    \ 2018-10-07: one engram is enough.
            THEN  \ 2018-10-07: end of test for third person;
          THEN    \ 2018-10-07: end of test for num=2 plural;
        THEN      \ 2018-12-13: end of test for 818=DO;
      -1 +LOOP  \ 2018-10-07: end of backwards loop.
      Speech     \ 2018-10-07: Say word starting at "aud" value;
    THEN  \ 2018-10-07: end of test for search parameters.
  THEN  \ 2018-12-13: end of test for 818=DO verb.
;  \ 2019-09-30: EnAuxVerb returns to EnVerbPhrase or AskUser.


:  AskUser  ( http://ai.neocities.org/AskUser.html )
  1 pov !  \ 2018-06-22: 1=internal; 2=external; 3=neither.
  yncon @ 1 = IF  \ 2019-01-15: separate inference-question from other questions.
    0 quobjaud !  \ 2018-06-22: safety measure
    ynverb @ 0 = IF  \ 2018-06-21: only ask y/n question once.
      quverb @ ynverb !  \ 2018-06-21: isolate at start;
      1 moot !  \ 2018-06-22: prevent storing of "tkb" and "seq";
      818 auxverb !  \ 2018-12-13: 818=DO as auxiliary verb;
      1 subjnum !   \ 2019-10-10: assumption based on Is-A status.
      3 prsn !   \ 2018-10-07: assumption based on Is-A status.
      EnAuxVerb      \ 2018-12-13: Say 818=DO or DOES;
      0 auxverb !  \ 2018-06-22: reset for safety.
      0 moot !     \ 2018-06-22: reset after use.
      midway @  inft @  DO  \ 2018-06-22: skip silent inference;
        I 1 psy{ @  qusub @ = IF  \ 2018-06-22: if query-subject found...
          I  20 psy{ @  aud !  \ 2019-09-29: assign auditory recall-tag;
          LEAVE  \ 2018-06-22: leave the loop after first find;
        THEN  \ 2018-06-22: end of test for query-subject.
      -1 +LOOP  \ 2018-06-22: end of loop in search of qusub.
      Speech   \ 2018-06-22: say subject-word starting at "aud" value;
      quverb @ 0 = IF  818 quverb !  THEN  \ 2018-12-13: 818=DO default;
      midway @  inft @  DO  \ 2019-10-08: skip silent inference;
        I 1 psy{ @  quverb @ = IF  \ 2019-10-08: even if not infinitive
          I  20 psy{ @  aud !  \ 2019-10-08: assign auditory recall-tag;
\         I tkbv !  \ 2019-10-10: try to have an infinitive "tkbv" from InFerence
          LEAVE  \ 2019-10-08: leave the loop after first find;
        THEN  \ 2019-10-08: end of test for query-verb.
      -1 +LOOP  \ 2019-10-08: any non-infinitive may be replaced with infinitive
      midway @  inft @  DO  \ 2018-06-22: skip silent inference;
        I 1 psy{ @  quverb @ =  I 7 psy{ @ 0 = AND IF  \ 2018-10-07: infinitive dba=0
          I  20 psy{ @  aud !  \ 2019-09-29: assign auditory recall-tag;
          LEAVE  \ 2018-06-22: leave the loop after first find;
        THEN  \ 2018-06-22: end of test for query-verb.
      -1 +LOOP  \ 2018-06-22: end of loop in search of quverb.
      0 verbprsn !  \ 2018-06-22: Store the verb as an infinitive form;
      0 audnum !    \ 2018-06-22: infinitive without number;
      0 holdnum !   \ 2018-06-22: infinitive without number;
      1 infincon !  \ 2018-06-22: set flag to positive one;
      0 nphrnum !   \ 2018-06-22: for no influence on infinitive;
      0 numsubj !   \ 2018-06-22: for no influence on infinitive;
      0 putnum !    \ 2018-06-22: for insisting on zero-num infinitive;
      Speech   \ 2018-06-22: say subject-word starting at "aud" value;
      quobj @  0 = IF  711 quobj !  THEN  \ 2018-06-22: 711=ANYTHING default;
      midway @  inft @  DO  \ 2018-06-22: skip silent inference;
        I 1 psy{ @  quobj @ = IF  \ 2018-06-22: if query-object found...
          I 7 psy{ @  4 = IF  \ 2018-06-22: dba=4 accusative?
            I  20 psy{ @  quobjaud !  \ 2019-09-29: hold thru EnArticle
            EnArticle  \ 2018-06-22: insert "A" or "THE" article.
            quobjaud @ aud !  \ 2018-06-22: restore after EnArticle;
            LEAVE  \ 2018-06-22: leave the loop after first find;
          THEN  \ 2018-06-22: end of test for accusative dba=4.
        THEN  \ 2018-06-22: end of test for query-object.
      -1 +LOOP  \ 2018-06-22: end of loop in search of quobj.
      1 dirobj !  \ 2018-06-22: So OldConcept will set "dba" = 4 (accusative)
      Speech   \ 2018-06-22: say object-word starting at "aud" value;
      CR  \ 2019-10-07: carriage-return so that answer starts on next line.
      0 dirobj !     \ 2018-06-22: Reset for safety after asking question;
      0 yncon !      \ 2018-06-22: because question has been asked;
      1 kbcon !      \ 2018-06-22: because waiting for answer;
      0 ynverb !     \ 2018-06-22: zero out; prevent repeat of query;
    THEN  \ 2018-06-21: end of test for a positive ynverb.
  THEN  \ 2019-01-15: end of test to separate inference questions.
  whoq @ 1 = IF  \ 2019-01-15: test of flag to ask a who-question
    1 moot !  \ 2019-01-15: prevent storage of associative tags.
    0  vault @  DO  \ 2019-01-15: use the solid data in the "vault" area.
      I       1 psy{ @  791 = IF  \ 2019-01-15: if 791=WHO found...
        I     7 psy{ @  1 = IF  \ 2019-01-15: if dba=1 for nominative subject...
          I  20 psy{ @  aud !  \ 2019-09-29: assign auditory recall-tag;
          LEAVE  \ 2019-01-15: leave the loop after first find;
        THEN  \ 2019-01-15: end of test for nominative form.
      THEN  \ 2019-01-15: end of test for 791=WHO interrogative pronoun.
    -1 +LOOP  \ 2019-01-15: end of loop in search of pronoun.
    Speech   \ 2019-01-15: say subject-word starting at "aud" value;
    0  vault @  DO  \ 2019-01-15: use the solid data in the "vault" area.
      I         1 psy{ @  800 = IF  \ 2019-01-15: if 800=BE found...
        I       7 psy{ @  2 = IF  \ 2019-01-15: if dba=2 for second person...
          I     8 psy{ @  1 = IF  \ 2019-01-15: if num=1 for singular number...
            I  20 psy{ @  aud !  \ 2019-09-29: assign auditory recall-tag;
            LEAVE  \ 2019-01-15: leave the loop after first find;
          THEN  \ 2019-01-15: end of test for singular number.
        THEN  \ 2019-01-15: end of test for second-person.
      THEN  \ 2019-01-15: end of test for 800=BE verbg
    -1 +LOOP  \ 2019-01-15: end of loop in search of verb.
    Speech   \ 2019-01-15: say word starting at "aud" value;
    0  vault @  DO  \ 2019-01-15: use the solid data in the "vault" area.
      I         1 psy{ @  707 = IF  \ 2019-01-15: if 707=YOU found...
        I       7 psy{ @  1 = IF  \ 2019-01-15: if dba=1 for nominative subject...
          I     8 psy{ @  1 = IF  \ 2019-01-15: if num=1 for singular number...
            I  20 psy{ @  aud !  \ 2019-09-29: assign auditory recall-tag;
            LEAVE  \ 2019-01-15: leave the loop after first find;
          THEN  \ 2019-01-15: end of test for singular number.
        THEN  \ 2019-01-15: end of test for nominative form.
      THEN  \ 2019-01-15: end of test for 707=YOU personal pronoun.
    -1 +LOOP  \ 2019-01-15: end of loop in search of pronoun.
    Speech   \ 2019-01-15: say word starting at "aud" value;
    CR  \ 2019-01-15: Separate the question from any following statement.
    0 moot !  \ 2019-01-15: reset after use.
    0 whoq !  \ 2019-01-15: after using, reset to zero.
  THEN  \ 2019-01-15: end of test for a positive flag to aks a who-question.
;  \ 2019-10-07: AskUser returns to EnThink or to Volition.


:  EnNounPhrase ( http://ai.neocities.org/EnNounPhrase.html )
  0 mjact !  \ 2016aug14: initially default to zero; later calculate.
  0 pre !         \ 2016aug29: zero out to prevent carry-over
  0 prevtag !   \ 2016aug29: zero out to prevent carry-over
  0 rv !  \ 2016aug30: prevent carry-over in advance of any search.
\ whatcon @ 0 > IF  0 verblock ! THEN  \ 2018-07-09: if answering what-query...
  verblock @ 0 > IF  \ 2016aug22: positive verblock?
    verblock @   14 psy{ @  0 > IF  \ 2019-09-28: if "tkb" is positive...
      verblock @ 14 psy{ @ nounlock !  \ 2019-09-28: one tkb from other tkb
    THEN  \ 2019-02-24: end of test for a positive "tkb" to become "nounlock".
  THEN  \ 2016aug22: end of test for a positive verblock
  nounlock @ 0 > IF  \ 2016aug22: if a verblock has yielded a nounlock...
    1 dirobj !  \ 2016aug21: nounlock is specifically for a direct object.
    0 subjectflag !  \ 2016aug22: needed for conditional tests below;
    nounlock @  1 psy{ @  motjuste !  \ 2017jun15: in case of search for non-zero rv;
    nounlock @  1 psy{ @  actpsi !  \ 2018-06-19: send direct object to SpreadAct.
    nounlock @  3 psy{ @  act !  \ 2017jun15: let activation-level play its role here;
    nounlock @  6 psy{ @  nphrpos !  \ 2018-09-07: find part-of-speech for EnArticle
    nounlock @  7 psy{ @  4 = IF \ 2017jun15: if acc. case as for any nounlock;
      nounlock @ 20 psy{ @ 0 > IF  \ 2019-09-28: find positive rv;
             nounlock @  6 psy{ @ nphrpos !  \ 2017-09-01: for EnArticle
             nounlock @  8 psy{ @ nphrnum !  \ 2018-09-07: for EnArticle
             nounlock @ 20 psy{ @ rv !  \ 2019-09-28
      ELSE  \  2019-09-29: if only a zero rv psi20 is found...
        midway @  t @  DO  \ 2016aug22: loop from present back to "midway".
             I   1 psy{ @  motjuste = IF  \ 2017jun15: search on index "I"
              I 20 psy{ @ 0 > IF  \ 2019-09-28: if positive rv recall-vector...
                I  6 psy{ @ nphrpos !  \ 2017-09-01: for sake of EnArticle.
                I 20 psy{ @ aud !  \ 2019-09-28: hold rv value as aud for Speech
                LEAVE  \ 21016aug22: one recall-vector is enough.
              THEN  \ 2016aug22: end of test for positive rv.
          THEN  \ 2016aug22: end of test to find motjuste with valid rv.
        -1 +LOOP   \ 2016aug22: end of search for a positive recall-vector.
      THEN  \ 2016aug22: end of test to find a direct-object recall-vector rv.
    THEN  \ 2016aug22: end of test for dba=4 accusative-case nounlock.
    nounlock @  17 psy{ @ 0 > IF nounlock @ 17 psy{ @ tdj ! THEN \ 2019-10-14
    nounlock @  19 psy{ @ 0 > IF nounlock @ 19 psy{ @ tnpr ! THEN \ 2019-10-26: prep.
  THEN  \ 2016aug22: end of test for a positive nounlock
  nounlock @ 0 = IF  \ 2016aug22: if nouns are free to compete...
    1 subjectflag !  \ 2016aug22: a default until countermanded.
    1 dba !  \ 2017-06-15: default nominative until countermanded.
    dirobj @ 1 = IF 0 subjectflag ! THEN  \ 2016aug22: countermanding default.
    midway @  t @  DO  \ 2016aug22: loop from present back to "midway".

      I 6 psy{ @ 5 =  I 6 psy{ @ 7 = OR IF  \ 2017jun15: noun  or pronoun POS?

        I 14 psy{ @ 0 > IF  \ 2019-09-28: retrieve ideas, not single words.
          I 3 psy{ @ act @ > IF  \ 2017jun15: using act(ivation) as criterion.
            1 etc +!  \ 2019-02-20: increment number of active ideas for ConJoin.
            I 1 psy{ @ motjuste !  \ 2017jun15: select the most active concept.
            I 3 psy{ @ mjact !  \ 2017jun15: if too low, motjuste defaults to "I"
            I 3 psy{ @ act @ >  I 11 psy{ @ 0 > AND IF  \ 2019-10-01:BUGFIX psi11=seq
              I 14 psy{ @ verblock !  \ 2019-09-28: assign tkb value to verblock.
            THEN  \ 2016aug22: end of test for higher-act concept with seq-psi.
            I 3 psy{ @ act @ >  I 13 psy{ @ 0 > AND IF  \ 2017jun15: positive tkb?
              I  6 psy{ @ pos !   \ 2019-10-27: part of speech for EnArticle
              I 14 psy{ @ verblock !  \ 2019-09-28: assign tkb value to verblock.
            THEN  \ 2017jun15: end of test for higher-act concept with tkb.
            I 6 psy{ @ 5 = IF  \ 2017jun15: if selected direct object is a 5=noun
            THEN  \ 2016sep01: end of test for only a noun to go into SpreadAct.
            I 8 psy{ @  nphrnum !  \ 2017jun15: NounPhrase number;
            I 8 psy{ @ snu !  \ 2017jun15:  for parameter in verb-selection;
            I 8 psy{ @ subjnum !  \ 2017jun15:  for parameter in verb-selection;
            motjuste @ subjpsi !  \ 2016aug22: for selection of verb-form.
            I 3 psy{ @ act !  \ 2018-12-20: noun must have higher act to win.
            I 20 psy{ @ 0 > IF   \ 2019-09-28: if there is a positive recall-vector...
              I 20 psy{ @ audjuste !  \ 2019-09-28: temporary recall-vector for Speech
            ELSE   \ 2016aug30: if there is no "rv"
              midway @  t @  DO  \ 2016aug30: loop from present back to "midway".
                I  1 psy{ @  motjuste @ = IF   \ 2017jun15: if same word as nounlock...
                  I 20 psy{ @ 0 > IF   \ 2019-09-29: if positive rv...
                    I  6 psy{ @ nphrpos !  \ 2017-09-01: for sake of EnArticle.
                    I 20 psy{ @ audjuste !  \ 2019-09-28: auditory recall-vector TEST
                   LEAVE    \ 2016aug30: one recall-vector is enough.
                  THEN   \ 2016aug30: end of test for positive psi12 rv.
               THEN  \ 2016aug30: end of test for same word as nounlock motjuste
             -1 +LOOP   \ 2016aug30: loop backwards
            THEN   \ 2016aug30: end of test for non-interpreted positive psi12 "rv"
            I tseln !   \ 2016aug22: use time-point of noun for inhibition.
            I tsels !   \ 2016aug22: use time-point of subject for inhibition.
            I 3 psy{ @ act !  \ 2018-12-18 BUGFIX: noun must have higher act to win.
          THEN  \ 2016aug22: end of test for a concept with higher activation.
        THEN  \ 2016aug22: end of test for definite "tkb" related idea.
      THEN  \ 2016aug22: end of test for noun or pronoun part-of-speech.
    -1 +LOOP   \ 2018-12-18: end of search for most active "motjuste"
  THEN  \ 2016aug22:  end of test for absence of a nounlock.
\ whatcon @ 0 > IF  \ 2019-02-20: if SpreadAct answers a what-query...
\ wasvcon @ 0 > IF  \ 2019-02-22: if SpreadAct answers what-AUX-SUBJ-VERB query...
  wasvcon @ 0 > dirobj @ 0 = AND IF  \ 2019-0930: if SprA answers what-AUX-SUBJ-VERB query
     catsubj @  motjuste @ =  conj @ 0 > AND IF  \ 2019-02-20: after use of a conjunction
    0 subjectflag !  \ 2019-02-22: prepare to select direct object next.
    1 dirobj !  \ 2019-02-22: prepare to select direct object next.
    EXIT  \ 2019-02-22: omit the subject-noun after the use of a conjunction.
    THEN  \ 2019-02-20: end of test for conditions warranting a conjoined thought.
  THEN  \ 2019-02-20: end of test for SpreadAct answering a what-query.
  -90 tsels @ 3 psy{ !  \ 2017jun15: insert inhibition at time of selection of subject.
  subjectflag @ 0 = IF  \ 2016aug22: i.e., dir.obj or predicate nominative...
    0 rv !  \ 2016aug30: prevent carry-over in advance of any search.
    nounlock @ 0 > IF  \ 2016aug22: if verb is locked to a particular seq...
      nounlock @ 1 psy{ @ motjuste !  \ 2017jun15: nounlock psi pre-empts search.
      nounlock @ 6 psy{ @ 5 = IF  \ 2017jun15: if nounlock part of speech is 5=noun
        5 nphrpos !  \ 2017-09-01: for sake of EnArticle.
\       nounlock @ 1 psy{ @ qv1psi !  \ 2017jun15: let direct object go to SpreadAct.
\       nounlock @ 1 psy{ @ qv1psi !  \ 2019-10-11: any qv1psi must be dba=1 nominative
      THEN   \ 2016sep01: end of test for only a noun to go into SpreadAct.
      nounlock @ 3 psy{ @ act !  \ 2017jun15: let activation-level play its role here;
      nounlock @ 8 psy{ @ nphrnum !  \ 2018-12-15 BUGFIX: for sake of EnArticle.
      nounlock @ 20 psy{ @ 0 > IF  \ 2019-09-28: accept only non-zero "rv"...
        nounlock @  6 psy{ @ nphrpos !  \ 2017-09-01: for sake of EnArticle.
        nounlock @ 20 psy{ @ aud !  \ 2019-09-28: set the auditory recall-vector
        nounlock @ 20 psy{ @ audjuste !  \ 2019-09-30: auditory recall-vector TEST
      ELSE   \ 2016aug30: if no positive recall-vector is found...
        midway @  t @  DO  \ 2016aug30: loop from present back to "midway".
          I  1 psy{ @  motjuste @ = IF   \ 2017jun15: if same word as nounlock...
            I 20 psy{ @ 0 > IF   \ 2019-09-28: if positive rv...
              I  6 psy{ @ nphrpos !  \ 2017-09-01: set for sake of EnArticle.
              I 20 psy{ @ aud !  \ 2019-09-28: set the auditory recall-vector
              I 20 psy{ @ audjuste !  \ 2019-09-28: auditory recall-vector TEST
             LEAVE    \ 2016aug30: one recall-vector is enough.
            THEN   \ 2016aug30: end of test for positive psi12 rv.
         THEN  \ 2016aug30: end of test for same word as nounlock motjuste
       -1 +LOOP   \ 2016aug30: loop backwards
      THEN  \ 2016aug30: end of test for a non-zero recall-vector.
    THEN  \ 2016aug12: end of test for a positive nounlock.
  THEN  \ 2016aug22: end of test for not-a-subject
  audjuste @ 0 > IF  \ 2016aug22: avoid "I" for "YOU" or "YOU" for "I"
    audjuste @ aud !  \ 2016aug22: for transfer into speech module
  ELSE  \ 2016aug22: if audjuste value is zero...
    midway @  t @  DO  \ 2016aug22: search backwards in time...
      I 3 psy{ @ act !  \ 2017jun15: let activation-level play its role here;
        I 1 psy{ @ motjuste @ = IF  \ 2017jun15: find motjuste for sake of rv
          I  6 psy{ @ nphrpos !  \ 2018-09-07: capture part-of-speech nphrpos
          I  7 psy{ @ 1 =  subjectflag @ 1 = AND IF  \ 2017jun15: subject?
            I 20 psy{ @ 0 > IF I 20 psy{ @ aud ! LEAVE THEN  \ 2019-09-28: find rv.
          THEN  \ 2016aug22: end of test for subject and for nominative case.
            I  7 psy{ @ 4 = IF  \ 2017jun15: direct object?
              I 20 psy{ @ 0 > IF   \ 2019-09-28: if positive auditory recall-vector...
                 I  6 psy{ @ nphrpos !  \ 2017-09-01: set POS for sake of EnArticle.
                 I 20 psy{ @ aud ! \ 2019-09-30: set the rv for Speech.
                 LEAVE             \ 2017-09-01: one engram is enough.
              THEN \ 2017jun15: d.o. rv
            THEN  \ 2016aug22: end of test for dba=4 accusative direct object.
        THEN  \ 2016aug22: end of test to find motjuste with valid rv.
    -1 +LOOP   \ 2016aug22: end of search through psy{ conceptual array.
  THEN  \ 2016aug22:
  1 subjectflag !  \  2016aug14: initially default to zero; later calculate.
  0 rv !  \ 2016aug30: prevent carry-over in advance of search.
  nounlock @ 0 = IF \ 2016aug14: rudimentary selection of 701=I
    mjact @ 20 < IF  \ 2016aug14: if no subject active enough for chain-of-thought
      subjectflag @ 1 = IF  \ 2016aug14: default to "I" only as subject
        701 motjuste !  \ 2016aug14: 701=I default concept of AI Mind
        7 nphrpos !     \ 2018-09-07: part-of-speech 7=pronoun ("I")
        midway @  t @  DO  \ 2016aug14: Use parameters to find "I".
          I 1 psy{ @ 701 = IF  \ 2017jun15: If 701=I is found;
            I  7 psy{ @ 1 = IF  \ 2017jun15: parameter dba=1?
              I 3 psy{ @ -1 > IF  \ 2017jun15: if act is zero or higher...
                I 14 psy{ @ 0 > IF  \ 2019-09-28: positive verblock?
                  I 14 psy{ @ verblock !  \ 2019-09-28: hold the "tkb" verblock;
                    -64 I 3 psy{ +!    \ 2019-01-10: inhibit the particular ego-memory!
                    I 20 psy{ @ 0 > IF  I 20 psy{ @ audjuste !  THEN  \ 2019-09-28
                    I 20 psy{ @ 0 = IF  \ 2019-09-28: if re-interpreted "rv" = 0;
                      midway @  t @  DO  \ 2016sep18: loop from present back to "midway".
                        I  1 psy{ @ 701 = IF   \ 2017jun15: default 701=I?
                         I  7 psy{ @ 1 = IF  \ 2017jun15: parameter dba=1?
                          I 20 psy{ @ 0 > IF   \ 2019-09-28: if positive rv...
                            I 20 psy{ @ aud !  \ 2019-09-28: set the auditory recall-vector
                            I 20 psy{ @ audjuste !  \ 2019-09-28: auditory recall-vector;
                            LEAVE    \ 2016sep18: one recall-vector is enough.
                          THEN   \ 2016sep18: end of test for positive psi12 rv.
                        THEN   \ 2016sep18: end of test for dba=1 nominative "701=I"
                       THEN  \ 2016sep18: end of test for default ego-concept "701=I"
                      -1 +LOOP   \ 2016sep18: loop backwards
                    THEN  \ 2016sep18: end of test for a re-interpreted 701=I.
                    LEAVE   \ 2016sep18: recall and inhibit only one idea.
                  THEN  \ 2016sep18: end of test for positive verblock.
              THEN   \ 2016sep18: end of test for non-negative activation.
            THEN  \ 2016sep18: end of test for dba=1 nominative "I";
          THEN  \ 2016sep18: end of test for 701=I default ego-concept.
        -1 +LOOP  \ 2016sep18: end of parameter-based search-loop.
        701 subjpsi !   \ 2016aug25: for use elsewhere;
        701 topic !      \ 2016aug25: for question-asking modules;
        1 nphrnum !   \ 2016aug25: for EnArticle and EnVerbPhrase;
        7 nphrpos !     \ 2016aug25: prevent article "A" with "I";
        1 subjnum !    \ 2016aug25: for use elsewhere;
        1 prsn !          \ 2016aug25: for use elsewhere;
      THEN  \ 2016aug14: end of test for "I" to become subj. not obj.
    THEN  \ 2016aug14: end of test for low activation warranting default to ego.
  THEN  \ 2016aug14: end of test for no nounlock.
\ dirobj @  1 = IF    \ 2017-09-01: if thinking of a direct object...
\   nphrpos @ 5 = IF  \ 2017-09-01: only nouns, not adjectives or pronouns.
\     EnArticle  \ 2017-09-01: module for thinking an English article.
\     EnArticle  \ 2018-06-19: wait for better rules about calling EnArticle.
\   THEN  \ 2017-09-01: end of test for a 5=noun noun-phrase part-of-speech
\ THEN  \ 2017-09-01: allow an article for a direct object.
  nphrpos @ 5 = IF  \ 2018-09-07: only nouns, not adjectives or pronouns.
    0 anset !  \ 2018-09-07: prevent carry-over.
    aud @  0  ear{ @ 65 = IF 65 anset ! THEN  ( 2018-09-07: if vowel A )
    aud @  0  ear{ @ 69 = IF 69 anset ! THEN  ( 2018-09-07: if vowel E )
    aud @  0  ear{ @ 73 = IF 73 anset ! THEN  ( 2018-09-07: if vowel I )
    aud @  0  ear{ @ 79 = IF 79 anset ! THEN  ( 2018-09-07: if vowel O )
    aud @  0  ear{ @ 85 = IF 85 anset ! THEN  ( 2018-09-07: if vowel U )
    nphrnum @ 0 > IF  motjuste @ usx ! THEN  \ 2018-09-07: num(ber) required.
    EnArticle  \ 2018-09-07: module for thinking an English article.
  THEN  \ 2018-09-07: end of test for a 5=noun noun-phrase part-of-speech
  audjuste @ aud !  \ 2019-09-30: recall-vector for Speech module
  aud @ unk !  \ 2019-10-14: preserve value across call to EnAdjective
  tdj @ 0 > IF EnAdjective  0 tdj ! THEN  \ 2019-10-14: insert adjective
  unk @ aud !  \ 2019-10-14: restore value upon return from EnAdjective.
  Speech   \ 2018-10-07: EnNounPhrase calls the Speech module
  -32 tsels @ 3 psy{ !  \ 2017jun15: inhibit the subject just spoken.
  tnpr @ 0 > IF  \ 2019-10-26: positive time-of-noun-preposition?
    EnPrep  \ 2019-10-26: insert a prepositional phrase
    0 tnpr !  \ 2019-10-26: prevent carry-over.
  THEN  \ 2019-10-26: end of test for a positive time-of-moun-preposition.
  motjuste @ 701 = NOT IF  \ 2016aug25: if not 701=I;
    motjuste @ 707 = NOT IF  \ 2016aug25: not 707=you;
      motjuste @ 731 = NOT IF  \ 2016aug25: 731=WE;
        3 prsn !  \ 2016aug25: not I YOU WE;
      THEN  \ 2016aug25: end of test for 731=WE;
    THEN  \ 2016aug25:  end of test for 707=YOU;
  THEN  \ 2016aug25: end of test for "not I".
  0 mfn !   \ 2019-10-26: prevent carry-over.
;  \ 2019-10-20: EnNounPhrase returns to EnVerbPhrase or Indicative


:  EnVerbGen  ( http://ai.neocities.org/EnVerbgen.html )
  audbase @ 0 =  verbpsi @ 0 > AND IF  \ 2018-10-19: for lack of starting point...
    midway @  tpu @  DO   \ 2018-10-19: search backwards
      I 1 psy{ @ verbpsi @ =  I 20 psy{ @ 0 > AND IF  \ 2019-09-29: verb w. recall-vector?
        I 20 psy{ @  audbase !  \ 2019-09-29: initial base-time for generating verb-form
        LEAVE                   \ 2018-10-19: one engram is enough.
      THEN      \ 2018-10-19: end of test for modificand verb and auditory engram.
    -1 +LOOP  \ 2018-10-19: end of backwards loop in search of audbase starting point.
  THEN  \ 2018-10-19: end of search for "audbase" starting point.
  0 binc !  \ 2018-10-19: "b" buffer-character increment for AudBuffer
  subjpsi @ 701 = IF  1 prsn !  THEN  \ 2018-10-19: "701=I"    is first-person;
  subjpsi @ 707 = IF  2 prsn !  THEN  \ 2018-10-19: "707=YOU"  is second-person;
  subjpsi @ 713 = IF  3 prsn !  THEN  \ 2018-10-19: "713=HE"   is third-person;
  subjpsi @ 719 = IF  3 prsn !  THEN  \ 2018-10-19: "719=SHE"  is third-person;
  subjpsi @ 725 = IF  2 prsn !  THEN  \ 2018-10-19: "725=IT"   is third-person;
  subjpsi @ 731 = IF  1 prsn !  THEN  \ 2018-10-19: "731=WE"   is first-person;
  subjpsi @ 737 = IF  2 prsn !  THEN  \ 2018-10-19: "737=YOU"  is second-person;
  subjpsi @ 743 = IF  3 prsn !  THEN  \ 2018-10-19: "743=THEY" is third-person;bye
  BEGIN  \ 2018-10-19: start transferring a word from audbase into AudBuffer...
    audbase @ 0 ear{ @ 32 > IF  audbase @ 0 ear{ @ abc ! AudBuffer THEN 1 audbase +!
    audbase @ 0 ear{ @ 33 <   \ 2018-10-19: ASCII 32=SPACE or lower; non-character
  UNTIL  \ 2018-10-19: stop transferring characters if 32=SPACE occurs.
  BEGIN  \ second loop uses OutBuffer; 19nov2012
    OutBuffer    \ 19nov2012
    binc @ 1 = IF  \ b-increment? 23nov2012
      b16 @ 32 > IF  \ 2019-06-16: more than SPACE?
        1 len +!   \ 2018-10-23: increment length for sake of determining "rv"
        b16 @ EMIT   \ 2019-06-16: display any character;
        b16 @ pho !  \ 2019-06-16: for AudInput;
        AudInput     \ 2019-06-16: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN  \ end of test; 23nov2012
    binc @ 2 = IF  \ b-increment? 23nov2012
      b15 @ 32 > IF  \ more than SPACE? 24nov2012
        1 len +!   \ 2018-10-23: increment length for sake of determining "rv"
        b15 @ EMIT   \ 2019-06-16: display any character;
        b15 @ pho !  \ 2019-06-16: for AudInput;
        AudInput     \ 2019-06-16: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN  \ end of test; 23nov2012
    binc @ 3 = IF  \ b-increment? 23nov2012
      b14 @ 32 > IF  \ more than SPACE? 24nov2012
        1 len +!   \ 2018-10-23: increment length for sake of determining "rv"
        b14 @ EMIT   \ 2019-06-16: display any character;
        b14 @ pho !  \ 2019-06-16: for AudInput;
        AudInput     \ 2019-06-16: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN  \ end of test; 23nov2012
    binc @ 4 = IF  \ b-increment? 23nov2012
      b13 @ 32 > IF  \ more than SPACE? 24nov2012
        1 len +!   \ 2018-10-23: increment length for sake of determining "rv"
        b13 @ EMIT   \ 2019-06-16: display any character;
        b13 @ pho !  \ 2019-06-16: for AudInput;
        AudInput     \ 2019-06-16: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN  \ end of test; 23nov2012
    binc @ 5 = IF  \ b-increment? 23nov2012
      b12 @ 32 > IF  \ more than SPACE? 24nov2012
        1 len +!   \ 2018-10-23: increment length for sake of determining "rv"
        b12 @ EMIT   \ 2019-06-16: display any character;
        b12 @ pho !  \ 2019-06-16: for AudInput;
        AudInput     \ 2019-06-16: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN  \ end of test; 23nov2012
    binc @ 6 = IF  \ b-increment? 23nov2012
      b11 @ 32 > IF  \ more than SPACE? 24nov2012
        1 len +!   \ 2018-10-23: increment length for sake of determining "rv"
        b11 @ EMIT   \ 2019-06-16: display any character;
        b11 @ pho !  \ 2019-06-16: for AudInput;
        AudInput  \ 2019-06-16: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN  \ end of test; 23nov2012
    binc @ 7 = IF  \ b-increment? 23nov2012
      b10 @ 32 > IF  \ more than SPACE? 24nov2012
        1 len +!   \ 2018-10-23: increment length for sake of determining "rv"
        b10 @ EMIT   \ 2019-06-16: display any character;
        b10 @ pho !  \ 2019-06-16: for AudInput;
        AudInput     \ 2019-06-16: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN  \ end of test; 23nov2012
    binc @ 8 = IF  \ 22nov2012
      b9 @ 32 > IF  \ more than SPACE? 24nov2012
        1 len +!    \ 2018-10-23: increment length for sake of determining "rv"
        b9 @ EMIT   \ 2019-06-16: display any character;
        b9 @ pho !  \ for AudInput 22nov2012
        AudInput    \ 2019-06-16: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN  \ test; 22nov2012
    binc @ 9 = IF   \ 12nov2012
      b8 @ 32 > IF  \ more than SPACE? 24nov2012
        1 len +!    \ 2018-10-23: increment length for sake of determining "rv"
        b8 @ EMIT   \ 2019-06-16: display any character;
        b8 @ pho !  \ for AudInput 22nov2012
        AudInput    \ 2019-06-16: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN  \ test; 22nov2012
    binc @ 10 = IF  \ 12nov2012
      b7 @ 32 > IF  \ more than SPACE? 24nov2012
        1 len +!    \ 2018-10-23: increment length for sake of determining "rv"
        b7 @ EMIT   \ 2019-06-16: display any character;
        b7 @ pho !  \ for AudInput 22nov2012
        AudInput    \ 2019-06-16: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN  \ test; 22nov2012
    binc @ 11 = IF  \ 19nov2012
      b6 @ 32 > IF  \ more than SPACE? 24nov2012
        1 len +!    \ 2018-10-23: increment length for sake of determining "rv"
        b6 @ EMIT   \ 2019-06-16: display any character;
        b6 @ pho !  \ for AudInput 19nov2012
        AudInput    \ 2019-06-16: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN  \ test; 19nov2012
    binc @ 12 = IF  \ 19nov2012
      b5 @ 32 > IF  \ more than SPACE? 24nov2012
        1 len +!    \ 2018-10-23: increment length for sake of determining "rv"
        b5 @ EMIT   \ 2019-06-16: display any character;
        b5 @ pho !  \ 2019-06-16: for AudInput
        AudInput    \ 2019-06-16: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN  \ test; 19nov2012
    binc @ 13 = IF  \ 19nov2012
      b4 @ 32 > IF  \ more than SPACE? 24nov2012
        1 len +!    \ 2018-10-23: increment length for sake of determining "rv"
        b4 @ EMIT   \ 2019-06-16: display any character;
        b4 @ pho !  \ 2019-06-16: for AudInput
        AudInput    \ 2019-06-16: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN  \ test; 19nov2012
    binc @ 14 = IF  \ 19nov2012
      b3 @ 32 > IF  \ more than SPACE? 24nov2012
        1 len +!    \ 2018-10-23: increment length for sake of determining "rv"
        b3 @ EMIT   \ 2019-06-16: display any character;
        b3 @ pho !  \ 2019-06-16: for AudInput
        AudInput    \ 2019-06-16: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN  \ test; 19nov2012
    binc @ 15 = IF   \ 2018-10-19:
      b2 @ 32 > IF  \ 2018-10-19: more than SPACE?
        1 len +!    \ 2018-10-23: increment length for sake of determining "rv"
        b2 @ EMIT   \ 2019-06-16: display any character;
        b2 @ pho !  \ 2018-10-19L for AudInput
        AudInput    \ 2018-10-19: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN    \ 2018-10-19:
    binc @ 16 = IF   \ 2018-10-19:
      b1 @ 32 > IF  \ 2018-10-19: more than SPACE?
      1 len +!      \ 2018-10-23: increment length for sake of determining "rv"
        b1 @ EMIT   \ 2019-06-16: display any character;
        b1 @ pho !  \ 2018-10-19: for AudInput
        AudInput    \ 2018-10-19: for reentry;
      THEN  \ 2019-06-16: end of skipping SPACE or outputting character
    THEN    \ 2018-10-19:
\   binc @ 16 = IF  \ 2018-10-19: if at edge of OutBuffer
\     b2 @ 83 =  b1 @ 72 = AND IF  \ 2019-06-16: -SH?
\       69 pho !  \ 2018-10-19: 69=E
\       AudInput  \ 2018-10-19: for reentry before "S"
\     THEN  \ 2018-10-19: end of test for verb ending in "-ch"
\   THEN  \ 2018-10-19: end of test for right-justified edge of OutBuffer
    1 binc +!  \ increment the b-increment; 19nov2012
    binc @  17 <  WHILE  \ 2018-10-22
  REPEAT  \ 19nov2012
  0 binc !  \ 2018-10-22: TEST
  32 c1  !  32 c2  !  32 c3  !  32 c4  !
  32 c5  !  32 c6  !  32 c7  !  32 c8  !
  32 c9  !  32 c10 !  32 c11 !  32 c12 !
  32 c13 !  32 c14 !  32 c15 !  32 c16 !
  0 binc !   \ reset after use; 19nov2012
  prsn @ 1 = IF  \ 2018-10-19: 1st person?
    snu @ 2 = IF  \ plural? 22nov2012
    THEN  \ end of -EN inflection; 22nov2012
  THEN  \ end of test for dba=1;  19nov2012
  prsn @ 2 = IF  \ 2018-10-19: 2nd person?
  THEN  \ end of -T inflection; 22nov2012
  prsn @ 3 = IF  \ 2019-10-07: third person?
    snu @ 1 = IF  \ 2019-10-07: subject-number singular?
      b2 @ 67 =  b1 @ 72 = AND IF  \ 2019-10-07: -CH?
        69 EMIT   \ 2019-10-07: display 69=E
        69 pho !  \ 2019-10-07: 69=E
        AudInput  \ 2019-10-07: for reentry before "S"
      THEN  \ 2019-10-07: end of test for verb ending in "-ch"
      b2 @ 83 =  b1 @ 72 = AND IF  \ 2019-10-08: -SH?
        69 EMIT   \ 2019-10-08: display 69=E
        69 pho !  \ 2019-10-08: 69=E
        AudInput  \ 2019-10-08: for reentry before "S"
      THEN  \ 2019-10-08: end of test for verb ending in "-sh"
      83 EMIT    \ 2019-10-07: display any character;
      83 pho !   \ 2019-10-07: the  character "S" for third person singular
      AudInput   \ 2019-10-07: for re-entry
      32 EMIT    \ 2019-10-07: display any character;
      32 pho !   \ 2019-10-07: intervening space;
      AudInput  \ 2019-10-07: reentry 32=SPACE;
    THEN  \ 2019-10-07:
    snu @ 2 = IF  \ 2019-10-07: plural?
    THEN  \ 2019-10-07: end of -EN inflection
  THEN  \ 2019-10-07: end of test for dba=3;
  1 gencon !   \ 2018i-10-19: to prevent unwarranted calling of Speech.
  0 verbpsi !  \ 2018-10-19: prevent carry-over
;  \ 2019-10-07: EnVerbGen returns to EnVerbPhrase.


:  EnVerbPhrase ( http://ai.neocities.org/EnVerbPhrase.html )
  0 act !  \ 2016aug23: Start with zero to look for psi1 higher than act.
  0 audjuste !  \ 2016aug23: prevent carry-over
  0 motjuste !  \ 2016aug23: prevent carry-over
  0 negjux !  \ 2016aug23: flag for 250=NOT juxtaposed to a verb;
  0 vphraud !  \ 2016aug23: initially
\ whatcon @ 1 =  qv2psi @ 886 =  AND IF  \ 2019-01-09: if WHAT...886=THINK
\   qv1psi @ svo1 !  \ 2018-07-09: use subject of query as subject of response.
\   886 motjuste !   \ 2019-01-09: encourage selection of 886=THINK
\   886 verbpsi !    \ 2019-01-09: let the concept of the verb be 886=THINK
\   0 verblock !     \ 2019-01-09: let activated 886=THINK win selection.
\ THEN  \ 2019-01-09: end of test for WHAT...886=THINK query.
  verblock @ 0 > IF   \ 2019-02-22: if ready to speak a verb...
    wasvcon @ 0 > IF  \ 2019-02-22: if SpreadAct answers query what-AUX-SUBJ-VERB...
      conj @ 0 > IF   \ 2019-02-22: if ConJoin has inseerted a conjunction...
        0 etc !       \ 2019-02-22: reset the counter of activaterd ideas.
        nounlock @ 0 > IF 1 dirobj ! THEN  \ 2019-02-22: prepare to say the direct object.
        EnNounPhrase  \ 2019-02-22: after omitting verb, output its direct object.
        EXIT  \ 2019-02-22: skip saying the verb.
      THEN  \ 2019-02-22: end of test for a conjunction being used.
    THEN   \ 2019-02-22: end of test for a query from SpreadAct.
  THEN  \ 2019-02-22: end of test for a positive verblock.
  wasvcon @ 1 =  qv2psi @ 0 > AND IF  \ 2019-02-22: if what-AUX-SUBJ-VERB query...
    verblock @ 14 psy{ @ nounlock !       \ 2019-09-28: nounlock for direct object
    verblock @ 20 psy{ @ aud !       \ 2019-09-28: auditory recall vector
    verblock @ 20 psy{ @ vphraud !   \ 2019-09-28: auditory recall vector
    qv2psi @  motjuste !  \ 2019-02-20: encourage selection of ideation query-verb.
  THEN  \ 2019-02-20: end of test for WHAT...IDEATION query.
  verblock @ 0 >  motjuste @ 886 NOT =  AND IF  \ 2019-01-09: not 886=THINK
    verblock @ 14 psy{ @  nounlock !  \ 2019-09-28: dir.obj.
    verblock @ 20 psy{ @ aud !       \ 2019-09-28: auditory recall vector
    verblock @ 20 psy{ @ vphraud !   \ 2019-09-28: auditory recall vector
    wasvcon @ 0 > IF  \ 2019-02-22: if SpreadAct answers a what-AUX-SUBJ-VERB query...
      catverb @ motjuste @ =  conj @ 0 > AND IF  \ 2019-02-20: after use of a conjunction
        nounlock @ 0 > IF 1 dirobj ! THEN  \ 2019-02-20: for sake of direct object.
        1 dirobj !  \ 2019-02-22: TEST
        EnNounPhrase  \ 2019-02-20: after omitting verb, output direct-object.
        EXIT  \ 2019-02-20: omit the verb after the use of a conjunction.
      THEN  \ 2019-02-20: end of test for the chain-flag matching the selected verb.
    THEN  \ 2019-02-20: end of test for SpreadAct trying to answer a what-query.
    verblock @ 1 psy{ @ verbpsi !  \ 2017jun15: lexical verbpsi;
    verblock @ 1 psy{ @ svo2 !  \ 2017jun15: item #2 of subj - verb - ind.obj - dir.obj
    verblock @ 5 psy{ @ negjux !  \ 2017jun15: for negation of verb;
    verblock @ 7 psy{ @ prsn !  \ 2018-10-19: for sake of EnAuxVerb or EnVerbGen
    verblock @ 11 psy{ @ 0 > IF verblock @ 11 psy{ @ seq ! THEN \ 2019-09-28
\   verblock @ 11 psy{ @ 0 > IF verblock @ tselp ! THEN \ 2019-09-28: false at first.
\   verblock @ 11 psy{ @ 0 > IF verblock @ tselp ! THEN \ 2019-10-26: using "vtpr"
    verblock @ 14 psy{ @ nounlock !  \ 2019-09-28: tkb becomes nounlock.
    verblock @ 19 psy{ @ 0 > IF verblock @ 19 psy{ @ tvpr ! THEN \ 2019-10-26: time-of-prep
    verblock @ 20 psy{ @ audbase !   \ 2019-09-28: VerbGen parameter;
    verblock @ 20 psy{ @ aud !       \ 2019-09-28: auditory recall vector
    verblock @ 20 psy{ @ vphraud !   \ 2019-09-28: auditory recall vector
    seq @ 0 > wherecon @ 0 = AND IF  \ 2018-11-10: if seq-tag is positive...
      midway @  t @  DO   \ 2018-11-10: search backwards in time.
        I     1 psy{ @ seq @ = IF  \ 2018-11-10: if "seq" concept found...
          I   6 psy{ @ 6 = IF  \ 2018-11-10: if POS is 6=prep...
            I 1 psy{ @ prep !  \ 2018-11-10: identify the preposition as such.
            LEAVE              \ 2018-11-10: one instance of identification is enough.
          THEN  \ 2018-11-10: end of test for part-of-speech 6=prep.
        THEN  \ 2018-11-10: end of search for "seq".
      -1 +LOOP  \ 2018-11-10: end of loop searching for "seq" to discover its "pos".
      BEGIN  \ 2018-11-10: start incrementing time-of-selection-of-preposition
        1 tselp +!  \ 2018-11-10: increment the not-yet-true "tselp" variable
          tselp @  1 psy{ @  eureka !  \ 2018-11-10: hold whatever found as eureka
          tselp @ cns @ > IF LEAVE THEN  \ 2018-11-10: escape from any runaway-loop.
        eureka @ prep @ =  \ 2018-11-10: when the found concept is the preposition
       UNTIL  \ 2018-11-10: stop incrementing tselp at its true value.
    THEN  \ 2018-11-10: end of test for positive seq-tag.
    verblock @ 20 psy{ @ aud       !  \ 2019-09-28: auditory recall-vector
    verblock @ 20 psy{ @ vphraud !  \ 2019-09-28: auditory recall-vector
    verblock @ 20 psy{ @ 0 = IF  \ 2019-09-28: if there is no auditory recall-vector "rv"...
      midway @  tpu @  DO   \ 2018-06-24: search backwards from tpu
        I 1 psy{ @ verbpsi @ = IF  \ 2018-10-19: if the right verb is found
          I 7 psy{ @ prsn @ =  I 8 psy{ @ snu @ = AND IF \ 2018-10-19: person & number
            I 20 psy{ @ 0 > IF I 20 psy{ @ vphraud ! THEN  \ 2019-09-28: positive rv?
            I 20 psy{ @ 0 > IF LEAVE THEN  \ 2019-09-28: one engram is enough.
          THEN  \ 2018-10-19: end of test for correct person and number of verb.
        THEN     \ 2018-06-24: end of test for verbpsi.
      -1 +LOOP   \ 2018-06-24: end of backwards loop.
    THEN  \ 2018-06-24: end of test for no recall-vector rv as in InFerence module.
    subjpsi @ 701 =  subjpsi @ 731 = OR IF  1 prsn ! THEN  \ 2016aug23: I or WE
    subjpsi @ 707 =  subjpsi @ 737 = OR IF  2 prsn ! THEN  \ 2016aug23: "YOU"
    subjpsi @ 713 =  subjpsi @ 719 = OR IF  3 prsn ! THEN  \ 2016aug23: HE; SHE
    subjpsi @ 725 =  subjpsi @ 743 = OR IF  3 prsn ! THEN  \ 2016aug23: IT; THEY
    midway @  tpu @ DO  \ 2018-07-10: search the psy{ array backwards.
      I 1 psy{ @ verbpsi @ =  I 1 psy{ @ 800 = AND IF  \ 2017jun15: 800=BEverb
        I 6 psy{ @ 8 = IF  \ 2017jun15: select only pos=8 verbs, even homonyms
        \ 2016aug23: Following code accepts only a verb-form matching three
        \ requirements: [ ]same concept; [ ]number; and [ ]person:
          I 1 psy{ @ verbpsi @ = IF  \ 2018-07-10: if find verb...
            I 8 psy{ @ subjnum @ =  I  7 psy{ @ prsn @ = AND IF \ 2018-07-10:
              I 20 psy{ @ 0 > IF I 20 psy{ @ aud ! THEN  \ 2019-09-28: find positive rv;
              I 20 psy{ @ 0 > IF I 20 psy{ @ vphraud ! THEN  \ 2019-09-28: find positive rv;
              I 20 psy{ @ 0 > IF LEAVE THEN  \ 2019-09-28: exit loop once rv is found.
            THEN  \ 2018-07-10: end of test for number and person.
          THEN  \ 2018-07-10: end of test for finding verb.
        THEN  \ 2016aug23: end of test for psi3 part-of-speech pos 8=verb
      THEN  \ 2016aug23: end of test for 800=BE verb of being.
      I 1 psy{ @ verbpsi @ = I 1 psy{ @ 800 NOT = AND IF  \ 2017jun15: not 800=BE
        I 6 psy{ @ 8 = IF  \ 2017jun15: select only pos=8 verbs, even homonyms
          I 1 psy{ @ verbpsi @ = IF  \ 2017jun15: non-be-verbs may disregard dba?
            I 20 psy{ @ 0 > IF I 20 psy{ @ aud ! THEN  \ 2019-09-28: find positive rv;
            I 20 psy{ @ 0 > IF I 20 psy{ @ vphraud ! THEN  \ 2019-09-28: find positive rv;
            I 20 psy{ @ 0 > IF LEAVE THEN  \ 2019-09-28: exit loop once rv is found.
          THEN  \ 2016aug23: end of test to find regular or irregular verb-form
        THEN  \ 2016aug23: end of test for part-of-speech pos = "8" (verb).
      THEN  \ 2016aug23: end of test for correct verb-concept verbpsi.
    -1 +LOOP  \ 2016aug23: End of backwards search through conceptual memory.
  THEN  \ 2016aug23: end of test for a positive verblock.
  vphraud @ 0 > IF  vphraud @ aud !  THEN  \ 2016aug23
  vphraud @ 0 > IF vphraud @ audjuste ! THEN  \ 2016aug23: correct form?
  verblock @ 0 = IF  \ 2016aug23: prevent false negations;
    1 dirobj !  \ 2019-02-20: prepare for direct object
    midway @  tpu @  DO   \ 2018-07-10: search backwards from tpu
      I 6 psy{ @ 8 = IF  \ 2018-07-10: select only pos=8 verbs
        whatcon @ 1 = IF  \ 2018-07-10: if what-query is underway...
          I 1 psy{ @ 886 =  qv2psi @ 886 = AND IF  \ 2019-01-09: both 886=THINK?
            I 20 psy{ @ aud !  \ 2019-09-28: recall-vector "rv" for SPEECH
            I 20 psy{ @ vphraud !  \ 2019-09-28: recall-vector "rv" for SPEECH
            LEAVE  \ 2019-01-09: peremptory retrieval of 886=THINK
          THEN  \ 2019-01-09: end of test for concept 886=THINK and qv2psi=THINK.
                  \ verblock @ 6 psy{ @ 8 = IF  \ 2017jun15: select only pos=8 verbs
        THEN  \ 2018-07-10: end of test for positive whatcon.
        I 3 psy{ @ act @ > IF  \ 2018-10-19: if psi3 is higher than "act"...
          I tselv !  \ 2016aug23: retain time of winning verb;
          I   1 psy{ @ motjuste !  \ 2017jun15: Select the most active verb.
          I   1 psy{ @ svo2 !  \ 2018-10-19: for calling VisRecog
          I   3 psy{ @ act !   \ 2018-10-19: to test for a higher psi3 "act(ivation)"
          I 20 psy{ @ audjuste !  \ 2019-09-28: recall-vector rv for speech.
        THEN  \ 2016aug23: end of test of activation-level
      THEN  \ 2018-07-10: end of test for 8=verb part-of-speech.
    -1 +LOOP  \ 2018-07-10: end of loop searching for most active "motjuste"
  THEN  \ 2016aug23: end of test for absence of a verblock from subject to verb
  negjux @ 250 = IF  \ 2016aug23: if verb is negated with 250=NOT;
    svo2 @ 800 = NOT IF  \ 2017jun15: if other than an 800=BE verb;
      818 auxverb !  \ 2018-12-13: 818=DO as auxiliary verb;
      3 prsn !  \ 2016aug25: default third person unless countermanded by pronoun
      subjpsi @ 701 =  subjpsi @ 731 = OR IF 1 prsn ! THEN \ 2016aug25: I or WE
      subjpsi @ 707 =  subjpsi @ 737 = OR IF 2 prsn ! THEN \ 2016aug25: YOU
      aud @ unk !  \ 2018-06-24: hold on to "aud" of verb?
      EnAuxVerb  \ 2018-12-13: to say 818=DO or "DOES";
      0 auxverb !  \ 2016aug23: reset for safety.
      0 prsn !       \ 2016aug25: reset for safety
      midway @  t @  DO  \ 2016aug23: search for 250=NOT
        I 1 psy{ @ 250 = IF  \ 2017jun15: if 250=NOT is found;
          I 20 psy{ @ audjuste !  \ 2019-09-20: recall-vector of "NOT"
          I 20 psy{ @ aud !  \ 2019-09-28: "NOT" recall-vector for speech.
          I 20 psy{ @ 0 > IF  I 20 psy{ @ aud ! LEAVE THEN \ 2019-09-28: insurance
        THEN  \ 2016aug23: End of search for 250=NOT.
      -1 +LOOP   \ 2016aug23: End of search loop from time "t" back to midway.
      Speech     \ 2017-09-17: speak the word starting at the "aud" time.
      0 aud !    \ 2018-06-24: reset for safety.
      0 audjuste ! \ 2018-12-15 BUGFIX: reset for safety.
    THEN  \ 2016aug23: end of test to prevent auxiliary with 800=BE verb.
  THEN  \ 2016aug23: end of test for 250=NOT negjux.
  audjuste @ aud !  \ 2016aug28: for transfer into speech module
  verbpsi @  motjuste !   \ 2018-10-19: to search for verb-form.
  vphraud @ 0 > IF vphraud @ aud !  THEN  \ 2016aug23: correct form?
  subjpsi @ 701 = IF  1 dba ! THEN  \ 2016aug28: "I" 1st person sing.
  subjpsi @ 707 = IF  2 dba ! THEN  \ 2016aug28: "you" 2nd person sing.
  subjpsi @ 713 = IF  3 dba ! THEN   \ 2016aug28: "he" 3rd person sing;
  subjpsi @ 719 = IF  3 dba ! THEN   \ 2016aug28:  "she" 3rd person sing.
  subjpsi @ 725 = IF  3 dba !  THEN   \ 2016aug28: "it" 3rd person sing.
  subjpsi @ 731 = IF  1 dba !  THEN   \ 2016aug28: "we" 1st person plural
  subjpsi @ 737 = IF  2 dba !  THEN   \ 2016aug28: "you" 2nd person plural
  subjpsi @ 743 = IF  3 dba !  THEN   \ 2016aug28: "they" 3rd person plural
  vphraud @ 0 > IF vphraud @ aud !  THEN  \ 2016aug23: correct form?
  vphraud @ 0 = IF   \ 2016aug28:  if not substituted above;
    midway @  krt @  DO  \ 2016aug28: skip post-krt current engrams.
      motjuste @ 0 >  I 1 psy{ @ motjuste @ = AND IF  \ 2018-06-24: seek motjuste
        I 20 psy{  @  audbase !  \ 2019-09-28: location of quasi-stem for VerbGen.
        negjux @ 250 = IF  0 dba ! 0 snu ! THEN  \ 2018-12-15: after "NOT" use infinitive
        I  7 psy{ @  dba @  = IF  \  2017jun15: for proper person of verb;
          I 8 psy{ @  snu @  = IF   \ 2017jun15: subject number parameter;
            I 20 psy{ @ 0 > IF I 20 psy{ @ vphraud ! THEN  \ 2019-09-28:
            LEAVE   \ 2016aug28: exit the loop after first find.
          THEN   \ 2016aug28: end of subject number-parameter test;
        THEN   \ 2016aug28: end of dba-parameter test.
      THEN   \ 2016aug28: end of test to find regular or irregular motjuste-verb.
    -1 +LOOP   \ 2016-08-27: loop backwards
  THEN  \ 2016aug28: end of test of vphraud.
  vphraud @ 0 = IF  EnVerbGen THEN  \ 2018-10-19: if no verb-form, generate it.
  vphraud @ 0 > IF vphraud @ aud ! THEN  \ 2018-06-24: correct form?
  Speech     \ 2017-09-17: send recall-vector into Speech module.
  1 dirobj !   \ 2019-02-22: TEST; REVERT? REMOVE?
  0  aud !  \ 2016aug23: Reset to prevent carry-over.
  tselv @ 0 > IF   \ 2016aug29: only inhibit a selected verb
    -16 tselv @ 3 psy{ !  \ 2017jun15: insert neural inhibition upon currently selected verb.
  THEN  \ 2016aug29: end of test for a positive "tselv"
\ tselp @ 0 > prep @ 0 > wherecon @ 0 = AND IF SpreadAct THEN \ 2018-11-10
\ tselp @ 0 > prep @ 0 > wherecon @ 0 = AND IF SpreadAct THEN \ 2018-12-21: for EnThink?
  svo2 @ 800 = IF  \ 2017-06-15: if the selected verb is a be-verb
    negjux @ 250 = IF  \ 2017-06-15: if there is a 250=NOT negation flag
      midway @  t @  DO  \ 2017jun15: search for 250=NOT
        I 1 psy{ @ 250 = IF  \ 2017jun15::  if 250=NOT is found;
          I 20 psy{ @ audjuste !  \ 2019-0928: recall-vector of "NOT"
          I 20 psy{ @ aud !  \ 2019-09-28: "NOT" recall-vector for speech.
          I 20 psy{ @ 0 > IF  I 20 psy{ @ aud ! LEAVE THEN \ 2019-09-28: insurance
        THEN  \ 2017jun15: End of search for 250=NOT.
      -1 +LOOP   \ 2017jun15: End of search loop from time "t" back to midway.
      Speech     \ 2017-09-17: speak the word starting at the "aud" time.
      0 negjux !  \ 2017-06-15: reset for safety.
    THEN  \ 2017-06-15: end of test for negated be-verb
  THEN  \ 2017-06-15: end of test for 800=BE verb in case of negation.
  nounlock @ 0 > IF  1 dirobj !  THEN  \ 2018-10-07: for sake of intransitive verb
  subjpsi @  701 =  IF  \ 2019-11-05:
    svo2 @  823 = IF  \ 2019-11-05
      svo4 @  0 = IF  \ 2019-11-05: if 823=FEEL has no direct object...
        TacRecog  \ 2019-11-05: to supply a direct object for 823=FEEL.
        haptac @ 755 = NOT IF  EnArticle  THEN  \ 2019-11-05: insert "A" or "THE"
        midway @  t @  DO   \ 2019-11-05: search backwards in time
          I      1 psy{ @ haptac @ = IF   \ 2019-11-05:
            I   20 psy{ @  aud !     \ 2019-11-05: auditory recall-vector
          THEN   \ 2019-11-05: end of test for haptac as reported by TacRecog.
        -1 +LOOP  \ 2019-11-05: end of backwards loop.
        Speech     \ 2019-11-05: Say the direct object starting at "aud" value;
        0 hap !     \ 2019-11-05: reset after use.
        0 haptac !  \ 2019-11-05: reset after use.
      THEN  \ 2019-11-05: end of test for no direct object of 823=FEEL.
    THEN  \ end of test for 823=FEEL verb.
  THEN  \ 2019-11-05: end of test for 701=I subject.
  dirobj @ 1 =  nounlock @ 0 > AND IF  \ 2019-02-24: if the verb has a direct object...
    EnNounPhrase  \ 2018-10-07:
    actpsi @ 0 > IF     \ 2018-10-07: if there is activation to spread...
      SpreadAct         \ 2018-10-07: for a chain of thought.
      0 actpsi !        \ 2018-10-07: reset to zero for safety
    THEN  \ 2018-10-07: end of test for positive actpsi
  THEN  \ 2018-10-07: end of test for a direct object.
  tvpr @ 0 > IF  \ 2019-10-26: if time-of-verb-preposition...
    EnPrep  \ 2019-10-26: for a prepositional phrase
    0 tvpr !  \ 2019-10-26: reset for safety.
  THEN  \ 2019-10-26: end of test for a preposition linked to the verb-phrase.
  0 dirobj !   \ 2016aug28: reset flag after thinking direct object.
  prepgen @ 0 > IF  EnPrep THEN   \ 2016aug28:  if "Where?" call EnPrep.
  0 audbase !   \ 2016aug28: reset for safety.
  0 dirobj !  \ 2016aug23: reset flag after thinking direct object.
;  \ 2019-09-30: EnVerbPhrase returns to Indicative.


:  InFerence ( http://ai.neocities.org/InFerence.html )
  1 moot !  \ 2018-06-21: prevent interference via tag-forming;
  prednom @  0 >  IF  \ 2018-06-21: positive predicate nominative?
    midway @  t @  DO  \ 2018-06-21: search KB to infer facts;
      I 1 psy{ @ prednom @ =  I 8 psy{ @ 2 =  AND IF  \ 2018-06-21: plural KB data?
        I 7 psy{ @ 1 = IF  \ 2018-06-21: nominative?
          seqverb @ 0 = IF  \ 2018-06-21: only once;
            I 11 psy{ @  seqverb ! \ 2019-09-29: hold to be the verb of an inference.
            I 11 psy{ @  quverb ! \ 2019-09-29: query-verb for AskUser;
            I 14 psy{ @  seqtkb ! \ 2019-09-29: hold for fetching same direct object.
            0 ynverb !  \ 2018-06-21: since lacking, use quverb for AskUser
            seqverb @ seq !  \ 2018-06-21: to be inferred as applying to subject.
          THEN  \ 2018-06-21: end of test for not-yet-declared seqverb.
        THEN  \ 2018-06-21: end of test for nominative.
      THEN  \ 2018-06-21: end of test for fact about prednom as plural subject.
    -1 +LOOP   \ 2018-06-21: end of backwards search-loop.
  THEN  \ 2018-06-21: end of test for positive predicate nominative.
  seqverb @  0 > IF  \ 2018-06-21: verb available for inference?
    t @ inft !  \ 2018-06-21: for AskUser to find auditory engrams;
    1 t +!  \ 2018-06-21: increment time "t" by one for a gap;
    1 t +!  \ 2018-10-190: increment time to prepare for subject noun-row
    subjnom @  t @  1 psy{ !  \ 2018-06-21: subj of inference;
    t @ 1 +  t @  14 psy{ !  \ 2019-09-29: psy1 = tkb;
    48       t @   3 psy{ !  \ 2018-06-21: activation of inference;
    5        t @   6 psy{ !  \ 2018-06-21: pos=5 noun;
    1        t @   7 psy{ !  \ 2018-06-21: default nominative dba;
    qusnum @ t @   8 psy{ !  \ 2018-06-21: query-subject njumber
    seqverb @         seq !  \ 2018-06-21: prevent override?
    seqverb @ t @ 11 psy{ !  \ 2019-09-29: seq is the verb;
    0         t @ 20 psy{ !  \ 2019-10-01: pseudo-recall-tag for expanded flag-panel.
    t @ tkbn !  \ 2018-06-21: conceptual array-time for subject-noun of AskUser query.
    1 t +!  \ 2018-06-21: increment time for storage of inference-verb;
    seqtkb @  11 psy{ @  dobseq !  \ 2019-09-29: psi11 "seq" for next insertion.
    dobseq @ quobj !  \ 2018-06-21: so AskUser will use the particular dir.obj.
    seqverb @  t @  1 psy{ !  \ 2018-06-21: verb of inference;
    8          t @  6 psy{ !  \ 2018-10-19: 8=pos verb for sake of EnVerbGen.
    3          t @  7 psy{ !  \ 2018-10-19: 3=dba based on singular Is-A status
    1          t @  8 psy{ !  \ 2018-10-19: 1=num based on singular Is-A status
    subjnom @  t @ 10 psy{ !  \ 2018-06-21: subject becomes "pre" of verb.
    dobseq  @  t @ 11 psy{ !  \ 2019-09-29: direct object becomes "seq" of verb.
    t @ 1 +    t @ 14 psy{ !  \ 2019-09-29: in silent inference tkb is next time-point.
    t @ tkbv !  \ 2018-06-21: conceptual array-time for verb of AskUser query.
    1 t +!  \ 2018-06-21: increment t to store direct object;
    t @ tkbo !  \ 2018-06-21: conceptual array-time for object-noun of AskUser query.
    seqtkb @  11 psy{ @  t @  1 psy{ !  \ 2019-09-29: dir. obj
    seqtkb @  20 psy{ @  seqrvx !  \ 2019-09-29: may be useless if always zero.
    40   t @   3 psy{ !  \ 2018-06-21: activation of inferred direct object.
    5    t @   6 psy{ !  \ 2018-10-19: 5=pos noun of direct object
    2    t @   8 psy{ !  \ 2018-12-15: plural object as required for an inference.
    seqrvx @  20 psy{ !  \ 2019-09-29: recall-vector of inferred direct object.
    dobseq @ quobj !     \ 2018-06-22: for transfer to AskUser;
    1 t +!  \ 2018-06-21: increment time "t" for an ending gap.
    1 yncon ! \ 2018-06-21: for AskUser to ask yes-or-no question.
    subjnom @ qusub !  \ 2018-06-21: for transfer to AskUser.
  THEN  \ 2018-06-21: end of test for a verb to be part of inference.
  0 becon !    \ 2018-06-19: reset after use.
  0 dobseq !   \ 2018-06-21: reset after use.
  0 moot !     \ 2018-06-21: reset after use.
  0 prednom !  \ 2018-06-21: reset after use.
  0 seqdob !   \ 2018-06-21: reset after use.
  0 seqrvx !   \ 2018-06-21: reset after use.
  0 seqtkb !   \ 2018-06-21: reset after use.
  0 seqverb !  \ 2018-06-21: reset after use.
  0 subjnom !  \ 2018-06-21: reset after use.
;  \ 2019-10-01: InFerence returns to EnThink.


:  Indicative ( http://ai.neocities.org/Indicative.html )
  0 nounlock !  \ 2019-02-25: reset before calls to EnNounPhrase or EnVerbPhrase.
  0 verblock !  \ 2019-02-25: reset before calls to EnNounPhrase or EnVerbPhrase.
  0 moot !   \ 2018-06-19: start with no suppression of associative tags.
  1 pov !    \  2018-06-19: thinking occurs in self or "I" mode.
  0 rv !     \ 2018-06-19: lest rv fail to be at zero for AudInput
  0 tdj !    \ 2019-10-05: reset because time-of-adjective is not yet used.
  0 tdo !    \ 2018-06-19: reset time-of-direct-object for safety.
  0 tsj !    \ 2019-10-05: let Indicative generation declare new time-of-subject.
  0 tvb !    \ 2018-06-19: reset time-of-verb for safety before thinking.
  dunnocon @ 1 = IF  \ 2018-10-07: if AI cannot answer a query with knowledge
    midway @  vault @  DO   \ 2018-10-07: search backwards inside KB vault
      I 1 psy{ @ 701 =  I 11 psy{ @ 838 =  AND IF \ 2019-09-29: if I...KNOW...
        32 I 0 psy{ !  \ 2019-01-08 bugfix: elevate activation of truth-value tru
       256 I 3 psy{ !  \ 2019-01-08 BUGFIX: highly activate "I DO NOT KNOW"
       250 I 5 psy{ !  \ 2019-01-08 bugfix: make sure "KNOW" is negated.
       LEAVE  \ 2018-10-07: skip rest of KB vault.
      THEN  \ 2018-12-12: end of test for 701=I and 838=KNOW.
    -1 +LOOP   \ 2018-10-07: end of backwards search loop within "vault".
  THEN  \ 2018-10-07: end of test for flag requiring answer "I DO NOT KNOW".
  0 qucon !  \ 2018-06-19: reset for safety.
  EnNounPhrase  \ 2018-06-19: fetch noun or pronoun as subject of thought.
  EnVerbPhrase  \ 2018-06-19: call the module to select an English verb.
  dunnocon @ 1 = IF  \ 2018-10-07: prepare to change flag after output...
    midway @  vault @  DO   \ 2018-10-07: search backwards inside KB vault
      I 1 psy{ @ 701 =  I 12 psy{ @ 838 =  AND IF \ 2018-12-12: if I...KNOW...
         0 0 psy{ !  \ 2018-10-07: remove elevation of truth-value "tru"
         0 3 psy{ !  \ 2018-10-07: remove activation from  "I DO NOT KNOW"
       LEAVE  \ 2018-10-07: skip rest of KB vault.
      THEN  \ 2018-12-12: end of test for 701=I and 838=KNOW.
    -1 +LOOP   \ 2018-10-07: end of backwards search loop within "vault".
  THEN  \ 2018-10-07: end of test for "dunnocon" flag after its output.
  0 dba !         \ 2019-10-04: prevent carry-over in InStantiate.
  0 nounlock !    \ 2018-06-19: reset for safety.
  0 nphrpos !     \ 2018-09-07: after interplay of EnNounPhrase and EnArticle
  0 prednom !     \ 2019-10-08: reset for the sake of InFerence
  0 qucon !       \ 2018-06-19: reset to prevent unwarranted SpreadAct.
  0 svo1 !        \ 2018-06-19: reset subject-verb-object values for safety.
  0 qv1psi !      \ 2018-06-19: reset SpreadAct subject-psi for safety.
  0 svo2 !        \ 2018-06-19: reset subject-verb-object values for safety.
  0 qv2num !      \ 2018-06-19: reset after output of one query-response.
  0 svo3 !        \ 2018-06-19: reset subject-verb-object values for safety.
  0 svo4 !        \ 2018-06-19: reset subject-verb-object values for safety.
  0 seqpsi !      \ 2018-06-19: reset for the sake of SpreadAct
  0 subjnom !     \ 2019-10-08: reset for the sake of InFerence
  0 tsj !         \ 2019-10-06: reset time-of-subject for safery.
  0 tvb !         \ 2018-06-10: reset time-of-verb for safety.
  0 verblock !    \ 2018-06-10: reset for safety.
  PsiDecay        \ 2018-06-19: Reduce conceptual activation after each thought.
  5 bias !        \ 2018-06-19: expect a noun, in case user inputs unknown word.
;  \ 2019-10-04: Indicative returns to EnThink.


:  Imperative ( http://ai.neocities.org/Imperative.html )
  1 moot !  \ 2018-09-23: prevent forming of associative tags.
  7 EMIT    \ 2018-09-23: sound a beep to attract human attention.
  midway @  t @  DO   \ 2018-09-23: search backwards; "vault" is reliable.
    I           1 psy{ @ 884 = IF  \ 2019-01-10: 884=TEACH;
      I   20 psy{ @  aud !  \ 2019-09-29: auditory recall-vector
      LEAVE                 \ 2018-09-23: one engram is enough.
    THEN      \ 2019-01-10: end of test for 884=TEACH;
  -1 +LOOP  \ 2018-09-23: end of backwards loop.
  Speech     \ 2018-09-23: Say word starting at "aud" value;
  midway @  t @  DO   \ 2018-09-23: search backwards
    I           1 psy{ @ 701 = IF  \ 2018-09-23: 701=I
      I         8 psy{ @ 1 = IF     \ 2018-09-23: singular?
        I      7 psy{ @ 3 = IF     \ 2018-09-23: dative ME?
          I   20 psy{ @  aud !      \ 2019-09-29: auditory recall-vector
          LEAVE                     \ 2018-09-23: one engram is enough.
        THEN  \ 2018-09-23: end of test for dative;
      THEN    \ 2018-09-23: end of test for num=1 singular;
    THEN      \ 2018-09-23: end of test for 701=I;
  -1 +LOOP  \ 2018-09-23: end of backwards loop.
  Speech     \ 2018-09-23: Say word starting at "aud" value;
  midway @  t @  DO   \ 2018-09-23: search backwards; "vault" is reliable.
    I           1 psy{ @ 755 = IF  \ 2018-09-23: 755=SOMETHING;
      I   20 psy{ @  aud !  \ 2019-09-29: auditory recall-vector
      LEAVE                 \ 2018-09-23: one engram is enough.
    THEN      \ 2018-09-23: end of test for 755=SOMETHING;
  -1 +LOOP  \ 2018-09-23: end of backwards loop.
  Speech     \ 2018-09-23: Say word starting at "aud" value;
  0 moot !  \ 2018-09-23: end prevention of associative tags.
;  \ 2019-09-29: Imperative returns to the English-thinking EnThink module.


:  EnThink ( http://ai.neocities.org/EnThink.html )
\ CR ." EnThink: " \ 2019-10-02: next five diagnostic lines show values of variables.
\ ." becon= " becon @ .  ." yncon= " yncon @ . ." ynverb= " ynverb @ . ." inft= " inft @ . CR
\ ." qusub= " qusub @ . ." qusnum= " qusnum @ .  ." subjnom= " subjnom @ .
\ ." prednom= " prednom @ . ." tkbn= " tkbn @ .  CR
\ ." quverb= " quverb @ . ." seqverb= " seqverb @ . ." seqtkb= " seqtkb @ . ." tkbv= " tkbv @ . CR
\ ." quobj= " quobj @ . ." dobseq= " dobseq @ .  ." kbzap= " kbzap @ . ." tkbo= " tkbo @ . CR
  0 catverb !  \ 2019-02-20: reset for safety.
  isolation @ 60 > IF  \ 2018-11-16: if no input for arbitrary duration...
    Imperative  \ 2018-09-23: Issue a plea for input from a human user.
    0 impetus !  \ 2018-09-23: reset the trigger for calling Imperative.
    0 isolation !  \ 2018-10-07: reset the trigger for calling Imperative.
    EXIT  \ 2018-09-23: abandon EnThink; give human user a chance to respond.
  THEN  \ 2018-09-23: end of test for trigger to call Imperative.
  qucon @ 1 = IF  \ 2018-12-18: upon a query
    SpreadAct  \ 2018-12-18: to activate concepts in response to a query.
  THEN  \ 2018-12-18: end of test for a query-condition.
  wasvcon @ 1 = IF SpreadAct THEN  \ 2019-02-22: set by InStantiate
  whatcon  @ 1 = IF  SpreadAct THEN  \ 2018-10-07: set by InStantiate
\ whatcon  @ 1 = IF  SpreadAct THEN  \ 2018-12-18: handled by new code above
  wherecon @ 1 = IF  SpreadAct THEN  \ 2018-11-15: set by InStantiate
\ wherecon @ 1 = IF  SpreadAct THEN  \ 2018-12-18: handled by new code above
  1 inhibcon !   \ 2016sep04: prevent reentrant concepts from directly activating.
  1 pov !  \ 2016aug23: thinking occurs in self or "I" mode.
  kbcon @  0 >  IF  \ 2018-06-22: if user answers yes-or-no question;
    KbRetro         \ 2018-06-22: retroactively adjust knowledge base;
    0 kbcon !       \ 2018-06-22: reset for safetry.
    0 kbzap !       \ 2018-06-22: reset for safety.
  THEN  \ 2018-06-22: User has had one chance to answer yes-or-no question.
  t @ inft !  \ 2018-06-22: in case inference-time not otherwise set;
  becon @ 1 = IF  \ 2018-06-19: if flag set in OldCOncept;
    InFerence  \ 2018-06-19:  call the passively reflective module;
  THEN  \ 2018-06-19: end of test for input of a be-verb statement.
  yncon @ 1 = IF  \ 2018-06-21: set in the InFerence module
    AskUser  \ 2018-06-21: for yes-or-no query about inferred idea;
    EXIT     \ 2018-06-21: skip the remainder of EnThink.
  THEN  \ 2018-06-21: end of test to trigger asking a question.
\ actpsi @  0 >  IF  \ 2018-12-21: if set e.g. by a direct object in EnVerbPhrase
\   SpreadAct  \ 2018-12-21: for a simple non-query spreading of activation
\   0 actpsi !  \ 2018-12-21: reset to zero for safety
\ THEN  \ 2018-12-21: end of test for a concept warranting spread of activation.
  Indicative    \ 2018-06-19: think in the indicative mood.
\ ConJoin  \ 2018-07-09: Output one more idea with sufficient activation.
\ ConJoin  \ 2019-02-20: now setting new conditions for calling ConJoin...
  etc @ 1 > IF  \ 2019-02-20: if multiple active thoughts....
    ConJoin     \ 2019-02-20: insert a conjunction.
    Indicative  \ 2019-02-20: include an idea conjoined with AND.
  THEN  \ 2019-02-20: end of test for presence of several activated ideas.
  whatcon @ 1 =  conj @ 0 > AND IF  \ 2018-07-09: for a conjoined idea...
    0 conj !  \ 2018-07-10: TEST
    0 whatcon !  \ 2018-09-23: reset to prevent run-on thoughts.
    Indicative    \ 2018-07-09: think in the indicative mood.
    0 qv1psi !  \ 2018-07-10: against repetition of subject;
    0 qv2psi !  \ 2018-07-10: against repetition of verb;
    0 whatcon !  \ 2018-07-10: so EnNounPhrase may use verblock.
  THEN  \ 2018-07-09: end of whatcon-test in favor of subordinate clause.
  PsiDecay  \ 2016aug27: Reduce activation after each thought.
  0 conj !  \ 2018-07-09:  prevent carry-over.
  0 inhibcon !   \ 2016sep04: remove restriction of inhibcon.
  0 qv2psi !  \ 2018-07-10: reset to prevent verb-repetition.
  0 svo1 !  \ 2017-06-15: reset subject-verb-object values for safety.
  0 svo2 !  \ 2017-06-15: reset subject-verb-object values for safety.
  0 svo3 !  \ 2017-06-15: reset subject-verb-object values for safety.
  0 svo4 !  \ 2017-06-15: reset subject-verb-object values for safety.
  0 tdo !   \ 2016aug28: reset time-of-direct-object for safety.
  0 tio !    \ 2016aug28: reset time-of-indirect-object for safety.
  0 verblock !   \ 2016aug28: reset for safety.
  fyi @ 0 = IF 0 CR THEN   \ 2018-11-22: display one thought per line.
;  \ 2019-02-20: EnThink returns to FreeWill Volition module.


:  Motorium ( http://ai.neocities.org/Motorium.html )
   7 EMIT  \ 2019-10-04: sound a beep
 ( MOVE_FORWARD   )
 ( MOVE_BACKWARDS )
 ( ROTATE -- Volition initiates action if wish is insistently repeated )
 ( STOP_MOTION    )
 ( TURN_LEFT      )
 ( TURN_RIGHT     )
 \ http://ai.neocities.org/Skynet.html
  \ http://www.strobotics.com
   \ http://strobotics.com/roboforth.htm
;   \ 2019-10-04: Robot Motorium module returns to Volition.


:  Security ( Security added to IndraMind 2021-1-11 )
   7 EMIT  \ 2021-1-11: sound a beep
; \ 2021-1-11: Securit stub

: Volition ( http://ai.neocities.org/Volition.html )
  ( EmotiOn )  \ 2016aug18: Influence of physiology upon thinking.
  0 aud !         \ 2016aug30: zero out to prevent carry-over
  0 motjuste !  \ 2016aug30: zero out to prevent carry-over
  0 rv !            \ 2016aug30: zero out to prevent carry-over
\ 0 tsj !           \ 2016sep03: zero out to prevent carry-over
\ 0 tsj !           \ 2019-10-04: causing interference? TEST; REVERT?
  0 verbcon !   \ 2016sep03: zero out to prevent carry-over
  0 vphraud !   \ 2016aug30: zero out to prevent carry-over
  isolation @ 7 > IF  \ 2019-01-15: if no input for a long time...
    1 whoq !   \ 2019-01-15: set who-question flag positive
  THEN  \ 2019-01-15: end of test of invoking AskUser for eho-question.
  whoq @ 1 = IF  \ 2019-01-15: if waiting to ask a who-question...
    isolation @ 0 = IF  \ 2019-01-15: if user input ends "isolation"...
      AskUser    \ 2019-01-15: call module to ask a who-question
    THEN  \ 2019-01-15: end of test for commencement of user input.
  THEN  \ 2019-01-15: end of test for a positive flag to ask a question.
  t @ tai !  \ 2016aug29: hold onto time-point for display of MindGrid thinking.
  EnThink  \ 2016aug18: For generation of thoughts in English.
  ( Motorium ) \ 2017-09-17: Requires robot embodiment.
  \ 2016aug18: integration of thinking and emotion controls actuators.
;  \ 2019-09-30: Robot FreeWill Volition module returns to MainLoop.


:  MainLoop ( http://ai.neocities.org/MainLoop.html )
  TIME&DATE byear ! bmonth ! bday ! bhour ! bminute ! bsec !
  Security    \ 2021Jan13 Added Security Stub
  TabulaRasa      \ 2016aug29: clear memory in advance of AI.
  MindBoot  \ 2016JUL26: runs once before the main loop
  CR ." ESCape to quit AI; bye to end Forth; EXIT from DOS." CR
  CR ." Press any numeric key to touch the INDRA in the Machine." CR
  BEGIN  \ 2016JUL26: start the main loop...
    1 isolation +!  \ 2018-10-07: increment incentive for Imperative.
    t @  cns @ 64 - > IF ReJuvenate THEN  \ 2016sep06: near end of memory.
    t @ tin !  \ 2016aug29: time-of-input for interactive display )
    t @ tpu !  \ 2018-06-24: isolate tpu from lower input-and-output
    Sensorium  \ 2017-09-17: For perception of external world.
    whatcon @ 1 = IF  SpreadAct THEN  \ 2019-02-24: set by InStantiate.
    Volition   \ 2017-09-17: Goal-selection based on thinking.
\   fyi @ 0 > IF   \ 2016aug28: display MindGrid and trough of inhibition
    fyi @ 3 > IF   \ 2018-11-22: display MindGrid and trough of inhibition
      CR   ." The arrays psy{ and ear{ show your input and the AI output: " \ 2016aug28
      CR  ." time: tru psi hlc act mtx jux pos dba num mfn pre seq tgn " \ 2019-09-29
      ." tdt tkb tia tcj tdj tdv tpr rv -- pho act audpsi " CR  \ 2019-09-29
      t @ 1+  tin @ DO  \ 2016aug29: show the recent input and AGI thinking.
        CR I . ." : "
        I  0  psy{ @ . ." "    \ 2017JUN14: Show tru
        I  1  psy{ @ . ." "    \ 2017JUN14: Show psi
        I  2  psy{ @ . ." "    \ 2017JUN14: Show hlc
        I  3  psy{ @ . ." "    \ 2017JUN14: Show act
        I  4  psy{ @ . ." "    \ 2017JUN14: Show mtx
        I  5  psy{ @ . ." "    \ 2017JUN14: Show jux
        I  6  psy{ @ . ." "    \ 2017JUN14: Show pos
        I  7  psy{ @ . ." "    \ 2017JUN14: Show dba
        I  8  psy{ @ . ." "    \ 2017JUN14: Show num
        I  9  psy{ @ . ." "    \ 2017JUN14: Show mfn
        I 10  psy{ @ . ." "    \ 2017JUN14: Show pre
        I 11  psy{ @ . ." "    \ 2019-09-28: Show seq
        I 12  psy{ @ . ." "    \ 2019-09-28: Show tgn
        I 13  psy{ @ . ." "    \ 2019-09-28: Show tdt
        I 14  psy{ @ . ." "    \ 2019-09-28: Show tkb
        I 15  psy{ @ . ." "    \ 2019-09-28: Show tia
        I 16  psy{ @ . ." "    \ 2019-09-28: Show tcj
        I 17  psy{ @ . ." "    \ 2019-09-28: Show tdj
        I 18  psy{ @ . ." "    \ 2019-09-28: Show tdv
        I 19  psy{ @ . ." "    \ 2019-09-28: Show tpr
        I 20  psy{ @ . ."   "  \ 2019-09-28: Show rv
        I  0  ear{ @ . ." "  \ 2016aug28: Show ear{ ASCII
        I  1  ear{ @ . ." "  \ 2016aug28: Show activation
        I  2  ear{ @ .       \ 2016aug28: Show audpsi concept number
        I  0  ear{ @ EMIT ."  "   \ 2016aug04: Show ear{ pho
     LOOP  ( 2016aug28: end of forwards loop through cns time-points )
    CR ." time: tru psi hlc act mtx jux pos dba num mfn pre seq tgn "  \ 2019-09-29
    ." tkb tia tcj tdj tdv tpr rv "  \ 2019-09-29
    10 EMIT  \ 2016aug29: ASCII 10=LF (line feed, new line)
    CR ." Robot alive since "  byear @ . 8 EMIT 45 EMIT
    bmonth @ 10 < IF 48 EMIT THEN  \ 2016sep06: display zero for JAN-SEP.
    bmonth @ .  8 EMIT   45 EMIT
    bday @ 10 < IF 48 EMIT THEN  \ 2016sep06: display zero for 01-09.
    bday @ . 8 EMIT  58 EMIT ." TAB to change display mode; fyi= " fyi @ . CR \ 2018-11-22
    t @   tai @ DO  \ 2019-02-22:
      I  0 ear{ @ EMIT  \ 2016aug29: Show utterance of robot.
    LOOP    \ 2016aug29: up to present time
  THEN  \ 2016aug28: end of permission for display of MindGrid
  AGAIN  \ 2016JUL26: Continue looping until stopped.
; ( 2019-09-20: MainLoop is at logical top of program; enter "MainLoop" to start. )

\ 2018-10-23: Following changelog entries may safely be deleted from MindForth AI.
\ agi00001.F begins port from Perl back into Win32Forth.
\ agi00002.F has AudInput call AudListen for input.
\ agi00003.F begins to store input characters in AudMem.
\ agi00004.F initiates OldConcept; expands AudRecog module.
\ agi00005.F completes AudRecog module in need of debugging.
\ agi00006.F debugs AudRecog; stubs in EnParser; InStantiate
\ agi00007.F improves AudInput calling OldConcept and NewConcept.
\ agi00008.F stores recognized old concept or creates a new concept.
\ agi00009.F stubs in EnThink and NounPhrase AGI mind-modules.
\ agi00010.F initiates the AudDamp module to deactivate engrams.
\ agi00011.F stores audpsi retroactively for OldConcept or NewConcept.
\ agi00012.F resolves problems with recognition of one-letter words.
\ agi00013.F doubles cns to 256; embeds words in AGI MindBoot KB.
\ agi00014.F doubles cns to 512; embeds forms of "I" and verb "BE".
\ agi00015.F doubles cns to 1024.
\ agi00016.F MainLoop > EnThink > EnNounPhrase > SpeechAct.
\ agi00017.F moves knowledge base (KB) ontology to start of MindBoot.
\ agi00018.F inserts essential adjectives into MindBoot century 100.
\ agi00019.F expands MindBoot with concept numbers assigned to nouns.
\ agi00020.F finishes sentences of innate knowledge at start of MindBoot.
\ agi00021.F reveals major problems lurking in the AudRecog module.
\ agi00022.F builds AudRecog back up from scratch instead of debugging.
\ agi00023.F finishes allocation of time-points for AGI MindBoot sequence.
\ agi00024.F fleshes out the EnNounPhrase Robot Forth AGI mind-module.
\ agi00025.F fleshes out most of Robot AGI mind-module EnVerbPhrase.
\ agi00026.F removes problem of 13=CR stopping AudInput too early.
\ agi00027.F fleshes out EnAuxVerb module for search by parameter.
\ agi00028.F begins the re-entry of output back into the robot AI Mind.
\ agi00029.F after human input achieves associative response and re-entry.
\ agi00030.F fleshes out OldConcept module and SpreadAct mind-module.
\ agi00031.F in MindGrid creates advancing trough of inhibition + PsiDecay.
\ agi00032.F implements the extra Parser module ported from ghost175.pl
\ agi00033.F sets proper recall-vector "rv" for external input and re-entry.
\ agi00034.F displays the MindGrid arrays of user input and AGI output.
\ agi00035.F implements TabulaRasa module; debugs Parser module.
\ agi00036.F solves bug of re-interpreted YOU/I engrams not being found.
\ agi00037.F stubs in modules GusRecog OlfRecog TacRecog VisRecog.
\ agi00038.F sends noun, not pronouns, into improved SpreadAct module.
\ agi00039.F ameliorates bug of Parser setting dba=4 for wrong "tdo".
\ agi00040.F handles indirect objects better after resets in SensoryInput.
\ agi00041.F exits from EnNounPhrase rather than supply spurious "nounlock".
\ agi00042.F inhibits each resurrection in turn of the default ego-concept.
\ agi00043.F implements the ReJuvenate module for Robot AI immortality.
\ agi00044.F fixes AudRecog bug by de-activating non-match pho as in Perl.
\ agi00045.F thoroughly revamps the activation-of-ego by default code.
\ agi00046.F 2017-06-14: starts to add in tru and mtx variables; adds German.
\ agi00047.F 2017-06-15: removes German MindBoot; finishes tru and mtx inclusion.
\ agi00048.F 2017-06-16: removes lines commented out for insertion of "tru" and "mtx".
\ agi00049.F 2017-09-01: stubs in the EnArticle module for articles "a" and "the".
\ agi00050.F 2017-09-14: consolidates EnParser on a par with ghost226.pl AI.
\ agi00051.F 2017-09-17: cleans up EnParser; adds mind-module documentation webpages.
\ agi00052.F 2018-06-19: implements Indicative; calls SpreadAct for direct objects.
\ agi00053.F 2018-06-20: fixes bug of verbcon being reset in AudInput -- too early.
\ agi00054.F 2018-06-21: implements InFerence module as port from JavaScript AI Mind.
\ agi00055.f 2018-06-22: implements AskUser and KbRetro for confirmation of inference.
\ agi00056.F 2018-06-24: debugs KbRetro for retroactive adjustment of knowledge base.
\ agi00057.F 2018-07-09: uses SpreadAct for response to query of "what do you think".
\ agi00058.F 2018-07-10: removes diagnostic messages used for debugging.
\ agi00059.F 2018-09-01: switches MindBoot from all hardcoded to partially hardcoded.
\ agi00060.F 2018-09-07: uses EnArticle to insert "the" before nouns under discussion.
\ agi00061.F 2018-09-23: improves AudMem and AudRecog; implements Imperative module.
\ agi00062.F 2018-10-07: uses Indicative to output "I DO NOT KNOW" for query-responses.
\ agi00063.F 2018-10-19: implements AudBuffer, OutBuffer; EnVerbGen for English verbs.
\ agi00064.F 2018-10-23: debugs erroneous "rv" settings during operation of EnVerbGen.
\ agi00065.F 2018-11-10: uses SpreadAct to think with English prepositional phrases.
\ agi00066.F 2018-11-12: stubs in concept-numbers of most English one-word prepositions.
\ agi00067.F 2018-11-15: embeds most English one-word prepositions in MindBoot sequence.
\ agi00068.F 2018-11-22: implements "fyi" Tab-key and debugs EnParser typographical error.
\ agi00069.F 2018-11-23: embeds one-word English conjunctions in the MindBoot sequence.
\ agi00070.F 2018-11-24: debugs SpreadAct and debugs failure to set recall-vector "rv".
\ agi00071.F 2018-11-25: uses MindBoot idea "I UNDERSTAND YOU" to think about the "other".
\ agi00072.F 2018-12-12: begins embedding 100 frequent or useful verbs in the MindBoot.
\ agi00073.F 2018-12-13: uses 818=DO as auxiliary verb; embeds MindBoot verbs #812-820.
\ agi00074.F 2018-12-14: embeds MindBoot verbs #821-840 and stubs in verbs #841-899.
\ agi00075.F 2018-12-14: debugs post-InFerence lack of infinitive and "A" with plural.
\ agi00076.F 2018-12-18: in SpreadAct implements code-segment for response to who-queries.
\ agi00077.F 2018-12-19: initiates code for responding to queries of who-VERBs-direct-object.
\ agi00078.F 2018-12-21: favors query-results with high "tru"; only EnThink calls SpreadAct.
\ agi00079.F 2019-01-05: embeds MindBoot verbs #861-899; increases "vault" size to 2057.
\ agi00080.F 2019-01-08: debugs lack of Index "I" in "dunnocon" code of Indicative module.
\ agi00081.F 2019-01-09: debugs unwarranted carry-over of "tbev" flag beyond single input.
\ agi00082.F 2019-01-10: debugs repetition of only one idea when AI runs without human input.
\ agi00083.F 2019-01-15: implements artificial curiosity for asking the user "WHO ARE YOU".
\ agi00084.F 2019-02-22: shortens query response of two ideas into one conjunctive sentence.
\ agi00085.F 2019-02-24: prevents EnVerbPhrase from making unwarranted calls to EnNounPhrase.
\ agi00086.F 2019-02-25: debugs spurious "nounlock" values and restores function of "actpsi".
\ agi00087.F 2019-04-06: uses InStantiate to spread activation sideways from a concept.
\ agi00088.F 2019-06-16: reverses OutBuffer characters for legibility and expandability.
\ agi00089.F 2019-09-29: expands conceptual flag-panel from 15 tags to 21 associative tags.
\ agi00090.F 2019-09-30: removes lines of code left commented-out for one cycle of release.
\ agi00091.F 2019-10-01: debugs KbRetro and restores funtionality of InFerence mind-module.
\ agi00092.F 2019-10-04: uses parameters to declare time-points in the InStantiate module.
\ agi00093.F 2019-10-05: resets conceptual tags to zero before each operation of Indicative.
\ agi00094.F 2019-10-06: resets time-of-subject "tsj" to prevent interference with EnParser.
\ agi00095.F 2019-10-07: improves the generation by EnVerbGen of third-person singular verbs.
\ agi00096.F 2019-10-07: tightens up the insertion of tags during instantiation of concepts.
\ agi00097.F 2019-10-08: enables InFerence module to reason from premises entered by a user.
\ agi00098.F 2019-10-10: solves problem of InFerence not reasoning about a NewConcept noun.
\ agi00099.F 2019-10-11: improves the ability of SpreadAct to answer WHO-BE queries.
\ agi00100.F 2019-10-14: includes EnAdjective called from EnNounPhrase to insert adjectives.
\ agi00101.F 2019-10-26: embeds "I AM (THE) GHOST IN (THE) MACHINE" in the MindBoot sequence.
\ agi00102.F 2019-10-28: removes bug of InStantiate creating indiscriminate "actpsi" value.
\ agi00103.F 2019-10-29: introduces "tkbprep" as special "tkb" for objects of prepositions.
\ ghost104.F 2019-11-05: lets EnVerbPhrase call TacRecog to finish the thought "I FEEL..."
\ IndraMind.forth 2020-1-11: embed "I AM (THE) ROBOT IN (THE) MACHINE"
