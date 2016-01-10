import System.IO
import Data.Char

main = do
  contents <- readFile "girlfriend.txt"
  writeFile "girlfriend_caps.txt" (map toUpper contents)

-- main = do
--   contents <- readFile "girlfriend.txt"
--   putStr contents

-- main = do
--   withFile "girlfriend.txt" ReadMode (\handle -> do
--     contents <- hGetContents handle
--     putStr contents)

-- main = do
--   handle <- openFile "girlfriend.txt" ReadMode
--   contents <- hGetContents handle
--   putStr contents
--   hClose handle

-- `stack runghc girlfriend.hs`
-- Hey! Hey! You! You!
-- I don't like your girlfriend!
-- No way! No way!
-- I think you need a new one!


withFile' :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
withFile' path mode f = do
  handle <- openFile path mode
  result <- f handle
  hClose handle
  return result
