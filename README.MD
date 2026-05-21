# Dialogue Choice Additions

**Dialogue Choice Additions** (DCA) is a vanilla-faithful mod for *Baldur's Gate* (*Enhanced Edition* or *[Enhanced Edition Trilogy](https://www.gibberlings3.net/mods/other/eet/)*) that gives player characters more ways to respond in various conversations throughout the game.

Additional dialogue choices (also known as dialogue options, responses, or replies) are added to specific dialogues where the original game left plausible responses uncovered. Additionally, some [dialogue trees](https://en.wikipedia.org/wiki/Dialogue_tree) are improved in gentle ways, such as [Voleta](https://baldursgate.fandom.com/wiki/Voleta_Stiletto) not repeating her "Blast you all thrice over" line each time you talk to her. DCA does not change or add new NPC dialogue (for exceptions, see [Voices Voices Extravaganza](#voices-voices-extravaganza)).

The project's goals are as follows:

- Cover as many things as the player might want to do in any given situation (e.g. end the conversation)
- Broad character coverage
- Vanilla-friendly / style matches the rest of the game
- Story cohesion
- NPC followups to player choices follow naturally
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

## Example

To highlight changes, new dialogue choices are set in bold type in this example (but not in the actual game).

> De Lancie: We know Dragonspear is being supplied via the caverns you'll be visiting shortly, if all goes as planned. If you put a few drops of this in the enemy food supplies and water, we would have an edge when we finally confront the Shining Lady.

### Before

1. Poison an enemy army? You sicken me, de Lancie. Is this the honor of the Waterdhavian guard?
2. What? Explosives are one thing, but poison is too much. I'll hear no more of this.
3. That would give us a significant advantage, but managing it would entail significant risk. Which means I'll want a significant reward.
4. I will show the Shining Lady's followers the same mercy they would have shown me. Give me the poison.

### After

1. **An ugly task, but I will see it done.**
2. Poison an enemy army? You sicken me, de Lancie. Is this the honor of the Waterdhavian guard?
3. **I want no part in victory purchased with needless suffering.**
4. That would give us a significant advantage, but managing it would entail significant risk. Which means I'll want a significant reward.
5. I will show the Shining Lady's followers the same mercy they would have shown me. Give me the poison.
6. **I kill when it suits me, but I will not play poisoner for you. Press me no further.**

This may be a bit on the excessive side with regards to number of choices presented, but this is arguably a morally complicated situation, and each choice offers a unique stance.

## Compatibility

### Voices Voices Extravaganza

A requirement for any changes this mod makes is that it be seamlessly compatible with the [Voices Voices Extravaganza](https://www.gibberlings3.net/forums/topic/38809-bg1-voices-voices-extravaganza-ai-dialog-voiceovers/) (VVE) mod. This generally means that no changes to NPC dialogue is made. However, for the purpose of enabling more dialogue choices, there are some instances where new dialogue is added, shortened from vanilla lines. If you install the VVE compatibility patch component, AI voiceover is added to these lines—either generated or edited from VVE voiceover files. An example of this is where the mod adds a new dialogue choice that is critical/skeptical toward [De Lancie](https://baldursgate.fandom.com/wiki/Torsin_de_Lancie)'s poisoning suggestion, but not on the basis of honor like in vanilla. The new option leads to a new state where the following line from De Lancie is recycled:

> Given a choice between victory and honor, I know which I'll choose. I can see you'll not be persuaded entirely by reason—given your reputation, I can't say I'm surprised. Perhaps you are open to compromise. Would it change your mind if I told you the poison wasn't lethal?

For the new state, it's shortened to the following:

> Perhaps you are open to compromise. Would it change your mind if I told you the poison wasn't lethal?

To be clear, the old line is not removed; it will still be triggered if the player picks the vanilla dialogue option that leads to it (in this case, "Poison an enemy army? You sicken me, de Lancie. Is this the honor of the Waterdhavian guard?")

In the case where a line cannot be cleanly extracted from VVE audio, a new voiceover file is generated with AI.

If the NPC dialogue is voiced in vanilla, "new" dialogue is only added if it can be flawlessly be extracted from vanilla voiceover.

### Enhanced Edition Trilogy

*Dialogue Choice Additions* has currently only been tested with [Baldur's Gate: Enhanced Edition Trilogy](https://www.gibberlings3.net/mods/other/eet/) (EET) and to a lesser extent vanilla *Baldur's Gate: Enhanced Edition* (with Enhanced Edition Fixpack). Whether it works on old *Baldur's Gate*, or *Baldur's Gate Trilogy* (BGT), I do not know. DCA currently only makes changes to "Baldur's Gate" and "Siege of Dragonspear" content. You do not need to have *Siege of Dragonspear* installed (unless you're using EET), although the mod has not been tested without it.

It should be installed before EET_end.

### Enhanced Edition Fixpack

Do not use DCA if you do not have Enhanced Edition Fixpack (EEFP) installed. DCA has not been tested without it. Using DCA without EEFP installed may very plausibly introduce issues.

### Jastey's SoD Tweak Pack

The mod is compatible with the "More Dialogue Choices & Prevent Dead Ends" component of the mod [Jastey's SoD Tweak Pack](https://www.gibberlings3.net/mods/tweaks/jasteys-sod-tweak-pack/). In some cases, this mod hides dialogue choices from Jastey's SoD Tweak Pack in accordance with this project's goals, where the two mods change the same dialogue states (I recommend their mod, but the combined result in these cases was not desirable). Dialogue Choice Additions should be installed *after* the Jastey's SoD Tweak Pack component.

### Other known compatible mods

- [Jarl's Adventure Pack](https://www.gibberlings3.net/forums/topic/39828-kerzenburgforum-jarls-adventure-pack-bug-report-and-support-thread/). Most likely; I haven't playtested with the "Jopi" component, but it seems unlikely there should be a problem.
- [Baldur's Gate Romantic Encounters](https://www.gibberlings3.net/mods/npcs/bg-romantic-encounters/) (BG1RE).

### Other mods

Mods that alter dialogues with the same NPCs might not be compatible. Leave a notice (on [GitHub](https://github.com/virginviolet/DialogueChoiceAdditions/) or [The Gibberlings Three](https://www.gibberlings3.net/forums/topic/41248-dialogue-choice-additions/issues)) if you know any that hasn't been mentioned.

## Installation

### Project Infinity

If you use [Project Infinity](https://forums.beamdog.com/discussion/74335/project-infinity-mod-manager-for-baldurs-gate-icewind-dale-planescape-torment-and-eet):

1. Go to [Releases](https://github.com/virginviolet/DialogueChoiceAdditions/releases/latest) and download the .iemod file.
2. As usual with WeiDU installer mods, disable anti-virus software (including Windows Defender) temporarily.
3. Double-click the .iemod file and open with Project Infinity.
4. Select "Import Mod".
5. If you already had a Project Infinity window open and this opens another one, then close one of them.
6. Click the refresh button (🔃).
7. Select the mod components you want.
8. Press "Set-InstallSequence".
9. Press "Start-Installation".
10. Re-enable anti-virus software.
11. Run the game and have fun!

### Infinity Engine Mod Installer

If you use [Infinity Engine Mod Installer](https://github.com/dark0dave/mod_installer) (mod_installer), I cannot help you. I have never used it.

### Semi-manual installation

1. Go to [Releases](https://github.com/virginviolet/DialogueChoiceAdditions/releases/latest) and download the .zip archive that has the prefix that matches your operating system.
2. Extract the archive to your game directory (so the the binary—e.g. "setup-DialogueChoiceAdditions.exe"— and the "DialogueChoiceAdditions" directory goes directly into your game directory)
3. Run the installer (e.g. setup-DialogueChoiceAdditions.exe).

## Uninstallation

1. Go to your game directory and run setup-DialogueChoiceAdditions.exe
2. Enter "u" to uninstall.

If that doesn't work:

1. Place [weidu.exe](https://weidu.org/) in your game directory.
2. Navigate to your installation directory in a command prompt (hint: `cd`).
3. Run `.\weidu.exe .\DialogueChoiceAdditions\DialogueChoiceAdditions.tp2 --game "C:\path\to\your\game\installation\directory" --use-lang en_US --language 0 --force-install 0` (replace the path) for the "Core" component
4. Run `.\weidu.exe .\DialogueChoiceAdditions\DialogueChoiceAdditions.tp2 --game "C:\path\to\your\game\installation\directory" --use-lang en_US --language 0 --force-install 1` for the VVE patch.

Adjust the instructions for your operating system. Ask an AI assistant (copy paste the instructions) or a friend for help if you need it.

## Attribution

A majority of the (optional) voiceover has been adapted from [Voices Voices Extravaganza](https://www.gibberlings3.net/forums/topic/38809-bg1-voices-voices-extravaganza-ai-dialog-voiceovers/) by Colossus Chang (colossuschang).

[WeiDU](https://weidu.org/) is made by Westley Weimer.

[WeiDU Mod Packager](https://github.com/InfinityTools/WeiduModPackager) is made by [Argent77](https://github.com/Argent77)

Baldur's Gate I (1998), Tales of the Sword Coast (1999), Baldur's Gate II (2000), and Throne of Bhaal (2001) are ©BioWare. Dungeons & Dragons material is ©Wizards of the Coast.

## Changes

The mod currently makes changes to the following dialogues:

### Baldur's Gate

- Diarmid
- Flaming Fist Mercenary at Wyrm's Crossing (main conversation)
- Jhasso (first and second conversation)
- Merchant that approaches you in Seven Suns
- Merchants in Seven Suns (the sneery ones)
- One of the courtesans in the Undercellar
- Ragefast (first conversation)
- Rahvin
- Rieltar (first conversation)
- Scar (early conversations)
- Silence (two conversations)
- Tel-anon
- Voleta

New strings: [dca_dialogue_edits_bg.tra](https://github.com/virginviolet/DialogueChoiceAdditions/blob/main/DialogueChoiceAdditions/installer/translation/en_US/dca_dialogue_edits_bg.tra)

### Siege of Dragonspear

- Ashatiel (first conversation on Dragonspear Castle grounds)
- Aun and Caelar (first conversation)
- Bellowgulp Bluefingers (two conversations)
- Crusader Sergeant by Bridgefort (one dialogue state)
- De Lancie, Marshal Nederlok, and General Stonehand (first conversation)
- De Lancie, Marshal Nederlok, and General Stonehand (after parley)
- De Lancie (second conversation)
- Dying Myconid
- Keherrem (two conversations)
- Ogres by Underground River Entrance (Arbinge and Murs; first conversation)
- Madele (both conversations)
- Marshal Nederlok (first conversation)
- Nereid (one conversations)
- Slug (two conversations)
- Shapur and Therli (one conversation)
- Trolls on Dragonspear Castle grounds

New strings: [dca_dialogue_edits_sod.tra](https://github.com/virginviolet/DialogueChoiceAdditions/blob/main/DialogueChoiceAdditions/installer/translation/en_US/dca_dialogue_edits_sod.tra)

### Shadows of Amn

- "Her" room conversation with Imoen at the start dungeon
- Jailkeep Golem (first one)
- Minsc (first conversation)

## Tools used

- [NearInfinity](https://github.com/NearInfinityBrowser/NearInfinity/wiki)
- [WeiDU](https://weidu.org/)
- [ElevenCreative](https://elevenlabs.io/creative)
- [Adobe Audition](https://www.adobe.com/products/audition.html)
- [Visual Studio Code](https://code.visualstudio.com/)
- [BGForge MLS](https://marketplace.visualstudio.com/publishers/BGforge)
- [WeiDU Mod Packager](https://github.com/InfinityTools/WeiduModPackager)

## External links

- The Gibberlings Three forum thread: [Dialogue Choice Additions](https://www.gibberlings3.net/forums/topic/41248-dialogue-choice-additions/)
