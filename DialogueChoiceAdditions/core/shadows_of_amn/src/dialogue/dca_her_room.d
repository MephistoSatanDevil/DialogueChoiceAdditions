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

// Hide this dialogue option if the alarm trap went off
// (because Imoen's talking won't make it any more likely that attention will be attracted)
// You cannot detect nor disarm the alarm trap nor trigger the dialogue without cheating in the vanilla game, but whatever
// The variable name is correctly misspelled
ADD_TRANS_TRIGGER IMOEN2J 1533 ~!Global("Ellsime","AR0602",1)~ DO 1
/* ~Calm down, you'll attract attention to us.~ */

EXTEND_BOTTOM IMOEN2J 1533 #1
    
    IF ~NumInPartyLT(3)~ THEN REPLY @2003 /* ~He cannot hurt you anymore. We are free, and I am here with you.~ */ GOTO 1534
    IF ~~ THEN REPLY @2004 /* ~He will pay. For every cold thing, I swear he will pay.~ */ GOTO 1535
    IF ~Global("Ellsime","AR0602",1)~ THEN REPLY @2005 /* ~Pull yourself together. We need to focus on getting out of here, alright?~ */ GOTO 1537
END

EXTEND_BOTTOM IMOEN2J 1533
    IF ~~ THEN REPLY @2006 /* ~I don't want to think about it, Imoen. Could you stop?~ */ GOTO 1536
END