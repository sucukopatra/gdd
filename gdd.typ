#set page(numbering: none)
#set page(
  fill: rgb("#121212"),
)

#set text(
  fill: rgb("#d0ccc2"),
)
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

#stack(
    dir:rtl,
    spacing: 10%,
  stack(
    spacing: 10%,
    figure(image("images/placeholder.png"), caption:"placeholder",numbering:none),
    figure(image("images/placeholder.png"), caption:"placeholder",numbering:none),
  ),
  stack(
    spacing: 10%,
    figure(image("images/placeholder.png"), caption:"placeholder",numbering:none),
    figure(image("images/placeholder.png"), caption:"placeholder",numbering:none),
  ),
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

=== 4.3 Virus Cube Phase

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


#pagebreak()

== 5. MINI-GAMES

==== Description
Each mini-game exists as a window inside the desktop environment
and uses a distinct gameplay genre.

==== Common Rules
- Completion grants a key item or critical information
- UI instability increases after each completion
- System glitches force return to corridor phase

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
=== 6.2  Corridor Layer Point A
=== 6.3  Exit Room
=== 6.4  Mini-Game 1 (Platforming)
=== 6.5  Corridor Layer Point B (Document)
=== 6.6  Mini-Game 2 (Text Adventure)
=== 6.7  Corridor Layer Point C (Photo)
=== 6.8  Mini-Game 3 (Racing)
=== 6.9  Corridor Layer Point D (Voice Message)
=== 6.10  Exit Room
=== 6.11 Final Cutscene

== 7. ART DIRECTION

=== 7.1 Visual Style
- Retro 1980s computer aesthetic
- CRT distortion effects
- Neon wireframe corridors
- Low-resolution interfaces
- Glitch overlays

=== 7.2 Creature Design
- Organic, slimy artificial creature
- Strong contrast between digital and biological forms


== 8. AUDIO DESIGN

=== 8.1 Ambient
- Laboratory hum
- Electrical buzz
- System idle noise

=== 8.2 Interaction
- Terminal beeps
- Item pickup sounds
- Antivirus movement cues

=== 8.3 Music
- Synth-based suspense tracks
- Glitch and distortion effects during system failures

---

== 9. ENDGAME SEQUENCE

=== Description
After placing all required items or data into the exit device,
the virus escapes the system via a physical cable.

=== Perspective Shift
Control returns to the scientist.

=== Outcome
The virus uploads itself into the artificial creature.
The creature breaks containment, attacks the scientist,
and the game ends.
