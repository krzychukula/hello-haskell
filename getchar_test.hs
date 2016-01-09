main = do
  c <- getChar
  if c /= ' '
    then do
      putChar c
      main
    else return ()

-- stack runghc getchar_test.hs
-- dsaf dsafdsaf dsaf dsaf dsf saf
-- dsaf%
