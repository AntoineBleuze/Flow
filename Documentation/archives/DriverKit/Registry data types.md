# Registry data types.pdf

## Page 1

OSArray is a collection class for objects derived from OSObject. Storage and access are by array
index.
You must generally cast retrieved objects from OSObject to the desired class using the
OSDynamicCast macro. This macro returns the object cast to the desired class, or NULL if the
object isn’t derived from that class.
As with all DriverKit collection classes, OSArray retains objects added to it, and releases objects
removed from it (or replaced). An OSArray also grows as necessary to accommodate new objects
OSArray provides no concurrency protection; it’s up to the usage context to provide any protectio
necessary.
withArray
Allocates an OSArray object with given members and preallocated capacity.
withCapacity
Overview
Topics
Creating an Array
DriverKit / OSArray
Class
OSArray
A container for an ordered, random-access collection of objects.
DriverKit
iOS
iPadOS
macOS


## Page 2

Allocates an OSArray object with preallocated capacity.
withObjects
Allocates an OSArray object with given members and preallocated capacity.
OSArrayCreate
merge
Appends all members of an array to this array.
free
flushCollection
Removes and drops references to all members of array.
getObject
Returns a member of the array.
getLastObject
Returns the last member of the array.
getNextIndexOfObject
Searches the array for an object.
setObject
Appends an object as the last member of the array.
setObject
Sets an object as the member of the array at a given index.
iterateObjects
Iterates the array calling a callback block for each member.
replaceObject
Removes a current member of the array and replaces it with another object.
removeObject
Removes a current member of the array.
OSArrayAppendValue
OSArrayReplaceValue
Accessing Elements


## Page 3

OSArrayGetValue
OSArrayGetStringValue
OSArrayGetUInt64Value
OSArraySetValue
OSArraySetStringValue
OSArraySetUInt64Value
Array Indices
OSArrayPtr
getCount
Returns count of members in array.
getCapacity
Returns count of currently allocated capacity for members in array.
ensureCapacity
Allocates capacity for members in array.
OSArrayGetCount
OSArrayApply
OSArrayApplier
isEqualTo
Compares all members of two arrays with isEqualTo().
isEqualTo
Getting and Setting Values
Inspecting an Array
Modifying the Array Contents
Comparing Arrays


## Page 4

Compares the array with an OSObject
OSCollection
OSSet
OSDictionary
A container for a collection with elements that are key-value pairs.
OSBoolean
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
Relationships
Inherits From
Inherited By
See Also
Registry data types


## Page 5

OSContainer
The base class for DriverKit data objects.
OSObject
The base class for DriverKit objects
OSSymbol
A container for managing an array of characters.
IOFixed
A fixed-point number.


## Page 6

OSDictionary is a collection class for objects derived from OSObject. Storage and access are
associative, based on keys that are uniqued OSObjects. OSString is commonly used as a key sinc
it is uniqued. When adding an object to an OSDictionary, you provide a string identifier, which can
then used to retrieve that object or remove it from the dictionary. Setting an object with a key that
already has an associated object replaces the original object.
You must generally cast retrieved objects from OSObject to the desired class using the
OSDynamicCast macro. This macro returns the object cast to the desired class, or NULL if the
object isn’t derived from that class.
As with all DriverKit collection classes, OSDictionary retains objects added to it, and releases
objects removed from it (or replaced). An OSDictionary also grows as necessary to accommodate
new objects.
OSArray provides no concurrency protection; it’s up to the usage context to provide any protectio
necessary.
Overview
Topics
Creating a Dictionary
DriverKit / OSDictionary
Class
OSDictionary
A container for a collection with elements that are key-value pairs.
DriverKit
iOS
iPadOS
macOS


## Page 7

withCapacity
Allocates an OSDictionary object with preallocated capacity.
withDictionary
Allocates an OSDictionary object with given members and preallocated capacity.
withObjects
Allocates an OSDictionary object with given members and preallocated capacity.
OSDictionaryCreate
merge
Adds all members of a dictionary to this dictionary.
free
flushCollection
Removes and drops references to all members of dictionary.
getObject
Returns a member of the dictionary.
getObject
Returns a member of the dictionary.
setObject
Add or replace an object in the dictionary.
setObject
Add or replace an object in the dictionary.
removeObject
Remove an object by key from the dictionary.
removeObject
Remove an object by key from the dictionary.
iterateObjects
Iterates the dictionary calling a callback block for each member.
iterateObjects
Iterates the dictionary calling a callback block for each member.
Accessing Keys and Values


## Page 8

OSDictionaryIterateObjectsBlock
OSDictionaryIterateObjectsCallback
OSDictionaryGetValue
OSDictionaryGetStringValue
OSDictionaryGetUInt64Value
OSDictionarySetValue
OSDictionarySetStringValue
OSDictionarySetUInt64Value
OSDictionaryPtr
ensureCapacity
Allocates capacity for members in dictionary.
getCapacity
Returns count of currently allocated capacity for members in dictionary.
getCount
Returns count of members in dictionary.
OSDictionaryGetCount
OSDictionaryApply
OSDictionaryApplier
isEqualTo
Compares all members of two dictionaries with isEqualTo().
isEqualTo
Getting and Setting Values
Inspecting a Dictionary
Modifying the Dictionary Items
Comparing Dictionaries


## Page 9

Compares certain members of two dictionaries with isEqualTo().
isEqualTo
Compares the dictionary with an OSObject
OSCollection
OSArray
A container for an ordered, random-access collection of objects.
OSBoolean
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
Relationships
Inherits From
See Also
Registry data types


## Page 10

OSContainer
The base class for DriverKit data objects.
OSObject
The base class for DriverKit objects
OSSymbol
A container for managing an array of characters.
IOFixed
A fixed-point number.


## Page 11

Only two static immutable instances of OSBoolean exist, kOSBooleanFalse & kOSBooleanTrue.
free
release
Releases the OSObject instance
retain
Retains the OSObject instance
OSBooleanPtr
kOSBooleanFalse
The OSBoolean constant for false .
Overview
Topics
Configuring a Boolean Type
Getting Boolean Values
DriverKit / OSBoolean
Class
OSBoolean
A container for a true or false value.
DriverKit
iOS
iPadOS
macOS


## Page 12

kOSBooleanTrue
The OSBoolean constant for true .
OSContainer
OSArray
A container for an ordered, random-access collection of objects.
OSDictionary
A container for a collection with elements that are key-value pairs.
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
Relationships
Inherits From
See Also
Registry data types


## Page 13

OSObject
The base class for DriverKit objects
OSSymbol
A container for managing an array of characters.
IOFixed
A fixed-point number.


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18

OSNumber represents an integer of 8, 16, 32, or 64 bits as a DriverKit container object. OSNumbe
objects are immutable.
withNumber
Allocates an OSNumber object with value and size.
withNumber
Allocates an OSNumber object with value from a c-string and size.
OSNumberCreateWithUInt64Value
free
OSNumberPtr
Overview
Topics
Creating a Number Object
Getting Integer Values
DriverKit / OSNumber
Class
OSNumber
A container for an integer value.
DriverKit
iOS
iPadOS
macOS


## Page 19

unsigned8BitValue
Returns the value of the OSNumber as a uint8_t value.
unsigned16BitValue
Returns the value of the OSNumber as a uint16_t value.
unsigned32BitValue
Returns the value of the OSNumber as a uint32_t value.
unsigned64BitValue
Returns the value of the OSNumber as a uint64_t value.
OSNumberGetUInt64Value
numberOfBits
Returns the number of bits the OSNumber was created with.
isEqualTo
Compares the string with an OSObject
isEqualTo
Compares the number with an OSNumber.
OSContainer
Inspecting a Number
Comparing Numbers
Relationships
Inherits From
See Also
Registry data types


## Page 20

OSArray
A container for an ordered, random-access collection of objects.
OSDictionary
A container for a collection with elements that are key-value pairs.
OSBoolean
A container for a true or false value.
OSData
A container for untyped data.
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


## Page 21

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


## Page 22

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


## Page 23

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


## Page 24

IOFixed
A fixed-point number.


## Page 25

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


## Page 26

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


## Page 27

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


## Page 28

getCount
getCapacity
ensureCapacity
iterateObjects
flushCollection
OSCollectionIterateObjectsBlock
copyCollection
OSCollectionPtr
Topics
Inspecting a Collection
Accessing Collection Elements
Copying the Collection
Getting Type Information
DriverKit / OSCollection
Class
OSCollection
The base class for DriverKit collection objects.
DriverKit
iOS
iPadOS
macOS


## Page 29

OSCollectionTypeID
OSCollectionTypeName
Collection Types
OSCollectionType
OSCollectionsInitialize
OSContainer
OSArray, OSDictionary
OSArray
A container for an ordered, random-access collection of objects.
OSDictionary
A container for a collection with elements that are key-value pairs.
OSBoolean
A container for a true or false value.
OSData
A container for untyped data.
Initializing Collection Types
Relationships
Inherits From
Inherited By
See Also
Registry data types


## Page 30

OSNumber
A container for an integer value.
OSString
A container for managing an array of characters.
OSSerialization
A container for one or more objects, serialized in a binary data format that is suitable for
messaging.
OSContainer
The base class for DriverKit data objects.
OSObject
The base class for DriverKit objects
OSSymbol
A container for managing an array of characters.
IOFixed
A fixed-point number.


## Page 31

OSContainerPtr
OSObject
OSBoolean
OSCollection
OSData
OSNumber
OSSerialization
OSString
Topics
Getting a Container Pointer
Relationships
Inherits From
Inherited By
DriverKit / OSContainer
Class
OSContainer
The base class for DriverKit data objects.
DriverKit
iOS
iPadOS
macOS


## Page 32

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
OSString
A container for managing an array of characters.
OSSerialization
A container for one or more objects, serialized in a binary data format that is suitable for
messaging.
OSCollection
The base class for DriverKit collection objects.
OSObject
The base class for DriverKit objects
OSSymbol
A container for managing an array of characters.
IOFixed
A fixed-point number.
See Also
Registry data types


## Page 33

init
retain
Retains the OSObject instance
release
Releases the OSObject instance
free
OSObjectPtr
OSObjectRef
SetDispatchQueue
CopyDispatchQueue
Topics
Managing the Object Lifecycle
Managing an Object’s Dispatch Queue
DriverKit / OSObject
Class
OSObject
The base class for DriverKit objects
DriverKit
iOS
iPadOS
macOS


## Page 34

OSMetaClassBase
IOCommand
IOCommandPool
IODMACommand
IODispatchQueue
IODispatchSource
IOMemoryDescriptor
IOMemoryMap
IOReportLegend
IOReporter
IOService
OSAction
OSBundle
OSContainer
OSMappedFile
OSArray
A container for an ordered, random-access collection of objects.
OSDictionary
A container for a collection with elements that are key-value pairs.
OSBoolean
A container for a true or false value.
OSData
A container for untyped data.
Relationships
Inherits From
Inherited By
See Also
Registry data types


## Page 35

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
OSSymbol
A container for managing an array of characters.
IOFixed
A fixed-point number.


## Page 36

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


## Page 37

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


## Page 38

IOFixedDivide
Divides two 16.16 fixed point numbers.
IOFixedMultiply
Multiplies two 16.16 fixed point numbers.
OSArray
A container for an ordered, random-access collection of objects.
OSDictionary
A container for a collection with elements that are key-value pairs.
OSBoolean
Topics
Computing Fixed-Point Values
See Also
Registry data types
DriverKit / IOFixed
Type Alias
IOFixed
A fixed-point number.
DriverKit
iOS
iPadOS
macOS


## Page 39

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
OSSymbol
A container for managing an array of characters.


