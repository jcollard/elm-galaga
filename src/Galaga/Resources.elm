module Galaga.Resources(boss, 
                        boss_hit,
                        enemy0,
                        enemy1,
                        enemy2,
                        enemy3,
                        enemy4,
                        enemy5,
                        enemy6,
                        enemy7,
                        level1,
                        level5,
                        level10,
                        level25,
                        level50,
                        level100,
                        level200,
                        explode,
                        death,
                        capture,
                        ship,
                        weapon
                        )where

import Graphics.Element
import open Galaga.Animation
import Dict

resourceDir : String
resourceDir = "resources/"

level : String -> Animation
level baseName = create "png" baseName 1 17 18

level1 = level "level1"
level5 = level "level5"
level10 = level "level10"
level25 = level "level25"
level50 = level "level50"
level100 = level "level100"
level200 = level "level200"

enemy : String -> Animation
enemy baseName = create "png" baseName 2 17 1

boss : Animation
boss = enemy "boss"

boss_hit : Animation
boss_hit = enemy "boss_hit"

enemy0 : Animation
enemy0 = enemy "enemy0"

enemy1 : Animation
enemy1 = enemy "enemy1"

enemy2 : Animation
enemy2 = enemy "enemy2"

enemy3 : Animation
enemy3 = enemy "enemy3"

enemy4 : Animation
enemy4 = enemy "enemy4"

enemy5 : Animation
enemy5 = enemy "enemy5"

enemy6 : Animation
enemy6 = enemy "enemy6"

enemy7 : Animation
enemy7 = create "png" "enemy7" 7 17 18

explode : Animation
explode = create "png" "explode" 5 32 32

death : Animation
death = create "png" "death" 4 32 32

capture : Animation
capture = create "png" "capture" 3 64 96

ship : Animation
ship = create "png" "ship" 1 16 16

ship_captured : Animation
ship_captured = create "png" "ship_captured" 1 16 16

weapon : Animation
weapon = create "png" "weapon" 1 8 8

create : String -> String -> Int -> Int -> Int -> Animation
create ext baseName parts width height = toAnimation <| map (toImage width height) (createList ext baseName parts)

toImage : Int -> Int -> String -> Image
toImage width height src = 
  { 
    image = image width height src,
    width = width,
    height = height
  }

toAnimation : [Image] -> Animation
toAnimation imgs = 
  let n = length imgs in
  let assocs = zip [0..n] imgs in
  { 
    current = 0,
    maxFrame = n,
    frames = Dict.fromList assocs
  }

createList : String -> String -> Int -> [String]
createList ext baseName n = createList' ext baseName n 0

createList' : String -> String -> Int -> Int -> [String]
createList' ext baseName ct n = 
  case ct of
    0 -> []
    _ -> (resourceDir ++ baseName ++ (show n) ++ "." ++ ext) :: (createList' ext baseName (ct-1) (n+1))
    

