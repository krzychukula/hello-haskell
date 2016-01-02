module Record
    ( Person(..)
    , mca
    , adRock
    , mikeD
    ) where


data SimplePerson = SimplePerson String String Int Float String String deriving (Show)

guy = SimplePerson "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"

-- firstName :: SimplePerson -> String
-- firstName (SimplePerson firstname _ _ _ _ _ _) = lastname
--
-- lastName :: SimplePerson -> String
-- lastName (SimplePerson _ lastname _ _ _ _) = lastname
--
-- age :: SimplePerson -> Int
-- age (SimplePerson _ _ age _ _ _) = age
--
-- height :: SimplePerson -> Int
-- height (SimplePerson _ _ _ height _ _) = height
--
-- phoneNumber :: SimplePerson -> String
-- phoneNumber (SimplePerson _ _ _ _ number _) = number
--
-- flavor :: SimplePerson -> String
-- flavor (SimplePerson _ _ _ _ _ flavor) = flavor

-- firstName guy
-- "Buddy"

-- data Person = Person {  firstName :: String
--                       , lastName :: String
--                       , age :: Int
--                       , height :: Float
--                       , phoneNumber :: String
--                       , flavor :: String
--                      } deriving (Show)



-- data CarOne = CarOne { company :: String
--                 , model :: String
--                 , year :: Int
--                 } deriving (Show)

-- > Car {company="Ford", model="Mustang", year=1967}
-- Car {company = "Ford", model = "Mustang", year = 1967}


-- Type Parameters


data Maybe a = Nothing | Just a

data Car a b c = Car { company :: a
                      , model :: b
                      , year :: c
                    } deriving (Show)

-- tellCarOne :: CarOne -> String
-- tellCarOne (Car {company = c, model = m, year = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y
--
-- ghci> let stang = Car {company="Ford", model="Mustang", year=1967}
-- ghci> tellCar stang
-- "This Ford Mustang was made in 1967"

tellCar :: (Show a) => Car String String a -> String
tellCar (Car {company = c, model = m, year = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y


-- ghci> tellCar (Car "Ford" "Mustang" 1967)
-- "This Ford Mustang was made in 1967"


data Vector a = Vector a a a deriving (Show)

vplus :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)

vectMult :: (Num t) => Vector t -> t -> Vector t
(Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)

scalarMult :: (Num t) => Vector t -> Vector t -> t
(Vector i j k) `scalarMult` (Vector l m n) = i*l + j*m + k*n

-- ghci> Vector 3 5 8 `vplus` Vector 9 2 8
-- Vector 12 7 16
-- ghci> Vector 3 5 8 `vplus` Vector 9 2 8 `vplus` Vector 0 2 3
-- Vector 12 9 19
-- ghci> Vector 3 9 7 `vectMult` 10
-- Vector 30 90 70
-- ghci> Vector 4 9 5 `scalarMult` Vector 9.0 2.0 4.0
-- 74.0
-- ghci> Vector 2 9 3 `vectMult` (Vector 4 9 5 `scalarMult` Vector 9 2 4)
-- Vector 148 666 222


-- Derived Instances

data Person = Person { firstName :: String
                      , lastName :: String
                           , age :: Int
                     } deriving (Eq, Show, Read)


mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 43}
adRock = Person {firstName = "Adam", lastName = "Horovitz", age = 41}
mca = Person {firstName = "Adam", lastName = "Yauch", age = 44}

-- Record.mca == Record.adRock
-- False
-- mikeD == Person {firstName = "Michael", lastName = "Diamond", age = 43}
-- True

-- mikeD
-- Person {firstName = "Michael", lastName = "Diamond", age = 43}

-- ghci> read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" :: Person
-- Person {firstName = "Michael", lastName = "Diamond", age = 43}




--
