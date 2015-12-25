-- http://learnyouahaskell.com/syntax-in-functions

lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

sayMe :: Integral a => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three"
sayMe 4 = "Four"
sayMe 5 = "Five"
sayMe x = "Not between 1 and 5"

factorial :: Integral a => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"

addVectorsNaive :: (Num a) => (a, a) -> (a,a) -> (a,a)
addVectorsNaive a b = (fst a + fst b, snd a + snd b)

addVectors :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)


first :: (a,b,c) -> a
first (x,_,_) = x

second :: (a,b,c) -> b
second (_,y,_) = y

third :: (a,b,c) -> c
third (_,_,z) = z

-- pattern match in list comprehensions
xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
res = [a+b | (a,b) <- xs]
-- [4,7,6,8,11,4]


head' :: [a] -> a
head' [] = error "can't call head on an empty list!"
head' (x:_) = x


tell :: Show a => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y


length' :: Num b => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs


sum' :: Num a => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs


capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:xs) = "The first lettef of " ++ all ++ " is " ++ [x]


-- Next: Guards, guards!


bmiTell1 :: RealFloat a => a -> String
bmiTell1 bmi
  | bmi <= 18.5 = "You're underweight"
  | bmi <= 25.0 = "You're supposedly normal"
  | bmi <= 30.0 = "Lose some weight"
  | otherwise   = "You really have to lose weight"

bmiTell :: RealFloat a => a -> a -> String
bmiTell weight height
  | weight / height ^ 2 <= 18.5 = "You're underweight"
  | weight / height ^ 2 <= 25.0 = "You're supposedly normal"
  | weight / height ^ 2 <= 30.0 = "Lose some weight"
  | otherwise                   = "You really have to lose weight"


max' :: Ord a => a -> a -> a
max' a b
  | a > b     = a
  | otherwise = b

myCompare :: Ord a => a -> a -> Ordering
a `myCompare` b
  | a > b     = GT
  | a == b    = EQ
  | otherwise = LT

-- Where?!

bmiTell2 :: RealFloat a => a -> a -> String
bmiTell2 weight height
  | bmi <= 18.5 = "You're underweight"
  | bmi <= 25.0 = "You're supposedly normal"
  | bmi <= 30.0 = "Lose some weight"
  | otherwise   = "You really have to lose weight"
  where bmi = weight / height ^ 2


bmiTell3 :: RealFloat a => a -> a -> String
bmiTell3 weight height
  | bmi <= skinny = "You're underweight"
  | bmi <= normal = "You're supposedly normal"
  | bmi <= fat    = "Lose some weight"
  | otherwise     = "You really have to lose weight"
  where bmi    = weight / height ^ 2
        skinny = 18.5
        normal = 25.0
        fat    = 30.0

bmiTell4 :: RealFloat a => a -> a -> String
bmiTell4 weight height
  | bmi <= skinny = "You're underweight"
  | bmi <= normal = "You're supposedly normal"
  | bmi <= fat    = "Lose some weight"
  | otherwise     = "You really have to lose weight"
  where bmi    = weight / height ^ 2
        (skinny, normal, fat) = (18.5, 25.0, 30.0)

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

calcBmis :: RealFloat a => [(a, a)] -> [a]
calcBmis xs = [  bmi w h | (w, h) <- xs]
  where bmi weight height = weight / height ^ 2
-- calcBmis [(12, 2), (15, 34)]
-- [3.0,1.2975778546712802e-2]


-- Let it be

cylinder :: RealFloat a => a -> a -> a
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea  = pi * r ^ 2
  in  sideArea + 2 * topArea

fourtytwo = 4 * (let a = 9 in a + 1) + 2
squaretuple = [let square x = x * x in (square 5, square 3, square 2)]
-- [(25,9,4)]

tupleMultipleLet = (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)
-- (6000000,"Hey there!")

sixhundred = (let (a,b,c) = (1,2,3) in a+b+c) * 100

calcBmis2 :: RealFloat a => [(a,a)] -> [a]
calcBmis2 xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]

-- Next: Case expressions


headp :: [a] -> a
headp [] = error "No head for empty lists!"
deadp (x:_) = x

headcase :: [a] -> a
headcase xs = case xs of
  [] -> error "No head for empty lists!"
  (x:_) -> x


describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of [] -> "empty."
                                               [x] -> "a sigle list."
                                               xs -> "a longer list."

describeList' :: [a] -> String
describeList' xs = "The list is " ++ what xs
  where what [] = "empty."
        what [x] = "a single list."
        what xs = "a longer list."




--
