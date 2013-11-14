module Galaga.Resources(boss, 
                        boss_hit,
                        enemy0,
                        enemy1,
                        enemy2,
                        enemy3,
                        enemy4,
                        enemy5,
                        enemy6,
                        enemy7
                        )where

import Graphics.Element
import open Galaga.Animation
import Dict

resourceDir : String
resourceDir = "resources/"

boss : [Image]
boss = enemy "boss"

boss_hit : [Image]
boss_hit = enemy "boss_hit"

enemy0 : [Image]
enemy0 = enemy "enemy0"

enemy1 : [Image]
enemy1 = enemy "enemy1"

enemy2 : [Image]
enemy2 = enemy "enemy2"

enemy3 : [Image]
enemy3 = enemy "enemy3"

enemy4 : [Image]
enemy4 = enemy "enemy4"

enemy5 : [Image]
enemy5 = enemy "enemy5"

enemy6 : [Image]
enemy6 = enemy "enemy6"

enemy7 : [Image]
enemy7 = create "png" "enemy7" 7 17 18

explode : [Image]
explode = create "png" "explode" 5 32 32

enemy : String -> [Image]
enemy baseName = create "png" baseName 2 17 18

--toAnimation : [Image] -> Animation
toAnimation imgs = 
  let n = length imgs in
  let assocs = zip [0..n] imgs in
  { 
    current = 0,
    frames = Dict.fromList assocs
  }

create : String -> String -> Int -> Int -> Int -> [Image]
create ext baseName parts width height = map (toImage width height) (createList ext baseName parts)

toImage : Int -> Int -> String -> Image
toImage width height src = 
  { 
    image = image width height src,
    width = width,
    height = height
  }

createList : String -> String -> Int -> [String]
createList ext baseName n = createList' ext baseName n 0

createList' : String -> String -> Int -> Int -> [String]
createList' ext baseName ct n = 
  case ct of
    0 -> []
    _ -> (resourceDir ++ baseName ++ (show n) ++ "." ++ ext) :: (createList' ext baseName (ct-1) (n+1))
    

