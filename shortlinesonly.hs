
-- main = do
--   contents <- getContents
--   putStr (shortLinesOnly contents)

main = interact shortLinesOnly

shortLinesOnly :: String -> String
shortLinesOnly input =
  let allLines = lines input
      shortLines = filter (\line -> length line < 10) allLines
      result = unlines shortLines
  in result

-- this can be writter like:
-- main = interact $ unlines . filter ((<10) . length) . lines

-- `stack runghc shortlinesonly.hs`
-- this is long line that's going to be ignored
-- repeat
-- repeat
-- this
-- this
-- because
-- because
-- it
-- it
-- is
-- is
-- short
-- short
