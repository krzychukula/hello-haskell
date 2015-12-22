module Main where

import Lib

main :: IO ()
main = someFunc



-- START OF: http://learnyouahaskell.com/starting-out
doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                        then x
                        else x * 2

doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1

conanO'Brien = "It's a-me, Conan O'Brien!"

lostNumbers = [4,8,15,16,23,42]

sumOfLists = [1,2,3] ++ [4,5,6]
concatenatedString = "hello" ++ " " ++ "world"
usedCons = 'A':" SMALL CAT"
usedConsNums = 5:[1,2,4,5]
letterB = "Steve Buscemi" !! 6

b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]

truthy = [3,2,1] > [2,1,0]
truthy2 = [3,2,1] > [2, 10, 100]
truthy3 = [3,4,2] > [3,4]
truthy4 = [3,4,2] > [2,4]
truthy5 = [3,4,2] == [3,4,2]

first5 = head [5,4,3,2,1]
tail4321 = tail [5,4,3,2,1]
last1 = last [5,4,3,2,1]
init5432 = init [5,4,3,2,1]

length5 = length [5,4,3,2,1]

falsy = null [1,2,3]
truthy6 = null []

reverse321 = reverse [1,2,3]

take543 = take 3 [5,4,3,2,1]
take3 = take 1 [3,9,3]
take12 = take 5 [1,2]
take_empty = take 0 [6,6,6]

drop21 = drop 3 [5,4,3,2,1]
maxi = maximum [1,9,2,3]
mini = minimum [1,2,3,4]

sumOfNumbers = sum [1,2,3]
prod = product [2,3]

truthy7 = 4 `elem` [3,4,5]

-- this is how you write comments

-- texas ranges

range1 = [1..5]
-- [1,2,3,4,5]

lettersRange = ['a'..'z']
-- "abcdefghijklmnopqrstuvwxyz"

-- first param is weird here, it breaks if it's smaller than lowe bounds
withStep = [2,4..20]
-- [2,4,6,8,10,12,14,16,18,20]

-- ok I know why first number works this way - it's not a param - it's more like
-- specifying two elements form the list to show that they differ by two :)

from20to1 = [20,19..1]

-- beware floting points
beware = [0.1, 0.3 .. 1]
-- [0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]

-- how you would get the first 24 multiples of 13
ver1 = [13,26..24*13]
ver2 = take 24 [13,26..]


-- infinite lists

tenNums = take 10 (cycle [1,2,3])
lol3 = take 12 (cycle "LOL ")
-- "LOL LOL LOL "

fives = take 10 (repeat 5)
-- [5,5,5,5,5,5,5,5,5,5]

fives' = replicate 10 5



-- List comprehensions:

comprehensionEvenNaturalToTen = [x*2 | x <- [1..10]]
-- [2,4,6,8,10,12,14,16,18,20]

compEvenNatToTenGe12 = [x*2 | x <- [1..10], x*2 >= 12]
-- [12,14,16,18,20]

comp3 = [x | x <- [50..100], x `mod` 7 == 3]
-- [52,59,66,73,80,87,94]

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
-- boomBangs [-3..10]
-- ["BOOM!","BOOM!","BOOM!","BOOM!","BOOM!","BOOM!","BOOM!"]

manyPredicates = [x | x <- [10..20], x /= 13, x/=15, x /= 19]
-- [10,11,12,14,16,17,18,20]

allProducts = [x*y | x <- [2,5,10], y <- [8,10,11]]
-- [16,20,22,40,50,55,80,100,110]

prodMore50 = [x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]
-- [55,80,100,110]


nouns = ["hobo", "frog", "pope"]
adjectives = ["lazy","grouchy","scheming"]
combination = [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
-- ["lazy hobo","lazy frog","lazy pope","grouchy hobo",
--  "grouchy frog","grouchy pope","scheming hobo","scheming frog","scheming pope"]

length' xs = sum [1 | _ <- xs]
sampleLength = length' [1..10]
-- 10

removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
removed = removeNonUppercase "test Of filter in hasKell"
-- removed "OK"


xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
getEven = [ [ x | x <- xs, even x ] | xs <- xxs]
-- [[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]


-- next: Tuples

listOfCoordinates = [(1,2),(8,11),(4,5)]
-- error: [(1,2),(8,11,5),(4,5)]
-- error: [(1,2),("One",2)]

nameAndage = ("Christopher", "Walken", 55)

eight = fst (8,11)
wow = fst ("Wow", False);

eleven = snd (8,11)
false = snd ("Wow", False)

listWithTuples = zip [1,2,3,4,5] [5,5,5,5,5]
-- [(1,5),(2,5),(3,5),(4,5),(5,5)]

numAndName = zip [1..3] ["one", "two", "three"]
-- [(1,"one"),(2,"two"),(3,"three")]

-- ignores elements in longer list to preserve type
-- zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]
-- [(5,"im"),(3,"a"),(2,"turtle")]

usingInfiniteList = zip [1..] ["apple", "orange", "cherry", "mango"]
-- [(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]

triangles = [ (a,b,c)
              | c <- [1..10], b <- [1..10], a <- [1..10]]

rightTriangles = [ (a,b,c)
              | c <- [1..10], b <- [1..c], a <- [1..b]
              , a^2 + b^2 == c^2]
-- [(3,4,5),(6,8,10)]

-- END of http://learnyouahaskell.com/starting-out





















-- end of file
