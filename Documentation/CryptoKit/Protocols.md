# Protocols.pdf

## Page 1

associatedtype PublicKey : Sendable
The public key share type to perform the DH Key Agreement
Required
var publicKey: Self.PublicKey
Required
func sharedSecretFromKeyAgreement(with: Self.PublicKey) throws -> Share
Secret
Performs a Diffie-Hellman Key Agreement.
Required
Topics
Associated Types
Instance Properties
Instance Methods
Apple CryptoKit / DiffieHellmanKeyAgreement
Protocol
DiffieHellmanKeyAgreement
A Diffie-Hellman Key Agreement Key
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 2

Sendable, SendableMetatype
HPKEDiffieHellmanPrivateKey, HPKEDiffieHellmanPrivateKeyGeneration
Curve25519.KeyAgreement.PrivateKey
P256.KeyAgreement.PrivateKey
P384.KeyAgreement.PrivateKey
P521.KeyAgreement.PrivateKey
SecureEnclave.P256.KeyAgreement.PrivateKey
Relationships
Inherits From
Inherited By
Conforming Types


## Page 3

DiffieHellmanKeyAgreement, Sendable, SendableMetatype
HPKEDiffieHellmanPrivateKeyGeneration
Curve25519.KeyAgreement.PrivateKey
P256.KeyAgreement.PrivateKey
P384.KeyAgreement.PrivateKey
P521.KeyAgreement.PrivateKey
SecureEnclave.P256.KeyAgreement.PrivateKey
Relationships
Inherits From
Inherited By
Conforming Types
Apple CryptoKit / HPKEDiffieHellmanPrivateKey
Protocol
HPKEDiffieHellmanPrivateKey
A type that represents the private key in a Diffie-Hellman key exchange.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 4

init()
Creates a private key generator.
Required
DiffieHellmanKeyAgreement
HPKEDiffieHellmanPrivateKey
Sendable
SendableMetatype
Topics
Initializers
Relationships
Inherits From
Conforming Types
Apple CryptoKit / HPKEDiffieHellmanPrivateKeyGeneration
Protocol
HPKEDiffieHellmanPrivateKeyGeneration
A type that represents the generation of private keys in a Diffie-Hellman key
exchange.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 5

Curve25519.KeyAgreement.PrivateKey
P256.KeyAgreement.PrivateKey
P384.KeyAgreement.PrivateKey
P521.KeyAgreement.PrivateKey


## Page 6

associatedtype EphemeralPrivateKey : HPKEDiffieHellmanPrivateKey
Generation
The type of the ephemeral private key.
Required
HPKEPublicKeySerialization, Sendable, SendableMetatype
Curve25519.KeyAgreement.PublicKey
P256.KeyAgreement.PublicKey
P384.KeyAgreement.PublicKey
Topics
Associated Types
Relationships
Inherits From
Conforming Types
Apple CryptoKit / HPKEDiffieHellmanPublicKey
Protocol
HPKEDiffieHellmanPublicKey
A type that represents the public key in a Diffie-Hellman key exchange.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 7

P521.KeyAgreement.PublicKey


## Page 8

KEMPrivateKey, Sendable, SendableMetatype
HPKEKEMPrivateKeyGeneration
XWingMLKEM768X25519.PrivateKey
Relationships
Inherits From
Inherited By
Conforming Types
Apple CryptoKit / HPKEKEMPrivateKey
Protocol
HPKEKEMPrivateKey
A type that represents the private key in HPKE.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 1.0+
watchOS 26.0+


## Page 9

init() throws
Creates a private key generator.
Required
HPKEKEMPrivateKey
KEMPrivateKey
Sendable
SendableMetatype
Topics
Initializers
Relationships
Inherits From
Conforming Types
Apple CryptoKit / HPKEKEMPrivateKeyGeneration
Protocol
HPKEKEMPrivateKeyGeneration
A type that represents the generation of private keys in HPKE
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 1.0+
watchOS 26.0+


## Page 10

XWingMLKEM768X25519.PrivateKey


## Page 11

associatedtype EphemeralPrivateKey : HPKEKEMPrivateKeyGeneration
The type of the ephemeral private key.
Required
HPKEPublicKeySerialization
KEMPublicKey
Sendable
SendableMetatype
Topics
Associated Types
Relationships
Inherits From
Conforming Types
Apple CryptoKit / HPKEKEMPublicKey
Protocol
HPKEKEMPublicKey
A type that represents the public key in HPKE
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 1.0+
watchOS 26.0+


## Page 12

XWingMLKEM768X25519.PublicKey


## Page 13

init<D>(D, kem: HPKE.KEM) throws
Creates a public key from an encoded representation.
Required
func hpkeRepresentation(kem: HPKE.KEM) throws -> Data
Creates an encoded representation of the public key.
Required
Sendable, SendableMetatype
Topics
Initializers
Instance Methods
Relationships
Inherits From
Apple CryptoKit / HPKEPublicKeySerialization
Protocol
HPKEPublicKeySerialization
A type that HPKE uses to encode the public key.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 14

HPKEDiffieHellmanPublicKey, HPKEKEMPublicKey
Curve25519.KeyAgreement.PublicKey
P256.KeyAgreement.PublicKey
P384.KeyAgreement.PublicKey
P521.KeyAgreement.PublicKey
XWingMLKEM768X25519.PublicKey
Inherited By
Conforming Types


