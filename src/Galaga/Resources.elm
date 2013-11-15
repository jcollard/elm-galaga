module Galaga.Resources where

import Graphics.Element
import open Graphics.Sprite

-- Specifies the relative directory for my resources
resourceDir : String
resourceDir = "resources/"

-- Uses the sprite function from Graphics.Sprite but tags on the resourceDirectory
-- in front of the base name
create : String -> String -> Int -> Int -> Int -> Sprite
create ext baseName parts width height = sprite ext (resourceDir ++ baseName) parts width height

-- Convenience function for creating Level sprites
level : String -> Sprite
level baseName = create "png" baseName 1 17 18

-- Level emblem graphic for displaying which Stage the player is currently in
level1 = level "level1"
level5 = level "level5"
level10 = level "level10"
level25 = level "level25"
level50 = level "level50"
level100 = level "level100"

-- All of the enemies are the same size and many of them have 2 frames so
-- this is convenient
enemy : String -> Sprite
enemy baseName = create "png" baseName 2 17 18

-- All of the enemies
boss = enemy "boss"
boss_hit = enemy "boss_hit"
enemy0 = enemy "enemy0"
enemy1 = enemy "enemy1"
enemy2 = create "png" "enemy2" 1 17 18
enemy3 = enemy "enemy3"
enemy4 = create "png" "enemy4" 1 17 18
enemy5 = create "png" "enemy5" 1 17 18
enemy6 = create "png" "enemy6" 1 17 18
enemy7 = create "png" "enemy7" 3 17 18
explode = create "png" "explode" 5 32 32
capture = create "png" "capture" 3 64 96

-- Player ship 
ship = create "png" "ship" 1 16 16
death = create "png" "death" 4 32 32
ship_captured = create "png" "ship_captured" 1 16 16

-- Weapon / Lazer
weapon = create "png" "weapon" 1 8 8