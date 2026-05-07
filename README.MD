# Dialogue Choice Additions

**Dialogue Choice Additions** (DCA) is a mod for *Baldur's Gate* (*Enhanced Edition* or *[Enhanced Edition Trilogy](https://www.gibberlings3.net/mods/other/eet/)*) that adds additional dialogue choices (also known as dialogue options, responses, or replies) to specific dialogues in the game. It does not change or add new NPC dialogue (for exceptions, see [Voices Voices Extravaganza](#voices-voices-extravaganza)). It also improves [dialogue trees](https://en.wikipedia.org/wiki/Dialogue_tree) in gentle ways, such as [Voleta](https://baldursgate.fandom.com/wiki/Voleta_Stiletto) not repeating her "Blast you all thrice over" line each time you talk to her.

The project's goals are as follows:

- Vast roleplay coverage
- Vast moral coverage
- Vanilla-friendly / style matches the rest of the game
- Story cohesion
- NPC followups to player choices follow naturally
- Cover as many things as the player might want to do in any given situation
- Generally, the player character should be explicit (bad: "I don't like this."; good: "I will not tolerate your lies!")
- Compatibility with major mods

Dialogue choice requirements:

- No more than 6 dialogue options for any given state
- Avoid too many choices for trivial matters
- Avoid having two or more choices that are too similar
- Avoid changing or adding NPC dialogue, and only do so if seamless compatibility with Voices Voices Extravaganza can be ensured
- Does not introduce bugs
- Compatibility with [Voices Voices Extravaganza](https://www.gibberlings3.net/forums/topic/38809-bg1-voices-voices-extravaganza-ai-dialog-voiceovers/)
- Compatibility with [Jastey's SoD Tweak Pack](https://www.gibberlings3.net/mods/tweaks/jasteys-sod-tweak-pack/)

In accordance with these goals and requirements, vanilla dialogue choices sometimes have to be changed or removed. This is done very conservatively, however, and generally avoided.

## Compatibility

### Voices Voices Extravaganza

A requirement for any changes this mod makes is that it be seamlessly compatible with the [Voices Voices Extravaganza](https://www.gibberlings3.net/forums/topic/38809-bg1-voices-voices-extravaganza-ai-dialog-voiceovers/) (VVE) mod. This generally means that no changes to NPC dialogue is made. However, for the purpose of enabling more dialogue choices, there are a some instances where new dialogue is added, shortened from vanilla lines. If you install the VVE compatibility patch component, AI voiceover is added to these lines—either generated or edited from VVE voiceover files. An example of this is where the mod adds a new dialogue choice that is critical/skeptical toward [De Lancie](https://baldursgate.fandom.com/wiki/Torsin_de_Lancie)'s poisoning suggestion, but not on the basis of honor like in vanilla. The new option leads to a new state where the following line from De Lancie is recycled:

> Given a choice between victory and honor, I know which I'll choose. I can see you'll not be persuaded entirely by reason—given your reputation, I can't say I'm surprised. Perhaps you are open to compromise. Would it change your mind if I told you the poison wasn't lethal?

For the new state, it's shortened to the following:

> Perhaps you are open to compromise. Would it change your mind if I told you the poison wasn't lethal?

To be clear, the old line is not removed. It will still be triggered if the player picks the vanilla dialogue option that leads to it (in this case, "Poison an enemy army? You sicken me, de Lancie. Is this the honor of the Waterdhavian guard?")

In the case where a line cannot be cleanly extracted from VVE audio, a new voiceover file is generated with AI.

If the NPC dialogue is voiced in vanilla, "new" dialogue is only added if it can be flawlessly be extracted from vanilla voiceover.

### Enhanced Edition Trilogy

*Dialogue Choice Additions* has currently only been tested with [Baldur's Gate: Enhanced Edition Trilogy](https://www.gibberlings3.net/mods/other/eet/) (EET), but it should work on *Baldur's Gate: Enhanced Edition* as well. Whether it works on old *Baldur's Gate*, or *Baldur's Gate Trilogy* (BGT) I do not know. DCA currently only makes changes to Baldur's Gate and Siege of Dragonspear content. You should not need to have *Siege of Dragonspear* installed, if you're not using EET.

It should be installed before EET_end.

### Enhanced Edition Fixpack

Do not use DCA if you do not have Enhanced Edition Fixpack (EEFP) installed. DCA has not been tested without it. Using DCA without EEFP installed may very plausibly introduce issues.

### Jastey's SoD Tweak Pack

The mod is compatible with the "More Dialogue Choices & Prevent Dead Ends" component of the mod [Jastey's SoD Tweak Pack](https://www.gibberlings3.net/mods/tweaks/jasteys-sod-tweak-pack/). In some cases, this mod hides dialogue choices from Jastey's SoD Tweak Pack in accordance with this project's goals, where the two mods change the same dialogue states. Dialogue Choice Additions should be installed *after* the Jastey's SoD Tweak Pack component.

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

The version number will change to 1.0.0 once support for *Baldur's Gate: Enhanced Edition* (without EET) has been confirmed.

The mod should be published to major modding websites eventually.

## Attribution

Most of the (optional) voiceover has been adapted from [Voices Voices Extravaganza](https://www.gibberlings3.net/forums/topic/38809-bg1-voices-voices-extravaganza-ai-dialog-voiceovers/) by Colossus Chang (colossuschang).

Baldur's Gate I (1998), Tales of the Sword Coast (1999), Baldur's Gate II (2000), and Throne of Bhaal (2001) are ©BioWare. Dungeons & Dragons material is ©Wizards of the Coast.

## Changes

The mod currently makes changes to dialogues with the following NPCs:

**Baldur's Gate**

- Courtesan in Undercellar
- Diarmid
- Flaming Fist Mercenary at Wyrm's Crossing
- Jhasso
- Merchant that approaches you in Seven Suns
- Merchants in Seven Suns (the sneery ones)
- Ragefast
- Rahvin
- Rieltar
- Scar
- Silence
- Tel-anon
- Voleta

New strings: [dca_dialogue_edits_bg.tra](https://github.com/virginviolet/DialogueChoiceAdditions/blob/main/DialogueChoiceAdditions/installer/translation/en_US/dca_dialogue_edits_bg.tra)

**Siege of Dragonspear**

- Arbinge
- Bellowgulp Bluefingers
- De Lancie
- Dying Myconid
- Keherrem
- Madele
- Murs
- Nederlok
- Nereid
- Slug
- Shapur
- Therli

New strings: [dca_dialogue_edits_sod.tra](https://github.com/virginviolet/DialogueChoiceAdditions/blob/main/DialogueChoiceAdditions/installer/translation/en_US/dca_dialogue_edits_sod.tra)

## Tools used

- [NearInfinity](https://github.com/NearInfinityBrowser/NearInfinity/wiki)
- [WeiDU](https://weidu.org/)
- [ElevenCreative](https://elevenlabs.io/creative)
- [Adobe Audition](https://www.adobe.com/products/audition.html)
- [Visual Studio Code](https://code.visualstudio.com/)
- [BGForge MLS](https://marketplace.visualstudio.com/publishers/BGforge)
