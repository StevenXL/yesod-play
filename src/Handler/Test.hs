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
    renderFunction <- getUrlRender
    setMessage $
        toHtml
            ("TestR is a data constant which can be turned into the following url: " ++
             renderFunction TestR)
    redirect HomeR
