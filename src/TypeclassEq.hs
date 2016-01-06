

class Eq a where
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool
  x == y = not (x /= y)
  x /= y = not (x == y)

data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
  Red == Red = True
  Green == Green = True
  Yellow == Yellow = True
  _ == _ = False


instance Show TrafficLight where
  show Red = "Red light"
  show Yellow = "Yellow light"
  show Green = "Green light"

-- ghci> Red == Red
-- True
-- ghci> Red == Yellow
-- False
-- ghci> Red `elem` [Red, Yellow, Green]
-- True
-- ghci> [Red, Yellow, Green]
-- [Red light,Yellow light,Green light]

instance (Eq m) => Eq (Maybe m) where
  Just x == Just y = x == y
  Nothing == Nothing = True
  _ == _ = False



-- use :info in ghci
-- :info Maybe
-- data Maybe a = Nothing | Just a 	-- Defined in ‘GHC.Base’
-- instance Eq a => Eq (Maybe a) -- Defined in ‘GHC.Base’
-- instance Monad Maybe -- Defined in ‘GHC.Base’
-- instance Functor Maybe -- Defined in ‘GHC.Base’
-- instance Ord a => Ord (Maybe a) -- Defined in ‘GHC.Base’
-- instance Read a => Read (Maybe a) -- Defined in ‘GHC.Read’
-- instance Show a => Show (Maybe a) -- Defined in ‘GHC.Show’
-- instance Applicative Maybe -- Defined in ‘GHC.Base’
-- instance Foldable Maybe -- Defined in ‘Data.Foldable’
-- instance Traversable Maybe -- Defined in ‘Data.Traversable’
-- instance Monoid a => Monoid (Maybe a) -- Defined in ‘GHC.Base’








-- *Main> :info Eq
-- class Eq a where
--   (==) :: a -> a -> Bool
--   (/=) :: a -> a -> Bool
--   	-- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b) => Eq (Either a b)
--   -- Defined in ‘Data.Either’
-- instance Eq Integer
--   -- Defined in ‘integer-gmp-1.0.0.0:GHC.Integer.Type’
-- instance Eq a => Eq [a]
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance Eq Word -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance Eq Ordering -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance Eq Int -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance Eq Float -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance Eq Double -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance Eq Char -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance Eq Bool -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h, Eq i,
--           Eq j, Eq k, Eq l, Eq m, Eq n, Eq o) =>
--          Eq (a, b, c, d, e, f, g, h, i, j, k, l, m, n, o)
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h, Eq i,
--           Eq j, Eq k, Eq l, Eq m, Eq n) =>
--          Eq (a, b, c, d, e, f, g, h, i, j, k, l, m, n)
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h, Eq i,
--           Eq j, Eq k, Eq l, Eq m) =>
--          Eq (a, b, c, d, e, f, g, h, i, j, k, l, m)
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h, Eq i,
--           Eq j, Eq k, Eq l) =>
--          Eq (a, b, c, d, e, f, g, h, i, j, k, l)
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h, Eq i,
--           Eq j, Eq k) =>
--          Eq (a, b, c, d, e, f, g, h, i, j, k)
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h, Eq i,
--           Eq j) =>
--          Eq (a, b, c, d, e, f, g, h, i, j)
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h, Eq i) =>
--          Eq (a, b, c, d, e, f, g, h, i)
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g, Eq h) =>
--          Eq (a, b, c, d, e, f, g, h)
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f, Eq g) =>
--          Eq (a, b, c, d, e, f, g)
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b, Eq c, Eq d, Eq e, Eq f) =>
--          Eq (a, b, c, d, e, f)
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b, Eq c, Eq d, Eq e) => Eq (a, b, c, d, e)
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b, Eq c, Eq d) => Eq (a, b, c, d)
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b, Eq c) => Eq (a, b, c)
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance (Eq a, Eq b) => Eq (a, b)
--   -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance Eq () -- Defined in ‘ghc-prim-0.4.0.0:GHC.Classes’
-- instance Eq a => Eq (Maybe a) -- Defined in ‘GHC.Base’
