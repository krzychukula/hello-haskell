import Control.Monad
import Data.Char

main = forever $ do
  putStr "Give me some input: "
  l <- getLine
  putStrLn $ map toUpper l

-- stack runghc forever.hs
-- Give me some input: input
-- INPUT
-- Give me some input: some test
-- SOME TEST
-- Give me some input: ^C
