{-# LANGUAGE OverloadedStrings #-}

module Main where

import           CryptoCompare      (fetchSinglePrice)
import qualified Data.Text.IO       as T (putStrLn)
import           System.Environment (getArgs)

version = "0.1"

main :: IO ()
main = getArgs >>= parse

parse ["-v"]        = T.putStrLn version
parse ["--version"] = T.putStrLn version
parse ["version"]   = T.putStrLn version
parse _             = returnPrice

returnPrice :: IO ()
returnPrice = fetchSinglePrice
