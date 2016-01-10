
import Data.Char

main = do
  contents <- getContents
  putStr (map toUpper contents)

-- `cat haiku.txt | stack runghc capslocker.hs`
-- I'M A LIL' TEAPOT
-- WHAT'S WITH THAT AIRPLANE FOOD, HUH?
-- IT'S SO SMALL, TASTELESS
