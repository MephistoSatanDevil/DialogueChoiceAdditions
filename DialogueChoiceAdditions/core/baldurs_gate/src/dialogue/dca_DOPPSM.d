/* Merchant

----

~What can I do for you?~ */

// If he's already said he cannot grant any desires, then he shouldn't ask this again
REPLACE_STATE_TRIGGER DOPPSM 0 ~OR(2) NumTimesTalkedTo(0) Global("TalkedToScar","GLOBAL",1)~ // From True()

ADD_TRANS_TRIGGER DOPPSM 0 ~Global("TalkedToScar","GLOBAL",1)~ DO 0 // From `True()`
/* ~We wanted to ask you some questions on your recent business decisions. Some people find them very questionable.~ */
ADD_TRANS_TRIGGER DOPPSM 0 ~!Global("TalkedToScar","GLOBAL",1)~ DO 2 // From nothing
/* ~We want to talk to the owner of the Seven Suns.~ */

EXTEND_BOTTOM DOPPSM 0
    // More persuasive when you have a name
    IF ~Global("TalkedToScar","GLOBAL",1)~ THEN REPLY @6000 /* ~We're here to speak with Jhasso.~ */ GOTO 1
END

/* ~Unfortunately, I cannot grant any of your desires, so could you kindly leave?~ */

// Only show options if the player has talked to Scar outside Flaming Fist
ADD_TRANS_TRIGGER DOPPSM 1 ~Global("TalkedToScar","GLOBAL",1)~ DO 0
/* ~Not until we get to see Jhasso.~ */
ADD_TRANS_TRIGGER DOPPSM 1 ~OR(2) Global("TalkedToScar","GLOBAL",1) Global("Chapter","GLOBAL",7)~ DO 1
/* ~We want a tour first.~ */
ADD_TRANS_TRIGGER DOPPSM 1 ~OR(2) Global("TalkedToScar","GLOBAL",1) Global("Chapter","GLOBAL",7)~ DO 2
/* ~No tour, huh? Well, I guess we'll be on our way.~ */
ADD_TRANS_TRIGGER DOPPSM 1 ~OR(2) Global("TalkedToScar","GLOBAL",1) Global("Chapter","GLOBAL",7)~ DO 3
/* ~Fine, we'll find someone else to answer our questions.~ */

/* ~Unfortunately, I cannot grant any of your desires, so could you kindly leave?~ */
ADD_STATE_TRIGGER DOPPSM 1 ~NumTimesTalkedToGT(0)~ // From nothing

EXTEND_BOTTOM DOPPSM 1
    IF ~Global("Chapter","GLOBAL",7)~ THEN REPLY @6001 /* ~Not until we get to see the owner.~ */ GOTO 7
    IF ~~ THEN EXIT
END
