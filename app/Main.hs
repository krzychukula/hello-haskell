module Main where

import Lib

main :: IO ()
main = someFunc


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
