#Reading

* http://book.realworldhaskell.org/read/
* http://learnyouahaskell.com/chapters
* http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html
* http://adit.io/posts/2013-06-10-three-useful-monads.html
# My Notes

##  I used stack instead of global haskell.

1. `stack runghc WC < hello-haskell.cabal`
: 41

## easy testing while writing:
`nodemon --ext hs --exec "stack runghc typesandfunctions"`

## using with unix pipe
`cat haiku.txt | stack runghc forever.hs`
Give me some input: I'M A LIL' TEAPOT
Give me some input: WHAT'S WITH THAT AIRPLANE FOOD, HUH?
Give me some input: IT'S SO SMALL, TASTELESS
Give me some input: forever.hs: <stdin>: hGetLine: end of file
