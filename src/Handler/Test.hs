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
    renderWithParams <- getUrlRenderParams
    setMessage $
        toHtml
            ("We can also use a different function to render a route with params" ++
             renderWithParams TestR [("foo", "bar")])
    redirect HomeR
