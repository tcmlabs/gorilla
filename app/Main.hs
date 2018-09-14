{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Lib
import           Prelude                 hiding ( FilePath )
import           Turtle

parser :: Parser FilePath
parser = optPath "flake8Path" 'f' "Flake8 path"

main :: IO ()
main = do
  flake8Path <- options "Static code analyzer" parser
  sh $ do
    output <- inshell (format fp flake8Path <> " **/*.py") stdin
    liftIO $ print output
