{-# LANGUAGE DeriveDataTypeable #-}

module RestrictFilenameArgs where

import System.Console.CmdArgs

data RestrictFilenameArgs = RestrictFilenameArgs
  { whitespace :: Bool
  , replacement :: String
  , specialCharacter :: Bool
  , filename :: String
  , lowercase :: Bool
  } deriving (Typeable, Data, Show, Eq)

-- TODO: make better argument names
restrictFilenameArgs :: RestrictFilenameArgs
restrictFilenameArgs =
  RestrictFilenameArgs
  { whitespace = False &= help "disable whitespace replacement"
  , replacement = "_" &= help "change replacement character"
  , specialCharacter = False &= help "disable special characters removal"
  , lowercase = False &= help "enable lowercasing"
  , filename = "" &= args &= typ "STRING"
  }
