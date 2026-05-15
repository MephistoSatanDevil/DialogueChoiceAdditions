/* Nereid

----

~What is this? I come to rescue my elemental companions and find them already freed.~ */

ALTER_TRANS BDPWATER
    BEGIN 4 END // State 4
    BEGIN 0 END // first answer
    /* ~A wizard tried to bind them to his will. I put an end to his evil.~ */
    BEGIN
        // Good/neutral
        // Useful if the player acted in self defense, not out of heroism
        // We don't keep the old one, because even if we get creative with the wording,
        // it will not be meaningfully different enough to warrant having both
        // Our new one fits heroic and non-heroic characters alike
        "REPLY" ~@6000~ /* ~A wizard tried to bind them to his will. He will trouble you no more.~ */
    END

ALTER_TRANS BDPWATER
    BEGIN 4 END // State 4
    BEGIN 1 END // second answer
    /* ~A wizard tried to bind them to his will. I put an end to his evil.~ [JAHEIRAJ.DLG] */
    BEGIN
        "REPLY" ~@6000~ /* ~A wizard tried to bind them to his will. He will trouble you no more.~ */
    END

/* ---- */

// region Make it possible to decline gift
APPEND BDPWATER
    // This will be identical to vanilla State 7
    IF ~~ THEN BEGIN FarewellNew
        SAY #%stringref_farewell_know_that_you_have_a_friend%
        COPY_TRANS BDPWATER 7
    END
END

/* ~Farewell. Know that you have a friend among the water folk, always.~ */

// Remove the "give stone" actions in State 7
// Will be used for when the player declines the stone
REPLACE_TRANS_ACTION BDPWATER
    BEGIN 7 END  // State 7
    BEGIN 0 1 END  // first and second answer
    ~GiveItem("bdmisc05",LastTalkedToBy)~ ~~

/* ~Your deed merits reward. This may look like an ordinary stone, but its powers are great. With it you can remove any taint or impurity from water, no matter how befouled.~ */

ALTER_TRANS BDPWATER
    BEGIN 6 END // State 6
    BEGIN 0 1 2 END // all three answers
    // It would have made sense to clone State 7 and use REPLACE_TRANS_ACTION
    // on that, but you need a stateNumber for REPLACE_TRANS_ACTION
    // A simpler route would have been to create a new state
    // for when the gift is declined, and recreate the replies,
    // copy-pasting the triggers and actions by hand, but that's
    // more destructive and less likely to be compatible with other mods
    // that change the same dialogue (for example a mod changing the XP amount)
    BEGIN
        "EPILOGUE" ~GOTO FarewellNew~
    END

EXTEND_TOP BDPWATER 6
    // Good character
    // Useful if the player acted in self defense, not out of heroism
    IF ~~ THEN REPLY @6001 /* ~Keep it. I only did what the moment required.~ */
        DO ~SetGlobal("StoneDeclined","GLOBAL",1)~ GOTO 7
END
// endregion
