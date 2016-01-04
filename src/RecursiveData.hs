
data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)


-- with record syntax:

data List a = Empty | Cons {listHead :: a, listTail :: List a} deriving (Show, Read, Eq, Ord)

-- ghci> Empty
-- Empty
-- ghci> 5 `Cons` Empty
-- Cons 5 Empty
-- ghci> 4 `Cons` (5 `Cons` Empty)
-- Cons 4 (Cons 5 Empty)
-- ghci> 3 `Cons` (4 `Cons` (5 `Cons` Empty))
-- Cons 3 (Cons 4 (Cons 5 Empty))

-- For instance, *'s fixity is infixl 7 * and +'s fixity is infixl 6
infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

-- ghci> 3 :-: 4 :-: 5 :-: Empty
-- (:-:) 3 ((:-:) 4 ((:-:) 5 Empty))
-- ghci> let a = 3 :-: 4 :-: 5 :-: Empty
-- ghci> 100 :-: a
-- (:-:) 100 ((:-:) 3 ((:-:) 4 ((:-:) 5 Empty)))



infixr 5 ++
(++) :: [a] -> [a] -> [a]
[]      ++ ys = ys
(x:xs)  ++ ys = x : (xs ++ ys)


infixr 5 .++
(.++) :: List a -> List a -> List a
Empty .++ ys = ys
(x :-: xs) .++ ys = x :-: (xs .++ ys)

-- ghci> let a = 3 :-: 4 :-: 5 :-: Empty
-- ghci> let b = 6 :-: 7 :-: Empty
-- ghci> a .++ b
-- (:-:) 3 ((:-:) 4 ((:-:) 5 ((:-:) 6 ((:-:) 7 Empty))))








---
