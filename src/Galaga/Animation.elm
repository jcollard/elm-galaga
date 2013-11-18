module Galaga.Animation where

import open Dict

type Image = 
  { image  : Element,
    width  : Int,
    height : Int
  }

type Animation =
  { current : Int
  , maxFrame : Int
  , frames : Dict Int Image
  }

