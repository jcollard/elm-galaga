module Galaga.Resources where

import Graphics.Element
import open Graphics.Sprite

-- Specifies the relative directory for my resources
resourceDir : String
resourceDir = "resources/"

-- Read in the sprite sheet
sheet : Element
sheet = image 196 224 (resourceDir ++ "galagasheet.png")

-- Level emblem graphic for displaying which Stage the player is currently in
level1 = cropLevel 0 207
level5 = cropLevel 19 207
level10 = cropLevel 38 207
level20 = cropLevel 57 207
level30 = cropLevel 76 207
level50 = cropLevel 95 207

-- All of the enemies
boss = cropEnemy2 38 187
boss_hit = cropEnemy2 76 187
enemy0 = cropEnemy2 114 207
enemy1 = cropEnemy2 114 187
enemy2 = cropEnemy1 57 166
enemy3 = cropEnemy2 0 187
enemy4 = cropEnemy1 76 166
enemy5 = cropEnemy1 95 166
enemy6 = cropEnemy1 114 166
enemy7 = cropEnemy3 0 166
explode = cropExplosion 0 98 5
capture = cropCapture 0 1

-- Player ship 
ship = cropShip 134 168
death = cropExplosion 0 132 4
ship_captured = cropShip 152 168

-- Weapon / Lazer
weapon = sprite sheet [{top = 216, left=155, width=3, height=8}]

-- Helper Functions

enemyCrop : Int -> Int -> Crop
enemyCrop left top = { top = top, left = left, width = 17, height = 18 }

explosionCrop : Int -> Int -> Crop
explosionCrop left top = { top = top, left = left, width = 32, height = 32 }

captureCrop : Int -> Int -> Crop
captureCrop left top = {top = top, left = left, width = 64, height = 96 }

shipCrop : Int -> Int -> Crop
shipCrop left top = { top = top, left = left, width = 15, height = 16 }

levelCrop : Int -> Int -> Crop
levelCrop = enemyCrop

cropEnemy1 : Int -> Int -> Sprite
cropEnemy1 left top = sprite sheet [(enemyCrop left top)]

cropEnemy2 : Int -> Int -> Sprite
cropEnemy2 left top = sprite sheet (crops (enemyCrop left top) (right 2) 2)

cropEnemy3 : Int -> Int -> Sprite
cropEnemy3 left top = sprite sheet (crops (enemyCrop left top) (right 2) 3)

cropExplosion : Int -> Int -> Int -> Sprite
cropExplosion left top n = sprite sheet (crops (explosionCrop left top) (right 2) n)

cropCapture : Int -> Int -> Sprite
cropCapture left top = sprite sheet (crops (captureCrop left top) (right 2) 3)

cropShip : Int -> Int -> Sprite
cropShip left top = sprite sheet [(shipCrop left top)]

cropLevel : Int -> Int -> Sprite
cropLevel = cropEnemy1
