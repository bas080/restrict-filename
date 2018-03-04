module Main where

import RestrictFilename
import RestrictFilenameArgs
import System.Console.CmdArgs
import System.Environment (getArgs)

main :: IO ()
main = putStrLn . restrictedFilename =<< cmdArgs restrictFilenameArgs
