{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Test where

import Import

getTestR :: Handler Html
getTestR =
    defaultLayout $
    [whamlet|
      <form method=post action=@{TestR}>
        My name is #
        <input type=text name=name>
        <input type=submit value="Set name">
    |]

-- what we need to do here is run teh form so we can extract the parameters
-- and set them in teh session, then redirect to say hello
postTestR :: Handler ()
postTestR = do
    name <- runInputPost $ ireq textField "name"
    setSession "name" name
    redirectUltDest HelloR
