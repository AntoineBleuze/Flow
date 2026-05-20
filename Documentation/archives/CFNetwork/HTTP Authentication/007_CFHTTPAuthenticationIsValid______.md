# 007_CFHTTPAuthenticationIsValid______.pdf

## Page 1

auth
The CFHTTPAuthentication object to examine.
error
Pointer to a CFStreamError structure, whose fields, if an error has occurred, are set to the
error and the error’s domain.
TRUE if auth contains enough information to be applied to a request.
If this function returns FALSE, the CFHTTPAuthentication object may still contain useful
information, such as the name of an unsupported authentication method.
Parameters
Return Value
Discussion
CFNetwork / CFHTTPAuthenticationIsValid(_:_:)
Function
CFHTTPAuthenticationIsValid(_:_:)
Returns a Boolean value that indicates whether a CFHTTPAuthentication object is
valid.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS 9.0+
visionOS 1.0+


## Page 2

If this function returns TRUE for auth, the object is good for use with functions such as
CFHTTPMessageApplyCredentials(_:_:_:_:_:) and CFHTTPMessageApply
CredentialDictionary(_:_:_:_:). If this function returns FALSE, auth is invalid, and
authentications using it will not succeed.
class CFHTTPAuthentication
An opaque reference representing HTTP authentication information.
func CFHTTPAuthenticationAppliesToRequest(CFHTTPAuthentication,
CFHTTPMessage) -> Bool
Returns a Boolean value that indicates whether a CFHTTPAuthentication object is associated
with a CFHTTPMessage object.
func CFHTTPAuthenticationCopyDomains(CFHTTPAuthentication) -> Unmanaged
CFArray>
Returns an array of domain URLs to which a given CFHTTPAuthentication object can be
applied.
func CFHTTPAuthenticationCopyMethod(CFHTTPAuthentication) -> Unmanaged<
CFString>
Gets the strongest authentication method that will be used when a CFHTTPAuthentication
object is applied to a request.
func CFHTTPAuthenticationCopyRealm(CFHTTPAuthentication) -> Unmanaged<
CFString>
Gets an authentication information’s namespace.
func CFHTTPAuthenticationCreateFromResponse(CFAllocator?, CFHTTPMessage
-> Unmanaged<CFHTTPAuthentication>
Uses an authentication failure response to create a CFHTTPAuthentication object.
func CFHTTPAuthenticationGetTypeID() -> CFTypeID
Gets the Core Foundation type identifier for the CFHTTPAuthentication opaque type.
func CFHTTPAuthenticationRequiresAccountDomain(CFHTTPAuthentication) ->
Bool
Discussion
See Also
HTTP Authentication


## Page 3

Returns a Boolean value that indicates whether a CFHTTPAuthentication object uses an
authentication method that requires an account domain.
func CFHTTPAuthenticationRequiresOrderedRequests(CFHTTPAuthentication) 
> Bool
Returns a Boolean value that indicates whether authentication requests should be made one
at a time.
func CFHTTPAuthenticationRequiresUserNameAndPassword(
CFHTTPAuthentication) -> Bool
Returns a Boolean value that indicates whether a CFHTTPAuthentication object uses an
authentication method that requires a username and a password.
let kCFHTTPAuthenticationAccountDomain: CFString
Account domain to use for authentication.
let kCFHTTPAuthenticationPassword: CFString
Password to use for authentication.
let kCFHTTPAuthenticationSchemeBasic: CFString
Request the HTTP basic authentication scheme.
let kCFHTTPAuthenticationSchemeDigest: CFString
Request the HTTP digest authentication scheme.
let kCFHTTPAuthenticationSchemeKerberos: CFString
Request the HTTP Kerberos authentication scheme.


