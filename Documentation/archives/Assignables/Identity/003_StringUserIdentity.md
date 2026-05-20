# 003_StringUserIdentity.pdf

## Page 1

init(value: String)
Initializes a StringUserIdentity with the given string value.
var stringRepresentation: String
String representation of this user identity for display or debugging purposes.
var typeID: String
A unique type identifier for this user identity.
static var typeID: String
A unique type identifier for this user identity.
var value: String
The value of the string to contain in this user identity.
Topics
Creating a user identity
Inspecting an identity
Assignables / StringUserIdentity
Structure
StringUserIdentity
A user identity defined by a string.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 2

Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
UserIdentity
protocol UserIdentity
Types conforming to this protocol can act as user identities for editors of a document.
struct AnonymousUserIdentity
A user identity for unknown editors.
struct AnyUserIdentity
A user identity that performs type erasure by wrapping another user identity.
class UserIdentityTypeRegistry
A registry for user identity types. Assignable documents and document elements store user
identity data as Data objects. In order for that data to be deserialized, the type to deserialize
it as needs to be known to UserIdentityTypeRegistry. Without registration of the user
identity, custom types won’t be deserializable.
enum UserIdentityFactory
A type that contains helpers for creating user identity objects.
Relationships
Conforms To
See Also
Identity


