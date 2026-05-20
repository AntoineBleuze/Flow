# 003_OSData.pdf

## Page 1

OSData represents an array of bytes as a container object. OSData objects are mutable: You can
add bytes to them and overwrite portions of the byte array.
OSData provides no concurrency protection; it’s up to the usage context to provide any protectio
necessary.
withBytes
Allocates an OSData object with a copy of bytes.
withBytesNoCopy
Allocates an OSData object with a copy of bytes.
withCapacity
Allocates an OSData object with preallocated capacity.
withData
Overview
Topics
Creating a Data Object
DriverKit / OSData
Class
OSData
A container for untyped data.
DriverKit
iOS
iPadOS
macOS


## Page 2

Allocates an OSData object with a copy of bytes from another OSData.
withData
Allocates an OSData object with a copy of bytes from a subset of another OSData.
OSDataCreate
OSDataPtr
free
getBytesNoCopy
Returns a pointer to the OSData object’s internal data buffer.
getBytesNoCopy
Returns a pointer to the OSData object’s internal data buffer.
OSDataGetBytes
OSDataGetBytesPtr
appendBytes
Appends a buffer of bytes to the OSData object’s internal data buffer.
appendBytes
Appends a buffer of bytes to the OSData object’s internal data buffer.
appendBytes
Appends a buffer of bytes to the OSData object’s internal data buffer.
OSDataAppendBytes
getCapacity
Returns length of preallocated capacity.
getLength
Returns length of data present.
Getting Bytes
Appending Data to the Object
Inspecting a Data Object


## Page 3

OSDataGetLength
isEqualTo
Compares the data with an OSData
isEqualTo
Compares the data with an OSObject
isEqualTo
Compares the data with an OSString
isEqualTo
Compares the data with a pointer to bytes
OSContainer
OSArray
A container for an ordered, random-access collection of objects.
OSDictionary
A container for a collection with elements that are key-value pairs.
OSBoolean
A container for a true or false value.
OSNumber
A container for an integer value.
Comparing Data Objects
Relationships
Inherits From
See Also
Registry data types


## Page 4

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
OSSymbol
A container for managing an array of characters.
IOFixed
A fixed-point number.


