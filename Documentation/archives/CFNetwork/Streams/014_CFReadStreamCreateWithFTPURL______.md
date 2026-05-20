# 014_CFReadStreamCreateWithFTPURL______.pdf

## Page 1

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


## Page 2

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


## Page 3

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


