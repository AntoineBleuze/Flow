# 004_CFHTTPMessageApplyCredentials____________.pdf

## Page 1

request
Request for which the authentication method is to be performed.
auth
A CFHTTPAuthentication object specifying the authentication method to perform.
username
Username for performing the authentication.
password
Password for performing the authentication.
error
Parameters
CFNetwork / CFHTTPMessageApplyCredentials(_:_:_:_:_:)
Function
CFHTTPMessageApplyCredentials(_:_:_:
_:_:)
Performs the authentication method specified by a CFHTTPAuthentication
object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS 9.0+
visionOS 1.0+


## Page 2

If an error occurs, upon return contains a CFStreamError object that describes the error an
the error’s domain. Pass NULL if you don’t want to receive error information.
TRUE if the authentication was successful, otherwise, FALSE.
This function performs the authentication method specified by auth on behalf of the request
specified by request using the credentials specified by username and password. If, in additio
to a username and password, you also need to specify an account domain, call CFHTTPMessage
ApplyCredentialDictionary(_:_:_:_:) instead of this function.
This function is appropriate for performing several authentication requests. If you only need to
make a single authentication request, consider using CFHTTPMessageAddAuthentication(_
_:_:_:_:_:) instead.
This function is thread safe as long as another thread does not alter the same CFHTTPMessage
object at the same time.
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
Return Value
Discussion
Special Considerations
See Also
HTTP Messages


## Page 3

Use a dictionary containing authentication credentials to perform the authentication method
specified by a CFHTTPAuthentication object.
func CFHTTPMessageCopyAllHeaderFields(CFHTTPMessage) -> Unmanaged<
CFDictionary>?
Gets all header fields from a CFHTTPMessage object.
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


## Page 4



