/* Merchant (doppelganger)

----

So you have come to visit the Seven Suns, have you...? Yes, I've got your face now but not your name... */

// Skip State 0 if any other doppelganger merchant has been talked to
// so that not all of them start with "So you have come to visit the Seven Suns, have you...?"
REPLACE_STATE_TRIGGER DOPMER 0 ~GlobalLT("DoppelgangerMerchantsPhase","GLOBAL",1)~

ALTER_TRANS DOPMER
    BEGIN 0 END // State 0
    BEGIN 0 END // first answer
    /* ~I am Foolio Displasius, destroyer of the Seven Suns! Raaagh!~ */
    BEGIN
        "ACTION" ~SetGlobal("CheckedSevenSuns","GLOBAL",2) SetGlobal("DoppelgangerMerchantsPhase","GLOBAL",1)~
    END

ALTER_TRANS DOPMER
    BEGIN 0 END // State 0
    BEGIN 1 END // second answer
    /* ~We are the party of <CHARNAME>, though I don't know why it may interest you.~ */
    BEGIN
        "ACTION" ~SetGlobal("CheckedSevenSuns","GLOBAL",2) SetGlobal("DoppelgangerMerchantsPhase","GLOBAL",1)~
    END

ALTER_TRANS DOPMER
    BEGIN 0 END // State 0
    BEGIN 2 END // third answer
    /* ~My name is my business. I'm not here to exchange pleasantries.~ */
    BEGIN
        "ACTION" ~SetGlobal("CheckedSevenSuns","GLOBAL",2) SetGlobal("DoppelgangerMerchantsPhase","GLOBAL",1)~
    END

/* ~Ah, I have dreamed of loners such as yourself and each time woken with a groaning belly.~ */

// Hide all options if not talked to Scar by the Flaming Fist; the story makes more sense if no merchants have
// transformed yet
ADD_TRANS_TRIGGER DOPMER 5 ~Global("TalkedToScar","GLOBAL",1)~ DO 0
/* ~I have no wish to hear you whine about your sicknesses and ailments. This discussion grows tiresome.~ */
ADD_TRANS_TRIGGER DOPMER 5 ~Global("TalkedToScar","GLOBAL",1)~ DO 1
/* ~I had no idea you found me that attractive. Alas, there are ones in this world who love me dearly and would miss me sorely should I leave with you.~ */
ADD_TRANS_TRIGGER DOPMER 5 ~Global("TalkedToScar","GLOBAL",1)~ DO 2
/* ~Pray tell me what about my lowly person could make a merchant and his many purses dream?~ */
EXTEND_BOTTOM DOPMER 5
    IF ~~ THEN EXIT
END

/* Still you pester us! Do you have no shame?! Explain yourself! */

// Trigger state only if the player has talked to Scar by the Flaming Fist; conversation makes more sense then
REPLACE_STATE_TRIGGER DOPMER 7 ~Global("TalkedToScar","GLOBAL",1) Global("DoppelgangerMerchantsPhase","GLOBAL",1) !Global("Phase","LOCALS",2) !Global("Doppleganger","GLOBAL",1)~  // From `NumTimesTalkedTo(1)`

ALTER_TRANS DOPMER
    BEGIN 7 END // State 7
    BEGIN 0 END // first answer
    /* ~If you be merchants as you say you are, would you not then be eager to sell your wares?~ */
    BEGIN
        // We cannot rely on NumTimesTalkedTo anymore
        "ACTION" ~SetGlobal("Phase","LOCALS",2)~
    END

ALTER_TRANS DOPMER
    BEGIN 7 END // State 7
    BEGIN 1 END // second answer
    /* ~To be called shameless by a merchant! Tell me, how does that differ from the sarcasm of a bard who compliments her drunken patron on the quality of his voice?~ */
    BEGIN
        // We cannot rely on NumTimesTalkedTo anymore
        "ACTION" ~SetGlobal("Phase","LOCALS",2)~
    END

ALTER_TRANS DOPMER
    BEGIN 7 END // State 7
    BEGIN 2 END // third answer
    /* ~I did not object to the sound of your voice, merely the words you sought to form with it. Come, now, and provide me with information more to my liking.~ */
    BEGIN
        // We cannot rely on NumTimesTalkedTo anymore
        "ACTION" ~SetGlobal("Phase","LOCALS",2)~
    END

/* ~Do you seek the truth so earnestly that you would lose everything?~ */

// Trigger state if talked to again after State 7
REPLACE_TRIGGER_TEXT DOPMER ~NumTimesTalkedTo(2)~ ~Global("Phase","LOCALS",2) !Global("Doppleganger","GLOBAL",1)~

/* Fallback */

APPEND DOPMER
    IF WEIGHT #100 ~!Global("Doppleganger","GLOBAL",1)~ THEN BEGIN Fallback
        SAY %doppelganger_merchant_busy_response%
        IF ~~ THEN EXIT
    END
END
