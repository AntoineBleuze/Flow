# 000_Building a passthrough file system.pdf

## Page 1

You can use the FSKit framework to implement any kind of file system, whether based on an
existing storage device or as an abstraction of the contents of a URL. To offer a simple
implementation of FSKit, this sample code project serves as a passthrough file system, one which
passes its file-related API calls to the underlying file system on the device. The PassthroughFS
example reads from an existing path on your current file system and exposes it as a new file
system.
To use the sample file system, do the following:
1. Build and run the project in Xcode. The app simply displays a window with a copyright notice
because the functionality is all in the sample’s app extension.
2. In Settings > General > Login Items & Extensions, scroll to the Extensions section and click the
“By Category” tab to organize the extensions.
3. In the File System Extensions cell, click the ⓘ button on the right side. This presents a scrolling
list of file system extensions. Find the entry “Passthrough file system” and click the toggle on it
right side to enable the extension.
4. In Terminal, use the mkdir command to create a directory to serve as the mount target for the
passthrough file system. For example, mkdir ~/passthrough-fs creates a directory called
passthrough-fs in your home directory.
Overview
Configure the sample code project
FSKit / Building a passthrough file system
Sample Code
Building a passthrough file system
Expose an existing path as its own file system by using the FSKit framework.
Download
macOS 26.0+
Xcode 26.0+


## Page 2

5. In Terminal, use the mount command to mount an arbitrary directory as the source for the
passthrough file system. For example, mount -t passthrough ~/Documents
~/passthrough-fs tells the extension to present the contents of your Documents directory 
another file system, mounted at passthrough-fs. The -t passthrough flag tells mount
that the type of the file system is passthrough, which sends its requests to the extension.
6. Examine the contents of the mounted directory with commands like ls ~/passthrough-fs 
show that the contents of the source directory are indeed mounted at the target location.
To create a file system with FSKit, you create an FSKit app extension. You can do this in Xcode by
adding a “File system extension” target to your project, which creates a new target with four files:
An entitlements file with the com.apple.developer.fskit.fsmodule entitlement.
An information property list file with an EXAppExtensionAttributes dictionary to describe
command-line interface access to the file system. For example, the FSShortName key in this
property list provides the passthrough name that serves as a file system type when using th
mount command earlier.
An app extension implementation that conforms to the UnaryFileSystemExtension
protocol.
A file system implementation that conforms to the FSUnaryFileSystem and FSUnaryFile
SystemOperations protocols. The app extension returns this type as the value of its file
System property.
The sample code project already contains these items; you don’t need to create a new target.
Aside from the entitlements file and the information property list, PassthroughAppEx defines th
app extension, and PassthroughFileSystem is the base of the file system implementation.
Most of the functionality of an FSKit file system actually comes from subclassing the FSVolume
class as a custom type, which the FSUnaryFileSystem implementation then instantiates and
manages.
The sample project defines its volume as the PassthroughFSVolume type. With this type, the
PassthroughFileSystem can implement its required loadResource(resource:options
replyHandler:) method to set up a PassthroughFSVolume as follows:
1. Verify that the source resource is an FSPathURLResource and that the extension can access
as a security-scoped resource by calling startAccessingSecurityScopedResource().
2. Ignore any provided options except for -f (“force”), which force-loads the resource into the file
system without creating a volume. If a force-loaded file system doesn’t support formatting —
Create an app and an FSKit extension
Implement the file system protocols


## Page 3

which PassthroughFileSystem doesn’t — this scenario is an error, and the file system
returns the POSIX error ENOTSUP.
3. Call the reply handler closure with a new PassthroughFSVolume instance. If this results in a
error, call the handler with a nil volume and the error instead.
The implementation of the required unloadResource(resource:options:replyHandler
is similar. It verifies that the source is a valid FSPathURLResource as before, and that a previou
call to loadResource(resource:options:replyHandler:) successfully set the local
resource property. If so, the implementation stops accessing the security-scoped URL resource
and clears the resource property.


## Page 4

The sample code project uses two source files to implement the PassthroughFSVolume type:
PassthroughFSVolume.swift and PassthroughFSVolume+FSVolumeOperations
.swift. Between these two files, it implements the base FSVolume protocol along with five
protocols that define sets of related operations that a file system volume may provide:
FSVolume.Operations is a required protocol that defines essential operations like mounting
and unmounting, creating and deleting items, enumerating directory contents, and more. For
clarity, the sample project puts this implementation in its own file, Passthrough
FSVolume+FSVolumeOperations.swift, because it represents more code than all the
other volume operations combined.
FSVolume.OpenCloseOperations is an optional protocol that allows the volume to respon
when items open and close.
FSVolume.ReadWriteOperations is an optional protocol that provides methods to read an
write file contents.
FSVolume.RenameOperations is an optional protocol that supports renaming the volume.
FSVolume.PreallocateOperations is an optional protocol that enables the volume to
preallocate space for a file without writing to it yet.
The sample also subclasses the FSItem class as PassthroughFSItem, which the
PassthroughFSVolume code uses for FSKit methods that pass an item type as a parameter or
expect it as a return value. PassthroughFSVolume also defines a rootItem property as an
instance of PassthroughFSItem, representing the root of the virtual file system.
Given all this, PassthroughFSVolume implements many of its methods with calls to Darwin file
system functions, using the PassthroughFSItem’s file descriptor with the low-level APIs. For
example, the implementation of the FSVolume.Operations method synchronize(flags:
Implement the volume protocols


## Page 5

replyHandler:), which flushes in-memory buffers to the storage device, is effectively a
wrapper around a call to the Darwin fsync(2) function:
Similarly, the implementation of the FSVolume.ReadWriteOperations method read(from:
at:length:into:replyHandler:) inspects the PassthroughFSItem item to read from,
gets its file descriptor, and calls the Darwin function pread(2) to read from the source file at a
specific offset without modifying its file pointer. It checks the function’s return value to determine
how many bytes it successfully read into the provided buffer, fetching the POSIX error code if
pread returned the error value -1. Finally, it invokes the provided reply handler closure, passing
the number of bytes read or the error code.


## Page 6

Your own FSVolume implementation is free to implement whichever volume operation protocols
you need for your purposes, as long as you implmement the required FSVolume.Operations
protocol. You can omit any operation protocols you don’t need. For example, Passthrough
FSVolume doesn’t implement FSVolume.XattrOperations, FSVolume.Item
Deactivation, or FSVolumeKernelOffloadedIOOperations, in order to keep the sample
project small and simple.


