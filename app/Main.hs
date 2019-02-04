{-# LANGUAGE OverloadedStrings #-}

module Main where

import           CryptoCompare
import qualified Data.Text.IO       as T
import           System.Environment

version = "0.1.0"

main :: IO ()
main = getArgs >>= parse

parse ["-v"]        = T.putStrLn version
parse ["--version"] = T.putStrLn version
parse ["version"]   = T.putStrLn version
parse _             = returnPrice

returnPrice :: IO ()
returnPrice = fetchSinglePrice
