# 001_Error Dictionary Keys.pdf

## Page 1

Many network functions return CFErrorRef objects. When the error object’s domain is k
CFErrorDomainCFNetwork, you can query the object for additional information.
For example:
let kCFURLErrorFailingURLErrorKey: CFString
The URL that caused the load to fail as a CFURLRef object.
Overview
Topics
Constants
CFNetwork / Error Dictionary Keys
API Collection
Error Dictionary Keys
Networking-related keys that may be available in a CFErrorRef object’s user
Info dictionary.


## Page 2

let kCFURLErrorFailingURLStringErrorKey: CFString
The URL that caused the load to fail as a CFStringRef object.
let kCFGetAddrInfoFailureKey: CFString
let kCFSOCKSStatusCodeKey: CFString
let kCFSOCKSVersionKey: CFString
let kCFSOCKSNegotiationMethodKey: CFString
let kCFDNSServiceFailureKey: CFString
let kCFFTPStatusCodeKey: CFString
enum CFNetworkErrors
This enumeration contains error codes returned under the error domain kCFErrorDomain
CFNetwork.
Error Domains
High-level error domains.
See Also
Errors


