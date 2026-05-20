# 005_kCFStreamPropertyHTTPProxy.pdf

## Page 1

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


## Page 2

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


## Page 3

func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated
let kCFStreamPropertyFTPAttemptPersistentConnection: CFString
Deprecated


