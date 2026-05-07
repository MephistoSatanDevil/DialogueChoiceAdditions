/* Silence

----

~Walk yourself slowly in, and keep your arms at your sides. This is no inn and you get no smiling welcome. I expect payment for your safekeeping, and you pay by the day and by the head! The risk I take harboring you low-grade hooligans is simply not worth it. 5 gold up front now, if you please.~ */

EXTEND_TOP ~SILENC~ 2
    IF ~~ THEN REPLY @5000 /* ~You call it safekeeping, yet your tone is threatening. I think it best if I leave.~ */ GOTO YouveGotTillIGetMyMuscle
END

EXTEND_BOTTOM ~SILENC~ 2
    IF ~~ THEN REPLY @5001 /* ~I was strolling about. I'll take my leave.~ */ GOTO YouveGotTillIGetMyMuscle
    IF ~~ THEN REPLY @5002 /* ~Don't you dare insult me again.~ */ GOTO YouveGotTillIGetMyMuscle
END

/* ---- */

APPEND ~SILENC~
    IF ~~ THEN BEGIN YouveGotTillIGetMyMuscle
        SAY @5003 /* ~You've got till I get my muscle to be gone. After that, you'll hit the bricks a touch harder.~ [DCDEL02] */
    IF ~~ THEN DO ~SetGlobal("NoPayment","GLOBAL",1)~ EXIT
    END
END

/* ~Payment-time! 5 gold or you hit the bricks! Everybody have your rent ready.~ */

EXTEND_BOTTOM ~SILENC~ 7
    IF ~~ THEN REPLY @5004 /* ~I don't feel like paying.~ */ GOTO 8
END