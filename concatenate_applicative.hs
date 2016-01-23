-- stack runghc concatenate_applicative.hs
-- line 1
-- second line
-- The two lines concatenated turn out to be: line 1second line

main = do
  a <- (++) <$> getLine <*> getLine
  putStrLn $ "The two lines concatenated turn out to be: " ++ a
