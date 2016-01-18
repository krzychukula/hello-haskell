import Data.Char
import Data.List
-- stack runghc fmapping_io.hs
-- hello
-- O-L-L-E-H

main = do line <- fmap (intersperse '-' . reverse . map toUpper) getLine
          putStrLn line
