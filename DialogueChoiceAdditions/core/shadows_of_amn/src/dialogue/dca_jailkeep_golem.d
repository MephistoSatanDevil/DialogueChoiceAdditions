EXTEND_BOTTOM IGOLEM2 0
    // I wasn't able to get this to work
    // In reply to Imoen's line
    // IF ~Global("IMOENGOLEM","GLOBAL",0) InParty("IMOEN2") See("IMOEN2") !Dead("IMOEN2") !StateCheck("IMOEN2",STATE_SLEEPING)~ THEN REPLY @1001 /* ~I would rather get out of here.~ */ GOTO 5
    // // If Imoen wasn't available to say her line
    // IF ~!Global("IMOENGOLEM","GLOBAL",0) !InParty("IMOEN2") !See("IMOEN2") !Dead("IMOEN2") !StateCheck("IMOEN2",STATE_SLEEPING)~ THEN REPLY @1002 /* ~I have no time for this. Farewell.~ */ GOTO 5
    // IF ~!Global("IMOENGOLEM","GLOBAL",0) !InParty("IMOEN2") !See("IMOEN2") Dead("IMOEN2") !StateCheck("IMOEN2",STATE_SLEEPING)~ THEN REPLY @1002 /* ~I have no time for this. Farewell.~ */ GOTO 5
    // IF ~!Global("IMOENGOLEM","GLOBAL",0) !InParty("IMOEN2") !See("IMOEN2") Dead("IMOEN2") StateCheck("IMOEN2",STATE_SLEEPING)~ THEN REPLY @1002 /* ~I have no time for this. Farewell.~ */ GOTO 5
    // IF ~!Global("IMOENGOLEM","GLOBAL",0) !InParty("IMOEN2") !See("IMOEN2") !Dead("IMOEN2") StateCheck("IMOEN2",STATE_SLEEPING)~ THEN REPLY @1002 /* ~I have no time for this. Farewell.~ */ GOTO 5
    IF ~~ THEN REPLY @1002 /* ~I have no time for this. Farewell.~ */ GOTO 5
END