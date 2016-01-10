import System.IO

main = do
  handle <- openFile "girlfriend.txt" ReadMode
  contents <- hGetContents handle
  putStr contents
  hClose handle

-- `stack runghc girlfriend.hs`
-- Hey! Hey! You! You!
-- I don't like your girlfriend!
-- No way! No way!
-- I think you need a new one!
