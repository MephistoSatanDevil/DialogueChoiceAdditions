/* Flaming Fist Mercenary (at Wyrm's Crossing)

----

~The entrance tax is 6 gold pieces for each party of travelers. Please announce your point of origin~ */

EXTEND_BOTTOM ~FLAMGG~ 0
    IF ~~ THEN REPLY @11000 /* ~My point of origin is my own affair.~ */ GOTO IfYouWontCooperate
    IF ~~ THEN REPLY @11001 /* ~I will not be questioned like a common criminal.~ */ GOTO IfYouWontCooperate
END

/* ---- */

APPEND ~FLAMGG~
    IF ~~ THEN BEGIN IfYouWontCooperate
        // Shortened from State 2
        SAY @11002 /* ~If you won't cooperate, then I'll just bring you to talk with my commander.~ [DCFLG01] */
        COPY_TRANS ~FLAMGG~ 2
    END
END
