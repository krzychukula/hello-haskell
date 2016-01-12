-- remember to install `random` package
import System.Random
import Control.Monad(when)

main = do
  gen <- getStdGen
  askForNumber gen

askForNumber :: StdGen -> IO ()
askForNumber gen = do
  let (randNumber, newGen) = randomR (1,10) gen :: (Int, StdGen)
  putStr "Which number in the range from 1 to 10 am I thining of? "
  numberString <- getLine
  when (not $ null numberString) $ do
    let number = read numberString
    if randNumber == number
      then putStrLn "You are correct!"
      else putStrLn $ "Sorry, it was " ++ show randNumber
    askForNumber newGen

-- stack runghc guess_random.hs
-- Which number in the range from 1 to 10 am I thining of? 3
-- You are correct!
-- Which number in the range from 1 to 10 am I thining of? 5
-- Sorry, it was 1
-- Which number in the range from 1 to 10 am I thining of?
