# 001_IOMemoryDescriptor.pdf

## Page 1

The IOMemoryDescriptor class defines shared behavior for memory-related objects. Use the
methods of this class to get information about a memory block and to map a memory block from
another process into your driver’s memory space.
Don’t create instances of this class directly. When you want to allocate memory for your driver,
create an IOBufferMemoryDescriptor instead, which is a concrete implementation of this
class.
init
Initializes the memory descriptor object.
free
Performs any final cleanup for the memory descriptor object.
Overview
Topics
Configuring the Buffer
Getting the Buffer Length
DriverKit / IOMemoryDescriptor
Class
IOMemoryDescriptor
The base class for describing a location in memory.
DriverKit
iOS
iPadOS
macOS


## Page 2

GetLength
Returns the length of the memory block represented by this object.
CreateMapping
Maps the contents of the memory block to the address space of the current process.
Memory Map Options
Options that describe how to configure a memory-mapped buffer.
Map
Maps memory internally.
CreateSubMemoryDescriptor
CreateWithMemoryDescriptors
OSObject
IOBufferMemoryDescriptor
Mapping to the Caller’s Address Space
Performing Internal Tasks
Type Methods
Relationships
Inherits From
Inherited By
See Also
Memory management


## Page 3

IOBufferMemoryDescriptor
A memory buffer allocated in the caller’s address space.
IOMemoryMap
A reference to an existing block of memory in the current process or in a different process.
Memory Utilities
Allocate and deallocate memory and manage memory pointers in different address spaces.


