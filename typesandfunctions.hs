-- http://book.realworldhaskell.org/read/types-and-functions.html

main = if compare 2 3 == LT
  then putStrLn "Hello, World 1!"
  else putStrLn "Hello, World 2!"

-- stack ghci
-- :load typesandfunctions.hs
-- add 1 2
add a b = a + b

myDrop n xs = if n <= 0 || null xs
          then xs
          else myDrop (n - 1) (tail xs)
-- myDrop 2 "hello"
-- "llo"

isOdd n = mod n 2 == 1

-- polymorphism in haskell
-- :type last
-- last :: [a] -> a
