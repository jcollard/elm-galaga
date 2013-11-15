module Galaga.AnimationTest where

import Galaga.Resources as R
import Graphics.Sprite as S
import open Graphics.Collage

rate = 200

animate sprite = S.animator sprite rate

animators = map animate sprites

sprites
  = [R.boss, R.boss_hit, R.enemy0, R.enemy1, R.enemy2,
     R.enemy3, R.enemy4, R.enemy5, R.enemy6, R.enemy7,
     R.explode, R.death, R.ship, R.ship_captured,
     R.level1, R.level5, R.level10, R.level20, R.level30,
     R.level50, R.capture, R.weapon]


displayTest t = 
    let anims = S.processMany animators t 
        elem = color black <| container 200 200 middle <| flowgrid 5 . grid 6 . map S.draw <| anims
    in elem

flowgrid : number -> [[Element]] -> Element
flowgrid s xs = flow down . intersperse (spacer s s) . map (flow right . intersperse (spacer s s)) <| xs

grid n xs = 
  case xs of
    [] -> []
    xs -> take n xs :: (grid n (drop n xs))
  

main = displayTest <~ (every (32*millisecond))
