# 005_OSString.pdf

## Page 1

OSString is a container class for managing arrays of characters.
Encodings
OSString makes no provisions for different character encodings and assumes that a string is a nu
terminated sequence of single-byte characters. User-space code must either assume an encodin
(typically ASCII or UTF-8) or determine it in some other way (such as an IORegistryEntry property
OSString is immutable.
withString
Allocates an OSString object with a copy of an OString object.
withCString
Allocates an OSString object with a copy of a c-string.
withCString
Overview
Topics
Creating a String
DriverKit / OSString
Class
OSString
A container for managing an array of characters.
DriverKit
iOS
iPadOS
macOS


## Page 2

Allocates an OSString object with a copy of a c-string, up to a given length.
withCStringNoCopy
Allocates an OSString object with a copy of a c-string.
OSStringCreate
free
getCStringNoCopy
Returns a pointer to the OSString object’s internal data buffer.
OSStringGetStringPtr
OSStringPtr
getLength
Returns length of string not including null terminator.
OSStringGetLength
isEqualTo
Compares the string with an OSData.
isEqualTo
Compares the string with an OSObject
isEqualTo
Compares the string with an OSString.
isEqualTo
Compares the string with a c-string.
Getting a C String
Inspecting a String
Comparing Strings
Relationships


## Page 3

OSContainer
OSArray
A container for an ordered, random-access collection of objects.
OSDictionary
A container for a collection with elements that are key-value pairs.
OSBoolean
A container for a true or false value.
OSData
A container for untyped data.
OSNumber
A container for an integer value.
OSSerialization
A container for one or more objects, serialized in a binary data format that is suitable for
messaging.
OSCollection
The base class for DriverKit collection objects.
OSContainer
The base class for DriverKit data objects.
OSObject
The base class for DriverKit objects
OSSymbol
A container for managing an array of characters.
Inherits From
See Also
Registry data types


## Page 4

IOFixed
A fixed-point number.


