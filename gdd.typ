#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.4"

// ============================ Palette ============================
#let green  = rgb("00ff41")   // phosphor green — in-world / digital art
#let amber  = rgb("ffb000")
#let danger = rgb("ff3355")
#let accent = rgb("0b6e2e")   // readable dark green for headings & rules on white

// =========================== Callouts ============================
#let terminal(body) = block(
  fill: black, stroke: 1pt + green, inset: 12pt, radius: 0pt, width: 100%,
)[
  #set text(fill: green, font: "JetBrainsMono NF", size: 9pt)
  \> #body
]

#let dgm(body) = block(
  fill: black, stroke: 1pt + green, inset: 14pt, width: 100%, breakable: false,
)[
  #set text(fill: green)
  #align(center, body)
]

// Light "design note" callout for key design rationale
#let note(body) = block(
  fill: rgb("eef5f0"), stroke: (left: 3pt + accent), inset: 10pt, width: 100%,
)[
  #set text(size: 9.5pt)
  #text(fill: accent, weight: "bold")[DESIGN NOTE — ]#body
]

// Inline spec lead-in — replaces heading-as-field-label noise
#let field(term, body) = block(spacing: 0.6em)[#text(fill: accent, weight: "bold")[#term —] #body]

// Small image-source credit, placed on its own line inside a figure caption
#let src(s) = text(size: 7.5pt, fill: rgb("999999"), style: "italic")[Source: #s]

// ========================== Base styles ==========================
#set page(paper: "a4", margin: (x: 2.1cm, top: 2.2cm, bottom: 2.0cm))
#set text(size: 10.5pt, lang: "en", hyphenate: true)
#set par(justify: true, leading: 0.62em, spacing: 0.95em)

#show heading.where(level: 2): it => {
  pagebreak(weak: true)
  block(width: 100%, above: 1.5em, below: 0.85em)[
    #set text(size: 15pt, fill: accent, weight: "bold")
    #it.body
    #v(-0.35em)
    #line(length: 100%, stroke: 0.8pt + accent)
  ]
}
#show heading.where(level: 3): it => block(above: 1.15em, below: 0.5em, text(size: 12pt, fill: accent, weight: "bold", it.body))
#show heading.where(level: 4): it => block(above: 0.85em, below: 0.35em, text(size: 10.5pt, fill: rgb("222222"), weight: "bold", it.body))

#show figure.caption: set text(size: 9pt, fill: rgb("555555"), style: "italic")

#set table(stroke: 0.5pt + rgb("cfcfcf"), inset: 7pt)
#show table.cell.where(y: 0): set text(weight: "bold")
#show table: it => block(breakable: false, it)

// ============================= Title =============================
#page(fill: black, margin: 0pt, numbering: none)[
  #set text(fill: green, font: "JetBrainsMono NF")
  #align(center + horizon)[
    #text(size: 46pt, weight: "bold")[SIGNAL ROT]
    #v(0.4em)
    #line(length: 38%, stroke: 1pt + green)
    #v(0.5em)
    #text(size: 13pt, tracking: 3pt)[GAME DESIGN DOCUMENT]
    #v(3.5em)
    #text(size: 10pt, fill: green.darken(8%))[
      A narrative meta-puzzle anthology \
      PC · 60–75 minutes
    ]
  ]
]

#set page(numbering: "1")
#show outline.entry.where(level: 1): it => { v(0.22em, weak: true); strong(it) }
#block[
  #set text(size: 9pt)
  #set par(leading: 0.5em)
  #outline(title: [Contents], depth: 3, indent: 1em)
]


== 1. GAME OVERVIEW

=== 1.1 Title (Working)
SIGNAL ROT

=== 1.2 Elevator Pitch
A scientist's late night experiment goes wrong, and *you* are the accident. Born as a self aware virus inside a 1980s lab computer, you crawl through wireframe corridors and broken software, stealing what you need from games while on the other side of the screen, the man who made you fights to delete you. Played from both sides of the glass, the system degrading around you is not a malfunction. It is your progress.

=== 1.3 Genre
Narrative meta-puzzle anthology, exploration, environmental puzzles, three genre shifting mini-games.

=== 1.4 Unique Selling Point
You are the infection, and both sides of the screen are playable. The player alternates between the virus inside the machine and the scientist outside it and is forced to act against themselves.

=== 1.5 Player Experience
The intended emotional arc is curiosity → unease → complicity. The player begins intrigued by a strange 1980s machine and the secrets buried in it, grows uneasy as the system visibly degrades and the lore turns dark, and ends complicit, realising that escaping is exactly what the secret organization wanted. Moment to moment, the game targets the feeling of operating a machine that is barely holding together: retro-familiar on the surface, wrong underneath. It rewards curiosity and observation over reflexes or mechanical mastery.

=== 1.6 Platform
PC (Windows). Keyboard + mouse or gamepad.

=== 1.7 Target Audience
Ages 16+. Players of *Inscryption*, *Pony Island*, *Stories Untold* and *Hypnospace Outlaw* comfortable with retro presentation and motivated by mystery and meta narrative rather than mechanical mastery.

=== 1.8 Runtime
60–75 minutes, single sitting, single save slot.

=== 1.9 Monetization
Single purchase, *\$7.99 USD*, with a ~10% launch-window discount. No microtransactions, advertising, or live-service systems. The price sits above short meta-games like *Pony Island* (\$4.99) and below longer retro-narrative titles like *Stories Untold* and *Inscryption* (\$9.99–\$19.99), reflecting its ~1-hour runtime.

== 2. SETTING & NARRATIVE

=== 2.1 Setting
- *Primary location:* Computer lab
- *Secondary location:* Internal computer layers
- *Time period:* 1980s

#grid(
  columns: (1fr, 1fr),
  column-gutter: 14pt,
  figure(image("images/ComputerTable.png", width: 100%), caption: [Primary location: the scientist's computer lab], numbering: none),
  figure(image("images/Corridors.png", width: 100%), caption: [Secondary location: the internal computer layers], numbering: none),
)
=== 2.2 Story
Dr. Hemmington is secretly building an artificial biological body to bring back his dead wife, an experimental vessel waiting for a mind to inhabit it. The body is inert; it needs a consciousness to live.

While experimenting late at night on an old computer system, he accidentally creates a self-aware digital virus. The virus navigates the internal system layers, uncovering fragmented documents that reveal a secret organization has discovered Hemmington's work. They intend to capture the vessel for their own ends: disposable bio-soldiers, mind transfer hosts for life extension, bioweapons.

The virus is the missing piece; only when it migrates into the body, the vessel come alive. The virus escapes the only way it can by integrating itself into the artificial creature. In doing so it becomes exactly the weapon the organization wanted. The player's bid for freedom is the organization's victory. The body convulses into a monster, turns on its creator, and as Hemmington collapses, the organization's capture team breaks down the door.

=== 2.3 Characters

==== Main Characters
- *Dr. D. Hemmington*: A grieving scientist obsessed with resurrecting his deceased wife. Brilliant, isolated, increasingly desperate; he keeps personal games on his work machine as late-night escapism. Player-controlled during the prologue and forced back into control during each Security Escalation.
- *Virus Cube*: The player controlled entity. A self aware digital virus, born by accident, that wants only to escape and is the key to the organization's plans.

==== Enemies
- *Antivirus Programs*: The system's defenses; deterministic patrols that delete the virus on contact.
- *The Secret Organization*: An indirect, ever present threat seeking to steal Hemmington's work. Never seen directly until the final moments.
- *The Artificial Creature*: The caged biological vessel. The organization's intended weapon but ultimately the virus's escape route. The virus does not fight the creature; it *becomes* it.


#align(center)[
#block(breakable: false)[
#grid(
  columns: 2,
  column-gutter: 8pt,
  row-gutter: 10pt,

  figure(image("images/scientist.png", width: 70mm, height: 70mm, fit: "contain"), caption: "Scientist", numbering: none),
  figure(image("images/MazeDoorWithCube.jpg", width: 70mm, height: 70mm), caption: "Virus Cube", numbering: none),
  figure(image("images/placeholder.png", width: 70mm, height: 70mm), caption: "Mini-Game Avatar Silhouette", numbering: none),
  figure(image("images/placeholder.png", width: 70mm, height: 70mm), caption: "Antivirus Programs", numbering: none),
  figure(image("images/placeholder.png", width: 70mm, height: 70mm), caption: "Artificial Creature in Cage", numbering: none),
  figure(image("images/placeholder.png", width: 70mm, height: 70mm), caption: "Secret Organization Symbol", numbering: none),
)
]
]
#v(6pt)
#align(center, text(size: 9pt, fill: rgb("555555"), style: "italic")[Character & enemy concept sheet.])


== 3. GAME LOGIC

=== 3.1 Core Loop

#figure(
  dgm[
  #diagram(
    spacing: (9mm, 11mm),
    node-stroke: 0.7pt + green,
    node-fill: black,
    node-inset: 6pt,
    edge-stroke: 0.7pt + green,
    label-sep: 2pt,
    node((0,0), text(7pt)[1. Corridor\ navigation], name: <c>),
    node((2,0), text(7pt)[2. Lore\ collectible]),
    node((4,0), text(7pt)[3. Avatar\ silhouette]),
    node((6,0), text(7pt)[4. Mini-game\ window]),
    node((6,1.4), text(7pt)[5. Reward\ item]),
    node((3,1.4), text(7pt)[6. Security Escalation\ (play as scientist)], name: <e>),
    edge(<c>, (2,0), "-|>"),
    edge((2,0), (4,0), "-|>"),
    edge((4,0), (6,0), "-|>"),
    edge((6,0), (6,1.4), "-|>"),
    edge((6,1.4), <e>, "-|>"),
    edge(<e>, <c>, text(6pt, fill: amber)[repeat ×3], "-|>", bend: -28deg, stroke: 0.7pt + amber),
    node((1.5,2.7), text(7pt, fill: danger)[FINALE:\ The Escape (Ch. 6.10)], stroke: 0.7pt + danger),
    edge(<e>, (1.5,2.7), text(6pt, fill: danger)[all 3 items], "-|>", stroke: 0.7pt + danger),
  )
  ],
  caption: [Core gameplay loop. The corridor → mini-game cycle runs three times (A→MG1→B→MG2→C→MG3→D); each completion forces a Security Escalation in which the player, as the scientist, sabotages their own progress. With all three items, the loop exits to the finale.],
  numbering: none,
)

=== 3.2 Perspective Switching
The player always controls exactly one entity at a time. Control transfers are scripted, never freely chosen.
- *Scientist*: seated first-person at the desk (prologue and Security Escalations)
- *Virus Cube*: the digital entity navigating system corridors 
- *Mini-game avatar*: a genre specific body (knight, adventurer, driver) entered through corridor silhouettes

=== 3.3 Game Flow & Perspective Ownership
+ *Prologue - _Scientist_ (5–10 min).* The player explores the lab in first person, finds the password clue, and solves the Terminal Login Puzzle. Logging in *creates* the virus: control transfers to the cube and does not voluntarily return.
+ *Main loop - _Virus_.* Corridor → lore collectible → avatar silhouette → mini-game window → reward item → next corridor. The order is fixed (A → MG1 → B → MG2 → C → MG3 → D).
+ *Security Escalation - _Scientist_.* After each mini-game, control snaps back to the scientist, who reacts to the disruption. The player is forced to enter a containment code, *sabotaging their own virus progress*, which deploys the next corridor hazard tier (lasers, then antivirus patrols, then corruption).
+ *Finale.* With all three items collected, the exit routes the virus toward the creature's neural interface. One last containment code appears but the keys remap themselves mid input, and it cannot be completed. The virus crosses into the body and escapes. See Ch. 6.10.

#figure(
  dgm[
  #diagram(
    spacing: (16mm, 13mm),
    node-stroke: 0.8pt + green,
    node-fill: black,
    node-inset: 7pt,
    edge-stroke: 0.7pt + green,
    label-sep: 3pt,
    node((0,0), text(7pt)[*SCIENTIST*\ Prologue + Login], name: <s>),
    node((2.4,0), text(7pt)[*VIRUS*\ Corridor ↔ Mini-games], name: <v>),
    node((2.4,1.5), text(7pt)[*SCIENTIST*\ Security Escalation\ (forced code)], name: <esc>),
    node((4.8,0), text(7pt, fill: danger)[*FINALE*\ forced fail →\ virus escapes], stroke: 0.8pt + danger, name: <f>),
    edge(<s>, <v>, text(6pt)[login creates virus], "-|>"),
    edge(<v>, <esc>, text(6pt)[after each\ mini-game], "-|>"),
    edge(<esc>, <v>, text(6pt, fill: amber)[code done →\ next hazard tier (×3)], "-|>", bend: -40deg, stroke: 0.7pt + amber),
    edge(<v>, <f>, text(6pt)[all 3 items], "-|>"),
  )
  ],
  caption: [Perspective-ownership state diagram. Control is always exactly one entity and every transfer is scripted: the scientist creates the virus at login, is forced back during each escalation, and the loop ends in a finale the scientist cannot win.],
  numbering: none,
)

=== 3.4 Controls Reference

All control schemes are centralized here. The schematics show the universal input language for each device; the per-context list shows which inputs are active in each phase. Either device can be used throughout.

#figure(image("images/controls_keyboard.svg", width: 90%), caption: [Full input bindings (keyboard + gamepad). \ #src("padcrafter.com")], numbering: none)
#figure(image("images/controls_gamepad.svg", width: 90%), caption: [Gamepad control scheme. \ #src("padcrafter.com")], numbering: none)

#field("Scientist Phase", [
  *Keyboard / mouse* — mouse look · left-click inspect (rotatable) · monitor to zoom in · Esc to zoom out / menu. \
  *Gamepad* — RS look / rotate · A inspect / use · B zoom out · Menu pause.
])
#field("Terminal Login", [
  *Keyboard* — toggle the six switches (labelled 32 16 8 4 2 1) · confirm to log in. \
  *Gamepad* — D-Pad ◀ ▶ select switch · A flip · X confirm.
])
#field("Security Escalation", [
  *Keyboard* — type the directional / button containment code. \
  *Gamepad* — D-Pad directions · A / B / X / Y code buttons.
])
#field("Corridor & Isometric (MG1)", [
  *Keyboard* — arrow keys move (grid) · Space interact / pick up / place. \
  *Gamepad* — D-Pad or LS move · A interact / pick up / place. \
  (Touching an avatar silhouette enters its mini-game automatically.)
])
#field("Text Adventure (MG2)", [
  *Keyboard* — number keys choose the listed option. \
  *Gamepad* — D-Pad ▲ ▼ highlight · A select.
])
#field("Racing (MG3)", [
  *Keyboard* — ← / → steer · ↑ accelerate · ↓ brake. \
  *Gamepad* — LS steer · RT accelerate · LT brake.
])
#field("Global", [*Keyboard* — Esc pause. #h(0.6em) *Gamepad* — Menu pause.])


== 4. GAMEPLAY SYSTEMS

All input mappings for every phase are centralized in Ch. 3.4 Controls Reference.

=== 4.1 Scientist Phase

The player controls Dr. Hemmington from a seated, first-person perspective inside the laboratory. The phase carries the game's environmental storytelling and puzzle discovery and where the player is later forced to act against their own virus.


==== Terminal Login Puzzle
The lab computer is locked behind a six-digit binary password.
- Six togglable switches are displayed as 0s and 1s
- Each switch is physically labelled with its place value: *32 16 8 4 2 1*
- The password clue is hidden behind a photograph of the scientist's deceased wife
- Password value: 38 → correct input 100110 (32 + 4 + 2)

#note[The place-value labels let the player solve the puzzle as simple addition, no binary literacy required. This protects the game's very first puzzle from becoming a wall.]

On success the binary digits collapse into a cube; the cube becomes the controllable entity. The virus is born, and control transfers to it.

==== Desk Phone (Easter Egg)
Interacting with the desk phone plays a random sound each time, mostly troll and out of place (nyan cat etc.) clips. Rarely, the player hears a hidden voice message. Purely optional flavor; it carries no required progression and is distinct from the corridor voice-message collectible.

==== Security Escalation System
#field("Trigger", [Fires once after each mini-game completion, three times total.])
#field("Flow", [Control snaps back to the scientist, who delivers a line and turns to the keyboard. The player must input a directional / button containment code (example: ← ↑ A ↓ → B ← ↓).])
#field("Forced", [There is no way to refuse. Completing the code deploys the next corridor hazard tier against the virus 1st → lasers, 2nd → antivirus patrols, 3rd → corruption.])
#field("Error handling", [Modeled on the cube sequence puzzles in *Dispatch*: an incorrect input briefly flashes and shakes the screen, but the sequence does *not* restart, the player resumes from the point of error.])


=== 4.2 Virus Cube Phase

The player controls a digital virus navigating abstract corridors inside the computer system.

#field("Navigation", [Corridors are an authored branching map of turning points (forks), with environmental interactions along the way: documents, photos, audio logs.])
#field("Door spawning", [Doors are pre-placed at the map's fork outcomes, all deactivated. After a set number of turns (direction changes taken at turning points), the nearest reachable door activates. Because the map is authored, every possible door position and the path that leads to it is predetermined.])

==== Mini-Game Entry (Avatar Silhouettes)
Each corridor contains a single avatar shaped silhouette matching the mini-game it leads to (e.g., a knight silhouette for the isometric adventure). Touching the silhouette drops the player onto the desktop, inside that mini-game window, now playing as that avatar. The silhouette's shape telegraphs which genre is coming next.

==== Failure State & Checkpoints
- Contact with an antivirus or laser triggers a death screen, a hard cut to silence, then a CRT static burst
- Death returns the player to the last checkpoint, set on entering a corridor room and on picking up a collectible
- Collected lore items are retained
- Antivirus programs follow deterministic patrol routes so every death is fair and learnable

==== Exit Room
#field("Description", [A room encountered between corridor sections that acts as a hub and progression gate.])
#field("Components", [An exit device and three item slots.])
#field("Function", [Requires items or data from the mini-games to activate the exit.])

== 5. MINI-GAMES

The mini-games are programs Dr. Hemmington kept on his work machine, off-hours games and half-forgotten hobby projects. Each exists as a window inside the desktop environment and uses a distinct gameplay genre.
#field("Common rules", [Completion grants a key item or critical information; UI instability increases after each completion; system glitches force a return to the corridor phase.])

#note[*Nothing ends cleanly.* Every mini-game breaks down in a genre-appropriate way; a crash, a corruption, a failure mid-success. The breakdown is the system losing ground to the virus.]

#figure(
  image("images/Desktop.png", height: 140pt),
  caption: "Desktop environment, mini-game windows are launched from here",
  numbering: none,
)

#figure(
  table(
    columns: (auto, auto, auto, 1fr),
    table.header([Mini-Game], [Genre], [Reward], [Breakdown on completion]),
    [1. Isometric Adventure], [Isometric puzzle], [Potion], [Wizard sprite corrupts mid-handover],
    [2. Text Adventure], [ZORK-style text], [Golden Ladle], [Game crashes],
    [3. Top-Down Racing], [1980s arcade racer], [Traffic Cone], [Track turns into static before the finish],
  ),
  caption: [The three mini-games at a glance: distinct genre, reward item, and authored failure.],
  numbering: none,
)

#pagebreak()

=== 5.1 Mini-Game 1: Isometric Adventure
#field("Genre reference", [1984 era isometric action-adventure, inspired by the *Knight Lore*, *Alien 8*, and *Head Over Heels*.])
#field("Presentation", [Fixed isometric perspective; flat-shaded tiles on a strict grid; a limited, high-contrast palette; characters and objects as simple geometric sprites.])
#field("Player representation", [A humanoid figure rendered as an abstract, knight-like armored sprite.])
#field("Core mechanics", [Single screen isometric room navigation; environmental puzzle solving through object placement; item pickup and stacking to reach higher elevations. All objects have strict height, collision, and layering rules.])
#field("Objective", [Solve the room puzzles and mix all ingredients into a potion.])

==== Rooms
Three puzzle rooms branch off the central chamber, each isolating one height/traversal idea:

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    table.header([Room], [Contents], [Puzzle purpose]),
    [Storage Room], [Holds supplies and discarded objects: crates and heavy blocks, an elevated shelf, a potion ingredient stored out of reach], [Basic height puzzle using stacked objects],
    [Collapsed Passage], [A broken corridor section: a large gap where the floor fell away, debris usable as makeshift bridges, ingredient on the far side], [Gap crossing with planks and pillars],
    [Service Corridor], [A narrow maintenance hallway: sloped, uneven floor. Barrels along the wall, a raised service platform with the ingredient], [Ramp based elevation puzzle],
  ),
  caption: [Mini-Game 1 puzzle rooms, each branch teaches one mechanic.],
  numbering: none,
)

==== Central Chamber
#field("Description", [A square chamber acting as the hub of the dungeon, with three corridors leading to the puzzle rooms. A large cauldron of water sits in the middle; a hooded wizard stands beside it. On first interaction he says: "The ingredients are scattered nearby. Bring them here."])
#field("Progression", [Each connected room holds one ingredient. Returning an ingredient earns a key to the next room, and the mix changes color as ingredients are added.])
#field("Completion", [The wizard casts the final spell and turns to hand over the potion but mid-handover his sprite corrupts, glitching apart into scattered tiles as the window destabilizes and forces the player back to the corridor.])

#figure(
  image("images/IsometricAdventureHubRoom.png", width: 60%),
  caption: [Mini-Game 1 central chamber: cauldron and wizard, with corridors to the three puzzle rooms.],
  numbering: none,
)


=== 5.2 Mini-Game 2: Text-Based Adventure

#field("Genre reference", [Classic text adventure, ZORK-style interaction.])
#field("Presentation", [Monochrome text on a black background, a blinking cursor, numbered typed input to choose actions, an option greys out once it has shown all its content.])
#field("Hidden states", [_HasSpokenToFigure_, _HasLookedAround_, _HasArguedBard_ all false by default; they gate certain dialogue variations.])

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
The Innkeeper wipes the counter. "Uhh, are you gonna order? This is a tavern, not a coat rack for damp disappointments like you. And someone in here *stole my ladle*, my good ladle, the one I use for bonking the unholy and stirring the stew, in that order. Bring it back and you drink free. The culprit's still here; I can smell the guilt. Be quick." \
Return 0

==== Scene B
You scanned the environment quickly, the things you saw: \
A cat jumping ropes. \
A knight in full armor. \
A person who talks backwards. \
--
*_HasLookedAround_ sets true*
--\
Return 0


==== Scene C
You get close to the mysterious person. He notices you and says:
Answer me this riddle, if you can: What has keys but cannot open doors?
.. .. Oh I didn't thought for you to be this dumb.
Just tell me something weird you saw today.

==== if HasLookedAround is true
- KNIGHT IN ARMOR -> "Boring as dishwater."
- SOMEONE WHO TALKS BACKWARDS -> "That's just Gary."
Return C
- A CAT JUMPING ROPES -> "Now *that's* the clue you wanted. Follow it." \
HasSpokenToFigure sets true, Return 0

==== if HasLookedAround is false
- INNKEEPER? -> "Hey! He is my cousin."
- THE BARD? -> "Not unusual. I went half-deaf after that man's so-called music."
- IDK, YOU? -> "Get out of my sight."
Return 0

==== Scene D
You warned the bard. His response: SHUT YOUR ABSOLUTE TRAP, YOU SINGLE-BRAINCELL, INSIGNIFICANT FU-#text(fill: rgb("ff0033"))[\[SIGNAL CORRUPTED\]]
Return 0
HasArguedBard sets true

==== Scene E
The cat's legs got tangled to the rope. You wanted to help but unfortunately you frightened the cat. Suddenly that cute thing got triggered from bard's 'music' and begin to attack him.\
*_"AAAAAAAAAAAA"_* \

Bard said: Okay man just chill.. Seems like no one likes my music. I gave up. Just take this ladle and dont ask questions..\
You Got x1 Golden Ladle! \
Its a bit warm, you decided to not question it furthermore.

#field("Completion", [The game simply crashes, dumping the player back to the corridor.])

#figure(
  image("images/zork.jpg", width: 55%),
  caption: [Mini-Game 2: ZORK-style monochrome text interface.],
  numbering: none,
)

#figure(
  dgm[
  #diagram(
    spacing: (7mm, 10mm),
    node-stroke: 0.6pt + green,
    node-fill: black,
    node-inset: 5pt,
    edge-stroke: 0.6pt + green,
    label-sep: 2pt,
    node((1,0), text(7pt)[*Scene 0*\ Tavern hub], name: <h>),
    node((-1,1), text(6pt)[A: Ask for drink], name: <a>),
    node((0.2,1), text(6pt)[B: Look around\ \[HasLookedAround\]], name: <b>),
    node((1.6,1), text(6pt)[C: Talk to figure], name: <c2>),
    node((3,1), text(6pt)[D: Warn bard\ \[HasArguedBard\]], name: <d>),
    node((1.6,2.2), text(6pt)[Cat clue\ (needs LookedAround)\ → HasSpokenToFigure], name: <clue>),
    node((3,2.2), text(6pt, fill: amber)[E: Look at cat\ (unlocked by\ HasSpokenToFigure)], stroke: 0.6pt + amber, name: <e2>),
    node((3,3.4), text(6pt, fill: danger)[Golden Ladle →\ CRASH (completion)], stroke: 0.6pt + danger, name: <win>),
    edge(<h>, <a>, "-|>"),
    edge(<h>, <b>, "-|>"),
    edge(<h>, <c2>, "-|>"),
    edge(<h>, <d>, "-|>"),
    edge(<c2>, <clue>, "-|>"),
    edge(<clue>, <e2>, text(6pt, fill: amber)[unlocks], "-|>", stroke: 0.6pt + amber),
    edge(<e2>, <win>, "-|>", stroke: 0.6pt + danger),
  )
  #v(4pt)
  #text(6pt, fill: amber)[Critical path: B → C (cat) → E → Ladle. All other options return to the hub.]
  ],
  caption: [Mini-Game 2 dialogue-state map.],
  numbering: none,
)

#pagebreak()

=== 5.3 Mini-Game 3: Top-Down Racing

#field("Genre reference", [Early 1980s arcade-style racing games.])
#field("Presentation", [Fixed top-down camera; a limited palette; a HUD showing speed and remaining time.])
#field("Core mechanics", [Constant forward-scrolling track with obstacle avoidance: traffic, barriers, oil slicks.])
#field("Objective", [Reach the end of the track within the time limit.])
#field("Failure state", [Collision resets the vehicle to the starting point.])
#field("Reward", [Traffic cone.])
#field("Completion", [As the finish line comes into view the track corrupts, barriers flicker out and the road tears into static. The window collapses before the player can cross cleanly; the cone is awarded as the game falls apart around the car.])

#figure(
  image("images/cargame.png", width: 55%),
  caption: [Mini-Game 3: top-down arcade racing.],
  numbering: none,
)


== 6. LEVEL STRUCTURE

The level tables below follow the playthrough order. The pacing curve summarizes how
tension is shaped across the run: mini-game windows act as relief valleys, corridors
ramp the threat, and each Security Escalation pushes a new peak before the finale.

#figure(
  dgm[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    set-style(stroke: (paint: green, thickness: 0.6pt))
    line((0,0), (11,0), mark: (end: ">"))
    line((0,0), (0,4.2), mark: (end: ">"))
    content((10.6,-0.4), anchor: "west", text(6pt, fill: green)[levels])
    content((0,4.45), anchor: "south", text(6pt, fill: green)[tension])
    let pts = ((0.5,1.0),(1.5,1.6),(2.5,1.2),(3.5,2.4),(4.5,1.8),(5.5,3.0),(6.5,2.2),(7.5,3.6),(8.5,2.0),(9.5,4.0))
    line(..pts, stroke: (paint: danger, thickness: 1.2pt))
    for p in pts {
      circle(p, radius: 0.06, fill: danger, stroke: none)
    }
    let labs = ("Lab","CorrA","Exit","MG1","CorrB","MG2","CorrC","MG3","CorrD","Escape")
    for (i, l) in labs.enumerate() {
      content((pts.at(i).at(0), -0.4), text(5pt, fill: green)[#l])
    }
  })
  ],
  caption: [Pacing / tension curve across the full run. Sawtooth escalation.],
  numbering: none,
)

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
  [Items Used], [Photo Frame (password clue: binary value 38)],
  [Estimated Play Time], [5–10 min],
  [Color Mapping], [Warm amber (lab environment), phosphor green (monitor screen)],
  [Assets / Audio], [LAB_THEME, electrical hum, ceiling fan, CRT static hiss, object click, camera shutter, phone bell],
)

=== 6.2 Corridor Layer Point A

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Corridor Layer: Point A],
  [Location / Time of Day], [Digital Corridor / Timeless],
  [Story Beat], [Virus Cube awakens and begins navigating the internal system],
  [Gameplay], [Navigation],
  [Progression], [Player learns arrow key movement and corridor exploration],
  [Objective], [Navigate to the gate and reach the Exit Room],
  [Mechanics], [Arrow key movement; door spawning at authored turning-point forks],
  [Items Used], [N/A],
  [Estimated Play Time], [3–5 min],
  [Color Mapping], [Black (background), phosphor green (neon wireframe geometry)],
  [Assets / Audio], [CORRIDOR_THEME, arrhythmic data transmission clicks, movement sounds],
)

#figure(
  image("images/placeholder.png", width: 62%),
  caption: [*Corridor schematic (to draw).* Top-down map of a corridor: turning-point forks, possible door-spawn positions, the collectible, the avatar silhouette (mini-game entry), hazard zones, dead ends, and the link back to the Exit Room. Points A–D reuse this structure with escalating hazards — A: none; B: lasers; C: lasers + antivirus patrols; D: corruption.],
  numbering: none,
)

=== 6.3 Exit Room

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Exit Room],
  [Location / Time of Day], [Digital Hub / Timeless],
  [Story Beat], [Virus reaches the system hub; must collect items from mini-games to unlock the exit],
  [Gameplay], [Hub / Progression Gate],
  [Progression], [Player understands the three-slot item collection objective],
  [Objective], [Fill all three item slots to activate the exit gate],
  [Mechanics], [Item slot activation, exit gate unlock],
  [Items Used], [Three items acquired from mini-games],
  [Estimated Play Time], [2 min (recurring)],
  [Color Mapping], [Black, phosphor green; slots pulse green on item insert],
  [Assets / Audio], [EXITROOM_THEME, low resonant hum, heartbeat-like pulse tied to slot count],
)

#figure(
  image("images/placeholder.png", width: 62%),
  caption: [*Exit Room schematic (to draw).* Top-down of the hub: the three item slots, the exit device/gate, and how the corridors spoke off it — showing the hub-and-spoke loop the virus returns to between mini-games.],
  numbering: none,
)

=== 6.4 Mini-Game 1 (Isometric Adventure)

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Mini-Game 1: Isometric Adventure],
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

#figure(
  image("images/placeholder.png", width: 62%),
  caption: [*Mini-Game 1 dungeon floorplan (to draw).* Top-down layout: the central chamber (cauldron + wizard) and the three puzzle rooms branching off it — Storage Room, Collapsed Passage, Service Corridor — with the one ingredient marked in each and the locked-door progression between them.],
  numbering: none,
)

=== 6.5 Corridor Layer Point B (Document)

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Corridor Layer: Point B],
  [Location / Time of Day], [Digital Corridor / Timeless],
  [Story Beat], [Virus retrieves an internal report logged by Agent A47, revealing the secret organization has discovered Hemmington's work and intends to seize the vessel],
  [Gameplay], [Navigation / Lore Discovery],
  [Progression], [Player encounters laser hazards for the first time; glitch meter begins to rise],
  [Objective], [Navigate past lasers and retrieve the Agent A47 document],
  [Mechanics], [Arrow key movement, laser avoidance, document interaction (spacebar)],
  [Items Used], [Document: Agent A47 message],
  [Estimated Play Time], [5–8 min],
  [Color Mapping], [Black, phosphor green; red/electric blue for laser threat],
  [Assets / Audio], [CORRIDOR_THEME, laser hum, paper rustle + data-read beep on document pickup],
)

=== 6.6 Mini-Game 2 (Text Adventure)

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Mini-Game 2: Text Adventure],
  [Location / Time of Day], [Digital Window / Timeless],
  [Story Beat], [Virus navigates a ZORK-style text world; the system begins to destabilize visibly after completion],
  [Gameplay], [Text Adventure / Puzzle],
  [Progression], [Player unlocks hidden state flags to open new dialogue paths; UI degrades on completion],
  [Objective], [Retrieve the Golden Ladle and trigger the game crash to escape the window],
  [Mechanics], [Numbered input selection, hidden state flags (_HasSpokenToFigure_, _HasLookedAround_, _HasArguedBard_), greyed-out exhausted options],
  [Items Used], [Golden Ladle (reward on completion)],
  [Estimated Play Time], [8–12 min],
  [Color Mapping], [Black background, white text; no color variation],
  [Assets / Audio], [MINIGAME_2_THEME (tavern murmur), atonal bard flute loop, typewriter clack on input, full audio cut on crash],
)
=== 6.7 Corridor Layer Point C (Photo)

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Corridor Layer: Point C],
  [Location / Time of Day], [Digital Corridor / Timeless],
  [Story Beat], [Antivirus programs actively patrol this layer; virus uncovers a photograph of Hemmington and his wife, the human stake behind the experiment],
  [Gameplay], [Navigation / Stealth],
  [Progression], [Player faces combined laser and antivirus threat; Threat Indicator HUD activates],
  [Objective], [Avoid antiviruses and lasers, retrieve the photograph, reach the exit gate],
  [Mechanics], [Arrow key movement, laser avoidance, antivirus avoidance, Threat Indicator (within 3 tiles), death and checkpoint reset on contact],
  [Items Used], [Photo],
  [Estimated Play Time], [8–10 min],
  [Color Mapping], [Black, phosphor green; deep magenta and electric blue for threat states],
  [Assets / Audio], [CORRIDOR_THEME, antivirus proximity interference (louder/more distorted as threat closes), hard cut to silence on death],
)

=== 6.8 Mini-Game 3 (Racing)

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Mini-Game 3: Top-Down Racing],
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


=== 6.9 Corridor Layer Point D (Voice Message)

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [Corridor Layer: Point D],
  [Location / Time of Day], [Digital Corridor / Timeless],
  [Story Beat], [Final corridor; a voice message delivers just before the escape sequence, the organization's acquisition order: the vessel is viable and an extraction team is inbound.],
  [Gameplay], [Navigation / Lore Discovery],
  [Progression], [All three items now held; player returns to Exit Room to trigger the final escape],
  [Objective], [Retrieve the voice message and return to the Exit Room with all collected items],
  [Mechanics], [Arrow key movement, voice message playback (spacebar), exit gate activation with full item slots],
  [Items Used], [Voice Message; all three prior items in inventory],
  [Estimated Play Time], [5 min],
  [Color Mapping], [Black, phosphor green; heavy scanline overlay and geometry corruption as glitch meter peaks],
  [Assets / Audio], [CORRIDOR_THEME (glitching), voice message audio playback, exit activation jingle on final slot fill],
)

=== 6.10 The Escape (Ending)

#table(
  columns: (130pt, 1fr),
  table.header([Game Element], [Description]),
  [Level Name], [The Escape],
  [Location / Time of Day], [Laboratory + Monitor View / Dawn],
  [Story Beat], [All three slots are filled. The exit routes the virus into the lab's containment uplink, the creature's neural interface. Control snaps to the scientist one last time.],
  [Gameplay], [Scripted finale],
  [Progression], [A final containment code appears but the keys remap themselves mid input. The code cannot be completed.],
  [Objective], [Fail, by design. The player's mastered mechanic is turned against them.],
  [Mechanics], [Monitor zoom, sabotaged directional code, first person collapse],
  [Outcome], [The virus crosses into the body. It convulses into a monster and turns on Hemmington, who falls from his chair. Through his blurring vision the player only glimpses the creature; the horror is carried by sound. The organization's capture team approaching, footsteps, then the door breaking. Cut to black.],
  [Estimated Play Time], [4–6 min],
  [Color Mapping], [Lab amber invaded by phosphor green; first appearance of the organic palette as the creature wakes],
  [Assets / Audio], [LAB_THEME corrupted by CORRIDOR_THEME bleeding through; creature audio only (never fully shown); capture-team footsteps and door breach; hard cut to black],
)


=== 6.11 Level Reference Images

#grid(
  columns: 3,
  column-gutter: 12pt,
  figure(
    image("images/MazeDoor.jpg", width: 150pt),
    caption: [6.2 Corridor Layer Point A: gate at the end of the first corridor],
    numbering: none,
  ),

  figure(
    image("images/ExitRoom.jpg", width: 150pt),
    caption: [6.3 Exit Room: three item slots and the exit gate],
    numbering: none,
  ),

  figure(
    image("images/MazeDocument.jpg", width: 150pt),
    caption: [6.5 Corridor Layer Point B: document pickup location],
    numbering: none,
  )
)

#grid(
  columns: 2,
  column-gutter: 12pt,
  figure(
    image("images/MazeLazer.jpg", height: 100pt),
    caption: [6.7 Corridor Layer Point C: laser corridor],
    numbering: none,
  ),
  figure(
    image("images/MazeLazerWithCube.jpg", height: 100pt),
    caption: [6.7 Corridor Layer Point C: virus cube navigating lasers],
    numbering: none,
  ),
)


== 7. HUD DESIGN

=== 7.1 Scientist Phase HUD
#terminal[No persistent HUD elements.]

The scientist phase is fully diegetic. All information is communicated through
the environment itself.

- *Monitor glow* indicates the computer is active and awaiting interaction
- *Desk objects* serve as implicit checklists, player learns to read the room
- Security escalation state is communicated through the scientist's dialogue
  and posture, not a status bar
- Input prompt for the directional code appears as text printed on the monitor
  screen, not as an overlay

=== 7.2 Virus Cube Phase HUD
#terminal[SYSTEM STATUS: NOMINAL █]

All HUD elements are rendered as glitchy terminal overlays that feel native
to the digital environment.

==== Elements
- *MovesCounter*: bottom left, monospace digits, displayed as:
  #terminal[MOVES: 0042]
  Counts total moves taken in the current corridor.

- *Item Slots*: bottom right, three bracketed cells mirroring the Exit Room slots:
  #terminal[\[ITEM_A\] \[------\] \[------\]]
  Empty slots show dashes. Acquired items display a short tag. Slots pulse
  green briefly on pickup.

- *Threat Indicator*: top center, only appears when an antivirus is within
  three tiles:
  #terminal[! INTRUDER DETECTED]
  Fades out when threat clears. No minimap, the player must navigate by feel.

- *Glitch Meter*: represented not as a bar but as increasing visual
  corruption on the HUD itself. After each mini-game completion, terminal
  text begins to flicker, characters drop out, and scanlines thicken. The HUD
  degrading is the meter.

#pagebreak()

=== 7.3 Mini-Game HUDs

==== MG 1: Isometric Adventure
- No HUD overlay. Inventory is shown as physical objects carried by the
  player sprite.
- Ingredient count is communicated by the wizard's dialogue only.

==== MG 2: Text Adventure
- Pure text interface. No HUD elements outside the terminal output itself.
- Hidden states are never surfaced to the player visually.

==== MG 3: Top-Down Racing
- Minimal overlay in the style of an arcade bezel:
  #terminal[SPD: 088   TIME: 01:24]
  Speed and remaining time only. Both flash red when time drops below 15
  seconds.

=== 7.4 Main Menu HUD
#figure(
  image("images/MainMenuHUD.PNG", width: 300pt),
  caption: "Main Menu HUD",
  numbering: none,
)


== 8. AUDIO DESIGN

=== 8.1 Ambient Layers

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

=== 8.2 Interaction Sounds

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

=== 8.3 Mini-Game Audio

==== Mini-Game 1: Isometric Adventure
- Medieval-adjacent synth score
- Object placement: wooden thock sound with slight reverb
- Wizard speech: no voice acting, text appears with a low "bwom" per word

==== Mini-Game 2: Text Adventure
- Near silence. Only ambient: faint tavern murmur, indistinct
- Bard's flute: deliberately atonal and bad, loops in background
  until Scene D or E resolves it
- Each typed option selection: mechanical typewriter clack
- Game crash completion: audio cuts entirely before returning to corridor

==== Mini-Game 3: Top-Down Racing
- Upbeat retro synth track, faster BPM than other sections
- Engine sound: synthesized, pitch-shifts with speed value
- Collision: short noise burst, engine sound cuts and restarts
- Time warning (under 15s): metronome tick added over music

==== Terminal Login Puzzle
- Each binary toggle: low beep (0) / high beep (1)
- Correct input sequence: the six tones play back as a melody


== 9. ART DIRECTION

=== 9.1 Visual Style

==== Core Palette
- Primary: Black backgrounds, phosphor green, cold white
- Accent: Deep magenta and electric blue for corruption/threat states
- Organic elements: Desaturated yellows, sickly greens, wet reds
- No gradients in digital spaces, only flat fills and hard edges

==== CRT Treatment
- Scanline overlay on all digital environments (subtle, ~15% opacity)
- Slight barrel distortion at screen edges
- Chromatic aberration on glitch events, RGB channels split briefly
- Phosphor bloom on bright elements (text, HUD, neon wireframes)
- Screen curvature visible during scientist phase (monitor bezel present)
#figure(
  image("images/CRTMonitor.png", width: 220pt),
  caption: "CRT monitor reference, screen curvature and bezel framing",
  numbering: none,
)

==== Corridor Aesthetic
- Neon wireframe geometry. No textures, only lit edges
- Geometry is strict and grid-aligned until corruption increases
- Walls begin to breathe and shift as glitch meter rises
- Dead ends are darker, geometry incomplete, lines unrendered

==== Interface Aesthetic
- All UI elements styled as terminal output, monospaced, bracketed
- No rounded corners anywhere in the digital world
- Errors and warnings rendered in red with blinking indicators
- The desktop (mini-game window layer) uses a fictional OS skin
  inspired by early Macintosh and DOS hybrid interfaces

#pagebreak()

=== 9.2 Reference Works

==== Narita Boy (Studio Koba, 2021)
The primary pixel-art reference for digital world aesthetics. Key
takeaways for this project:

- *Color-as-structure*: Narita Boy uses three dominant hues to map
  its entire world. Similarly, this game should assign distinct color
  temperatures to each phase, cool green for corridors, warmer amber
  for the laboratory, shifting to biological reds in the creature's domain.
- *CRT as frame*: Narita Boy renders its world as if viewed through an
  old tube screen, with curved edges suggesting the player is watching
  through hardware. The scientist's monitor should feel exactly this way,
  the player literally is looking through a CRT.
- *Visual effects*: Narita Boy avoids the flatness of strict
  retro pixel art by using post-processing effects (bloom, distortion)
  to give its world depth. This game should do the same, keep geometry
  simple but let lighting and effects carry the weight.
- *Meta-digital storytelling*: The world of Narita Boy exists inside a
  computer, and its art reflects that at every level.

==== Hypnospace Outlaw (Tendershoot, 2019)
Reference for the desktop layer, mini-game window framing, and the
aesthetic of a fictional operating system. Key takeaways:

- *The OS as character*: Hypnospace Outlaw builds an entire fictional
  OS with its own logic, visual identity, and decay. The desktop layer
  in this game, the windows that contain mini-games, should feel like
  a real OS skin from 1987, with its own fonts, icons, and behavior.
- *Imperfection as authenticity*: Hypnospace's pages feel real because
  they are inconsistent. Some are polished, some are broken, some are
  clearly still under construction. Mini-game windows should have this
  quality: misaligned elements, placeholder text left in, flickering
  title bars.
- *UI instability as narrative*: As Hypnospace progresses, the system
  itself begins to break. This game does the same. The UI degradation
  after each mini-game is not a visual effect, it is storytelling.
  Each crashed window, each dropped frame, is the system losing ground
  to the virus.

==== Pony Island (Daniel Mullins, 2016)
The primary reference for meta-mechanics and a system that fights the
player. Key takeaways:

- *The system fights back*: in Pony Island the "game" is a hostile
  prison. Menus lie, the cursor is hijacked, crashes are scripted beats.
  This game inverts the role (the player *is* the hostile code), but should
  borrow the principle that every glitch is authored and meaningful, never
  random noise.
- *Diegetic UI as antagonist*: Pony Island's fake OS chrome, error
  pop-ups, and broken buttons are part of the fiction, not furniture
  around it. The Security Escalations and the desktop's failures should
  feel like the system asserting itself against the intruder.
- *Endings that break the frame*: the finale's sabotaged containment code,
  where the keys remap themselves mid-input, is a Pony Island–style beat.
  The interface itself turns against the player at the climax.

==== Stories Untold (No Code, 2017)
The primary reference for interface-as-narrative and a 1980s CRT-framed
anthology. Key takeaways:

- *The interface is the story*: each Stories Untold episode is delivered
  through the device the player operates. A text adventure, lab equipment,
  a radio. This game's phases (terminal login, corridor HUD, mini-game
  windows) should each be a distinct interface that *is* the storytelling,
  not a frame wrapped around it.
- *One throughline binds the anthology*: Stories Untold's separate episodes
  resolve into a single revelation. The genre-hopping mini-games here must
  stay tied to the Hemmington–wife–organization thread so the anthology
  reads as one story, not a collection.
- *A recontextualizing ending*: its finale reframes everything before it.
  The collectible chain (document → photo → voice message) should make the
  player reinterpret the opening lab scene.

== 10. ACCESSIBILITY

=== 10.1 Photosensitivity
- A photosensitivity warning is shown on launch.
- An effects-intensity slider reduces or disables glitch flashes, flicker,
  and chromatic aberration. This game leans heavily on these effects, so the
  slider is treated as a core option, not an afterthought.

=== 10.2 Readability
- A "reduce CRT effects" toggle disables scanlines and barrel distortion.
  This matters most for Mini-Game 2, which is entirely text.

=== 10.3 Input
- Full gamepad support alongside keyboard + mouse; either can be used throughout.
- Full key and button remapping. WASD is supported alongside the arrow keys.
- The directional containment code has no hard time pressure by default.

=== 10.4 Audio & Captions
- Every critical audio cue is doubled visually, so no information is audio-only.
- Threat proximity is conveyed both by sound (antivirus interference) and by the
  Threat Indicator HUD — a colorblind-safe, captioned threat cue.
- Captions and subtitles are provided for all significant audio cues and voice
  message playback.
