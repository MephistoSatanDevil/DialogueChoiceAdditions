/* Scar

----

~Back so soon! How did your battle fare?~ */

// Keep track of whether Jhasso has been freed
ALTER_TRANS ~SCAR~
    BEGIN 14 END // State 14
    BEGIN 2 END // third answer
    /* ~The doppelgangers are all dead. Jhasso is back in control of the business.~ */
    BEGIN
        "ACTION" ~SetGlobal("JhassoIsFree","GLOBAL",1)~
    END

/* ~Did you come across Jhasso? Is he alive?~ */

// Keep track of whether Jhasso has been freed
ALTER_TRANS ~SCAR~
    BEGIN 43 END // State 43
    BEGIN 1 END // second answer
    /* ~Alive and well. Jhasso is back in control of the business.~ */
    BEGIN
        "ACTION" ~SetGlobal("JhassoIsFree","GLOBAL",1)~
    END

// Keep track of whether Jhasso has been freed
ALTER_TRANS ~SCAR~
    BEGIN 43 END // State 43
    BEGIN 2 END // third answer
    /* ~Hm. I don't actually think I saw... Yes. He is.~ */
    BEGIN
        "ACTION" ~SetGlobal("JhassoIsFree","GLOBAL",1)~
    END
