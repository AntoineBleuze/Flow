# 009_CFHTTPAuthenticationRequiresOrderedRequests____.pdf

## Page 1

auth
The CFHTTPAuthentication object to examine.
TRUE if auth requires ordered requests, otherwise FALSE.
Some authentication methods require that future requests must be performed in an ordered
manner. If this function returns TRUE, clients can improve their chances of authenticating
successfully by issuing requests one at a time as responses come back from the server.
Parameters
Return Value
Discussion
See Also
HTTP Authentication
CFNetwork / CFHTTPAuthenticationRequiresOrderedRequests(_:)
Function
CFHTTPAuthenticationRequiresOrdered
Requests(_:)
Returns a Boolean value that indicates whether authentication requests should b
made one at a time.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.1+
macOS 10.2+
tvOS 9.0+
visionOS 1.0+


## Page 2

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
func CFHTTPAuthenticationIsValid(CFHTTPAuthentication, UnsafeMutable
Pointer<CFStreamError>?) -> Bool
Returns a Boolean value that indicates whether a CFHTTPAuthentication object is valid.
func CFHTTPAuthenticationRequiresAccountDomain(CFHTTPAuthentication) ->
Bool
Returns a Boolean value that indicates whether a CFHTTPAuthentication object uses an
authentication method that requires an account domain.
func CFHTTPAuthenticationRequiresUserNameAndPassword(
CFHTTPAuthentication) -> Bool
Returns a Boolean value that indicates whether a CFHTTPAuthentication object uses an
authentication method that requires a username and a password.


## Page 3

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


