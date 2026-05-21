/* Imoen: ~What...? What is this place? It's—it's beautiful! Oh... there is simply no way that this space belongs to the same person that owns those horrible glass containers.~ */

// Prevent this state from triggering if a dryad has mentioned Her room,
// because she likely wouldn't say this then. And if she did, the player should
// be able to say, "It must be the room the dryad mentioned", but none of the
// followups fit that response.
ADD_STATE_TRIGGER IMOEN2J 1530 ~!Global("HelpDryads","GLOBAL",2)~
