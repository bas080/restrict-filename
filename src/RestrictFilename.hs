module RestrictFilename where

import Data.Char (toLower)
import RestrictFilenameArgs

restrictedChars =
  ['a' .. 'z'] ++ ['A' .. 'Z'] ++ ['0' .. '9'] ++ ['_', '-', '.']

isValidChar :: Char -> Bool
isValidChar v = v `elem` restrictedChars

lowercased :: String -> String
lowercased = map toLower

remappedChar :: RestrictFilenameArgs -> Char -> Char
remappedChar args ' ' = head $ replacement args
remappedChar _ v = v

when :: Bool -> (a -> a) -> a -> a
when bool fn value =
  if bool
    then fn value
    else value

whenNot :: Bool -> (a -> a) -> a -> a
whenNot bool = when (not bool)

restrictedFilename :: RestrictFilenameArgs -> String
restrictedFilename args =
  when (lowercase args) (map toLower) .
  whenNot (specialCharacter args) (filter isValidChar) .
  whenNot (whitespace args) (map (remappedChar args)) $
  filename args
