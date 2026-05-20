# 000_CBGroupIdentity.pdf

## Page 1

init?(posixGID: gid_t, authority: CBIdentityAuthority)
Returns the group identity with the given POSIX GID in the specified identity authority.
var posixGID: gid_t
Returns the POSIX GID of the identity.
var memberIdentities: [CBIdentity]
Topics
Finding Group Identities
Group Identity Attributes
Instance Properties
Relationships
Collaboration / CBGroupIdentity
Class
CBGroupIdentity
An object of the CBGroupIdentity class represents a group identity and is use
for viewing the attributes of group identities from an identity authority. The
principal attributes of a CBGroupIdentity object are a POSIX group identifier
(GID) and a list of members.
macOS 10.5+


## Page 2

CBIdentity
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
Inherits From
Conforms To


