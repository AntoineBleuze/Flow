# 007_HPKEPublicKeySerialization.pdf

## Page 1

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


## Page 2

HPKEDiffieHellmanPublicKey, HPKEKEMPublicKey
Curve25519.KeyAgreement.PublicKey
P256.KeyAgreement.PublicKey
P384.KeyAgreement.PublicKey
P521.KeyAgreement.PublicKey
XWingMLKEM768X25519.PublicKey
Inherited By
Conforming Types


