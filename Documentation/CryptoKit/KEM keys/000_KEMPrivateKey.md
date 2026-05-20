# 000_KEMPrivateKey.pdf

## Page 1

associatedtype PublicKey : KEMPublicKey
Required
var publicKey: Self.PublicKey
The associated public key.
Required
func decapsulate(Data) throws -> SymmetricKey
Recovers a shared secret from an encapsulated representation.
Required
Topics
Associated Types
Instance Properties
Instance Methods
Type Methods
Apple CryptoKit / KEMPrivateKey
Protocol
KEMPrivateKey
The private key for a key encapsulation mechanism.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 2

static func generate() throws -> Self
Generates a new random private key.
Required
Sendable, SendableMetatype
HPKEKEMPrivateKey, HPKEKEMPrivateKeyGeneration
MLKEM1024.PrivateKey
MLKEM768.PrivateKey
SecureEnclave.MLKEM1024.PrivateKey
SecureEnclave.MLKEM768.PrivateKey
XWingMLKEM768X25519.PrivateKey
protocol KEMPublicKey
The public key for a key encapsulation mechanism.
Relationships
Inherits From
Inherited By
Conforming Types
See Also
KEM keys


