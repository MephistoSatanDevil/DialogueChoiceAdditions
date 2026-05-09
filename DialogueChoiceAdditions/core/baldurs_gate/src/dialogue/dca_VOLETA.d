/* Voleta Stiletto

----

~Blast you all thrice over! I don't know who you be, but if you are in league with him that cut me down you can all go straight to Hades! May the spirits of those that built this maze take you down!~ */

REPLACE_STATE_TRIGGER ~VOLETA~ 0 ~NumTimesTalkedTo(0)~ // From `True()`

ADD_TRANS_TRIGGER ~VOLETA~ 0 ~False()~ DO 1 // Hide the second option; it's already clear from the NPC line that she's injured.
/* ~You look injured. Who has done this to you?~ */

ADD_TRANS_TRIGGER ~VOLETA~ 0 ~False()~ DO 2 // Hide the third option
/* ~I mean you no harm. I am only here to find Sarevok.~
Voleta is already harmed; a friend of Sarevok could very well want to find him, so it shouldn't be assuring, yet this option makes her think otherwise */

EXTEND_TOP ~VOLETA~ 0 #2
    // Good/neutral/inquisitive
    IF ~~ THEN REPLY @0 /* ~Who did this to you?~ */ GOTO 3
END

EXTEND_TOP ~VOLETA~ 0 #3
    // Good/neutral
    IF ~~ THEN REPLY @1 /* ~I am not with the one who harmed you. Have you seen Sarevok?~ */ GOTO 2
END

/* ~No, I fell on my own sword and damn near cut my own throat, you fool! Of course he was here! The mad jackal had clear passage past me and still he paused to strike. I get the last laugh though. Traps ahead will get him even with that mage he was dragging along, and you too if you follow.~ */

ALTER_TRANS ~VOLETA~
    // This led to a state with only one answer option - "Where does the maze lead?" - which is basically a repeat of the previous question ("Where does this passage lead?")
    BEGIN 1 END // State 1
    BEGIN 0 END // first answer
    /* ~Where does this passage lead?~ */
    BEGIN
        "EPILOGUE" ~GOTO WherePassageLeadsNew~
    END

EXTEND_BOTTOM ~VOLETA~ 1
    // Can't go on yapping in the middle of a chase.
    IF ~~ THEN REPLY @2 /* ~Hmph. We'll see about that. Good bye.~ */ GOTO JustBeSure
END

/* ---- */

APPEND ~VOLETA~
    IF ~~ THEN BEGIN JustBeSure
        // Shortened from State 7
        SAY @9 /* ~Just you be sure to give that Sarevok a shank o' steel.~ [DCVOL02] */
    IF ~~ THEN EXIT
    END
END

APPEND ~VOLETA~
    IF ~~ THEN BEGIN WherePassageLeadsNew
        // Dialogue copied from state 4
        SAY #%stringref_where_does_it_lead% /* Where does it lead? You want to follow him? You'll be dead before you get a hundred feet, but I guess it's your life. The maze apparently connects to the Undercity, but I ain't heard of nobody that has gone through and lived to tell. It's kinda meant as a decoy retreat of sorts. Lead intruders down here and they think it's the way out. Usually you don't see them again after that. Ain't seen a live person leave ever. She's full o' undead and kept clean by jellies. Better get a move on if you hope to catch them. I'm just going to stay here and catch my breath.~ */
    IF ~~ THEN EXIT // If the player wanted more details, they shouldn't have started with "Shut your yap!"
    END
END

/* ~Who? Sarevok it was! I recognized him from when I was... ehhh... "exploring" the Iron Throne base the other day. I'll be all right, he was in too much of a hurry to do a proper job on me. You've got my blessings if you're tracking him down.~ */

ADD_TRANS_TRIGGER ~VOLETA~ 3 ~False()~ DO 0 // Hide the first option; we add a less awkward one
/* ~Could you guide me through the maze so I can find him?~ */

EXTEND_TOP ~VOLETA~ 3 #2
    // Less awkwardly phrased request in this context (replaces original)
    IF ~~ THEN REPLY @10 /* ~Um, is there any chance you would be able to see me through the maze?~ */ UNSOLVED_JOURNAL #%stringref_tandem_in_extremis_evidently% GOTO 6
END

EXTEND_TOP ~VOLETA~ 3
    // Non-stupid cool-headed response
    // We don't add the "Tandem in Extremis" journal entry here,
    // because most of it is repeat of information from the "The Maze" journal entry from "Important Events",
    // and the main part that is new is that the fact that the maze is guarded by undead and jellies, and that information
    // is not collected from the State 3 line
    // By the way, annoying discrepancy: Voleta says "nothing but dead down there",
    // while the journal says "nothing but undead down there".
    IF ~~ THEN REPLY #%stringref_where_does_the_maze_lead% /* ~Where does the maze lead?~ */ GOTO 8
END

EXTEND_BOTTOM ~VOLETA~ 3
    // Exit option
    IF ~~ THEN REPLY @3 /* ~That's all need to I know. Good bye.~ */ GOTO JustBeSure
END

/* ~HA! Er... I mean, no. No, I won't be doing that. I ain't ever seen anyone walk out of that maze alive. Not that you won't survive or anything. I bet you just waltz through without a problem. Yes, <SIRMAAM>. I'll just wait here to hear about it though. I ain't got no wish to meet the undead that maintain her, nor the jellies that keep her clean. Gotta... gotta catch my breath, you understand.~ */

EXTEND_BOTTOM ~VOLETA~ 6
    // Exit option
    COPY_TRANS ~VOLETA~ 8 /* ~I understand. Rest ye well.~ */
END

/* ~I don't rightly know, though it is said there is a city beneath this one. Some archaeologist smart-arsed sage might be able to tell you more about it. It's not a proper city down there, you understand. Just the remains. Not surprising, really. If the site that Baldur's Gate is built on is so appealing, it would figure that there would have been one built here before. I care little: nothing but dead down there now. Get moving.~ */

// Hide the first option; we already used this in State 6,
// plus unfitting if the player picked the unfriendly option in State 0
ADD_TRANS_TRIGGER ~VOLETA~ 8 ~False()~ DO 0
/* ~I understand. Rest ye well.~ */

EXTEND_BOTTOM ~VOLETA~ 8
    IF ~~ THEN REPLY @4 /* ~I shall. Good bye.~ */ GOTO JustBeSure
END

/* ---- */

// New top-level state
// so that Voleta won't say her "Blast you all thrice over!" line every time you talk as if she had forgotten about your last exchange
APPEND ~VOLETA~
    IF ~NumTimesTalkedToGT(0)~ THEN BEGIN ImJustGoingToStayHere
        // Dialogue shortened from State 4
        SAY @5 /* ~I'm just going to stay here and catch my breath.~ [DCVOL01] */
        IF ~~ THEN REPLY @0 /* ~Who did this to you?~ */ GOTO 3
        COPY_TRANS ~VOLETA~ 5 /* ~Where does the maze lead?~ */
        IF ~~ THEN REPLY @11 /* ~Are you able to guide me through the maze?~ */ UNSOLVED_JOURNAL #%stringref_tandem_in_extremis_evidently% GOTO 6 // Edited from vanilla line "Could you guide me through the maze so I can find him?"
        IF ~~ THEN REPLY @7 /* ~Rest ye well.~ */ GOTO 7 // Shortened from vanilla line "I understand. Rest ye well."
        IF ~~ THEN REPLY @8 /* ~I should get going.~ */ GOTO JustBeSure
    END
END