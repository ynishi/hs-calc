{-# LANGUAGE OverloadedStrings #-}
module Calc(readXs, (.:)) where

import qualified Data.Text as T
import Data.String.Conversions

normalise = T.concat . T.splitOn ","

readXs :: String -> [Int]
readXs = map (read . convertString . normalise . convertString) . words

-- (.:) :: ([Int] -> a) -> String -> a
f .: a = f . readXs $ a

avg :: [Int] -> Float
avg xs = total / size 
  where
    total = fromIntegral . sum $ xs
    size = fromIntegral . length $ xs

avg' :: [Int] -> Int
avg' xs = total `div` size 
  where
    total = sum xs
    size = length xs

