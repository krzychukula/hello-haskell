
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
