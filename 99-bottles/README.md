# 99 Bottles of Beer Song

## Summary
```text
99 bottles of beer on the wall, 99 bottles of beer.
Take one down, pass it around, 98 bottles of beer on the wall!

... blah blah blah ...

2 bottles of beer on the wall, 2 bottles of beer.
Take one down, pass it around, 1 bottle of beer on the wall!

1 bottle of beer on the wall, 1 bottle of beer.
Take one down, pass it around, no more bottles of beer on the wall!
```
*Figure 1*.  Text of the song 99 Bottles of Beer.

Ah, the good old [99 Bottles of Beer](http://en.wikipedia.org/wiki/99_Bottles_of_Beer) song (see Figure 1).

We're going to model someone singing this song by writing a method which produces the lyrics for the entire song. We'll write a method `bottle_song_lyrics`, and in our virtual beer hall, calling `bottle_song_lyrics(99)` represents asking our rowdy neighbor to start singing 99 Bottles of Beer.

The verses of this song are all very boring — at least, until there's only one bottle of beer on the wall. As we can imagine, this challenge deals with handling repetition.


## Releases
### Pre-release:  Provided Files
We'll be writing our `bottle_song_lyrics` method in the file `bottle_song_lyrics.rb`.  Remember, our method will return the lyrics of the song, dependent upon the number passed to the method.

If we want to see the text printed to the command line, we can run the file `runner.rb`, which calls the method and prints out the return value.


## Conclusion
99 Bottles of Beer is a very repetitive song. The lyrics are repeated almost exactly the same over and over and over ... Except for a few cases which need to be treated uniquely.  Special cases can lead to code that is a mess of hard-to-read conditional statements, and we should be deliberate to handle special cases in an elegant, readable manner.

