
(>>=) :: (Monad m) => m a -> (a -> m b) -> m b


applyMaybe :: Moybe a -> (a -> Maybe b) -> Maybe b
applyMaybe Nothing f = Nothing
applyMaybe (Just x) f = f x

-- ghci> Just 3 `applyMaybe` \x -> Just (x+1)
-- Just 4
-- ghci> Just "smile" `applyMaybe` \x -> Just (x ++ " :)")
-- Just "smile :)"
-- ghci> Nothing `applyMaybe` \x -> Just (x+1)
-- Nothing
-- ghci> Nothing `applyMaybe` \x -> Just (x ++ " :)")
-- Nothing

-- ghci> Just 3 `applyMaybe` \x -> if x > 2 then Just x else Nothing
-- Just 3
-- ghci> Just 1 `applyMaybe` \x -> if x > 2 then Just x else Nothing
-- Nothing

class Monad m where
  return :: a -> m a

  (>>=) :: m a -> (a -> m b) -> m b

  (>>) :: m a -> m b -> m b
  x >> y = x >>= \_ -> y

  fail :: String -> m a
  fail msg = error msg


instance Monad Maybe where
  return x = Just x
  Nothing >>= f = Nothing
  Just x >>= f = f x
  fail _ = Nothing

-- ghci> return "WHAT" :: Maybe String
-- Just "WHAT"
-- ghci> Just 9 >>= \x -> return (x*10)
-- Just 90
-- ghci> Nothing >>= \x -> return (x*10)
-- Nothing


type Birds = Int
type Pole (Birds, Birds)

landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
  | abs ((left + n) - right) < 4 = Just (left + n, right)
  | otherwise                    = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n (left, right)
  | abs (left - (right + n)) < 4 = Just (left, right + n)
  | otherwise                    = Nothing

  --
  -- ghci> landLeft 2 (0,0)
  -- Just (2,0)
  -- ghci> landLeft 10 (0,3)
  -- Nothing

  -- ghci> landRight 1 (0,0) >>= landLeft 2
  -- Just (2,1)
  -- ghci> Nothing >>= landLeft 2
  -- Nothing


-- do notation

Just 3 >>= (\x -> Just (show x ++ "!"))
-- Just "3!"

Just 3 >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y)))
-- Just "3!"

-- is a little like:
let x = 3; y = "!" in show x ++ y
-- "3!"

-- but with failure context:
-- ghci> Nothing >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y)))
-- Nothing
-- ghci> Just 3 >>= (\x -> Nothing >>= (\y -> Just (show x ++ y)))
-- Nothing
-- ghci> Just 3 >>= (\x -> Just "!" >>= (\y -> Nothing))
-- Nothing

foo :: Maybe String
foo = Just 3   >>= (\x ->
      Just "!" >>= (\y ->
      Just (show x ++ y)))

-- to save writing:

foo :: Maybe String
foo = do
  x <- Just 3
  y <- Just "!"
  Just (show x ++ y)
