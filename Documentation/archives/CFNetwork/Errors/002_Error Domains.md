# 002_Error Domains.pdf

## Page 1

To determine the source of an error, examine the userInfo dictionary included in the CFError
object returned by a function call or call CFErrorGetDomain(_:) and pass in the CFError
object and the domain whose value you want to read.
let kCFErrorDomainCFNetwork: CFString
let kCFErrorDomainWinSock: CFString
enum CFNetworkErrors
This enumeration contains error codes returned under the error domain kCFErrorDomain
CFNetwork.
Error Dictionary Keys
Overview
Topics
Constants
See Also
Errors
CFNetwork / Error Domains
API Collection
Error Domains
High-level error domains.


## Page 2

Networking-related keys that may be available in a CFErrorRef object’s userInfo
dictionary.


