module Main where

import Calc
import Text.Printf

main :: IO ()
main = do
  let n = sum .: "1,000 200"
  putStrLn $ printf "Hello, %d" n
