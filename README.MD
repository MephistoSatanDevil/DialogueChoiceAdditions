# Dialogue Choice Additions

**Dialogue Choice Additions** (DCA) is a work-in-progress mod for Baldur's Gate that adds dialogue choices (also known as dialogue options, responses, or replies) to specific dialogues in the game.

The project's goals are as follows:

- Vast roleplay coverage
- Vast moral coverage
- Vanilla-friendly / style matches the rest of the game
- Story cohesion
- NPC followups to player choices follow naturally
- Cover as many things as the player might want to do in any given situation
- Generally, the player character should be explicit (bad: "I don't like this."; good: "I will not tolerate your lies!")

Limitations:

- No more than 6 dialogue options for any given state
- Avoid too many choices for trivial matters
- Avoid having two or more choices that are too similar
- Avoid changing or adding NPC dialogue, and only do so if seamless compatibility with Voices Voices Extravaganza can be ensured
- Compatibility with major mods
- Compatibility with [Voices Voices Extravaganza](https://www.gibberlings3.net/forums/topic/38809-bg1-voices-voices-extravaganza-ai-dialog-voiceovers/)
- Compatibility with [Jastey's SoD Tweak Pack](https://www.gibberlings3.net/mods/tweaks/jasteys-sod-tweak-pack/)

In accordance with these goals and requirements, vanilla dialogue choices sometimes have to be changed or removed. This is done very conservatively, however, and generally avoided.

## Compatibility

A requirement for any changes this mod makes is that it be seamlessly compatible with the [Voices Voices Extravaganza](https://www.gibberlings3.net/forums/topic/38809-bg1-voices-voices-extravaganza-ai-dialog-voiceovers/) (VVE) mod. This generally means that no changes to NPC dialogue is made. There are however a few instances where new dialogue is added, shortened from vanilla lines, in order to add more dialogue choices. In these cases, AI voiceover is added to these lines (edited from VVE voiceover files).

*Dialogue Choice Additions* currently only supports [Baldur's Gate: Enhanced Edition Trilogy](https://www.gibberlings3.net/mods/other/eet/) (EET). Though it will probably work for other versions of the games as well if you make some simple changes to the tp2 file (especially the Baldur's Gate 1 content). If you want to try this, change every instance (or just where it changes Baldur's Gate 1 content) of `ACTION_IF GAME_IS ~eet~ BEGIN` to `GAME_IS ~bgee tutu tutu_totsc eet bgt bg2ee soa tob iwd-in-bg2 ca iwdee~`.

The mod is compatible with the "More Dialogue Choices & Prevent Dead Ends" component of the mod [Jastey's SoD Tweak Pack](https://www.gibberlings3.net/mods/tweaks/jasteys-sod-tweak-pack/). In some cases, this mod hides dialogue choices from Jastey's SoD Tweak Pack in accordance with this project's goals, where the two mods change the same dialogue states.

It should be installed before EET_end.

## Installation

1. On GitHub, click the "Code" button and select "Download Zip"
2. Extract the mod
   a. (Project Infinity) If you use [Project Infinity](https://forums.beamdog.com/discussion/74335/project-infinity-mod-manager-for-baldurs-gate-icewind-dale-planescape-torment-and-eet), extract the zip archive to your "Extracted mods" directory, and click the refresh button in Project Infinity.
   b. (manual installation) If you don't use Project Infinity, extract the DialogueChoiceAdditions directory from the zip archive to your game directory.
   c. (mod_installer) I don't know how that works.
3. Install the mod components you want.
   a. (Project Infinity) Select the mod components you want, press Set-InstallSequence, then press Start-Installation.
   b. (manual installation) Place [weidu.exe](https://weidu.org/) in your game directory, navigate to your installation directory in a command prompt (hint: `cd`), then run `.\weidu.exe .\DialogueChoiceAdditions\DialogueChoiceAdditions.tp2 --game "C:\path\to\your\game\installation\directory" --use-lang en_US --language 0 --force-install 0` (replace the path) for the "Core" component, and `.\weidu.exe .\DialogueChoiceAdditions\DialogueChoiceAdditions.tp2 --game "C:\path\to\your\game\installation\directory" --use-lang en_US --language 0 --force-install 1` for the VVE patch.
   c. (mod_installer) I don't know how that works.

## Roadmap

The version number will change to 1.0.0 once support Baldur's Gate: Enhanced Edition and Baldur's Gate II: Enhanced Edition (without EET) is added.

The mod should be published to major modding websites eventually.

## Attribution

Voiceover has been adapted from [Voices Voices Extravaganza](https://www.gibberlings3.net/forums/topic/38809-bg1-voices-voices-extravaganza-ai-dialog-voiceovers/) by Colossus Chang (colossuschang).

Baldur's Gate I (1998), Tales of the Sword Coast (1999), Baldur's Gate II (2000), and Throne of Bhaal (2001) are ©BioWare. Dungeons & Dragons material is ©Wizards of the Coast.
