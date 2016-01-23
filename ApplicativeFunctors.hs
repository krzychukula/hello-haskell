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



instance Applicative [] where
  pure x = [x]
  fs <*> xs = [f x | f <- fs, x <- xs]

-- ghci> pure "Hey" :: [String]
-- ["Hey"]
-- ghci> pure "Hey" :: Maybe String
-- Just "Hey"

-- [(*0),(+100)] <*> [1,2,3]
-- [0,0,0,101,102,103]

-- [(+),(*)] <*> [1,5] <*> [1, 1]
-- [2,2,6,6,1,1,5,5]

-- (++) <$> ["ha", "czesc", "hm"] <*> ["?","!","."]
-- ["ha?","ha!","ha.","czesc?","czesc!","czesc.","hm?","hm!","hm."]

-- > [ x * y | x <- [2,5,10], y <- [8,10,11]]
-- [16,20,22,40,50,55,80,100,110]
-- > (*) <$> [2,5,10] <*> [8,10,11]
-- [16,20,22,40,50,55,80,100,110]


-- If we wanted all possible products of those two lists that are more than 50, we'd just do:
-- filter (>50) $ (*) <$> [2,5,10] <*> [8,10,11]
-- [55,80,100,110]

-- at this point I have read: http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html
-- helped a lot with understanding applicative monads

instance Applicative IO where
  pure = return
  a <*> b = do
    f <- a
    x <- b
    return (f x)

myAction :: IO String
myAction = do
  a <- getLine
  b <- getLine
  return $ a ++ b

-- the same as:

myAction :: IO String
myAction = (++) <$> getLine <*> getLine


main = do
  a <- (++) <$> getLine <*> getLine
  putStrLn $ "The two lines concatenated turn out to be: " ++ a

-- r ->  is the same as (->) r. Return type not specified for some reason
instance Applicative ((->) r) where
  pure x = (\_ -> x)
  f <*> g = \x -> f x (g x)

-- ghci> pure 3 "blah"
-- 3

-- ghci> (\x y z -> [x,y,z]) <$> (+3) <*> (*2) <*> (/2) $ 5
-- [8.0,10.0,2.5]
