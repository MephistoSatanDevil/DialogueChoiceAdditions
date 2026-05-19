/* ~I know not what you did to make this happen, Caelar. Whatever it was, the cost was too great.~ */

// Hide the third response; too similar to other ones
ADD_TRANS_TRIGGER BDAUN 10 ~False()~ DO 2 
/* ~You have no idea how right you are.~ [VICONIJ.DLG] */

// Hide the third response; too similar to other ones
ADD_TRANS_TRIGGER BDAUN 10 ~False()~ DO 3
/* ~You have no idea how right you are.~ */

// Hide the sixth response if Viconia isn't avaialable,
// because we will add response with the same reply text for if Viconia is available (this prevents duplicate replies)
ADD_TRANS_TRIGGER BDAUN 10 ~!IsValidForPartyDialogue("VICONIA")~ DO 5
/* ~Tell him, Caelar. Tell him the price the Sword Coast bore that he might be freed from Belhifet's clutches.~ [BDCAELAR.DLG] */

// If extend from the very bottom, the vanilla "Tell him, Caelar." responses will not come at the bottom,
// which gets confusing, as one's mind mind think that the responses below them will also address Caelar
EXTEND_BOTTOM BDAUN 10 #2
    // Compassion for Aun
    IF ~~ THEN REPLY @12001 /* ~You are not to blame for what was done in your name. But many suffered for it.~ */ GOTO 11
    // Option that doesn't add insult to injury after Caelar's uncle's heartbreakingly rebuffed her,
    // without downplaying what Caelar has done
    IF ~~ THEN REPLY @12000 /* ~What is done is done. Caelar will answer for her crimes.~ */ GOTO 11
    // Viconia's line was used for the third response. We add it here instead.
    IF ~IsValidForPartyDialogue("VICONIA") !IsValidForPartyDialogue("KHALID")~ THEN REPLY #%stringref_tell_him_caelar% /* ~Tell him, Caelar. Tell him the price the Sword Coast bore that he might be freed from Belhifet's clutches.~ */ EXTERN VICONIJ 686
END

EXTEND_BOTTOM BDAUN 10
    // Evil
    IF ~~ THEN REPLY @12002 /* ~You should be more thankful. Caelar purchased your life with a mountain of corpses.~ */ GOTO 11
    // Exit attempt
    IF ~~ THEN REPLY @12003 /* ~Spare me the family reckoning.~ */ EXTERN BDCAELAR 76
END
    

/* ~That was how a girl not yet ten years old found herself in this pit, in that cage.~ */

// Replace this reply with one that fits the followup better
// Followup: "Caelar: I was freed, yes. But the cost... It was too much to bear. I couldn't do it, Uncle. Forgive me, I just—I couldn't."
ALTER_TRANS BDCAELAR
    BEGIN 74 END  // State 74
    BEGIN 1 END  // second answer
    /* ~Yet you escaped its bars. You must have.~ */
    BEGIN
        "REPLY" ~@12006~ /* ~But the cage did not hold you forever.~ */
END

// Last option short-circuits the dialogue, a kind of "exit" response, which fits best at the bottom,
// so we add the new responses above the last one
EXTEND_BOTTOM BDCAELAR 74 #1
    IF ~~ THEN REPLY @12004 /* ~No child should have been set to guard such knowledge. Whatever followed, that fault was theirs.~ */ EXTERN BDAUN PerhapsItWasTooMuchToExpectCaelarLives
    // Evil
    IF ~~ THEN REPLY @12005 /* ~And you were freed? A flaw in an otherwise elegant punishment.~ */ GOTO 75
END

/* ---- */

APPEND BDAUN
    IF ~~ THEN BEGIN PerhapsItWasTooMuchToExpectCaelarLives
        // From State 22 (where Caelar is dead)
        SAY #%stringref_perhaps_it_was_too_much_to_expect% /* ~Perhaps it was too much to expect a child of nine to simply stand guard over such forbidden lore. I question what we did now, but it seemed a simple matter, then...~ */
        IF ~IsValidForPartyDialogue("MINSC")~ THEN REPLY #%stringref_what_is_simple_to_the_wise% /* ~What is simple to the wise is complicated to the foolish—and the young.~ */ EXTERN MINSCJ ChildsPlayHamsterCaelarLives
        IF ~!IsValidForPartyDialogue("MINSC")~ THEN REPLY #%stringref_what_is_simple_to_the_wise% /* ~What is simple to the wise is complicated to the foolish—and the young.~ */ GOTO IndeedAndCaelarWasAChildCaelarLives
        IF ~~ THEN REPLY @12007 /* ~So a tome transported Caelar to Avernus. What happened next?~ */ GOTO 13
        IF ~~ THEN REPLY #%stringref_no_fruit% /* ~No fruit tastes so sweet as that which is forbidden us.~ */ GOTO NoFruitCaelarLives
    END
END

APPEND MINSCJ
    IF ~~ THEN BEGIN ChildsPlayHamsterCaelarLives
        // From State 686 (where Caelar is dead)
        SAY #%stringref_and_childs_play_for_the% /* ~And child's play for the gargantuan hamster of space.~ */
        IF ~~ THEN EXTERN BDAUN IndeedAndCaelarWasAChildCaelarLives
    END
END

APPEND BDAUN
    IF ~~ THEN BEGIN IndeedAndCaelarWasAChildCaelarLives
        // From State 24 (where Caelar is dead)
        SAY #%stringref_indeed_and_caelar_was_a_child% /* ~Indeed. And Caelar was a child. We forgot that sometimes, hearing her speak, looking into her eyes. But a child she was, and we were the fools.~ */
        IF ~~ THEN GOTO 13
    END
END

APPEND BDAUN
    IF ~~ THEN BEGIN NoFruitCaelarLives
        // From State 23 (where Caelar is dead)
        SAY #%stringref_a_childish_sentiment% /* ~A childish sentiment, but Caelar was a child.~ */
        IF ~~ THEN GOTO 13
    END
END
