

isBigGang :: Int -> (Bool, String)
isBigGang x = (x > 9, "Compared gang size to 9")

applyLog :: (a,String) -> (a -> (b, String)) -> (b,String)
applyLog (x,log) f = let (y, newLog) = f x in (y, log ++ newLog)

-- ghci> (3, "Smallish gang.") `applyLog` isBigGang
-- (False,"Smallish gang.Compared gang size to 9")
-- ghci> (30, "A freaking platoon.") `applyLog` isBigGang
-- (True,"A freaking platoon.Compared gang size to 9")

-- ghci> ("Tobin","Got outlaw name.") `applyLog` (\x -> (length x, "Applied length."))
-- (5,"Got outlaw name.Applied length.")
-- ghci> ("Bathcat","Got outlaw name.") `applyLog` (\x -> (length x, "Applied length"))
-- (7,"Got outlaw name.Applied length")


newtype Writer w a = Writer { runWriter :: (a w)}

instance (Monoid w) => Monad (Writer w) where
  return x = Writer (x, mempty)
  (Writer (x,v)) >>= f = let (Writer (y, v')) = f x in Writer (y, y `mappend` v`)

-- ghci> runWriter (return 3 :: Writer String Int)
-- (3,"")
-- ghci> runWriter (return 3 :: Writer (Sum Int) Int)
-- (3,Sum {getSum = 0})
-- ghci> runWriter (return 3 :: Writer (Product Int) Int)
-- (3,Product {getProduct = 1})






---
