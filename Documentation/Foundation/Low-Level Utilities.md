# Low-Level Utilities.pdf

## Page 1

protocol NSXPCProxyCreating
Methods for creating new proxy objects.
class NSXPCConnection
A bidirectional communication channel between two processes.
class NSXPCInterface
An interface that may be sent to an exported object or remote object proxy.
class NSXPCCoder
A coder that encodes and decodes objects that your app sends over an XPC connection.
class NSXPCListener
A listener that waits for new incoming connections, configures them, and accepts or rejects
them.
protocol NSXPCListenerDelegate
The protocol that delegates to the XPC listener use to accept or reject new connections.
class NSXPCListenerEndpoint
Topics
XPC Client
XPC Services
Foundation / XPC
API Collection
XPC
Manage secure interprocess communication.


## Page 2

An object that names a specific XPC listener.
Object Runtime
Get low-level support for basic Objective-C features, Cocoa design patterns, and Swift
integration.
Processes and Threads
Manage your app’s interaction with the host operating system and other processes, and
implement low-level concurrency features.
Streams, Sockets, and Ports
Use low-level Unix features to manage input and output among files, processes, and the
network.
See Also
Low-Level Utilities


## Page 3

class NSObject
The root class of most Objective-C class hierarchies, from which subclasses inherit a basic
interface to the runtime system and the ability to behave as Objective-C objects.
protocol NSObjectProtocol
The group of methods that are fundamental to all Objective-C objects.
NSKeyValueCoding
A mechanism by which you can access the properties of an object indirectly by name or key
protocol NSCopying
A protocol that objects adopt to provide functional copies of themselves.
protocol NSMutableCopying
A protocol that mutable objects adopt to provide functional copies of themselves.
class NSNumber
An object wrapper for primitive scalar numeric values.
Topics
Object Basics
Copying
Value Wrappers and Transformations
Foundation / Object Runtime
API Collection
Object Runtime
Get low-level support for basic Objective-C features, Cocoa design patterns, and
Swift integration.


## Page 4

class NSValue
A simple container for a single C or Objective-C data item.
class ValueTransformer
An abstract class used to transform values from one representation to another.
SupportedLanguage(swift)
protocol ReferenceConvertible
A decoration applied to types that are backed by a Foundation reference type.
Classes Bridged to Swift Standard Library Value Types
Use bridged reference types when you need reference semantics or Foundation-specific
behavior.
class NSProxy
An abstract superclass defining an API for objects that act as stand-ins for other objects or f
objects that don’t exist yet.
Memory Management Functions
Perform low-level memory management tasks.
Objective-C Runtime Utilities
Interact with the Objective-C runtime.
Foundation Framework Version Numbers
Recognize the constants for comparing the current running version of Foundation against
known OS version numbers.
Swift Support
Remote Objects
Memory Management
Objective-C Runtime
Versions and API Availability
Legacy


## Page 5

SupportedLanguage(swift)
Distributed Objects Support
Enable communication among objects in different processes, both locally and on remote
systems.
Objective-C Garbage Collection
Interface with the legacy garbage collection system.
XPC
Manage secure interprocess communication.
Processes and Threads
Manage your app’s interaction with the host operating system and other processes, and
implement low-level concurrency features.
Streams, Sockets, and Ports
Use low-level Unix features to manage input and output among files, processes, and the
network.
See Also
Low-Level Utilities


## Page 6

class RunLoop
The programmatic interface to objects that manage input sources.
class Timer
A timer that fires after a certain time interval has elapsed, sending a specified message to a
target object.
class ProcessInfo
A collection of information about the current process.
class Thread
A thread of execution.
protocol NSLocking
The elementary methods adopted by classes that define lock objects.
class NSLock
Topics
Run Loop Scheduling
Process Info
Threads and Locking
Foundation / Processes and Threads
API Collection
Processes and Threads
Manage your app’s interaction with the host operating system and other
processes, and implement low-level concurrency features.


## Page 7

An object that coordinates the operation of multiple threads of execution within the same
application.
class NSRecursiveLock
A lock that may be acquired multiple times by the same thread without causing a deadlock.
class NSDistributedLock
A lock that multiple applications on multiple hosts can use to restrict access to some shared
resource, such as a file.
class NSConditionLock
A lock that can be associated with specific, user-defined conditions.
class NSCondition
A condition variable whose semantics follow those used for POSIX-style conditions.
class OperationQueue
A queue that regulates the execution of operations.
class Operation
An abstract class that represents the code and data associated with a single task.
class BlockOperation
An operation that manages the concurrent execution of one or more blocks.
class Process
An object that represents a subprocess of the current process.
class NSUserScriptTask
An object that executes scripts.
class NSUserAppleScriptTask
An object that executes AppleScript scripts.
class NSUserAutomatorTask
An object that executes Automator workflows.
class NSUserUnixTask
Operations
Scripts and External Tasks


## Page 8

An object that executes unix applications.
XPC
Manage secure interprocess communication.
Object Runtime
Get low-level support for basic Objective-C features, Cocoa design patterns, and Swift
integration.
Streams, Sockets, and Ports
Use low-level Unix features to manage input and output among files, processes, and the
network.
See Also
Low-Level Utilities


## Page 9

class Stream
An abstract class representing a stream.
class InputStream
A stream that provides read-only stream functionality.
class OutputStream
A stream that provides write-only stream functionality.
protocol StreamDelegate
An interface that delegates of a stream instance use to handle events on the stream.
class Process
An object that represents a subprocess of the current process.
class Pipe
A one-way communications channel between related processes.
Topics
Streams
Tasks and Pipes
Sockets
Foundation / Streams, Sockets, and Ports
API Collection
Streams, Sockets, and Ports
Use low-level Unix features to manage input and output among files, processes,
and the network.


## Page 10

class Host
A representation of an individual host on the network.
Deprecated
class Port
An abstract class that represents a communication channel.
class SocketPort
A port that represents a BSD socket.
Byte Order Utilities
Examine and manage the byte order of numbers communicated through network channels.
XPC
Manage secure interprocess communication.
Object Runtime
Get low-level support for basic Objective-C features, Cocoa design patterns, and Swift
integration.
Processes and Threads
Manage your app’s interaction with the host operating system and other processes, and
implement low-level concurrency features.
Byte Ordering
See Also
Low-Level Utilities


