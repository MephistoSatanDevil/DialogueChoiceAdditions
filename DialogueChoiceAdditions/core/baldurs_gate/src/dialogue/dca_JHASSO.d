/* Jhasso

----

Sorry, my friends, but I have very little information to give you. I have been a captive of the doppelgangers for quite a time, and am out of touch with the politics of my beloved city. */

// Disable this if it's Chapter 7
// because he's not captive in Chapter 7
REPLACE_STATE_TRIGGER ~JHASSO~ 16 ~StateCheck(Myself,STATE_CHARMED) !Global("JhassoFreed","GLOBAL",1) !Global("Chapter","GLOBAL",7)~ // From `StateCheck(Myself,STATE_CHARMED)`

/* ~Well, you'll get naught from me this day, not a cry of pain nor the knowledge in my noggin. Get away from me, shapeshifter scum.~ */

// You would only get once to interview him in vanilla, even if you didn't say anything bad to him - that doesn't make much sense
REPLACE_STATE_TRIGGER ~JHASSO~ 0 ~Global("TalkedToScar","GLOBAL",1) !Global("JhassoFreed","GLOBAL",1) !Global("Chapter","GLOBAL",7)~ // From `NumTimesTalkedTo(0)`

ADD_TRANS_TRIGGER ~JHASSO~ 0 ~False()~ DO 2 // Hide the third option; will add to the top
/* ~We're not here to torture you, we're here to save you.~ */

EXTEND_TOP ~JHASSO~ 0 #1
    IF ~~ THEN REPLY @7004 /* ~Scar wants answers, and so do we. Who are you?~ */ GOTO 4
END

EXTEND_TOP ~JHASSO~ 0
    IF ~~ THEN REPLY #%stringref_were_not_here_to_torture% /* ~We're not here to torture you, we're here to save you.~ */ GOTO 2
END

EXTEND_BOTTOM ~JHASSO~ 0
    IF ~~ THEN REPLY @7003 /* ~Maybe another day, then.~ */ EXIT
END

APPEND ~JHASSO~
    // Add a variant without "shapeshifter scum" for if the Seven Suns story haven't started yet
    IF ~!Global("TalkedToScar","GLOBAL",1) !Global("JhassoFreed","GLOBAL",1) !Global("Chapter","GLOBAL",7)~ THEN BEGIN WellYoullGetNaught
        SAY @7000 /* ~Well, you'll get naught from me this day, not a cry of pain nor the knowledge in my noggin. Get away from me.~ [DCJHA01] */
        IF ~~ THEN REPLY @7001 /* ~What are you talking about?~ */ GOTO 1
        IF ~~ THEN REPLY @7002 /* ~Are you being held captive here?~ */ GOTO 1
        IF ~~ THEN REPLY @7003 /* ~Maybe another day, then.~ */ EXIT
    END
END

/* ~Those creatures, the shapeshifters, started infiltrating the Seven Suns some months ago. They must have started with some of the less important members of my coster. Eventually they captured me, and their leader took my face. They've been keeping me alive in order to gain information that they need through torture. I don't know what their purpose is, but they have been running my business very poorly. All of you will be well rewarded for rescuing me. When you meet Scar again, he will give you my reward. I must be off now, as there is much of the monsters' work to be undone. I assume you've dealt with the other monsters upstairs. If you haven't, I'll get the Flaming Fist to clear out the rest. It'll probably be weeks before we can clean out their stench.~ */

ALTER_TRANS ~JHASSO~
    BEGIN 6 END // State 6
    BEGIN 0 END // first answer
    /* (No text) */
    BEGIN
        // JhassoIsFree: whether Jhasso is free or in captivity
        // JhassoFreed: whether the player has had the conversation with Jhasso that ends with him escaping
        "ACTION" ~EscapeArea() SetGlobal("JhassoIsFree","GLOBAL",1) SetGlobal("JhassoFreed","GLOBAL",1)~
    END

/* ~All right then, that's just what I'll do.~ */

ALTER_TRANS ~JHASSO~
    BEGIN 18 END // State 18
    BEGIN 0 END // first answer
    /* (No text) */
    BEGIN
        "ACTION" ~EscapeArea() SetGlobal("JhassoIsFree","GLOBAL",1) SetGlobal("JhassoFreed","GLOBAL",1)~
    END

/* ---- */

/* ~It is good to see you all again friends. I've been hearing quite a few rumors about you, all of which are undoubtedly untrue.~ */

// Make the state only trigger if you have freed him
REPLACE_STATE_TRIGGER ~JHASSO~ ~7~ ~Global("Chapter","GLOBAL",7) Global("JhassoFreed","GLOBAL",1)~ // From `Global("Chapter","GLOBAL",7)`

/* ~[JHASSO 2] Damn, this would've cost my business a pretty penny!~ */

// This sentence does not make sense to me before the situation has cleared up; only show if he is free
REPLACE_STATE_TRIGGER ~JHASSO~ 19 ~Global("JhassoIsFree","GLOBAL",1)~ // From `True()`
