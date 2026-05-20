# 001_FSFileSystemBase.pdf

## Page 1

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


## Page 2

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


