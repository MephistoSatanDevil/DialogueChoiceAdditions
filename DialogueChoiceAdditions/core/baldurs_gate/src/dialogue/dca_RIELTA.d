/* Rieltar

----

~My dear <SIRMAAM>, you must realize that it is manners that make the gentle<MANWOMAN>, so would you kindly prove that you are one by leaving?!~ */

ADD_TRANS_TRIGGER ~RIELTA~ 0 ~False()~ DO 0 // Disable first response (no text)
/* (No text) */

EXTEND_BOTTOM ~RIELTA~ 0
    IF ~~ THEN REPLY @12000 /* ~Sorry. We'll head back out.~ */
        DO ~SetGlobal("Criminal","GLOBAL",1) SetGlobal("Annoyance","LOCALS",1)~ GOTO 8
    IF ~~ THEN REPLY @12001 /* ~No one told me this room was off limits.~ */
        DO ~SetGlobal("Criminal","GLOBAL",1)~ GOTO 1
    IF ~~ THEN REPLY @12002 /* ~I believe I have a place in this discussion.~ */
        DO ~SetGlobal("Criminal","GLOBAL",1)~ GOTO 1
    IF ~~ THEN REPLY @12003 /* ~I'll leave when I'm finished.~ */
        DO ~SetGlobal("Criminal","GLOBAL",1)~ GOTO 1
END

/* ~The right people can afford to be rude, but this is not you. Leave now, before my irate companion Brunos lets his temper get ahead of his reason!~ */

// If the player chose @12000, then re-engages, they will see this
// The new "Annoyance" variable is to keep track of this
REPLACE_STATE_TRIGGER ~RIELTA~ 1 ~Global("Annoyance","LOCALS",1)~ // From empty

ALTER_TRANS ~RIELTA~
    BEGIN 1 END // State 1
    BEGIN 0 END // first answer
    BEGIN
        "ACTION" ~SetGlobal("Annoyance","LOCALS",2)~
    END

/* ~As I told you before, get out and stop bothering us!~ */

ADD_STATE_TRIGGER ~RIELTA~ 9 ~Global("Annoyance","LOCALS",2)~ // From `True()`
