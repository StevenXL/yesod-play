{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Test where

import Import
import Types.Natural (Natural, natToInt)

getTestR :: Handler ()
getTestR = do
    master <- getYesod
    setMessage $ toHtml ("You showed me: " ++ show master)
    redirect HomeR
