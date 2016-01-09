import Control.Monad

main = do
  colors <- forM [1,2,3,4] (\a -> do
    putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"
    color <- getLine
    return color)
  putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
  mapM putStrLn colors

-- stack runghc form_test.hs
-- Which color do you associate with the number 1?
-- red
-- Which color do you associate with the number 2?
-- yellow
-- Which color do you associate with the number 3?
-- blue
-- Which color do you associate with the number 4?
-- green
-- The colors that you associate with 1, 2, 3 and 4 are:
-- red
-- yellow
-- blue
-- green
