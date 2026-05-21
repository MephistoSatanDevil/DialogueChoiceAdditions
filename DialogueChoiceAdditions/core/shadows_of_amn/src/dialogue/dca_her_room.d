/* Imoen: ~What...? What is this place? It's—it's beautiful! Oh... there is simply no way that this space belongs to the same person that owns those horrible glass containers.~ */

EXTEND_BOTTOM IMOEN2J 1530
    IF ~~ THEN REPLY @2002 /* ~What do you make of it?~ */ GOTO ImoenRecognizesTheRoom
    IF ~Global("HelpDryads","GLOBAL",2)~ THEN REPLY @2000 /* ~This must be the room the dryads mentioned.~ */ DO ~SetGlobal("ImoenEllesime","AR0602",2)~ GOTO ImoenRecognizesTheRoom
END

/* ---- */

APPEND IMOEN2J
    IF ~~ THEN BEGIN ImoenRecognizesTheRoom
        SAY @2001 /* ~This... this bed, that table... I know of them. He would... he would speak of them while... while he...~ [DCIMO01] */
        COPY_TRANS IMOEN2J 1531
    END
END

/* ~No emotion at all, not even remembered. He spoke of these things even while he cut... he cut... and the spells that wove through my brain... cold, ugly things!~ */

// Only show the first option if there are more members in the party.
ADD_TRANS_TRIGGER IMOEN2J 1533 ~NumInPartyGT(2)~ DO 0
/* ~He cannot hurt you now. You are among friends.~ */

EXTEND_BOTTOM IMOEN2J 1533 #1
    IF ~NumInPartyLT(3)~ THEN REPLY @2003 /* ~He cannot hurt you anymore. We are free, and I am here with you.~ */ GOTO 1534
    // Revenge
    IF ~~ THEN REPLY @2004 /* ~He will pay. For every cold thing, I swear he will pay.~ */ GOTO 1535
    // Obligatory rude response;
    // alternative to vanilla "Calm down, you'll attract attention to us.", but less stupid given that the alarm trap
    // triggered when entering this room (and likely Imoen is talking right over it)
    // We don't disable the "Calm down" option though, because it leads to unique dialogue that only makes sense
    // if the player says something like "you'll attract attention to us"
    IF ~~ THEN REPLY @2005 /* ~Pull yourself together. We need to focus on getting out of here, alright?~ */ GOTO 1536
END

EXTEND_BOTTOM IMOEN2J 1533
    IF ~~ THEN REPLY @2006 /* ~I don't want to think about it, Imoen. Could you stop?~ */ GOTO 1536
END