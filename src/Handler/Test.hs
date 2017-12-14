{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Test where

import Import
import Types.Natural (Natural, natToInt)

getTestR :: Natural -> Handler ()
getTestR natural = do
    setMessage $ toHtml ("You showed me: " ++ show (natToInt natural))
    redirect HomeR
