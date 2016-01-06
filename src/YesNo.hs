class YesNo a where
  yesno :: a -> Bool

instance YesNo Int where
  yesno 0 = False
  yesno _ = True

instance YesNo [a] where
  yesno [] = False
  yesno _ = True

instance YesNo Bool where
  yesno = id

-- id takes in a parameter and returs the same thing


instance YesNo (Maybe a) where
  yesno (Just _) = True
  yesno Nothing = False

-- instance YesNo (Tree a) where
--   yesno EmptyTree = False
--   yesno _ = True
--
-- instance YesNo TrafficLight where
--   yesno Red = False
--   yesno _ = True

  -- ghci> yesno $ length []
  -- False
  -- ghci> yesno "haha"
  -- True
  -- ghci> yesno ""
  -- False
  -- ghci> yesno $ Just 0
  -- True
  -- ghci> yesno True
  -- True
  -- ghci> yesno EmptyTree
  -- False
  -- ghci> yesno []
  -- False
  -- ghci> yesno [0,0,0]
  -- True
  -- ghci> :t yesno
  -- yesno :: (YesNo a) => a -> Bool


yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult

-- ghci> yesnoIf [] "YEAH!" "NO!"
-- "NO!"
-- ghci> yesnoIf [2,3,4] "YEAH!" "NO!"
-- "YEAH!"
-- ghci> yesnoIf True "YEAH!" "NO!"
-- "YEAH!"
-- ghci> yesnoIf (Just 500) "YEAH!" "NO!"
-- "YEAH!"
-- ghci> yesnoIf Nothing "YEAH!" "NO!"
-- "NO!"





--
