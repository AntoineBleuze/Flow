# 030_CFStreamCreatePairWithSocketToNetService__________.pdf

## Page 1

Deprecated
Use Network framework instead
alloc
The allocator to use to allocate memory for the CFReadStream and CFWriteStream
objects. Pass NULL or kCFAllocatorDefault to use the current default allocator.
service
Reference to the CFNetService to which the streams are to be connected. If the service is
not resolved, the service will be resolved before the streams are connected.
writeStream
Parameters
CFNetwork / CFStreamCreatePairWithSocketToNetService(_:_:_:_:) Deprecated
Function
CFStreamCreatePairWithSocketToNet
Service(_:_:_:_:) Deprecated
Creates a pair of streams for a CFNetService.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.3–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 2

Upon return, contains a CFWriteStream object connected to the service specified by
service, or NULL if there is a failure during creation. If you pass NULL, the function will not
create a writable stream. Ownership follows the The Create Rule.
The streams do not create a socket, resolve the service, or connect to the service’s host until you
open one of the streams.
Most properties are shared by both streams. Setting a shared property for one stream
automatically sets the property for the other.
This function is thread safe.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message object whose body is too long to keep
in memory.
Deprecated
let kCFStreamPropertyHTTPAttemptPersistentConnection: CFString
Deprecated
let kCFStreamPropertyHTTPFinalRequest: CFString
HTTP Final Request property. A value of type CFHTTPMessage containing the final message
transmitted by the stream after all modifications (including authentication, connection policy
redirects, and so on) have been made. This property cannot be set.
Deprecated
let kCFStreamPropertyHTTPFinalURL: CFString
Discussion
Special Considerations
See Also
Streams


## Page 3

HTTP Final URL property. A value of type CFURL containing the final HTTP URL. This value
differs from the URL in the original HTTP request if an autoredirection occurred. This proper
cannot be set.
Deprecated
let kCFStreamPropertyHTTPProxy: CFString
Deprecated
let kCFStreamPropertyHTTPProxyHost: CFString
Deprecated
let kCFStreamPropertyHTTPProxyPort: CFString
Deprecated
let kCFStreamPropertyHTTPRequestBytesWrittenCount: CFString
Deprecated
let kCFStreamPropertyHTTPResponseHeader: CFString
HTTP Response Header property. When copied by CFReadStreamCopyProperty(_:_:)
the header of an HTTP response message is returned.
Deprecated
let kCFStreamPropertyHTTPSProxyHost: CFString
Deprecated
let kCFStreamPropertyHTTPSProxyPort: CFString
Deprecated
let kCFStreamPropertyHTTPShouldAutoredirect: CFString
HTTP Should Auto Redirect property. Set this property to kCFBooleanTrue to enable
autoredirection; set this property to kCFBooleanFalse to disable autoredirection.
Deprecated
func CFWriteStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFWriteStream>
Creates an FTP write stream.
Deprecated
func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated


