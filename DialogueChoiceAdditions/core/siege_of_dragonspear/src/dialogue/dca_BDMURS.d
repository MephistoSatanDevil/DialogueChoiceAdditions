/* Murs

----

~Shiners come take more of us away! KILL 'EM!~ */

EXTEND_BOTTOM BDMURS 6
    // Deception attempt
    IF ~~ THEN REPLY @2000 /* ~Hold your clubs! Yes, we ARE from the crusade, but we are here to help you.~ */ GOTO 8
END

/* You not shiners? Why you here? */

EXTEND_BOTTOM BDMURS 9
    // Evil/selfish/tactless
    IF ~~ THEN REPLY @2001 /* ~I thought there might be something here worth stealing.~ */ GOTO 8
END
