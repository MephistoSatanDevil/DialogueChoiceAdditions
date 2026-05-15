/* Marshal Nederlok */

/* ~I'm afraid you'll not find a warm reception here. Word of what happened at Boareskyr Bridge is getting around. Many—too many—see you as Sarevok's heir apparent.~ */

EXTEND_TOP ~%bdnederl%~ 2
    IF ~IsValidForPartyDialogue("mkhiin")~ THEN REPLY #%stringref_no_words% /* ~No words will change their minds, but through my actions, they will know my heart.~ */ EXTERN ~BDMKHIIJ~ 95
    // Copied from State 14
    IF ~!IsValidForPartyDialogue("mkhiin")~ THEN REPLY #%stringref_no_words% /* ~No words will change their minds, but through my actions, they will know my heart.~ */ GOTO 15
    // Copied from State 14
    // IF ~~ THEN REPLY #%stringref_no_words% GOTO 7 // Copied from State 14
END

/* ~That's assuming the information we have is accurate. Torture usually gets you answers, but it doesn't always get you the truth.~ */

ADD_TRANS_TRIGGER ~%bdnederl%~ 27 ~False()~ DO 1 // Hide the second option; it doesn't match the followup well, and feels a bit modern; this cuts the final option count down to 5; besides, the news about the caverns is huge and should concern the player greatly, so they shouldn't act uninterested

EXTEND_TOP ~%bdnederl%~ 27 #2
    // Polite/minimal neutral/good character response
    IF ~~ THEN REPLY @1002 /* ~Even so, I would hear the rest. What else have you learned?~ */ GOTO 28
END

EXTEND_TOP ~%bdnederl%~ 27
    // Good character response without confronting or opposing the use of intelligence gathering via torture
    IF ~~ THEN REPLY @1000 /* ~The information sounds promising, but was there truly no other means to obtain it?~ */
        EXTERN ~%bddelanc%~ 10
    IF ~~ THEN REPLY @1001 /* ~I trust this is not your first recourse.~ */ EXTERN ~%bddelanc%~ 10
END

/* ~Let's get you back to the camp, <CHARNAME>. You're not safe here.~ */

EXTEND_BOTTOM ~%bdnederl%~ 46
    IF ~~ THEN REPLY @1003 /* ~Safe from whom, Nederlok? The woman who promised to return me unharmed, or the man who said he would happily see me sacrificed?~ */ EXTERN ~%bddelanc%~ 55
END