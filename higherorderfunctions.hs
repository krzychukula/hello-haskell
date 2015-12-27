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

flipsimpler :: (a -> b -> ) -> b -> a -> c
flipsimpler f y x = f x y

-- zipWith (flip' div) [2,2..] [10,8,6,4,2]
-- [5,4,3,2,1]

-- Maps and filters:







---





---
