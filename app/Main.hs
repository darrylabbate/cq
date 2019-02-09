{-# LANGUAGE OverloadedStrings #-}

module Main where

import           CryptoCompare      (fetchSinglePrice)
import           Data.Char          (toUpper)
import           System.Environment (getArgs)

cqVersion = "0.1"

main :: IO ()
main = getArgs >>= parse

parse ["-h"]        = usage
parse ["--help"]    = usage
parse ["help"]      = usage
parse ["-v"]        = version
parse ["--version"] = version
parse ["version"]   = version
parse [x]           = fetchSinglePrice $ map toUpper x
parse []            = fetchSinglePrice "BTC"

usage :: IO ()
usage = putStrLn "Usage: cq [cryptocrrency symbol]"

version :: IO ()
version = putStrLn $ "cq " ++ cqVersion
