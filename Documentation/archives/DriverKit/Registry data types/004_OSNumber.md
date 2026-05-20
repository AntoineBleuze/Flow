# 004_OSNumber.pdf

## Page 1

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


## Page 2

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


## Page 3

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


