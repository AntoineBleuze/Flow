# 003_CFHTTPMessageApplyCredentialDictionary__________.pdf

## Page 1

request
The request for which the authentication method is to be performed.
auth
A CFHTTPAuthentication object specifying the authentication method to perform.
dict
A dictionary containing authentication credentials to be applied to the request. For informatio
on the keys in this dictionary, see CFHTTPAuthentication.
error
If an error occurs, upon return contains a CFStreamError object that describes the error an
the error’s domain. Pass NULL if you don’t want to receive error information.
Parameters
CFNetwork / CFHTTPMessageApplyCredentialDictionary(_:_:_:_:)
Function
CFHTTPMessageApplyCredential
Dictionary(_:_:_:_:)
Use a dictionary containing authentication credentials to perform the
authentication method specified by a CFHTTPAuthentication object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+


## Page 2

TRUE if the authentication was successful, otherwise, FALSE.
This function performs the authentication method specified by auth on behalf of the request
specified by request using the credentials contained in the dictionary specified by dict. The
dictionary must contain values for the kCFHTTPAuthenticationUsername and k
CFHTTPAuthenticationPassword keys. If CFHTTPAuthenticationRequiresAccount
Domain(_:) returns TRUE for auth, the dictionary must also contain a value for the k
CFHTTPAuthenticationAccountDomain key.
This function is thread safe as long as another thread does not alter the same
CFHTTPAuthentication object at the same time.
class CFHTTPMessage
An opaque reference representing an HTTP message.
func CFHTTPMessageAddAuthentication(CFHTTPMessage, CFHTTPMessage?,
CFString, CFString, CFString?, Bool) -> Bool
Adds authentication information to a request.
func CFHTTPMessageAppendBytes(CFHTTPMessage, UnsafePointer<UInt8>,
CFIndex) -> Bool
Appends data to a CFHTTPMessage object.
func CFHTTPMessageApplyCredentials(CFHTTPMessage, CFHTTPAuthentication,
CFString?, CFString?, UnsafeMutablePointer<CFStreamError>?) -> Bool
Performs the authentication method specified by a CFHTTPAuthentication object.
func CFHTTPMessageCopyAllHeaderFields(CFHTTPMessage) -> Unmanaged<
CFDictionary>?
Gets all header fields from a CFHTTPMessage object.
Return Value
Discussion
Special Considerations
See Also
HTTP Messages


## Page 3

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


