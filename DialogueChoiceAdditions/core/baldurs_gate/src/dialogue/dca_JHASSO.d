/* Jhasso */

// [ ] Not talked to Scar - Chapter 5
// [ ] Not talked to Scar - Chapter 5 - doppelgangers killed
// [ ] Not talked to Scar - Chapter 7
// [ ] Not talked to Scar - Chapter 7 - doppelgangers killed
// [ ] Talked to Scar - Chapter 5
// [ ] Talked to Scar - Chapter 5 - doppelgangers killed
// [ ] Talked to Scar - Chapter 7
// [ ] Talked to Scar - Chapter 7 - doppelgangers killed

// Set variables that we will use as conditionals for states
// JhassoIsFree: whether Jhasso is free or in captivity (set through conversation with him or with Scar)
// JhassoFreed: whether the player has had the conversation with Jhasso that ends with him escaping
// The oldText pattern is copied from Jarl's Adventure Pack; no idea why "Destroy" is in there,
// (perhaps compatibility with another mod?), but seems safest to use it here as well
REPLACE_ACTION_TEXT JHASSO
~EscapeArea\(Destroy\)?([0-9]*)~
~SetGlobal("JhassoIsFree","GLOBAL",1) SetGlobal("JhassoFreed","GLOBAL",1) \0~ // Prepend

/* Sorry, my friends, but I have very little information to give you. I have been a captive of the doppelgangers for quite a time, and am out of touch with the politics of my beloved city. */

// Disable this if Jhasso is free
// IMPROVE It would be more polished if the conditional instead was something like `GlobalLT("JhassoFreedInChapter","GLOBAL",7)`
// because if you free him in in Chapter Seven, then this state would fit
ADD_STATE_TRIGGER ~JHASSO~ 16 ~!Global("JhassoIsFree","GLOBAL",1)~ // From `StateCheck(Myself,STATE_CHARMED)`

/* ~Well, you'll get naught from me this day, not a cry of pain nor the knowledge in my noggin. Get away from me, shapeshifter scum.~ */

// You would only get one try to interview him once in vanilla - that doesn't make much sense
// Make it conditional on either having received the job offer from Scar or it being Chapter Seven,
// because Scar is dead in Chapter Seven
ADD_STATE_TRIGGER ~JHASSO~ 0 ~!Global("JhassoIsFree","GLOBAL",1) OR(2) Global("TalkedToScar","GLOBAL",1) Global("Chapter","GLOBAL",7)~

ADD_TRANS_TRIGGER ~JHASSO~ 0 ~False()~ DO 2 // Hide the third option; will add it to the top
/* ~We're not here to torture you, we're here to save you.~ */

EXTEND_TOP ~JHASSO~ 0 #1
    // Set variable JA#JHASSO_TALK for Jarl's Adventure Pack compatibility
    IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @7004 /* ~Scar wants answers, and so do we. Who are you?~ */ DO ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~ GOTO 4
END

EXTEND_TOP ~JHASSO~ 0
    IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY #%stringref_were_not_here_to_torture% /* ~We're not here to torture you, we're here to save you.~ */ GOTO 2
END

EXTEND_BOTTOM ~JHASSO~ 0
    IF ~Global("Chapter","GLOBAL",7)~ THEN REPLY @7001 /* ~What are you talking about?~ */ GOTO 1
    IF ~Global("Chapter","GLOBAL",7)~ THEN REPLY @7002 /* ~Are you being held captive here?~ */ GOTO 1
    IF ~~ THEN REPLY @7003 /* ~Maybe another day, then.~ */ EXIT
END

APPEND ~JHASSO~
    // Add a variant without "shapeshifter scum" for if the Seven Suns story hasn't started yet
    IF ~NumTimesTalkedTo(0) !Global("JhassoFreed","GLOBAL",1) !Global("TalkedToScar","GLOBAL",1) !Global("Chapter","GLOBAL",7)~ THEN BEGIN WellYoullGetNaughtSpoilerFree
        SAY @7000 /* ~Well, you'll get naught from me this day, not a cry of pain nor the knowledge in my noggin. Get away from me.~ [DCJHA01] */
        IF ~~ THEN REPLY @7001 /* ~What are you talking about?~ */ GOTO 1
        IF ~~ THEN REPLY @7002 /* ~Are you being held captive here?~ */ GOTO 1
        IF ~~ THEN REPLY @7003 /* ~Maybe another day, then.~ */ EXIT
    END
END

// Add this voiced line from his soundset
APPEND ~JHASSO~
    IF ~!Global("JhassoFreed","GLOBAL",1) Global("TalkedToScar","GLOBAL",1) !Global("Chapter","GLOBAL",7)~ THEN BEGIN ComeToTormentMeSomeMore
        SAY #%stringref_jhasso_1_pant_come_here_to_torment% /* ~[JHASSO 1] *pant* Come to torment me some more, you shapeshifting bastards?~ [JHASS01] */
        IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY #%stringref_were_not_here_to_torture% /* ~We're not here to torture you, we're here to save you.~ */ GOTO 2
        IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @7004 /* ~Scar wants answers, and so do we. Who are you?~ */ DO ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~ GOTO 4
        IF ~Global("Chapter","GLOBAL",7) !Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @7001 /* ~What are you talking about?~ */ GOTO 1
        IF ~Global("Chapter","GLOBAL",7) !Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @7002 /* ~Are you being held captive here?~ */ GOTO 1
        IF ~~ THEN REPLY @7006 /* ~Another time, perhaps.~ */ EXIT
    END
END

// Add this shortened version for if the Seven Suns story hasn't started yet
// and Scar isn't dead
APPEND ~JHASSO~
    IF ~!Global("JhassoFreed","GLOBAL",1) !Global("Chapter","GLOBAL",7)~ THEN BEGIN ComeToTormentMeSomeMoreSpoilerFree
        SAY @7005 /* ~*pant* Come to torment me some more?~ [DCJHA02] */
        IF ~~ THEN REPLY @7001 /* ~What are you talking about?~ */ GOTO 1
        IF ~~ THEN REPLY @7002 /* ~Are you being held captive here?~ */ GOTO 1
        IF ~~ THEN REPLY @7006 /* ~Another time, perhaps.~ */ EXIT
    END
END

/* ~It is good to see you all again friends. I've been hearing quite a few rumors about you, all of which are undoubtedly untrue.~ */

// Make the state only trigger if you have freed him
ADD_STATE_TRIGGER ~JHASSO~ 7 ~Global("JhassoFreed","GLOBAL",1)~ // From `Global("Chapter","GLOBAL",7)`

/* ~[JHASSO 2] Damn, this would've cost my business a pretty penny!~ */

// This sentence does not make sense to me before the situation has cleared up; only show if he is free
REPLACE_STATE_TRIGGER ~JHASSO~ 19 ~Global("JhassoIsFree","GLOBAL",1)~ // From `True()`


/* ~Back so soon! How did your battle fare?~ */

// Keep track of whether Jhasso is free
ALTER_TRANS ~SCAR~
    BEGIN 14 END // State 14
    BEGIN 2 END // third answer
    /* ~The doppelgangers are all dead. Jhasso is back in control of the business.~ */
    BEGIN
        "ACTION" ~SetGlobal("JhassoIsFree","GLOBAL",1)~
    END

/* ~Did you come across Jhasso? Is he alive?~ */

// Keep track of whether Jhasso is free
ALTER_TRANS ~SCAR~
    BEGIN 43 END // State 43
    BEGIN 1 END // second answer
    /* ~Alive and well. Jhasso is back in control of the business.~ */
    BEGIN
        "ACTION" ~SetGlobal("JhassoIsFree","GLOBAL",1)~
    END

// Keep track of whether Jhasso is free
ALTER_TRANS ~SCAR~
    BEGIN 43 END // State 43
    BEGIN 2 END // third answer
    /* ~Hm. I don't actually think I saw... Yes. He is.~ */
    BEGIN
        "ACTION" ~SetGlobal("JhassoIsFree","GLOBAL",1)~
    END
