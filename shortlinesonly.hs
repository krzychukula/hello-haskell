
main = do
  contents <- getContents
  putStr (shortLinesOnly contents)



shortLinesOnly :: String -> String
shortLinesOnly input =
  let allLines = lines input
      shortLines = filter (\line -> length line < 10) allLines
      result = unlines shortLines
  in result

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
