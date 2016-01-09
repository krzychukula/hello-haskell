
main = do
  line <- getLine
  if null line
    then do
      return "return creates IO action from value"
      return "it's complitely differenct form other languages"
      putStrLn "print between returns"
      return "all those lines are going to be executed"
      return ()
    else do
      putStrLn $ reverseWords line
      main



reverseWords :: String -> String
reverseWords = unwords . map reverse . words


-- stack runghc reverser.hs
-- Hello
-- olleH
-- cześć
-- ćśezc
--
-- ➜  hello-haskell git:(master) ✗

-- return in haskell is so different that I had to add more code about it
-- tack runghc reverser.hs
-- hey haskell
-- yeh lleksah
--
-- print between returns
