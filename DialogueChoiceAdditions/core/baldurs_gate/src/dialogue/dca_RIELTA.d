/* Rieltar

----

~My dear <SIRMAAM>, you must realize that it is manners that make the gentle<MANWOMAN>, so would you kindly prove that you are one by leaving?!~ */

ADD_TRANS_TRIGGER RIELTA 0 ~False()~ DO 0 // Disable first response (no text)
/* (No text) */

EXTEND_BOTTOM RIELTA 0
    IF ~~ THEN REPLY @12000 /* ~Sorry. We'll head back out.~ */
        DO ~SetGlobal("Criminal","GLOBAL",1)~ GOTO 8
    IF ~~ THEN REPLY @12001 /* ~No one told me this room was off limits.~ */
        DO ~SetGlobal("Criminal","GLOBAL",1)~ GOTO 1
    IF ~~ THEN REPLY @12002 /* ~I believe I have a place in this discussion.~ */
        DO ~SetGlobal("Criminal","GLOBAL",1)~ GOTO 1
    IF ~~ THEN REPLY @12003 /* ~I'll leave when I'm finished.~ */
        DO ~SetGlobal("Criminal","GLOBAL",1)~ GOTO 1
END
