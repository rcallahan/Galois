{-# LANGUAGE ForeignFunctionInterface, GHCForeignImportPrim, MagicHash, UnboxedTuples, UnliftedFFITypes, NoImplicitPrelude #-}

module Fields.F2m.Prim
    ( lzcnt#
    , f2m_div#
    , f2m_mod#
    , f2m_sqr#
    , f2m_mul1x1#
    ) where

import GHC.Base

foreign import prim "cmm_lzcnt" lzcnt#
    :: Word# -> Word#
foreign import prim "gf2m_cmm_div" f2m_div#
    :: Int# -> ByteArray# -> Int# -> ByteArray# -> Int# -> ByteArray# -> (# Int#,  ByteArray# #)
foreign import prim "gf2m_cmm_sqr1" f2m_sqr1#
    :: Word# -> (# Word#, Word# #)
foreign import prim "gf2m_cmm_mul1x1" f2m_mul1x1#
    :: Word# -> Word# -> (# Word#, Word# #)
foreign import prim "gf2m_cmm_mod" f2m_mod#
    :: Int# -> ByteArray# -> ByteArray# -> (# Int#,  ByteArray# #)
foreign import prim "gf2m_cmm_sqr" f2m_sqr#
    :: Int# -> ByteArray# -> (# Int#,  ByteArray# #)
