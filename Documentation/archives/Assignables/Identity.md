# Identity.pdf

## Page 1

var stringRepresentation: String
String representation of this user identity for display or debugging purposes.
Required
var typeID: String
A unique type identifier for this user identity.
Required
func scope<R>(() throws -> R) rethrows -> R
Sets the user identity for document-related operations that occur within the closure passed 
func scope<R>(() async throws -> R) async rethrows -> R
Sets the user identity for document-related operations that occur within the async closure
passed in.
Topics
Inspecting an identity
Setting the scope
Getting a type eraser
Assignables / UserIdentity
Protocol
UserIdentity
Types conforming to this protocol can act as user identities for editors of a
document.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 2

func eraseToAnyUserIdentity() -> AnyUserIdentity
Wraps this user identity with a type eraser.
Required Default implementation provided.
typealias As
An alias for UserIdentityFactory for convenience.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
AnonymousUserIdentity, AnyUserIdentity, StringUserIdentity
struct AnonymousUserIdentity
A user identity for unknown editors.
struct AnyUserIdentity
A user identity that performs type erasure by wrapping another user identity.
struct StringUserIdentity
A user identity defined by a string.
class UserIdentityTypeRegistry
Relationships
Inherits From
Conforming Types
See Also
Identity


## Page 3

A registry for user identity types. Assignable documents and document elements store user
identity data as Data objects. In order for that data to be deserialized, the type to deserialize
it as needs to be known to UserIdentityTypeRegistry. Without registration of the user
identity, custom types won’t be deserializable.
enum UserIdentityFactory
A type that contains helpers for creating user identity objects.


## Page 4

init()
Initializes an instance of AnonymousUserIdentity.
var stringRepresentation: String
String representation of this user identity for display or debugging purposes.
var typeID: String
A unique type identifier for this user identity.
static var typeID: String
A unique type identifier for this user identity.
Topics
Creating an anonymous identity
Inspecting an identity
Relationships
Assignables / AnonymousUserIdentity
Structure
AnonymousUserIdentity
A user identity for unknown editors.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 5

Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
UserIdentity
protocol UserIdentity
Types conforming to this protocol can act as user identities for editors of a document.
struct AnyUserIdentity
A user identity that performs type erasure by wrapping another user identity.
struct StringUserIdentity
A user identity defined by a string.
class UserIdentityTypeRegistry
A registry for user identity types. Assignable documents and document elements store user
identity data as Data objects. In order for that data to be deserialized, the type to deserialize
it as needs to be known to UserIdentityTypeRegistry. Without registration of the user
identity, custom types won’t be deserializable.
enum UserIdentityFactory
A type that contains helpers for creating user identity objects.
Conforms To
See Also
Identity


## Page 6

init<T>(T)
Initializes this type eraser with a user identity to wrap.
init(from: any Decoder) throws
Creates a new instance by decoding from the given decoder.
func scope<R>(() throws -> R) rethrows -> R
Sets the user identity for document-related operations that occur within the closure passed 
func scope<R>(() async throws -> R) async rethrows -> R
Sets the user identity for document-related operations that occur within the async closure
passed in.
var stringRepresentation: String
String representation of this user identity for display or debugging purposes.
Topics
Creating a user identity
Setting the scope
Inspecting an identity
Assignables / AnyUserIdentity
Structure
AnyUserIdentity
A user identity that performs type erasure by wrapping another user identity.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 7

var typeID: String
A unique type identifier for this user identity.
enum Error
Error type for this user identity.
func encode(to: any Encoder) throws
Encodes this value into the given encoder.
func hash(into: inout Hasher)
Hashes the essential components of this value by feeding them into the given hasher.
static func == (AnyUserIdentity, AnyUserIdentity) -> Bool
Returns a Boolean value indicating whether two values are equal.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
UserIdentity
protocol UserIdentity
Instance Methods
Comparing identities
Relationships
Conforms To
See Also
Identity


## Page 8

Types conforming to this protocol can act as user identities for editors of a document.
struct AnonymousUserIdentity
A user identity for unknown editors.
struct StringUserIdentity
A user identity defined by a string.
class UserIdentityTypeRegistry
A registry for user identity types. Assignable documents and document elements store user
identity data as Data objects. In order for that data to be deserialized, the type to deserialize
it as needs to be known to UserIdentityTypeRegistry. Without registration of the user
identity, custom types won’t be deserializable.
enum UserIdentityFactory
A type that contains helpers for creating user identity objects.


## Page 9

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


## Page 10

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


## Page 11

static func registerUserIdentityType<UI>(typeID: String, type: UI.Type)
Registers a user identity type for use when deserializing the user identity from Data.
protocol UserIdentity
Types conforming to this protocol can act as user identities for editors of a document.
struct AnonymousUserIdentity
A user identity for unknown editors.
Topics
Registering an identity
See Also
Identity
Assignables / UserIdentityTypeRegistry
Class
UserIdentityTypeRegistry
A registry for user identity types. Assignable documents and document elements
store user identity data as Data objects. In order for that data to be deserialized,
the type to deserialize it as needs to be known to UserIdentityType
Registry. Without registration of the user identity, custom types won’t be
deserializable.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 12

struct AnyUserIdentity
A user identity that performs type erasure by wrapping another user identity.
struct StringUserIdentity
A user identity defined by a string.
enum UserIdentityFactory
A type that contains helpers for creating user identity objects.


## Page 13

static var anonymous: AnonymousUserIdentity
The anonymous user identity.
static func string(String) -> StringUserIdentity
Creates a StringUserIdentity with the given string value.
protocol UserIdentity
Types conforming to this protocol can act as user identities for editors of a document.
struct AnonymousUserIdentity
Topics
Getting the anonymous identity
Creating an identity
See Also
Identity
Assignables / UserIdentityFactory
Enumeration
UserIdentityFactory
A type that contains helpers for creating user identity objects.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 17.4+
visionOS


## Page 14

A user identity for unknown editors.
struct AnyUserIdentity
A user identity that performs type erasure by wrapping another user identity.
struct StringUserIdentity
A user identity defined by a string.
class UserIdentityTypeRegistry
A registry for user identity types. Assignable documents and document elements store user
identity data as Data objects. In order for that data to be deserialized, the type to deserialize
it as needs to be known to UserIdentityTypeRegistry. Without registration of the user
identity, custom types won’t be deserializable.


