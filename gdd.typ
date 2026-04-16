#set page(numbering: none)

#let terminal(body) = block(
  fill: black,
  stroke: 1pt + rgb("00ff41"),
  inset: 12pt,
  radius: 0pt,
  width: 100%,
)[
  #set text(fill: rgb("00ff41"), font: "JetBrainsMono NF", size: 9pt)
  \> #body
]

#align(center + horizon)[
  = GAME DESIGN DOCUMENT
]
#pagebreak()

#outline(depth: 3)

#pagebreak()

#set page(numbering: "1")

== 1. GAME OVERVIEW

=== 1.1 Title (Working)
UNNAMED PROJECT

=== 1.2 Genre
Narrative puzzle game with mystery, meta-game elements, and light action.

=== 1.3 Platform
PC

=== 1.4 Target Audience
Players interested in surreal tech horror, retro computer aesthetics, puzzle-solving, and meta-narratives involving player-system interaction.


== 2. SETTING & NARRATIVE

=== 2.1 Setting
- Primary Location: Computer Lab
- Secondary Location: Internal computer layers
- Time Period: 1980s
#stack(
 dir: rtl,
    spacing: 20%,
    figure(image("images/Corridors.png", width: 200pt), caption:"Secondary",numbering:none ),
    figure(image("images/ComputerTable.png", width: 200pt), caption:"Primary",numbering:none ),
  )
=== 2.2 Story 
A scientist unintentionally creates a self aware digital virus while experimenting on an old computer system.
The virus navigates internal system layers while uncovering fragmented documents tied to a secret organization.
These documents hint at illegal experiments and long-term objectives.
The virus ultimately escapes the system by integrating itself into an artificial biological creature.

=== 2.3 Characters

==== Main Characters 
- Dr. D. Hemmington (Scientist)
- Virus Cube (Player-controlled entity)
- Shadow Avatars
==== Enemies
- Antivirus Programs
- Artificial Creature
- Secret Organization (Indirect presence)

#pagebreak()

#grid(
  columns: 2,
  column-gutter: 8pt,
  row-gutter: 10pt,

  figure(image("images/ScientistV2.jpeg", width: 70mm, height: 70mm), caption: "Scientist", numbering: none),
  figure(image("images/MazeDoorWithCube.jpg", width: 70mm, height: 70mm), caption: "Virus Cube", numbering: none),
  figure(image("images/placeholder.png", width: 70mm, height: 70mm), caption: "Shadow Avatars", numbering: none),
  figure(image("images/placeholder.png", width: 70mm, height: 70mm), caption: "Antivirus Programs (just cubes but yellow)", numbering: none),
  figure(image("images/ArtificialCreature.PNG", width: 70mm, height: 70mm), caption: "Artificial Creature in Cage", numbering: none),
  figure(image("images/placeholder.png", width: 70mm, height: 70mm), caption: "Secret Organization Symbol", numbering: none),
)

#pagebreak()

== 3. GAME LOGIC 

=== 3.1 Core Loop
Explore corridors → Discover secrets → Enter mini-game → Acquire item → Return to corridors → Repeat → Final escape sequence

=== 3.2 Perspective Switching
- First-person scientist perspective
- Virus cube perspective
- Mini-game avatar perspective


== 4. GAMEPLAY SYSTEMS

=== 4.1 Scientist Phase

==== Description
The player controls the scientist from a seated first-person perspective inside the laboratory.

==== Mechanics
- Mouse movement: Look around
- Left click: Inspect objects (rotatable inspection view)
- Interacting with monitor locks camera and zooms in
- Escape key zooms out and opens contextual pause/menu state

==== Purpose
- Environmental storytelling
- Puzzle discovery

==== Security Escalation System

==== Trigger
Scientist intervention after mini-game disruptions.

==== Mechanics
- Scientist says his lines and game switches its focus from the computer
- Scientist automatically selects the keyboard
- Player must input a directional/button code to proceed
- Example input: ← ↑ A ↓ → B ← ↓
- Introduction of additional hazards (laser timing obstacles)

#pagebreak()

=== 4.2 Virus Cube Phase

==== Description
Player controls a digital virus navigating abstract corridors inside the computer system.

==== Controls
- Arrow Keys: Movement
- Spacebar: Interaction

==== Mechanics
- Corridor navigation
- Environmental interaction (documents, photos, audio logs)
- Door spawning after a fixed number of turns

==== Failure State
- Contact with antivirus or lazers displays a dead screen and resets the section.

==== Exit Room System

==== Description
A room encountered between corridor sections.

==== Components
- Exit device
- Three item slots

==== Function
- Acts as a hub and progression gate
- Requires items or data from mini-games to activate exit
\
\
#image("images/MazeDoorWithCube.jpg",width: 200pt)

#pagebreak()

== 5. MINI-GAMES

==== Description
Each mini-game exists as a window inside the desktop environment
and uses a distinct gameplay genre.

==== Common Rules
- Completion grants a key item or critical information
- UI instability increases after each completion
- System glitches force return to corridor phase

#figure(
  image("images/Desktop.png", width: 300pt),
  caption: "Desktop environment — mini-game windows are launched from here",
  numbering: none,
)

=== 5.1 Mini-Game 1: Isometric Adventure

==== Genre Reference
1984-era isometric action-adventure, inspired by *Knight Lore* and early Ultima titles.

==== Presentation
- Fixed isometric perspective  
- Flat-shaded tiles with strict grid alignment  
- Limited color palette with harsh contrast  
- Character and objects rendered as simple geometric sprites  

==== Player Representation
A humanoid figure rendered as an abstract armored sprite.

- A knight-like silhouette  

==== Controls
- Arrow Keys: Movement relative to the isometric grid  
- Space Key: Interact, pick up objects, activate mechanisms  

==== Core Mechanics
- Single-screen isometric room navigation  
- Environmental puzzle-solving through object placement  
- Item pickup and stacking to access higher elevations  

All objects has strict height, collision, and layering rules.

==== Objective
- Completing simple puzzle platforms
- Mixing all materials to make a potion



#pagebreak()

==== -Rooms-

==== Storage Room
- Used for holding supplies and discarded objects.
- Contains crates and heavy blocks
- Elevated shelf or platform
- Potion ingredient stored out of reach
Purpose: basic height puzzle using stacked objects.

==== Collapsed Passage
- A broken corridor section.
- Large gap where floor has fallen away
- Debris usable as makeshift bridges
- Potion ingredient on the far side
Purpose: gap-crossing with planks and pillars.

==== Service Corridor
- A narrow maintenance hallway.
- Sloped floor and uneven ground
- Barrels stored along the wall
- Raised service platform with ingredient
Purpose: ramp-based elevation puzzle.

==== Central Chamber

==== Description
A square chamber acting as the central hub of the dungeon. Three corridors lead to nearby puzzle rooms.
There is a big cauldron filled with water in the middle of the room and a hooded wizard stands beside the cauldron.
On first interaction, he says: “The ingredients are scattered nearby. Bring them here.”

==== Progression
- Each connected room contains one ingredient  
- Upon returning an ingredient, wizard gives a key to open the next room
- When ingredients got added into the mix, the color changes

==== Completion
Wizard casts a magic to finish the potion and he hands the potion to the player.
\
\
#figure(
  image("images/IsometricAdventureHubRoom.png", width: 200pt)
)

#pagebreak()

=== 5.2 Mini-Game 2: Text-Based Adventure

==== Genre Reference
Classic text adventure, ZORK-style interaction.

==== Presentation
- Monochrome text on black background
- Blinking cursor
- Typed input numbers to choose what to do 
- Once the option displays all the content it has, greys out

==== Hidden States
_HasSpokenToFigure, HasLookedAround, HasArguedBard_ \
All are false by default and affect certain dialogue variations.

==== Initial Setting Output
Rain pours down, and you decide to take shelter in the nearest building.  
A sign beside a large door reads: “Sandy’s Tavern?”
The first thing you notice is the smell.  
Old wood, lingering regrets, and a dead mouse.
The next thing is somehow worse.  
A bard screams into a flute, producing something that feels less like music and more like an ear infection.
You briefly wonder if your other senses have failed you, then decide to use your eyes.  
An innkeeper stands behind the counter, polishing a mug with a rag that has clearly seen better days.

==== Scene 0
What do you want to do?

- ASK FOR DRINK -> A
- LOOK AROUND -> B
- TALK TO FIGURE -> C
- ASK BARD TO STOP -> D
_if HasSpokenToFigure true_

- LOOK AT THE CAT -> E

==== Scene A
The Innkeeper wipes the counter. "Uhh, are you gonna order? This place is not a shelter for scumbags like you. You guys even fucking stole my ladle! I was using that to bonk some unholy folk and sometimes for mixing things. If you can bring it back to me, you can pick any drink for free. I think the culprit is still here by the way. Be quick!" \
Return 0

==== Scene B
You scanned the enviroment quickly, the things you saw: \
A cat jumping ropes. \
A knight in full armor. \
A person who talks backwards. \
--
*_HasLookedAround_ sets true*
--\
Return 0

#pagebreak()

==== Scene C
You get close to the mysterious person. He notices you and says:
Answer me this riddle, if you can: What has keys but cannot open doors?
.. .. Oh I didn't thought for you to be this dumb.
Just tell me something weird you saw today.

==== if HasLookedAround is true
- KNIGHT IN ARMOR -> "Boring asf"
- SOMEONE WHO TALKS BACKWARDS -> "Thats just Gary"
Return C
- A CAT JUMPING ROPES -> "Holy shit. Thats the clue you wanted. Follow the leads." \
HasSpokenToFigure sets true, Return 0

==== if HasLookedAround is false
- INNKEEPER? -> "Hey! He is my cousin."
- FUCKING BARD? -> "Its not something unusual. I kinda got deaf after that dudes music."
- IDK, YOU? -> "Fuck you!"
Return 0

==== Scene D
You warned the bard. His response: SHUT DA HELL UP YOU NON-BRAINCELL, UNSIGNIFICANT FUCK.
Return 0
HasArguedBard sets true

==== Scene E
The cat's legs got tangled to the rope. You wanted to help but unfortunately you frightened the cat. Suddenly that cute thing got triggered from bard's 'music' and begin to attack him.\
*_"AAAAAAAAAAAA"_* \

Bard said: Okay man just chill.. Seems like no one likes my music. I gave up. Just take this ladle and dont ask questions..\
You Got x1 Golden Ladle! \
Its a bit warm, you decided to not question it furthermore.

==== Completion
- Simply game crashes
\
\
#figure(
  image("images/zork.jpg", width: 200pt)
)

#pagebreak()

=== 5.3 Mini-Game 3: Top-Down Racing

==== Genre Reference
Early 1980s arcade-style racing games.

==== Presentation
- Fixed top-down camera
- Limited color palette
- HUD displaying speed and remaining time

==== Controls
- Left / Right: Steering
- Up: Accelerate
- Down: Brake

==== Core Mechanics
- Constant forward-scrolling track
- Obstacle avoidance (traffic, barriers, oil slicks)

==== Objective
Reach the end of the track within the time limit.

==== Failure State
- Collision resets vehicle to the starting point

==== Reward
- Traffic cone

#image("images/cargame.png", width: 200pt)

=== 5.4 Terminal Login Puzzle

==== Description
Player must log into the computer using a binary-based password system.

==== Mechanics
- Six togglable binary digits displayed as 0s and 1s
- Password clue hidden behind a photograph of the scientist’s deceased wife
- Password value: 38
- Correct binary input: 100110

==== Result
- Binary digits collapse into a cube
- Cube becomes the controllable entity

#pagebreak()

== 6. LEVEL STRUCTURE

// ── Beat chart helpers ────────────────────────────────────────────
#let _b(body, c) = box(
  fill: rgb("0a0a0a"),
  stroke: 1pt + c,
  inset: (x: 7pt, y: 5pt),
  radius: 0pt,
)[#text(fill: c, font: "JetBrainsMono NF", size: 7pt)[#body]]

#let bn(b) = _b(b, rgb("00ff41"))   // event
#let bc(b) = _b(b, rgb("eebb00"))   // condition / branch
#let bf(b) = _b(b, rgb("ff4444"))   // failure state
#let bi(b) = _b(b, rgb("00ccff"))   // item / reward
#let bt(b) = _b(b, rgb("cc44ff"))   // level transition
#let bs(b) = _b(b, rgb("ff8c00"))   // scientist interrupt

#let _arr = [#h(2pt)#text(fill: luma(80), size: 9pt)[→]#h(2pt)]

#let bflow(..nodes) = {
  for (i, n) in nodes.pos().enumerate() {
    if i > 0 { _arr }
    n
  }
}

#let bbranch(label, ..nodes) = block(
  inset: (left: 14pt, top: 2pt, bottom: 1pt),
)[#text(
  fill: luma(70), font: "JetBrainsMono NF", size: 6.5pt,
)[↳ #label:] #h(4pt)#bflow(..nodes)]

#let bchart(..rows) = block(
  stroke: 0.5pt + luma(35),
  inset: 10pt,
  width: 100%,
  fill: rgb("060606"),
  radius: 0pt,
)[#stack(dir: ttb, spacing: 5pt, ..rows.pos())]

#block(
  fill: rgb("0a0a0a"),
  stroke: 0.5pt + luma(40),
  inset: (x: 10pt, y: 7pt),
  width: 100%,
)[
  #set text(font: "JetBrainsMono NF", size: 6.5pt)
  #text(fill: luma(100))[LEGEND] #h(10pt)
  #bn[EVENT] #h(5pt) #bc[CONDITION] #h(5pt) #bf[FAILURE] #h(5pt)
  #bi[ITEM] #h(5pt) #bt[TRANSITION] #h(5pt) #bs[SCIENTIST]
]
// ─────────────────────────────────────────────────────────────────

=== 6.1 Laboratory

#bchart(
  bflow(bn[GAME START], bn[SCIENTIST PHASE], bn[EXPLORE LAB], bn[FIND WIFE'S PHOTO], bc[PASSWORD CLUE: 38 → 100110]),
  bflow(bn[APPROACH MONITOR], bn[TERMINAL LOGIN PUZZLE], bc[ENTER BINARY INPUT]),
  bbranch("CORRECT: 100110", bn[DIGITS COLLAPSE INTO CUBE], bt[→ CORRIDOR A]),
  bbranch("WRONG INPUT", bf[INPUT RESETS], bn[RETRY]),
)

=== 6.2 Corridor Layer A

#bchart(
  bflow(bt[← LABORATORY], bn[SPAWN AS VIRUS CUBE], bn[NAVIGATE CORRIDORS], bc[DOOR SPAWNS AFTER N MOVES], bn[REACH DOOR], bt[→ EXIT ROOM]),
  bbranch("ANTIVIRUS WITHIN 3 TILES", bc[! INTRUDER DETECTED], bn[EVADE]),
  bbranch("ANTIVIRUS CONTACT", bf[DEATH], bn[RESET SECTION]),
)

#image("images/MazeDoor.jpg", width: 180pt)

=== 6.3 Exit Room

#bchart(
  bflow(bn[ENTER EXIT ROOM], bc[CHECK ITEM SLOTS], bc[3/3 FILLED?]),
  bbranch("YES", bn[EXIT ACTIVATES], bt[→ ESCAPE SEQUENCE]),
  bbranch("NO — SLOTS EMPTY", bn[ENTER MINI-GAME PORTAL], bn[COMPLETE MINI-GAME], bi[ITEM ACQUIRED], bn[RETURN TO EXIT ROOM]),
  bbranch("SHADOW AVATAR PRESENT", bn[INTERACTION], bn[CLUE REVEALED]),
)

#image("images/ExitRoom.jpg", width: 200pt)

=== 6.4 Mini-Game 1 — Isometric Adventure

#bchart(
  bflow(bt[← EXIT ROOM], bn[ENTER ISOMETRIC WORLD], bn[CENTRAL CHAMBER], bn[MEET WIZARD], bc[CHOOSE A ROOM]),
  bbranch("STORAGE ROOM", bn[STACK OBJECTS], bn[REACH ELEVATED SHELF], bi[INGREDIENT 1], bn[WIZARD GIVES KEY]),
  bbranch("COLLAPSED PASSAGE", bn[BRIDGE THE GAP WITH DEBRIS], bn[CROSS TO FAR SIDE], bi[INGREDIENT 2], bn[WIZARD GIVES KEY]),
  bbranch("SERVICE CORRIDOR", bn[USE BARRELS AS RAMP], bn[REACH RAISED PLATFORM], bi[INGREDIENT 3], bn[WIZARD GIVES KEY]),
  bflow(bc[ALL 3 INGREDIENTS?], bn[CAULDRON COMPLETE], bn[WIZARD CASTS SPELL], bi[ITEM: POTION], bt[→ EXIT ROOM — SLOT 1]),
)

=== 6.5 Corridor Layer B — Document

#bchart(
  bflow(bt[← EXIT ROOM], bn[ENTER CORRIDOR], bc[LASERS ACTIVE], bn[NAVIGATE AROUND LASERS], bn[DISCOVER DOCUMENT], bn[REACH DOOR], bt[→ EXIT ROOM]),
  bbranch("LASER CONTACT", bf[DEATH], bn[RESET SECTION]),
  bbranch("SCIENTIST ESCALATION", bs[SCIENTIST INTERVENES], bn[DIRECTIONAL CODE INPUT], bc[CODE CORRECT?], bn[CONTINUE]),
)

#pagebreak()

#grid(
  columns: (200pt, 1fr),
  column-gutter: 16pt,

  image("images/MazeDocument.jpg", width: 180pt),

  block(
    inset: 10pt,
    fill: luma(240),
    radius: 4pt,
  )[
    Content of the document:
    ```
    This is agent A47… I have been trying to breach the target multiple times and aborted it due to the high level security network  , although good news is We have intel on how to awaken the Artificial creature ACB66 , the only way to do it would be to )@(&&(&(&;&;€€#££^€{££€£#^€¥¥++%%#+message corrupted Please inform the Board that they need to reach his network if they want to get their hands on it now , rest of the message is corrupted.
    ```
  ]
)

=== 6.6 Mini-Game 2 — Text Adventure

#bchart(
  bflow(bt[← EXIT ROOM], bn[ENTER SANDY'S TAVERN], bn[SCENE 0: CHOOSE ACTION]),
  bbranch("LOOK AROUND (B)", bn[HAS LOOKED AROUND = TRUE], bn[SEE CAT / KNIGHT / BACKWARDS PERSON]),
  bbranch("TALK TO FIGURE (C)", bc[HAS LOOKED AROUND?], bn[MENTION CAT → HAS SPOKEN TO FIGURE = TRUE]),
  bbranch("LOOK AT THE CAT (E)", bn[CAT TANGLES IN ROPE], bn[CAT ATTACKS BARD], bi[ITEM: GOLDEN LADLE], bn[GAME CRASHES], bt[→ EXIT ROOM — SLOT 2]),
  bbranch("WRONG CHOICES AT C", bf[RETURN TO SCENE C], bn[RETRY]),
)

=== 6.7 Corridor Layer C — Photo

#bchart(
  bflow(bt[← EXIT ROOM], bn[ENTER CORRIDOR], bc[LASERS + ANTIVIRUSES], bn[NAVIGATE THREATS], bn[DISCOVER PHOTO], bn[REACH DOOR], bt[→ EXIT ROOM]),
  bbranch("ANTIVIRUS CONTACT", bf[DEATH], bn[RESET SECTION]),
  bbranch("LASER CONTACT", bf[DEATH], bn[RESET SECTION]),
  bbranch("SCIENTIST ESCALATION", bs[SCIENTIST INTERVENES], bn[DIRECTIONAL CODE INPUT], bc[CODE CORRECT?], bn[CONTINUE]),
)

#stack(
  dir: ltr,
  spacing: 10pt,
  image("images/MazeLazer.jpg", width: 170pt),
  image("images/MazeLazerWithCube.jpg", width: 170pt),
)

=== 6.8 Mini-Game 3 — Top-Down Racing

#bchart(
  bflow(bt[← EXIT ROOM], bn[ENTER RACE], bn[CONSTANT FORWARD SCROLL], bc[AVOID OBSTACLES], bc[WITHIN TIME LIMIT?]),
  bbranch("REACH FINISH", bi[ITEM: TRAFFIC CONE], bt[→ EXIT ROOM — SLOT 3]),
  bbranch("COLLISION", bf[RESET TO START]),
  bbranch("TIME EXPIRES", bf[RACE RESTARTS]),
)

=== 6.9 Corridor Layer D — Voice Message

#bchart(
  bflow(bt[← EXIT ROOM], bn[ENTER FINAL CORRIDOR], bn[DISCOVER VOICE MESSAGE], bc[ALL 3 SLOTS FILLED?]),
  bbranch("YES", bn[RETURN TO EXIT ROOM], bn[EXIT ACTIVATES], bt[→ ESCAPE SEQUENCE]),
  bbranch("ANTIVIRUS / LASER CONTACT", bf[DEATH], bn[RESET SECTION]),
)

=== 6.10 Escape Sequence

#bchart(
  bflow(bn[EXIT ACTIVATES], bs[FINAL SCIENTIST ESCALATION], bn[DIRECTIONAL CODE: FINAL SEQUENCE], bc[CODE CORRECT?]),
  bbranch("YES", bn[VIRUS TRANSFERS TO ACB66], bn[ARTIFICIAL CREATURE AWAKENS], bt[END]),
  bbranch("CODE FAILS", bf[RESET], bn[RETRY]),
)

== 7. HUD DESIGN

=== 7.1 Scientist Phase HUD
#terminal[No persistent HUD elements.]

The scientist phase is fully diegetic. All information is communicated through
the environment itself.

- *Monitor glow* indicates the computer is active and awaiting interaction
- *Phone light* pulses when a call is incoming
- *Desk objects* serve as implicit checklists — player learns to read the room
- Security escalation state is communicated through the scientist's dialogue
  and posture, not a status bar
- Input prompt for the directional code appears as text printed on the monitor
  screen, not as an overlay

=== 7.2 Virus Cube Phase HUD
#terminal[SYSTEM STATUS: NOMINAL █]

All HUD elements are rendered as glitchy terminal overlays that feel native
to the digital environment.

==== Elements
- *Turn Counter* — bottom left, monospace digits, displayed as:
  #terminal[MOVES: 0042]
  Counts total moves taken in the current corridor. No explicit limit shown —
  tension is implied, not quantified.

- *Item Slots* — bottom right, three bracketed cells mirroring the Exit Room
  slots:
  #terminal[\[ITEM_A\] \[------\] \[------\]]
  Empty slots show dashes. Acquired items display a short tag. Slots pulse
  green briefly on pickup.

- *Threat Indicator* — top right, only appears when an antivirus is within
  three tiles:
  #terminal[! INTRUDER DETECTED]
  Fades out when threat clears. No minimap — the player must navigate by feel.

- *Glitch Meter* — represented not as a bar but as increasing visual
  corruption on the HUD itself. After each mini-game completion, terminal
  text begins to flicker, characters drop out, and scanlines thicken. The HUD
  degrading *is* the meter.

=== 7.3 Mini-Game HUDs

==== MG 1 — Isometric Adventure
- No HUD overlay. Inventory is shown as physical objects carried by the
  player sprite.
- Ingredient count is communicated by the wizard's dialogue only.

==== MG 2 — Text Adventure
- Pure text interface. No HUD elements outside the terminal output itself.
- Hidden states are never surfaced to the player visually.

==== MG 3 — Top-Down Racing
- Minimal overlay in the style of an arcade cabinet bezel:
  #terminal[SPD: 088   TIME: 01:24]
  Speed and remaining time only. Both flash red when time drops below 15
  seconds.

==== Terminal Login Puzzle
- The six binary digits are the only UI. No instructions displayed — the
  password clue on the photograph is the only affordance.

=== 7.4 Main Menu HUD
#figure(
  image("images/MainMenuHUD.PNG", width: 300pt),
  caption: "Main Menu HUD",
  numbering: none,
)

#pagebreak()

== 8. AUDIO DESIGN

=== 8.1 Design Philosophy
Audio serves as the primary indicator of system state. The world is
unreliable visually — audio should feel slightly more grounded, then
betray the player at key moments. All sound design targets the feeling
of a machine that is barely holding together.

=== 8.2 Ambient Layers

==== Laboratory
- Low electrical hum
- Ceiling fan
- Distant street noise through window (muffled)
- CRT monitor static hiss, audible only when close

==== Corridors
- Pitch shifts slightly each corridor
- Faint data transmission noise (arrhythmic clicks and bursts)
- Silence used deliberately in dead-end paths

==== Exit Room
- Tone shifts to a lower, more resonant hum
- Subtle heartbeat-like pulse tied to how many slots are filled

=== 8.3 Interaction Sounds

==== Scientist Phase
- Object pickup: soft mechanical click
- Inspection mode entry/exit: camera shutter
- Monitor interaction: CRT power-on whine
- Directional code input: each keypress is a distinct retro beep,
  sequence plays a short jingle on success, harsh buzz on failure
- Phone ring: authentic 1980s bell ring, attenuated through room reverb

==== Virus Cube Phase
- Item pickup: ascending three-note chime (8-bit register)
- Document/photo discovery: paper rustle layered under a data-read beep
- Antivirus proximity: high-frequency interference that grows louder
  and more distorted as threat closes in
- Death: hard digital cut to silence, then CRT static burst before reset

=== 8.4 Mini-Game Audio

==== Mini-Game 1 — Isometric Adventure
- Medieval-adjacent synth score
- Object placement: wooden thock sound with slight reverb
- Wizard speech: no voice acting — text appears with a low "bwom" per word

==== Mini-Game 2 — Text Adventure
- Near silence. Only ambient: faint tavern murmur, indistinct
- Bard's flute: deliberately atonal and bad, loops in background
  until Scene D or E resolves it
- Each typed option selection: mechanical typewriter clack
- Game crash completion: audio cuts entirely before returning to corridor

==== Mini-Game 3 — Top-Down Racing
- Upbeat retro synth track, faster BPM than other sections
- Engine sound: synthesized, pitch-shifts with speed value
- Collision: short noise burst, engine sound cuts and restarts
- Time warning (under 15s): metronome tick added over music

==== Terminal Login Puzzle
- Each binary toggle: low beep (0) / high beep (1)
- Correct input sequence: the six tones play back as a melody

=== 8.5 Music System

==== Tracks
- *LAB_THEME* — slow, unresolved ambient synth. Plays during scientist phase.
- *CORRIDOR_THEME* — generative drone with arrhythmic percussion layer.
- *EXITROOM_THEME* — variant of CORRIDOR_THEME, lower register, more tense.
- *MINIGAME_1_THEME* — medieval synth loop, 90 BPM.
- *MINIGAME_2_THEME* — near-silent. Tavern murmur only.
- *MINIGAME_3_THEME* — arcade racing loop, 140 BPM.

==== Transitions
All music transitions use a 1.5 second crossfade except:
- Corridor → Death: hard cut
- Mini-game completion → Corridor: audio glitch effect bridges the transition

==== Spatial Audio
- Laboratory: full 3D spatial audio on all objects
- Corridors: 2D audio for HUD sounds, 3D for antivirus and collectibles
- Mini-games: all 2D — treat as separate audio context

#pagebreak()

== 9. ART DIRECTION

=== 9.1 Design Philosophy
The visual language of this game must feel like it was made *inside* the
machine — not a game about computers, but a game that believes it *is* one.
Every aesthetic choice should reinforce the duality between the cold digital
world and the organic horror underneath it. Degradation is not a bug; it is
the art direction.

The goal is discomfort through familiarity. Players should recognize the
retro aesthetic and then slowly realize something is wrong with it.

=== 9.2 Visual Style

==== Core Palette
- Primary: Black backgrounds, phosphor green  cold white
- Accent: Deep magenta and electric blue for corruption/threat states
- Organic elements: Desaturated yellows, sickly greens, wet reds
- No gradients in digital spaces — only flat fills and hard edges

==== CRT Treatment
- Scanline overlay on all digital environments (subtle, ~15% opacity)
- Slight barrel distortion at screen edges
- Chromatic aberration on glitch events — RGB channels split briefly
- Phosphor bloom on bright elements (text, HUD, neon wireframes)
- Screen curvature visible during scientist phase (monitor bezel present)
#figure(
  image("images/CRTMonitor.png", width: 220pt),
  caption: "CRT monitor reference — screen curvature and bezel framing",
  numbering: none,
)

==== Corridor Aesthetic
- Neon wireframe geometry — no textures, only lit edges
- Geometry is strict and grid-aligned until corruption increases
- Walls begin to breathe and shift as glitch meter rises
- Dead ends are darker, geometry incomplete, lines unrendered

==== Interface Aesthetic
- All UI elements styled as terminal output — monospaced, bracketed
- No rounded corners anywhere in the digital world
- Errors and warnings rendered in red with blinking indicators
- The desktop (mini-game window layer) uses a fictional OS skin
  inspired by early Macintosh and DOS hybrid interfaces

=== 9.3 Reference Works

==== Narita Boy (Studio Koba, 2021)
The primary pixel-art reference for digital world aesthetics. Key
takeaways for this project:

- *Color-as-structure*: Narita Boy uses three dominant hues to map
  its entire world. Similarly, this game should assign distinct color
  temperatures to each phase — cool green for corridors, warmer amber
  for the laboratory, shifting to biological reds in the creature's domain.
- *CRT as frame*: Narita Boy renders its world as if viewed through an
  old tube screen, with curved edges suggesting the player is watching
  through hardware. The scientist's monitor should feel exactly this way —
  the player literally is looking through a CRT.
- *Visual effects*: Narita Boy avoids the flatness of strict
  retro pixel art by using post-processing effects (bloom, distortion)
  to give its world depth. This game should do the same — keep geometry
  simple but let lighting and effects carry the weight.
- *Meta-digital storytelling*: The world of Narita Boy exists inside a
  computer, and its art reflects that at every level.

==== Hypnospace Outlaw (Tendershoot, 2019)
Reference for the desktop layer, mini-game window framing, and the
aesthetic of a fictional operating system. Key takeaways:

- *The OS as character*: Hypnospace Outlaw builds an entire fictional
  OS with its own logic, visual identity, and decay. The desktop layer
  in this game — the windows that contain mini-games — should feel like
  a real OS skin from 1987, with its own fonts, icons, and behavior.
- *Imperfection as authenticity*: Hypnospace's pages feel real because
  they are inconsistent — some are polished, some are broken, some are
  clearly still under construction. Mini-game windows should have this
  quality: misaligned elements, placeholder text left in, flickering
  title bars.
- *UI instability as narrative*: As Hypnospace progresses, the system
  itself begins to break. This game does the same — the UI degradation
  after each mini-game is not a visual effect, it is storytelling.
  Each crashed window, each dropped frame, is the system losing ground
  to the virus.
