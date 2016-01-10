

main = interact responPalindromes


-- point-free
responPalindromes = unlines . map (\xs ->
  if isPalindrome xs then "palindrome" else "not") . lines
  where isPalindrome xs = xs == reverse xs
-- responPalindromes contents = unlines (map (\xs ->
--   if isPalindrome xs then "palindrome" else "not palindrome") (lines contents))
--   where isPalindrome xs = xs == reverse xs


-- stack runghc check_palindrome.hs
-- heh
-- palindrome
-- nie
-- not
-- ^C
