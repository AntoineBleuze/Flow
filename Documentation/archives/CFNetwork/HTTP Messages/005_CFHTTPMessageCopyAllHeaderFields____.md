# 005_CFHTTPMessageCopyAllHeaderFields____.pdf

## Page 1

message
The message to examine.
A CFDictionaryRef object containing keys and values that are CFStringRef objects, where
the key is the header fieldname and the dictionary value is the header field’s value. Returns NULL 
the header fields could not be copied. Ownership follows the The Create Rule.
HTTP headers are case insensitive. To simplify your code, certain header field names are
canonicalized into their standard form. For example, if the server sends a content-length
header, it is automatically adjusted to be Content-Length.
The returned dictionary of headers is configured to be case-preserving during the set operation
(unless the key already exists with a different case), and case-insensitive when looking up keys.
For example, if you set the header X-foo, and then later set the header X-Foo, the dictionary’s
key will be X-foo, but the value will taken from the X-Foo header.
Parameters
Return Value
Discussion
CFNetwork / CFHTTPMessageCopyAllHeaderFields(_:)
Function
CFHTTPMessageCopyAllHeaderFields(_:)
Gets all header fields from a CFHTTPMessage object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 2

class CFHTTPMessage
An opaque reference representing an HTTP message.
func CFHTTPMessageAddAuthentication(CFHTTPMessage, CFHTTPMessage?,
CFString, CFString, CFString?, Bool) -> Bool
Adds authentication information to a request.
func CFHTTPMessageAppendBytes(CFHTTPMessage, UnsafePointer<UInt8>,
CFIndex) -> Bool
Appends data to a CFHTTPMessage object.
func CFHTTPMessageApplyCredentialDictionary(CFHTTPMessage,
CFHTTPAuthentication, CFDictionary, UnsafeMutablePointer<CFStreamError
>?) -> Bool
Use a dictionary containing authentication credentials to perform the authentication method
specified by a CFHTTPAuthentication object.
func CFHTTPMessageApplyCredentials(CFHTTPMessage, CFHTTPAuthentication,
CFString?, CFString?, UnsafeMutablePointer<CFStreamError>?) -> Bool
Performs the authentication method specified by a CFHTTPAuthentication object.
func CFHTTPMessageCopyBody(CFHTTPMessage) -> Unmanaged<CFData>?
Gets the body from a CFHTTPMessage object.
func CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessage, CFString) ->
Unmanaged<CFString>?
Gets the value of a header field from a CFHTTPMessage object.
func CFHTTPMessageCopyRequestMethod(CFHTTPMessage) -> Unmanaged<CFStrin
>?
Gets the request method from a CFHTTPMessage object.
func CFHTTPMessageCopyRequestURL(CFHTTPMessage) -> Unmanaged<CFURL>?
Gets the URL from a CFHTTPMessage object.
func CFHTTPMessageCopyResponseStatusLine(CFHTTPMessage) -> Unmanaged<
CFString>?
See Also
HTTP Messages


## Page 3

Gets the status line from a CFHTTPMessage object.
func CFHTTPMessageCopySerializedMessage(CFHTTPMessage) -> Unmanaged<
CFData>?
Serializes a CFHTTPMessage object.
func CFHTTPMessageCopyVersion(CFHTTPMessage) -> Unmanaged<CFString>
Gets the HTTP version from a CFHTTPMessage object.
func CFHTTPMessageCreateCopy(CFAllocator?, CFHTTPMessage) -> Unmanaged<
CFHTTPMessage>
Gets a copy of a CFHTTPMessage object.
func CFHTTPMessageCreateEmpty(CFAllocator?, Bool) -> Unmanaged<
CFHTTPMessage>
Creates and returns a new, empty CFHTTPMessage object.
func CFHTTPMessageCreateRequest(CFAllocator?, CFString, CFURL, CFString
-> Unmanaged<CFHTTPMessage>
Creates and returns a CFHTTPMessage object for an HTTP request.


