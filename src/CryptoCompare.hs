{-# LANGUAGE OverloadedStrings #-}

module CryptoCompare (fetchSinglePrice) where

import           Control.Lens
import           Data.Aeson
import           Data.Aeson.Lens
import           Network.Wreq

priceURL :: String -> String
priceURL x = "https://min-api.cryptocompare.com/data/price?fsym=" ++ x ++ "&tsyms=USD"

fetchSinglePrice :: String -> IO ()
fetchSinglePrice x = do
  let opts = defaults
  r <- getWith opts $ priceURL x
  putStrLn $ x ++ ": $" ++ show
    ( r ^?! responseBody
    . key "USD"
    . _Number
    )
