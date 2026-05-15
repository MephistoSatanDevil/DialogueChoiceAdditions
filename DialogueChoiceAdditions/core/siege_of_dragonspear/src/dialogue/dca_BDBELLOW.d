/* Bellowgulp Bluefingers

----

~*gasp* I thought we'd never get back up! Sure is good to see the surface again.~ */
EXTEND_BOTTOM BDBELLOW 0
    IF ~~ THEN REPLY @4000 /* ~A touching reunion with the surface, no doubt. Farewell.~ */
        DO ~SetGlobal("NotTalkedToPlayerProperly","LOCALS",1)~ GOTO IfYouGottaMoseyOff
END

/* ---- */

APPEND BDBELLOW
    IF ~~ THEN BEGIN IfYouGottaMoseyOff
        // Shortened from State 5
        SAY @4001 /* ~If you gotta mosey off, I understand.~ [DCBLW01] */
        COPY_TRANS BDBELLOW 5
    END
END

APPEND BDBELLOW
    IF ~AreaCheck("BD5100") Global("NotTalkedToPlayerProperly","LOCALS",1)~ THEN BEGIN SureIsGoodToSeeTheSurfaceAgain
        // Shortened from State 0
        SAY @4002 /* ~Sure is good to see the surface again.~ [DCBLW02] */
        // Option from State 0
        IF ~~ THEN REPLY #%stringref_this_isnt_the_surface% /* ~This isn't the surface, you know. It's a cave.~ */ DO ~SetGlobal("NotTalkedToPlayerProperly","LOCALS",0)~ GOTO 1
        // Option from State 0
        IF ~~ THEN REPLY #%stringref_you_have_thirty_seconds% /* ~You have thirty seconds to explain yourself before I start the slaughter.~ */ DO ~SetGlobal("NotTalkedToPlayerProperly","LOCALS",0)~ GOTO 3
        IF ~~ THEN REPLY @4003 /* ~I'll leave you to enjoy the fresh cave air, then.~ */ GOTO IfYouGottaMoseyOff
    END
END

/* ~What kin I do for ya?~ */

ADD_STATE_TRIGGER BDBELLOW 7 ~!Global("NotTalkedToPlayerProperly","LOCALS",1)~
