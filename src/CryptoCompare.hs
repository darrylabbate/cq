{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module CryptoCompare where

import           Control.Lens
import           Data.Aeson
import           Data.Aeson.Lens
import qualified Data.ByteString.Lazy as BL
import           Data.Text
import           GHC.Generics
import           Network.Wreq

priceURL :: String
priceURL = "https://min-api.cryptocompare.com/data/price"

fetchSinglePrice :: IO ()
fetchSinglePrice = do
  let opts = defaults
           & param "fsym" .~ ["BTC"]
           & param "tsyms" .~ ["USD"]
           & param "extraParams" .~ ["cq"]
  r <- getWith opts priceURL
  putStrLn $ "BTC: $" ++ show
    ( r ^?! responseBody
    . key "USD"
    . _Number
    )
