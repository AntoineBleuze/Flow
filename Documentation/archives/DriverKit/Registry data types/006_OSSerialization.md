# 006_OSSerialization.pdf

## Page 1

OSSerialization provides methods to serialize an object to binary data suitable for messaging. On
certain DriverKit classes may be serialized: OSData, OSString, OSNumber, OSBoolean, OSArray,
OSDictionary.
OSSerialization provides no concurrency protection; it’s up to the usage context to provide any
protection necessary.
createFromBytes
Allocates an OSSerialization object from the serialized data of a previous serialization.
createFromObject
Allocates an OSSerialization object with the serialized data of an object.
OSCreateSerializationFromBytes
OSCreateSerializationFromObject
Overview
Topics
Creating a Serialization Object
DriverKit / OSSerialization
Class
OSSerialization
A container for one or more objects, serialized in a binary data format that is
suitable for messaging.
DriverKit
iOS
iPadOS
macOS


## Page 2

free
OSSerializationFreeBufferHandler
OSSerializationPtr
copyObject
Obtain the result of the deserialization performed by createFromBytes().
OSCreateObjectFromSerialization
OSSerializationGetBytes
finalizeBuffer
Obtain the result of the serialization performed by createFromObject().
freeBuffer
OSContainer
OSArray
A container for an ordered, random-access collection of objects.
OSDictionary
A container for a collection with elements that are key-value pairs.
Getting the Serialized Content
Type Methods
Relationships
Inherits From
See Also
Registry data types


## Page 3

OSBoolean
A container for a true or false value.
OSData
A container for untyped data.
OSNumber
A container for an integer value.
OSString
A container for managing an array of characters.
OSCollection
The base class for DriverKit collection objects.
OSContainer
The base class for DriverKit data objects.
OSObject
The base class for DriverKit objects
OSSymbol
A container for managing an array of characters.
IOFixed
A fixed-point number.


