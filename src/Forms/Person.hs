{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module Forms.Person where

import Import
import Types.Person (Person(..))

-- some fields
nameField = textField

ageField = check validateYear $ checkM validateNotInFuture intField

-- some validations
validateYear :: (Ord a, Num a) => a -> Either Text a
validateYear year
    | year < 1990 = Left "You are too old!"
    | otherwise = Right year

validateNotInFuture :: Int -> Handler (Either Text Int)
validateNotInFuture year = do
    thisYear <- liftIO getCurrrentYear
    return $
        if year > thisYear
            then Left "You have a time machine"
            else Right year

getCurrrentYear :: IO Int
getCurrrentYear = do
    now <- getCurrentTime
    let today = utctDay now
        (year, _, _) = toGregorian today
    return $ fromInteger year

-- some forms
nameForm = areq nameField "Name" Nothing

ageForm = areq ageField "Year" Nothing

-- another form composed of smaller forms
personForm :: AForm Handler Person
personForm = Person <$> nameForm <*> ageForm
