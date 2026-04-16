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
  image("images/Desktop.png", height: 140pt),
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

=== 6.1 Laboratory

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Laboratory],
  [Location / Time of Day], [Computer Lab / Night],
  [Story Beat], [Scientist begins late-night experiment; player explores the lab and discovers the binary login puzzle],
  [Gameplay], [Exploration / Puzzle],
  [Progression], [Player learns object inspection, monitor interaction, and the Terminal Login Puzzle],
  [Objective], [Find the password clue hidden behind the photo frame and log into the computer],
  [Mechanics], [Mouse look, rotatable object inspection, monitor zoom, Terminal Login Puzzle (binary input)],
  [Items Used], [Photo Frame (password clue — binary value 38)],
  [Estimated Play Time], [5–10 min],
  [Color Mapping], [Warm amber (lab environment), phosphor green (monitor screen)],
  [Assets / Audio], [LAB_THEME, electrical hum, ceiling fan, CRT static hiss, object click, camera shutter, phone bell],
)

=== 6.2 Corridor Layer Point A

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Corridor Layer — Point A],
  [Location / Time of Day], [Digital Corridor / Timeless],
  [Story Beat], [Virus Cube awakens and begins navigating the internal system],
  [Gameplay], [Navigation],
  [Progression], [Player learns arrow key movement and corridor exploration],
  [Objective], [Navigate to the gate and reach the Exit Room],
  [Mechanics], [Arrow key movement, door spawning after fixed number of turns],
  [Items Used], [N/A],
  [Estimated Play Time], [3–5 min],
  [Color Mapping], [Black (background), phosphor green (neon wireframe geometry)],
  [Assets / Audio], [CORRIDOR_THEME, arrhythmic data transmission clicks, movement sounds],
)

#pagebreak()

=== 6.3 Exit Room

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Exit Room],
  [Location / Time of Day], [Digital Hub / Timeless],
  [Story Beat], [Virus reaches the system hub; must collect items from mini-games to unlock the exit],
  [Gameplay], [Hub / Progression Gate],
  [Progression], [Player understands the three-slot item collection objective; encounters Shadow Avatar],
  [Objective], [Fill all three item slots to activate the exit gate],
  [Mechanics], [Item slot activation, exit gate unlock, Shadow Avatar interaction],
  [Items Used], [Three items acquired from mini-games],
  [Estimated Play Time], [2 min (recurring)],
  [Color Mapping], [Black, phosphor green; slots pulse green on item insert],
  [Assets / Audio], [EXITROOM_THEME, low resonant hum, heartbeat-like pulse tied to slot count],
)

=== 6.4 Mini-Game 1 (Isometric Adventure)

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Mini-Game 1 — Isometric Adventure],
  [Location / Time of Day], [Digital Window / Timeless],
  [Story Beat], [Virus accesses an isometric game layer; must solve environmental puzzles to acquire an item],
  [Gameplay], [Isometric Puzzle / Adventure],
  [Progression], [Player solves height-based object placement puzzles across three rooms connected to a central hub],
  [Objective], [Collect all three potion ingredients and deliver them to the wizard],
  [Mechanics], [Isometric grid movement, object stacking, height puzzles, item pickup, cauldron mixing],
  [Items Used], [Potion (reward on completion)],
  [Estimated Play Time], [10–15 min],
  [Color Mapping], [Limited retro palette, harsh contrast, flat-shaded tiles],
  [Assets / Audio], [MINIGAME_1_THEME (medieval synth, 90 BPM), wooden thock on object placement, wizard "bwom" per word],
)

#pagebreak()

=== 6.5 Corridor Layer Point B (Document)

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Corridor Layer — Point B],
  [Location / Time of Day], [Digital Corridor / Timeless],
  [Story Beat], [Virus discovers a corrupted document hinting at a secret organization and the Artificial Creature],
  [Gameplay], [Navigation / Lore Discovery],
  [Progression], [Player encounters laser hazards for the first time; glitch meter begins to rise],
  [Objective], [Navigate past lasers and retrieve the Agent A47 document],
  [Mechanics], [Arrow key movement, laser avoidance, document interaction (spacebar)],
  [Items Used], [Document — Agent A47 message],
  [Estimated Play Time], [5–8 min],
  [Color Mapping], [Black, phosphor green; red/electric blue for laser threat],
  [Assets / Audio], [CORRIDOR_THEME, laser hum, paper rustle + data-read beep on document pickup],
)

=== 6.6 Mini-Game 2 (Text Adventure)

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Mini-Game 2 — Text Adventure],
  [Location / Time of Day], [Digital Window / Timeless],
  [Story Beat], [Virus navigates a ZORK-style text world; the system begins to destabilize visibly after completion],
  [Gameplay], [Text Adventure / Puzzle],
  [Progression], [Player unlocks hidden state flags to open new dialogue paths; UI degrades on completion],
  [Objective], [Retrieve the Golden Ladle and trigger the game crash to escape the window],
  [Mechanics], [Numbered input selection, hidden state flags (_HasSpokenToFigure_, _HasLookedAround_, _HasArguedBard_), greyed-out exhausted options],
  [Items Used], [Golden Ladle (reward on completion)],
  [Estimated Play Time], [8–12 min],
  [Color Mapping], [Monochrome — black background, white text; no color variation],
  [Assets / Audio], [MINIGAME_2_THEME (tavern murmur), atonal bard flute loop, typewriter clack on input, full audio cut on crash],
)
#pagebreak()
=== 6.7 Corridor Layer Point C (Photo)

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Corridor Layer — Point C],
  [Location / Time of Day], [Digital Corridor / Timeless],
  [Story Beat], [Antivirus programs actively patrol this layer; virus uncovers a photograph tied to the scientist],
  [Gameplay], [Navigation / Stealth],
  [Progression], [Player faces combined laser and antivirus threat; Threat Indicator HUD activates],
  [Objective], [Avoid antiviruses and lasers, retrieve the photograph, reach the exit gate],
  [Mechanics], [Arrow key movement, laser avoidance, antivirus avoidance, Threat Indicator (within 3 tiles), death/reset on contact],
  [Items Used], [Photo],
  [Estimated Play Time], [8–10 min],
  [Color Mapping], [Black, phosphor green; deep magenta and electric blue for threat states],
  [Assets / Audio], [CORRIDOR_THEME, antivirus proximity interference (louder/more distorted as threat closes), hard cut to silence on death],
)

=== 6.8 Mini-Game 3 (Racing)

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Mini-Game 3 — Top-Down Racing],
  [Location / Time of Day], [Digital Window / Timeless],
  [Story Beat], [Final mini-game; system is heavily degraded and UI instability peaks during play],
  [Gameplay], [Arcade Racing],
  [Progression], [Player must complete the track under time pressure with increasing visual corruption],
  [Objective], [Reach the end of the track within the time limit],
  [Mechanics], [Top-down forward-scrolling, obstacle avoidance (traffic / barriers / oil slicks), collision reset to start, time limit],
  [Items Used], [Traffic Cone (reward on completion)],
  [Estimated Play Time], [5–8 min],
  [Color Mapping], [Limited arcade palette; HUD speed and time flash red when time drops below 15 seconds],
  [Assets / Audio], [MINIGAME_3_THEME (arcade loop, 140 BPM), engine pitch-shift with speed, collision noise burst, metronome tick added under 15 s],
)

#pagebreak()

=== 6.9 Corridor Layer Point D (Voice Message)

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Corridor Layer — Point D],
  [Location / Time of Day], [Digital Corridor / Timeless],
  [Story Beat], [Final corridor; voice message reveals the last piece of the secret organization's plan before the escape sequence],
  [Gameplay], [Navigation / Lore Discovery],
  [Progression], [All three items now held; player returns to Exit Room to trigger the final escape],
  [Objective], [Retrieve the voice message and return to the Exit Room with all collected items],
  [Mechanics], [Arrow key movement, voice message playback (spacebar), exit gate activation with full item slots],
  [Items Used], [Voice Message; all three prior items in inventory],
  [Estimated Play Time], [5 min],
  [Color Mapping], [Black, phosphor green; heavy scanline overlay and geometry corruption as glitch meter peaks],
  [Assets / Audio], [CORRIDOR_THEME (glitching), voice message audio playback, exit activation jingle on final slot fill],
)

=== 6.10 Level Reference Images

#grid(
  columns: 3,
  column-gutter: 12pt,
  figure(
    image("images/MazeDoor.jpg", width: 150pt),
    caption: [6.2 — Corridor Layer Point A: gate at the end of the first corridor],
    numbering: none,
  ),

  figure(
    image("images/ExitRoom.jpg", width: 150pt),
    caption: [6.3 — Exit Room: three item slots and the exit gate],
    numbering: none,
  ),

  figure(
    image("images/MazeDocument.jpg", width: 150pt),
    caption: [6.5 — Corridor Layer Point B: document pickup location],
    numbering: none,
  )
)

#grid(
  columns: 2,
  column-gutter: 12pt,
  figure(
    image("images/MazeLazer.jpg", height: 100pt),
    caption: [6.7 — Corridor Layer Point C: laser corridor],
    numbering: none,
  ),
  figure(
    image("images/MazeLazerWithCube.jpg", height: 100pt),
    caption: [6.7 — Corridor Layer Point C: virus cube navigating lasers],
    numbering: none,
  ),
)

#pagebreak()

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

#pagebreak()

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
