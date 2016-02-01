import System.Random
import Control.Monad.State

randomSt :: (RandomGen g, Random a) => State g a
randomSt = State random

threeCoins :: State StdGen (Bool, Bool, Bool)
threeCoins = do
  a <- randomSt
  b <- randomSt
  c <- randomSt
  return (a,b,c)

-- ghci> runState threeCoins (mkStdGen 33)
-- ((True,False,True),680029187 2103410263)
