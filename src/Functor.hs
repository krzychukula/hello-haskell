
class Functor f where
  fmap :: (a -> b) -> f a -> f b

instance Functor [] where
  fmap = map

  --
  -- map :: (a -> b) -> [a] -> [b]
  -- ghci> fmap (*2) [1..3]
  -- [2,4,6]
  -- ghci> map (*2) [1..3]
  -- [2,4,6]

instance Functor Maybe where
  fmap f (Just x) = Just (f x)
  fmap f Nothing = Nothing

  -- ghci> fmap (++ " HEY GUYS IM INSIDE THE JUST") (Just "Something serious.")
  -- Just "Something serious. HEY GUYS IM INSIDE THE JUST"
  -- ghci> fmap (++ " HEY GUYS IM INSIDE THE JUST") Nothing
  -- Nothing
  -- ghci> fmap (*2) (Just 200)
  -- Just 400
  -- ghci> fmap (*2) Nothing
  -- Nothing

instance Functor Tree where
  fmap f EmptyTree = EmptyTree
  fmap f (Node x leftsub rightsub) = Node (f x) (fmap f leftsub) (fmap f rightsub)

  -- ghci> fmap (*2) EmptyTree
  -- EmptyTree
  -- ghci> fmap (*4) (foldr treeInsert EmptyTree [5,7,3,2,1,7])
  -- Node 28 (Node 4 EmptyTree (Node 8 EmptyTree (Node 12 EmptyTree (Node 20 EmptyTree EmptyTree)))) EmptyTree

instance Functor (Either a) where
  fmap f (Right x) = Right (f x)
  fmap f (Left x) = Left x

data Either a b = Left a | Right b

-- Next: really hard part about kinds...
-- ghci> :k Int
-- Int :: *

-- ghci> :k Maybe
-- Maybe :: * -> *

-- ghci> :k Maybe Int
-- Maybe Int :: *
--
-- ghci> :k Either
-- Either :: * -> * -> *
-- ghci> :k Either String
-- Either String :: * -> *
-- ghci> :k Either String Int
-- Either String Int :: *


class Functor f where
  fmap :: (a -> b) -> f a -> f b


-- And I'm lost from here...

class Tofu t where
  tofu :: j a -> t a j

data Frank a b = Frank {frankField :: b a} deriving (Show)

-- ghci> :t Frank {frankField = Just "HAHA"}
-- Frank {frankField = Just "HAHA"} :: Frank [Char] Maybe
-- ghci> :t Frank {frankField = Node 'a' EmptyTree EmptyTree}
-- Frank {frankField = Node 'a' EmptyTree EmptyTree} :: Frank Char Tree
-- ghci> :t Frank {frankField = "YES"}
-- Frank {frankField = "YES"} :: Frank Char []

instance Tofu Frank where
  tofu x = Frank x
  --
  -- ghci> tofu (Just 'a') :: Frank Char Maybe
  -- Frank {frankField = Just 'a'}
  -- ghci> tofu ["HELLO"] :: Frank [Char] []
  -- Frank {frankField = ["HELLO"]}
