/* Jhasso */

/* ~Well, you'll get naught from me this day, not a cry of pain nor the knowledge in my noggin. Get away from me, shapeshifter scum.~ */

// Prevent this state if it's Chapter Seven, and use the replacement one that we add later
// The reason we don't do this in the main file is because the replacement state uses `NumDeadLT("SSDOPPLE",5)`
// as trigger, which isn't the right way to check if the doppelgangers are dead in JAP's Seven Suns
ADD_STATE_TRIGGER ~JHASSO~ 0 ~!Global("Chapter","GLOBAL",7)~

/* ---- */

// Edge case when the player didn't get the job offer from Scar, and it's Chapter Seven, so Scar is assassinated
// then we show this state only if the doppelgangers haven't been killed
APPEND JHASSO
    IF ~NumTimesTalkedTo(0) !Global("JhassoFreed","GLOBAL",1) !Global("TalkedToScar","GLOBAL",1) Global("Chapter","GLOBAL",7) NumDeadLT("SSDOPPLE",5)~ THEN BEGIN WellYoullGetNaughtEdgeCaseChapterSeven
        SAY #%stringref_well_youll_get_naught% /* ~Well, you'll get naught from me this day, not a cry of pain nor the knowledge in my noggin. Get away from me, shapeshifter scum.~ */
        COPY_TRANS JHASSO 0
    END
END

/* ~Jhasso? I'm Jhasso. You know Scar? You might be telling the truth. Is my torment to finally end?~ */

// Make this response behave the same way as a similar response in State 4
// This makes him say "All right then, that's just what I'll do." and escape area,
// instead of the conversation just terminating
ALTER_TRANS ~JHASSO~
    BEGIN 3 END  // State 3
    BEGIN 2 END  // second and third answer
    /* ~Bye-bye, Jhasso. You can make it out on your own.~ */
    BEGIN
        "EPILOGUE" ~GOTO 18~ // from `EXIT`
END

// Hide this option since there is no him coming with you (it just ends the conversation)
// JAP fixes this its own way
ADD_TRANS_TRIGGER ~JHASSO~ 3 ~False()~ DO 1

// Add this voiced line from his soundset
APPEND ~JHASSO~
    IF ~!Global("JhassoFreed","GLOBAL",1) Global("TalkedToScar","GLOBAL",1) !Global("Chapter","GLOBAL",7)~ THEN BEGIN ComeToTormentMeSomeMore
        SAY #%stringref_jhasso_1_pant_come_here_to_torment% /* ~[JHASSO 1] *pant* Come to torment me some more, you shapeshifting bastards?~ [JHASS01] */
        IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY #%stringref_were_not_here_to_torture% /* ~We're not here to torture you, we're here to save you.~ */ GOTO 2
        IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @7004 /* ~Scar wants answers, and so do we. Who are you?~ */ DO ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~ GOTO 4
        IF ~!Global("TalkedToScar","GLOBAL",1) Global("Chapter","GLOBAL",7)~ THEN REPLY @7001 /* ~What are you talking about?~ */ GOTO 1
        IF ~!Global("TalkedToScar","GLOBAL",1) Global("Chapter","GLOBAL",7)~ THEN REPLY @7002 /* ~Are you being held captive here?~ */ GOTO 1
        IF ~~ THEN REPLY @7006 /* ~Another time, perhaps.~ */ EXIT
    END
END

// Add this voiced line from his soundset
// Same as ComeToTormentMeSomeMore but with different conditions
// Edge case when the player didn't get the job offer from Scar, and it's Chapter Seven, so Scar is assassinated
// then we show this state only if the doppelgangers haven't been killed
APPEND ~JHASSO~
    IF ~!Global("TalkedToScar","GLOBAL",1) Global("Chapter","GLOBAL",7) NumDeadLT("SSDOPPLE",5)~ THEN BEGIN ComeToTormentMeSomeMoreEdgeCaseChapterSeven
        SAY #%stringref_jhasso_1_pant_come_here_to_torment% /* ~[JHASSO 1] *pant* Come to torment me some more, you shapeshifting bastards?~ [JHASS01] */
        IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY #%stringref_were_not_here_to_torture% /* ~We're not here to torture you, we're here to save you.~ */ GOTO 2
        IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @7004 /* ~Scar wants answers, and so do we. Who are you?~ */ DO ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~ GOTO 4
        IF ~!Global("TalkedToScar","GLOBAL",1) Global("Chapter","GLOBAL",7)~ THEN REPLY @7001 /* ~What are you talking about?~ */ GOTO 1
        IF ~!Global("TalkedToScar","GLOBAL",1) Global("Chapter","GLOBAL",7)~ THEN REPLY @7002 /* ~Are you being held captive here?~ */ GOTO 1
        IF ~~ THEN REPLY @7006 /* ~Another time, perhaps.~ */ EXIT
    END
END

/* ~[JHASSO 2] Damn, this would've cost my business a pretty penny!~ [JHASS02] */

// This sentence does not make sense to me before the situation has cleared up; only show if he is free
REPLACE_STATE_TRIGGER ~JHASSO~ 19 ~Global("JhassoIsFree","GLOBAL",1) !Global("Chapter","GLOBAL",7)~ // From `True()`

/* ---- */

APPEND ~JHASSO~
    IF ~!Global("TalkedToScar","GLOBAL",1) !Global("JhassoIsFree","GLOBAL",1) Global("Chapter","GLOBAL",7) NumDeadGT("SSDOPPLE",4)~ THEN BEGIN ComeToTormentMeSomeMoreEdgeCaseChapterSeven
        SAY #%stringref_damn_this_would_have_cost% /* ~[JHASSO 2] Damn, this would've cost my business a pretty penny!~ [JHASS02] */
        // Technically, he now free, but the variable doesn't say so,
        // because that variable is not obtained in this edge case
        IF ~~ THEN EXIT
    END
END
