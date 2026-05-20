# Classes.pdf

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


## Page 3

You can obtain a CBIdentity object from one of the following class factory methods:
init(name:authority:), init(uuidString:authority:), init(persistent
Reference:), or identityWithCSIdentity:.
A CBIdentity object has methods to support for interoperability with the Core Services Identity
API. Send CSIdentity to your CBIdentity object to return an opaque object for use in the Co
Services Identity API. Similarly, call identityWithCSIdentity: to use an Core Services Ident
opaque object in the Collaboration framework.
There are two subclasses of CBIdentity: CBGroupIdentity and CBUserIdentity. If you a
working specifically with a group identity, use CBGroupIdentity. Similarly, if you are working
with a user identity, use CBUserIdentity.
Overview
Topics
Finding Identities
Collaboration / CBIdentity
Class
CBIdentity
A CBIdentity object is used for accessing the attributes of an identity stored in
an identity authority. You can use an identity object for finding identities, and
storing them in an access control list (ACL). If you need to edit these attributes,
take advantage of the CSIdentity class in Core Services.
macOS 10.5+


## Page 4

init?(name: String, authority: CBIdentityAuthority)
Returns the identity object with the given name from the specified identity authority.
init?(persistentReference: Data)
Returns the identity object matching the persistent reference data.
init?(uuidString: String, authority: CBIdentityAuthority)
Returns the identity object with the given UUID from the specified identity authority.
Deprecated
var aliases: [String]
Returns an array of aliases (alternate names) for the identity.
var authority: CBIdentityAuthority
Returns the identity authority where the identity is stored.
var emailAddress: String?
Returns the email address of an identity.
var fullName: String
Returns the full name of the identity.
var image: NSImage?
Returns the image associated with an identity.
var isHidden: Bool
Returns a Boolean value indicating the state of the identity’s hidden property.
func isMember(ofGroup: CBGroupIdentity) -> Bool
Returns a Boolean value indicating whether the identity is a member of the specified group.
var posixName: String
Returns the POSIX name of the identity.
var uuidString: String
Returns the UUID of the identity as a string.
Deprecated
Getting Identity Attributes
Storing Identities


## Page 5

var persistentReference: Data?
Returns a persistent reference to store a reference to an identity.
init?(uniqueIdentifier: UUID, authority: CBIdentityAuthority)
var uniqueIdentifier: UUID
NSObject
CBGroupIdentity, CBUserIdentity
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
Initializers
Instance Properties
Relationships
Inherits From
Inherited By
Conforms To


## Page 6

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


## Page 7

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


## Page 8

func runModal(for: NSWindow, modalDelegate: Any?, didEnd: Selector?,
contextInfo: UnsafeMutableRawPointer?)
Runs the receiver modally as a sheet attached to a specified window.
Deprecated
func runModal(for: NSWindow, completionHandler: ((NSApplication.Modal
Response) -> Void)?)
Runs the identity picker modally as a sheet attached to a specified window.
func runModal() -> Int
Runs the receiver as an application-modal dialog.
Topics
Running an Identity Picker
Collaboration / CBIdentityPicker
Class
CBIdentityPicker
A CBIdentityPicker object allows a user to select identities—for example, us
or group objects—that it wants one or more services or shared resources to have
access to. An identity picker can be displayed either as an application-modal
dialog or as a sheet attached to a document window. An identity picker returns th
selected records to be added to access control lists using Collaboration. If a
selected record is not a user or group identity, then an identity picker prompts the
user for additional information—such as a password—to promote that record to a
sharing account.
macOS 10.5+


## Page 9

var identities: [CBIdentity]
The array of identities (represented by CBIdentity objects) selected using the identity
picker.
var title: String?
The title of the identity picker.
var allowsMultipleSelection: Bool
A Boolean value indicating whether the user is allowed to select multiple identities.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Retrieving Identities
Setting and Getting Properties
Relationships
Inherits From
Conforms To


## Page 10

func authenticate(withPassword: String) -> Bool
Returns a Boolean value indicating whether the given password is correct for the identity.
var certificate: SecCertificate?
Returns the public authentication certificate associated with a user identity.
var isEnabled: Bool
Returns a Boolean value indicating whether the identity is allowed to authenticate.
var posixUID: uid_t
Returns the POSIX UID of the identity.
init?(posixUID: uid_t, authority: CBIdentityAuthority)
Topics
Password Authentication
Using UIDs
Collaboration / CBUserIdentity
Class
CBUserIdentity
An object of the CBUserIdentity class represents a user identity and is used
for accessing the attributes of a user identity from an identity authority. The
principal attributes of CBUserIdentity are a POSIX user identifier (UID),
password, and certificate.
macOS 10.5+


## Page 11

Returns the user identity with the given POSIX UID in the specified identity authority.
CBIdentity
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
Relationships
Inherits From
Conforms To


