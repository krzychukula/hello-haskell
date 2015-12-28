import Data.List
-- import Data.List (nub, sort)
-- only those functions

-- import Data.List hiding (nub)
-- hiding those functions

-- import qualified Data.Map
-- Data.Map.filter
-- import qualified Data.Map as M
-- M.filter

import Data.List

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

monkey = intersperse '.' "MONKEY"
-- "M.O.N.K.E.Y"

joinedList = intercalate " " ["hey","there","guys"]
-- "hey there guys"

transposed = transpose [[1,2,3],[4,5,6],[7,8,9]]
-- [[1,4,7],[2,5,8],[3,6,9]]

-- Say we have the polynomials 3x2 + 5x + 9, 10x3 + 9 and 8x3 + 5x2 + x - 1 and we want to add them together.
 -- We can use the lists [0,3,5,9], [10,0,0,9] and [8,5,1,-1] to represent them in Haskell.
added = map sum $ transpose [[0,3,5,9],[10,0,0,9],[8,5,1,-1]]
-- [18,8,6,17]

-- Strict versions (not lazy)
-- foldl' and foldl1' - they don't use promises

joined = concat ["foo", "bar"]
--foobar









 ---
