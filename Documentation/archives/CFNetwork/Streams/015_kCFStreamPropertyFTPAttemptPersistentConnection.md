# 015_kCFStreamPropertyFTPAttemptPersistentConnection.pdf

## Page 1

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


## Page 3

Deprecated
func CFReadStreamCreateWithFTPURL(CFAllocator?, CFURL) -> Unmanaged<
CFReadStream>
Creates an FTP read stream.
Deprecated


