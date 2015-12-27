--
main = print "higherorderfunctions"

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

multiTwoWithNine = multThree 9
fiftyfour = multiTwoWithNine 2 3
-- 54

multWithEighteen = multiTwoWithNine 2
onehundredeighty = multWithEighteen 10
-- 180


compareWithHundred1 :: (Num a, Ord a) => a -> Ordering
compareWithHundred1 x = compare 100 x

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- applyTwice (+3) 10 -> 16
-- applyTwice (++ "A") "OL" -> OLAA
-- applyTwice (3:) [1] -> [3,3,1]


zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
-- zipWith' (+) [1,2,3] [1,2,3,4]
-- [2,4,6]

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
  where g x y = f y x

flipsimpler :: (a -> b -> c) -> b -> a -> c
flipsimpler f y x = f x y

-- zipWith (flip' div) [2,2..] [10,8,6,4,2]
-- [5,4,3,2,1]

-- Maps and filters:

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x: map' f xs

-- [x+3 | x <- [1,5,3,1,6]] == map (+3) [1,5,3,1,6]

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
  | p x           = x : filter p xs
  | otherwise     = filter p xs
  --
  -- filter even [1,2,3]
  -- [2]


largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000,99999..])
  where p x = x `mod` 3829 == 0

-- find the sum of all odd squares that are smaller than 10,000
foundSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
foundSum2 = sum (takeWhile (<10000) [n^2 | n <- [1..], odd (n^2)])

-- for all starting numbers between 1 and 100, how many chains have a length greater than 15?

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
  | even n = n:chain (n `div` 2)
  | odd n  = n:chain (n * 3 + 1)

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
  where isLong xs = length xs > 15

-- 66

-- Next: Lambdas

numLongChains' :: Int
numLongChains' = length (filter (\xs -> length xs > 15) (map chain [1..100]))

multipleArguments = zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]

patternMatching = map (\(a,b) -> a + b) [(1,2),(3,4)]

addThree1 :: (Num a) => a -> a -> a -> a
addThree1 x y z = x + y + z
-- the same as:
addThree2 :: (Num a) => a -> a -> a -> a
addThree2 = \x -> \y -> \z -> x + y + z

fliplambda :: (a -> b -> c) -> b -> a -> c
fliplambda f = \x y -> f y x





---





---
