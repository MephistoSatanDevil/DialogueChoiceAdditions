/* Scar */

/* ~Well, I have to say you've made quite the commotion up here in Baldur's Gate. I can't really put my finger on a single source, but there have been many strange happenings going on within the city. It's been getting harder and harder for me to put trust in someone. I need outsiders to do some investigations, people with no connections to anyone within the city. Would you be interested in working for me in such a capacity?~ */

// Set variable, will be used for state GreetingsIAmScar
ADD_TRANS_ACTION SCAR
    BEGIN 1 END  // State 1
    BEGIN 0 END  // first answer
    /* (No text) */
    ~SetGlobal("DCA_LiedToScar","GLOBAL",1)~

// New second conversation with Scar for when you didn't tell reveal your identity
// (shortened from State 19)
// This solves the issue that Scar says to talk to him "if you change your mind about your identity", but the game
// offered no option to tell him your identity.
// If you tell the truth on your first meeting, it jumps to State 2 ("Well I have to say [...]"). And in
// the vanilla game, that's the same state that you get if you lie about your identity and then talk to him outside
// the Flaming Fist compound. If we consider the "Well, I have to say [...]" state as the canonical response
// to telling the truth, and we were keep that state as the state after lying, then add a dialogue option that tells
// the truth to that state, that would make him repeat his very last utterance. It would be going to State 2
// from State 2. Therefore, we add this new state to the game, with a dialogue option to reveal your identity.
// BG1UB adds a dialogue option to tell the truth in State 8 ("Greetings, I am Scar, second-in-command of
// the Flaming Fist. My commander [...]"), but that state is (and should) only available after you have been offered
// the job and if you then decline it. So if you accept his job offer, you never get an option to tell
// the truth (without DCA).
// This is the least invasive solution I can think of.
APPEND SCAR
    // If you proceed to State 2, ScarMission will never be 0 again
    IF ~NumTimesTalkedToGT(0) Global("DCA_LiedToScar","GLOBAL",1) Global("ScarMission","GLOBAL",0)~ THEN BEGIN GreetingsIAmScar
        // Shortened from State 19
        SAY @9000 /* ~Greetings. I am Scar, second-in-command of the Flaming Fist.~ [DCSCA01] */
        IF ~~ THEN REPLY @9004 /* ~Well met. Things seem uneasy in Baldur's Gate.~ */ GOTO 2
        IF ~~ THEN REPLY @9002 /* ~Do you need help with anything?~ */ GOTO 2
        IF ~~ THEN REPLY @9003 /* ~I am looking for a job.~ */ GOTO 2
        // We set UB_ScarMission to 0, so that players who have BG1UB's component "Scar and the Sashenstar's Daughter"
        // installed won't get an option to (again) reveal their identity to Scar in the state DeclinedToWorkForScar
        IF ~~ THEN REPLY @9001 /* ~I am the one involved in the clearing of the Nashkel mines.~ */ DO ~SetGlobal("UB_ScarMission","GLOBAL",0)~ GOTO 2
        IF ~~ THEN REPLY @9005 /* ~I will leave you to your work.~ */ GOTO IfYouEverHaveAnyTrouble
    END
END

APPEND SCAR
    IF ~~ THEN BEGIN IfYouEverHaveAnyTrouble
        // Shortened from State 45
        SAY @9006 /* ~If you ever have any trouble, you can find me right here.~ [DCSCA02] */
        IF ~~ THEN EXIT
    END
END

/* ~Well, I have to say you've made quite the commotion up here in Baldur's Gate. I can't really put my finger on a single source, but there have been many strange happenings going on within the city. It's been getting harder and harder for me to put trust in someone. I need outsiders to do some investigations, people with no connections to anyone within the city. Would you be interested in working for me in such a capacity?~ */

// The old second conversation with Scar for when you didn't tell reveal your identity
// Make it only trigger through dialogue choices
REPLACE_STATE_TRIGGER SCAR 2 ~~ // From `NumTimesTalkedToGT(0) Global("ScarMission","GLOBAL",0)`

/* ~Greetings, I am Scar, second-in-command of the Flaming Fist. My commander, Grand Duke Eltan, has expressed an interest in meeting with you. It has to do with your previous involvement with the Iron Throne.~ */

// Make this state never trigger; we will replace it with a new one
REPLACE_STATE_TRIGGER SCAR 19 ~False()~ // From `Global("ScarMission","GLOBAL",8)`

// Replacement for State 19, so he won't introduce himself a third time
APPEND SCAR
    // If declined to work for Scar
    IF ~Global("ScarMission","GLOBAL",8)~ THEN BEGIN DeclinedToWorkForScar
        // Shortened from State 19
        SAY @9007 /* ~My commander, Grand Duke Eltan, has expressed an interest in meeting with you. It has to do with your previous involvement with the Iron Throne.~ [DCSCA03] */
        COPY_TRANS SCAR 19
    END
END