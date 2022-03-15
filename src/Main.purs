module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Nunjucks.Environment (makeEnvironment, render, defaultEnvironmentOpts)
import Nunjucks.Loader (defaultFileSystemLoaderOpts, Loader(..))

main :: Effect Unit
main = do
  let
    fileLoader = FileSystemLoader [ ".", "inc" ] defaultFileSystemLoaderOpts

    env = makeEnvironment [ fileLoader ] defaultEnvironmentOpts
  res <- render env "tmpl.html" { a: { id: 99999 } }
  log res
