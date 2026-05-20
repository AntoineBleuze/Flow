# HTTP Messages.pdf

## Page 1

Equatable, Hashable
func CFHTTPMessageAddAuthentication(CFHTTPMessage, CFHTTPMessage?,
CFString, CFString, CFString?, Bool) -> Bool
Adds authentication information to a request.
func CFHTTPMessageAppendBytes(CFHTTPMessage, UnsafePointer<UInt8>,
CFIndex) -> Bool
Appends data to a CFHTTPMessage object.
func CFHTTPMessageApplyCredentialDictionary(CFHTTPMessage,
CFHTTPAuthentication, CFDictionary, UnsafeMutablePointer<CFStreamError
>?) -> Bool
Relationships
Conforms To
See Also
HTTP Messages
CFNetwork / CFHTTPMessage
Class
CFHTTPMessage
An opaque reference representing an HTTP message.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.8+
tvOS 9.0+
visionOS 1.0+


## Page 2

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


## Page 3

func CFHTTPMessageCreateRequest(CFAllocator?, CFString, CFURL, CFString
-> Unmanaged<CFHTTPMessage>
Creates and returns a CFHTTPMessage object for an HTTP request.


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

func CFHTTPMessageCreateRequest(CFAllocator?, CFString, CFURL, CFString
-> Unmanaged<CFHTTPMessage>
Creates and returns a CFHTTPMessage object for an HTTP request.


## Page 8

message
The message to modify.
newBytes
A reference to the data to append.
numBytes
The length of the data pointed to by newBytes.
TRUE if the data was successfully appended, otherwise FALSE.
This function appends the data specified by newBytes to the specified message object which w
created by calling CFHTTPMessageCreateEmpty(_:_:). The data is an incoming serialized
HTTP request or response received from a client or a server. While appending the data, this
Parameters
Return Value
Discussion
CFNetwork / CFHTTPMessageAppendBytes(_:_:_:)
Function
CFHTTPMessageAppendBytes(_:_:_:)
Appends data to a CFHTTPMessage object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 9

function deserializes it, removes any HTTP-based formatting that the message may contain, and
stores the message in the message object. You can then call CFHTTPMessageCopy
Version(_:), CFHTTPMessageCopyBody(_:), CFHTTPMessageCopyHeaderField
Value(_:_:), and CFHTTPMessageCopyAllHeaderFields(_:) to get the message’s HTTP
version, the message’s body, a specific header field, and all of the message’s headers, respective
If the message is a request, you can also call CFHTTPMessageCopyRequestURL(_:) and
CFHTTPMessageCopyRequestMethod(_:) to get the message’s request URL and request
method, respectively.
If the message is a response, you can also call CFHTTPMessageGetResponseStatusCode(_:
and CFHTTPMessageCopyResponseStatusLine(_:) to get the message’s status code and
status line, respectively.
class CFHTTPMessage
An opaque reference representing an HTTP message.
func CFHTTPMessageAddAuthentication(CFHTTPMessage, CFHTTPMessage?,
CFString, CFString, CFString?, Bool) -> Bool
Adds authentication information to a request.
func CFHTTPMessageApplyCredentialDictionary(CFHTTPMessage,
CFHTTPAuthentication, CFDictionary, UnsafeMutablePointer<CFStreamError
>?) -> Bool
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
See Also
HTTP Messages


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17



## Page 18

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


## Page 19

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


## Page 20

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


## Page 21

message
The message to examine.
A CFData object or NULL if there was a problem creating the object or if the there is no message
body. Ownership follows the The Create Rule.
class CFHTTPMessage
An opaque reference representing an HTTP message.
func CFHTTPMessageAddAuthentication(CFHTTPMessage, CFHTTPMessage?,
CFString, CFString, CFString?, Bool) -> Bool
Adds authentication information to a request.
Parameters
Return Value
See Also
HTTP Messages
CFNetwork / CFHTTPMessageCopyBody(_:)
Function
CFHTTPMessageCopyBody(_:)
Gets the body from a CFHTTPMessage object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 22

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
func CFHTTPMessageCopyAllHeaderFields(CFHTTPMessage) -> Unmanaged<
CFDictionary>?
Gets all header fields from a CFHTTPMessage object.
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


## Page 23

func CFHTTPMessageCreateEmpty(CFAllocator?, Bool) -> Unmanaged<
CFHTTPMessage>
Creates and returns a new, empty CFHTTPMessage object.
func CFHTTPMessageCreateRequest(CFAllocator?, CFString, CFURL, CFString
-> Unmanaged<CFHTTPMessage>
Creates and returns a CFHTTPMessage object for an HTTP request.


## Page 24

message
The message to examine.
headerField
The header field to copy.
A CFString object containing a copy of the field specified by headerField, or NULL if there w
a problem creating the object of if the specified header does not exist. Ownership follows the The
Create Rule.
Parameters
Return Value
See Also
CFNetwork / CFHTTPMessageCopyHeaderFieldValue(_:_:)
Function
CFHTTPMessageCopyHeaderField
Value(_:_:)
Gets the value of a header field from a CFHTTPMessage object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 25

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
func CFHTTPMessageCopyAllHeaderFields(CFHTTPMessage) -> Unmanaged<
CFDictionary>?
Gets all header fields from a CFHTTPMessage object.
func CFHTTPMessageCopyBody(CFHTTPMessage) -> Unmanaged<CFData>?
Gets the body from a CFHTTPMessage object.
func CFHTTPMessageCopyRequestMethod(CFHTTPMessage) -> Unmanaged<CFStrin
>?
Gets the request method from a CFHTTPMessage object.
func CFHTTPMessageCopyRequestURL(CFHTTPMessage) -> Unmanaged<CFURL>?
Gets the URL from a CFHTTPMessage object.
func CFHTTPMessageCopyResponseStatusLine(CFHTTPMessage) -> Unmanaged<
CFString>?
Gets the status line from a CFHTTPMessage object.
HTTP Messages


## Page 26

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


## Page 27

request
The message to examine. This must be a request message.
A CFString object containing a copy of the message’s request method, or NULL if there was a
problem creating the object. Ownership follows the The Create Rule.
class CFHTTPMessage
An opaque reference representing an HTTP message.
func CFHTTPMessageAddAuthentication(CFHTTPMessage, CFHTTPMessage?,
CFString, CFString, CFString?, Bool) -> Bool
Adds authentication information to a request.
Parameters
Return Value
See Also
HTTP Messages
CFNetwork / CFHTTPMessageCopyRequestMethod(_:)
Function
CFHTTPMessageCopyRequestMethod(_:
Gets the request method from a CFHTTPMessage object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 28

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
func CFHTTPMessageCopyAllHeaderFields(CFHTTPMessage) -> Unmanaged<
CFDictionary>?
Gets all header fields from a CFHTTPMessage object.
func CFHTTPMessageCopyBody(CFHTTPMessage) -> Unmanaged<CFData>?
Gets the body from a CFHTTPMessage object.
func CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessage, CFString) ->
Unmanaged<CFString>?
Gets the value of a header field from a CFHTTPMessage object.
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


## Page 29

func CFHTTPMessageCreateEmpty(CFAllocator?, Bool) -> Unmanaged<
CFHTTPMessage>
Creates and returns a new, empty CFHTTPMessage object.
func CFHTTPMessageCreateRequest(CFAllocator?, CFString, CFURL, CFString
-> Unmanaged<CFHTTPMessage>
Creates and returns a CFHTTPMessage object for an HTTP request.


## Page 30

request
The message to examine. This must be a request message.
A CFURLRef object containing the URL or NULL if there was a problem creating the object.
Ownership follows the The Create Rule.
class CFHTTPMessage
An opaque reference representing an HTTP message.
func CFHTTPMessageAddAuthentication(CFHTTPMessage, CFHTTPMessage?,
CFString, CFString, CFString?, Bool) -> Bool
Adds authentication information to a request.
Parameters
Return Value
See Also
HTTP Messages
CFNetwork / CFHTTPMessageCopyRequestURL(_:)
Function
CFHTTPMessageCopyRequestURL(_:)
Gets the URL from a CFHTTPMessage object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 31

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


## Page 32

func CFHTTPMessageCreateEmpty(CFAllocator?, Bool) -> Unmanaged<
CFHTTPMessage>
Creates and returns a new, empty CFHTTPMessage object.
func CFHTTPMessageCreateRequest(CFAllocator?, CFString, CFURL, CFString
-> Unmanaged<CFHTTPMessage>
Creates and returns a CFHTTPMessage object for an HTTP request.


## Page 33

response
The message to examine. This must be a response message.
A string containing the message’s status line, or NULL if there was a problem creating the object.
The status line includes the message’s protocol version and a success or error code. Ownership
follows the The Create Rule.
class CFHTTPMessage
An opaque reference representing an HTTP message.
Parameters
Return Value
See Also
HTTP Messages
CFNetwork / CFHTTPMessageCopyResponseStatusLine(_:)
Function
CFHTTPMessageCopyResponseStatus
Line(_:)
Gets the status line from a CFHTTPMessage object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 34

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
func CFHTTPMessageCopySerializedMessage(CFHTTPMessage) -> Unmanaged<
CFData>?
Serializes a CFHTTPMessage object.
func CFHTTPMessageCopyVersion(CFHTTPMessage) -> Unmanaged<CFString>
Gets the HTTP version from a CFHTTPMessage object.


## Page 35

func CFHTTPMessageCreateCopy(CFAllocator?, CFHTTPMessage) -> Unmanaged<
CFHTTPMessage>
Gets a copy of a CFHTTPMessage object.
func CFHTTPMessageCreateEmpty(CFAllocator?, Bool) -> Unmanaged<
CFHTTPMessage>
Creates and returns a new, empty CFHTTPMessage object.
func CFHTTPMessageCreateRequest(CFAllocator?, CFString, CFURL, CFString
-> Unmanaged<CFHTTPMessage>
Creates and returns a CFHTTPMessage object for an HTTP request.


## Page 36

A CFData object containing the serialized message, or NULL if there was a problem creating the
object. Ownership follows the The Create Rule.
This function returns a copy of a CFHTTPMessage object in serialized format that is ready for
transmission.
class CFHTTPMessage
An opaque reference representing an HTTP message.
func CFHTTPMessageAddAuthentication(CFHTTPMessage, CFHTTPMessage?,
CFString, CFString, CFString?, Bool) -> Bool
Return Value
Discussion
See Also
HTTP Messages
CFNetwork / CFHTTPMessageCopySerializedMessage(_:)
Function
CFHTTPMessageCopySerialized
Message(_:)
Serializes a CFHTTPMessage object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 37

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
func CFHTTPMessageCopyVersion(CFHTTPMessage) -> Unmanaged<CFString>
Gets the HTTP version from a CFHTTPMessage object.
func CFHTTPMessageCreateCopy(CFAllocator?, CFHTTPMessage) -> Unmanaged<
CFHTTPMessage>
Gets a copy of a CFHTTPMessage object.


## Page 38

func CFHTTPMessageCreateEmpty(CFAllocator?, Bool) -> Unmanaged<
CFHTTPMessage>
Creates and returns a new, empty CFHTTPMessage object.
func CFHTTPMessageCreateRequest(CFAllocator?, CFString, CFURL, CFString
-> Unmanaged<CFHTTPMessage>
Creates and returns a CFHTTPMessage object for an HTTP request.


## Page 39

message
The message to examine.
A CFString object or NULL, if there was a problem creating the object. Ownership follows the T
Create Rule.
class CFHTTPMessage
An opaque reference representing an HTTP message.
func CFHTTPMessageAddAuthentication(CFHTTPMessage, CFHTTPMessage?,
CFString, CFString, CFString?, Bool) -> Bool
Adds authentication information to a request.
Parameters
Return Value
See Also
HTTP Messages
CFNetwork / CFHTTPMessageCopyVersion(_:)
Function
CFHTTPMessageCopyVersion(_:)
Gets the HTTP version from a CFHTTPMessage object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 40

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
func CFHTTPMessageCreateCopy(CFAllocator?, CFHTTPMessage) -> Unmanaged<
CFHTTPMessage>
Gets a copy of a CFHTTPMessage object.


## Page 41

func CFHTTPMessageCreateEmpty(CFAllocator?, Bool) -> Unmanaged<
CFHTTPMessage>
Creates and returns a new, empty CFHTTPMessage object.
func CFHTTPMessageCreateRequest(CFAllocator?, CFString, CFURL, CFString
-> Unmanaged<CFHTTPMessage>
Creates and returns a CFHTTPMessage object for an HTTP request.


## Page 42

message
The message to copy.
A CFHTTPMessage object, or NULL if there was a problem creating the object. Ownership follows
the The Create Rule.
This function returns a copy of a CFHTTPMessage object that you can modify, for example, by
calling CFHTTPMessageCopyHeaderFieldValue(_:_:) or by calling CFHTTPMessageSet
Body(_:_:). Then you can serialize the message by calling CFHTTPMessageCopySerialize
Message(_:) and send the serialized message to a client or a server.
Parameters
Return Value
Discussion
See Also
CFNetwork / CFHTTPMessageCreateCopy(_:_:)
Function
CFHTTPMessageCreateCopy(_:_:)
Gets a copy of a CFHTTPMessage object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 43

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
HTTP Messages


## Page 44

func CFHTTPMessageCopyResponseStatusLine(CFHTTPMessage) -> Unmanaged<
CFString>?
Gets the status line from a CFHTTPMessage object.
func CFHTTPMessageCopySerializedMessage(CFHTTPMessage) -> Unmanaged<
CFData>?
Serializes a CFHTTPMessage object.
func CFHTTPMessageCopyVersion(CFHTTPMessage) -> Unmanaged<CFString>
Gets the HTTP version from a CFHTTPMessage object.
func CFHTTPMessageCreateEmpty(CFAllocator?, Bool) -> Unmanaged<
CFHTTPMessage>
Creates and returns a new, empty CFHTTPMessage object.
func CFHTTPMessageCreateRequest(CFAllocator?, CFString, CFURL, CFString
-> Unmanaged<CFHTTPMessage>
Creates and returns a CFHTTPMessage object for an HTTP request.


## Page 45

isRequest
A flag that determines whether to create an empty message request or an empty message
response. Pass TRUE to create an empty request message; pass FALSE to create an empty
response message.
A new CFHTTPMessage object or NULL if there was a problem creating the object. Ownership
follows the The Create Rule.
Call CFHTTPMessageAppendBytes(_:_:_:) to store an incoming, serialized HTTP request or
response message in the empty message object.
Parameters
Return Value
Discussion
See Also
CFNetwork / CFHTTPMessageCreateEmpty(_:_:)
Function
CFHTTPMessageCreateEmpty(_:_:)
Creates and returns a new, empty CFHTTPMessage object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 46

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
HTTP Messages


## Page 47

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
func CFHTTPMessageCreateRequest(CFAllocator?, CFString, CFURL, CFString
-> Unmanaged<CFHTTPMessage>
Creates and returns a CFHTTPMessage object for an HTTP request.


## Page 48

requestMethod
The request method for the request. Use any of the request methods allowed by the HTTP
version specified by httpVersion.
url
The URL to which the request will be sent.
httpVersion
The HTTP version for this message. Pass kCFHTTPVersion1_0 or kCFHTTPVersion1_1.
A new CFHTTPMessage object, or NULL if there was a problem creating the object. Ownership
follows the The Create Rule.
Parameters
Return Value
Discussion
CFNetwork / CFHTTPMessageCreateRequest(_:_:_:_:)
Function
CFHTTPMessageCreateRequest(_:_:_:_:)
Creates and returns a CFHTTPMessage object for an HTTP request.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 49

This function returns a CFHTTPMessage object that you can use to build an HTTP request.
Continue building the request by callingCFHTTPMessageSetBody(_:_:) to set the message’s
body. Call CFHTTPMessageCopyHeaderFieldValue(_:_:) to set the message’s headers.
If you are using a CFReadStream object to send the message, call CFReadStreamCreateFor
HTTPRequest(_:_:) to create a read stream for the request. If you are not using CFRead
Stream, call CFHTTPMessageCopySerializedMessage(_:) to make the message ready for
transmission by serializing it.
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
func CFHTTPMessageCopyAllHeaderFields(CFHTTPMessage) -> Unmanaged<
CFDictionary>?
Gets all header fields from a CFHTTPMessage object.
func CFHTTPMessageCopyBody(CFHTTPMessage) -> Unmanaged<CFData>?
Gets the body from a CFHTTPMessage object.
See Also
HTTP Messages


## Page 50

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


## Page 51

statusCode
The status code for this message response. The status code can be any of the status codes
defined in section 6.1.1 of RFC 2616.
statusDescription
The description that corresponds to the status code. Pass NULL to use the standard
description for the given status code, as found in RFC 2616.
httpVersion
The HTTP version for this message response. Pass kCFHTTPVersion1_0 or k
CFHTTPVersion1_1.
A new CFHTTPMessage object, or NULL if there was a problem creating the object. Ownership
follows the The Create Rule.
Parameters
Return Value
CFNetwork / CFHTTPMessageCreateResponse(_:_:_:_:)
Function
CFHTTPMessageCreateResponse(_:_:_:
_:)
Creates and returns a CFHTTPMessage object for an HTTP response.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 52

This function returns a CFHTTPMessage object that you can use to build an HTTP response.
Continue building the response by callingCFHTTPMessageSetBody(_:_:) to set the message
body. Call CFHTTPMessageSetHeaderFieldValue(_:_:_:) to set the message’s headers.
Then call CFHTTPMessageCopySerializedMessage(_:) to make the message ready for
transmission by serializing it.
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
func CFHTTPMessageCopyAllHeaderFields(CFHTTPMessage) -> Unmanaged<
CFDictionary>?
Gets all header fields from a CFHTTPMessage object.
func CFHTTPMessageCopyBody(CFHTTPMessage) -> Unmanaged<CFData>?
Gets the body from a CFHTTPMessage object.
func CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessage, CFString) ->
Unmanaged<CFString>?
Discussion
See Also
HTTP Messages


## Page 53

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


## Page 54

response
The message to examine. This must be a response message.
class CFHTTPMessage
An opaque reference representing an HTTP message.
func CFHTTPMessageAddAuthentication(CFHTTPMessage, CFHTTPMessage?,
CFString, CFString, CFString?, Bool) -> Bool
Adds authentication information to a request.
func CFHTTPMessageAppendBytes(CFHTTPMessage, UnsafePointer<UInt8>,
CFIndex) -> Bool
Appends data to a CFHTTPMessage object.
Parameters
See Also
HTTP Messages
CFNetwork / CFHTTPMessageGetResponseStatusCode(_:)
Function
CFHTTPMessageGetResponseStatus
Code(_:)
Gets the status code from a CFHTTPMessage object representing an HTTP
response.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 55

func CFHTTPMessageApplyCredentialDictionary(CFHTTPMessage,
CFHTTPAuthentication, CFDictionary, UnsafeMutablePointer<CFStreamError
>?) -> Bool
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


## Page 56

func CFHTTPMessageCreateEmpty(CFAllocator?, Bool) -> Unmanaged<
CFHTTPMessage>
Creates and returns a new, empty CFHTTPMessage object.


## Page 57

The Core Foundation type identifier for the CFHTTPMessage opaque type.
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
See Also
HTTP Messages
CFNetwork / CFHTTPMessageGetTypeID()
Function
CFHTTPMessageGetTypeID()
Returns the Core Foundation type identifier for the CFHTTPMessage opaque typ
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 58

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


## Page 59



## Page 60

message
The message to verify.
After calling CFHTTPMessageAppendBytes(_:_:_:), call this function to see if the message
header is complete.
class CFHTTPMessage
An opaque reference representing an HTTP message.
func CFHTTPMessageAddAuthentication(CFHTTPMessage, CFHTTPMessage?,
CFString, CFString, CFString?, Bool) -> Bool
Adds authentication information to a request.
Parameters
Discussion
See Also
HTTP Messages
CFNetwork / CFHTTPMessageIsHeaderComplete(_:)
Function
CFHTTPMessageIsHeaderComplete(_:)
Determines whether a message header is complete.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 61

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


## Page 62

func CFHTTPMessageCreateCopy(CFAllocator?, CFHTTPMessage) -> Unmanaged<
CFHTTPMessage>
Gets a copy of a CFHTTPMessage object.
func CFHTTPMessageCreateEmpty(CFAllocator?, Bool) -> Unmanaged<
CFHTTPMessage>
Creates and returns a new, empty CFHTTPMessage object.


## Page 63

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
See Also
HTTP Messages
CFNetwork / CFHTTPMessageIsRequest(_:)
Function
CFHTTPMessageIsRequest(_:)
Returns a Boolean indicating whether the HTTP message is a request or a
response.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 64

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


## Page 65

message
The message to modify.
bodyData
The data that is to be set as the body of the message.
class CFHTTPMessage
An opaque reference representing an HTTP message.
func CFHTTPMessageAddAuthentication(CFHTTPMessage, CFHTTPMessage?,
CFString, CFString, CFString?, Bool) -> Bool
Adds authentication information to a request.
Parameters
See Also
HTTP Messages
CFNetwork / CFHTTPMessageSetBody(_:_:)
Function
CFHTTPMessageSetBody(_:_:)
Sets the body of a CFHTTPMessage object.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 66

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


## Page 67

func CFHTTPMessageCreateCopy(CFAllocator?, CFHTTPMessage) -> Unmanaged<
CFHTTPMessage>
Gets a copy of a CFHTTPMessage object.
func CFHTTPMessageCreateEmpty(CFAllocator?, Bool) -> Unmanaged<
CFHTTPMessage>
Creates and returns a new, empty CFHTTPMessage object.


## Page 68

message
The message to modify.
headerField
The header field to set.
value
The value to set.
class CFHTTPMessage
Parameters
See Also
HTTP Messages
CFNetwork / CFHTTPMessageSetHeaderFieldValue(_:_:_:)
Function
CFHTTPMessageSetHeaderFieldValue(_:
_:_:)
Sets the value of a header field in an HTTP message.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 69

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


## Page 70

Serializes a CFHTTPMessage object.
func CFHTTPMessageCopyVersion(CFHTTPMessage) -> Unmanaged<CFString>
Gets the HTTP version from a CFHTTPMessage object.
func CFHTTPMessageCreateCopy(CFAllocator?, CFHTTPMessage) -> Unmanaged<
CFHTTPMessage>
Gets a copy of a CFHTTPMessage object.
func CFHTTPMessageCreateEmpty(CFAllocator?, Bool) -> Unmanaged<
CFHTTPMessage>
Creates and returns a new, empty CFHTTPMessage object.


## Page 71

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
See Also
HTTP Messages
CFNetwork / kCFHTTPVersion1_0
Global Variable
kCFHTTPVersion1_0
Specifies HTTP version 1.0.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 72

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


## Page 73

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
See Also
HTTP Messages
CFNetwork / kCFHTTPVersion1_1
Global Variable
kCFHTTPVersion1_1
Specifies HTTP version 1.1.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.1+
tvOS 9.0+
visionOS 1.0+


## Page 74

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


## Page 75

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
See Also
HTTP Messages
CFNetwork / kCFHTTPVersion2_0
Global Variable
kCFHTTPVersion2_0
HTTP version 2.0.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+


## Page 76

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


