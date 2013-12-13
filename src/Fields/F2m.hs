{-# LANGUAGE MagicHash, UnboxedTuples, BangPatterns #-}
module Fields.F2m 
    ( f2m_mul
    , f2m_exp
    , f2m_inv
    , f2m_sqr
    , fromPows
    , Polynomial
    ) where

import Fields.F2m.Types
import Fields.F2m.Prim
import GHC.Base -- Int and I#
import Control.Monad.ST
import Control.Monad
import GHC.Integer.GMP.Internals -- J# and S#
import Data.Primitive.ByteArray
import Data.List
import Data.Bits

lzCount :: Word -> Int
lzCount (W# a) = I# (word2Int# (lzcnt# a))

topSetBit :: Integer -> Int
topSetBit (J# sz# ba#) = sz * 64 - go 0 where
    sz = I# sz#
    ba = ByteArray ba#
    go n | n < sz = if lzn == 64 then go (n+1) else 64 * n + lzn
         | otherwise = 64 * n where
        lzn = lzCount $ indexByteArray ba (sz - 1 - n)

f2m_inv :: Integer -> Polynomial -> Integer
f2m_inv x' p'@(Polynomial _ !(J# psz pba)) = J# s b where
    !(J# xsz xba) = f2m_mod (ckSmallInt x') p'
    !(J# _ unitarr#) = unit
    (# s, b #) = f2m_div# 1# unitarr# xsz xba psz pba

f2m_div :: Integer -> Integer -> Polynomial -> Integer
f2m_div y' x' p'@(Polynomial _ !(J# psz pba)) = J# s b where
    !(J# xsz xba) = f2m_mod (ckSmallInt x') p'
    !(J# ysz yba) = f2m_mod (ckSmallInt y') p'
    (# s, b #) = f2m_div# ysz yba xsz xba psz pba

f2m_mod :: Integer -> Polynomial -> Integer
f2m_mod a' (Polynomial (ByteArray p) _) = J# sr br where
    !(J# sa# ba#) = ckSmallInt a'
    (# sr, br #) = f2m_mod# sa# ba# p

f2m_exp :: Integer -> Integer -> Polynomial -> Integer
f2m_exp a' e' pp = r where
    a = ckSmallInt a'
    e = ckSmallInt e'
    topbit = topSetBit e
    r = snd $ foldl' step (a,1) [0..topbit-1]
    step (sqr, ax) i = if testBit e i then (sqr', f2m_mul ax sqr pp) else (sqr', ax) where
        sqr' = f2m_sqr sqr pp

f2m_mul :: Integer -> Integer -> Polynomial -> Integer
f2m_mul a' b' (Polynomial (ByteArray pp) _) = J# sr br where
    !(J# sa# ba#) = ckSmallInt a'
    !(J# sb# bb#) = ckSmallInt b'
    (# sr, br #) = f2m_mod# sr'# br' pp
    sa = I# sa#
    ba = ByteArray ba#
    sb = I# sb#
    bb = ByteArray bb#
    !sr'@(I# sr'#) = sa + sb + 4
    !(ByteArray br') = runST $ do
        arr <- newByteArray (sr' * 8)
        setByteArray arr 0 sr' (0 :: Word)
        forM_ [0,2..sa-1] $ \j -> do
            let !(W# a0) = indexByteArray ba j
                !(W# a1) = if j + 2 <= sa then indexByteArray ba (j + 1) else 0
            forM_ [0,2..sb-1] $ \i -> do
                let !(W# b0) = indexByteArray bb i
                    !(W# b1) = if i + 2 <= sb then indexByteArray bb (i + 1) else 0
                    !(# r1#, r0# #) = f2m_mul1x1# a0 b0
                    !(# r3#, r2'# #) = f2m_mul1x1# a1 b1
                    !(# m1#, m0# #) = f2m_mul1x1# (a1 `xor#` a0) (b1 `xor#` b0)
                    r2# = r2'# `xor#` m1# `xor#` r1# `xor#` r3#
                    r3 = W# r3#
                    r2 = W# r2#
                    r1 = W# (r3# `xor#` r2# `xor#` r0# `xor#` m1# `xor#` m0#)
                    r0 = W# r0#
                d0 <- readByteArray arr (i+j)
                writeByteArray arr (i+j) (d0 `xor` r0)
                d1 <- readByteArray arr (i+j+1)
                writeByteArray arr (i+j+1) (d1 `xor` r1)
                d2 <- readByteArray arr (i+j+2)
                writeByteArray arr (i+j+2) (d2 `xor` r2)
                d3 <- readByteArray arr (i+j+3)
                writeByteArray arr (i+j+3) (d3 `xor` r3)
        unsafeFreezeByteArray arr

f2m_sqr :: Integer -> Polynomial -> Integer
f2m_sqr a' (Polynomial (ByteArray pp) _) = J# sr br where
    !(J# sa ba) = ckSmallInt a'
    (# sr, br #) = f2m_mod# sr' br' pp
    (# sr', br' #) = f2m_sqr# sa ba
