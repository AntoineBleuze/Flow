# 001_SymmetricKey.pdf

## Page 1

You typically derive a symmetric key from an instance of a shared secret (SharedSecret) that
you obtain through key agreement. You use a symmetric key to compute a message authenticatio
code like HMAC, or to open and close a sealed box (ChaChaPoly.SealedBox or AES.GCM
.SealedBox) using a cipher like ChaChaPoly or AES.
init<D>(data: D)
Creates a key from the given data.
init(size: SymmetricKeySize)
Generates a new random key of the given size.
var bitCount: Int
Overview
Topics
Creating a key
Getting the key length
Apple CryptoKit / SymmetricKey
Structure
SymmetricKey
A symmetric cryptographic key.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

The number of bits in the key.
ContiguousBytes
Copyable
Equatable
Sendable
SendableMetatype
struct HMAC
A hash-based message authentication algorithm.
struct SymmetricKeySize
The sizes that a symmetric cryptographic key can take.
Relationships
Conforms To
See Also
Message authentication codes


