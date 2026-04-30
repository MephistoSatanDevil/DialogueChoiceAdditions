/* Tel-anon

----

~Hold your place! I know not what claims you make to intelligence, but if you understand my words you will not move!~ */

EXTEND_TOP ~TELANO~ 0
    IF ~~ THEN REPLY @10000 /* ~All right. What is it that you want?~ */ GOTO 1
END

/* ~So you are as articulate as you are evil. Funny how it is often such. Funny how little I care! The time has come for your life to end, and it shall be by my wrath that it comes to pass.~ */

EXTEND_BOTTOM ~TELANO~ 4
    IF ~~ THEN REPLY @10001 /* ~Enough talk. Face me if you dare!~ */ GOTO 3
END