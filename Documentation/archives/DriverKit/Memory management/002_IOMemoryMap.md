# 002_IOMemoryMap.pdf

## Page 1

Use an IOMemoryMap object to share an existing block of memory. You don’t create instances of
this class directly. Instead, call the CreateMapping method of IOMemoryDescriptor to creat
a new memory map object for that descriptor’s contents. Use the methods of this class to get the
address and size of the memory block, relative to the current process.
An IOMemoryMap object doesn’t own the memory it references, and you must not attempt to fre
that memory.
init
Initializes the memory map object.
free
Performs any final cleanup for the memory map object.
Overview
Topics
Configuring the Memory Map
DriverKit / IOMemoryMap
Class
IOMemoryMap
A reference to an existing block of memory in the current process or in a different
process.
DriverKit
iOS
iPadOS
macOS


## Page 2

GetAddress
Returns the address of the memory block.
GetLength
Returns the length of the memory block in bytes.
GetOffset
Returns the offset from the original start of the memory block.
OSObject
IOBufferMemoryDescriptor
A memory buffer allocated in the caller’s address space.
IOMemoryDescriptor
The base class for describing a location in memory.
Memory Utilities
Allocate and deallocate memory and manage memory pointers in different address spaces.
Getting the Map Attributes
Relationships
Inherits From
See Also
Memory management


