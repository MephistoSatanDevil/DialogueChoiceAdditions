/* Scar

----


~Well, I have to say you've made quite the commotion up here in Baldur's Gate. I can't really put my finger on a single source, but there have been many strange happenings going on within the city. It's been getting harder and harder for me to put trust in someone. I need outsiders to do some investigations, people with no connections to anyone within the city. Would you be interested in working for me in such a capacity?~ */

// Make this not be the first dialogue when you visit Scar by the Flaming Fist
REPLACE_STATE_TRIGGER ~SCAR~ 2 ~~  // From `Global("ScarMission","GLOBAL",8)`


/* ~Greetings, I am Scar, second-in-command of the Flaming Fist. My commander, Grand Duke Eltan, has expressed an interest in meeting with you. It has to do with your previous involvement with the Iron Throne.~ */

// Make this be the first dialogue when you visit Scar by the Flaming Fist
// This allows you to tell him right away that you were involved in clearing the Nashkel Mines,
// and it was weird that he introduced himself after you had already talked to each other twice
// Global("ScarMission","GLOBAL",8) = Working with Scar declined
REPLACE_STATE_TRIGGER ~SCAR~ 19 ~NumTimesTalkedToGT(0) OR(2) Global("ScarMission","GLOBAL",0) Global("ScarMission","GLOBAL",8)~  // From `Global("ScarMission","GLOBAL",8)`

/* ~Back so soon! How did your battle fare?~ */

// Keep track of whether Jhasso has been freed
ALTER_TRANS ~SCAR~
    BEGIN 14 END // State 14
    BEGIN 2 END // third answer
    /* ~The doppelgangers are all dead. Jhasso is back in control of the business.~ */
    BEGIN
        "ACTION" ~SetGlobal("JhassoIsFree","GLOBAL",1)~
    END

/* ~Did you come across Jhasso? Is he alive?~ */

// Keep track of whether Jhasso has been freed
ALTER_TRANS ~SCAR~
    BEGIN 43 END // State 43
    BEGIN 1 END // second answer
    /* ~Alive and well. Jhasso is back in control of the business.~ */
    BEGIN
        "ACTION" ~SetGlobal("JhassoIsFree","GLOBAL",1)~
    END

// Keep track of whether Jhasso has been freed
ALTER_TRANS ~SCAR~
    BEGIN 43 END // State 43
    BEGIN 2 END // third answer
    /* ~Hm. I don't actually think I saw... Yes. He is.~ */
    BEGIN
        "ACTION" ~SetGlobal("JhassoIsFree","GLOBAL",1)~
    END

