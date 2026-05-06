/* Madele

----

~Who's there? My eyes are gone, but I can hear you... smell you. My dark lord sends me company! Speak to me, you who smells of sunlight and blood. Tell me who it is that visits my dusty prison.~ */

EXTEND_BOTTOM ~BDMADELE~ 0 #1
    // Good/neutral exit
    IF ~~ THEN REPLY @8000 /* ~I am not here to keep you company, and my name is not yours to know. I will speak to you no further.~ */ DO ~SetGlobal("bd_madele_plot","bd7230",1)~ GOTO 18
END

/* ~Faithful! Though my name has withered to dust in this endless night, still I may be called FAITHFUL. Lone travelers walked too close, fell into our nets, and we cut out their hearts. Blood ran down my arms, and I felt the Lord of Murder's blessing!~ */

// I don't think the vanilla reply makes much sense here. 1. PC asked a question. 2. Madele wasn't exactly telling who she was.
ALTER_TRANS ~BDMADELE~
    BEGIN 2 END  // State 2
    BEGIN 3 END  // Fourth response
    /* ~I don't care who you are. Bother me no more.~ */
    BEGIN
        "REPLY" ~@8008~ /* ~That is all I need to know. Farewell.~ */
END

/* ~The base god of treachery now rules here; his mocking laugh sears my brain. I will not say his name. She can never make me say his name! A new age of Bhaal will be upon us, and soon. The Harpers stole and slew our children, but still I remain faithful. The Lord of Murder will rise again.~ */

// Make the query about the children lead directly to the tale of the children
// Seems like an oversight in vanilla
ALTER_TRANS ~BDMADELE~
    BEGIN 4 END  // State 4
    BEGIN 1 END  // second response
    /* ~What tale shall I spin for you? That of our stolen children, or of our collapse?~ */
    BEGIN
        "EPILOGUE" ~GOTO 6~
END

/* ~"Stole" is not the proper word. "Liberated" is more accurate. Harpers sometimes rescue innocents from cults prepared to sacrifice them.~ */

// Make the query about the children (in State 4) lead more directly to the tale of the children (after Jaheira's line here)
// Seems like an oversight in vanilla
ALTER_TRANS ~JAHEIRAJ~
    BEGIN 776 END  // State 776
    BEGIN 0 END  // first response
    BEGIN
        "EPILOGUE" ~EXTERN BDMADELE 6~
END

/* ~Alone in the dust. Alone in the rust. Hahahahaha! Forgotten servant of a forgotten god.~ */

// Hide the fourth option if the player has the key
ADD_TRANS_TRIGGER ~BDMADELE~ 19 ~!PartyHasItem("bdkey11")~ DO 3
/* ~I will return once I have the means to free you.~ */

// Prevent this response from ending the conversation
ALTER_TRANS ~BDMADELE~
    BEGIN 19 END  // State 19
    BEGIN 2 END  // Third response
    /* ~I found the mind flayer who had taken over the temple. It was your mind that allowed him access.~ */
    BEGIN
        "EPILOGUE" ~GOTO SheThoughtIWasPowerlessNew~  // From `EXIT`
END

// Make this response add journal entry and complete quest
ADD_TRANS_ACTION ~BDMADELE~
    BEGIN 19 END  // State 19
    BEGIN 4 END  // Fifth response
    /* ~Rot in your cell. You deserve no better.~ */
    ~AddJournalEntry(@8003,QUEST)~
END

// Copy this response from State 12
EXTEND_TOP ~BDMADELE~ 19
    // Copy this response from State 12
    // bdmisc51: Wardstone
    // bddarskh: the Mind Flayer
    IF ~Global("bd_bf_wardstone_plot","global",1) !PartyHasItem("bdmisc51") !Dead("bddarskh")~ THEN REPLY #%stringref_ive_come_here_looking_for_a_wardstone% /* ~I've come here seeking a wardstone stolen by a priest of Cyric. Do you know where I might find such a thing?~ */ GOTO 14
END

EXTEND_BOTTOM ~BDMADELE~ 19 #1
    // Good/neutral/evil
    // Replacement for vanilla fifth response ("Rot in your cell. You deserve no better.")
    IF ~~ THEN REPLY @8001 /* ~I will not free you.~ */ SOLVED_JOURNAL @8003 GOTO 20
END

EXTEND_BOTTOM ~BDMADELE~ 19
    // Good/neutral/evil exit
    IF ~~ THEN REPLY @8006 /* ~I have nothing to say to you.~ */ GOTO 20
END

/* ~Tired... so tired. Ziatar knows, she has... what you need. I must rest now... almost over. Almost done.~ */

EXTEND_BOTTOM ~BDMADELE~ 15 #4
    // Good/neutral exit
    IF ~Global("bd_bf_wardstone_plot","global",0)~ THEN REPLY @8002 /* ~Rest, then. I have no more questions for the moment.~ */ DO ~SetGlobal("bd_madele_plot","bd7230",2)~ GOTO 18
END

EXTEND_BOTTOM ~BDMADELE~ 15 #1
    // Good/neutral exit
    IF ~Global("bd_bf_wardstone_plot","global",1)~ THEN REPLY @8002 /* ~Rest, then. I have no more questions for the moment.~ */ DO ~SetGlobal("bd_madele_plot","bd7230",2) AddJournalEntry(264984,QUEST)~ GOTO 18
END

/* ---- */

APPEND ~BDMADELE~
    IF ~~ THEN BEGIN SheThoughtIWasPowerlessNew
        SAY #%stringref_she_thought_i_was_powerless% /* ~She thought I was POWERLESS. She thought the Lord of Murder had abandoned me. But I told it everything, EVERYTHING. I know each voice here, each step, each slamming door. I told it that SHE was the one to control. And now she's gone... gone forever! And the temple of the betrayer falls.~ */
        // Basically the responses from State 19
        IF ~Global("bd_madele_plot","bd7230",1)~ THEN REPLY #%stringref_what_forgotten_god% GOTO 1
        IF ~PartyHasItem("bdkey11")~ THEN REPLY #%stringref_i_am_here_to_free_you_i_found_the_key% GOTO 21
        IF ~!PartyHasItem("bdkey11")~ THEN REPLY #%stringref_i_will_return_once_i_have_the_means% GOTO 20
        IF ~~ THEN REPLY @8001 /* ~I will not free you.~ */ SOLVED_JOURNAL @8003 GOTO 20
        IF ~~ THEN REPLY #%stringref_rot_in_your_cell% SOLVED_JOURNAL @8003 GOTO 20
        IF ~~ THEN REPLY @8007 /* ~I have nothing more to say to you.~ */ GOTO 18  // Only one that differs from State 19
    END
END

/* ~Your orders contradict everything my lord has taught me... but you are his child! How can I deny you? But how can I defy him? I... I will try, child of murder.~ */

// Add journal entry if you free Madele (if the quest has started)
EXTEND_BOTTOM ~BDMADELE~ 22
    IF ~Global("bd_madele_plot","bd7230",2)~ THEN DO ~StartCutSceneMode() FadeToColor([10.0],0) SmallWait(10) JumpToPoint([2126.872]) FadeFromColor([10.0],0) EndCutSceneMode() AddJournalEntry(@8004,QUEST)~ EXIT
END

/* ~Your words are like cold water on a parched throat. For you, child of murder! I will kill in your name!~ */

// Add journal entry if you free Madele (if the quest has started)
EXTEND_BOTTOM ~BDMADELE~ 23
    IF ~Global("bd_madele_plot","bd7230",2)~ THEN DO ~StartCutSceneMode() FadeToColor([10.0],0) SmallWait(10) JumpToPoint([2126.872]) FadeFromColor([10.0],0) EndCutSceneMode() AddJournalEntry(@8005,QUEST)~ EXIT
END

/* ~Perhaps one day my lord will hear my prayers once more.~ */

// Add journal entry if you free Madele (if the quest has started)
EXTEND_BOTTOM ~BDMADELE~ 24
    IF ~Global("bd_madele_plot","bd7230",2)~ THEN DO ~StartCutSceneMode() FadeToColor([10.0],0) SmallWait(10) JumpToPoint([2126.872]) FadeFromColor([10.0],0) EndCutSceneMode() AddJournalEntry(@8005,QUEST)~ EXIT
END
