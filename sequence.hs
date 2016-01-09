
-- main = do
--   a <- getLine
--   b <- getLine
--   c <- getLine
--   print [a,b,c]
  -- stack runghc sequence.hs
  -- one
  -- two
  -- three
  -- ["one","two","three"]

main = do
  rs <- sequence [getLine, getLine, getLine]
  print rs

-- to print sequence
-- sequence (map print [1,2,3])
-- the same as: sequence $ map print [1,2,3]
-- sequence $ map print [1,2,3]
-- 1
-- 2
-- 3
-- [(),(),()]

-- the same can be done with mapM and mapM_ (this one thows out the result)
-- ghci> mapM print [1,2,3]
-- 1
-- 2
-- 3
-- [(),(),()]
-- ghci> mapM_ print [1,2,3]
-- 1
-- 2
-- 3
