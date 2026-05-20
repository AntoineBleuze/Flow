# Streams.pdf

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


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

Deprecated
Use NSURLSession API for http requests
HTTP Attempt Persistent Connection property. The value of this property is a CFBoolean. If this
property is set to kCFBooleanTrue, the HTTP stream looks for an appropriate existing persisten
connection to use. If it cannot find one, the HTTP stream will try to create one.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertyHTTPAttemptPersistentConnection Deprecated
Global Variable
kCFStreamPropertyHTTPAttempt
PersistentConnection Deprecated
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.2–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 8

func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message object whose body is too long to keep
in memory.
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


## Page 9

func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated
let kCFStreamPropertyFTPAttemptPersistentConnection: CFString
Deprecated


## Page 10

Deprecated
Use NSURLSession API for http requests
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
See Also
Streams
CFNetwork / kCFStreamPropertyHTTPFinalRequest Deprecated
Global Variable
kCFStreamPropertyHTTPFinal
Request Deprecated
HTTP Final Request property. A value of type CFHTTPMessage containing the fin
message transmitted by the stream after all modifications (including
authentication, connection policy, redirects, and so on) have been made. This
property cannot be set.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.5–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 11

Creates a read stream for a CFHTTP request message object whose body is too long to keep
in memory.
Deprecated
let kCFStreamPropertyHTTPAttemptPersistentConnection: CFString
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


## Page 12



## Page 13

Deprecated
Use NSURLSession API for http requests
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message object whose body is too long to keep
in memory.
Deprecated
See Also
Streams
CFNetwork / kCFStreamPropertyHTTPFinalURL Deprecated
Global Variable
kCFStreamPropertyHTTPFinalURL Deprecated
HTTP Final URL property. A value of type CFURL containing the final HTTP URL.
This value differs from the URL in the original HTTP request if an autoredirection
occurred. This property cannot be set.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.2–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 14

let kCFStreamPropertyHTTPAttemptPersistentConnection: CFString
Deprecated
let kCFStreamPropertyHTTPFinalRequest: CFString
HTTP Final Request property. A value of type CFHTTPMessage containing the final message
transmitted by the stream after all modifications (including authentication, connection policy
redirects, and so on) have been made. This property cannot be set.
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


## Page 15

Deprecated
Use NSURLSession API for http requests
HTTP Proxy property. To cause an HTTP CFStream to use an HTTP proxy, set the value of this
property to a CFDictionary that includes at least one host/port pair described in “CFStream SOCK
Proxy Key Constants” in CFStream. SystemConfiguration returns a CFDictionary that is usable
without modification.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertyHTTPProxy Deprecated
Global Variable
kCFStreamPropertyHTTPProxy Deprecated
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.2–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 16

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


## Page 17

func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated
let kCFStreamPropertyFTPAttemptPersistentConnection: CFString
Deprecated


## Page 18

Deprecated
Use NSURLSession API for http requests
HTTP Proxy Host property. If an HTTP CFStream is using an HTTP proxy, the value of this propert
is a CFString containing the host name or IP number of the proxy server.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertyHTTPProxyHost Deprecated
Global Variable
kCFStreamPropertyHTTPProxy
Host Deprecated
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.2–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 19

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


## Page 20

func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated
let kCFStreamPropertyFTPAttemptPersistentConnection: CFString
Deprecated


## Page 21

Deprecated
Use NSURLSession API for http requests
HTTP Proxy Host property. If an HTTP CFStream is using an HTTP proxy, the value of this propert
is a CFNumber containing the port number of the proxy server.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertyHTTPProxyPort Deprecated
Global Variable
kCFStreamPropertyHTTPProxy
Port Deprecated
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.2–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 22

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


## Page 23

func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated
let kCFStreamPropertyFTPAttemptPersistentConnection: CFString
Deprecated


## Page 24

Deprecated
Use NSURLSession API for http requests
HTTP Request Bytes Written property. This property can only be retrieved; it cannot be set. The
value of this property is a CFNumber containing the number of body bytes that have been written
to the server thus far. HTTP header bytes are not included in the count. You can use this property
to track the progress of HTTP uploads that take a substantial amount of time to complete.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertyHTTPRequestBytesWrittenCount Deprecated
Global Variable
kCFStreamPropertyHTTPRequestBytes
WrittenCount Deprecated
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 25

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


## Page 26

func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated
let kCFStreamPropertyFTPAttemptPersistentConnection: CFString
Deprecated


## Page 27

Deprecated
Use NSURLSession API for http requests
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message object whose body is too long to keep
in memory.
Deprecated
See Also
Streams
CFNetwork / kCFStreamPropertyHTTPResponseHeader Deprecated
Global Variable
kCFStreamPropertyHTTPResponse
Header Deprecated
HTTP Response Header property. When copied by CFReadStreamCopy
Property(_:_:), the header of an HTTP response message is returned.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.1–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 28

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


## Page 29

Deprecated
Use NSURLSession API for http requests
HTTPS Proxy Host property. If a CFStream is using an HTTPS proxy, the value of this property is a
CFString containing the host name or IP number of the proxy server.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertyHTTPSProxyHost Deprecated
Global Variable
kCFStreamPropertyHTTPSProxy
Host Deprecated
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.2–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 30

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
let kCFStreamPropertyHTTPResponseHeader: CFString
HTTP Response Header property. When copied by CFReadStreamCopyProperty(_:_:)
the header of an HTTP response message is returned.
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


## Page 31

func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated
let kCFStreamPropertyFTPAttemptPersistentConnection: CFString
Deprecated


## Page 32

Deprecated
Use NSURLSession API for http requests
HTTPS Proxy Host property. If a CFStream is using an HTTPS proxy, the value of this property is a
CFNumber containing the port number of the proxy server.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertyHTTPSProxyPort Deprecated
Global Variable
kCFStreamPropertyHTTPSProxy
Port Deprecated
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.2–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 33

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
let kCFStreamPropertyHTTPResponseHeader: CFString
HTTP Response Header property. When copied by CFReadStreamCopyProperty(_:_:)
the header of an HTTP response message is returned.
Deprecated
let kCFStreamPropertyHTTPSProxyHost: CFString
Deprecated
let kCFStreamPropertyHTTPShouldAutoredirect: CFString
HTTP Should Auto Redirect property. Set this property to kCFBooleanTrue to enable
autoredirection; set this property to kCFBooleanFalse to disable autoredirection.
Deprecated
func CFWriteStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFWriteStream>
Creates an FTP write stream.
Deprecated


## Page 34

func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated
let kCFStreamPropertyFTPAttemptPersistentConnection: CFString
Deprecated


## Page 35

Deprecated
Use NSURLSession API for http requests
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message object whose body is too long to keep
in memory.
See Also
Streams
CFNetwork / kCFStreamPropertyHTTPShouldAutoredirect Deprecated
Global Variable
kCFStreamPropertyHTTPShould
Autoredirect Deprecated
HTTP Should Auto Redirect property. Set this property to kCFBooleanTrue to
enable autoredirection; set this property to kCFBooleanFalse to disable
autoredirection.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.2–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 36

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
let kCFStreamPropertyHTTPResponseHeader: CFString
HTTP Response Header property. When copied by CFReadStreamCopyProperty(_:_:)
the header of an HTTP response message is returned.
Deprecated
let kCFStreamPropertyHTTPSProxyHost: CFString
Deprecated
let kCFStreamPropertyHTTPSProxyPort: CFString
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


## Page 37

Deprecated
Use NSURLSessionAPI for ftp requests
alloc
The allocator to use to allocate memory for the new object. Pass NULL or kCFAllocatorDefau
to use the current default allocator.
ftpURL
A pointer to a CFURL structure for the URL to be uploaded created by calling any of the
CFURLCreate functions, such as CFURLCreateWithString.
A new write stream, or NULL if the call failed. Ownership follows the The Create Rule.
Parameters
Return Value
CFNetwork / CFWriteStreamCreateWithFTPURL(_:_:) Deprecated
Function
CFWriteStreamCreateWithFTPURL(_:
_:) Deprecated
Creates an FTP write stream.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 38

This function creates an FTP write stream for uploading data to an FTP URL. If the ftpURL
parameter is created with the user name and password as part of the URL (such as
ftp://username:password@ftp.example.com) then the user name and password will
automatically be set in the CFWriteStream. Call CFWriteStreamSetProperty(_:_:_:) to
set the steam’s properties, such as kCFStreamPropertyFTPUserName and kCFStream
PropertyFTPPassword to associate a user name and password with the stream that are used t
log in when the stream is opened. See Constants for a description of all FTP stream properties.
After creating the write stream, you can call CFWriteStreamGetStatus(_:) at any time to
check the status of the stream.
To initiate a connection with the FTP server, call CFWriteStreamOpen(_:). If the URL specifies
directory, the open is immediately followed by the event kCFStreamEventEndEncountered
(and the stream passes to the state kCFStreamStatusAtEnd). Once the stream reaches this
state, the directory has been created. Intermediary directories are not created.
To write to the FTP stream, call CFWriteStreamWrite(_:_:_:).
To close a connection with the FTP server, call CFWriteStreamClose(_:).
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
Discussion
See Also
Streams


## Page 39

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
func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated
let kCFStreamPropertyFTPAttemptPersistentConnection: CFString
Deprecated


## Page 40

Deprecated
Use NSURLSessionAPI for ftp requests
alloc
The allocator to use to allocate memory for the new object. Pass NULL or kCFAllocatorDefau
to use the current default allocator.
ftpURL
A pointer to a CFURL structure for the URL to be downloaded that can be created by calling
any of the CFURLCreate functions, such as CFURLCreateWithString.
A new read stream, or NULL if the call failed. Ownership follows the The Create Rule.
Parameters
Return Value
CFNetwork / CFReadStreamCreateWithFTPURL(_:_:) Deprecated
Function
CFReadStreamCreateWithFTPURL(_:
_:) Deprecated
Creates an FTP read stream.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 41

This function creates an FTP read stream for downloading data from an FTP URL. If the ftpURL
parameter is created with the user name and password as part of the URL (such as
ftp://username:password@ftp.example.com) then the user name and password will
automatically be set in the CFReadStream. Otherwise, call CFReadStreamSetProperty(_:_
_:) to set the steam’s properties, such as kCFStreamPropertyFTPUserName and kCFStrea
PropertyFTPPassword to associate a user name and password with the stream that are used t
log in when the stream is opened. See Constants for a description of all FTP stream properties.
To initiate a connection with the FTP server, call CFReadStreamOpen(_:). To read the FTP
stream, call CFReadStreamRead(_:_:_:). If the URL refers to a directory, the stream provides
the listing results sent by the server. If the URL refers to a file, the stream provides the data in tha
file.
To close a connection with the FTP server, call CFReadStreamClose(_:).
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
HTTP Final URL property. A value of type CFURL containing the final HTTP URL. This value
differs from the URL in the original HTTP request if an autoredirection occurred. This proper
Discussion
See Also
Streams


## Page 42

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
let kCFStreamPropertyFTPAttemptPersistentConnection: CFString
Deprecated


## Page 43

Deprecated
Use NSURLSessionAPI for ftp requests
FTP Attempt Persistent Connection stream property key for set and copy operations. Set this
property to kCFBooleanTrue to enable the reuse of existing server connections; set this proper
to kCFBooleanFalse to not reuse existing server connections. By default, this property is set to
kCFBooleanTrue.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertyFTPAttemptPersistentConnection Deprecated
Global Variable
kCFStreamPropertyFTPAttemptPersistent
Connection Deprecated
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 44

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


## Page 45

Deprecated
func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated


## Page 46

Deprecated
Use NSURLSessionAPI for ftp requests
FTP Fetch Resource Information stream property key for set and copy operations. Set this proper
to kCFBooleanTrue to require that resource information, such as size, must be provided before
download starts; set this property to kCFBooleanFalse to allow downloads to start without
resource information. For this version, size is the only resource information.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertyFTPFetchResourceInfo Deprecated
Global Variable
kCFStreamPropertyFTPFetchResource
Info Deprecated
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 47

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


## Page 48

Deprecated
func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated


## Page 49

Deprecated
Use NSURLSessionAPI for ftp requests
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message object whose body is too long to keep
in memory.
See Also
Streams
CFNetwork / kCFStreamPropertyFTPFileTransferOffset Deprecated
Global Variable
kCFStreamPropertyFTPFileTransfer
Offset Deprecated
FTP File Transfer Offset stream property key for set and copy operations. The valu
of this property is a CFNumber of type kCFNumberLongLongType representing
the file offset at which to start the transfer.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 50

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


## Page 51

Deprecated


## Page 52

Deprecated
Use NSURLSessionAPI for ftp requests
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message object whose body is too long to keep
in memory.
Deprecated
See Also
Streams
CFNetwork / kCFStreamPropertyFTPPassword Deprecated
Global Variable
kCFStreamPropertyFTPPassword Deprecated
FTP Password stream property key for set and copy operations. A value of type
CFString for storing the login password. Don’t set this property when anonymous
FTP is desired.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 53

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


## Page 54



## Page 55

Deprecated
Use NSURLSessionAPI for ftp requests
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message object whose body is too long to keep
in memory.
Deprecated
See Also
Streams
CFNetwork / kCFStreamPropertyFTPProxy Deprecated
Global Variable
kCFStreamPropertyFTPProxy Deprecated
FTP Proxy stream property key for set and copy operations. The property is a valu
of type CFDictionary that holds proxy dictionary key-value pairs. The dictionary
returned by SystemConfiguration can also be set as the value of this property.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 56

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


## Page 57



## Page 58

Deprecated
Use NSURLSessionAPI for ftp requests
FTP Proxy Host stream property key or an FTP Proxy dictionary key for set and copy operations.
The value of this property is a CFString containing the host name of a proxy server. This property
can be set and copied individually or via a CFDictionary. This property is the same as the kSCPro
NetProxiesFTPProxy property defined in SCSchemaDefinitions.h.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertyFTPProxyHost Deprecated
Global Variable
kCFStreamPropertyFTPProxyHost Deprecated
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 59

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


## Page 60

Deprecated
func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated


## Page 61

Deprecated
Use NSURLSessionAPI for ftp requests
FTP Proxy Port stream property key or FTP Proxy dictionary key for set and copy operations. The
value of this property is a CFString containing the password to be used when connecting to the
proxy server.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertyFTPProxyPassword Deprecated
Global Variable
kCFStreamPropertyFTPProxy
Password Deprecated
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 62

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


## Page 63

Deprecated
func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated


## Page 64

Deprecated
Use NSURLSessionAPI for ftp requests
FTP Proxy Port stream property key or an FTP Proxy dictionary key for set and copy operations.
The value of this property is a CFNumber of type kCFNumberIntType containing the port numb
of a proxy server. This property can be set and copied individually or via a CFDictionary. This
property is the same as the kSCPropNetProxiesFTPPort property defined in SCSchema
Definitions.h.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertyFTPProxyPort Deprecated
Global Variable
kCFStreamPropertyFTPProxyPort Deprecated
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 65

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


## Page 66

Deprecated
func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated


## Page 67

Deprecated
Use NSURLSessionAPI for ftp requests
FTP Proxy Host stream property key or FTP Proxy dictionary key for set and copy operations. The
value of this property is a CFString containing the username to be used when connecting to the
proxy server.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertyFTPProxyUser Deprecated
Global Variable
kCFStreamPropertyFTPProxyUser Deprecated
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 68

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


## Page 69

func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated


## Page 70

Deprecated
Use NSURLSessionAPI for ftp requests
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message object whose body is too long to keep
in memory.
See Also
Streams
CFNetwork / kCFStreamPropertyFTPResourceSize Deprecated
Global Variable
kCFStreamPropertyFTPResource
Size Deprecated
FTP Resource Size read stream property key copy operations. This property store
a CFNumber of type kCFNumberLongLongType representing the size of a
resource in bytes.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 71

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


## Page 72

Deprecated


## Page 73

Deprecated
Use NSURLSessionAPI for ftp requests
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message object whose body is too long to keep
in memory.
See Also
Streams
CFNetwork / kCFStreamPropertyFTPUsePassiveMode Deprecated
Global Variable
kCFStreamPropertyFTPUsePassive
Mode Deprecated
FTP Passive Mode stream property key for set and copy operations. Set this
property to kCFBooleanTrue to enable passive mode; set this property to k
CFBooleanFalse to disable passive mode.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 74

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


## Page 75

Deprecated


## Page 76

Deprecated
Use NSURLSessionAPI for ftp requests
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message object whose body is too long to keep
in memory.
Deprecated
See Also
Streams
CFNetwork / kCFStreamPropertyFTPUserName Deprecated
Global Variable
kCFStreamPropertyFTPUserName Deprecated
FTP User Name stream property key for set and copy operations. A value of type
CFString for storing the login user name. Don’t set this property when anonymous
FTP is desired.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 77

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


## Page 78



## Page 79

error
The error value to decode.
Error codes in the kCFStreamErrorDomainSOCKS domain can come from multiple parts of the
protocol stack, many of which define their own error values as part of outside specifications such
as the HTTP specification.
To avoid confusion from conflicting error numbers, error codes in the kCFStreamErrorDomain
SOCKS domain contain two parts: a subdomain, which tells which part of the protocol stack
generated the error, and the error code itself.
Calling CFSocketStreamSOCKSGetError(_:) returns the error code itself, which must be
interpreted in the context of the result of a call to CFSocketStreamSOCKSGetError
Subdomain(_:). Possible return values (beyond subdomain-specific values such as client
versions and HTTP error codes) are listed in Secure Sockets (SOCKS) Errors.
Parameters
Discussion
See Also
CFNetwork / CFSocketStreamSOCKSGetError(_:)
Function
CFSocketStreamSOCKSGetError(_:)
This function gets error codes in the kCFStreamErrorDomainSOCKS domain
from the CFStreamError returned by a stream operation.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 80

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
Streams


## Page 81

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


## Page 82

error
The error value to decode.
Error codes in the kCFStreamErrorDomainSOCKS domain can come from multiple parts of the
protocol stack, many of which define their own error values as part of outside specifications such
as the HTTP specification.
To avoid confusion from conflicting error numbers, error codes in the kCFStreamErrorDomain
SOCKS domain contain two parts: a subdomain, which tells which part of the protocol stack
generated the error, and the error code itself.
Calling CFSocketStreamSOCKSGetErrorSubdomain(_:) returns an identifier that tells whic
layer of the protocol stack produced the error. The possible values are listed under Data Types in
CFStream. With this information, you can interpret the error codes returned by CFSocketStrea
SOCKSGetError(_:).
Parameters
Discussion
CFNetwork / CFSocketStreamSOCKSGetErrorSubdomain(_:)
Function
CFSocketStreamSOCKSGetError
Subdomain(_:)
Gets the error subdomain associated with errors in the kCFStreamError
DomainSOCKS domain from the CFStreamError returned by a stream
operation.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 83

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
See Also
Streams


## Page 84

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


## Page 85

Deprecated
Use Network framework instead
alloc
The allocator to use to allocate memory for the CFReadStream and CFWriteStream
objects. Pass NULL or kCFAllocatorDefault to use the current default allocator.
host
A CFHost object to which the streams are connected. If unresolved, the host will be resolved
prior to connecting.
port
Parameters
CFNetwork / CFStreamCreatePairWithSocketToCFHost(_:_:_:_:_:) Deprecated
Function
CFStreamCreatePairWithSocketTo
CFHost(_:_:_:_:_:) Deprecated
Creates readable and writable streams connected to a given CFHost object.
iOS 2.0–16.0 Deprecated
iPadOS 2.0–16.0 Deprecated
Mac Catalyst 13.1+
macOS 10.3–15.0 Deprecated
tvOS 9.0+
visionOS 1.0–2.0 Deprecated


## Page 86

The TCP port number to which the socket streams should connect.
readStream
Upon return, contains a CFReadStream object connected to the host host on port port, o
NULL if there is a failure during creation. If you pass NULL, the function will not create a
readable stream. Ownership follows the The Create Rule.
writeStream
Upon return, contains a CFWriteStream object connected to the host host on port port, 
NULL if there is a failure during creation. If you pass NULL, the function will not create a
writable stream. Ownership follows the The Create Rule.
The streams do not create a socket or connect to the specified host until you open one of the
streams.
Most properties are shared by both streams. Setting a shared property for one stream
automatically sets the property for the other.
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
Discussion
See Also
Streams


## Page 87

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


## Page 88

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


## Page 89

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


## Page 90

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


## Page 91

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
See Also
Streams
CFNetwork / kCFStreamNetworkServiceType
Global Variable
kCFStreamNetworkServiceType
The type of service for the stream. Providing the service type allows the system to
properly handle certain attributes of the stream, including routing and suspension
behavior. Most streams do not need to set this property. See Stream Service Type
for a list of possible values.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS 9.0+
visionOS 1.0+


## Page 92

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


## Page 93

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
See Also
Streams
CFNetwork / kCFStreamNetworkServiceTypeBackground
Global Variable
kCFStreamNetworkServiceType
Background
Specifies that the stream is a background download.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS 9.0+
visionOS 1.0+


## Page 94

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


## Page 95

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
See Also
Streams
CFNetwork / kCFStreamNetworkServiceTypeCallSignaling
Global Variable
kCFStreamNetworkServiceTypeCall
Signaling
A call signaling service.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+


## Page 96

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


## Page 97

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
See Also
Streams
CFNetwork / kCFStreamNetworkServiceTypeVideo
Global Variable
kCFStreamNetworkServiceTypeVideo
Specifies that the stream is providing interactive video data.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS 9.0+
visionOS 1.0+


## Page 98

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


## Page 99

Deprecated
use PushKit for VoIP control purposes
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
See Also
Streams
CFNetwork / kCFStreamNetworkServiceTypeVoIP Deprecated
Global Variable
kCFStreamNetworkServiceTypeVo
IP Deprecated
Specifies that the stream is providing VoIP service.
iOS 4.0–9.0 Deprecated
iPadOS 4.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.7–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 100

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


## Page 101



## Page 102

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
See Also
Streams
CFNetwork / kCFStreamNetworkServiceTypeVoice
Global Variable
kCFStreamNetworkServiceTypeVoice
Specifies that the stream is providing interactive voice data.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS 9.0+
visionOS 1.0+


## Page 103

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


## Page 104

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
See Also
Streams
CFNetwork / kCFStreamErrorDomainFTP
Global Variable
kCFStreamErrorDomainFTP
The error code is an FTP error code.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.3+
tvOS 9.0+
visionOS 1.0+


## Page 105

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


## Page 106

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
See Also
Streams
CFNetwork / kCFStreamErrorDomainHTTP
Global Variable
kCFStreamErrorDomainHTTP
The error code is an HTTP error code.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 107

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


## Page 108

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
See Also
Streams
CFNetwork / kCFStreamErrorDomainMach
Global Variable
kCFStreamErrorDomainMach
The error code is a Mach error code defined in mach/error.h.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS 9.0+
visionOS 1.0+


## Page 109

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


## Page 110

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
See Also
Streams
CFNetwork / kCFStreamErrorDomainNetDB
Global Variable
kCFStreamErrorDomainNetDB
The error code is an error code defined in netdb.h.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.3+
tvOS 9.0+
visionOS 1.0+


## Page 111

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


## Page 112

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
See Also
Streams
CFNetwork / kCFStreamErrorDomainNetServices
Global Variable
kCFStreamErrorDomainNetServices
The error code is a CFNetService error code. For details, see the CFNet
ServicesError enumeration.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS 9.0+
visionOS 1.0+


## Page 113

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


## Page 114

let kCFStreamErrorDomainNetDB: Int32
The error code is an error code defined in `netdb.h`.
let kCFStreamErrorDomainNetServices: Int32
The error code is a `CFNetService` error code. For details, see the [`CFNetServicesError`]
(doc://com.apple.cfnetwork/documentation/CFNetwork/CFNetServicesError) enumeration.
let kCFStreamErrorDomainMach: Int32
The error code is a Mach error code defined in `mach/error.h`.
let kCFStreamErrorDomainFTP: Int32
The error code is an FTP error code.
let kCFStreamErrorDomainHTTP: Int32
The error code is an HTTP error code.
let kCFStreamErrorDomainSystemConfiguration: Int32
The error code is a system configuration error code as defined in
`System/ConfigurationSystemConfiguration.h`.
See Also
Constants
Core Foundation / kCFStreamErrorDomainSOCKS
Global Variable
kCFStreamErrorDomainSOCKS
The error code is a SOCKS proxy error.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.0+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 115

let kCFStreamErrorDomainWinSock: CFIndex
When running CFNetwork code on Windows, this domain returns error codes associated wit
the underlying TCP/IP stack. You should also note that non-networking errors such as
`ENOMEM` are delivered through the POSIX domain. See the header `winsock2.h` for
relevant error codes.
let kCFStreamErrorDomainSSL: Int32
The error code is an SSL error code as defined in Security/SecureTransport.h.


## Page 116

let kCFStreamErrorDomainNetDB: Int32
The error code is an error code defined in `netdb.h`.
let kCFStreamErrorDomainNetServices: Int32
The error code is a `CFNetService` error code. For details, see the [`CFNetServicesError`]
(doc://com.apple.cfnetwork/documentation/CFNetwork/CFNetServicesError) enumeration.
let kCFStreamErrorDomainMach: Int32
The error code is a Mach error code defined in `mach/error.h`.
let kCFStreamErrorDomainFTP: Int32
The error code is an FTP error code.
let kCFStreamErrorDomainHTTP: Int32
The error code is an HTTP error code.
let kCFStreamErrorDomainSystemConfiguration: Int32
The error code is a system configuration error code as defined in
`System/ConfigurationSystemConfiguration.h`.
See Also
Constants
Core Foundation / kCFStreamErrorDomainSSL
Global Variable
kCFStreamErrorDomainSSL
The error code is an SSL error code as defined in Security/Secure
Transport.h.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 117

let kCFStreamErrorDomainWinSock: CFIndex
When running CFNetwork code on Windows, this domain returns error codes associated wit
the underlying TCP/IP stack. You should also note that non-networking errors such as
`ENOMEM` are delivered through the POSIX domain. See the header `winsock2.h` for
relevant error codes.
let kCFStreamErrorDomainSOCKS: Int32
The error code is a SOCKS proxy error.


## Page 118

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
See Also
Streams
CFNetwork / kCFStreamErrorDomainSystemConfiguration
Global Variable
kCFStreamErrorDomainSystem
Configuration
The error code is a system configuration error code as defined in
System/ConfigurationSystemConfiguration.h.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.3+
tvOS 9.0+
visionOS 1.0+


## Page 119

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


## Page 120

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
See Also
Streams
CFNetwork / kCFStreamErrorDomainWinSock
Global Variable
kCFStreamErrorDomainWinSock
When running CFNetwork code on Windows, this domain returns error codes
associated with the underlying TCP/IP stack. You should also note that non-
networking errors such as ENOMEM are delivered through the POSIX domain. See
the header winsock2.h for relevant error codes.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.5+
tvOS 9.0+
visionOS 1.0+


## Page 121

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


## Page 122

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
See Also
Streams
CFNetwork / kCFStreamPropertyConnectionIsCellular
Global Variable
kCFStreamPropertyConnectionIsCellular
A boolean value indicating whether the stream is connected over a cellular
(WWAN) interface. This is a read-only property, and is false until the connection
has been established.
iOS 6.0+
iPadOS 6.0+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 123

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


## Page 124

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
See Also
Streams
CFNetwork / kCFStreamPropertyNoCellular
Global Variable
kCFStreamPropertyNoCellular
A Boolean value indicating that the connection should not be established over a
cellular (WWAN) connection. This value can only be set before you open the
stream.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 125

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


## Page 126

The key’s value is CFBoolean object whose value indicates whether local hostnames should be
subject to proxy handling.
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
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertyProxyLocalBypass
Global Variable
kCFStreamPropertyProxyLocalBypass
Proxy Local Bypass property key.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+


## Page 127

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


## Page 128



## Page 129

The value is a CFString object containing the user’s password.
let kCFStreamPropertySOCKSProxyHost: CFString
Constant for the SOCKS proxy host key.
let kCFStreamPropertySOCKSProxyPort: CFString
Constant for the SOCKS proxy host port key.
let kCFStreamPropertySOCKSVersion: CFString
Constant for the SOCKS version key.
let kCFStreamSocketSOCKSVersion4: CFString
Constant used in the kCFStreamSockerSOCKSVersion key to specify SOCKS4 as the
SOCKS version for the stream.
let kCFStreamSocketSOCKSVersion5: CFString
Discussion
See Also
Constants
Core Foundation / kCFStreamPropertySOCKSPassword
Global Variable
kCFStreamPropertySOCKSPassword
Constant for the key required to set a user’s password.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 130

Constant used in the kCFStreamSOCKSVersion key to specify SOCKS5 as the SOCKS
version for the stream.
let kCFStreamPropertySOCKSUser: CFString
Constant for the key required to set a user name.


## Page 131

To set a CFStream object to use a SOCKS proxy, call CFReadStreamSetProperty(_:_:_:) 
CFWriteStreamSetProperty(_:_:_:) with the property name set to kCFStreamPropert
SOCKSProxy and its value set to a CFDictionary object having at minimum a kCFStream
PropertySOCKSProxyHost key and a kCFStreamPropertySOCKSProxyPort key. For
information on these keys, see CFStream SOCKS Proxy Key Constants. SystemConfiguration
returns a CFDictionary for SOCKS proxies that is usable without modification.
static let appendToFile: CFStreamPropertyKey!
Value is a CFBoolean value that indicates whether to append the written data to a file, if it
already exists, rather than to replace its contents.
static let dataWritten: CFStreamPropertyKey!
Value is a CFData object that contains all the bytes written to a writable memory stream. Yo
cannot modify this value.
static let fileCurrentOffset: CFStreamPropertyKey!
Discussion
See Also
Constants
Core Foundation / kCFStreamPropertySOCKSProxy
Global Variable
kCFStreamPropertySOCKSProxy
SOCKS proxy property key.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 132

Value is a CFNumber object containing the current file offset.
static let socketNativeHandle: CFStreamPropertyKey!
Value is a CFData object that contains the native handle for a socket stream—of type
CFSocketNativeHandle—to which the socket stream is connected.
static let socketRemoteHostName: CFStreamPropertyKey!
Value is a CFString object containing the name of the host to which the socket stream is
connected or NULL if unknown.
static let socketRemotePortNumber: CFStreamPropertyKey!
Value is a CFNumber object containing the remote port number to which the socket stream 
connected or NULL if unknown.
let kCFStreamPropertyShouldCloseNativeSocket: CFString
Should Close Native Socket property key.
let kCFStreamPropertySocketSecurityLevel: CFString
Socket Security Level property key.
let kCFStreamPropertySSLPeerCertificates: CFString
SSL Peer Certificates property key for copy operations, which return a `CFArray` object
containing `SecCertificateRef` objects.
let kCFStreamPropertySSLPeerTrust: CFString
SSL Peer Trust property key for copy operations, which return a `SecTrustRef` object
containing the result of the SSL handshake.
let kCFStreamPropertySSLSettings: CFString
SSL Settings property key for set operations.
let kCFStreamPropertySSLContext: CFString
let kCFStreamPropertyProxyLocalBypass: CFString
Proxy Local Bypass property key.
let kCFStreamPropertySocketRemoteHost: CFString
The key’s value is a `CFHostRef` for the remote host if it is known. If not, its value is `NULL`
let kCFStreamPropertySocketRemoteNetService: CFString
The key’s value is a `CFNetServiceRef` for the remote network service if it is known. If not, it
value is `NULL`.


## Page 133



## Page 134

This key contains a CFString object that represents the SOCKS proxy host. Defined to match k
SCPropNetProxiesSOCKSProxy.
let kCFStreamPropertySOCKSProxyPort: CFString
Constant for the SOCKS proxy host port key.
let kCFStreamPropertySOCKSVersion: CFString
Constant for the SOCKS version key.
let kCFStreamSocketSOCKSVersion4: CFString
Constant used in the kCFStreamSockerSOCKSVersion key to specify SOCKS4 as the
SOCKS version for the stream.
let kCFStreamSocketSOCKSVersion5: CFString
Constant used in the kCFStreamSOCKSVersion key to specify SOCKS5 as the SOCKS
version for the stream.
Discussion
See Also
Constants
Core Foundation / kCFStreamPropertySOCKSProxyHost
Global Variable
kCFStreamPropertySOCKSProxyHost
Constant for the SOCKS proxy host key.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 135

let kCFStreamPropertySOCKSUser: CFString
Constant for the key required to set a user name.
let kCFStreamPropertySOCKSPassword: CFString
Constant for the key required to set a user’s password.


## Page 136

This key contains a CFNumberRef object of type kCFNumberSInt32Type whose value
represents the port on which the proxy listens.
let kCFStreamPropertySOCKSProxyHost: CFString
Constant for the SOCKS proxy host key.
let kCFStreamPropertySOCKSVersion: CFString
Constant for the SOCKS version key.
let kCFStreamSocketSOCKSVersion4: CFString
Constant used in the kCFStreamSockerSOCKSVersion key to specify SOCKS4 as the
SOCKS version for the stream.
let kCFStreamSocketSOCKSVersion5: CFString
Constant used in the kCFStreamSOCKSVersion key to specify SOCKS5 as the SOCKS
version for the stream.
Discussion
See Also
Constants
Core Foundation / kCFStreamPropertySOCKSProxyPort
Global Variable
kCFStreamPropertySOCKSProxyPort
Constant for the SOCKS proxy host port key.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 137

let kCFStreamPropertySOCKSUser: CFString
Constant for the key required to set a user name.
let kCFStreamPropertySOCKSPassword: CFString
Constant for the key required to set a user’s password.


## Page 138

The value is a CFString object containing the user’s name.
let kCFStreamPropertySOCKSProxyHost: CFString
Constant for the SOCKS proxy host key.
let kCFStreamPropertySOCKSProxyPort: CFString
Constant for the SOCKS proxy host port key.
let kCFStreamPropertySOCKSVersion: CFString
Constant for the SOCKS version key.
let kCFStreamSocketSOCKSVersion4: CFString
Constant used in the kCFStreamSockerSOCKSVersion key to specify SOCKS4 as the
SOCKS version for the stream.
let kCFStreamSocketSOCKSVersion5: CFString
Discussion
See Also
Constants
Core Foundation / kCFStreamPropertySOCKSUser
Global Variable
kCFStreamPropertySOCKSUser
Constant for the key required to set a user name.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 139

Constant used in the kCFStreamSOCKSVersion key to specify SOCKS5 as the SOCKS
version for the stream.
let kCFStreamPropertySOCKSPassword: CFString
Constant for the key required to set a user’s password.


## Page 140

Its value must be kCFStreamSocketSOCKSVersion4 or kCFStreamSocketSOCKSVersion5
to set SOCKS4 or SOCKS5, respectively. If this key is not present, SOCKS5 is used by default.
let kCFStreamPropertySOCKSProxyHost: CFString
Constant for the SOCKS proxy host key.
let kCFStreamPropertySOCKSProxyPort: CFString
Constant for the SOCKS proxy host port key.
let kCFStreamSocketSOCKSVersion4: CFString
Constant used in the kCFStreamSockerSOCKSVersion key to specify SOCKS4 as the
SOCKS version for the stream.
let kCFStreamSocketSOCKSVersion5: CFString
Constant used in the kCFStreamSOCKSVersion key to specify SOCKS5 as the SOCKS
version for the stream.
Discussion
See Also
Constants
Core Foundation / kCFStreamPropertySOCKSVersion
Global Variable
kCFStreamPropertySOCKSVersion
Constant for the SOCKS version key.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 141

let kCFStreamPropertySOCKSUser: CFString
Constant for the key required to set a user name.
let kCFStreamPropertySOCKSPassword: CFString
Constant for the key required to set a user’s password.


## Page 142

The SSLContextRef object used for read and write operations on a stream.
Before opening a stream, you can copy the object from this property and configure it using the
Secure Transport API. You can also set this property to specify a new SSLContextRef for a
stream. The behavior depends on whether the stream has been opened and on whether an SSL
context is associated with the stream, as follows:
If the stream has not been opened, the specified object replaces any existing context, and is
used in the initial stream handshake when the connection is opened.
If the stream has been opened without SSL enabled, setting this property initiates an SSL
handshake over the existing socket.
After the initial SSL handshake occurs, changing the context object is unsupported.
If an SSL settings dictionary is set for the kCFStreamPropertySSLSettings key, an
SSLContextRef object is created internally and configured based on that dictionary. However, i
an SSLContextRef object is set afterwards, its configuration takes precedence over the
previously configured context.
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertySSLContext
Global Variable
kCFStreamPropertySSLContext
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+


## Page 143

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


## Page 144

Deprecated
func CFWriteStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFWriteStream>
Creates an FTP write stream.
Deprecated
func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated


## Page 145

For more information, see SSLGetPeerCertificates in Security/SecureTransport.h.
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
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertySSLPeerCertificates
Global Variable
kCFStreamPropertySSLPeerCertificates
SSL Peer Certificates property key for copy operations, which return a CFArray
object containing SecCertificateRef objects.
tvOS 9.0+
visionOS 1.0–1.0 Deprecated


## Page 146

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


## Page 147



## Page 148

For more information, see SSLCopyPeerTrust in Security/SecureTransport.h.
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
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertySSLPeerTrust
Global Variable
kCFStreamPropertySSLPeerTrust
SSL Peer Trust property key for copy operations, which return a SecTrustRef
object containing the result of the SSL handshake.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.5+
tvOS 9.0+
visionOS 1.0+


## Page 149

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


## Page 150



## Page 151

The key’s value is a CFDictionary object containing security settings. For information on the
dictionary’s keys and values, see CFStream Property SSL Settings Constants. By default, there ar
no security settings.
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
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertySSLSettings
Global Variable
kCFStreamPropertySSLSettings
SSL Settings property key for set operations.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+


## Page 152

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


## Page 153



## Page 154

If set to kCFBooleanTrue, the stream will close and release the underlying native socket when
the stream is released. If set to kCFBooleanFalse, the stream will not close and release the
underlying native socket when the stream is released. If a stream is created with a native socket,
the default value of this property is kCFBooleanFalse. This property is only available for socket
streams. It can be set by calling CFReadStreamSetProperty(_:_:_:) and CFWriteStream
SetProperty(_:_:_:), and it can be copied by CFReadStreamCopyProperty(_:_:) and
CFWriteStreamCopyProperty(_:_:).
static let appendToFile: CFStreamPropertyKey!
Value is a CFBoolean value that indicates whether to append the written data to a file, if it
already exists, rather than to replace its contents.
static let dataWritten: CFStreamPropertyKey!
Discussion
See Also
Constants
Core Foundation / kCFStreamPropertyShouldCloseNativeSocket
Global Variable
kCFStreamPropertyShouldCloseNative
Socket
Should Close Native Socket property key.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 155

Value is a CFData object that contains all the bytes written to a writable memory stream. Yo
cannot modify this value.
static let fileCurrentOffset: CFStreamPropertyKey!
Value is a CFNumber object containing the current file offset.
static let socketNativeHandle: CFStreamPropertyKey!
Value is a CFData object that contains the native handle for a socket stream—of type
CFSocketNativeHandle—to which the socket stream is connected.
static let socketRemoteHostName: CFStreamPropertyKey!
Value is a CFString object containing the name of the host to which the socket stream is
connected or NULL if unknown.
static let socketRemotePortNumber: CFStreamPropertyKey!
Value is a CFNumber object containing the remote port number to which the socket stream 
connected or NULL if unknown.
let kCFStreamPropertySocketSecurityLevel: CFString
Socket Security Level property key.
let kCFStreamPropertySSLPeerCertificates: CFString
SSL Peer Certificates property key for copy operations, which return a `CFArray` object
containing `SecCertificateRef` objects.
let kCFStreamPropertySSLPeerTrust: CFString
SSL Peer Trust property key for copy operations, which return a `SecTrustRef` object
containing the result of the SSL handshake.
let kCFStreamPropertySSLSettings: CFString
SSL Settings property key for set operations.
let kCFStreamPropertySSLContext: CFString
let kCFStreamPropertySOCKSProxy: CFString
SOCKS proxy property key.
let kCFStreamPropertyProxyLocalBypass: CFString
Proxy Local Bypass property key.
let kCFStreamPropertySocketRemoteHost: CFString
The key’s value is a `CFHostRef` for the remote host if it is known. If not, its value is `NULL`
let kCFStreamPropertySocketRemoteNetService: CFString


## Page 156

The key’s value is a `CFNetServiceRef` for the remote network service if it is known. If not, it
value is `NULL`.


## Page 157

Important
Set this property before opening the stream.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
Discussion
See Also
Streams
CFNetwork / kCFStreamPropertySocketExtendedBackgroundIdleMode
Global Variable
kCFStreamPropertySocketExtended
BackgroundIdleMode
A Boolean value to request that the system keep a socket open and delays
reclaiming it when the process moves to the background.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 158

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


## Page 159

func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated


## Page 160

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
See Also
Streams
CFNetwork / kCFStreamPropertySocketRemoteHost
Global Variable
kCFStreamPropertySocketRemoteHost
The key’s value is a CFHostRef for the remote host if it is known. If not, its value i
NULL.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.3+
tvOS 9.0+
visionOS 1.0+


## Page 161

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


## Page 162

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
See Also
Streams
CFNetwork / kCFStreamPropertySocketRemoteNetService
Global Variable
kCFStreamPropertySocketRemoteNet
Service
The key’s value is a CFNetServiceRef for the remote network service if it is
known. If not, its value is NULL.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.3+
tvOS 9.0+
visionOS 1.0+


## Page 163

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


## Page 164

See CFStream Socket Security Level Constants for specific security level constants to use.
Note
If you set this key, you must do so before setting any other SSL options, such as kCFStream
PropertySSLSettings.
static let appendToFile: CFStreamPropertyKey!
Value is a CFBoolean value that indicates whether to append the written data to a file, if it
already exists, rather than to replace its contents.
static let dataWritten: CFStreamPropertyKey!
Value is a CFData object that contains all the bytes written to a writable memory stream. Yo
cannot modify this value.
Discussion
See Also
Constants
Core Foundation / kCFStreamPropertySocketSecurityLevel
Global Variable
kCFStreamPropertySocketSecurityLevel
Socket Security Level property key.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 165

static let fileCurrentOffset: CFStreamPropertyKey!
Value is a CFNumber object containing the current file offset.
static let socketNativeHandle: CFStreamPropertyKey!
Value is a CFData object that contains the native handle for a socket stream—of type
CFSocketNativeHandle—to which the socket stream is connected.
static let socketRemoteHostName: CFStreamPropertyKey!
Value is a CFString object containing the name of the host to which the socket stream is
connected or NULL if unknown.
static let socketRemotePortNumber: CFStreamPropertyKey!
Value is a CFNumber object containing the remote port number to which the socket stream 
connected or NULL if unknown.
let kCFStreamPropertyShouldCloseNativeSocket: CFString
Should Close Native Socket property key.
let kCFStreamPropertySSLPeerCertificates: CFString
SSL Peer Certificates property key for copy operations, which return a `CFArray` object
containing `SecCertificateRef` objects.
let kCFStreamPropertySSLPeerTrust: CFString
SSL Peer Trust property key for copy operations, which return a `SecTrustRef` object
containing the result of the SSL handshake.
let kCFStreamPropertySSLSettings: CFString
SSL Settings property key for set operations.
let kCFStreamPropertySSLContext: CFString
let kCFStreamPropertySOCKSProxy: CFString
SOCKS proxy property key.
let kCFStreamPropertyProxyLocalBypass: CFString
Proxy Local Bypass property key.
let kCFStreamPropertySocketRemoteHost: CFString
The key’s value is a `CFHostRef` for the remote host if it is known. If not, its value is `NULL`
let kCFStreamPropertySocketRemoteNetService: CFString
The key’s value is a `CFNetServiceRef` for the remote network service if it is known. If not, it
value is `NULL`.


## Page 166



## Page 167

By default, the value of this key is kCFBooleanFalse (root certificates are not allowed).
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
Discussion
See Also
Streams
CFNetwork / kCFStreamSSLAllowsAnyRoot
Global Variable
kCFStreamSSLAllowsAnyRoot
Security property key whose value indicates whether root certificates should be
allowed.
tvOS 9.0+
visionOS 1.0–1.0 Deprecated


## Page 168

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


## Page 169



## Page 170

By default, the value of this key is kCFBooleanFalse (expired certificates are not allowed).
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
Discussion
See Also
Streams
CFNetwork / kCFStreamSSLAllowsExpiredCertificates
Global Variable
kCFStreamSSLAllowsExpiredCertificates
Security property key whose value indicates whether expired certificates are
allowed.
tvOS 9.0+
visionOS 1.0–1.0 Deprecated


## Page 171

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


## Page 172



## Page 173

By default, the value of this key is kCFBooleanFalse (expired root certificates are not allowed).
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
Discussion
See Also
Streams
CFNetwork / kCFStreamSSLAllowsExpiredRoots
Global Variable
kCFStreamSSLAllowsExpiredRoots
Security property whose value indicates whether expired root certificates are
allowed.
tvOS 9.0+
visionOS 1.0–1.0 Deprecated


## Page 174

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


## Page 175



## Page 176

For more information, see SSLSetCertificate() in Security/SecureTransport.h.
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
Discussion
See Also
Streams
CFNetwork / kCFStreamSSLCertificates
Global Variable
kCFStreamSSLCertificates
Security property key whose value is a CFArray of SecCertificateRefs except for
the first element in the array, which is a SecIdentityRef.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+


## Page 177

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


## Page 178



## Page 179

By default, the value of this key is kCFBooleanFalse (the connection is not to act as a server). 
the value of this key is kCFBooleanTrue, the kCFStreamSSLCertificates key must contain
valid value.
func CFReadStreamCreateForHTTPRequest(CFAllocator?, CFHTTPMessage) ->
Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message.
Deprecated
func CFReadStreamCreateForStreamedHTTPRequest(CFAllocator?,
CFHTTPMessage, CFReadStream) -> Unmanaged<CFReadStream>
Creates a read stream for a CFHTTP request message object whose body is too long to keep
in memory.
Deprecated
Discussion
See Also
Streams
CFNetwork / kCFStreamSSLIsServer
Global Variable
kCFStreamSSLIsServer
Security property key whose value indicates whether the connection is to act as a
server in the SSL process.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+


## Page 180

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


## Page 181



## Page 182

By default, a stream’s security level is kCFStreamSocketSecurityLevelNegotiatedSSL. F
other possible values, see CFStream Socket Security Level Constants.
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
Discussion
See Also
Streams
CFNetwork / kCFStreamSSLLevel
Global Variable
kCFStreamSSLLevel
Security property key whose value specifies the stream’s security level.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+


## Page 183

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


## Page 184



## Page 185

By default, the host name that was used when the stream was created is used; if no host name wa
used, no peer name will be used. Set the value of this key to kCFNull to prevent name verificatio
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
Discussion
See Also
Streams
CFNetwork / kCFStreamSSLPeerName
Global Variable
kCFStreamSSLPeerName
Security property key whose value overrides the name used for certificate
verification.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+


## Page 186

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


## Page 187



## Page 188

By default, the value of this key is kCFBooleanTrue (the certificate chain should be validated).
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
Discussion
See Also
Streams
CFNetwork / kCFStreamSSLValidatesCertificateChain
Global Variable
kCFStreamSSLValidatesCertificateChain
Security property key whose value indicates whether the certificate chain should
be validated.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+


## Page 189

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


## Page 190



## Page 191

let kCFStreamPropertySOCKSProxyHost: CFString
Constant for the SOCKS proxy host key.
let kCFStreamPropertySOCKSProxyPort: CFString
Constant for the SOCKS proxy host port key.
let kCFStreamPropertySOCKSVersion: CFString
Constant for the SOCKS version key.
let kCFStreamSocketSOCKSVersion5: CFString
Constant used in the kCFStreamSOCKSVersion key to specify SOCKS5 as the SOCKS
version for the stream.
let kCFStreamPropertySOCKSUser: CFString
Constant for the key required to set a user name.
let kCFStreamPropertySOCKSPassword: CFString
See Also
Constants
Core Foundation / kCFStreamSocketSOCKSVersion4
Global Variable
kCFStreamSocketSOCKSVersion4
Constant used in the kCFStreamSockerSOCKSVersion key to specify
SOCKS4 as the SOCKS version for the stream.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 192

Constant for the key required to set a user’s password.


## Page 193

let kCFStreamPropertySOCKSProxyHost: CFString
Constant for the SOCKS proxy host key.
let kCFStreamPropertySOCKSProxyPort: CFString
Constant for the SOCKS proxy host port key.
let kCFStreamPropertySOCKSVersion: CFString
Constant for the SOCKS version key.
let kCFStreamSocketSOCKSVersion4: CFString
Constant used in the kCFStreamSockerSOCKSVersion key to specify SOCKS4 as the
SOCKS version for the stream.
let kCFStreamPropertySOCKSUser: CFString
Constant for the key required to set a user name.
let kCFStreamPropertySOCKSPassword: CFString
See Also
Constants
Core Foundation / kCFStreamSocketSOCKSVersion5
Global Variable
kCFStreamSocketSOCKSVersion5
Constant used in the kCFStreamSOCKSVersion key to specify SOCKS5 as the
SOCKS version for the stream.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 194

Constant for the key required to set a user’s password.


## Page 195

let kCFStreamSocketSecurityLevelNone: CFString
Specifies that no security level be set.
let kCFStreamSocketSecurityLevelSSLv2: CFString
Specifies that SSL version 2 be set as the security protocol for a socket stream.
Deprecated
let kCFStreamSocketSecurityLevelSSLv3: CFString
Specifies that SSL version 3 be set as the security protocol for a socket stream pair.
Deprecated
let kCFStreamSocketSecurityLevelTLSv1: CFString
Specifies that TLS version 1 be set as the security protocol for a socket stream.
See Also
Constants
Core Foundation / kCFStreamSocketSecurityLevelNegotiatedSSL
Global Variable
kCFStreamSocketSecurityLevel
NegotiatedSSL
Specifies that the highest level security protocol that can be negotiated be set as
the security protocol for a socket stream.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 196

let kCFStreamSocketSecurityLevelSSLv2: CFString
Specifies that SSL version 2 be set as the security protocol for a socket stream.
Deprecated
let kCFStreamSocketSecurityLevelSSLv3: CFString
Specifies that SSL version 3 be set as the security protocol for a socket stream pair.
Deprecated
let kCFStreamSocketSecurityLevelTLSv1: CFString
Specifies that TLS version 1 be set as the security protocol for a socket stream.
let kCFStreamSocketSecurityLevelNegotiatedSSL: CFString
Specifies that the highest level security protocol that can be negotiated be set as the securit
protocol for a socket stream.
See Also
Constants
Core Foundation / kCFStreamSocketSecurityLevelNone
Global Variable
kCFStreamSocketSecurityLevelNone
Specifies that no security level be set.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 197

let kCFStreamSocketSecurityLevelNone: CFString
Specifies that no security level be set.
let kCFStreamSocketSecurityLevelSSLv3: CFString
Specifies that SSL version 3 be set as the security protocol for a socket stream pair.
Deprecated
let kCFStreamSocketSecurityLevelTLSv1: CFString
Specifies that TLS version 1 be set as the security protocol for a socket stream.
let kCFStreamSocketSecurityLevelNegotiatedSSL: CFString
Specifies that the highest level security protocol that can be negotiated be set as the securit
protocol for a socket stream.
See Also
Constants
Core Foundation / kCFStreamSocketSecurityLevelSSLv2 Deprecated
Global Variable
kCFStreamSocketSecurityLevel
SSLv2 Deprecated
Specifies that SSL version 2 be set as the security protocol for a socket stream.
iOS 2.0–10.0 Deprecated
iPadOS 2.0–10.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.2–10.12 Deprecated
tvOS Deprecated
visionOS 1.0–1.0 Deprecated
watchOS 2.0–3.0 Deprecated


## Page 198

If SSL version 3 is not available, specifies that SSL version 2 be set as the security protocol for a
socket stream.
let kCFStreamSocketSecurityLevelNone: CFString
Specifies that no security level be set.
let kCFStreamSocketSecurityLevelSSLv2: CFString
Specifies that SSL version 2 be set as the security protocol for a socket stream.
Deprecated
let kCFStreamSocketSecurityLevelTLSv1: CFString
Discussion
See Also
Constants
Core Foundation / kCFStreamSocketSecurityLevelSSLv3 Deprecated
Global Variable
kCFStreamSocketSecurityLevel
SSLv3 Deprecated
Specifies that SSL version 3 be set as the security protocol for a socket stream
pair.
iOS 2.0–10.0 Deprecated
iPadOS 2.0–10.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.2–10.12 Deprecated
tvOS Deprecated
visionOS 1.0–1.0 Deprecated
watchOS 2.0–3.0 Deprecated


## Page 199

Specifies that TLS version 1 be set as the security protocol for a socket stream.
let kCFStreamSocketSecurityLevelNegotiatedSSL: CFString
Specifies that the highest level security protocol that can be negotiated be set as the securit
protocol for a socket stream.


## Page 200

let kCFStreamSocketSecurityLevelNone: CFString
Specifies that no security level be set.
let kCFStreamSocketSecurityLevelSSLv2: CFString
Specifies that SSL version 2 be set as the security protocol for a socket stream.
Deprecated
let kCFStreamSocketSecurityLevelSSLv3: CFString
Specifies that SSL version 3 be set as the security protocol for a socket stream pair.
Deprecated
let kCFStreamSocketSecurityLevelNegotiatedSSL: CFString
Specifies that the highest level security protocol that can be negotiated be set as the securit
protocol for a socket stream.
See Also
Constants
Core Foundation / kCFStreamSocketSecurityLevelTLSv1
Global Variable
kCFStreamSocketSecurityLevelTLSv1
Specifies that TLS version 1 be set as the security protocol for a socket stream.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 201

case parseFailure
A parsing error occurred while an incoming message was being deserialized and appended t
a message object. The headers of the incoming message may be formatted improperly.
case redirectionLoop
A redirection loop has been detected.
case badURL
The URL is not properly formatted.
init?(rawValue: Int32)
Topics
Constants
Initializers
Relationships
CFNetwork / CFStreamErrorHTTP
Enumeration
CFStreamErrorHTTP
Error codes that a read stream for an HTTP request may return.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 202

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
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
HTTP Final URL property. A value of type CFURL containing the final HTTP URL. This value
differs from the URL in the original HTTP request if an autoredirection occurred. This proper
cannot be set.
Deprecated
let kCFStreamPropertyHTTPProxy: CFString
Deprecated
Conforms To
See Also
Streams


## Page 203

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


## Page 204

case typeUnsupported
Specified authentication type is not supported.
case badUserName
User name is in a format that is not suitable for the request. Currently, user names are
decoded using kCFStringEncodingISOLatin1.
case badPassword
Password is in a format that is not suitable for the request. Currently, passwords are decode
using kCFStringEncodingISOLatin1.
init?(rawValue: Int32)
Topics
Constants
Initializers
Relationships
CFNetwork / CFStreamErrorHTTPAuthentication
Enumeration
CFStreamErrorHTTPAuthentication
Authentication error codes that may be returned when trying to apply
authentication to a request.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 205

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
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
HTTP Final URL property. A value of type CFURL containing the final HTTP URL. This value
differs from the URL in the original HTTP request if an autoredirection occurred. This proper
cannot be set.
Deprecated
let kCFStreamPropertyHTTPProxy: CFString
Deprecated
Conforms To
See Also
Streams


## Page 206

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


## Page 207

Error codes in the kCFStreamErrorDomainSOCKS domain can come from multiple parts of the
protocol stack, many of which define their own error values as part of outside specifications such
as the HTTP specification.
To avoid confusion from conflicting error numbers, error codes in the kCFStreamErrorDomain
SOCKS domain contain two parts: a subdomain, which tells which part of the protocol stack
generated the error, and the error code itself.
Calling CFSocketStreamSOCKSGetErrorSubdomain(_:) returns an identifier that tells whic
layer of the protocol stack produced the error.
Calling CFSocketStreamSOCKSGetError(_:) returns the actual error code that the subdoma
describes. This list of constants contains the possible values that this function will return. They
must be interpreted within the context of the relevant error subdomain.
var kCFStreamErrorSOCKS4IdConflict: Int
Request rejected by the server because the client program and the identd daemon reporte
different user IDs.
var kCFStreamErrorSOCKS4IdentdFailed: Int
Request rejected by the server because it couldn’t connect to the identd daemon on the
client.
Overview
Topics
Constants
CFNetwork / Secure Sockets (SOCKS) Errors
API Collection
Secure Sockets (SOCKS) Errors
Error codes returned by the kCFStreamErrorDomainSOCKS error domain.


## Page 208

var kCFStreamErrorSOCKS4RequestFailed: Int
Request rejected by the server or request failed.
var kCFStreamErrorSOCKS4SubDomainResponse: Int
The SOCKS4 status code returned by the server.
var kCFStreamErrorSOCKS5SubDomainMethod: Int
The server’s desired negotiation method.
var kCFStreamErrorSOCKS5SubDomainResponse: Int
The response code that the server returned in reply to the connection request.
var kCFStreamErrorSOCKS5SubDomainUserPass: Int
The status code that the server returned during authentication.
var kCFStreamErrorSOCKSSubDomainNone: Int
A general SOCKS error.
var kCFStreamErrorSOCKSSubDomainVersionCode: Int
The version of SOCKS that the server wants to use.
var kSOCKS5NoAcceptableMethod: Int
The client and server couldn’t find a mutually agreeable authentication method.
var kCFStreamErrorSOCKS5BadResponseAddr: Int
The address returned is not of a known type. This error code is only valid for errors in the k
CFStreamErrorSOCKSSubDomainNone subdomain.
var kCFStreamErrorSOCKS5BadState: Int
The stream is not in a state that allows the requested operation. This error code is only valid
for errors in the kCFStreamErrorSOCKSSubDomainNone subdomain..
var kCFStreamErrorSOCKSUnknownClientVersion: Int
The SOCKS server rejected access because it does not support connections with the
requested SOCKS version. SOCKS client version. You can query the kCFSOCKSVersionKey
key to find out what version the server requested. This error code is only valid for errors in th
kCFStreamErrorSOCKSSubDomainNone subdomain.
See Also


## Page 209

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
Streams


## Page 210

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


