/* Courtesan

----

~Heh... hehe... Well, welcome to ye! I trust ye are of fine health today? Come to do something about it? I f-f-find that most of the people above are a bit too healthy sometimes. Stay awhile and free your mind a bit...~*/

EXTEND_TOP ~PROST4~ 0
    IF ~~ THEN REPLY @2000 /* ~No, thank you.~ */ GOTO NoMatter
END

APPEND ~PROST4~
    IF ~~ THEN BEGIN NoMatter
        SAY @2001 /* ~No matter. More of me for someone else...~ [EDPRO01] */
    IF ~~ THEN EXIT
    END
END