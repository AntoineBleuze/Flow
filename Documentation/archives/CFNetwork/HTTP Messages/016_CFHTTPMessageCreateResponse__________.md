# 016_CFHTTPMessageCreateResponse__________.pdf

## Page 1

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


## Page 2

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


## Page 3

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


