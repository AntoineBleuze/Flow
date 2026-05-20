# 000_CFStream.pdf

## Page 1

This document describes the generic CFStream functions, data types, and constants. See also
CFReadStream and CFWriteStream for functions and constants specific to read and write
streams respectively.
Note
When you use the CFStream API for networking, read and write operations on sockets can
block. To prevent blocking:
1. Call CFReadStreamSetClient(_:_:_:_:) and CFWriteStreamSetClient(_:_:_:
_:) to register to receive stream-related event notifications.
2. Call CFReadStreamScheduleWithRunLoop(_:_:_:) and CFWriteStreamSchedule
WithRunLoop(_:_:_:) to schedule the stream on a run loop for receiving stream-related
event notifications.
3. Call CFReadStreamOpen(_:) and CFWriteStreamOpen(_:) to open each stream.
4. Read only after receiving a hasBytesAvailable notification. Write only after receiving a
canAcceptBytes notification.
Overview
Topics
Creating Streams
Core Foundation / CFStream
API Collection
CFStream


## Page 2

func CFStreamCreatePairWithPeerSocketSignature(CFAllocator!, Unsafe
Pointer<CFSocketSignature>!, UnsafeMutablePointer<Unmanaged<CFReadStrea
>?>!, UnsafeMutablePointer<Unmanaged<CFWriteStream>?>!)
Creates readable and writable streams connected to a socket.
Deprecated
func CFStreamCreatePairWithSocketToHost(CFAllocator!, CFString!, UInt32
UnsafeMutablePointer<Unmanaged<CFReadStream>?>!, UnsafeMutablePointer<
Unmanaged<CFWriteStream>?>!)
Creates readable and writable streams connected to a TCP/IP port of a particular host.
Deprecated
func CFStreamCreatePairWithSocket(CFAllocator!, CFSocketNativeHandle,
UnsafeMutablePointer<Unmanaged<CFReadStream>?>!, UnsafeMutablePointer<
Unmanaged<CFWriteStream>?>!)
Creates readable and writable streams connected to a socket.
Deprecated
func CFStreamCreateBoundPair(CFAllocator!, UnsafeMutablePointer<
Unmanaged<CFReadStream>?>!, UnsafeMutablePointer<Unmanaged<CFWriteStrea
>?>!, CFIndex)
Creates a bound pair of read and write streams.
func CFStreamCreatePairWithSocketToCFHost(CFAllocator?, CFHost, Int32,
UnsafeMutablePointer<Unmanaged<CFReadStream>?>?, UnsafeMutablePointer<
Unmanaged<CFWriteStream>?>?)
Creates readable and writable streams connected to a given `CFHost` object.
func CFStreamCreatePairWithSocketToNetService(CFAllocator?, CFNetServic
, UnsafeMutablePointer<Unmanaged<CFReadStream>?>?, UnsafeMutablePointer
Unmanaged<CFWriteStream>?>?)
Creates a pair of streams for a CFNetService.
func CFSocketStreamSOCKSGetError(UnsafePointer<CFStreamError>) -> Int32
This function gets error codes in the `kCFStreamErrorDomainSOCKS` domain from the
`CFStreamError` returned by a stream operation.
func CFSocketStreamSOCKSGetErrorSubdomain(UnsafePointer<CFStreamError>)
-> Int32
Obtaining Errors


## Page 3

Gets the error subdomain associated with errors in the `kCFStreamErrorDomainSOCKS`
domain from the `CFStreamError` returned by a stream operation.
func CFReadStreamSetProperty(CFReadStream!, CFStreamPropertyKey!, CFTyp
Ref!) -> Bool
Sets the value of a property for a stream.
func CFWriteStreamSetProperty(CFWriteStream!, CFStreamPropertyKey!,
CFTypeRef!) -> Bool
Sets the value of a property for a stream.
CFStream Socket Security Level Constants
Constants for setting the security level of a socket stream.
struct CFStreamError
The structure returned by CFReadStreamGetError(_:) and CFWriteStreamGet
Error(_:).
struct CFStreamClientContext
A structure that contains program-defined data and callbacks with which you can configure 
stream’s client behavior.
enum CFStreamStatus
Constants that describe the status of a stream.
enum CFStreamErrorDomain
Defines constants for values returned in the domain field of the CFStreamError structure.
CFStream Error Domain Constants (CFHost)
Defines constants for values returned in the domain field of the CFStreamError structure.
Error Subdomains
Subdomains used to determine how to interpret an error in the kCFStreamErrorDomain
SOCKS domain.
Secure Sockets (SOCKS) Errors
Setting the Security Protocol
Data Types
Constants


## Page 4

Error codes returned by the `kCFStreamErrorDomainSOCKS` error domain.
struct CFStreamEventType
Defines constants for stream-related events.
Stream Properties
Stream property names that can be set or copied.
CFStream Property SSL Settings Constants
Constants for use in a CFDictionary object that is the value of the kCFStreamProperty
SSLSettings stream property key.
CFStream Socket Security Level Constants
Constants for setting the security level of a socket stream.
CFStream SOCKS Proxy Key Constants
Constants for SOCKS Proxy CFDictionary keys.
Stream Service Types
String constants that specify the service type of a stream.
Getting Started with Networking, Internet, and Web
CFNetwork Programming Guide
Core Foundation Structures
Core Foundation Enumerations
Core Foundation Constants
Core Foundation Functions
Core Foundation Data Types
See Also
Related Documentation
Reference


## Page 5

Core Foundation Macros


