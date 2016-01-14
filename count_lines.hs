import System.Environment
import System.IO
import System.IO.Error

-- http://code4j.blogspot.com/2013/08/not-in-scope-catch.html
main = toTry `catchIOError` handler

toTry :: IO ()
toTry = do
            (fileName:_) <- getArgs
            contents <- readFile fileName
            putStrLn $ "The file has " ++ show (length (lines contents)) ++ " lines!"

handler :: IOError -> IO ()
handler e
  | isDoesNotExistError e =
    case ioeGetFileName e of Just path -> putStrLn $ "Whoops! File does not exist at: " ++ path
                             Nothing -> putStrLn "Whoops! File does not exist at unknown location!"
  | otherwise = ioError e

-- ➜  hello-haskell git:(master) ✗ stack runghc count_lines.hs todo.txt
-- The file has 1 lines!
-- ➜  hello-haskell git:(master) ✗ stack runghc count_lines.hs todo-notexist.txt
-- Whoops! File does not exist at: todo-notexist.txt
