{-# LANGUAGE OverloadedStrings #-}

module Main where

import           CryptoCompare      (fetchSinglePrice)
import           Data.Char          (toUpper)
import           System.Environment (getArgs)

version = "0.1"

main :: IO ()
main = getArgs >>= parse

parse ["-v"]        = putStrLn version
parse ["--version"] = putStrLn version
parse ["version"]   = putStrLn version
parse [x]           = fetchSinglePrice $ map toUpper x
parse []            = fetchSinglePrice "BTC"
