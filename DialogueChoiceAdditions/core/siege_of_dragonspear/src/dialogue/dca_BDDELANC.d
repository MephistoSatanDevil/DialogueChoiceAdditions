/* Torsin de Lancie

----

~And it is appreciated. But Baldur's Gate and especially Waterdeep have provided the majority of troops here. I'll not risk them needlessly.~ */

EXTEND_TOP ~%bddelanc%~ 1 #1
    // The vanilla inquisitive option feels too heroic or self-centered
    IF ~~ THEN REPLY @6 /* ~What is going on here?~ */ GOTO 2
END

/* ~The reinforcements you've brought are a welcome and much-needed asset, <CHARNAME>. YOUR presence is problematic. Many are... disturbed... by tales of Boareskyr Bridge. It would be best if you were away from the camp for a time.~ */

EXTEND_BOTTOM ~%bddelanc%~ 4
    // Hurt or obedient option
    IF ~~ THEN REPLY @0 /* ~Fine. I'll be off.~ */ GOTO 8
END

/* ~We know Dragonspear is being supplied via the caverns you'll be visiting shortly, if all goes as planned. If you put a few drops of this in the enemy food supplies and water, we would have an edge when we finally confront the Shining Lady.~ */

EXTEND_BOTTOM ~%bddelanc%~ 22 #2
    // Option for good characters who don't care much about honor; best options for characters who feel the ethics depends on if the poison is lethal or not
    IF ~~ THEN REPLY @3 /* ~I want no part in victory purchased with needless suffering.~ */ GOTO Compromise
END

ADD_TRANS_TRIGGER ~%bddelanc%~ 22 ~False()~ DO 1 // Hide the second option; decline option for good or plausibly evil characters (if you interpret as "too big an ask"); morally unserious and too similar to the better ones we add
/* ~What? Explosives are one thing, but poison is too much. I'll hear no more of this.~ */

EXTEND_TOP ~%bddelanc%~ 22
    // Lawful good response; "ugly task" wording punishes autopiloting morality
    IF ~~ THEN REPLY @2 /* ~An ugly task, but I will see it done.~ */ GOTO 29
END

EXTEND_BOTTOM ~%bddelanc%~ 22
    // Evil decline
    IF ~~ THEN REPLY @4 /* ~I kill when it suits me, but I will not play poisoner for you. Press me no further.~ */
        GOTO 25
END

/* ~Given a choice between victory and honor, I know which I'll choose. I can see you'll not be persuaded entirely by reason—given your reputation, I can't say I'm surprised. Perhaps you are open to compromise. Would it change your mind if I told you the poison wasn't lethal?~ */

EXTEND_TOP ~%bddelanc%~ 23 #4
    %compromise_dialogue_changes%
END

/* ---- */

APPEND ~%bddelanc%~
    // Abridged from State 23
    IF ~~ THEN BEGIN Compromise
        SAY @5 /* ~Perhaps you are open to compromise. Would it change your mind if I told you the poison wasn't lethal?~ [DCDEL01] */
        COPY_TRANS ~%bddelanc%~ 23
    END
END

EXTEND_TOP ~%bddelanc%~ Compromise #4
        %compromise_dialogue_changes%
END

/* ~Judge me if you must, <CHARNAME>, but for the Sword Coast's sake, do it after the Shining Lady's been dealt with.~ */

ADD_TRANS_TRIGGER ~%bddelanc%~ 10 ~False()~ DO 0 // Hide the first option
/* ~...Very well. What do you require of me?~ */

EXTEND_TOP ~%bddelanc%~ 10
    // This just flows better with the follow-up lines; easier to comprehend
    IF ~~ THEN REPLY @1 /* ~...Very well. What else have you learned?~ */ EXTERN ~%bdnederl%~ 28
END

/* ---- */
