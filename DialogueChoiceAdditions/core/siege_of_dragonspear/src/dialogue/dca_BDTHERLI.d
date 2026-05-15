/* Therli

----

~Many thanks for the help, stranger. We could have taken the drow, but it would have cost us dearly. They are experienced warriors, especially in surroundings such as these.~ */

EXTEND_TOP BDTHERLI 4 #3
    IF ~IsValidForPartyDialogue("BAELOTH") !IsValidForPartyDialogue("VICONIA")~ THEN REPLY @5004 /* ~I merely hoped talking might spare a great deal of bleeding.~ */ EXTERN BDSHAPUR 17
    IF ~IsValidForPartyDialogue("BAELOTH") IsValidForPartyDialogue("VICONIA")~ THEN REPLY @5004 /* ~I merely hoped talking might spare a great deal of bleeding.~ */ EXTERN BDSHAPUR 18
    IF ~!IsValidForPartyDialogue("BAELOTH")~ THEN REPLY @5004 /* ~I merely hoped talking might spare a great deal of bleeding.~ */ EXTERN BDSHAPUR 21
END