-- stack ghc helloworld
-- [1 of 1] Compiling Main             ( helloworld.hs, helloworld.o )
-- Linking helloworld ...
-- ./helloworld
-- hello, world

-- fastest way to run: `stack runghc helloworld.hs`

main = do
  putStrLn "what's your name?"
  name <- getLine
  putStrLn ("Hey " ++ name ++ "!")



-- stack ghc helloworld
-- [1 of 1] Compiling Main             ( helloworld.hs, helloworld.o )
-- Linking helloworld ...
-- ➜  hello-haskell git:(master) ✗ ./helloworld
-- what's your name?
-- Krzychu
-- Hey Krzychu!
