/* Ashatiel */

/* ~Some call you a hero, but I know what happened on Boareskyr Bridge. You will never fight with us, though our cause be righteous.~ */

EXTEND_TOP BDASHATI 4
    IF ~~ THEN REPLY @11000 /* ~If your cause is righteous, then call off your soldiers. My side will stand down if yours do the same.~ */ GOTO 5
END

EXTEND_BOTTOM BDASHATI 4
    IF ~~ THEN REPLY @11001 /* ~You are right. I am a child of Bhaal, and I brace it. I came here for murder. Only a fool would think I would join your side.~ */ GOTO 5
END
