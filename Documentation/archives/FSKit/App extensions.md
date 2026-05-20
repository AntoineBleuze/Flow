# App extensions.pdf

## Page 1

Your app needs to do the following to implement a FSKit-compatible minimal file system:
1. Create a subclass of FSUnaryFileSystem, which also conforms to FSUnaryFileSystem
Operations.
2. Implement a @main struct that conforms to the UnaryFileSystemExtension protocol. You
implementation of this protocol returns the type of class from step 1 as its FileSystem
associated type, and returns an instance of it as the fileSystem property.
var fileSystem: Self.FileSystem
The instance of your file system type that your app extension provides.
Required
associatedtype FileSystem : FSUnaryFileSystem, FSUnaryFileSystem
Operations
The type of file system your app extension provides.
Overview
Topics
Declaring the implemented file system
FSKit / UnaryFileSystemExtension
Protocol
UnaryFileSystemExtension
A protocol for implementing a minimal file system as an app extension.
macOS 15.4+


## Page 2

Required
AppExtension
Relationships
Inherits From


