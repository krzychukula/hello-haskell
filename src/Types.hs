
module Types
    (
    Shape(..)
    , surface
    ) where

-- data Bool = False | True


data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- surface $ Circle 10 20 10
-- 314.15927
-- ghci> surface $ Rectangle 0 0 100 100
-- 10000.0
