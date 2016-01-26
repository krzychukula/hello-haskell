
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
 
