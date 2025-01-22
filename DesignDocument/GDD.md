# Game Design Document

[Note: add media files for images or graphics in this folder]

## Introduction

## Concept

```txt
You are a weapon. You're trying to become part of the king's horde. But you're stuck in a lowly blacksmith's shop.

Fortunately, an adventurer picked you up and started to go on an adventure. Little did they know, you are sentient and they have become your host.

But that host is weak. They can't get you to the king's horde. What's not weak however, are the creatures the adventurer comes across.

So you swap between hosts by literally throwing yourself to them getting ever closer to the king's horde. But be careful, if you try to swap and miss, or accidentally cut through your new host because they were too weak, you have failed in your journey.

You eventually get found and return to the lowly blacksmith. Only to start that journey again.
```

Expected length of 5 to 10 minutes per run.

### Game Genre

Action, Hack and Slash, 2D

### Theme Interpretation

The theme this time around is `YOU ARE THE WEAPON`. This is interpreted 2 ways. The first way is in the literal sense. You play as a weapon -- a sword. The other interpretation is more of a conceptual one. If the player is a weapon, they must *feel* like a weapon. As in they must be the most dangerous thing in the room. A concept games like DOOM and Vampire Survivors uses a lot.

## Gameplay Design

To make the player feel like the most dangerous thing, they must feel powerful. A good way to do this is by using positive gameplay loops. Games like DOOM and Vampire survivors do this well by using this.

- DOOM does this by having a satisfying loop of balancing your health and your ammo which you replenish by killing enemies in different ways. This allows for variety in gameplay, and more importantly, makes the player feel like an absolute beast mowing through enemies.
- Vampire Survivors does this by having fast level up that allows for constant upgrades making the player stronger, allowing for stronger enemies, eventually making the game into a screen into a mess of destruction caused by the player.

### Mechanics

- WASD movement in a 2d topdown environment
- Left click to attack
  - passive abilities/enhancements based on the host(?)
- Right click to throw yourself
  - if hit, the target dies if weaker than you
  - if hit, the target gets taken over as your new host if stronger or same strength than you
  - if miss, you take 1 heart of damage, and become the "weakest" (so you can take over any target)

### Dynamics

- map complexity
  - map obstacles (rocks, cacti, lava, water, etc.)
- enemy progression
  - a shielded enemy which needs to be hit by regular attacks a couple of times
  - host takes damage from other enemies (insentivises player to swap when host gets low)

### Aesthetics

- Feeling of being the most dangerous thing in the room
- Feeling of satisfaction due to mechanical progression

## Art

## Audio
