
module Types
    ( Point(..)
    , Shape(..)
    , surface
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
