
-- those functions have value that does not change it parameter/result
-- ghci> 4 * 1
-- 4
-- ghci> 1 * 9
-- 9
-- ghci> [1,2,3] ++ []
-- [1,2,3]
-- ghci> [] ++ [0.5, 2.5]
-- [0.5,2.5]

-- the order of operations doesn't matter
-- ghci> (3 * 2) * (8 * 5)
-- 240
-- ghci> 3 * (2 * (8 * 5))
-- 240
-- ghci> "la" ++ ("di" ++ "da")
-- "ladida"
-- ghci> ("la" ++ "di") ++ "da"
-- "ladida"


-- it's called ASSOCIATIVITY

-- Monoid  - associative binary function and value that acts as identity when passed to that function

class Monoid m where
  mempty :: m
  mappend :: m -> m -> m
  mconcat :: [m] -> m
  mconcat = foldr mappend mempty






--
