import System.Environment
import Data.List

main = do
  args <- getArgs
  progName <- getProgName
  putStrLn "The arguments are: "
  mapM putStrLn args
  putStrLn "The program name is: "
  putStrLn progName

-- `stack runghc arg_test.hs first second "multi word arg"``
-- The arguments are:
-- first
-- second
-- multi word arg
-- The program name is:
-- arg_test.hs
