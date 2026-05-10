/* Jhasso

----

~Well, you'll get naught from me this day, not a cry of pain nor the knowledge in my noggin. Get away from me, shapeshifter scum.~ */

// Add this trigger back (we removed it in dca_JHASSO.d) because JAP adds a state that is meant to be used
// when Jhasso is talked to subsequent times
ADD_STATE_TRIGGER JHASSO 0 ~NumTimesTalkedTo(0)~

/* ~Well, you'll get naught from me this day, not a cry of pain nor the knowledge in my noggin. Get away from me.~ */

// Add the same trigger as before to DCA's WellYoullGetNaught state
REPLACE_TRIGGER_TEXT JHASSO
~!Global("TalkedToScar","GLOBAL",1)
!Global("JhassoFreed","GLOBAL",1)
!Global("Chapter","GLOBAL",7)~
~NumTimesTalkedTo(0) \0~ // Append

/* ~You want to torture me again? Do what you want, but you won't learn anything from me.~ */

// Add `NumTimesTalkedToGT(0)` trigger to JAP's JA#JHASSO_01 state
// because otherwise it will trigger before DCA's WellYoullGetNaught state (presuming DCA is installed after JAP)
REPLACE_TRIGGER_TEXT JHASSO
~Global("JA#JHASSO_MOVE","GLOBAL",0)
Global("JA#JHASSO_TALK","LOCALS",0)~
~NumTimesTalkedToGT(0) \0~ // Append

/* ~Hmm. The events in the city seem to be running wild. Have you changed your mind?~ */

// Add JhassoFreed conditional so that it won't trigger before DCA's WellYoullGetNaught state
REPLACE_TRIGGER_TEXT JHASSO
~Global("JA#JHASSO_QUEST","GLOBAL",0)
!Global("ENDOFBG1","GLOBAL",2)~
~Global("JhassoFreed","GLOBAL",1) \0~ // Append

/* ~[JHASSO 2] Damn, this would've cost my business a pretty penny!~ */

// Prevent this state from
// triggering instead of JAP's JA#JHASSO_11 ("Hmm. The events in the city seem to be running wild. Have you changed your mind?")
REPLACE_STATE_TRIGGER ~JHASSO~ 19 ~Global("JhassoIsFree","GLOBAL",1) Global("JA#JHASSO_CH7_TALK","LOCALS",0)~
