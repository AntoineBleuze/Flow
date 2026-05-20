# 000_CFReadStreamCreateForHTTPRequest______.pdf

## Page 1

Deprecated
Use NSURLSession API for http requests
alloc
The allocator to use to allocate memory for the new object. Pass NULL or kCFAllocatorDefau
to use the current default allocator.
request
A CFHTTP request message whose body and headers have been set.
A new read stream, or NULL if there was a problem creating the object. Ownership follows the Th
Create Rule.
Parameters
Return Value
CFNetwork / CFReadStreamCreateForHTTPRequest(_:_:) Deprecated
Function
CFReadStreamCreateForHTTPRequest(_:
_:) Deprecated
Creates a read stream for a CFHTTP request message.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.2–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 2

This function creates a read stream and associates it with the specified request. Automatic
redirection is disabled by default. After creating the read stream, you can call CFReadStreamGe
Error(_:) at any time to check the status of the stream. You may want to call CFHTTPRead
StreamSetRedirectsAutomatically to enable automatic redirection, or CFHTTPRead
StreamSetProxy to set the name and port number for a proxy. To serialize the request and sen
it, call CFReadStreamOpen(_:).
If the body of the request is too long to keep in memory, call CFReadStreamCreateFor
StreamedHTTPRequest(_:_:_:) instead of this function.
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
Discussion
See Also
Streams


## Page 3

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
let kCFStreamPropertyFTPAttemptPersistentConnection: CFString
Deprecated


