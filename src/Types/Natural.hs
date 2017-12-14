module Types.Natural
    ( Natural
    , mkNatural
    , natToInt
    ) where

import Data.Text (pack, unpack)
import Text.Read (readMaybe)
import Yesod.Core (PathPiece(..))

newtype Natural =
    Natural Int
    deriving (Eq, Show, Read)

mkNatural :: Int -> Maybe Natural
mkNatural i
    | i < 1 = Nothing
    | otherwise = Just (Natural i)

natToInt :: Natural -> Int
natToInt (Natural i) = i

instance PathPiece Natural where
    toPathPiece (Natural i) = pack . show $ i
    fromPathPiece s = do
        int <- readMaybe $ unpack s
        mkNatural int
