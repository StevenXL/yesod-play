{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Test where

import Import

myWidget1 :: WidgetT App IO () -- Widget would have also worked!
myWidget1 = do
    toWidget [hamlet|<h1>A Title|]
    toWidget [lucius|h1 {color: green}|]

myWidget2 :: Widget
myWidget2 = do
    setTitle "My Page Title"

getTestR :: Handler Html
getTestR =
    defaultLayout $ do
        myWidget1
        myWidget2
