# 010_OSSymbol.pdf

## Page 1

OSString is a container class for managing arrays of characters.
Encodings
OSString makes no provisions for different character encodings and assumes that a string is a nu
terminated sequence of single-byte characters. User-space code must either assume an encodin
(typically ASCII or UTF-8) or determine it in some other way (such as an IORegistryEntry property
OSString is immutable.
OSArray
A container for an ordered, random-access collection of objects.
OSDictionary
A container for a collection with elements that are key-value pairs.
OSBoolean
Discussion
See Also
Registry data types
DriverKit / OSSymbol
Type Alias
OSSymbol
A container for managing an array of characters.
DriverKit
iOS
iPadOS
macOS


## Page 2

A container for a true or false value.
OSData
A container for untyped data.
OSNumber
A container for an integer value.
OSString
A container for managing an array of characters.
OSSerialization
A container for one or more objects, serialized in a binary data format that is suitable for
messaging.
OSCollection
The base class for DriverKit collection objects.
OSContainer
The base class for DriverKit data objects.
OSObject
The base class for DriverKit objects
IOFixed
A fixed-point number.


