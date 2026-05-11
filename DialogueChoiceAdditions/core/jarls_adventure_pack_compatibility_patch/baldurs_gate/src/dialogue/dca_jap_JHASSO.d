/* Jhasso

----

~You want to torture me again? Do what you want, but you won't learn anything from me.~ */

// Disable this state
// because DCA's states ComeToTormentMeSomeMore and ComeToTormentMeSomeMoreSpoilerFree are arguably better
REPLACE_TRIGGER_TEXT JHASSO
~Global("JA#JHASSO_MOVE","GLOBAL",0)
Global("JA#JHASSO_TALK","LOCALS",0)~
~False()~

/* ~Hmm. The events in the city seem to be running wild. Have you changed your mind?~ */

// Add JhassoFreed conditional
// so that it won't
// trigger before DCA's states WellYoullGetNaughtSpoilerFree, ComeToTormentMeSomeMore, and ComeToTormentMeSomeMoreSpoilerFree
REPLACE_TRIGGER_TEXT JHASSO
~Global("JA#JHASSO_QUEST","GLOBAL",0)
!Global("ENDOFBG1","GLOBAL",2)~
~Global("JhassoFreed","GLOBAL",1) \0~ // Append

/* ~[JHASSO 2] Damn, this would've cost my business a pretty penny!~ */

// Prevent this state from
// triggering instead of some of the states from JAP
REPLACE_STATE_TRIGGER ~JHASSO~ 19 ~!Global("JA#JHASSO_MOVE","GLOBAL",2) !Global("JA#DOPPSE_TALK","GLOBAL",1) !Global("JA#JHASSO_CH7_TALK","LOCALS",100) Global("JhassoIsFree","GLOBAL",1) Global("JA#JHASSO_CH7_TALK","LOCALS",0)~
