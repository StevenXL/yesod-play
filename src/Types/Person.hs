module Types.Person where

import Import

data Person = Person
    { name :: Text
    , age :: Int
    } deriving (Show)
