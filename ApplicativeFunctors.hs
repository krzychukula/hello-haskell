-- import Control.Applicative

class (Functor f) => Applicative f where
  pure :: a -> f a
  (<*>) :: f (a -> b) -> f a -> f b


class Applicative Maybe where
  pure = Just
  Nothing <*> _ = Nothing
  (Just f) <*> something = fmap f something

-- ghci> Just (+3) <*> Just 9
-- Just 12
-- ghci> pure (+3) <*> Just 10
-- Just 13
-- ghci> pure (+3) <*> Just 9
-- Just 12
-- ghci> Just (++"hahah") <*> Nothing
-- Nothing
-- ghci> Nothing <*> Just "woot"
-- Nothing


-- ghci> pure (+) <*> Just 3 <*> Just 5
-- Just 8
-- ghci> pure (+) <*> Just 3 <*> Nothing
-- Nothing
-- ghci> pure (+) <*> Nothing <*> Just 5
-- Nothing


-- pure f <*> x   equals  fmap f x
-- pure f <*> x <*> y <*> ...   we can write   fmap f x <*> y <*> ...

(<$>) :: (Functor f) => (a -> b) -> f a -> f b
f <$> x = fmap f x

(++) <$> Just "johntra" <*> Just "volta"
--Just "johntravolta"
(++) "johntra" "volta"
-- "johntravolta"
