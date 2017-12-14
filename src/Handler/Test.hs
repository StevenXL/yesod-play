{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Test where

import Import

getTestR :: Handler ()
getTestR = do
    setMessage $
        toHtml ("Hello. I am testing setting / getting messages" :: String)
    redirect HomeR
