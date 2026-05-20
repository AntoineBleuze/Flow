# 015_CFHTTPMessageCreateRequest__________.pdf

## Page 1

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


## Page 2

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


## Page 3

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


