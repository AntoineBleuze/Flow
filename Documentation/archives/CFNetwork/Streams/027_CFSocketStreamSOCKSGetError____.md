# 027_CFSocketStreamSOCKSGetError____.pdf

## Page 1

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


## Page 2

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


## Page 3

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


