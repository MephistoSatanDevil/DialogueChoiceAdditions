/* Dying Myconid

----

~(The mushroom creature shudders. Its body emits a prolonged belch from an orifice you cannot see.)~ */

ADD_TRANS_TRIGGER ~%bddyingm%~ 0 ~False()~ DO 0  // Hide the first option; will replace
/* ~I can't understand you. Are you all right? What is that horrible smell?~ */

ADD_TRANS_TRIGGER ~%bddyingm%~ 0 ~False()~ DO 1  // Hide the second option; will replace
/* ~I can't understand you. Are you all right? What is that horrible smell?~ [MINSCJ.DLG] */

EXTEND_TOP ~%bddyingm%~ 0
    // Non-insulting option
    IF ~!IsValidForPartyDialogue("MINSC")~ THEN REPLY @3000 /* ~I can't understand you. Are you all right?~ */ GOTO 1
    IF ~IsValidForPartyDialogue("MINSC")~ THEN REPLY @3000 /* ~I can't understand you. Are you all right?~ */ EXTERN ~MINSCJ~ 649  // TODO: Correct for non-EET?
END

EXTEND_BOTTOM ~%bddyingm%~ 0
    IF ~~ THEN REPLY @3001 /* ~I think we should leave.~ */ GOTO 1
END