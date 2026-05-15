/* Slug

----

~Go 'way, <PRO_RACE>. Me no talk with you.~ */

EXTEND_BOTTOM BDSLUG 2 #1
    // Good/neutral exit
    IF ~~ THEN REPLY @9000 /* ~Fine. No talk, then.~ */ GOTO 3
END

/* ~What you care? You out of cage; we in cage. Eh. Whatever. Me Slug, leader of ogre band. We live in caves. Go outside caves, take what we need, kill who we want. It good life.~ */

// Make this response exit the conversation
// If the developers intended for this option to continue the conversation,
// I don't feel any of the subsequent dialogue options fits very well (I would expect an unfriendly
// and much impatient response from the player - instead you get
// "The best bandit in the High Moor, trapped in a crusader cage? Pathetic. Luck to you, ogre. You'll need it.")
ALTER_TRANS BDSLUG
    BEGIN 5 END  // State 5
    BEGIN 4 END  // Fifth response
    /* ~You may stop talking now. Farewell, ogre. We'll not meet again.~ */
    BEGIN
        "EPILOGUE" ~GOTO 3~  // From `GOTO 6`
END

EXTEND_BOTTOM BDSLUG 5 #1
    // Neutral/tactful
    IF ~~ THEN REPLY @9001 /* ~How did you end up here?~ */ GOTO 6
    // Good/neutral exit
    IF ~~ THEN REPLY @9002 /* ~I have to go now. Farewell.~ */ GOTO 3
END

/* ~Slug best bandit in forest! Make lots of gold, have strong mate. Then shiners come. Chase us out of tunnels. Kill some. Catch us.~ */

EXTEND_BOTTOM BDSLUG 6 #1
    // Good/neutral exit
    IF ~~ THEN REPLY @9003 /* ~I see. Well, I had best get a move on. Farewell.~ */ GOTO 3
END
