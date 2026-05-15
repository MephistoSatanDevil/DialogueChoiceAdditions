/* Rahvin

---- 

~A rather strange place to meet living members of the sunlit realms. I am curious as to why you are here. Could I rightly assume that you have something in common with the man Sarevok Anchev?~ */

EXTEND_TOP RAHVIN 0
    IF ~~ THEN REPLY @1000 /* ~We are here to stop Sarevok. Who are you?~ */ GOTO 5
END