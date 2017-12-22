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

ageField = intField

-- some forms
nameForm = areq nameField "Name" Nothing

ageForm = areq ageField "Year" Nothing

-- another form composed of smaller forms
personForm :: AForm Handler Person
personForm = Person <$> nameForm <*> ageForm
