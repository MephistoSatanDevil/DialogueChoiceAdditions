/* Scar */

// New second conversation with Scar for when you didn't tell reveal your identity
// (the vanilla is "Well, I have to say you've made quite the commotion up here in Baldur's Gate.")
// This solves the issue that you couldn't tell him the truth about your identity at this point,
// nor at all if you accepted his job offer, I think
// This is the least bad solution I can think of that doesn't significantly alter NPC dialogue
APPEND ~SCAR~
    IF ~NumTimesTalkedToGT(0) Global("ScarMission","GLOBAL",0)~ THEN BEGIN GreetingsIAmScar
        // Shortened from State 19
        SAY @9000 /* ~Greetings. I am Scar, second-in-command of the Flaming Fist.~ [DCSCA01] */
        IF ~~ THEN REPLY @9004 /* ~Well met. Things seem uneasy in Baldur's Gate.~ */ GOTO 2
        IF ~~ THEN REPLY @9002 /* ~Do you need help with anything?~ */ GOTO 2
        IF ~~ THEN REPLY @9003 /* ~I am looking for a job.~ */ GOTO 2
        // Not entirely sure what this variable is, but it's a trigger for the equivalent choice in State 19
        IF ~Global("UB_ScarMission","GLOBAL",1)~ THEN REPLY @9001 /* ~I am the one involved in the clearing of the Nashkel mines.~ */ GOTO 2
        IF ~~ THEN REPLY @9005 /* ~I will leave you to your work.~ */ GOTO IfYouEverHaveAnyTrouble
    END
END

APPEND ~SCAR~
    IF ~~ THEN BEGIN IfYouEverHaveAnyTrouble
        // Shortened from State 45
        SAY @9006 /* ~If you ever have any trouble, you can find me right here.~ [DCSCA02] */
        IF ~~ THEN EXIT
    END
END

/* ~Well, I have to say you've made quite the commotion up here in Baldur's Gate. I can't really put my finger on a single source, but there have been many strange happenings going on within the city. It's been getting harder and harder for me to put trust in someone. I need outsiders to do some investigations, people with no connections to anyone within the city. Would you be interested in working for me in such a capacity?~ */

// The old second conversation with Scar for when you didn't tell reveal your identity
// Make it only trigger through dialogue choices
REPLACE_STATE_TRIGGER ~SCAR~ 2 ~~ // From `NumTimesTalkedToGT(0) Global("ScarMission","GLOBAL",0)`

/* ~Greetings, I am Scar, second-in-command of the Flaming Fist. My commander, Grand Duke Eltan, has expressed an interest in meeting with you. It has to do with your previous involvement with the Iron Throne.~ */

// Make this state never trigger; will be replaced with a new one
REPLACE_STATE_TRIGGER ~SCAR~ 19 ~~ // From `Global("ScarMission","GLOBAL",8)`

// Replacement for State 19, so he won't introduce himself a third time
APPEND ~SCAR~
    // If declined to work for Scar
    IF ~Global("ScarMission","GLOBAL",8)~ THEN BEGIN DeclinedToWorkForScar
        // Shortened from State 19
        SAY @9007 /* ~My commander, Grand Duke Eltan, has expressed an interest in meeting with you. It has to do with your previous involvement with the Iron Throne.~ [DCSCA03] */
        COPY_TRANS ~SCAR~ 19
    END
END