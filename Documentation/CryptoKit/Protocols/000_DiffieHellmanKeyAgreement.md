# 000_DiffieHellmanKeyAgreement.pdf

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


