# Hashes

Hashes are just a kind of Map, and such an important one that it deserves its own challenge. Hashes implement all the Map methods (set, get, etc.)

## Why is this important?

Hashes are _fast_. Inserting and retrieving records are both constant time (O(1)). In other words it will take the same amount of time to set and fetch from the hash table no matter how big it is. This is a wonderful property. In addition to providing a fast key:value collection, Hashes can be used to create Sets that can check membership in constant time.

## Release 1, Implement a Hash

### Before you begin

 * Read Wikipedia's entry on [Hash Tables](http://en.wikipedia.org/wiki/Hash_table)
 * What data structure have you used that provides constant-time reads and writes?
 * How can you use that structure to your advantage?
 * How will you produce a [Hash Function](http://en.wikipedia.org/wiki/Hash_function) for a String? Note: it doesn't need to be a perfect hash function, collisions are OK, but how do you deal with them?

### Interface

Implement and test a `MyHash` class, you can use Ruby's array on this one behind the scenes if you'd like.

Your Hash should only use Strings as keys. Don't worry about other types.

Since a Hash is a kind of Map, it has the same interface:

- `MyHash::new`: Instantiate a new dictionary
- `MyHash#set(key, value)`: Add a key-value pair. If the key is already present, replace the value
- `MyHash#get(key)`: Retrieve the value stored at `key`
- `MyHash#has_key?(key)`: Answer where or not the dictionary has an entry for `key`
- `MyHash#remove(key)`: Remove the entry stored at `key`
- `MyHash#iterate{ |value, key| block }`: Iterate through the Hash, passing the block each value and key

Each of these methods (except iterate) should be O(1). Note that with a perfect hash function (every key maps to a unique number, there are no "collisions") access is always O(1). You might have a "pretty good" hash function that generates a few collisions. It might take longer that constant time, but it should still remain exceptionally fast as `n` grows.

### Timebox your Hash Function

Don't spend longer than 30 minutes on your hash function for String. You can look up various implementations online. It's best to pick the simplest one that makes sense to you, even if it's not perfect.


## Release 2, Why are Hashes fast?

In a file called `notes.md`, describe _why_ Hash operations are so fast. What about them gives us these constant time methods? What are some downsides of a hash?

## Stretch: Implement a HashSet

Implement and test a `HashSet` class. Your HashSet should conform to the Set interface:

### Interface

- `HashSet::new()`: Instantiate a new empty HashSet.
- `HashSet#add(element)`: Add an element to the set (if necessary)
- `HashSet#remove(element)`: Remove `element` from the set if it's present
- `HashSet#contains?(element)`: Answer whether or not `element` is in the set
- `HashSet#iterate{ |element| block }`: Iterate through all of the elements of the receiver
- `HashSet#size`: Return the size of the set

Make sure `#add`, `#remove`, `#contains`, and `#size` are constant time.
