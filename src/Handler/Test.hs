{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Test where

import Forms.Person (personForm)
import Import

getTestR :: Handler Html
getTestR = do
    (widget, enctype) <- generateFormPost $ renderBootstrap2 personForm
    defaultLayout
        [whamlet|
          <form method=post action=@{TestR} enctype={enctype}>
            ^{widget}
            <button>Submit
        |]

postTestR :: Handler Html
postTestR = do
    ((result, widget), _) <- runFormPost $ renderDivs personForm
    case result of
        FormSuccess person -> defaultLayout [whamlet|<p>#{show person}|]
        _ ->
            defaultLayout
                [whamlet|
                           <p>something went wrong
                           <form method=post action=@{TestR} enctype={enctype}>
                             ^{widget}
                             <button>Submit
                           |]
