
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




data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
  | x == a = Node x left right
  | x < a  = Node a (treeInsert x left) right
  | x > a  = Node a left (treeInsert x right)


treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
  | x == a = True
  | x < a  = treeElem x left
  | x > a  = treeElem x right

nums = [8,6,4,1,7,3,5]
numsTree = foldr treeInsert EmptyTree nums

-- ghci> numsTree
-- Node 5 (Node 3 (Node 1 EmptyTree EmptyTree) (Node 4 EmptyTree EmptyTree)) (Node 7 (Node 6 EmptyTree EmptyTree) (Node 8 EmptyTree EmptyTree))

-- ghci> 8 `treeElem` numsTree
-- True
-- ghci> 100 `treeElem` numsTree
-- False
-- ghci> 1 `treeElem` numsTree
-- True
-- ghci> 10 `treeElem` numsTree
-- False


---
