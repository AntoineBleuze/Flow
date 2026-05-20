# 002_CBIdentityAuthority.pdf

## Page 1

var localizedName: String
Returns the localized name of the identity authority.
class func local() -> CBIdentityAuthority
Returns the identity authority on the local system.
class func managed() -> CBIdentityAuthority
Returns the identity authority that contains all the identities in bound network directory
servers.
class func `default`() -> CBIdentityAuthority
Returns an identity authority that contains the identities in both the local and the network-
bound authorities.
Topics
Accessing Identity Authorities
Collaboration / CBIdentityAuthority
Class
CBIdentityAuthority
An identity authority is a database that stores information about identities. The
CBIdentityAuthority class defines one or more identity authorities. You can
search this database for identities in conjunction with the CBIdentity class
factory methods.
macOS 10.5+


## Page 2

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Relationships
Inherits From
Conforms To


