# 003_CFHTTPAuthenticationCopyMethod____.pdf

## Page 1

auth
The CFHTTPAuthentication object to examine.
A string containing the authentication method that will be used auth is applied to a request. If
more than one authentication method is available, the strongest authentication method is returne
Ownership follows the The Create Rule.
class CFHTTPAuthentication
An opaque reference representing HTTP authentication information.
func CFHTTPAuthenticationAppliesToRequest(CFHTTPAuthentication,
CFHTTPMessage) -> Bool
Parameters
Return Value
See Also
HTTP Authentication
CFNetwork / CFHTTPAuthenticationCopyMethod(_:)
Function
CFHTTPAuthenticationCopyMethod(_:)
Gets the strongest authentication method that will be used when a
CFHTTPAuthentication object is applied to a request.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS 9.0+
visionOS 1.0+


## Page 2

Returns a Boolean value that indicates whether a CFHTTPAuthentication object is associated
with a CFHTTPMessage object.
func CFHTTPAuthenticationCopyDomains(CFHTTPAuthentication) -> Unmanaged
CFArray>
Returns an array of domain URLs to which a given CFHTTPAuthentication object can be
applied.
func CFHTTPAuthenticationCopyRealm(CFHTTPAuthentication) -> Unmanaged<
CFString>
Gets an authentication information’s namespace.
func CFHTTPAuthenticationCreateFromResponse(CFAllocator?, CFHTTPMessage
-> Unmanaged<CFHTTPAuthentication>
Uses an authentication failure response to create a CFHTTPAuthentication object.
func CFHTTPAuthenticationGetTypeID() -> CFTypeID
Gets the Core Foundation type identifier for the CFHTTPAuthentication opaque type.
func CFHTTPAuthenticationIsValid(CFHTTPAuthentication, UnsafeMutable
Pointer<CFStreamError>?) -> Bool
Returns a Boolean value that indicates whether a CFHTTPAuthentication object is valid.
func CFHTTPAuthenticationRequiresAccountDomain(CFHTTPAuthentication) ->
Bool
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


## Page 3

let kCFHTTPAuthenticationSchemeBasic: CFString
Request the HTTP basic authentication scheme.
let kCFHTTPAuthenticationSchemeDigest: CFString
Request the HTTP digest authentication scheme.
let kCFHTTPAuthenticationSchemeKerberos: CFString
Request the HTTP Kerberos authentication scheme.


