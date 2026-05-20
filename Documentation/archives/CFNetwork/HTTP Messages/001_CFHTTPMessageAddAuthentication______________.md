# 001_CFHTTPMessageAddAuthentication______________.pdf

## Page 1

request
The message to which to add authentication information.
authenticationFailureResponse
The response message that contains authentication failure information.
username
The username to add to the request.
password
The password to add to the request.
authenticationScheme
Parameters
CFNetwork / CFHTTPMessageAddAuthentication(_:_:_:_:_:_:)
Function
CFHTTPMessageAddAuthentication(_:_:
_:_:_:_:)
Adds authentication information to a request.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 2

The authentication scheme to use (kCFHTTPAuthenticationSchemeBasic, k
CFHTTPAuthenticationSchemeNegotiate, kCFHTTPAuthenticationSchemeNTLM,
or kCFHTTPAuthenticationSchemeDigest), or pass NULL to use the strongest
supported authentication scheme provided in the authenticationFailureResponse
parameter.
forProxy
A flag indicating whether the authentication data that is being added is for a proxy’s use
(TRUE) or for a remote server’s use (FALSE). If the error code provided by the
authenticationFailureResponse parameter is 407, set forProxy to TRUE. If the erro
code is 401, set forProxy to FALSE.
TRUE if the authentication information was successfully added, otherwise FALSE.
This function adds the authentication information specified by the username, password,
authenticationScheme, and forProxy parameters to the specified request message. The
message referred to by the authenticationFailureResponse parameter typically contains 
401 or a 407 error code.
This function is best suited for sending a single request to the server. If you need to send multiple
requests, use CFHTTPMessageApplyCredentials(_:_:_:_:_:).
class CFHTTPMessage
An opaque reference representing an HTTP message.
func CFHTTPMessageAppendBytes(CFHTTPMessage, UnsafePointer<UInt8>,
CFIndex) -> Bool
Appends data to a CFHTTPMessage object.
func CFHTTPMessageApplyCredentialDictionary(CFHTTPMessage,
CFHTTPAuthentication, CFDictionary, UnsafeMutablePointer<CFStreamError
>?) -> Bool
Return Value
Discussion
See Also
HTTP Messages


## Page 3

Use a dictionary containing authentication credentials to perform the authentication method
specified by a CFHTTPAuthentication object.
func CFHTTPMessageApplyCredentials(CFHTTPMessage, CFHTTPAuthentication,
CFString?, CFString?, UnsafeMutablePointer<CFStreamError>?) -> Bool
Performs the authentication method specified by a CFHTTPAuthentication object.
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


## Page 4

func CFHTTPMessageCreateRequest(CFAllocator?, CFString, CFURL, CFString
-> Unmanaged<CFHTTPMessage>
Creates and returns a CFHTTPMessage object for an HTTP request.


