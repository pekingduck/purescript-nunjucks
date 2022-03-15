module Nunjucks.Loader
  ( Loader(..)
  , FileSystemLoaderOpts
  , WebLoaderOpts
  , NodeResolveLoaderOpts
  , defaultFileSystemLoaderOpts
  , defaultNodeResolveLoaderOpts
  , defaultWebLoaderOpts
  ) where

type FileSystemLoaderOpts
  = { watch :: Boolean, noCache :: Boolean }

defaultFileSystemLoaderOpts :: FileSystemLoaderOpts
defaultFileSystemLoaderOpts = { watch: false, noCache: false }

type NodeResolveLoaderOpts
  = FileSystemLoaderOpts

defaultNodeResolveLoaderOpts :: NodeResolveLoaderOpts
defaultNodeResolveLoaderOpts = defaultFileSystemLoaderOpts

type WebLoaderOpts
  = { useCache :: Boolean, async :: Boolean }

defaultWebLoaderOpts :: WebLoaderOpts
defaultWebLoaderOpts = { useCache: false, async: false }

data Loader
  = FileSystemLoader (Array String) FileSystemLoaderOpts
  | NodeResolveLoader NodeResolveLoaderOpts
  | WebLoader String WebLoaderOpts

-- foreign import data FileSystemLoader_ :: Type
-- foreign import data WebLoader_ :: Type
-- foreign import data NodeResolveLoader_ :: Type
-- foreign import makeFileSystemLoader :: Array String -> FileSystemLoaderOpts -> FileSystemLoader_
-- foreign import makeNodeResolveLoader :: NodeResolveLoaderOpts -> NodeResolveLoader_
-- foreign import makeWebLoader :: String -> WebLoaderOpts -> WebLoader_
-- makeEnvironment :: Array Loader -> EnvironmentOpts -> Environment
-- makeEnvironment loaders opts = makeEnvironment_ (go <$> loaders) opts
--   where
--   go :: forall row. Loader -> { | row }
--   go (FileSystemLoader paths fopts) = unsafeCoerce $ makeFileSystemLoader paths fopts
--   go (WebLoader url wopts) = unsafeCoerce $ makeWebLoader url wopts
--   go (NodeResolveLoader nopts) = unsafeCoerce $ makeNodeResolveLoader nopts
