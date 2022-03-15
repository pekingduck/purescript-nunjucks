module Nunjucks.Environment
  ( Environment
  , EnvironmentOpts
  , defaultEnvironment
  , defaultEnvironmentOpts
  , makeEnvironment
  , render
  ) where

import Effect (Effect)
import Nunjucks.Loader (Loader)

type EnvironmentOpts
  = { autoescape :: Boolean
    , throwOnUndefined :: Boolean
    , trimBlocks :: Boolean
    , lstripBlocks :: Boolean
    }

defaultEnvironmentOpts :: EnvironmentOpts
defaultEnvironmentOpts =
  { autoescape: true
  , throwOnUndefined: false
  , trimBlocks: false
  , lstripBlocks: false
  }

foreign import data Environment :: Type

foreign import defaultEnvironment :: Environment

foreign import makeEnvironment :: Array Loader -> EnvironmentOpts -> Environment

foreign import render :: forall row. Environment -> String -> { | row } -> Effect String

-- makeEnvironment :: Array Loader -> EnvironmentOpts -> Environment
-- makeEnvironment loaders opts = makeEnvironment_ (go <$> loaders) opts
--   where
--   go :: forall row. Loader -> { | row }
--   go (FileSystemLoader paths fopts) = unsafeCoerce $ makeFileSystemLoader paths fopts
--   go (WebLoader url wopts) = unsafeCoerce $ makeWebLoader url wopts
--   go (NodeResolveLoader nopts) = unsafeCoerce $ makeNodeResolveLoader nopts
