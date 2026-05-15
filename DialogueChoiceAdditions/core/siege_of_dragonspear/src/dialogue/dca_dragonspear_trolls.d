// This dialogue had no dialogue options, and the journal entries only fits chaotic good characters
// We change four things:
// 1. Add dialogue options.
// 2. Re-route the M'Khiin path
//    which originally skipped NPC lines including another one from M'Khiin (this looks like an error) as well as
//    our dialogue options.
// 3. After the conversation is over, add a journal entry that fits the user's response
// 4. If and when the user frees the trolls, add a fitting journal entry based on the user's response

/* Troll (Alkullok) */

/* Troll: Let us out. They been tort—torm—hurting us for days! We not want fight for them! */

// Disable this so that our replies won't be skipped
ADD_TRANS_TRIGGER BDTOLIKS 0 ~False()~ DO 0
/* (No text) */

// Add dialogue options
EXTEND_BOTTOM BDTOLIKS 0
    IF ~!IsValidForPartyDialogue("mkhiin")~ THEN REPLY @10000 /* ~I'll do what I can, but keep your claws to yourselves.~ */ EXTERN BDTHRUDD YouKillGnarg
    // dca_bd_trolls_journal_neutral: should add neutral (instead of good) journal entry
    // when freeing them (in door script BDDSPENS.bcs; see tp2)
    IF ~!IsValidForPartyDialogue("mkhiin")~ THEN REPLY @10001 /* ~I have a castle to take. Convince me this is worth the risk.~ */ DO ~SetGlobal("dca_bd_trolls_journal_neutral","bd4000",1)~ EXTERN BDTHRUDD PleaseYouKillGnargQuestCanRelease
    // The creature script for BDTOLIKS.CRE is BDTHRUDD.bcs
    IF ~!IsValidForPartyDialogue("mkhiin")~ THEN REPLY @10002 /* ~I'll leave you here for now. Free trolls may do more harm than good in this chaos.~ */ DO ~SetGlobal("dca_bd_trolls_declined","locals",1) SetGlobal("dca_bd_trolls_journal_neutral","bd4000",1)~ EXTERN BDTHRUDD 1
    IF ~!IsValidForPartyDialogue("mkhiin")~ THEN REPLY @10003 /* ~Beg to someone else, beast. I like you penned.~ */
        DO ~SetGlobal("dca_bd_trolls_declined","locals",1) SetGlobal("dca_bd_trolls_journal_neutral","bd4000",1)~ EXTERN BDTHRUDD PleaseYouKillGnargQuestLeft
    IF ~!IsValidForPartyDialogue("mkhiin")~ THEN REPLY @10004 /* ~I have no time for this. There is a battle raging, in case you hadn't noticed.~ */ DO ~SetGlobal("dca_bd_trolls_declined","locals",1) SetGlobal("dca_bd_trolls_journal_neutral","bd4000",1)~ EXTERN BDTHRUDD PleaseYouKillGnargQuestLeft
END

/* M'Khiin: Let 'em out, <CHARNAME>. */

// Disable this so that our replies won't be skipped
ADD_TRANS_TRIGGER BDMKHIIJ 104 ~False()~ DO 0
/* (No text) */

// Add dialogue options (M'Khiin path)
EXTEND_BOTTOM BDMKHIIJ 104
    IF ~!IsValidForPartyDialogue("baeloth")~ THEN REPLY @10009 /* ~I'll do what I can.~ */ EXTERN BDTHRUDD YouKillGnarg
    IF ~!IsValidForPartyDialogue("baeloth")~ THEN REPLY @10010 /* ~I have a castle to take. How is this worth the risk?~ */ DO ~SetGlobal("dca_bd_trolls_journal_neutral","bd4000",1)~ EXTERN BDTHRUDD PleaseYouKillGnargQuestCanRelease
    IF ~!IsValidForPartyDialogue("baeloth")~ THEN REPLY @10011 /* ~I'll leave them where they are for now. Free trolls may do more harm than good in this chaos.~ */ DO ~ActionOverride("BDTOLIKS",SetGlobal("dca_bd_trolls_declined","locals",1)) SetGlobal("dca_bd_trolls_journal_neutral","bd4000",1)~ EXTERN BDTHRUDD 1
    IF ~!IsValidForPartyDialogue("baeloth")~ THEN REPLY @10012 /* ~I see no problem here. Only trolls where trolls should be.~ */ DO ~ActionOverride("BDTOLIKS",SetGlobal("dca_bd_trolls_declined","locals",1)) SetGlobal("dca_bd_trolls_journal_neutral","bd4000",1)~ EXTERN BDTHRUDD PleaseYouKillGnargQuestLeft
    IF ~!IsValidForPartyDialogue("baeloth")~ THEN REPLY @10004 /* ~I have no time for this. There is a battle raging, in case you had not noticed.~ */ DO ~ActionOverride("BDTOLIKS",SetGlobal("dca_bd_trolls_declined","locals",1)) SetGlobal("dca_bd_trolls_journal_neutral","bd4000",1)~ EXTERN BDTHRUDD PleaseYouKillGnargQuestLeft
END

/* Baeloth: Yes. Turn a troop of testy trolls loose. Terrific. I'll be way, way over here. */

// Disable this so that our replies won't be skipped
ADD_TRANS_TRIGGER BAELOTHJ 57 ~False()~ DO 0
/* (No text) */

// Add dialogue options (Baeloth path)
EXTEND_BOTTOM BAELOTHJ 57
    IF ~~ THEN REPLY @10009 /* ~I'll do what I can.~ */ EXTERN BDTHRUDD YouKillGnarg
    IF ~~ THEN REPLY @10013 /* ~I have a castle to take. If anyone can tell me how this would be worth the risk, I am all ears.~ */ DO ~SetGlobal("dca_bd_trolls_journal_neutral","bd4000",1)~ EXTERN BDTHRUDD PleaseYouKillGnargQuestCanRelease
    IF ~~ THEN REPLY @10011 /* ~I'll leave them where they are for now. Free trolls may do more harm than good in this chaos.~ */ DO ~ActionOverride("BDTOLIKS",SetGlobal("dca_bd_trolls_declined","locals",1)) SetGlobal("dca_bd_trolls_journal_neutral","bd4000",1)~ EXTERN BDTHRUDD 1
    IF ~~ THEN REPLY @10012 /* ~I see no problem here. Only trolls where trolls should be.~ */ DO ~ActionOverride("BDTOLIKS",SetGlobal("dca_bd_trolls_declined","locals",1)) SetGlobal("dca_bd_trolls_journal_neutral","bd4000",1)~ EXTERN BDTHRUDD PleaseYouKillGnargQuestLeft
    IF ~~ THEN REPLY @10004 /* ~I have no time for this. There is a battle raging, in case you had not noticed.~ */ DO ~ActionOverride("BDTOLIKS",SetGlobal("dca_bd_trolls_declined","locals",1)) SetGlobal("dca_bd_trolls_journal_neutral","bd4000",1)~ EXTERN BDTHRUDD PleaseYouKillGnargQuestLeft
END

/* ---- */

/* Troll */

// Like State 1 ("Please. You kill Gnarg. [...]") but with a shortened line and different journal entry
APPEND BDTHRUDD
    IF ~~ THEN BEGIN YouKillGnarg
        SAY @10008 /* ~You kill Gnarg. Let us out and we help you fight him friends.~ */
        IF ~~ THEN DO ~ActionOverride("cutspy",DestroySelf())~ UNSOLVED_JOURNAL @10005 /* The Siege of Dragonspear I told the trolls I would free them if I could. The creatures begged for release from their pen, saying they had been taken, tormented, and forced to fight for the crusade. I should try to help them. */ EXIT
    END
END

// Like BDTHRUDD State 1 but with different journal entry
APPEND BDTHRUDD
    IF ~~ THEN BEGIN PleaseYouKillGnargQuestCanRelease
        SAY #%stringref_please_you_kill_gnarg% /* ~Please. You kill Gnarg. Let us out and we help you fight him friends.~ */
        IF ~~ THEN DO ~ActionOverride("cutspy",DestroySelf())~ UNSOLVED_JOURNAL @10006 /* The Siege of Dragonspear he captive trolls offered to fight the crusaders if I release them. They say they were captured, hurt, and forced to fight for the crusade. If I can loose them safely, their anger may prove useful against Dragonspear's defenders. */ EXIT
    END
END

// Like BDTHRUDD State 1 but with different journal entry
APPEND BDTHRUDD
    IF ~~ THEN BEGIN PleaseYouKillGnargQuestLeft
        SAY #%stringref_please_you_kill_gnarg% /* ~Please. You kill Gnarg. Let us out and we help you fight him friends.~ */
        IF ~~ THEN DO ~ActionOverride("cutspy",DestroySelf())~ UNSOLVED_JOURNAL @10007 /* The Siege of Dragonspear I left the trolls penned up, though I can always return and release them to create havoc. */ EXIT
    END
END

/* M'Khiin: More cages. Sick of bars. Seen too many. */

// Re-route
// as this went straight to the end state "Please. You kill Gnarg. [...]", skipping all our options
// as well as other NPC lines including one from M'Khiin
ALTER_TRANS BDMKHIIJ
    BEGIN 103 END  // State 103
    BEGIN 0 END  // first answer
    /* (No text) */
    BEGIN
        "EPILOGUE" ~EXTERN BDMORRUK 0~  // from `EXTERN BDTOLIKS 0`
END
