# 001_CFReadStreamCreateForStreamedHTTPRequest________.pdf

## Page 1

Deprecated
Use NSURLSession API for http requests
alloc
The allocator to use to allocate memory for the new object. Pass NULL or kCFAllocatorDefau
to use the current default allocator.
requestHeaders
A CFHTTP request header.
requestBody
Read stream reference for the request body.
Parameters
CFNetwork / CFReadStreamCreateForStreamedHTTPRequest(_:_:_:) Deprecated
Function
CFReadStreamCreateForStreamed
HTTPRequest(_:_:_:) Deprecated
Creates a read stream for a CFHTTP request message object whose body is too
long to keep in memory.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.2–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 2

A new read stream, or NULL if there was a problem creating the object. Ownership follows the Th
Create Rule.
This function creates a read stream for the response to the requestHeaders plus request
Body. Call this function instead of CFReadStreamCreateForHTTPRequest(_:_:) when the
body of the request is so long that you do not want it to be resident in memory.
Because streams cannot be reset, read streams created this way cannot be enabled for
autoredirection.
If the Content-Length header is set in requestHeaders, it is assumed that the length is correct
and that requestBody will report end-of-stream after precisely Content-Length bytes have bee
read from it. If the Content-Length header is not set, the chunked transfer-encoding will be added
to requestHeaders, and bytes read from requestBody will be transmitted chunked. The body
of requestHeaders is ignored.
After creating the read stream, you can call CFReadStreamGetError(_:) at any time to check
the status of the stream. You may want to call CFHTTPReadStreamSetProxy to set the name
and port number for a proxy. To serialize the request and send it, call CFReadStreamOpen(_:).
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
let kCFStreamPropertyHTTPAttemptPersistentConnection: CFString
Deprecated
let kCFStreamPropertyHTTPFinalRequest: CFString
HTTP Final Request property. A value of type CFHTTPMessage containing the final message
transmitted by the stream after all modifications (including authentication, connection policy
redirects, and so on) have been made. This property cannot be set.
Deprecated
let kCFStreamPropertyHTTPFinalURL: CFString
Return Value
Discussion
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
let kCFStreamPropertyFTPAttemptPersistentConnection: CFString
Deprecated


