{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Hello where

import Import

getHelloR :: Handler Html
getHelloR = do
    mname <- lookupSession "name"
    case mname of
        Nothing -> do
            setUltDestCurrent
            setMessage "Please insert your name"
            redirect TestR
        Just name -> defaultLayout [whamlet|<p>Hello #{name}|]
