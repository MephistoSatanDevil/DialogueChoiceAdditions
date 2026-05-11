/* Jhasso */

// Add this voiced line from his soundset
APPEND ~JHASSO~
    IF ~Global("JA#JHASSO_MOVE","GLOBAL",0) Global("JA#JHASSO_TALK","LOCALS",0) !Global("JhassoFreed","GLOBAL",1)~ THEN BEGIN ComeToTormentMeSomeMore
        SAY #%stringref_jhasso_1_pant_come_here_to_torment% /* ~[JHASSO 1] *pant* Come to torment me some more, you shapeshifting bastards?~ [JHASS01] */
        IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY #%stringref_were_not_here_to_torture% /* ~We're not here to torture you, we're here to save you.~ */ GOTO 2
        IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @7004 /* ~Scar wants answers, and so do we. Who are you?~ */ DO ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~ GOTO 4
        IF ~!Global("TalkedToScar","GLOBAL",1) Global("Chapter","GLOBAL",7)~ THEN REPLY @7001 /* ~What are you talking about?~ */ GOTO 1
        IF ~!Global("TalkedToScar","GLOBAL",1) Global("Chapter","GLOBAL",7)~ THEN REPLY @7002 /* ~Are you being held captive here?~ */ GOTO 1
        IF ~~ THEN REPLY @7006 /* ~Another time, perhaps.~ */ EXIT
    END

/* ~You want to torture me again? Do what you want, but you won't learn anything from me.~ */

// Disable this state
// because the state we added earlier is arguably better
REPLACE_TRIGGER_TEXT JHASSO
~Global("JA#JHASSO_MOVE","GLOBAL",0)
Global("JA#JHASSO_TALK","LOCALS",0)~
~False()~

/* ~Hmm. The events in the city seem to be running wild. Have you changed your mind?~ */

// Add JhassoFreed conditional
// so that it won't
// trigger before DCA's states WellYoullGetNaughtSpoilerFree, ComeToTormentMeSomeMore, and ComeToTormentMeSomeMoreSpoilerFree
REPLACE_TRIGGER_TEXT JHASSO
~Global("JA#JHASSO_QUEST","GLOBAL",0)
!Global("ENDOFBG1","GLOBAL",2)~
~Global("JhassoFreed","GLOBAL",1) \0~ // Append

/* ~[JHASSO 2] Damn, this would've cost my business a pretty penny!~ */

// Prevent this state from
// triggering instead of some of the states from JAP
REPLACE_STATE_TRIGGER ~JHASSO~ 19 ~!Global("JA#JHASSO_MOVE","GLOBAL",2) !Global("JA#DOPPSE_TALK","GLOBAL",1) !Global("JA#JHASSO_CH7_TALK","LOCALS",100) Global("JhassoIsFree","GLOBAL",1) Global("JA#JHASSO_CH7_TALK","LOCALS",0)~
