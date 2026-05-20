# 002_Collections.pdf

## Page 1

struct Array
An ordered, random-access collection.
struct Dictionary
A collection whose elements are key-value pairs.
struct Set
An unordered collection of unique elements.
struct IndexPath
A list of indexes that together represent the path to a specific location in a tree of nested
arrays.
struct IndexSet
A collection of unique integer values that represent the indexes of elements in another
collection.
class NSCountedSet
Topics
Basic Collections
Indexes
Specialized Sets
Foundation / Collections
API Collection
Collections
Use arrays, dictionaries, sets, and specialized collections to store and iterate
groups of objects or values.


## Page 2

A mutable, unordered collection of distinct objects that may appear more than once in the
collection.
class NSOrderedSet
A static, ordered collection of unique objects.
class NSMutableOrderedSet
A dynamic, ordered collection of unique objects.
class NSCache
A mutable collection you use to temporarily store transient key-value pairs that are subject t
eviction when resources are low.
class NSPurgeableData
A mutable data object containing bytes that can be discarded when they’re no longer neede
class NSPointerArray
A collection similar to an array, but with a broader range of available memory semantics.
class NSMapTable
A collection similar to a dictionary, but with a broader range of available memory semantics.
class NSHashTable
A collection similar to a set, but with broader range of available memory semantics.
class NSEnumerator
An abstract class whose subclasses enumerate collections of objects, such as arrays and
dictionaries.
protocol NSFastEnumeration
A protocol that objects adopt to support fast enumeration.
struct NSFastEnumerationIterator
struct NSIndexSetIterator
An iterator suitable for enumerating the elements of an index set.
Purgeable Collections
Pointer Collections
Iteration


## Page 3

struct NSEnumerationOptions
Options for block enumeration operations.
struct NSSortOptions
Options for block sorting operations.
class NSNull
A singleton object used to represent null values in collection objects that don’t allow nil
values.
let NSNotFound: Int
let NSNotFound: Int
A value indicating that a requested item couldn’t be found or doesn’t exist.
Numbers, Data, and Basic Values
Work with primitive values and other fundamental types used throughout Cocoa.
Strings and Text
Create and process strings of Unicode characters, use regular expressions to find patterns,
and perform natural language analysis of text.
Dates and Times
Compare dates and times, and perform calendar and time zone calculations.
Units and Measurement
Label numeric quantities with physical dimensions to allow locale-aware formatting and
conversion between related units.
Data Formatting
Convert numbers, dates, measurements, and other values to and from locale-aware string
representations.
Filters and Sorting
Special Semantic Values
See Also
Fundamentals


## Page 4

Use predicates, expressions, and sort descriptors to examine elements in collections and
other services.


