

data SimplePerson = SimplePerson String String Int Float String String deriving (Show)

guy = SimplePerson "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"

firstName :: SimplePerson -> String
firstName (SimplePerson firstname _ _ _ _ _ _) = lastname

lastName :: SimplePerson -> String
lastName (SimplePerson _ lastname _ _ _ _) = lastname

age :: SimplePerson -> Int
age (SimplePerson _ _ age _ _ _) = age

height :: SimplePerson -> Int
height (SimplePerson _ _ _ height _ _) = height

phoneNumber :: SimplePerson -> String
phoneNumber (SimplePerson _ _ _ _ number _) = number

flavor :: SimplePerson -> String
flavor (SimplePerson _ _ _ _ _ flavor) = flavor

-- firstName guy
-- "Buddy"








--
