/* Minsc */

/* ~Now we can resume our adventures together! There are friends to avenge and villains to smack about the face and neck! Right, Boo?~ */

// Last vanilla option is decline
EXTEND_BOTTOM MINSCA 42 #1
    IF ~~ THEN REPLY @0 /* ~Your strength is welcome, Minsc. Your friendship more so. Come—we need to get out of here.~ */ GOTO ComeBoo
    IF ~~ THEN REPLY @3 /* ~Let's stick together. For now, at least.~ */ GOTO ComeBoo
END

/* ~If anything, I shall be even more single-minded in my focus! Minsc is Minsc, and it shall always be so. Come, Boo, we are among friends again!~ */

EXTEND_BOTTOM MINSCA 9
    IF ~~ THEN REPLY @2 /* ~Let us be off, and woe be to those that dare to stand in our way.~ */ GOTO 15
END

/* ---- */

APPEND MINSCA
    IF ~~ THEN BEGIN ComeBoo
        // Shortened from State 9
        SAY @1 /* ~Come, Boo, we are among friends again!~ */
        COPY_TRANS_LATE MINSCA 9
    END
END

/* State 10: ~Come, we must go now. Yes, Minsc and Boo and you, together again. Beware villains! I will force justice down your evil, evil throats!~ */
/* State 13: ~Minsc and Boo are Minsc and Boo, and we shall not be separated. Shall we go? The butts of evil await my bootprint!~ */

EXTEND_BOTTOM MINSCA 10 13
    // From State 14
    IF ~~ THEN REPLY #%stringref_then_let_us_be_off% /* ~Then let us be off, and woe be to those that dare to stand in our way.~ */ GOTO 15
END