{-# LANGUAGE BangPatterns, MagicHash #-}
module Fields.F2m.Types
    ( Polynomial(..)
    , fromPows
    , ckSmallInt
    , unit
    ) where

import GHC.Base
import Data.Primitive.ByteArray
import GHC.Integer.GMP.Internals
import Control.Monad.ST
import Control.Monad
import Data.List
import Data.Bits

data Polynomial = Polynomial !ByteArray !Integer

fromPows :: [Int] -> Polynomial
fromPows pows = Polynomial ba intrep where
    sz = length pows
    intrep = ckSmallInt $ foldl' setBit 0 pows
    ba = runST $ do
        arr <- newByteArray (sz*8)
        zipWithM_ (\i c -> writeByteArray arr i c) [0..] pows
        unsafeFreezeByteArray arr

ckSmallInt :: Integer -> Integer
ckSmallInt (S# s#) = (J# 1# b) where
    !(ByteArray b) = runST $ do 
        arr <- newByteArray 8
        writeByteArray arr 0 (I# s#)
        unsafeFreezeByteArray arr
ckSmallInt j@(J# _ _) = j

unit :: Integer
unit = ckSmallInt 1
