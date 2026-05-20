# File systems.pdf

## Page 1

FSUnaryFileSystem is a simplified file system, which works with one FSResource and
presents it as one FSVolume.
The one volume and its container have a shared state and lifetime, a more constrained life cycle
than the FSFileSystem design flow.
Implement your app extension by providing a subclass of FSUnaryFileSystem as a delegate
object. Your delegate also needs to implement the FSUnaryFileSystemOperations protocol
so that it can load resources.
protocol FSUnaryFileSystemOperations
Operations performed by a unary file system.
Overview
Topics
Implementing operations
Relationships
FSKit / FSUnaryFileSystem
Class
FSUnaryFileSystem
An abstract base class for implementing a minimal file system.
macOS 15.4+


## Page 2

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
FSFileSystemBase
Hashable
NSObjectProtocol
protocol FSFileSystemBase
A protocol containing functionality supplied by FSKit to file system implementations.
class FSFileName
The name of a file, expressed as a data buffer.
Inherits From
Conforms To
See Also
File systems


## Page 3

Both FSFileSystem and FSUnaryFileSystem conform to this protocol.
var containerStatus: FSContainerStatus
The status of the file system container, indicating its readiness and activity.
Required
func wipe(FSBlockDeviceResource, completionHandler: ((any Error)?) ->
Void)
Wipes existing file systems on the specified resource.
Required
Overview
Topics
Implementing essential functionality
Relationships
FSKit / FSFileSystemBase
Protocol
FSFileSystemBase
A protocol containing functionality supplied by FSKit to file system
implementations.
macOS 15.4+


## Page 4

NSObjectProtocol
FSUnaryFileSystem
class FSUnaryFileSystem
An abstract base class for implementing a minimal file system.
class FSFileName
The name of a file, expressed as a data buffer.
Inherits From
Conforming Types
See Also
File systems


## Page 5

FSFileName is the class that carries filenames from the kernel to FSModule instances, and
carries names back to the kernel as part of directory enumeration.
A filename is usually a valid UTF-8 sequence, but can be an arbitrary byte sequence that doesn’t
conform to that format. As a result, the data property always contains a value, but the string
property may be empty. An FSModule can receive an FSFileName that isn’t valid UTF-8 in two
cases:
1. A program passes erroneous data to a system call. The FSModule treats this situation as an
error.
2. An FSModule lacks the character encoding used for a file name. This situation occurs because
some file system formats consider a filename to be an arbitrary “bag of bytes,” and leave
character encoding up to the operating system. Without encoding information, the FSModule
can only pass back the names it finds on disk. In this case, the behavior of upper layers such as
FileManager is unspecified. However, the FSModule must support looking up such names
and using them as the source name of rename operations. The FSModule must also be able to
support filenames that are derivatives of filenames returned from directory enumeration.
Derivative filenames include Apple Double filenames ("._Name"), and editor backup filenames
Important
Don’t subclass this class.
Overview
FSKit / FSFileName
Class
FSFileName
The name of a file, expressed as a data buffer.
macOS 15.4+


## Page 6

convenience init(bytes: UnsafeBufferPointer<CChar>)
convenience init(cString: UnsafeBufferPointer<CChar>)
convenience init(data: Data)
Creates a filename by copying a character sequence data object.
convenience init(string: String)
Creates a filename by copying a character sequence from a string instance.
var data: Data
The byte sequence of the filename, as a data object.
var string: String?
The filename, represented as a Unicode string.
var debugDescription: String
The filename, represented as a potentially lossy conversion to a string.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Topics
Creating a filename
Accessing filename properties
Relationships
Inherits From
Conforms To


## Page 7

NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class FSUnaryFileSystem
An abstract base class for implementing a minimal file system.
protocol FSFileSystemBase
A protocol containing functionality supplied by FSKit to file system implementations.
See Also
File systems


