

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
