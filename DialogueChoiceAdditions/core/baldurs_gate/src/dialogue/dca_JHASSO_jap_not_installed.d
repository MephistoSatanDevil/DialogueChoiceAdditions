/* Jhasso */

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
ADD_TRANS_TRIGGER ~JHASSO~ 3 ~False()~ DO 1

// Add a variant of the State 0 line, without "shapeshifter scum" for if you haven't received the job offer from Scar
// Same as ComeToTormentMeSomeMore but with different conditions (since you cannot nest conditions)
APPEND ~JHASSO~
    IF ~NumTimesTalkedTo(0) !Global("JhassoFreed","GLOBAL",1) !Global("TalkedToScar","GLOBAL",1) Global("Chapter","GLOBAL",7) NumDeadLT("SSDOPPLE",4)~ THEN BEGIN WellYoullGetNaughtSpoilerFreeEdgeCaseChapterSeven
        SAY @7000 /* ~Well, you'll get naught from me this day, not a cry of pain nor the knowledge in my noggin. Get away from me.~ [DCJHA01] */
        IF ~~ THEN REPLY @7001 /* ~What are you talking about?~ */ GOTO 1
        IF ~~ THEN REPLY @7002 /* ~Are you being held captive here?~ */ GOTO 1
        IF ~~ THEN REPLY @7003 /* ~Maybe another day, then.~ */ EXIT
    END
END

// Add this voiced line from his soundset
// Same as ComeToTormentMeSomeMore but with different conditions (since you cannot nest conditions)
APPEND ~JHASSO~
    IF ~!Global("JhassoFreed","GLOBAL",1) !Global("TalkedToScar","GLOBAL",1) Global("Chapter","GLOBAL",7) NumDeadLT("SSDOPPLE",4)~ THEN BEGIN ComeToTormentMeSomeMoreEdgeCaseChapterSeven
        SAY #%stringref_jhasso_1_pant_come_here_to_torment% /* ~[JHASSO 1] *pant* Come to torment me some more, you shapeshifting bastards?~ [JHASS01] */
        IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY #%stringref_were_not_here_to_torture% /* ~We're not here to torture you, we're here to save you.~ */ GOTO 2
        IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @7004 /* ~Scar wants answers, and so do we. Who are you?~ */ DO ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~ GOTO 4
        IF ~Global("Chapter","GLOBAL",7) !Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @7001 /* ~What are you talking about?~ */ GOTO 1
        IF ~Global("Chapter","GLOBAL",7) !Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @7002 /* ~Are you being held captive here?~ */ GOTO 1
        IF ~~ THEN REPLY @7006 /* ~Another time, perhaps.~ */ EXIT
    END
END