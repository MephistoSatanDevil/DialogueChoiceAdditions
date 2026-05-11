/* Jhasso */

ADD_TRANS_TRIGGER ~JHASSO~ 0 ~False()~ DO 2 // Hide the third option; will add it to the top
/* ~We're not here to torture you, we're here to save you.~ */

EXTEND_TOP ~JHASSO~ 0 #1
    // Set variable JA#JHASSO_TALK for Jarl's Adventure Pack compatibility
    IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @7004 /* ~Scar wants answers, and so do we. Who are you?~ */ DO ~SetGlobal("JA#JHASSO_TALK","LOCALS",1)~ GOTO 4
END

EXTEND_TOP ~JHASSO~ 0
    IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY #%stringref_were_not_here_to_torture% /* ~We're not here to torture you, we're here to save you.~ */ GOTO 2
END

EXTEND_BOTTOM ~JHASSO~ 0
    IF ~!Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @7001 /* ~What are you talking about?~ */ GOTO 1
    IF ~!Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @7002 /* ~Are you being held captive here?~ */ GOTO 1
    IF ~~ THEN REPLY @7003 /* ~Maybe another day, then.~ */ EXIT
END
