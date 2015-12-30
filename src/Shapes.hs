
module Shapes
    ( Point(..)
    , Shape(..)
    , surface
    , nudge
    , baseCircle
    , baseRect
    ) where

-- data Bool = False | True

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- surface (Rectangle (Point 0 0) (Point 100 100))
-- 10000.0
-- ghci> surface (Circle (Point 0 0) 24)
-- 1809.5574

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

-- nudge (Circle (Point 34 34) 10) 5 10
-- Circle (Point 39.0 44.0) 10.0

baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)

-- nudge (baseRect 40 100) 60 23
-- Rectangle (Point 60.0 23.0) (Point 100.0 123.0)
