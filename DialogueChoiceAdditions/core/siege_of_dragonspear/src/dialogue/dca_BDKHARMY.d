/* Keherrem

----

~Help! Let us out of here! HELP!~ */

ADD_TRANS_TRIGGER ~BDKHARMY~ 0 ~False()~ DO 2  // Hide the third option; we will add a replacement

EXTEND_TOP ~BDKHARMY~ 0
    IF ~~ THEN REPLY @7000 /* ~Of course. I'll find a way to free you.~ */ GOTO 3
END

EXTEND_BOTTOM ~BDKHARMY~ 0
    // The analogous vanilla state uses his most panicked line;
    // we extend this branch and use a lesser panicked line first
    IF ~~ THEN REPLY @7013 /* ~You wear crusader colors. I have no interest in helping you.~ */ GOTO LetKharmyBe
    IF ~~ THEN REPLY @7014  /* ~Why free you when I can kill you instead?~ */ GOTO KillOrNot
END

/* ~Private Keherrem of the crusade here. We're on a real important mission, and these kooky cultists caught us. Help!~ */

ADD_TRANS_TRIGGER ~BDKHARMY~ 1 ~False()~ DO 4  // Hide the fifth option; we will add a replacement

EXTEND_BOTTOM ~BDKHARMY~ 1
    IF ~~ THEN REPLY @7015 /* ~I will not free crusaders. Remain where you are. Farewell.~ */ GOTO LetKharmyBe
    // Adapted from vanilla option "Those spikes in the floor were designed to shoot up and impale you. One pull of that lever across the room and I'd rid the world of three crusaders. I'll tell your fellows the cultists killed you."
    // The original option lead immediately to killing (or companion dialogue then killing)
    // Instead, we move to a state where the player can motivate their killing or pull back
    // Adapted from the same vanilla option as the previous one
    IF ~~ THEN REPLY @7002  /* ~Those spikes in the floor were designed to shoot up and impale you. One pull of that lever across the room and I'd rid the world of three crusaders.~ */ GOTO KillOrNot
END

/* ---- */

APPEND ~BDKHARMY~
    IF ~~ THEN BEGIN KillOrNot
        SAY #%stringref_no_dont_do_that_please_just_let_us_go% /* ~No! Don't do that, please! Just let us go.~ */
        IF ~IsValidForPartyDialogue("Rasaad")~ THEN EXTERN ~RASAADJ~ KillOrNotRasaad
        IF ~~ THEN REPLY @7007 /* ~I was merely thinking out loud. How would I go about freeing you?~ */ GOTO 3
        IF ~~ THEN REPLY @7004 /* ~I will not take the lives of helpless prisoners. But neither will I open the door for crusaders. The cage stays shut.~ */ GOTO LetKharmyBe
        IF ~~ THEN REPLY @7008 /* ~If you serve the crusade, I cannot spare you. Say whatever prayers you know.~ */ GOTO DecidedToKillKharmyNew
        IF ~~ THEN REPLY @7009 /* ~Beg louder. I want to hear it when I pull the lever.~ */ GOTO DecidedToKillKharmyNew
        IF ~~ THEN REPLY @7010 /* ~I will have to think about this.~ */ GOTO ThinkAboutIt
    END
END

APPEND ~RASAADJ~
    IF ~~ THEN BEGIN KillOrNotRasaad
        SAY #%stringref_it_is_not_a_very_noble_act_to_kill% /* ~It is not a very noble act, to kill helpless prisoners.~ */
        IF ~IsValidForPartyDialogue("Dorn")~ THEN EXTERN ~DORNJ~ KillOrNotDorn
        %impale_or_not_rasaad_dorn_choices%
    END
END

APPEND ~DORNJ~
    IF ~~ THEN BEGIN KillOrNotDorn
        SAY #%stringref_but_it_is_a_sensible_act% /* ~But it is a sensible act.~ */
        %impale_or_not_rasaad_dorn_choices%
    END
END

// The analogous vanilla state doesn't use his most panicked line
APPEND ~BDKHARMY~
    IF ~~ THEN BEGIN DecidedToKillKharmyNew
        SAY #%stringref_no_dont_dont_dont% /* ~NO! Don't! Don't, don't, don't, don't do that!~ */
        COPY_TRANS ~BDKHARMY~ 7
    END
END

APPEND ~BDKHARMY~
    IF ~~ THEN BEGIN LetKharmyBe
        SAY #%stringref_free_us_please_ill_do_anything%
        // Global("bd_sdd201_missing_keherram","GLOBAL",100): Player explicitly decided to leave Keherrem alive in his cage
        // Note that Keherrem's name uses a different spelling in variable names
        IF ~~ THEN DO ~SetGlobal("bd_sdd201_missing_keherram","GLOBAL",100)~ UNSOLVED_JOURNAL @7011 EXIT
    END
END

APPEND ~BDKHARMY~
    IF ~~ THEN BEGIN ThinkAboutIt
        SAY #%stringref_free_us_please_ill_do_anything%
        COPY_TRANS ~BDKHARMY~ 3  // From "There must be a key around here somewhere" state
    END
END

/* ~Free us, please!~ */

// Allow conversation to trigger if the player explicitly decided to leave Keherrem alive in his cage
REPLACE_STATE_TRIGGER ~BDKHARMY~ 10 ~OR(2) Global("bd_sdd201_missing_keherram","GLOBAL",1) Global("bd_sdd201_missing_keherram","GLOBAL",100)~  // From `Global("bd_sdd201_missing_keherram","GLOBAL",1)`

EXTEND_BOTTOM ~BDKHARMY~ 10 #1
    IF ~~ THEN REPLY @7004 /* ~I will not take the lives of helpless prisoners. But neither will I open the door for crusaders. The cages stay shut.~ */ GOTO LetKharmyBe
END

/* ~You have proof of that?~ */

// Prevent adding "I should return [...]" to journal
// if the player decided to let Kharmy/Keherrem be
// (pulling the kill lever sets bd_sdd201_missing_keherram to 3,
// so this trigger won't interfere if the player changed their mind and pulled the lever anyway)
// Also prevent the the journal entry if the player already has the badge
ADD_TRANS_TRIGGER ~BDGUAR20~ 7 ~!Global("bd_sdd201_missing_keherram","GLOBAL",100) !PartyHasItem("bdmisc52")~ DO 0  // From none
/* (No text) */
// Fallback for when bd_sdd201_missing_keherram is not 100
EXTEND_TOP ~BDGUAR20~ 7  // Crusader Sergeant
    IF ~~ THEN EXIT
END
