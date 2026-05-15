/* Shapur

----

~I suggest you withdraw.~ */

EXTEND_BOTTOM BDSHAPUR 1 #1
    // Good/neutral exit
    IF ~~ THEN REPLY @5000 /* ~I came here by mistake. I will leave at once.~ */ EXTERN ~BDTHERLI~ 2
END

/* ~We did not come here to battle, but we'll not shy away from it. We were content to go about our search in peace—this bunjiro surfacer and her b'lath attacked us!~ */

ADD_TRANS_TRIGGER BDSHAPUR 8 ~False()~ DO 3  // Hide the fourth option; too similar to the one we add

EXTEND_BOTTOM BDSHAPUR 8 #1
    // Good/neutral exit
    IF ~~ THEN REPLY @5001 /* ~I have no part in this strife. Finish it without me.~ */ EXTERN ~BDTHERLI~ 3
END

/* ~That's no business of yours, surface-dweller.~ */

EXTEND_BOTTOM BDSHAPUR 9 #1
    // Good/neutral exit;
    // a bit limited what we can do here, as BDTHERLI follows
    // with "You heard <PRO_HIMHER>! Cut the black-skinned bastards to pieces!"
    IF ~~ THEN REPLY @5002 /* Then I withdraw. Let your choices claim you.~ */ EXTERN ~BDTHERLI~ 3
END

/* ~I'll not bargain with a surface-dweller. Begone!~ */

EXTEND_BOTTOM BDSHAPUR 10 #1
    // Good/neutral exit
    IF ~~ THEN REPLY @5003 /* ~If you are so intent on dying, then so be it.~ */ EXTERN ~BDTHERLI~ 3
END
