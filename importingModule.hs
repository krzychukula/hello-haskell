import Data.List
-- import Data.List (nub, sort)
-- only those functions

-- import Data.List hiding (nub)
-- hiding those functions

-- import qualified Data.Map
-- Data.Map.filter
-- import qualified Data.Map as M
-- M.filter

import qualified Data.Map as Map

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

-- tricky union:
ures = "hey man" `union` "man what's up"
-- "hey manwt'sup"

-- gropu is the same as groupBy (==)


-- Data.Char

-- all isAlphaNum "bobby283"

myWordsWithSpaces = groupBy ((==) `on` isSpace)
-- works a litttle like words function

myWords = filter (not . any isSpace) . myWordsWithSpaces
-- should filter spaces

-- generalCategory ' '
-- Space

-- Caesar cipher

encode :: Int -> String -> String
encode shift msg =
  let ords = map ord msg
      shifted = map (+ shift) ords
  in map chr shifted

-- encode 3 "Heeeeey"
-- "Khhhhh|"

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg
-- just like: encode (-3) "Khhhhh|"


-- Data.Map
phoneBook =
  [("betty","555-1234")
  ,("bonnie","555-2345")
  .("patsy","555-3456")
  ]

findKey0 :: (Eq k) => k -> [(k,v)] -> v
findKey0 key xs = snd . head . filter (\(k,v) -> kye == k) $ xs
-- but it has problem if key is not found

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key [] = Nothing
finkKey key ((k,v):xs) = if key == k
                            then Just v
                            else finkKey key xs


findKeyAsFold :: (Eq k) => k -> [(k,v)] -> Maybe v
findKeyAsFold key = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing

-- findKey is lookup function from Data.List

-- import qualified Data.Map as Map

-- add: containers in build-depends
-- build-depends:       base >= 4.7 && < 5
--                     , containers -- <= ココ！
-- thanks to: http://qiita.com/igrep/items/da1d8df6d40eb001a561

-- Map.fromList [(1,2),(3,4),(3,2),(5,5)]
-- fromList [(1,2),(3,2),(5,5)]

-- empty map: Map.empty
-- fromList []

-- if you just import:
-- insert 3 100 empty
-- fromList [(3,100)]


fromList' :: (Ord k) => [(k,v)] -> Map.Map k v
fromList' = foldr (\(k,v) acc -> Map.insert k v acc) Map.empty

truish = Map.null Map.empty
falsy = Map.null $ Map.fromList [(2,3),(5,5)]

-- Map.size Map.empty
-- Map.size $ Map.fromList [(2,3)]
-- 1

-- singleton 3 9
-- fromList [(3,9)]

-- Map.member 3 $ Map.fromList [(3,6),(4,3),(6,9)]
-- True

-- keys = map fst . Map.toList
-- elems = map snd . Map.toList


phoneBookWithDuplicates =
    [("betty","555-2938")
    ,("betty","342-2492")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("patsy","943-2929")
    ,("patsy","827-9162")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ,("penny","555-2111")
    ]

phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String
phoneBookToMap xs = Map.fromListWith (\number1 number 2 -> number1 ++ ", " ++ number2) xs

-- Map.lookup "patsy" $ phoneBookToMap phoneBookWithDuplicates
-- "827-9162, 943-2929, 493-2928"

phoneBookToM :: (Ord k) => [(k,a)] -> Map.Map k [a]
phoneBookToM xs = Map.fromListWith (++) $ map (\(k,v) -> (k,[v])) xs

-- Map.lookup "patsy" $ phoneBookToM phoneBook
-- ["827-9162","943-2929","493-2928"]


-- Map.fromListWith max [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]
-- fromList [(2,100),(3,29),(4,22)]

-- Map.fromListWith (+) [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]
-- fromList [(2,108),(3,62),(4,37)]






 ---
