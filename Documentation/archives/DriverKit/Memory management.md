# Memory management.pdf

## Page 1

Use an IOBufferMemoryDescriptor to share data between your driver and other processes,
including the kernel. You create memory buffers in your driver’s process space, but you can pass
the buffer to any API that expects an IOMemoryDescriptor object. Some DriverKit APIs pass
your buffer to another process, which can then map the buffer to its own address space and
access the contents.
Typically, you create memory buffer objects to store data moving in and out of your driver. For
example, a network interface driver might create a buffer to store packet data it receives from the
associated device. You are responsible for managing the contents of the buffer yourself, typically
by mapping it to a known data type. Except where noted, you are also responsible for releasing
buffers that you allocate.
Create
Creates a new memory buffer descriptor object in the current process space.
init
Overview
Topics
Creating a Memory Buffer
DriverKit / IOBufferMemoryDescriptor
Class
IOBufferMemoryDescriptor
A memory buffer allocated in the caller’s address space.
DriverKit
iOS
iPadOS
macOS


## Page 2

Initializes the buffer memory descriptor object.
free
Performs any final cleanup for the memory buffer descriptor object.
SetLength
Changes the length of the memory buffer.
GetAddressRange
Returns the address and length of the memory buffer.
IOAddressSegment
A structure that describes the location and size of a block of memory.
IOMemoryDescriptor
IOMemoryDescriptor
The base class for describing a location in memory.
IOMemoryMap
A reference to an existing block of memory in the current process or in a different process.
Memory Utilities
Allocate and deallocate memory and manage memory pointers in different address spaces.
Managing the Buffer Contents
Relationships
Inherits From
See Also
Memory management


## Page 3

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


## Page 4

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


## Page 5

IOBufferMemoryDescriptor
A memory buffer allocated in the caller’s address space.
IOMemoryMap
A reference to an existing block of memory in the current process or in a different process.
Memory Utilities
Allocate and deallocate memory and manage memory pointers in different address spaces.


## Page 6

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


## Page 7

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


## Page 8

IONew
Allocates memory for an array of the specified type.
IONewZero
Allocates memory for an array of the specified type and zero-initializes that memory.
IOMalloc
Allocates the specified amount of general-purpose memory.
IOMallocZero
Allocates the specified amount of general-purpose memory and zero-initializes it.
OSTypeAlloc
Allocates memory for a named class.
IODelete
Frees the memory associated with a valid, typed array.
IOSafeDeleteNULL
Frees the memory associated with a typed array.
Topics
Allocation
Deallocation
DriverKit / Memory Utilities
API Collection
Memory Utilities
Allocate and deallocate memory and manage memory pointers in different addres
spaces.


## Page 9

OSSafeReleaseNULL
Frees memory that you allocated for a named class.
IOFree
Frees a memory block that contains general-purpose memory.
IOVMPageSize
The number of bytes in a virtual memory page.
IOVirtualAddress
An address in the virtual memory space of the process.
IOPhysicalAddress
An address in physical memory.
IOPhysicalAddress32
A 32-bit address in physical memory.
IOPhysicalAddress64
A 64-bit address in physical memory.
IOPhysicalLength
A type that represents the length of a memory block.
IOPhysicalLength32
A type that represents the length of a memory block in a 32-bit address space.
IOPhysicalLength64
A type that represents the length of a memory block in a 64-bit address space.
IOCacheMode
A memory-cache mode.
IOByteCount
A type that represents a number of bytes.
Address Utilities
Addresses
Byte Counts


## Page 10

IOByteCount32
A type that represents a number of bytes in a 32-bit address space.
IOByteCount64
A type that represents a number of bytes in a 64-bit address space.
IOBufferMemoryDescriptor
A memory buffer allocated in the caller’s address space.
IOMemoryDescriptor
The base class for describing a location in memory.
IOMemoryMap
A reference to an existing block of memory in the current process or in a different process.
See Also
Memory management


