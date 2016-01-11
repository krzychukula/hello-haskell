-- Our program will be made so that if we want to add the task Find the magic
-- sword of power to the file todo.txt, we have to punch in todo add todo.txt
-- "Find the magic sword of power" in our terminal.
-- To view the tasks we'll just do todo view todo.txt and to remove the task
-- with the index of 2, we'll do todo remove todo.txt 2.

import System.Environment
import System.Directory
import System.IO
import Data.List

dispatch :: [(String, [String] -> IO ())]
dispatch = [ ("add", add)
            ,("view", view)
            ,("remove", remove)
            ]

main = do
  (command:args) <- getArgs
  let (Just action) = lookup command dispatch
  action args

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")

view :: [String] -> IO ()
view [fileName] = do
  contents <- readFile fileName
  let todoTasks = lines contents
      numberedTasks = zipWith (\n line -> show n ++ " - " ++ line) [0..] todoTasks
  putStr $ unlines numberedTasks

remove :: [String] -> IO ()
remove [fileName, numberString] = do
  handle <- openFile fileName ReadMode
  (tempName, tempHandle) <- openTempFile "." "temp"
  contents <- hGetContents handle
  let number = read numberString
      todoTasks = lines contents
      newTodoItems = delete (todoTasks !! number) todoTasks
  hPutStr tempHandle $ unlines newTodoItems
  hClose handle
  hClose tempHandle
  removeFile fileName
  renameFile tempName fileName


  -- ➜  hello-haskell git:(master) ✗ stack ghc todo.hs
  -- [1 of 1] Compiling Main             ( todo.hs, todo.o )
  -- Linking todo ...
  -- ➜  hello-haskell git:(master) ✗ ./todo view todo.txt
  -- ➜  hello-haskell git:(master) ✗ cat todo.txt
  -- ➜  hello-haskell git:(master) ✗ ./todo add todo.txt "Read about Haskell"
  -- ➜  hello-haskell git:(master) ✗ ./todo view todo.txt
  -- 0 - Read about Haskell
  -- ➜  hello-haskell git:(master) ✗ ./todo add todo.txt "Finish chapter 9"
  -- ➜  hello-haskell git:(master) ✗ ./todo view todo.txt
  -- 0 - Read about Haskell
  -- 1 - Finish chapter 9
  -- ➜  hello-haskell git:(master) ✗ ./todo remove todo.txt 0
  -- ➜  hello-haskell git:(master) ✗ ./todo view todo.txt
  -- 0 - Finish chapter 9
