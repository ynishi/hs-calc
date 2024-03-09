module Main (main) where

import Test.Tasty
import Test.Tasty.SmallCheck as SC
import Test.Tasty.HUnit

import Calc

main = defaultMain tests

tests = testGroup "Tests" [properties, unitTests]

properties = testGroup "Properties" [scProps]

scProps = testGroup "(SmallCheck)"
  [ SC.testProperty "sample" $ 
     \(xs::[Int]) -> xs == (reverse . reverse $ xs)
     ]

unitTests = testGroup "Unit tests"
  [
    testCase "readXs" $
      readXs "1,000 200" @?= [1000, 200],
    testCase ".:" $
      sum .: "1,000 200" @?= 1200
  ]
