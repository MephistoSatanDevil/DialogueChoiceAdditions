/* Ashatiel */

/* ~Some call you a hero, but I know what happened on Boareskyr Bridge. You will never fight with us, though our cause be righteous.~ */

EXTEND_TOP BDASHATI 4
    IF ~~ THEN REPLY @11000 /* ~If your cause is righteous, then call off your soldiers. My side will stand down if yours do the same.~ */ GOTO 5
END

EXTEND_BOTTOM BDASHATI 4
    IF ~~ THEN REPLY @11001 /* ~You are right. I am a child of Bhaal, and I embrace it. I came here for murder. Only a fool would think I would join your side.~ */ GOTO 5
END

/* ~I will bring you to the light, and prove that ours is the side of honor and virtue. Face me, one on one. If you defeat me, my soldiers and I will surrender to you. Do you accept?~ */

EXTEND_TOP BDASHATI 5 #1
    IF ~~ THEN REPLY @11002 /* ~A sensible offer. I accept.~ */ GOTO 6
    IF ~~ THEN REPLY @11003 /* ~This may prove amusing. I accept.~ */ GOTO 6
END

EXTEND_BOTTOM BDASHATI 5
    IF ~~ THEN REPLY @11004 /* ~No. One death is a poor harvest. Let the field have its fill.~ */ GOTO ChampionsOfTheLightBhaalspawn
END

/* ---- */

// Variant of Ashatiel's line that doesn't use the word "cowardice"
APPEND BDASHATI
    IF ~~ THEN BEGIN ChampionsOfTheLightBhaalspawn
        SAY @11005 /* ~Champions of light! You see now the duplicity of those who challenge the Lady! Slay the unbeliever! Slay them all, in Caelar's name!~ [DCASH01] */
        COPY_TRANS BDASHATI 7
    END
END

/* ~You and I, one on one. No other combatants, no hiding from sight like a coward. If you break the rules or your allies interfere, my soldiers will cut you down, every last one of you. Do you accept my challenge?~ */

EXTEND_BOTTOM BDASHATI 6 #1
    IF ~~ THEN REPLY @11006 /* ~No bargain, then. If we fight, we fight as war demands.~ */ GOTO 7
END