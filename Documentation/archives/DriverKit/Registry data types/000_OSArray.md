# 000_OSArray.pdf

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


