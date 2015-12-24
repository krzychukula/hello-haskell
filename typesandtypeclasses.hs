-- http://learnyouahaskell.com/types-and-typeclasses
-- nodemon --ext hs --exec "stack runghc typesandtypeclasses.hs"
-- stack ghci
-- > :l typesandtypeclasses.hs

main = print "Hello World"

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

factorial :: Integer -> Integer
factorial n = product [1..n]

--do not use float
circumference :: Float -> Float
circumference r = 2 * pi * r
-- circumference 4.0
-- 25.132742

circumference' :: Double -> Double
circumference' r = 2 * pi * r
-- circumference' 4.0
-- 25.132741228718345

-- Type Variables
-- :t fst
-- fst :: (a, b) -> a

-- Typeclasses 101
-- t (==)
-- (==) :: Eq a => a -> a -> Bool


-- read "8.2" + 3.8
-- 12.0

parsedList = read "[1,2,3,4]" ++ [3]
-- [1,2,3,4,3]

-- :t read
-- read :: Read a => String -> a

-- read "5" :: Int
-- 5

-- minBound :: Int
-- -9223372036854775808
-- maxBound :: Char
-- '\1114111'

-- maxBound :: (Bool, Int, Char)
-- (True,9223372036854775807,'\1114111')


-- :t fromIntegral
-- fromIntegral :: (Integral a, Num b) => a -> b








--
