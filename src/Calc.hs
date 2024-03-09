{-# LANGUAGE OverloadedStrings #-}
module Calc(readXs, (.:)) where

import qualified Data.Text as T
import Data.String.Conversions

normalise = T.concat . T.splitOn ","

readXs :: String -> [Int]
readXs = map (read . convertString . normalise . convertString) . words

(.:) :: ([Int] -> a) -> String -> a
f .: a = f . readXs $ a
